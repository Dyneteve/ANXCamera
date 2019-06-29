package com.ss.android.medialib;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import android.media.MediaCodecInfo;
import android.media.MediaCodecInfo.CodecCapabilities;
import android.media.MediaCodecInfo.CodecProfileLevel;
import android.media.MediaCodecInfo.EncoderCapabilities;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import android.opengl.GLES20;
import android.os.Build.VERSION;
import android.util.Log;
import android.util.Pair;
import android.view.Surface;
import com.android.camera.constant.DurationConstant;
import com.ss.android.medialib.common.TextureDrawer;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.LinkedList;
import java.util.Queue;

@TargetApi(18)
public class AVCEncoder {
    private static final String[] BITRATE_MODES = {"BITRATE_MODE_CQ", "BITRATE_MODE_VBR", "BITRATE_MODE_CBR"};
    private static final boolean DEBUG = true;
    private static final String TAG = "AVCEncoder";
    private static int TIMEOUT_USEC = 5000;
    static AVCEncoderInterface mEncoderCaller = null;
    private byte[] codec_config;
    BufferedOutputStream fileWriter = null;
    ByteBuffer[] inputBuffers;
    BufferInfo mBufferInfo = null;
    private String mCodecName = "video/avc";
    private int mDrawCount = 0;
    private int mEncodeCount = 0;
    private boolean mFlag = false;
    int mFrameRate = 30;
    private int mHeight;
    private MediaCodec mMediaCodec = null;
    private MediaCodecInfo mMediaCodecInfo = null;
    private Queue<Pair<Integer, Integer>> mPTSQueue = new LinkedList();
    private int mProfile = 1;
    private Surface mSurface;
    private TextureDrawer mTextureDrawer;
    private int mWidth;
    ByteBuffer[] outputBuffers;
    int status = 0;

    private interface Status {
        public static final int INITED = 1;
        public static final int STATED = 2;
        public static final int STOPPED = 3;
        public static final int UNSET = 0;
    }

    static {
        new Thread(new Runnable() {
            public void run() {
                MediaCodecList.getCodecCount();
            }
        }).start();
    }

    private MediaCodecInfo getMediaCodecInfo() {
        int codecCount = MediaCodecList.getCodecCount();
        for (int i = 0; i < codecCount; i++) {
            MediaCodecInfo codecInfoAt = MediaCodecList.getCodecInfoAt(i);
            if (codecInfoAt.isEncoder()) {
                String name = codecInfoAt.getName();
                if (!name.startsWith("OMX.google.") && !name.startsWith("OMX.Nvidia.") && !name.equals("OMX.TI.DUCATI1.VIDEO.H264E")) {
                    String[] supportedTypes = codecInfoAt.getSupportedTypes();
                    for (String equalsIgnoreCase : supportedTypes) {
                        if (equalsIgnoreCase.equalsIgnoreCase(this.mCodecName)) {
                            return codecInfoAt;
                        }
                    }
                    continue;
                }
            }
        }
        return null;
    }

    @TargetApi(21)
    private MediaCodecInfo getMediaCodecInfo21() {
        MediaCodecInfo[] codecInfos = new MediaCodecList(1).getCodecInfos();
        if (codecInfos == null || codecInfos.length == 0) {
            return null;
        }
        for (MediaCodecInfo mediaCodecInfo : codecInfos) {
            if (mediaCodecInfo != null && mediaCodecInfo.isEncoder()) {
                String name = mediaCodecInfo.getName();
                if (!name.startsWith("OMX.google.") && !name.startsWith("OMX.Nvidia.") && !name.equals("OMX.TI.DUCATI1.VIDEO.H264E")) {
                    String[] supportedTypes = mediaCodecInfo.getSupportedTypes();
                    for (String equalsIgnoreCase : supportedTypes) {
                        if (equalsIgnoreCase.equalsIgnoreCase(this.mCodecName)) {
                            return mediaCodecInfo;
                        }
                    }
                    continue;
                }
            }
        }
        return null;
    }

    private int getOneColorFormat() {
        int[] colorFormats = getColorFormats();
        if (colorFormats == null) {
            return -1;
        }
        for (int i = 0; i < colorFormats.length; i++) {
            if (colorFormats[i] == 2130708361) {
                Log.e(TAG, "====== colorFormat support COLOR_FormatSurface ======");
                return colorFormats[i];
            }
        }
        return -1;
    }

    public static void setDrainWaitTimeout(int i) {
        TIMEOUT_USEC = i;
    }

    private void testCode(boolean z) {
        ByteBuffer order = ByteBuffer.allocateDirect(this.mWidth * this.mHeight * 4).order(ByteOrder.nativeOrder());
        GLES20.glReadPixels(0, 0, this.mWidth, this.mHeight, 6408, 5121, order);
        try {
            if (this.fileWriter == null) {
                this.fileWriter = new BufferedOutputStream(new FileOutputStream("/storage/emulated/0/xzw/rgbaBig.rgba"));
            }
            this.fileWriter.write(order.array());
        } catch (IOException e) {
            e.printStackTrace();
        }
        Bitmap createBitmap = Bitmap.createBitmap(this.mWidth, this.mHeight, Config.ARGB_8888);
        createBitmap.copyPixelsFromBuffer(order);
        if (z) {
            saveBitmap(createBitmap, "/sdcard/aweme/picture/record_e.jpeg");
        } else {
            saveBitmap(createBitmap, "/sdcard/aweme/picture/record_s.jpeg");
        }
        createBitmap.recycle();
    }

    /* JADX WARNING: Code restructure failed: missing block: B:53:0x0146, code lost:
        return 0;
     */
    public int encode(int i, int i2, int i3, boolean z) {
        int i4 = i;
        int i5 = i2;
        boolean z2 = z;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("encodeTexture::texID: ");
        sb.append(i4);
        sb.append(" pts: ");
        sb.append(i5);
        sb.append(" duration:");
        sb.append(i3);
        sb.append("  isEndStream = ");
        sb.append(z2);
        Log.d(str, sb.toString());
        synchronized (this) {
            if (this.status == 2) {
                if (this.mMediaCodec != null) {
                    if (i4 > 0) {
                        if (i5 >= 0) {
                            if (this.mTextureDrawer == null && !initEGLCtx()) {
                                return -1;
                            }
                            this.mPTSQueue.offer(Pair.create(Integer.valueOf(i2), Integer.valueOf(i3)));
                            GLES20.glViewport(0, 0, this.mWidth, this.mHeight);
                            String str2 = TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("encode: width = ");
                            sb2.append(this.mWidth);
                            sb2.append(" height = ");
                            sb2.append(this.mHeight);
                            Log.v(str2, sb2.toString());
                            this.mTextureDrawer.drawTexture(i4);
                            GLES20.glFinish();
                            this.mDrawCount++;
                            mEncoderCaller.onSwapGlBuffers();
                            if (this.mFlag) {
                                testCode(z2);
                                this.mFlag = false;
                            }
                            if (z2) {
                                this.mMediaCodec.signalEndOfInputStream();
                            }
                            int i6 = 0;
                            while (true) {
                                i6++;
                                if (VERSION.SDK_INT < 21) {
                                    this.outputBuffers = this.mMediaCodec.getOutputBuffers();
                                }
                                try {
                                    int dequeueOutputBuffer = this.mMediaCodec.dequeueOutputBuffer(this.mBufferInfo, (long) TIMEOUT_USEC);
                                    String str3 = TAG;
                                    StringBuilder sb3 = new StringBuilder();
                                    sb3.append("outputBufferIndex = ");
                                    sb3.append(dequeueOutputBuffer);
                                    Log.v(str3, sb3.toString());
                                    String str4 = TAG;
                                    StringBuilder sb4 = new StringBuilder();
                                    sb4.append("mBufferInfo.flags = ");
                                    sb4.append(this.mBufferInfo.flags);
                                    Log.v(str4, sb4.toString());
                                    if (dequeueOutputBuffer == -1) {
                                        if (z2 && TIMEOUT_USEC < 5000) {
                                            TIMEOUT_USEC = DurationConstant.DURATION_VIDEO_RECORDING_CIRCLE;
                                        }
                                        if (!z2 || this.mDrawCount == this.mEncodeCount || i6 >= 10) {
                                            break;
                                        }
                                    } else if (dequeueOutputBuffer == -3) {
                                        this.outputBuffers = this.mMediaCodec.getOutputBuffers();
                                    } else if (dequeueOutputBuffer == -2) {
                                        Log.w(TAG, "encode: output format change!");
                                    } else if (dequeueOutputBuffer < 0) {
                                        Log.w(TAG, "encode: error.");
                                        break;
                                    } else {
                                        ByteBuffer outputBuffer = VERSION.SDK_INT >= 21 ? this.mMediaCodec.getOutputBuffer(dequeueOutputBuffer) : this.outputBuffers[dequeueOutputBuffer];
                                        outputBuffer.position(this.mBufferInfo.offset);
                                        outputBuffer.limit(this.mBufferInfo.offset + this.mBufferInfo.size);
                                        if ((this.mBufferInfo.flags & 2) != 0) {
                                            Log.e(TAG, "mEncoderCaller.onSetCodecConfig");
                                            if (mEncoderCaller != null) {
                                                mEncoderCaller.onSetCodecConfig(outputBuffer);
                                            }
                                            this.mBufferInfo.size = 0;
                                        } else {
                                            int i7 = (this.mBufferInfo.flags & 1) != 0 ? 1 : 0;
                                            Log.v(TAG, "mEncoderCaller.onWriteFile");
                                            if (mEncoderCaller != null) {
                                                String str5 = TAG;
                                                StringBuilder sb5 = new StringBuilder();
                                                sb5.append("encode: pts queue size = ");
                                                sb5.append(this.mPTSQueue.size());
                                                Log.d(str5, sb5.toString());
                                                if (this.mPTSQueue.size() > 0) {
                                                    this.mEncodeCount++;
                                                    Pair pair = (Pair) this.mPTSQueue.poll();
                                                    long j = 0;
                                                    if (this.mBufferInfo.presentationTimeUs > 0) {
                                                        j = this.mBufferInfo.presentationTimeUs;
                                                    }
                                                    mEncoderCaller.onWriteFile(outputBuffer, j / 1000, (long) ((Integer) pair.first).intValue(), ((Integer) pair.second).intValue(), i7);
                                                } else {
                                                    Log.w(TAG, "encode: no available pts!!!");
                                                }
                                            } else {
                                                Log.i(TAG, "encode: no output.");
                                            }
                                        }
                                        this.mMediaCodec.releaseOutputBuffer(dequeueOutputBuffer, false);
                                        i6 = 0;
                                    }
                                } catch (Throwable th) {
                                    return -2;
                                }
                            }
                            if (z2) {
                                releaseEGLCtx();
                            }
                        }
                    }
                    String str6 = TAG;
                    StringBuilder sb6 = new StringBuilder();
                    sb6.append("encode: invalidate params: texID = ");
                    sb6.append(i4);
                    sb6.append(", pts = ");
                    sb6.append(i5);
                    Log.e(str6, sb6.toString());
                    return -1;
                }
            }
            Log.w(TAG, "encode: codec is not reayd.");
            return -1;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:64:0x01b2, code lost:
        return 0;
     */
    public int encode(byte[] bArr, int i, boolean z) {
        byte[] bArr2 = bArr;
        int i2 = i;
        boolean z2 = z;
        synchronized (this) {
            if (this.status == 2) {
                if (this.mMediaCodec != null) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("encodeBuffer pts: ");
                    sb.append(i2);
                    sb.append("  isEndStream = ");
                    sb.append(z2);
                    Log.e(str, sb.toString());
                    if (VERSION.SDK_INT >= 21) {
                        int dequeueInputBuffer = this.mMediaCodec.dequeueInputBuffer(-1);
                        if (dequeueInputBuffer >= 0) {
                            ByteBuffer inputBuffer = this.mMediaCodec.getInputBuffer(dequeueInputBuffer);
                            inputBuffer.clear();
                            inputBuffer.put(bArr2, 0, bArr2.length);
                            this.mMediaCodec.queueInputBuffer(dequeueInputBuffer, 0, bArr2.length, (long) i2, z2 ? 4 : 0);
                        }
                        int dequeueOutputBuffer = this.mMediaCodec.dequeueOutputBuffer(this.mBufferInfo, (long) TIMEOUT_USEC);
                        String str2 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("outputBufferIndex = ");
                        sb2.append(dequeueOutputBuffer);
                        Log.e(str2, sb2.toString());
                        String str3 = TAG;
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("mBufferInfo.flags = ");
                        sb3.append(this.mBufferInfo.flags);
                        Log.e(str3, sb3.toString());
                        while (dequeueOutputBuffer >= 0) {
                            ByteBuffer outputBuffer = this.mMediaCodec.getOutputBuffer(dequeueOutputBuffer);
                            outputBuffer.position(this.mBufferInfo.offset);
                            outputBuffer.limit(this.mBufferInfo.offset + this.mBufferInfo.size);
                            if ((this.mBufferInfo.flags & 2) != 0) {
                                Log.e(TAG, "mEncoderCaller.onSetCodecConfig");
                                if (mEncoderCaller != null) {
                                    mEncoderCaller.onSetCodecConfig(outputBuffer);
                                }
                                this.mBufferInfo.size = 0;
                            } else {
                                int i3 = (int) this.mBufferInfo.presentationTimeUs;
                                int i4 = (this.mBufferInfo.flags & 1) != 0 ? 1 : 0;
                                Log.e(TAG, "mEncoderCaller.onWriteFile");
                                if (mEncoderCaller != null) {
                                    mEncoderCaller.onWriteFile(outputBuffer, i3, 0, i4);
                                }
                            }
                            this.mMediaCodec.releaseOutputBuffer(dequeueOutputBuffer, false);
                            dequeueOutputBuffer = this.mMediaCodec.dequeueOutputBuffer(this.mBufferInfo, 0);
                        }
                    } else {
                        int dequeueInputBuffer2 = this.mMediaCodec.dequeueInputBuffer(-1);
                        if (dequeueInputBuffer2 >= 0) {
                            ByteBuffer byteBuffer = this.inputBuffers[dequeueInputBuffer2];
                            byteBuffer.clear();
                            byteBuffer.put(bArr2, 0, bArr2.length);
                            this.mMediaCodec.queueInputBuffer(dequeueInputBuffer2, 0, bArr2.length, (long) i2, z2 ? 4 : 0);
                        }
                        for (int dequeueOutputBuffer2 = this.mMediaCodec.dequeueOutputBuffer(this.mBufferInfo, (long) TIMEOUT_USEC); dequeueOutputBuffer2 >= 0; dequeueOutputBuffer2 = this.mMediaCodec.dequeueOutputBuffer(this.mBufferInfo, 0)) {
                            if (dequeueOutputBuffer2 == -3) {
                                this.outputBuffers = this.mMediaCodec.getOutputBuffers();
                            } else if (dequeueOutputBuffer2 != -2) {
                                ByteBuffer byteBuffer2 = this.outputBuffers[dequeueOutputBuffer2];
                                byteBuffer2.position(this.mBufferInfo.offset);
                                byteBuffer2.limit(this.mBufferInfo.offset + this.mBufferInfo.size);
                                if ((this.mBufferInfo.flags & 2) != 0) {
                                    Log.e(TAG, "mEncoderCaller.onSetCodecConfig");
                                    if (mEncoderCaller != null) {
                                        mEncoderCaller.onSetCodecConfig(byteBuffer2);
                                    }
                                    this.mBufferInfo.size = 0;
                                } else {
                                    int i5 = (int) this.mBufferInfo.presentationTimeUs;
                                    int i6 = (this.mBufferInfo.flags & 1) != 0 ? 1 : 0;
                                    Log.e(TAG, "mEncoderCaller.onWriteFile");
                                    if (mEncoderCaller != null) {
                                        mEncoderCaller.onWriteFile(byteBuffer2, i5, 0, i6);
                                    }
                                }
                                this.mMediaCodec.releaseOutputBuffer(dequeueOutputBuffer2, false);
                            }
                        }
                    }
                }
            }
            return -1;
        }
    }

    public int[] getColorFormats() {
        Log.e(TAG, "start == ");
        this.mMediaCodecInfo = VERSION.SDK_INT >= 21 ? getMediaCodecInfo21() : getMediaCodecInfo();
        Log.e(TAG, "end == ");
        if (this.mMediaCodecInfo == null) {
            return null;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("mMediaCodecInfo name = ");
        sb.append(this.mMediaCodecInfo.getName());
        Log.e(str, sb.toString());
        CodecCapabilities capabilitiesForType = this.mMediaCodecInfo.getCapabilitiesForType(this.mCodecName);
        int length = capabilitiesForType.colorFormats.length;
        int[] iArr = new int[length];
        for (int i = 0; i < length; i++) {
            iArr[i] = capabilitiesForType.colorFormats[i];
        }
        return iArr;
    }

    public int getProfile() {
        return this.mProfile;
    }

    public Surface initAVCEncoder(int i, int i2, int i3, int i4) {
        return initAVCEncoder(i, i2, i3, 1, 8, i4, true);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:54:0x016f, code lost:
        if (r11.profile < 8) goto L_0x0172;
     */
    /* JADX WARNING: Removed duplicated region for block: B:108:0x0177 A[SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:59:0x0178 A[Catch:{ Exception -> 0x0347 }, LOOP:1: B:42:0x011a->B:59:0x0178, LOOP_END] */
    public Surface initAVCEncoder(int i, int i2, int i3, int i4, int i5, int i6, boolean z) {
        int i7;
        int i8 = i;
        int i9 = i2;
        int i10 = i4;
        int i11 = i5;
        boolean z2 = z;
        if (!z2 || VERSION.SDK_INT < 18) {
            return null;
        }
        this.mDrawCount = 0;
        this.mEncodeCount = 0;
        Log.d(TAG, "initAVCEncoder == enter");
        if (i10 < 0 || i10 > 2) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Do not support bitrate mode ");
            sb.append(i10);
            sb.append(", set VBR mode");
            Log.e(str, sb.toString());
            i10 = 1;
        }
        if (i11 < 1 || i11 > 64) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Do not support profile ");
            sb2.append(i11);
            sb2.append(", use baseline");
            Log.e(str2, sb2.toString());
            i11 = 1;
        }
        int i12 = 12000000;
        int i13 = i3;
        if (i13 <= 12000000) {
            i12 = i13;
        }
        String str3 = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("width + ");
        sb3.append(i8);
        sb3.append("\theight = ");
        sb3.append(i9);
        sb3.append("\tbitrate = ");
        sb3.append(i12);
        sb3.append("\tuseTextureInput = ");
        sb3.append(z2);
        Log.d(str3, sb3.toString());
        if (i8 <= 0 || i9 <= 0) {
            return null;
        }
        this.mWidth = i8;
        this.mHeight = i9;
        synchronized (this) {
            try {
                int oneColorFormat = getOneColorFormat();
                if (oneColorFormat < 0) {
                    return null;
                }
                if (mEncoderCaller != null) {
                    mEncoderCaller.setColorFormat(oneColorFormat);
                }
                this.mMediaCodec = MediaCodec.createEncoderByType(this.mCodecName);
                MediaCodecInfo codecInfo = this.mMediaCodec.getCodecInfo();
                if (codecInfo.getName().startsWith("OMX.google.")) {
                    return null;
                }
                String[] supportedTypes = codecInfo.getSupportedTypes();
                Log.d(TAG, "CodecNames: ");
                for (String str4 : supportedTypes) {
                    String str5 = TAG;
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("Codec: ");
                    sb4.append(str4);
                    Log.d(str5, sb4.toString());
                }
                this.status = 1;
                MediaFormat createVideoFormat = MediaFormat.createVideoFormat(this.mCodecName, i8, i9);
                CodecCapabilities capabilitiesForType = codecInfo.getCapabilitiesForType(this.mCodecName);
                CodecProfileLevel[] codecProfileLevelArr = capabilitiesForType.profileLevels;
                int length = codecProfileLevelArr.length;
                int i14 = 0;
                CodecProfileLevel codecProfileLevel = null;
                while (true) {
                    if (i14 >= length) {
                        break;
                    }
                    CodecProfileLevel codecProfileLevel2 = codecProfileLevelArr[i14];
                    String str6 = TAG;
                    StringBuilder sb5 = new StringBuilder();
                    sb5.append("Profile = ");
                    sb5.append(codecProfileLevel2.profile);
                    sb5.append(", Level = ");
                    sb5.append(codecProfileLevel2.level);
                    Log.d(str6, sb5.toString());
                    if (codecProfileLevel2.profile == 1) {
                        Log.d(TAG, "Support Baseline Profile!");
                    } else if (codecProfileLevel2.profile == 2) {
                        Log.d(TAG, "Support Main Profile!");
                        if (codecProfileLevel.profile < 2) {
                        }
                        if (codecProfileLevel2.profile == i11) {
                            break;
                        }
                        i14++;
                    } else {
                        if (codecProfileLevel2.profile == 8) {
                            Log.d(TAG, "Support High Profile!");
                        }
                        if (codecProfileLevel2.profile == i11) {
                        }
                    }
                    codecProfileLevel = codecProfileLevel2;
                    if (codecProfileLevel2.profile == i11) {
                    }
                }
                if (VERSION.SDK_INT >= 21) {
                    EncoderCapabilities encoderCapabilities = capabilitiesForType.getEncoderCapabilities();
                    for (int i15 = 0; i15 < 3; i15++) {
                        String str7 = TAG;
                        StringBuilder sb6 = new StringBuilder();
                        sb6.append(BITRATE_MODES[i15]);
                        sb6.append(": ");
                        sb6.append(encoderCapabilities.isBitrateModeSupported(i15));
                        Log.d(str7, sb6.toString());
                    }
                }
                if (VERSION.SDK_INT < 24 || codecProfileLevel == null) {
                    String str8 = TAG;
                    StringBuilder sb7 = new StringBuilder();
                    sb7.append("Do not support profile ");
                    sb7.append(i11);
                    sb7.append(", use baseline");
                    Log.w(str8, sb7.toString());
                    i7 = i12;
                } else {
                    String str9 = TAG;
                    StringBuilder sb8 = new StringBuilder();
                    sb8.append("Set Profile: ");
                    sb8.append(codecProfileLevel.profile);
                    sb8.append(", Level = ");
                    sb8.append(codecProfileLevel.level);
                    Log.d(str9, sb8.toString());
                    this.mProfile = codecProfileLevel.profile;
                    createVideoFormat.setInteger("profile", codecProfileLevel.profile);
                    createVideoFormat.setInteger("level", codecProfileLevel.level);
                    int i16 = codecProfileLevel.profile;
                    if (i16 == 2) {
                        Log.d(TAG, "Set Main Profile");
                        i7 = (int) (((float) i12) * 0.67f);
                    } else if (i16 != 8) {
                        i7 = i12;
                    } else {
                        Log.d(TAG, "Set High Profile");
                        i7 = (int) (((float) i12) * 0.58f);
                    }
                }
                String str10 = TAG;
                StringBuilder sb9 = new StringBuilder();
                sb9.append("bitrate = ");
                sb9.append((((float) i7) * 1.0f) / 1000000.0f);
                sb9.append("Mb/s");
                Log.d(str10, sb9.toString());
                String str11 = TAG;
                StringBuilder sb10 = new StringBuilder();
                sb10.append("speed = ");
                sb10.append(i6);
                Log.d(str11, sb10.toString());
                createVideoFormat.setInteger("bitrate", i7);
                if (VERSION.SDK_INT >= 21) {
                    EncoderCapabilities encoderCapabilities2 = capabilitiesForType.getEncoderCapabilities();
                    for (int i17 = 0; i17 < 3; i17++) {
                        String str12 = TAG;
                        StringBuilder sb11 = new StringBuilder();
                        sb11.append(BITRATE_MODES[i17]);
                        sb11.append(": ");
                        sb11.append(encoderCapabilities2.isBitrateModeSupported(i17));
                        Log.d(str12, sb11.toString());
                    }
                    createVideoFormat.setInteger("bitrate-mode", i10);
                    String str13 = TAG;
                    StringBuilder sb12 = new StringBuilder();
                    sb12.append("Bitrate mode = ");
                    sb12.append(i10);
                    Log.d(str13, sb12.toString());
                    createVideoFormat.setInteger("max-bitrate", i12);
                    String str14 = TAG;
                    StringBuilder sb13 = new StringBuilder();
                    sb13.append("Encoder ComplexityRange: ");
                    sb13.append(encoderCapabilities2.getComplexityRange().toString());
                    Log.d(str14, sb13.toString());
                }
                createVideoFormat.setInteger("color-format", oneColorFormat);
                createVideoFormat.setInteger("frame-rate", this.mFrameRate);
                createVideoFormat.setInteger("i-frame-interval", 1);
                String str15 = TAG;
                StringBuilder sb14 = new StringBuilder();
                sb14.append("initAVCEncoder: format = ");
                sb14.append(createVideoFormat);
                Log.d(str15, sb14.toString());
                this.mMediaCodec.configure(createVideoFormat, null, null, 1);
                this.mSurface = this.mMediaCodec.createInputSurface();
                this.mMediaCodec.start();
                this.status = 2;
                if (VERSION.SDK_INT < 21) {
                    this.inputBuffers = this.mMediaCodec.getInputBuffers();
                    this.outputBuffers = this.mMediaCodec.getOutputBuffers();
                }
                this.mBufferInfo = new BufferInfo();
                if (this.mSurface == null) {
                    return null;
                }
                Log.i(TAG, "initAVCEncoder == exit");
                return this.mSurface;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
    }

    public Surface initAVCEncoder(int i, int i2, int i3, int i4, boolean z) {
        return initAVCEncoder(i, i2, i3, 1, 1, i4, z);
    }

    public boolean initEGLCtx() {
        if (this.mSurface == null) {
            Log.e(TAG, "initEGLCtx: MediaCodec should initialized ahead.");
            return false;
        }
        this.mTextureDrawer = TextureDrawer.create();
        this.mTextureDrawer.setRotation(0.0f);
        this.mTextureDrawer.setFlipScale(1.0f, -1.0f);
        return true;
    }

    public void releaseEGLCtx() {
        if (this.mTextureDrawer != null) {
            this.mTextureDrawer.release();
            this.mTextureDrawer = null;
        }
    }

    public void saveBitmap(Bitmap bitmap, String str) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("saving Bitmap : ");
        sb.append(str);
        Log.i(str2, sb.toString());
        try {
            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(str));
            bitmap.compress(CompressFormat.JPEG, 100, bufferedOutputStream);
            bufferedOutputStream.flush();
            bufferedOutputStream.close();
            String str3 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Bitmap ");
            sb2.append(str);
            sb2.append(" saved!");
            Log.i(str3, sb2.toString());
        } catch (IOException e) {
            Log.e(TAG, "Err when saving bitmap...");
            e.printStackTrace();
        }
    }

    @TargetApi(21)
    public MediaFormat setBitrateMode(MediaFormat mediaFormat) {
        mediaFormat.setInteger("bitrate-mode", 0);
        return mediaFormat;
    }

    public void setEncoderCaller(AVCEncoderInterface aVCEncoderInterface) {
        mEncoderCaller = aVCEncoderInterface;
    }

    public void setFrameRate(int i) {
        this.mFrameRate = i;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:26:0x0039, code lost:
        android.util.Log.i(TAG, "uninitAVCEncoder == exit");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:27:0x0041, code lost:
        return;
     */
    public void uninitAVCEncoder() {
        Log.i(TAG, "uninitAVCEncoder == enter");
        synchronized (this) {
            if (this.status != 0) {
                if (this.mMediaCodec != null) {
                    if (this.status == 2) {
                        try {
                            this.mMediaCodec.stop();
                        } catch (Exception e) {
                            Log.e(TAG, "MediaCodec Exception");
                        }
                    }
                    try {
                        this.mMediaCodec.release();
                    } catch (Exception e2) {
                    }
                    this.mMediaCodec = null;
                    if (this.mSurface != null) {
                        this.mSurface.release();
                    }
                }
            }
            return;
        }
    }
}
