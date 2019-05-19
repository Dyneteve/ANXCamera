package com.ss.android.vesdk;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.SurfaceTexture;
import android.graphics.SurfaceTexture.OnFrameAvailableListener;
import android.support.annotation.ColorInt;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback2;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.TextureView.SurfaceTextureListener;
import com.android.camera.CameraSettings;
import com.ss.android.medialib.FFMpegInvoker;
import com.ss.android.ttve.common.TECommonCallback;
import com.ss.android.ttve.common.TELogUtil;
import com.ss.android.ttve.model.FilterBean;
import com.ss.android.ttve.monitor.MonitorUtils;
import com.ss.android.ttve.monitor.TEMonitor;
import com.ss.android.ttve.monitor.TEMonitorKeys;
import com.ss.android.ttve.nativePort.NativeCallbacks.IOpenGLCallback;
import com.ss.android.ttve.nativePort.TEInterface;
import com.ss.android.ttve.nativePort.TEVideoUtils;
import com.ss.android.vesdk.keyvaluepair.VEKeyValue;
import com.ss.android.vesdk.runtime.VEEditorResManager;
import com.ss.android.vesdk.runtime.VERuntime;
import java.io.File;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class VEEditor implements OnFrameAvailableListener {
    private static final String AUDIO_VOLUME = "audio volume";
    public static final String COMMIT_VERISION = "20190322_ec3de33";
    private static final String EFFECT_RES_PATH = "effect res path";
    private static final int ENGINE_PREPARE_FOR_COMPILE = 1;
    private static final int ENGINE_PREPARE_FOR_COMPILE_WITHWATERMARK = 2;
    private static final int ENGINE_PREPARE_FOR_PLAYBACK = 0;
    private static final String ENTITY_ALPHA = "entity alpha";
    private static final String ENTITY_END_TIME = "entity end time";
    private static final String ENTITY_LAYER = "entity layer";
    private static final String ENTITY_PATH = "entity path";
    private static final String ENTITY_POSITION_X = "entity position x";
    private static final String ENTITY_POSITION_Y = "entity position y";
    private static final String ENTITY_ROTATION = "entity rotation";
    private static final String ENTITY_SCALE_X = "entity scale x";
    private static final String ENTITY_SCALE_Y = "entity scale y";
    private static final String ENTITY_START_TIME = "entity start time";
    private static final String FILTER_INTENSITY = "filter intensity";
    private static final String FILTER_PATH_LEFT = "left filter";
    private static final String FILTER_PATH_RIGHT = "right filter";
    private static final String FILTER_POSITION = "filter position";
    private static final String TAG = "VEEditor";
    private static final int TEFilterType_Audio = 1;
    private static final int TEFilterType_Caption = 4;
    private static final int TEFilterType_Color = 2;
    private static final int TEFilterType_Effect_Color = 7;
    private static final int TEFilterType_Effect_Filter = 8;
    private static final int TEFilterType_Sticker = 0;
    private static final int TEFilterType_TimeEffect = 6;
    private static final int TEFilterType_TransForm = 3;
    private static final int TEFilterType_WaterMark = 5;
    private static final int TETrackProperty_BGM = 1;
    private static final int TETrackProperty_OriginalSound = 0;
    public static final int TETrackType_Audio = 1;
    public static final int TETrackType_Video = 0;
    private boolean hasDestroyCalled = false;
    private int mAudioEffectfilterIndex = -1;
    /* access modifiers changed from: private */
    public boolean mBCompileHighQualityGif = false;
    private boolean mBReversePlay = false;
    @ColorInt
    private int mBackGroundColor = -16777216;
    /* access modifiers changed from: private */
    public boolean mCancelReverse = false;
    private int mColorFilterIndex = -1;
    private String mCompileType = "mp4";
    private FilterBean mCurColorFilter;
    private int mInPoint;
    private int mInitDisplayHeight = 0;
    private int mInitDisplayWidth = 0;
    private VESize mInitSize = new VESize(-1, -1);
    private int mMasterTrackIndex = 0;
    private String mModelsDir;
    private IOpenGLCallback mOpenGLCallback = new IOpenGLCallback() {
        public int onOpenGLCreate(int i) {
            String str = VEEditor.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onOpenGLCreate: ret = ");
            sb.append(i);
            TELogUtil.d(str, sb.toString());
            return 0;
        }

        public int onOpenGLDestroy(int i) {
            String str = VEEditor.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onOpenGLDestroy: ret = ");
            sb.append(i);
            TELogUtil.d(str, sb.toString());
            return 0;
        }

        public int onOpenGLDrawAfter(int i, double d) {
            String str = VEEditor.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onOpenGLDrawing: tex = ");
            sb.append(i);
            sb.append(" timeStamp = ");
            sb.append(d);
            TELogUtil.v(str, sb.toString());
            VEEditor.access$804(VEEditor.this);
            if (VEEditor.this.miFrameCount == 30) {
                VEEditor.this.mlCurTimeMS = System.currentTimeMillis();
                float access$900 = 30000.0f / ((float) (VEEditor.this.mlCurTimeMS - VEEditor.this.mlLastTimeMS));
                String str2 = VEEditor.TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Render FPS = ");
                sb2.append(access$900);
                TELogUtil.d(str2, sb2.toString());
                VEEditor.this.mlLastTimeMS = VEEditor.this.mlCurTimeMS;
                VEEditor.this.miFrameCount = 0;
            }
            return 0;
        }

        public int onOpenGLDrawBefore(int i, double d) {
            return 0;
        }

        public int onPreviewSurface(int i) {
            return 0;
        }
    };
    private int mOutPoint;
    private String mOutputFile = null;
    private ExecutorService mPool = Executors.newCachedThreadPool();
    /* access modifiers changed from: private */
    public VEEditorResManager mResManager;
    /* access modifiers changed from: private */
    public boolean mReverseDone = false;
    /* access modifiers changed from: private */
    public Surface mSurface;
    private Callback2 mSurfaceCallback = new Callback2() {
        public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
            TELogUtil.d(VEEditor.TAG, String.format("surfaceChanged: pixel format [%d], size [%d, %d]", new Object[]{Integer.valueOf(i), Integer.valueOf(i2), Integer.valueOf(i3)}));
            VEEditor.this.mSurfaceWidth = i2;
            VEEditor.this.mSurfaceHeight = i3;
            VEEditor.this.updateInitDisplaySize();
            VEEditor.this.onSurfaceChanged(i2, i3);
        }

        public void surfaceCreated(SurfaceHolder surfaceHolder) {
            VEEditor.this.onSurfaceCreated(surfaceHolder.getSurface());
        }

        public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
            VEEditor.this.onSurfaceDestroyed();
        }

        public void surfaceRedrawNeeded(SurfaceHolder surfaceHolder) {
            TELogUtil.d(VEEditor.TAG, "surfaceRedrawNeeded...");
        }
    };
    /* access modifiers changed from: private */
    public int mSurfaceHeight = 0;
    /* access modifiers changed from: private */
    public SurfaceTexture mSurfaceTexture;
    private SurfaceView mSurfaceView;
    /* access modifiers changed from: private */
    public int mSurfaceWidth = 0;
    private final SurfaceTextureListener mTextureListener = new SurfaceTextureListener() {
        public void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int i, int i2) {
            if (VEEditor.this.mSurfaceTexture == surfaceTexture) {
                VEEditor.this.onSurfaceCreated(VEEditor.this.mSurface);
            } else {
                VEEditor.this.mSurface = new Surface(surfaceTexture);
                VEEditor.this.onSurfaceCreated(VEEditor.this.mSurface);
            }
            VEEditor.this.mSurfaceTexture = surfaceTexture;
        }

        public boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
            VEEditor.this.onSurfaceDestroyed();
            VEEditor.this.mSurface.release();
            return true;
        }

        public void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int i, int i2) {
            VEEditor.this.mSurfaceWidth = i;
            VEEditor.this.mSurfaceHeight = i2;
            VEEditor.this.updateInitDisplaySize();
        }

        public void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {
        }
    };
    private TextureView mTextureView;
    private TEInterface mVideoEditor = TEInterface.createEngine();
    private VIDEO_RATIO mVideoOutRes;
    private Boolean mbSeparateAV = Boolean.valueOf(false);
    /* access modifiers changed from: private */
    public int miFrameCount = 0;
    private long mlCompileStartTime = 0;
    /* access modifiers changed from: private */
    public long mlCurTimeMS = 0;
    /* access modifiers changed from: private */
    public long mlLastTimeMS = 0;
    /* access modifiers changed from: private */
    public Mp4ToHighQualityGIFConverter mp4ToGIFConverter = null;
    private String waterMarkFile;
    private double waterMarkHeight;
    private double waterMarkOffsetX;
    private double waterMarkOffsetY;
    private double waterMarkWidth;

    private class Mp4ToHighQualityGIFConverter implements Runnable {
        VECommonCallback mCallback;
        String mInputFile;
        boolean mIsRunning;
        String mOutputFile;
        String mPaletteFile;
        private String waterMarkFile;
        private int waterMarkHeight;
        private int waterMarkOffsetX;
        private int waterMarkOffsetY;
        private int waterMarkWidth;

        Mp4ToHighQualityGIFConverter() {
            this.mIsRunning = false;
            this.waterMarkFile = null;
            this.waterMarkWidth = 50;
            this.waterMarkHeight = 50;
            this.waterMarkOffsetX = 100;
            this.waterMarkOffsetY = 100;
            this.mPaletteFile = null;
            this.mInputFile = null;
            this.mOutputFile = null;
            this.mCallback = null;
        }

        Mp4ToHighQualityGIFConverter(String str, String str2, VECommonCallback vECommonCallback) {
            this.mIsRunning = false;
            this.waterMarkFile = null;
            this.waterMarkWidth = 50;
            this.waterMarkHeight = 50;
            this.waterMarkOffsetX = 100;
            this.waterMarkOffsetY = 100;
            this.mInputFile = str;
            this.mOutputFile = str2;
            this.mCallback = vECommonCallback;
            StringBuilder sb = new StringBuilder();
            sb.append(this.mOutputFile);
            sb.append(".png");
            this.mPaletteFile = sb.toString();
        }

        public void run() {
            String str;
            if (TextUtils.isEmpty(this.mInputFile) || TextUtils.isEmpty(this.mOutputFile) || this.mIsRunning) {
                if (this.mCallback != null) {
                    this.mCallback.onCallback(4103, VEResult.TER_BAD_FILE, 0.0f, "");
                }
                return;
            }
            this.mIsRunning = true;
            int executeFFmpegCommand = TEVideoUtils.executeFFmpegCommand(String.format("ffmpeg -y -i %s -vf palettegen %s", new Object[]{this.mInputFile, this.mPaletteFile}), null);
            if (executeFFmpegCommand != 0) {
                this.mIsRunning = false;
                if (this.mCallback != null) {
                    this.mCallback.onCallback(4103, executeFFmpegCommand, 0.0f, "");
                }
                return;
            }
            if (this.waterMarkFile != null) {
                str = String.format(Locale.US, "ffmpeg -y -i %s -i %s -i %s -filter_complex [2:v]scale=w=%d:h=%d[o0];[0:v][o0]overlay=x=%d-w/2:y=%d-h/2[o1];[o1][1:v]paletteuse -f gif %s", new Object[]{this.mInputFile, this.mPaletteFile, this.waterMarkFile, Integer.valueOf(this.waterMarkWidth), Integer.valueOf(this.waterMarkHeight), Integer.valueOf(this.waterMarkOffsetX), Integer.valueOf(this.waterMarkOffsetY), this.mOutputFile});
            } else {
                str = String.format(Locale.US, "ffmpeg -y -i %s -i %s -lavfi paletteuse -f gif %s", new Object[]{this.mInputFile, this.mPaletteFile, this.mOutputFile});
            }
            int executeFFmpegCommand2 = TEVideoUtils.executeFFmpegCommand(str, null);
            if (this.mCallback != null) {
                this.mCallback.onCallback(4103, executeFFmpegCommand2, 0.0f, "");
            }
            this.mIsRunning = false;
        }

        public void setCallback(VECommonCallback vECommonCallback) {
            this.mCallback = vECommonCallback;
        }

        public void setInputFile(String str) {
            this.mInputFile = str;
        }

        public void setOutputFile(String str) {
            this.mOutputFile = str;
            if (TextUtils.isEmpty(this.mOutputFile)) {
                this.mPaletteFile = null;
                return;
            }
            StringBuilder sb = new StringBuilder();
            sb.append(new File(this.mOutputFile).getParent());
            sb.append(File.separatorChar);
            sb.append("palette.png");
            this.mPaletteFile = sb.toString();
        }

        public void setWaterMarkFile(String str) {
            this.waterMarkFile = str;
        }

        public void setWaterMarkHeight(int i) {
            this.waterMarkHeight = i;
        }

        public void setWaterMarkOffsetX(int i) {
            this.waterMarkOffsetX = i;
        }

        public void setWaterMarkOffsetY(int i) {
            this.waterMarkOffsetY = i;
        }

        public void setWaterMarkWidth(int i) {
            this.waterMarkWidth = i;
        }
    }

    public enum SCALE_MODE {
        SCALE_MODE_CENTER_INSIDE,
        SCALE_MODE_CENTER_CROP
    }

    public enum SEEK_MODE {
        EDITOR_SEEK_FLAG_OnGoing,
        EDITOR_SEEK_FLAG_LastSeek
    }

    public enum VEState {
        ANY(65535),
        ERROR(0),
        NOTHING(1048576),
        IDLE(1),
        INITIALIZED(2),
        PREPARED(4),
        STARTED(8),
        PAUSED(16),
        SEEKING(32),
        STOPPED(64),
        COMPLETED(128);
        
        private int mValue;

        private VEState(int i) {
            this.mValue = i;
        }

        public static VEState valueOf(int i) {
            if (i == 4) {
                return PREPARED;
            }
            if (i == 8) {
                return STARTED;
            }
            if (i == 16) {
                return PAUSED;
            }
            if (i == 32) {
                return SEEKING;
            }
            if (i == 64) {
                return STOPPED;
            }
            if (i == 128) {
                return COMPLETED;
            }
            if (i == 65535) {
                return ANY;
            }
            if (i == 1048576) {
                return NOTHING;
            }
            switch (i) {
                case 0:
                    return ERROR;
                case 1:
                    return IDLE;
                case 2:
                    return INITIALIZED;
                default:
                    return null;
            }
        }

        public int getValue() {
            return this.mValue;
        }
    }

    public enum VIDEO_RATIO {
        VIDEO_OUT_RATIO_1_1,
        VIDEO_OUT_RATIO_4_3,
        VIDEO_OUT_RATIO_3_4,
        VIDEO_OUT_RATIO_16_9,
        VIDEO_OUT_RATIO_9_16,
        VIDEO_OUT_RATIO_ORIGINAL
    }

    public VEEditor(@NonNull String str) throws VEException {
        if (!TextUtils.isEmpty(str)) {
            TELogUtil.i(TAG, "VEEditor no surface");
            this.mResManager = new VEEditorResManager(str);
            MonitorUtils.monitorStatistics("iesve_veeditor_offscreen", 1, null);
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("workspace is: ");
        sb.append(str);
        throw new VEException(-100, sb.toString());
    }

    public VEEditor(@NonNull String str, @NonNull SurfaceView surfaceView) {
        if (!TextUtils.isEmpty(str)) {
            TELogUtil.i(TAG, "VEEditor surfaceView");
            this.mResManager = new VEEditorResManager(str);
            this.mSurfaceView = surfaceView;
            surfaceView.getHolder().addCallback(this.mSurfaceCallback);
            this.mVideoEditor.setOpenGLListeners(this.mOpenGLCallback);
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("workspace is: ");
        sb.append(str);
        throw new VEException(-100, sb.toString());
    }

    public VEEditor(@NonNull String str, @NonNull TextureView textureView) throws VEException {
        if (!TextUtils.isEmpty(str)) {
            TELogUtil.i(TAG, "VEEditor textureView");
            this.mResManager = new VEEditorResManager(str);
            this.mTextureView = textureView;
            textureView.setSurfaceTextureListener(this.mTextureListener);
            this.mVideoEditor.setOpenGLListeners(this.mOpenGLCallback);
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("workspace is: ");
        sb.append(str);
        throw new VEException(-100, sb.toString());
    }

    static /* synthetic */ int access$804(VEEditor vEEditor) {
        int i = vEEditor.miFrameCount + 1;
        vEEditor.miFrameCount = i;
        return i;
    }

    private synchronized int addWaterMark(Bitmap[] bitmapArr, int i, VESize vESize, int i2, int i3) {
        return 0;
    }

    private static boolean checkFileExists(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        return new File(str).exists();
    }

    /* access modifiers changed from: private */
    public synchronized void onMonitorCompile() {
        TEMonitor.perfLong(TEMonitorKeys.TETRACKER_KEY_COMPOSITION_TIME, System.currentTimeMillis() - this.mlCompileStartTime);
        if (checkFileExists(this.mOutputFile)) {
            int[] iArr = new int[10];
            if (TEVideoUtils.getVideoFileInfo(this.mOutputFile, iArr) == 0) {
                TEMonitor.perfDouble(TEMonitorKeys.TETRACKER_KEY_COMPOSITION_FILE_SIZE, (((double) new File(this.mOutputFile).length()) / 1024.0d) / 1024.0d);
                TEMonitor.perfDouble(TEMonitorKeys.TETRACKER_KEY_COMPOSITION_FILE_DURATION, (double) iArr[3]);
                TEMonitor.perfDouble(TEMonitorKeys.TETRACKER_KEY_COMPOSITION_BIT_RATE, (double) iArr[6]);
                TEMonitor.perfDouble(TEMonitorKeys.TETRACKER_KEY_COMPOSITION_FPS, (double) iArr[7]);
                String str = TEMonitorKeys.TETRACKER_KEY_COMPOSITION_RESOLUTION;
                StringBuilder sb = new StringBuilder();
                sb.append("");
                sb.append(iArr[0]);
                sb.append("x");
                sb.append(iArr[1]);
                TEMonitor.perfString(str, sb.toString());
            }
        }
        TEMonitor.report(TEMonitor.MONITOR_ACTION_COMPILE);
        VEKeyValue vEKeyValue = new VEKeyValue();
        vEKeyValue.add("iesve_veeditor_composition_finish_file", this.mCompileType).add("iesve_veeditor_composition_finish_result", "succ").add("iesve_veeditor_composition_finish_reason", "");
        MonitorUtils.monitorStatistics("iesve_veeditor_composition_finish", 1, vEKeyValue);
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0015, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void onSurfaceChanged(int i, int i2) {
        TELogUtil.i(TAG, "onSurfaceChanged...");
        if (i != 0) {
            if (i2 != 0) {
                this.mVideoEditor.setSurfaceSize(i, i2);
            }
        }
    }

    /* access modifiers changed from: private */
    public synchronized void onSurfaceCreated(Surface surface) {
        TELogUtil.i(TAG, "surfaceCreated...");
        this.mVideoEditor.setPreviewSurface(surface);
    }

    /* access modifiers changed from: private */
    public synchronized void onSurfaceDestroyed() {
        TELogUtil.d(TAG, "surfaceDestroyed...");
        this.mVideoEditor.releasePreviewSurface();
    }

    private synchronized void setAudioEffectParam(int i, int i2, int i3, VEAudioEffectBean vEAudioEffectBean) {
        if (!this.hasDestroyCalled) {
            TELogUtil.w(TAG, "setAudioEffectParam...");
            StringBuilder sb = new StringBuilder();
            sb.append("");
            sb.append(vEAudioEffectBean.type);
            this.mVideoEditor.setFilterParam(i3, "audioEffectType", sb.toString());
            this.mVideoEditor.setFilterParam(i3, "formatShiftOn", vEAudioEffectBean.formatShiftOn ? "1" : "0");
            this.mVideoEditor.setFilterParam(i3, "smoothOn", vEAudioEffectBean.smoothOn ? "1" : "0");
            StringBuilder sb2 = new StringBuilder();
            sb2.append("");
            sb2.append(vEAudioEffectBean.processChMode);
            this.mVideoEditor.setFilterParam(i3, "processChMode", sb2.toString());
            StringBuilder sb3 = new StringBuilder();
            sb3.append("");
            sb3.append(vEAudioEffectBean.transientDetectMode);
            this.mVideoEditor.setFilterParam(i3, "transientDetectMode", sb3.toString());
            StringBuilder sb4 = new StringBuilder();
            sb4.append("");
            sb4.append(vEAudioEffectBean.phaseResetMode);
            this.mVideoEditor.setFilterParam(i3, "phaseResetMode", sb4.toString());
            StringBuilder sb5 = new StringBuilder();
            sb5.append("");
            sb5.append(vEAudioEffectBean.phaseAdjustMethod);
            this.mVideoEditor.setFilterParam(i3, "phaseAdjustMethod", sb5.toString());
            StringBuilder sb6 = new StringBuilder();
            sb6.append("");
            sb6.append(vEAudioEffectBean.windowMode);
            this.mVideoEditor.setFilterParam(i3, "windowMode", sb6.toString());
            StringBuilder sb7 = new StringBuilder();
            sb7.append("");
            sb7.append(vEAudioEffectBean.pitchTunerMode);
            this.mVideoEditor.setFilterParam(i3, "pitchTunerMode", sb7.toString());
            StringBuilder sb8 = new StringBuilder();
            sb8.append("");
            sb8.append(vEAudioEffectBean.blockSize);
            this.mVideoEditor.setFilterParam(i3, "blockSize", sb8.toString());
            StringBuilder sb9 = new StringBuilder();
            sb9.append("");
            sb9.append(vEAudioEffectBean.centtone);
            this.mVideoEditor.setFilterParam(i3, "centtone", sb9.toString());
            StringBuilder sb10 = new StringBuilder();
            sb10.append("");
            sb10.append(vEAudioEffectBean.semiton);
            this.mVideoEditor.setFilterParam(i3, "semiton", sb10.toString());
            StringBuilder sb11 = new StringBuilder();
            sb11.append("");
            sb11.append(vEAudioEffectBean.octative);
            this.mVideoEditor.setFilterParam(i3, "octative", sb11.toString());
            StringBuilder sb12 = new StringBuilder();
            sb12.append("");
            sb12.append(vEAudioEffectBean.speedRatio);
            this.mVideoEditor.setFilterParam(i3, "speedRatio", sb12.toString());
        }
    }

    private synchronized void setBitrateOptions(VEVideoEncodeSettings vEVideoEncodeSettings) {
        if (!this.hasDestroyCalled) {
            this.mVideoEditor.setCompileSoftwareEncodeOptions(vEVideoEncodeSettings.getSwCRF(), vEVideoEncodeSettings.getSwMaxRate(), vEVideoEncodeSettings.getSwPreset(), vEVideoEncodeSettings.getSwQP());
            this.mVideoEditor.setCompileHardwareEncodeOptions(vEVideoEncodeSettings.getBps());
            this.mVideoEditor.setCompileCommonEncodeOptions(vEVideoEncodeSettings.getBitrateMode().ordinal(), vEVideoEncodeSettings.getEncodeProfile());
        }
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x004b, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void updateInitDisplaySize() {
        if (!this.hasDestroyCalled) {
            if (((float) this.mInitSize.width) / ((float) this.mInitSize.height) > ((float) this.mSurfaceWidth) / ((float) this.mSurfaceHeight)) {
                this.mInitDisplayWidth = this.mSurfaceWidth;
                this.mInitDisplayHeight = (int) (((float) this.mSurfaceWidth) / (((float) this.mInitSize.width) / ((float) this.mInitSize.height)));
            } else {
                this.mInitDisplayHeight = this.mSurfaceHeight;
                this.mInitDisplayWidth = (int) (((float) this.mSurfaceHeight) / (((float) this.mInitSize.height) / ((float) this.mInitSize.width)));
            }
        }
    }

    public synchronized int[] addAudioEffects(int i, int i2, int[] iArr, int[] iArr2, VEAudioEffectBean[] vEAudioEffectBeanArr) {
        if (this.hasDestroyCalled) {
            return null;
        }
        TELogUtil.w(TAG, "addAudioEffects...");
        int length = iArr.length;
        int[] iArr3 = new int[length];
        int[] iArr4 = new int[length];
        int[] iArr5 = new int[length];
        String[] strArr = new String[length];
        for (int i3 = 0; i3 < length; i3++) {
            iArr3[i3] = i;
            iArr4[i3] = i2;
            strArr[i3] = "audio effect";
            iArr5[i3] = 1;
        }
        int[] addFilters = this.mVideoEditor.addFilters(iArr3, strArr, iArr, iArr2, iArr4, iArr5);
        for (int i4 = 0; i4 < length; i4++) {
            setAudioEffectParam(i, i2, addFilters[i4], vEAudioEffectBeanArr[i4]);
        }
        return addFilters;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:23:0x0033, code lost:
        return -100;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:25:0x0035, code lost:
        return -100;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized int addAudioTrack(String str, int i, int i2, int i3, int i4, boolean z) {
        TELogUtil.i(TAG, "addAudioTrack...");
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (TextUtils.isEmpty(str)) {
            return -100;
        }
        if (i2 > i && i >= 0) {
            if (i4 > i3 && i3 >= 0) {
                return this.mVideoEditor.addAudioTrack(str, i3, i4, i, i2, z);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:26:0x003b, code lost:
        return -100;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:28:0x003d, code lost:
        return -100;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized int addAudioTrack(String str, int i, int i2, int i3, int i4, boolean z, int i5, int i6) {
        int i7 = i;
        int i8 = i3;
        synchronized (this) {
            if (this.hasDestroyCalled) {
                return VEResult.TER_INVALID_STAT;
            }
            TELogUtil.i(TAG, "addAudioTrack...");
            if (TextUtils.isEmpty(str)) {
                return -100;
            }
            int i9 = i2;
            if (i9 > i7 && i7 >= 0) {
                int i10 = i4;
                if (i10 > i8 && i8 >= 0) {
                    int addAudioTrack = this.mVideoEditor.addAudioTrack(str, i8, i10, i7, i9, z, i5, i6);
                    return addAudioTrack;
                }
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:22:0x0036, code lost:
        return -100;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized int addAudioTrack(String str, int i, int i2, boolean z) {
        TELogUtil.w(TAG, "addAudioTrack...");
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (TextUtils.isEmpty(str)) {
            return -100;
        }
        if (i2 > i && i >= 0) {
            MonitorUtils.monitorStatistics("iesve_veeditor_import_music", 1, null);
            return this.mVideoEditor.addAudioTrack(str, 0, i2 - i, i, i2, z);
        }
    }

    public synchronized int addEqualizer(int i, int i2, int i3, int i4, int i5) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        int[] addFilters = this.mVideoEditor.addFilters(new int[]{i}, new String[]{"audio equalizer"}, new int[]{i4}, new int[]{i5}, new int[]{i2}, new int[]{1});
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i3);
        this.mVideoEditor.setFilterParam(addFilters[0], "preset_id", sb.toString());
        return addFilters[0];
    }

    public synchronized int addExtRes(String str, int i, int i2, int i3, int i4, float f, float f2, float f3, float f4) {
        int i5 = i;
        int i6 = i2;
        synchronized (this) {
            TELogUtil.w(TAG, "addSticker...");
            if (this.hasDestroyCalled) {
                return VEResult.TER_INVALID_STAT;
            }
            if (i5 <= i6 && i5 >= 0) {
                if (!TextUtils.isEmpty(str)) {
                    MonitorUtils.monitorStatistics("iesve_veeditor_import_sticker", 1, null);
                    int[] iArr = {i5};
                    int addSticker = this.mVideoEditor.addSticker(new String[]{str}, null, iArr, new int[]{i6}, new int[]{i3}, new int[]{i4}, (double) f3, (double) f4, (double) f, (double) f2);
                    return addSticker;
                }
            }
            return -100;
        }
    }

    public synchronized int[] addFilterEffects(int[] iArr, int[] iArr2, String[] strArr) {
        if (this.hasDestroyCalled) {
            return null;
        }
        int length = iArr.length;
        int[] iArr3 = new int[length];
        int[] iArr4 = new int[length];
        int[] iArr5 = new int[length];
        String[] strArr2 = new String[length];
        for (int i = 0; i < length; i++) {
            iArr3[i] = 0;
            iArr4[i] = 0;
            strArr2[i] = "filter effect";
            iArr5[i] = 8;
        }
        int[] addFilters = this.mVideoEditor.addFilters(iArr3, strArr2, iArr, iArr2, iArr4, iArr5);
        if (length != addFilters.length) {
            int[] iArr6 = new int[length];
            Arrays.fill(iArr6, -1);
            return iArr6;
        }
        for (int i2 = 0; i2 < length; i2++) {
            this.mVideoEditor.setFilterParam(addFilters[i2], EFFECT_RES_PATH, strArr[i2]);
        }
        return addFilters;
    }

    public synchronized int addInfoSticker(String str, @Nullable String[] strArr) {
        TELogUtil.i(TAG, "addInfoSticker...");
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (TextUtils.isEmpty(str)) {
            return -100;
        }
        MonitorUtils.monitorStatistics("iesve_veeditor_import_sticker", 1, null);
        return this.mVideoEditor.addInfoSticker(str, strArr);
    }

    public synchronized int addMetadata(String str, String str2) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        TELogUtil.w(TAG, "addMetadata...");
        if (!TextUtils.isEmpty(str)) {
            if (!TextUtils.isEmpty(str2)) {
                this.mVideoEditor.addMetaData(str, str2);
                return 0;
            }
        }
        return -100;
    }

    public synchronized int addPitchTempo(int i, int i2, float f, float f2, int i3, int i4) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        int[] addFilters = this.mVideoEditor.addFilters(new int[]{i}, new String[]{"audio pitch tempo"}, new int[]{i3}, new int[]{i4}, new int[]{i2}, new int[]{1});
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(f);
        this.mVideoEditor.setFilterParam(addFilters[0], "pitch_scale", sb.toString());
        StringBuilder sb2 = new StringBuilder();
        sb2.append("");
        sb2.append(f2);
        this.mVideoEditor.setFilterParam(addFilters[0], "time_ratio", sb2.toString());
        return addFilters[0];
    }

    public synchronized int addRepeatEffect(int i, int i2, int i3, int i4, int i5) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("addRepeatEffect... ");
        sb.append(i);
        sb.append(" ");
        sb.append(i2);
        sb.append(" ");
        sb.append(i3);
        sb.append(" ");
        sb.append(i4);
        sb.append(" ");
        sb.append(i5);
        TELogUtil.w(str, sb.toString());
        int pauseSync = this.mVideoEditor.pauseSync();
        if (pauseSync != 0) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("pauseSync failed, ret ");
            sb2.append(pauseSync);
            TELogUtil.i(str2, sb2.toString());
            return -1;
        }
        int duration = getDuration();
        int[] addFilters = this.mVideoEditor.addFilters(new int[]{i}, new String[]{"timeEffect repeating"}, new int[]{i3}, new int[]{duration}, new int[]{i2}, new int[]{6});
        this.mAudioEffectfilterIndex = addFilters[0];
        StringBuilder sb3 = new StringBuilder();
        sb3.append("");
        sb3.append(i5);
        this.mVideoEditor.setFilterParam(addFilters[0], "timeEffect repeating duration", sb3.toString());
        StringBuilder sb4 = new StringBuilder();
        sb4.append("");
        sb4.append(i4);
        this.mVideoEditor.setFilterParam(addFilters[0], "timeEffect repeating times", sb4.toString());
        this.mVideoEditor.createTimeline();
        VEKeyValue vEKeyValue = new VEKeyValue();
        vEKeyValue.add("iesve_veeditor_time_effect_id", "repeat");
        MonitorUtils.monitorStatistics("iesve_veeditor_time_effect", 1, vEKeyValue);
        return addFilters[0];
    }

    public synchronized int addReverb(int i, int i2, float f, float f2, float f3, float f4, float f5, int i3, int i4) {
        synchronized (this) {
            if (this.hasDestroyCalled) {
                return VEResult.TER_INVALID_STAT;
            }
            int[] addFilters = this.mVideoEditor.addFilters(new int[]{i}, new String[]{"audio reverb"}, new int[]{i3}, new int[]{i4}, new int[]{i2}, new int[]{1});
            StringBuilder sb = new StringBuilder();
            sb.append("");
            sb.append(f);
            this.mVideoEditor.setFilterParam(addFilters[0], "room_size", sb.toString());
            StringBuilder sb2 = new StringBuilder();
            sb2.append("");
            sb2.append(f2);
            this.mVideoEditor.setFilterParam(addFilters[0], "hfDamping", sb2.toString());
            StringBuilder sb3 = new StringBuilder();
            sb3.append("");
            sb3.append(f3);
            this.mVideoEditor.setFilterParam(addFilters[0], "stereoDepth", sb3.toString());
            StringBuilder sb4 = new StringBuilder();
            sb4.append("");
            sb4.append(f4);
            this.mVideoEditor.setFilterParam(addFilters[0], "dry", sb4.toString());
            StringBuilder sb5 = new StringBuilder();
            sb5.append("");
            sb5.append(f5);
            this.mVideoEditor.setFilterParam(addFilters[0], "wet", sb5.toString());
            int i5 = addFilters[0];
            return i5;
        }
    }

    public synchronized int[] addSegmentVolume(int[] iArr, int[] iArr2, int[] iArr3, int[] iArr4, float[] fArr) {
        if (this.hasDestroyCalled) {
            return null;
        }
        int length = iArr3.length;
        String[] strArr = new String[length];
        int[] iArr5 = new int[length];
        for (int i = 0; i < length; i++) {
            strArr[i] = "audio volume filter";
            iArr5[i] = 1;
        }
        int[] addFilters = this.mVideoEditor.addFilters(iArr, strArr, iArr3, iArr4, iArr2, iArr5);
        for (int i2 = 0; i2 < length; i2++) {
            TEInterface tEInterface = this.mVideoEditor;
            int i3 = addFilters[i2];
            String str = AUDIO_VOLUME;
            StringBuilder sb = new StringBuilder();
            sb.append("");
            sb.append(fArr[i2]);
            tEInterface.setFilterParam(i3, str, sb.toString());
        }
        return addFilters;
    }

    public synchronized int addSlowMotionEffect(int i, int i2, int i3, int i4, float f, float f2) {
        int i5 = i;
        int i6 = i2;
        int i7 = i3;
        int i8 = i4;
        float f3 = f;
        float f4 = f2;
        synchronized (this) {
            if (this.hasDestroyCalled) {
                return VEResult.TER_INVALID_STAT;
            }
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("addSlowMotionEffect... ");
            sb.append(i5);
            sb.append(" ");
            sb.append(i6);
            sb.append(" ");
            sb.append(i7);
            sb.append(" ");
            sb.append(i8);
            sb.append(" ");
            sb.append(f3);
            sb.append(" ");
            sb.append(f4);
            TELogUtil.w(str, sb.toString());
            int pauseSync = this.mVideoEditor.pauseSync();
            if (pauseSync != 0) {
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("pauseSync failed, ret ");
                sb2.append(pauseSync);
                TELogUtil.w(str2, sb2.toString());
                return -1;
            }
            int duration = getDuration();
            int[] addFilters = this.mVideoEditor.addFilters(new int[]{i5}, new String[]{"timeEffect slow motion"}, new int[]{i7}, new int[]{duration}, new int[]{i6}, new int[]{6});
            this.mAudioEffectfilterIndex = addFilters[0];
            StringBuilder sb3 = new StringBuilder();
            sb3.append("");
            sb3.append(i8);
            this.mVideoEditor.setFilterParam(addFilters[0], "timeEffect slow motion duration", sb3.toString());
            StringBuilder sb4 = new StringBuilder();
            sb4.append("");
            sb4.append(f3);
            this.mVideoEditor.setFilterParam(addFilters[0], "timeEffect slow motion speed", sb4.toString());
            StringBuilder sb5 = new StringBuilder();
            sb5.append("");
            sb5.append(f4);
            this.mVideoEditor.setFilterParam(addFilters[0], "timeEffect fast motion speed", sb5.toString());
            this.mVideoEditor.createTimeline();
            VEKeyValue vEKeyValue = new VEKeyValue();
            vEKeyValue.add("iesve_veeditor_time_effect_id", CameraSettings.VIDEO_SPEED_SLOW);
            MonitorUtils.monitorStatistics("iesve_veeditor_time_effect", 1, vEKeyValue);
            int i9 = addFilters[0];
            return i9;
        }
    }

    public synchronized int addSticker(String str, int i, int i2, int i3, int i4, float f, float f2, float f3, float f4) {
        int i5 = i;
        int i6 = i2;
        synchronized (this) {
            TELogUtil.w(TAG, "addSticker...");
            if (this.hasDestroyCalled) {
                return VEResult.TER_INVALID_STAT;
            }
            if (i5 <= i6 && i5 >= 0) {
                if (!TextUtils.isEmpty(str)) {
                    MonitorUtils.monitorStatistics("iesve_veeditor_import_sticker", 1, null);
                    int[] iArr = {i5};
                    int addSticker = this.mVideoEditor.addSticker(new String[]{str}, null, iArr, new int[]{i6}, new int[]{i3}, new int[]{i4}, (double) f3, (double) f4, (double) f, (double) f2);
                    return addSticker;
                }
            }
            return -100;
        }
    }

    public synchronized int addWaterMark(String str, double d, double d2, double d3, double d4) {
        synchronized (this) {
            TELogUtil.w(TAG, "addWaterMark...");
            if (this.hasDestroyCalled) {
                return VEResult.TER_INVALID_STAT;
            }
            int addWaterMark = this.mVideoEditor.addWaterMark(new String[]{str}, null, new int[]{0}, new int[]{this.mVideoEditor.getDuration()}, d3, d4, d, d2);
            return addWaterMark;
        }
    }

    public synchronized int addWaterMarkForGifHigh(String str, double d, double d2, double d3, double d4) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        this.waterMarkFile = str;
        this.waterMarkWidth = d;
        this.waterMarkHeight = d2;
        this.waterMarkOffsetX = d3;
        this.waterMarkOffsetY = d4;
        return 0;
    }

    public synchronized int cancelReverseVideo() {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (this.mReverseDone) {
            return VEResult.TER_INVALID_STAT;
        }
        new FFMpegInvoker().stopReverseVideo();
        this.mCancelReverse = true;
        return 0;
    }

    public synchronized int changeRes(String[] strArr, int[] iArr, int[] iArr2, String[] strArr2, String[] strArr3, int[] iArr3, int[] iArr4, VIDEO_RATIO video_ratio) throws VEException {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        TELogUtil.i(TAG, "reInit...");
        int stop = this.mVideoEditor.stop();
        if (stop != 0) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("stop in changeRes failed, ret = ");
            sb.append(stop);
            TELogUtil.i(str, sb.toString());
            return -1;
        }
        int init2 = init2(strArr, iArr, iArr2, strArr2, strArr3, iArr3, iArr4, video_ratio);
        if (init2 != 0) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("init2 in changeRes failed, ret = ");
            sb2.append(init2);
            TELogUtil.e(str2, sb2.toString());
            return init2;
        }
        this.mVideoEditor.createTimeline();
        this.mInPoint = 0;
        this.mOutPoint = this.mVideoEditor.getDuration();
        return this.mVideoEditor.prepareEngine(this.mInPoint, this.mOutPoint, -1, this.mModelsDir);
    }

    public synchronized void clearDisplay(int i) {
        if (!this.hasDestroyCalled) {
            this.mVideoEditor.clearDisplay(i);
        }
    }

    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void compile(String str, String str2, VEVideoEncodeSettings vEVideoEncodeSettings) {
        if (!this.hasDestroyCalled) {
            String str3 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("VEEditor.compile(outFilePath = ");
            sb.append(str);
            TELogUtil.d(str3, sb.toString());
            if (str == null) {
                TELogUtil.e(TAG, "IllegalArgumentError: outFilePath == null");
            } else if (vEVideoEncodeSettings == null) {
                TELogUtil.e(TAG, "IllegalArgumentError: VEVideoEncodeSettings == null");
            } else if (this.mVideoEditor.getNativeHandler() != 0) {
                this.mOutputFile = str;
                this.mlCompileStartTime = System.currentTimeMillis();
                TELogUtil.w(TAG, "compile...");
                this.mVideoEditor.stop();
                switch (vEVideoEncodeSettings.getCompileType()) {
                    case COMPILE_TYPE_MP4:
                        this.mVideoEditor.setCompileType(1);
                        this.mCompileType = "mp4";
                    case COMPILE_TYPE_GIF:
                        this.mVideoEditor.setCompileType(2);
                        this.mCompileType = "gif";
                    case COMPILE_TYPE_HIGH_GIF:
                        if (this.mp4ToGIFConverter == null || !this.mp4ToGIFConverter.mIsRunning) {
                            this.mBCompileHighQualityGif = true;
                            this.mVideoEditor.setCompileType(4);
                            if (this.mp4ToGIFConverter == null) {
                                this.mp4ToGIFConverter = new Mp4ToHighQualityGIFConverter();
                            }
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append(new File(this.mOutputFile).getParent());
                            sb2.append(File.separatorChar);
                            sb2.append("gif.mp4");
                            str = sb2.toString();
                            this.mp4ToGIFConverter.setInputFile(str);
                            this.mp4ToGIFConverter.setOutputFile(this.mOutputFile);
                            this.mp4ToGIFConverter.setWaterMarkFile(this.waterMarkFile);
                            this.mp4ToGIFConverter.setWaterMarkWidth((int) (this.waterMarkWidth * ((double) vEVideoEncodeSettings.getVideoRes().width)));
                            this.mp4ToGIFConverter.setWaterMarkHeight((int) (this.waterMarkHeight * ((double) vEVideoEncodeSettings.getVideoRes().height)));
                            this.mp4ToGIFConverter.setWaterMarkOffsetX((int) (this.waterMarkOffsetX * ((double) vEVideoEncodeSettings.getVideoRes().width)));
                            this.mp4ToGIFConverter.setWaterMarkOffsetY((int) (this.waterMarkOffsetY * ((double) vEVideoEncodeSettings.getVideoRes().height)));
                            this.mCompileType = "high_gif";
                        } else {
                            return;
                        }
                        break;
                    default:
                        this.mVideoEditor.setCompileType(1);
                        this.mCompileType = "mp4";
                }
                this.mVideoEditor.setCompileFps(vEVideoEncodeSettings.getFps());
                setBitrateOptions(vEVideoEncodeSettings);
                this.mVideoEditor.setEngineCompilePath(str, str2);
                this.mVideoEditor.setResizer(vEVideoEncodeSettings.getResizeMode(), vEVideoEncodeSettings.getResizeX(), vEVideoEncodeSettings.getResizeY());
                this.mVideoEditor.setUsrRotate(vEVideoEncodeSettings.getRotate());
                this.mVideoEditor.setUseHwEnc(vEVideoEncodeSettings.isHwEnc());
                this.mVideoEditor.setEncGopSize(vEVideoEncodeSettings.getGopSize());
                this.mVideoEditor.setSpeedRatio(vEVideoEncodeSettings.getSpeed());
                this.mVideoEditor.setWidthHeight(vEVideoEncodeSettings.getVideoRes().width, vEVideoEncodeSettings.getVideoRes().height);
                VEWatermarkParam watermarkParam = vEVideoEncodeSettings.getWatermarkParam();
                if (watermarkParam != null && watermarkParam.needExtFile) {
                    this.mVideoEditor.setCompileWatermark(watermarkParam);
                    if (this.mVideoEditor.prepareEngine(this.mInPoint, this.mOutPoint, 2, this.mModelsDir) != 0) {
                        return;
                    }
                } else if (this.mVideoEditor.prepareEngine(this.mInPoint, this.mOutPoint, 1, this.mModelsDir) != 0) {
                    return;
                }
                if (watermarkParam != null) {
                    this.mVideoEditor.setWaterMark(watermarkParam.images, watermarkParam.interval, watermarkParam.xOffset, watermarkParam.yOffset, watermarkParam.width, watermarkParam.height);
                }
                this.mVideoEditor.start();
                VEKeyValue vEKeyValue = new VEKeyValue();
                vEKeyValue.add("iesve_veeditor_composition_start_file", this.mCompileType);
                MonitorUtils.monitorStatistics("iesve_veeditor_composition_start", 1, vEKeyValue);
            }
        }
    }

    public synchronized int deleteAudioFilters(int[] iArr) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        TELogUtil.w(TAG, "deleteAudioFilter...");
        return this.mVideoEditor.removeFilter(iArr);
    }

    public synchronized int deleteAudioTrack(int i) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        TELogUtil.w(TAG, "deleteAudioTrack...");
        if (i < 0) {
            return -100;
        }
        return this.mVideoEditor.deleteAudioTrack(i);
    }

    public synchronized int deleteFilterEffects(int[] iArr) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        return this.mVideoEditor.removeFilter(iArr);
    }

    public synchronized int deleteRepeatEffect(int i) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("deleteRepeatEffect... ");
        sb.append(i);
        TELogUtil.w(str, sb.toString());
        int pauseSync = this.mVideoEditor.pauseSync();
        if (pauseSync != 0) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("pauseSync failed, ret ");
            sb2.append(pauseSync);
            TELogUtil.i(str2, sb2.toString());
            return -1;
        }
        int removeFilter = this.mVideoEditor.removeFilter(new int[]{i});
        this.mVideoEditor.createTimeline();
        return removeFilter;
    }

    public synchronized int deleteSlowEffect(int i) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("deleteSlowEffect... ");
        sb.append(i);
        TELogUtil.w(str, sb.toString());
        int pauseSync = this.mVideoEditor.pauseSync();
        if (pauseSync != 0) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("pauseSync failed, ret ");
            sb2.append(pauseSync);
            TELogUtil.w(str2, sb2.toString());
            return -1;
        }
        int removeFilter = this.mVideoEditor.removeFilter(new int[]{i});
        this.mVideoEditor.createTimeline();
        return removeFilter;
    }

    public synchronized int deleteSticker(int i) {
        TELogUtil.w(TAG, "deleteSticker...");
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (i < 0) {
            return -100;
        }
        return this.mVideoEditor.deleteSticker(i);
    }

    public synchronized int deleteWaterMark(int i) {
        return 0;
    }

    public synchronized void destroy() {
        this.hasDestroyCalled = true;
        TELogUtil.i(TAG, "onDestroy...");
        if (this.mVideoEditor.getNativeHandler() != 0) {
            if (this.mSurfaceView != null) {
                this.mSurfaceView.getHolder().removeCallback(this.mSurfaceCallback);
            } else if (this.mTextureView != null && this.mTextureView.getSurfaceTextureListener() == this.mTextureListener) {
                this.mTextureView.setSurfaceTextureListener(null);
            }
            this.mSurfaceView = null;
            this.mTextureView = null;
            if (this.mVideoEditor != null) {
                this.mVideoEditor.setOpenGLListeners(null);
                this.mVideoEditor.setInfoListener(null);
                this.mVideoEditor.setErrorListener(null);
                this.mVideoEditor.destroyEngine();
            }
            this.mResManager = null;
        }
    }

    public synchronized int disableAudioEffect(int i, int i2) {
        TELogUtil.w(TAG, "disableAudioEffect...");
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (i == -1) {
            return -100;
        }
        return this.mVideoEditor.adjustFilterInOut(i, -1, i2);
    }

    public synchronized int disableFilterEffect(int i, int i2) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (i < 0 || i2 < 0) {
            return -100;
        }
        return this.mVideoEditor.adjustFilterInOut(i, -1, i2);
    }

    public synchronized int enableAudioEffect(int i, int i2, int i3, VEAudioEffectBean vEAudioEffectBean) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        TELogUtil.w(TAG, "enableAudioEffect...");
        int duration = getDuration();
        int[] addFilters = this.mVideoEditor.addFilters(new int[]{i}, new String[]{"audio effect"}, new int[]{i3}, new int[]{duration}, new int[]{i2}, new int[]{1});
        this.mAudioEffectfilterIndex = addFilters[0];
        setAudioEffectParam(i, i2, addFilters[0], vEAudioEffectBean);
        return addFilters[0];
    }

    @Deprecated
    public synchronized int enableAudioEffect(int i, VEAudioEffectBean vEAudioEffectBean) {
        TELogUtil.w(TAG, "enableAudioEffect...");
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        this.mAudioEffectfilterIndex = enableAudioEffect(0, this.mbSeparateAV.booleanValue() ? 1 : 0, i, vEAudioEffectBean);
        return this.mAudioEffectfilterIndex;
    }

    public synchronized int enableFilterEffect(int i, String str) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (i >= 0) {
            if (i <= getDuration()) {
                if (!TextUtils.isEmpty(str)) {
                    int duration = getDuration();
                    int[] addFilters = this.mVideoEditor.addFilters(new int[]{0}, new String[]{"video effect"}, new int[]{i}, new int[]{duration}, new int[]{0}, new int[]{8});
                    this.mVideoEditor.setFilterParam(addFilters[0], EFFECT_RES_PATH, str);
                    VEKeyValue vEKeyValue = new VEKeyValue();
                    String str2 = "";
                    if (!TextUtils.isEmpty(str)) {
                        String[] split = str.split(File.separator);
                        if (split.length > 0) {
                            str2 = split[split.length - 1];
                        }
                    }
                    vEKeyValue.add("iesve_veeditor_filter_effect_id", str2);
                    MonitorUtils.monitorStatistics("iesve_veeditor_filter_effect", 1, vEKeyValue);
                    return addFilters[0];
                }
            }
        }
        return -100;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:39:0x008e, code lost:
        return 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:41:0x0090, code lost:
        return com.ss.android.vesdk.VEResult.TER_INVALID_STAT;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized int enableReversePlay(boolean z) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (!this.mReverseDone) {
            return -100;
        }
        if (!(this.mResManager == null || this.mResManager.mReverseVideoPath == null)) {
            if (this.mResManager.mReverseVideoPath.length > 0) {
                this.mVideoEditor.stop();
                int updateTrackClips = this.mVideoEditor.updateTrackClips(0, 0, z ? this.mResManager.mReverseVideoPath : this.mResManager.mVideoPaths);
                if (updateTrackClips != 0) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Create Scene failed, ret = ");
                    sb.append(updateTrackClips);
                    TELogUtil.e(str, sb.toString());
                    return updateTrackClips;
                }
                this.mVideoEditor.updateTrackFilter(0, 0, z != this.mBReversePlay);
                this.mVideoEditor.createTimeline();
                this.mVideoEditor.prepareEngine(0, this.mVideoEditor.getDuration(), 0, this.mModelsDir);
                seek(0, SEEK_MODE.EDITOR_SEEK_FLAG_LastSeek);
                this.mBReversePlay = z;
                if (z) {
                    VEKeyValue vEKeyValue = new VEKeyValue();
                    vEKeyValue.add("iesve_veeditor_time_effect_id", "reverse");
                    MonitorUtils.monitorStatistics("iesve_veeditor_time_effect", 1, vEKeyValue);
                }
            }
        }
    }

    public synchronized int genReverseVideo() throws VEException {
        if (this.hasDestroyCalled) {
            return -1;
        }
        TELogUtil.d(TAG, "reverse...");
        VEEditorResManager vEEditorResManager = this.mResManager;
        if (vEEditorResManager == null) {
            TELogUtil.e(TAG, "reverse may be canceled");
            return -1;
        }
        if (vEEditorResManager.mVideoPaths != null) {
            if (vEEditorResManager.mVideoPaths.length > 0) {
                FFMpegInvoker fFMpegInvoker = new FFMpegInvoker();
                vEEditorResManager.mReverseVideoPath = new String[vEEditorResManager.mVideoPaths.length];
                int i = 0;
                while (i < vEEditorResManager.mVideoPaths.length) {
                    String genReverseVideoPath = vEEditorResManager.genReverseVideoPath(i);
                    int addFastReverseVideo = fFMpegInvoker.addFastReverseVideo(vEEditorResManager.mVideoPaths[i], genReverseVideoPath);
                    if (this.mCancelReverse) {
                        this.mCancelReverse = false;
                        TELogUtil.e(TAG, "reverse failed, reverse has been canceled");
                        return -1;
                    } else if (addFastReverseVideo != 0) {
                        String str = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("reverse mResManager.mVideoPaths[");
                        sb.append(i);
                        sb.append("] failed: ");
                        sb.append(addFastReverseVideo);
                        TELogUtil.e(str, sb.toString());
                        return -1;
                    } else {
                        vEEditorResManager.mReverseVideoPath[i] = genReverseVideoPath;
                        i++;
                    }
                }
                this.mReverseDone = true;
                return 0;
            }
        }
        return -100;
    }

    public synchronized void genReverseVideoAsync(@NonNull final VEReverseCallback vEReverseCallback) {
        if (!this.hasDestroyCalled) {
            this.mPool.execute(new Runnable() {
                public void run() {
                    VEEditorResManager access$1400 = VEEditor.this.mResManager;
                    if (access$1400 == null) {
                        vEReverseCallback.onReverseFinish(-1);
                        TELogUtil.e(VEEditor.TAG, "reverse may be canceled");
                        return;
                    }
                    if (access$1400.mVideoPaths == null || access$1400.mVideoPaths.length <= 0) {
                        TELogUtil.e(VEEditor.TAG, "reverse failed, invalid params!");
                        vEReverseCallback.onReverseFinish(-100);
                    }
                    FFMpegInvoker fFMpegInvoker = new FFMpegInvoker();
                    access$1400.mReverseVideoPath = new String[access$1400.mVideoPaths.length];
                    int i = 0;
                    while (i < access$1400.mVideoPaths.length) {
                        String genReverseVideoPath = access$1400.genReverseVideoPath(i);
                        int addFastReverseVideo = fFMpegInvoker.addFastReverseVideo(access$1400.mVideoPaths[i], genReverseVideoPath);
                        if (VEEditor.this.mCancelReverse) {
                            TELogUtil.e(VEEditor.TAG, "reverse failed, reverse has been canceled");
                            VEEditor.this.mCancelReverse = false;
                            vEReverseCallback.onReverseFinish(-1);
                            return;
                        } else if (addFastReverseVideo != 0) {
                            vEReverseCallback.onReverseFinish(-1);
                            String str = VEEditor.TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("reverse mResManager.mVideoPaths[");
                            sb.append(i);
                            sb.append("] failed: ");
                            sb.append(addFastReverseVideo);
                            TELogUtil.e(str, sb.toString());
                            return;
                        } else {
                            access$1400.mReverseVideoPath[i] = genReverseVideoPath;
                            i++;
                        }
                    }
                    VEEditor.this.mReverseDone = true;
                    vEReverseCallback.onReverseFinish(0);
                }
            });
        }
    }

    public synchronized int getCurPosition() {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        return this.mVideoEditor.getCurPosition();
    }

    public synchronized Bitmap getCurrDisplayImage() {
        if (this.hasDestroyCalled) {
            return null;
        }
        VERect displayRect = this.mVideoEditor.getDisplayRect();
        ByteBuffer allocateDirect = ByteBuffer.allocateDirect(displayRect.width * displayRect.height * 4);
        int displayImage = this.mVideoEditor.getDisplayImage(allocateDirect.array());
        if (displayImage != 0) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("getDisplayImage failed ");
            sb.append(displayImage);
            TELogUtil.e(str, sb.toString());
            return null;
        }
        Bitmap createBitmap = Bitmap.createBitmap(displayRect.width, displayRect.height, Config.ARGB_8888);
        createBitmap.copyPixelsFromBuffer(allocateDirect);
        return createBitmap;
    }

    public synchronized int getDuration() {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        return this.mVideoEditor.getDuration();
    }

    public synchronized float[] getInfoStickerBoundingBox(int i) throws VEException {
        TELogUtil.i(TAG, "getInfoStickerBoundingBox...");
        if (this.hasDestroyCalled) {
            return null;
        }
        if (i >= 0) {
            return this.mVideoEditor.getInfoStickerBoundingBox(i);
        }
        throw new VEException(-100, "");
    }

    public synchronized VESize getInitSize() {
        return new VESize(this.mInitDisplayWidth, this.mInitDisplayHeight);
    }

    public synchronized String[] getReverseVideoPaths() {
        if (this.hasDestroyCalled) {
            return null;
        }
        if (!this.mReverseDone) {
            return null;
        }
        return this.mResManager.mReverseVideoPath;
    }

    public synchronized VEState getState() throws VEException {
        int curState;
        if (this.mVideoEditor != null) {
            curState = this.mVideoEditor.getCurState();
            if (curState != -1) {
            } else {
                throw new VEException(VEResult.TER_INVALID_STAT, " native video editor is null");
            }
        } else {
            throw new VEException(VEResult.TER_INVALID_STAT, "video editor is null");
        }
        return VEState.valueOf(curState);
    }

    public synchronized float getVolume(int i, int i2, int i3) {
        TELogUtil.w(TAG, "getVolume...");
        if (this.hasDestroyCalled) {
            return -105.0f;
        }
        if (i3 >= 0) {
            if (i3 <= getDuration()) {
                return this.mVideoEditor.getTrackVolume(i2, i, i3);
            }
        }
        return -100.0f;
    }

    public synchronized int init(String[] strArr, String[] strArr2, String[] strArr3, VIDEO_RATIO video_ratio) throws VEException {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        TELogUtil.d(TAG, COMMIT_VERISION);
        TELogUtil.i(TAG, "init...");
        int createScene = this.mVideoEditor.createScene(this.mResManager.getWorkspace(), strArr, strArr3, strArr2, null, video_ratio.ordinal());
        if (createScene != 0) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Create Scene failed, ret = ");
            sb.append(createScene);
            TELogUtil.e(str, sb.toString());
            return createScene;
        }
        this.mReverseDone = false;
        this.mVideoOutRes = video_ratio;
        this.mResManager.mAudioPaths = strArr3;
        this.mResManager.mVideoPaths = strArr;
        this.mResManager.mTransitions = strArr2;
        boolean z = (strArr3 == null || strArr3.length == 0) ? false : true;
        this.mbSeparateAV = Boolean.valueOf(z);
        this.mMasterTrackIndex = 0;
        this.mInPoint = 0;
        this.mOutPoint = getDuration();
        try {
            this.mModelsDir = VERuntime.getInstance().getEnv().getDetectModelsDir();
            this.mColorFilterIndex = this.mVideoEditor.addFilters(new int[]{0}, new String[]{"color filter"}, new int[]{0}, new int[]{this.mOutPoint}, new int[]{0}, new int[]{7})[0];
            return createScene;
        } catch (NullPointerException e) {
            throw new VEException(-1, "init failed: VESDK need to be init");
        }
    }

    public synchronized int init2(String[] strArr, int[] iArr, int[] iArr2, String[] strArr2, String[] strArr3, int[] iArr3, int[] iArr4, VIDEO_RATIO video_ratio) throws VEException {
        String[] strArr4 = strArr3;
        synchronized (this) {
            if (this.hasDestroyCalled) {
                return VEResult.TER_INVALID_STAT;
            }
            TELogUtil.i(TAG, "init...");
            int createScene2 = this.mVideoEditor.createScene2(strArr, iArr, iArr2, strArr4, iArr3, iArr4, strArr2, null, video_ratio.ordinal());
            if (createScene2 != 0) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Create Scene failed, ret = ");
                sb.append(createScene2);
                TELogUtil.e(str, sb.toString());
                return createScene2;
            }
            this.mReverseDone = false;
            this.mVideoOutRes = video_ratio;
            this.mResManager.mAudioPaths = strArr4;
            this.mResManager.mVideoPaths = strArr;
            this.mResManager.mTransitions = strArr2;
            boolean z = (strArr4 == null || strArr4.length == 0) ? false : true;
            this.mbSeparateAV = Boolean.valueOf(z);
            this.mMasterTrackIndex = 0;
            this.mInPoint = 0;
            this.mOutPoint = getDuration();
            try {
                this.mModelsDir = VERuntime.getInstance().getEnv().getDetectModelsDir();
                this.mColorFilterIndex = this.mVideoEditor.addFilters(new int[]{0}, new String[]{"color filter"}, new int[]{0}, new int[]{this.mOutPoint}, new int[]{0}, new int[]{7})[0];
                return createScene2;
            } catch (NullPointerException e) {
                throw new VEException(-1, "init failed: VESDK need to be init");
            }
        }
    }

    public synchronized void invalidate() {
        if (!this.hasDestroyCalled) {
            this.mVideoEditor.setDisplayState(-1.0f, -1.0f, -1.0f, -1.0f, -80000, -80000, true);
        }
    }

    public synchronized void onFrameAvailable(SurfaceTexture surfaceTexture) {
        TELogUtil.v(TAG, "onFrameAvailable...");
    }

    public synchronized int pause() {
        TELogUtil.w(TAG, "pause...");
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        return this.mVideoEditor.pause();
    }

    public synchronized int pauseSync() {
        TELogUtil.i(TAG, "pauseSync...");
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        return this.mVideoEditor.pauseSync();
    }

    public synchronized int play() {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        TELogUtil.w(TAG, "play...");
        return this.mVideoEditor.start();
    }

    public synchronized int prepare() {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        TELogUtil.i(TAG, "prepare...");
        if (TextUtils.isEmpty(this.mModelsDir)) {
            this.mModelsDir = "";
            TELogUtil.w(TAG, "model dir is empty");
        }
        int prepareEngine = this.mVideoEditor.prepareEngine(0, this.mVideoEditor.getDuration(), 0, this.mModelsDir);
        int[] initResolution = this.mVideoEditor.getInitResolution();
        this.mInitSize.width = initResolution[0];
        this.mInitSize.height = initResolution[1];
        setBackgroundColor(this.mBackGroundColor);
        return prepareEngine;
    }

    public synchronized int removeInfoSticker(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("removeInfoSticker... index: ");
        sb.append(i);
        TELogUtil.i(str, sb.toString());
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (i < 0) {
            return -100;
        }
        return this.mVideoEditor.removeInfoSticker(i);
    }

    public synchronized int removeSegmentVolume(int i) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (i < 0) {
            return -100;
        }
        return this.mVideoEditor.removeFilter(new int[]{i});
    }

    public synchronized boolean restore(@NonNull VEEditorModel vEEditorModel) {
        if (this.hasDestroyCalled) {
            return false;
        }
        String str = vEEditorModel.projectXML;
        if (!checkFileExists(str)) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("projectXML not exists: ");
            sb.append(str);
            TELogUtil.e(str2, sb.toString());
            return false;
        }
        int restore = this.mVideoEditor.restore(str);
        if (restore < 0) {
            String str3 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("video editor restore failed: result: ");
            sb2.append(restore);
            sb2.append(", project xml: ");
            sb2.append(str);
            TELogUtil.e(str3, sb2.toString());
            return false;
        }
        this.mInPoint = vEEditorModel.inPoint;
        this.mOutPoint = vEEditorModel.outputPoint;
        this.mReverseDone = vEEditorModel.reverseDone;
        this.mVideoOutRes = vEEditorModel.videoOutRes;
        this.mbSeparateAV = Boolean.valueOf(vEEditorModel.separateAV);
        this.mMasterTrackIndex = vEEditorModel.masterTrackIndex;
        this.mAudioEffectfilterIndex = vEEditorModel.audioEffectFilterIndex;
        this.mModelsDir = vEEditorModel.modelDir;
        this.mColorFilterIndex = vEEditorModel.colorFilterIndex;
        this.mResManager.mVideoPaths = vEEditorModel.videoPaths;
        this.mResManager.mAudioPaths = vEEditorModel.audioPaths;
        this.mResManager.mTransitions = vEEditorModel.transitions;
        this.mBackGroundColor = vEEditorModel.backgroundColor;
        this.mOutputFile = vEEditorModel.outputFile;
        this.waterMarkFile = vEEditorModel.watermarkFile;
        this.waterMarkWidth = vEEditorModel.watermarkWidth;
        this.waterMarkHeight = vEEditorModel.watermarkHeight;
        this.waterMarkOffsetX = vEEditorModel.watermarkOffsetX;
        this.waterMarkOffsetY = vEEditorModel.watermarkOffsetY;
        if (TextUtils.isEmpty(vEEditorModel.colorFilterRightPath)) {
            setColorFilter(vEEditorModel.colorFilterLeftPath, vEEditorModel.colorFilterIntensity);
        } else {
            setColorFilter(vEEditorModel.colorFilterLeftPath, vEEditorModel.colorFilterRightPath, vEEditorModel.colorFilterPosition, vEEditorModel.colorFilterIntensity);
        }
        return true;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:17:0x009e, code lost:
        return r1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x00a0, code lost:
        return null;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @Nullable
    public synchronized VEEditorModel save() {
        if (this.hasDestroyCalled) {
            return null;
        }
        String save = this.mVideoEditor.save();
        if (!TextUtils.isEmpty(save)) {
            if (checkFileExists(save)) {
                VEEditorModel vEEditorModel = new VEEditorModel();
                vEEditorModel.projectXML = save;
                vEEditorModel.inPoint = this.mInPoint;
                vEEditorModel.outputPoint = this.mOutPoint;
                vEEditorModel.reverseDone = this.mReverseDone;
                vEEditorModel.videoOutRes = this.mVideoOutRes;
                vEEditorModel.separateAV = this.mbSeparateAV.booleanValue();
                vEEditorModel.masterTrackIndex = this.mMasterTrackIndex;
                vEEditorModel.audioEffectFilterIndex = this.mAudioEffectfilterIndex;
                vEEditorModel.modelDir = this.mModelsDir;
                vEEditorModel.colorFilterIndex = this.mColorFilterIndex;
                vEEditorModel.videoPaths = this.mResManager.mVideoPaths;
                vEEditorModel.audioPaths = this.mResManager.mAudioPaths;
                vEEditorModel.transitions = this.mResManager.mTransitions;
                vEEditorModel.backgroundColor = this.mBackGroundColor;
                vEEditorModel.outputFile = this.mOutputFile;
                vEEditorModel.watermarkFile = this.waterMarkFile;
                vEEditorModel.watermarkWidth = this.waterMarkWidth;
                vEEditorModel.watermarkHeight = this.waterMarkHeight;
                vEEditorModel.watermarkOffsetX = this.waterMarkOffsetX;
                vEEditorModel.watermarkOffsetY = this.waterMarkOffsetY;
                if (this.mCurColorFilter != null) {
                    vEEditorModel.colorFilterLeftPath = this.mCurColorFilter.getLeftResPath();
                    vEEditorModel.colorFilterRightPath = this.mCurColorFilter.getRightResPath();
                    vEEditorModel.colorFilterPosition = this.mCurColorFilter.getPosition();
                    vEEditorModel.colorFilterIntensity = this.mCurColorFilter.getIntensity();
                }
            }
        }
    }

    public synchronized int seek(int i, SEEK_MODE seek_mode) {
        TELogUtil.w(TAG, "seek...");
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        return this.mVideoEditor.seek(i, this.mSurfaceWidth, this.mSurfaceHeight, seek_mode.ordinal());
    }

    public synchronized void setBackgroundColor(int i) {
        if (!this.hasDestroyCalled) {
            this.mBackGroundColor = i;
            this.mVideoEditor.setBackGroundColor(((float) ((i >> 16) & 255)) / 255.0f, ((float) ((i >> 8) & 255)) / 255.0f, ((float) (i & 255)) / 255.0f, ((float) ((i >> 24) & 255)) / 255.0f);
        }
    }

    public synchronized int setColorFilter(String str, float f) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (this.mColorFilterIndex < 0) {
            return VEResult.TER_INVALID_STAT;
        }
        if (f < 0.0f || str == null) {
            return -100;
        }
        if (f > 1.0f) {
            f = 1.0f;
        }
        if (this.mCurColorFilter == null) {
            this.mCurColorFilter = new FilterBean();
        }
        if (str.equals(this.mCurColorFilter.getLeftResPath()) && this.mCurColorFilter.getRightResPath().length() == 0 && this.mCurColorFilter.getIntensity() == f && this.mCurColorFilter.getPosition() == 1.0f) {
            return 0;
        }
        this.mCurColorFilter.setLeftResPath(str);
        this.mCurColorFilter.setRightResPath("");
        this.mCurColorFilter.setPosition(1.0f);
        this.mCurColorFilter.setIntensity(f);
        this.mVideoEditor.setFilterParam(this.mColorFilterIndex, FILTER_PATH_LEFT, str);
        TEInterface tEInterface = this.mVideoEditor;
        int i = this.mColorFilterIndex;
        String str2 = FILTER_INTENSITY;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(f);
        tEInterface.setFilterParam(i, str2, sb.toString());
        this.mVideoEditor.setFilterParam(this.mColorFilterIndex, FILTER_PATH_RIGHT, "");
        this.mVideoEditor.setFilterParam(this.mColorFilterIndex, FILTER_POSITION, "1.0");
        VEKeyValue vEKeyValue = new VEKeyValue();
        String str3 = "";
        if (!TextUtils.isEmpty(str)) {
            String[] split = str.split(File.separator);
            if (split.length > 0) {
                str3 = split[split.length - 1];
            }
        }
        vEKeyValue.add("iesve_veeditor_set_filter_click_filter_id", str3);
        MonitorUtils.monitorStatistics("iesve_veeditor_set_filter_click", 1, vEKeyValue);
        return 0;
    }

    public synchronized int setColorFilter(String str, String str2, float f, float f2) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (this.mColorFilterIndex < 0) {
            return VEResult.TER_INVALID_STAT;
        }
        if (f2 >= 0.0f && f >= 0.0f) {
            if (!TextUtils.isEmpty(str)) {
                if (!TextUtils.isEmpty(str2)) {
                    if (f2 > 1.0f) {
                        f2 = 1.0f;
                    }
                    if (f > 1.0f) {
                        f = 1.0f;
                    }
                    if (this.mCurColorFilter == null) {
                        this.mCurColorFilter = new FilterBean();
                    }
                    if (str.equals(this.mCurColorFilter.getLeftResPath()) && str2.equals(this.mCurColorFilter.getRightResPath()) && this.mCurColorFilter.getIntensity() == f2 && this.mCurColorFilter.getPosition() == f) {
                        return 0;
                    }
                    String str3 = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("leftFilterPath: ");
                    sb.append(str);
                    sb.append("\nrightFilterPath: ");
                    sb.append(str2);
                    sb.append(" position: ");
                    sb.append(f);
                    sb.append(" intensity: ");
                    sb.append(f2);
                    TELogUtil.d(str3, sb.toString());
                    this.mVideoEditor.setFilterParam(this.mColorFilterIndex, FILTER_PATH_LEFT, str);
                    TEInterface tEInterface = this.mVideoEditor;
                    int i = this.mColorFilterIndex;
                    String str4 = FILTER_INTENSITY;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("");
                    sb2.append(f2);
                    tEInterface.setFilterParam(i, str4, sb2.toString());
                    this.mVideoEditor.setFilterParam(this.mColorFilterIndex, FILTER_PATH_RIGHT, str2);
                    TEInterface tEInterface2 = this.mVideoEditor;
                    int i2 = this.mColorFilterIndex;
                    String str5 = FILTER_POSITION;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("");
                    sb3.append(f);
                    tEInterface2.setFilterParam(i2, str5, sb3.toString());
                    VEKeyValue vEKeyValue = new VEKeyValue();
                    String str6 = "";
                    String str7 = "";
                    if (!TextUtils.isEmpty(str)) {
                        String[] split = str.split(File.separator);
                        if (split.length > 0) {
                            str6 = split[split.length - 1];
                        }
                    }
                    if (!TextUtils.isEmpty(str2)) {
                        String[] split2 = str2.split(File.separator);
                        if (split2.length > 0) {
                            str7 = split2[split2.length - 1];
                        }
                    }
                    vEKeyValue.add("iesve_veeditor_set_filter_slide_left_id", str6);
                    vEKeyValue.add("iesve_veeditor_set_filter_slide_right_id", str7);
                    MonitorUtils.monitorStatistics("iesve_veeditor_set_filter_slide", 1, vEKeyValue);
                    return 0;
                }
            }
        }
        return -100;
    }

    public synchronized void setCrop(int i, int i2, int i3, int i4) {
        if (!this.hasDestroyCalled) {
            VEKeyValue vEKeyValue = new VEKeyValue();
            vEKeyValue.add("iesve_veeditor_cut_scale", i4 / i3);
            MonitorUtils.monitorStatistics("iesve_veeditor_cut_scale", 1, vEKeyValue);
            this.mVideoEditor.setCrop(i, i2, i3, i4);
        }
    }

    public synchronized void setDisplayPos(int i, int i2, int i3, int i4) {
        if (!this.hasDestroyCalled) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("setDisplayPos... ");
            sb.append(i);
            sb.append(" ");
            sb.append(i2);
            sb.append(" ");
            sb.append(i3);
            sb.append(" ");
            sb.append(i4);
            TELogUtil.i(str, sb.toString());
            setDisplayState(((float) i3) / ((float) this.mInitDisplayWidth), ((float) i4) / ((float) this.mInitDisplayHeight), 0.0f, -(((this.mSurfaceWidth / 2) - (i3 / 2)) - i), ((this.mSurfaceHeight / 2) - (i4 / 2)) - i2);
        }
    }

    public synchronized void setDisplayState(float f, float f2, float f3, int i, int i2) {
        if (!this.hasDestroyCalled) {
            VEKeyValue vEKeyValue = new VEKeyValue();
            vEKeyValue.add("iesve_veeditor_video_scale_width", f).add("iesve_veeditor_video_scale_heigh", f2);
            MonitorUtils.monitorStatistics("iesve_veeditor_video_scale", 1, vEKeyValue);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("setDisplayState... ");
            sb.append(f);
            sb.append(" ");
            sb.append(f2);
            sb.append(" ");
            sb.append(f3);
            sb.append(" ");
            sb.append(i);
            sb.append(" ");
            sb.append(i2);
            TELogUtil.i(str, sb.toString());
            this.mVideoEditor.setDisplayState(f, f2, f3, 0.0f, i, i2, false);
        }
    }

    public synchronized void setExpandLastFrame(boolean z) {
        if (!this.hasDestroyCalled) {
            this.mVideoEditor.setExpandLastFrame(z);
        }
    }

    public synchronized int setInOut(int i, int i2) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        VEKeyValue vEKeyValue = new VEKeyValue();
        vEKeyValue.add("iesve_veeditor_cut_duration", i2 - i);
        MonitorUtils.monitorStatistics("iesve_veeditor_cut_duration", 1, vEKeyValue);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setInOut... ");
        sb.append(i);
        sb.append(" ");
        sb.append(i2);
        TELogUtil.i(str, sb.toString());
        this.mInPoint = i;
        this.mOutPoint = i2;
        this.mVideoEditor.stop();
        return this.mVideoEditor.prepareEngine(i, i2, 0, this.mModelsDir);
    }

    public synchronized int setInfoStickerAlpha(int i, float f) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setInfoStickerAlpha... index: ");
        sb.append(i);
        sb.append("alpha: ");
        sb.append(f);
        TELogUtil.i(str, sb.toString());
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (i < 0) {
            return -100;
        }
        return this.mVideoEditor.setFilterParam(i, ENTITY_ALPHA, String.valueOf(f));
    }

    public synchronized int setInfoStickerLayer(int i, int i2) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setInfoStickerLayer... index: ");
        sb.append(i);
        sb.append("layer: ");
        sb.append(i2);
        TELogUtil.i(str, sb.toString());
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (i < 0) {
            return -100;
        }
        return this.mVideoEditor.setFilterParam(i, ENTITY_LAYER, String.valueOf(i2));
    }

    public synchronized int setInfoStickerPosition(int i, float f, float f2) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setInfoStickerPosition... index: ");
        sb.append(i);
        sb.append("offsetX: ");
        sb.append(f);
        sb.append("offsetY: ");
        sb.append(f2);
        TELogUtil.i(str, sb.toString());
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (i < 0) {
            return -100;
        }
        return this.mVideoEditor.setFilterParam(i, ENTITY_POSITION_X, String.valueOf(f)) + this.mVideoEditor.setFilterParam(i, ENTITY_POSITION_Y, String.valueOf(f2));
    }

    public synchronized int setInfoStickerRotation(int i, float f) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setInfoStickerRotation... index: ");
        sb.append(i);
        sb.append("degree: ");
        sb.append(f);
        TELogUtil.i(str, sb.toString());
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (i < 0) {
            return -100;
        }
        return this.mVideoEditor.setFilterParam(i, ENTITY_ROTATION, String.valueOf(f));
    }

    public synchronized int setInfoStickerScale(int i, float f) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setInfoStickerScale... index: ");
        sb.append(i);
        sb.append("scale: ");
        sb.append(f);
        TELogUtil.i(str, sb.toString());
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (i < 0) {
            return -100;
        }
        return this.mVideoEditor.setFilterParam(i, ENTITY_SCALE_X, String.valueOf(f)) + this.mVideoEditor.setFilterParam(i, ENTITY_SCALE_Y, String.valueOf(f));
    }

    public synchronized int setInfoStickerTime(int i, int i2, int i3) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setInfoStickerTime... index: ");
        sb.append(i);
        sb.append("startTime: ");
        sb.append(i2);
        sb.append("endTime: ");
        sb.append(i3);
        TELogUtil.i(str, sb.toString());
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (i < 0) {
            return -100;
        }
        return this.mVideoEditor.setFilterParam(i, ENTITY_START_TIME, String.valueOf(i2)) + this.mVideoEditor.setFilterParam(i, ENTITY_END_TIME, String.valueOf(i3));
    }

    public synchronized void setLoopPlay(boolean z) {
        if (!this.hasDestroyCalled) {
            TELogUtil.i(TAG, "setLoopPlay");
            this.mVideoEditor.setLooping(z);
        }
    }

    public synchronized void setOnErrorListener(@NonNull final VECommonCallback vECommonCallback) {
        if (!this.hasDestroyCalled) {
            AnonymousClass4 r0 = new TECommonCallback() {
                public void onCallback(int i, int i2, float f, String str) {
                    vECommonCallback.onCallback(i, i2, f, str);
                }
            };
            TELogUtil.i(TAG, "setOnErrorListener...");
            synchronized (this) {
                if (this.mVideoEditor.getNativeHandler() == 0) {
                    return;
                }
                this.mVideoEditor.setErrorListener(r0);
            }
        }
    }

    public synchronized void setOnInfoListener(@NonNull final VECommonCallback vECommonCallback) {
        if (!this.hasDestroyCalled) {
            AnonymousClass5 r0 = new TECommonCallback() {
                public void onCallback(int i, int i2, float f, String str) {
                    if (i != 4103) {
                        vECommonCallback.onCallback(i, i2, f, str);
                    } else if (VEEditor.this.mBCompileHighQualityGif) {
                        VEEditor.this.mp4ToGIFConverter.setCallback(vECommonCallback);
                        new Thread(VEEditor.this.mp4ToGIFConverter).start();
                        VEEditor.this.mBCompileHighQualityGif = false;
                    } else {
                        if (i2 == 0) {
                            VEEditor.this.onMonitorCompile();
                        }
                        vECommonCallback.onCallback(i, i2, f, str);
                    }
                }
            };
            TELogUtil.i(TAG, "setOnInfoListener...");
            synchronized (this) {
                if (this.mVideoEditor.getNativeHandler() == 0) {
                    return;
                }
                this.mVideoEditor.setInfoListener(r0);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:16:0x001b, code lost:
        return com.ss.android.vesdk.VEResult.TER_INVALID_STAT;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized int setReverseVideoPaths(String[] strArr) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (strArr != null) {
            if (strArr.length > 0) {
                if (this.mResManager != null) {
                    this.mResManager.mReverseVideoPath = strArr;
                    this.mReverseDone = true;
                }
            }
        }
        return -100;
    }

    public synchronized int setScaleMode(SCALE_MODE scale_mode) {
        TELogUtil.w(TAG, "setScaleMode...");
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        this.mVideoEditor.setScaleMode(scale_mode.ordinal());
        return 0;
    }

    public synchronized int setSpeedRatio(float f) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        this.mVideoEditor.setSpeedRatio(f);
        return 0;
    }

    public synchronized int setSpeedRatioAndUpdate(float f) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        this.mVideoEditor.stop();
        this.mVideoEditor.setSpeedRatio(f);
        this.mVideoEditor.createTimeline();
        return this.mVideoEditor.prepareEngine(this.mInPoint, this.mOutPoint, 0, this.mModelsDir);
    }

    public synchronized int setStickerAnimator(int i, @NonNull VEStickerAnimator vEStickerAnimator) {
        TELogUtil.w(TAG, "addAnimator...");
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (i < 0 || vEStickerAnimator == null) {
            return -100;
        }
        int stickerFilterIndex = this.mVideoEditor.getStickerFilterIndex(i);
        if (stickerFilterIndex < 0) {
            return stickerFilterIndex;
        }
        return this.mVideoEditor.setFilterParam(stickerFilterIndex, "animator", vEStickerAnimator);
    }

    public synchronized void setUseLargeMattingModel(boolean z) {
        if (!this.hasDestroyCalled) {
            this.mVideoEditor.setUseLargeMattingModel(z);
        }
    }

    public synchronized boolean setVolume(int i, int i2, float f) {
        if (this.hasDestroyCalled) {
            return false;
        }
        TELogUtil.w(TAG, "setVolume...");
        return this.mVideoEditor.setTrackVolume(i2, i, f);
    }

    public synchronized boolean testSerialization() {
        if (this.hasDestroyCalled) {
            return false;
        }
        return this.mVideoEditor.testSerialization();
    }

    /* JADX WARNING: Code restructure failed: missing block: B:23:0x002f, code lost:
        return -100;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:25:0x0031, code lost:
        return -100;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized int updateAudioTrack(int i, int i2, int i3, int i4, int i5, boolean z) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        TELogUtil.i(TAG, "updateAudioTrack...");
        if (i < 0) {
            return -100;
        }
        if (i3 > i2 && i2 >= 0) {
            if (i5 > i4 && i4 >= 0) {
                return this.mVideoEditor.updateAudioTrack(i, i4, i5, i2, i3, z);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:29:0x003c, code lost:
        return -100;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:31:0x003e, code lost:
        return -100;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:33:0x0040, code lost:
        return -100;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized int updateAudioTrack(int i, int i2, int i3, int i4, int i5, boolean z, int i6, int i7) {
        int i8 = i2;
        int i9 = i4;
        int i10 = i6;
        synchronized (this) {
            if (this.hasDestroyCalled) {
                return VEResult.TER_INVALID_STAT;
            }
            TELogUtil.i(TAG, "updateAudioTrack...");
            if (i < 0) {
                return -100;
            }
            int i11 = i3;
            if (i11 > i8 && i8 >= 0) {
                int i12 = i5;
                if (i12 > i9 && i9 >= 0) {
                    int i13 = i7;
                    if (i13 > i10 && i10 >= 0) {
                        int updateAudioTrack = this.mVideoEditor.updateAudioTrack(i, i9, i12, i8, i11, z, i10, i13);
                        return updateAudioTrack;
                    }
                }
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:21:0x002b, code lost:
        return -100;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized int updateAudioTrack(int i, int i2, int i3, boolean z) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        TELogUtil.w(TAG, "updateAudioTrack...");
        if (i < 0) {
            return -100;
        }
        if (i3 > i2 && i2 >= 0) {
            return this.mVideoEditor.updateAudioTrack(i, 0, i3 - i2, i2, i3, z);
        }
    }

    public synchronized void updatePreViewResolution(int i, int i2, int i3, int i4) {
        if (!this.hasDestroyCalled) {
            this.mVideoEditor.updateResolution(i, i2, i3, i4);
        }
    }

    public synchronized int updateSegmentVolume(int i, float f) {
        if (this.hasDestroyCalled) {
            return VEResult.TER_INVALID_STAT;
        }
        if (i < 0) {
            return -100;
        }
        if (f < 0.0f) {
            f = 0.0f;
        }
        if (f > 1.0f) {
            f = 1.0f;
        }
        TEInterface tEInterface = this.mVideoEditor;
        String str = AUDIO_VOLUME;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(f);
        return tEInterface.setFilterParam(i, str, sb.toString());
    }
}
