package com.android.camera.module.encoder;

import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaCodecInfo.CodecCapabilities;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import android.opengl.EGLContext;
import android.view.Surface;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.log.Log;
import com.android.camera.module.encoder.MediaEncoder.MediaEncoderListener;
import java.io.IOException;
import java.util.Locale;

public class MediaVideoEncoder extends MediaEncoder {
    private static final float BPP = 0.25f;
    private static final int FRAME_RATE = 25;
    private static final String MIME_TYPE = "video/avc";
    private static final String TAG = MediaVideoEncoder.class.getSimpleName();
    protected static int[] sRecognizedFormats = {2130708361};
    private int mExtraFrames;
    private RenderHandler mRenderHandler;
    private long mRequestStopTime;
    private EGLContext mSharedEGLContext;
    private Surface mSurface;
    private final int mVideoHeight;
    private final int mVideoWidth;

    public MediaVideoEncoder(EGLContext eGLContext, MediaMuxerWrapper mediaMuxerWrapper, MediaEncoderListener mediaEncoderListener, int i, int i2) {
        super(mediaMuxerWrapper, mediaEncoderListener);
        Log.d(TAG, String.format(Locale.ENGLISH, "init: videoSize=%dx%d", new Object[]{Integer.valueOf(i), Integer.valueOf(i2)}));
        this.mVideoWidth = i;
        this.mVideoHeight = i2;
        if (i > i2) {
            int i3 = i2;
            i2 = i;
            i = i3;
        }
        this.mRenderHandler = RenderHandler.createHandler(TAG, i, i2);
        this.mSharedEGLContext = eGLContext;
    }

    private int calcBitRate() {
        int i = (int) (6.25f * ((float) this.mVideoWidth) * ((float) this.mVideoHeight));
        Log.d(TAG, String.format(Locale.ENGLISH, "bitrate=%d", new Object[]{Integer.valueOf(i)}));
        return i;
    }

    private static boolean isRecognizedVideoFormat(int i) {
        int length = sRecognizedFormats != null ? sRecognizedFormats.length : 0;
        for (int i2 = 0; i2 < length; i2++) {
            if (sRecognizedFormats[i2] == i) {
                return true;
            }
        }
        return false;
    }

    /* JADX INFO: finally extract failed */
    protected static final int selectColorFormat(MediaCodecInfo mediaCodecInfo, String str) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("selectColorFormat>>>codec:");
        sb.append(mediaCodecInfo.getName());
        sb.append("/");
        sb.append(str);
        Log.v(str2, sb.toString());
        try {
            Thread.currentThread().setPriority(10);
            CodecCapabilities capabilitiesForType = mediaCodecInfo.getCapabilitiesForType(str);
            Thread.currentThread().setPriority(5);
            int i = 0;
            int i2 = 0;
            while (true) {
                if (i2 >= capabilitiesForType.colorFormats.length) {
                    break;
                }
                int i3 = capabilitiesForType.colorFormats[i2];
                if (isRecognizedVideoFormat(i3)) {
                    i = i3;
                    break;
                }
                i2++;
            }
            String str3 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("selectColorFormat<<<colorFormat=");
            sb2.append(Integer.toHexString(i));
            Log.v(str3, sb2.toString());
            return i;
        } catch (Throwable th) {
            Thread.currentThread().setPriority(5);
            throw th;
        }
    }

    protected static final MediaCodecInfo selectVideoCodec(String str) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("selectVideoCodec>>>");
        sb.append(str);
        Log.v(str2, sb.toString());
        int codecCount = MediaCodecList.getCodecCount();
        for (int i = 0; i < codecCount; i++) {
            MediaCodecInfo codecInfoAt = MediaCodecList.getCodecInfoAt(i);
            if (codecInfoAt.isEncoder()) {
                String[] supportedTypes = codecInfoAt.getSupportedTypes();
                for (String equalsIgnoreCase : supportedTypes) {
                    if (equalsIgnoreCase.equalsIgnoreCase(str) && selectColorFormat(codecInfoAt, str) > 0) {
                        return codecInfoAt;
                    }
                }
                continue;
            }
        }
        Log.v(TAG, "selectVideoCodec<<<");
        return null;
    }

    public boolean frameAvailableSoon(DrawExtTexAttribute drawExtTexAttribute) {
        boolean frameAvailableSoon = super.frameAvailableSoon();
        if (frameAvailableSoon && !this.mSkipFrame) {
            this.mRenderHandler.draw(drawExtTexAttribute);
            if (this.mRequestStopTime > 0) {
                this.mExtraFrames--;
                if (this.mExtraFrames <= 0) {
                    super.stopRecording();
                }
            }
        }
        return frameAvailableSoon;
    }

    /* access modifiers changed from: protected */
    public void prepare() throws IOException {
        Log.v(TAG, "prepare>>>");
        this.mTrackIndex = -1;
        this.mMuxerStarted = false;
        this.mIsEOS = false;
        MediaCodecInfo selectVideoCodec = selectVideoCodec(MIME_TYPE);
        if (selectVideoCodec == null) {
            Log.e(TAG, "no appropriate codec for video/avc");
            return;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("selected codec: ");
        sb.append(selectVideoCodec.getName());
        Log.d(str, sb.toString());
        MediaFormat createVideoFormat = MediaFormat.createVideoFormat(MIME_TYPE, this.mVideoWidth, this.mVideoHeight);
        createVideoFormat.setInteger("color-format", 2130708361);
        createVideoFormat.setInteger("bitrate", calcBitRate());
        createVideoFormat.setInteger("frame-rate", 25);
        createVideoFormat.setFloat("i-frame-interval", 1.0f);
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("format: ");
        sb2.append(createVideoFormat);
        Log.d(str2, sb2.toString());
        this.mMediaCodec = MediaCodec.createEncoderByType(MIME_TYPE);
        this.mMediaCodec.configure(createVideoFormat, null, null, 1);
        this.mSurface = this.mMediaCodec.createInputSurface();
        this.mRenderHandler.setEglContext(this.mSharedEGLContext, this.mSurface, true);
        this.mMediaCodec.start();
        if (this.mListener != null) {
            this.mListener.onPrepared(this);
        }
        Log.v(TAG, "prepare<<<");
    }

    /* access modifiers changed from: protected */
    public void release() {
        Log.d(TAG, "release");
        if (this.mSurface != null) {
            this.mSurface.release();
            this.mSurface = null;
        }
        if (this.mRenderHandler != null) {
            this.mRenderHandler.release();
            this.mSharedEGLContext = null;
            this.mRenderHandler = null;
        }
        super.release();
    }

    /* access modifiers changed from: protected */
    public void signalEndOfInputStream() {
        Log.d(TAG, "signalEndOfInputStream");
        this.mMediaCodec.signalEndOfInputStream();
        this.mIsEOS = true;
    }

    /* access modifiers changed from: protected */
    public boolean startRecording(long j) {
        boolean startRecording = super.startRecording(j);
        this.mRequestStopTime = -1;
        this.mExtraFrames = 0;
        return startRecording;
    }

    /* access modifiers changed from: protected */
    public void stopRecording() {
        super.stopRecording();
    }
}
