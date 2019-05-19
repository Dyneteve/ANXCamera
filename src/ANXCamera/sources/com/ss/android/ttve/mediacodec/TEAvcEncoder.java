package com.ss.android.ttve.mediacodec;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import android.media.MediaCodecInfo.CodecProfileLevel;
import android.media.MediaFormat;
import android.opengl.GLES20;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.annotation.Keep;
import android.util.Log;
import android.view.Surface;
import com.android.camera.Util;
import com.android.camera.module.loader.FunctionParseBeautyBodySlimCount;
import com.ss.android.ttve.common.TEEglStateSaver;
import com.ss.android.ttve.common.TELogUtil;
import com.ss.android.ttve.common.TESharedContext;
import com.ss.android.ttve.common.TETextureDrawer;
import java.io.FileOutputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Locale;
import java.util.concurrent.ArrayBlockingQueue;

@Keep
public class TEAvcEncoder {
    private static boolean DEBUG = false;
    private static final int MASK_BIT_RATE = 1;
    private static final int MASK_FORCE_RESTART = 4;
    private static final int MASK_FRAME_RATE = 2;
    private static int MAX_FRAME_RATE = 2000;
    private static int MIN_FRAME_RATE = 7;
    private static final String TAG = TEAvcEncoder.class.getSimpleName();
    private static final int TIMEOUT_USEC = 0;
    private static final int TIMEOUT_USEC_EOS = 10000;
    private static final String VIDEO_MIME_TYPE = "video/avc";
    private static int avcqueuesize = 25;
    private static TEAvcEncoder c_curObj = null;
    public ArrayBlockingQueue<CodecData> AVCQueue = new ArrayBlockingQueue<>(avcqueuesize);
    public byte[] configbyte = null;
    private int mBufferIndex = -1;
    private boolean mEndOfStream = false;
    private boolean mFirstFrame = true;
    private CodecData mLastCodecData = null;
    private boolean m_bNeedSingalEnd = false;
    private boolean m_bSignalEndOfStream = false;
    private boolean m_bSuccessInit = false;
    private int m_bitRate = 0;
    private MediaFormat m_codecFormat = null;
    private int m_colorFormat = 0;
    private int m_configStatus = 0;
    private TEEglStateSaver m_eglStateSaver;
    private long m_encodeStartTime = -1;
    private int m_frameRate = 0;
    private long m_getnerateIndex = 0;
    private int m_height = 0;
    private int m_iFrameInternal = 0;
    private boolean m_isNeedReconfigure = false;
    private MediaCodec m_mediaCodec = null;
    private int m_profile = 0;
    private TESharedContext m_sharedContext;
    private Surface m_surface = null;
    private TETextureDrawer m_textureDrawer;
    private boolean m_useInputSurface = true;
    private int m_width = 0;
    private byte[] pps;
    private byte[] sps;

    public static class CodecData {
        public byte[] data = null;
        public int flag;
        public long pts = 0;
    }

    private void addOutputData(byte[] bArr, long j, int i) {
        CodecData codecData = new CodecData();
        codecData.data = bArr;
        codecData.pts = j;
        codecData.flag = i;
        try {
            this.AVCQueue.add(codecData);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private long computePresentationTime(long j) {
        return this.m_encodeStartTime + ((j * 1000000000) / ((long) this.m_frameRate));
    }

    private int configEncode() {
        try {
            if (reconfigureMediaFormat() != 0) {
                return -1;
            }
            if (this.m_surface != null) {
                this.m_surface.release();
                this.m_surface = null;
            }
            if (this.m_mediaCodec != null) {
                this.m_mediaCodec.release();
            }
            this.m_mediaCodec = MediaCodec.createEncoderByType(VIDEO_MIME_TYPE);
            CodecProfileLevel[] codecProfileLevelArr = this.m_mediaCodec.getCodecInfo().getCapabilitiesForType(VIDEO_MIME_TYPE).profileLevels;
            int length = codecProfileLevelArr.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    break;
                }
                CodecProfileLevel codecProfileLevel = codecProfileLevelArr[i];
                if (codecProfileLevel.profile == 1) {
                    this.m_codecFormat.setInteger("profile", codecProfileLevel.profile);
                    if (VERSION.SDK_INT >= 23) {
                        MediaFormat mediaFormat = this.m_codecFormat;
                        String str = "level";
                        int i2 = 8192;
                        if (codecProfileLevel.level <= 8192) {
                            i2 = codecProfileLevel.level;
                        }
                        mediaFormat.setInteger(str, i2);
                    }
                } else {
                    i++;
                }
            }
            this.m_mediaCodec.configure(this.m_codecFormat, null, null, 1);
            if (VERSION.SDK_INT >= 18 && this.m_useInputSurface) {
                TELogUtil.d(TAG, "m_mediaCodec.createInputSurface()");
                this.m_surface = this.m_mediaCodec.createInputSurface();
            }
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
            return -2;
        }
    }

    public static TEAvcEncoder createEncoderObject() {
        c_curObj = new TEAvcEncoder();
        return c_curObj;
    }

    @SuppressLint({"WrongConstant"})
    @TargetApi(16)
    private void drainOutputBuffer(long j) {
        byte[] bArr;
        BufferInfo bufferInfo = new BufferInfo();
        this.mBufferIndex = -1;
        try {
            this.mBufferIndex = this.m_mediaCodec.dequeueOutputBuffer(bufferInfo, j);
        } catch (Exception e) {
            e.printStackTrace();
        }
        while (true) {
            if (this.mBufferIndex < 0) {
                break;
            }
            ByteBuffer outputBufferByIdx = getOutputBufferByIdx(this.mBufferIndex);
            byte[] bArr2 = new byte[bufferInfo.size];
            outputBufferByIdx.position(bufferInfo.offset);
            outputBufferByIdx.limit(bufferInfo.offset + bufferInfo.size);
            outputBufferByIdx.get(bArr2);
            if (bufferInfo.flags == 2) {
                this.configbyte = bArr2;
            } else if (bufferInfo.flags == 1) {
                if (this.configbyte == null) {
                    Log.e(TAG, "I can't find configbyte!!!! NEED extract from I frame!!!");
                } else if (bArr2[4] == this.configbyte[4] && (bArr2[this.configbyte.length + 4] & 31) == 5) {
                    bArr = new byte[(bArr2.length - this.configbyte.length)];
                    System.arraycopy(bArr2, this.configbyte.length, bArr, 0, bArr.length);
                    addOutputData(bArr, bufferInfo.presentationTimeUs, bufferInfo.flags);
                }
                bArr = bArr2;
                addOutputData(bArr, bufferInfo.presentationTimeUs, bufferInfo.flags);
            } else if (bufferInfo.flags == 4) {
                this.mEndOfStream = true;
                break;
            } else {
                addOutputData(bArr2, bufferInfo.presentationTimeUs, bufferInfo.flags);
            }
            this.m_mediaCodec.releaseOutputBuffer(this.mBufferIndex, false);
            this.mBufferIndex = this.m_mediaCodec.dequeueOutputBuffer(bufferInfo, j);
        }
        if (this.mBufferIndex == -2) {
            MediaFormat outputFormat = this.m_mediaCodec.getOutputFormat();
            ByteBuffer byteBuffer = outputFormat.getByteBuffer("csd-0");
            ByteBuffer byteBuffer2 = outputFormat.getByteBuffer("csd-1");
            if (byteBuffer != null && byteBuffer2 != null) {
                this.sps = (byte[]) byteBuffer.array().clone();
                this.pps = (byte[]) byteBuffer2.array().clone();
                this.configbyte = new byte[(this.sps.length + this.pps.length)];
                System.arraycopy(this.sps, 0, this.configbyte, 0, this.sps.length);
                System.arraycopy(this.pps, 0, this.configbyte, this.sps.length, this.pps.length);
            }
        }
    }

    @TargetApi(16)
    private ByteBuffer getOutputBufferByIdx(int i) {
        return VERSION.SDK_INT >= 21 ? this.m_mediaCodec.getOutputBuffer(i) : this.m_mediaCodec.getOutputBuffers()[i];
    }

    @TargetApi(16)
    private int reconfigureMediaFormat() {
        if (VERSION.SDK_INT < 16) {
            return -1;
        }
        this.m_codecFormat = MediaFormat.createVideoFormat(VIDEO_MIME_TYPE, this.m_width, this.m_height);
        this.m_codecFormat.setInteger("color-format", this.m_colorFormat);
        this.m_codecFormat.setInteger("bitrate", this.m_bitRate);
        this.m_codecFormat.setInteger("frame-rate", this.m_frameRate);
        this.m_codecFormat.setInteger("i-frame-interval", this.m_iFrameInternal);
        Log.i(TAG, String.format("width:[%d] height:[%d] frameRate:[%d] iFrameInternal:[%d] bitRate:[%d] colorFormat:[%d]", new Object[]{Integer.valueOf(this.m_width), Integer.valueOf(this.m_height), Integer.valueOf(this.m_frameRate), Integer.valueOf(this.m_iFrameInternal), Integer.valueOf(this.m_bitRate), Integer.valueOf(this.m_colorFormat)}));
        return 0;
    }

    @TargetApi(18)
    public int encodeVideoFromTexture(int i) {
        int i2 = 0;
        if (!this.m_bSuccessInit) {
            return 0;
        }
        if (this.m_eglStateSaver == null) {
            this.m_eglStateSaver = new TEEglStateSaver();
            this.m_eglStateSaver.saveEGLState();
        }
        if (this.m_isNeedReconfigure || (this.m_configStatus & 4) != 0) {
            if (this.m_mediaCodec == null || this.m_configStatus != 1 || VERSION.SDK_INT < 19) {
                restartEncoder();
            } else {
                Bundle bundle = new Bundle();
                bundle.putInt("video-bitrate", this.m_bitRate);
                this.m_mediaCodec.setParameters(bundle);
                this.m_configStatus = 0;
            }
            this.m_isNeedReconfigure = false;
        }
        if (this.m_encodeStartTime == -1) {
            this.m_encodeStartTime = System.nanoTime();
        }
        drainOutputBuffer(0);
        int i3 = i & -1;
        int i4 = 30;
        if (i3 != 0) {
            try {
                if (this.m_textureDrawer != null) {
                    this.m_sharedContext.makeCurrent();
                    GLES20.glViewport(0, 0, this.m_width, this.m_height);
                    this.m_textureDrawer.drawTexture(i3);
                    if (this.mFirstFrame) {
                        if (DEBUG) {
                            ByteBuffer allocateDirect = ByteBuffer.allocateDirect(3686400);
                            allocateDirect.order(ByteOrder.nativeOrder());
                            allocateDirect.position(0);
                            GLES20.glReadPixels(0, 0, 1280, Util.LIMIT_SURFACE_WIDTH, 6408, 5121, allocateDirect);
                            FileOutputStream fileOutputStream = new FileOutputStream("/mnt/sdcard/ttt.rgba");
                            fileOutputStream.write(allocateDirect.array());
                            fileOutputStream.close();
                        }
                        this.mFirstFrame = false;
                    }
                    this.m_sharedContext.setPresentationTime(computePresentationTime(this.m_getnerateIndex));
                    this.m_sharedContext.swapBuffers();
                    this.m_bNeedSingalEnd = true;
                    drainOutputBuffer(0);
                    if (this.configbyte == null) {
                        int i5 = 0;
                        while (true) {
                            GLES20.glViewport(0, 0, this.m_width, this.m_height);
                            this.m_textureDrawer.drawTexture(i3);
                            this.m_sharedContext.setPresentationTime(computePresentationTime(this.m_getnerateIndex));
                            this.m_sharedContext.swapBuffers();
                            drainOutputBuffer(0);
                            i5++;
                            if (i5 <= 30) {
                                Thread.sleep(10, 0);
                                if (this.configbyte != null) {
                                    break;
                                }
                            } else {
                                break;
                            }
                        }
                        if (this.configbyte == null) {
                            String str = TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("Generate configData failed!!!");
                            sb.append(i5);
                            Log.e(str, sb.toString());
                        } else {
                            String str2 = TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("Generate configData succeed!!!");
                            sb2.append(i5);
                            Log.e(str2, sb2.toString());
                        }
                        this.AVCQueue.clear();
                        restartEncoder();
                        this.m_getnerateIndex = 0;
                        this.m_sharedContext.makeCurrent();
                        GLES20.glViewport(0, 0, this.m_width, this.m_height);
                        this.m_textureDrawer.drawTexture(i3);
                        this.m_sharedContext.setPresentationTime(computePresentationTime(this.m_getnerateIndex));
                        this.m_sharedContext.swapBuffers();
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            this.m_getnerateIndex++;
        } else if (this.m_mediaCodec != null && !this.m_bSignalEndOfStream && this.m_bNeedSingalEnd) {
            try {
                Log.i(TAG, "m_mediaCodec.flush()");
                this.m_bSignalEndOfStream = true;
                this.mEndOfStream = false;
                this.m_mediaCodec.signalEndOfInputStream();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        this.m_eglStateSaver.makeSavedStateCurrent();
        if (this.m_bSignalEndOfStream) {
            while (!this.mEndOfStream) {
                drainOutputBuffer(FunctionParseBeautyBodySlimCount.TIP_INTERVAL_TIME);
                if (this.mBufferIndex < 0) {
                    i4--;
                    if (i4 <= 0) {
                        break;
                    }
                } else {
                    break;
                }
            }
        } else {
            drainOutputBuffer(0);
        }
        this.mLastCodecData = (CodecData) this.AVCQueue.poll();
        if (this.mLastCodecData != null) {
            i2 = this.mLastCodecData.data.length;
        }
        return i2;
    }

    public byte[] getCodecData(int i) {
        if (this.mLastCodecData != null) {
            return this.mLastCodecData.data;
        }
        return null;
    }

    public byte[] getExtraData() {
        return this.configbyte != null ? this.configbyte : new byte[0];
    }

    public int getInfoByFlag(int[] iArr, int i) {
        if (i != 1) {
            return -1;
        }
        iArr[0] = (int) (this.mLastCodecData.pts & -1);
        iArr[1] = (int) ((this.mLastCodecData.pts >> 32) & -1);
        return 2;
    }

    public Surface getInputSurface() {
        return this.m_surface;
    }

    @TargetApi(18)
    public int initEncoder(int i, int i2, int i3, int i4, int i5, int i6, int i7, boolean z) {
        boolean z2 = z;
        if (z2 && VERSION.SDK_INT < 18) {
            return -1;
        }
        this.m_useInputSurface = z2;
        if (this.m_useInputSurface) {
            this.m_colorFormat = 2130708361;
        } else {
            this.m_colorFormat = i4;
        }
        setEncoder(i, i2, i3, i6, i5, this.m_colorFormat, i7);
        this.m_isNeedReconfigure = true;
        this.m_bSuccessInit = true;
        this.m_bSignalEndOfStream = false;
        return configEncode();
    }

    public boolean initTextureDrawer() {
        if (this.m_textureDrawer != null) {
            this.m_textureDrawer.release();
            this.m_textureDrawer = null;
        }
        this.m_textureDrawer = TETextureDrawer.create();
        if (this.m_textureDrawer == null) {
            return false;
        }
        this.m_textureDrawer.setRotation(0.0f);
        this.m_textureDrawer.setFlipScale(1.0f, -1.0f);
        return true;
    }

    public void releaseEncoder() {
        stopEncoder();
        TELogUtil.d("TEAvcEncoder", "releaseEncoder");
        if (this.m_surface != null) {
            TELogUtil.d("TEAvcEncoder", "release surface");
            this.m_surface.release();
            this.m_surface = null;
        }
        if (this.m_mediaCodec != null) {
            TELogUtil.d("TEAvcEncoder", "release mediaCodec");
            this.m_mediaCodec.release();
            this.m_mediaCodec = null;
        }
        if (this.m_sharedContext != null) {
            this.m_sharedContext.release();
            this.m_sharedContext = null;
        }
        c_curObj = null;
    }

    public void releaseTextureDrawer() {
        if (this.m_textureDrawer != null) {
            this.m_textureDrawer.release();
            this.m_textureDrawer = null;
        }
    }

    public int restartEncoder() {
        this.m_bNeedSingalEnd = false;
        stopEncoder();
        int configEncode = configEncode();
        return configEncode < 0 ? configEncode : startEncoder();
    }

    public int setEncoder(int i, int i2, int i3, int i4, int i5, int i6, int i7) {
        this.m_configStatus = 0;
        if (i > 0) {
            this.m_width = i;
        }
        if (i2 > 0) {
            this.m_height = i2;
        }
        if (i3 > 0) {
            if (i3 < MIN_FRAME_RATE) {
                TELogUtil.w(TAG, String.format(Locale.getDefault(), "_frameRate:[%d] is too small, change to %d", new Object[]{Integer.valueOf(i3), Integer.valueOf(MIN_FRAME_RATE)}));
                i3 = MIN_FRAME_RATE;
            } else if (i3 > MAX_FRAME_RATE) {
                TELogUtil.w(TAG, String.format(Locale.getDefault(), "_frameRate:[%d] is too large, change to %d", new Object[]{Integer.valueOf(i3), Integer.valueOf(MAX_FRAME_RATE)}));
                i3 = MAX_FRAME_RATE;
            }
            if (this.m_frameRate != i3) {
                this.m_frameRate = i3;
                if (i3 < this.m_iFrameInternal) {
                    this.m_iFrameInternal = i3;
                }
                this.m_isNeedReconfigure = true;
                this.m_configStatus |= 2;
            }
        }
        if (i4 > 0 && this.m_bitRate != i4) {
            this.m_bitRate = i4;
            this.m_isNeedReconfigure = true;
            this.m_configStatus = 1 | this.m_configStatus;
        }
        if (i5 >= 0) {
            this.m_iFrameInternal = i5;
        }
        if (i6 > 0) {
            this.m_colorFormat = i6;
        }
        if (i7 >= 0) {
            this.m_profile = i7;
        }
        return 0;
    }

    @TargetApi(16)
    public int startEncoder() {
        TELogUtil.d(TAG, "startEncoder...");
        try {
            if (VERSION.SDK_INT >= 18 && this.m_useInputSurface) {
                if (this.m_sharedContext == null) {
                    this.m_sharedContext = TESharedContext.create(this.m_eglStateSaver.getSavedEGLContext(), 64, 64, TESharedContext.EGL_RECORDABLE_ANDROID, this.m_surface);
                    if (this.m_sharedContext == null) {
                        return -2;
                    }
                } else if (!this.m_sharedContext.updateSurface(0, 0, TESharedContext.EGL_RECORDABLE_ANDROID, this.m_surface)) {
                    return -2;
                }
                if (!initTextureDrawer()) {
                    return -3;
                }
            }
            this.m_mediaCodec.start();
            this.m_encodeStartTime = System.nanoTime();
            this.m_isNeedReconfigure = false;
            this.mEndOfStream = false;
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    @TargetApi(16)
    public void stopEncoder() {
        try {
            if (this.m_sharedContext != null) {
                this.m_sharedContext.makeCurrent();
            }
            if (this.m_textureDrawer != null) {
                this.m_textureDrawer.release();
                this.m_textureDrawer = null;
            }
            if (this.m_mediaCodec != null) {
                this.m_mediaCodec.stop();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
