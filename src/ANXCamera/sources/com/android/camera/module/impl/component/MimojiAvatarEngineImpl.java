package com.android.camera.module.impl.component;

import android.content.ContentValues;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.media.Image;
import android.opengl.GLES20;
import android.os.CountDownTimer;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.support.v4.media.session.PlaybackStateCompat;
import android.util.Size;
import android.widget.Toast;
import com.android.camera.ActivityBase;
import com.android.camera.CameraScreenNail.ExternalFrameProcessor;
import com.android.camera.CameraSettings;
import com.android.camera.LocationManager;
import com.android.camera.R;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.constant.DurationConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.runing.ComponentRunningShine;
import com.android.camera.effect.FilterInfo;
import com.android.camera.fragment.mimoji.AvatarEngineManager;
import com.android.camera.fragment.mimoji.BitmapUtils;
import com.android.camera.fragment.mimoji.MimojiHelper;
import com.android.camera.fragment.mimoji.MimojiInfo;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.module.LiveModule;
import com.android.camera.module.Module;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.MainContentProtocol;
import com.android.camera.protocol.ModeProtocol.MimojiAlert;
import com.android.camera.protocol.ModeProtocol.MimojiAvatarEngine;
import com.android.camera.protocol.ModeProtocol.MimojiEditor;
import com.android.camera.protocol.ModeProtocol.RecordState;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.V6CameraGLSurfaceView;
import com.android.camera2.Camera2Proxy;
import com.android.camera2.Camera2Proxy.PreviewCallback;
import com.arcsoft.avatar.AvatarConfig.ASAvatarProcessInfo;
import com.arcsoft.avatar.AvatarConfig.ASAvatarProfileResult;
import com.arcsoft.avatar.AvatarEngine;
import com.arcsoft.avatar.RecordModule;
import com.arcsoft.avatar.RecordModule.MediaResultCallback;
import com.arcsoft.avatar.recoder.RecordingListener;
import com.arcsoft.avatar.util.ASVLOFFSCREEN;
import com.arcsoft.avatar.util.AsvloffscreenUtil;
import com.arcsoft.avatar.util.LOG;
import com.ss.android.ttve.common.TEDefine;
import com.xiaomi.camera.core.ParallelTaskData;
import com.xiaomi.camera.core.ParallelTaskDataParameter.Builder;
import io.reactivex.annotations.SchedulerSupport;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CountDownLatch;

public class MimojiAvatarEngineImpl implements ExternalFrameProcessor, MimojiAvatarEngine, PreviewCallback {
    private static final int HANDLER_RECORDING_CURRENT_FILE_SIZE = 3;
    private static final int HANDLER_RECORDING_CURRENT_TIME = 1;
    private static final int HANDLER_RECORDING_MAX_DURATION_REACHED = 2;
    private static final int HANDLER_RECORDING_MAX_FILE_SIZE_REACHED = 4;
    private static final int HANDLER_RESOURCE_ERROR_BROKEN = 0;
    private static final long START_OFFSET_MS = 450;
    /* access modifiers changed from: private */
    public static final String TAG = MimojiAvatarEngineImpl.class.getSimpleName();
    /* access modifiers changed from: private */
    public ActivityBase mActivityBase;
    /* access modifiers changed from: private */
    public AvatarEngine mAvatar;
    /* access modifiers changed from: private */
    public final Object mAvatarLock = new Object();
    /* access modifiers changed from: private */
    public String mAvatarTemplatePath = "";
    private V6CameraGLSurfaceView mCameraView;
    private MediaResultCallback mCaptureCallback = new MediaResultCallback() {
        public void onCaptureResult(ByteBuffer byteBuffer) {
            Bitmap createBitmap = Bitmap.createBitmap(MimojiAvatarEngineImpl.this.mDrawSize.getWidth(), MimojiAvatarEngineImpl.this.mDrawSize.getHeight(), Config.ARGB_8888);
            createBitmap.copyPixelsFromBuffer(byteBuffer);
            Matrix matrix = new Matrix();
            if (!MimojiAvatarEngineImpl.this.mIsFrontCamera || (MimojiAvatarEngineImpl.this.mIsFrontCamera && (MimojiAvatarEngineImpl.this.mDeviceRotation == 90 || MimojiAvatarEngineImpl.this.mDeviceRotation == 270))) {
                matrix.postScale(1.0f, -1.0f);
            } else if (MimojiAvatarEngineImpl.this.mDeviceRotation % 180 == 0) {
                matrix.postScale(-1.0f, 1.0f);
            }
            Bitmap createBitmap2 = Bitmap.createBitmap(createBitmap, 0, 0, MimojiAvatarEngineImpl.this.mDrawSize.getWidth(), MimojiAvatarEngineImpl.this.mDrawSize.getHeight(), matrix, false);
            byte[] bitmapData = Util.getBitmapData(createBitmap2, BaseModule.getJpegQuality(false));
            int access$2200 = (!MimojiAvatarEngineImpl.this.mIsFrontCamera || MimojiAvatarEngineImpl.this.mDeviceRotation % 180 != 0) ? MimojiAvatarEngineImpl.this.mDeviceRotation : (MimojiAvatarEngineImpl.this.mDeviceRotation + 180) % 360;
            Thumbnail createThumbnail = Thumbnail.createThumbnail(null, MimojiAvatarEngineImpl.this.mIsFrontCamera ? createBitmap : createBitmap2, access$2200, MimojiAvatarEngineImpl.this.mIsFrontCamera);
            createThumbnail.startWaitingForUri();
            MimojiAvatarEngineImpl.this.mActivityBase.getThumbnailUpdater().setThumbnail(createThumbnail, true, true);
            ParallelTaskData parallelTaskData = new ParallelTaskData(System.currentTimeMillis(), -4, null);
            parallelTaskData.fillJpegData(bitmapData, 0);
            parallelTaskData.fillParameter(new Builder(MimojiAvatarEngineImpl.this.mDrawSize, MimojiAvatarEngineImpl.this.mDrawSize, MimojiAvatarEngineImpl.this.mDrawSize).setHasDualWaterMark(CameraSettings.isDualCameraWaterMarkOpen()).setJpegRotation((Util.getJpegRotation(MimojiAvatarEngineImpl.this.mIsFrontCamera ? 1 : 0, MimojiAvatarEngineImpl.this.mDeviceRotation) + 270) % 360).setJpegQuality(BaseModule.getJpegQuality(false)).setFilterId(FilterInfo.FILTER_ID_NONE).setLocation(LocationManager.instance().getCurrentLocation()).build());
            MimojiAvatarEngineImpl.this.mActivityBase.getImageSaver().onParallelProcessFinish(parallelTaskData);
            createBitmap.recycle();
            createBitmap2.recycle();
            ((LiveModule) MimojiAvatarEngineImpl.this.mActivityBase.getCurrentModule()).turnOffFlashIfNeed();
        }

        public void onVideoResult() {
            Log.d(MimojiAvatarEngineImpl.TAG, "stop video record callback");
            MimojiAvatarEngineImpl.this.mIsRecording = false;
            MimojiAvatarEngineImpl.this.mIsRecordStopping = false;
            MimojiAvatarEngineImpl.this.mActivityBase.getImageSaver().addVideo(MimojiAvatarEngineImpl.this.mSaveVideoPath, MimojiAvatarEngineImpl.this.mContentValues, true);
            if (MimojiAvatarEngineImpl.this.mGetThumCountDownLatch != null) {
                MimojiAvatarEngineImpl.this.mGetThumCountDownLatch.countDown();
            }
        }
    };
    /* access modifiers changed from: private */
    public ContentValues mContentValues;
    /* access modifiers changed from: private */
    public Context mContext;
    private CountDownTimer mCountDownTimer;
    /* access modifiers changed from: private */
    public int mCurrentScreenOrientation = 0;
    /* access modifiers changed from: private */
    public int mDeviceRotation = 90;
    /* access modifiers changed from: private */
    public Size mDrawSize;
    private int mFaceDectectResult = 1;
    /* access modifiers changed from: private */
    public CountDownLatch mGetThumCountDownLatch;
    /* access modifiers changed from: private */
    public Handler mHandler = new Handler(Looper.getMainLooper()) {
        public void handleMessage(Message message) {
            super.handleMessage(message);
            switch (message.what) {
            }
        }
    };
    private boolean mIsFaceDetectSuccess = false;
    /* access modifiers changed from: private */
    public boolean mIsFrontCamera;
    /* access modifiers changed from: private */
    public boolean mIsRecordStopping = false;
    /* access modifiers changed from: private */
    public volatile boolean mIsRecording;
    private boolean mIsShutterButtonClick = false;
    /* access modifiers changed from: private */
    public boolean mIsStopRender = true;
    private boolean mLastNeedBeauty = false;
    private Handler mLoadHandler;
    private Handler mLoadResourceHandler;
    private HandlerThread mLoadResourceThread = new HandlerThread("LoadResource");
    private HandlerThread mLoadThread = new HandlerThread("LoadConfig");
    private MainContentProtocol mMainProtocol;
    private int mMaxVideoDurationInMs = DurationConstant.DURATION_VIDEO_RECORDING_FUN;
    private MimojiEditor mMimojiEditor;
    /* access modifiers changed from: private */
    public MimojiStatusManager mMimojiStatusManager;
    private boolean mNeedCapture = false;
    /* access modifiers changed from: private */
    public boolean mNeedShowNoFaceTips = false;
    private int mOrientation;
    /* access modifiers changed from: private */
    public int mPreviewHeight;
    /* access modifiers changed from: private */
    public int mPreviewWidth;
    /* access modifiers changed from: private */
    public RecordModule mRecordModule;
    /* access modifiers changed from: private */
    public RecordingListener mRecordingListener = new RecordingListener() {
        public void onRecordingListener(int i, Object obj) {
            Message obtainMessage = MimojiAvatarEngineImpl.this.mHandler.obtainMessage();
            switch (i) {
                case 257:
                    obtainMessage.arg1 = (int) ((((Long) obj).longValue() / 1000) / 1000);
                    obtainMessage.what = 2;
                    break;
                case 258:
                    long longValue = (((Long) obj).longValue() / 1000) / 1000;
                    obtainMessage.arg1 = (int) longValue;
                    String access$100 = MimojiAvatarEngineImpl.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("onRecordingListener_time = ");
                    sb.append(longValue);
                    Log.d(access$100, sb.toString());
                    obtainMessage.what = 1;
                    break;
                case 259:
                    obtainMessage.arg1 = (int) (((Long) obj).longValue() / PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID);
                    obtainMessage.what = 4;
                    break;
                case 260:
                    obtainMessage.arg1 = (int) (((Long) obj).longValue() / PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID);
                    obtainMessage.what = 3;
                    break;
            }
            obtainMessage.sendToTarget();
        }
    };
    /* access modifiers changed from: private */
    public String mSaveVideoPath;
    /* access modifiers changed from: private */
    public boolean mShowAvatar = false;
    private int[] mTextureId = new int[1];
    /* access modifiers changed from: private */
    public Handler mUiHandler;

    private MimojiAvatarEngineImpl(ActivityBase activityBase) {
        this.mActivityBase = activityBase;
        this.mCameraView = activityBase.getGLView();
        this.mContext = activityBase.getCameraAppImpl().getApplicationContext();
        this.mMainProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        this.mLoadResourceThread.start();
        this.mLoadResourceHandler = new Handler(this.mLoadResourceThread.getLooper());
        this.mLoadThread.start();
        this.mLoadHandler = new Handler(this.mLoadThread.getLooper());
        this.mUiHandler = new Handler(activityBase.getMainLooper());
        this.mMimojiStatusManager = DataRepository.dataItemLive().getMimojiStatusManager();
        MimojiHelper.init(this.mContext);
    }

    private void animateCapture() {
        this.mActivityBase.playCameraSound(0);
    }

    public static MimojiAvatarEngineImpl create(ActivityBase activityBase) {
        DataRepository.dataItemLive().getMimojiStatusManager().setAvatarInited(false);
        return new MimojiAvatarEngineImpl(activityBase);
    }

    private void createAvatar(byte[] bArr, int i, int i2) {
        int avatarProfile;
        if (this.mAvatarTemplatePath != AvatarEngineManager.PersonTemplatePath) {
            this.mAvatarTemplatePath = AvatarEngineManager.PersonTemplatePath;
            this.mAvatar.setTemplatePath(AvatarEngineManager.PersonTemplatePath);
        }
        ASAvatarProfileResult aSAvatarProfileResult = new ASAvatarProfileResult();
        synchronized (this.mAvatarLock) {
            avatarProfile = this.mAvatar.avatarProfile(AvatarEngineManager.PersonTemplatePath, i, i2, i * 4, bArr, 0, false, aSAvatarProfileResult, null, $$Lambda$MimojiAvatarEngineImpl$RJYDigwssyCC_737Br9t7yY1rs.INSTANCE);
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("avatarProfile res: ");
        sb.append(avatarProfile);
        sb.append(", status:");
        sb.append(aSAvatarProfileResult.status);
        sb.append(", gender: ");
        sb.append(aSAvatarProfileResult.gender);
        LOG.d(str, sb.toString());
        if (aSAvatarProfileResult.status == 254 || aSAvatarProfileResult.status == 246) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("result = ");
            sb2.append(avatarProfile);
            Log.d(str2, sb2.toString());
            this.mActivityBase.runOnUiThread(new Runnable() {
                public void run() {
                    MimojiAvatarEngineImpl.this.setDisableSingleTapUp(true);
                    MimojiAvatarEngineImpl.this.onProfileFinish();
                }
            });
            return;
        }
        if (aSAvatarProfileResult.status == 1) {
            Toast.makeText(this.mContext, R.string.mimoji_detect_no_face_failed, 0).show();
        } else if ((aSAvatarProfileResult.status & 2) == 0) {
            Toast.makeText(this.mContext, R.string.mimoji_detect_facial_failed, 0).show();
        } else if ((aSAvatarProfileResult.status & 4) == 0) {
            Toast.makeText(this.mContext, R.string.mimoji_detect_hairstyle_failed, 0).show();
        } else if ((aSAvatarProfileResult.status & 8) == 0) {
            Toast.makeText(this.mContext, R.string.mimoji_detect_haircolor_failed, 0).show();
        } else if ((aSAvatarProfileResult.status & 16) == 0) {
            Toast.makeText(this.mContext, R.string.mimoji_detect_gender_failed, 0).show();
        } else if ((aSAvatarProfileResult.status & 32) == 0) {
            Toast.makeText(this.mContext, R.string.mimoji_detect_skincolor_failed, 0).show();
        } else if ((aSAvatarProfileResult.status & 64) == 0) {
            Toast.makeText(this.mContext, R.string.mimoji_detect_glass_failed, 0).show();
        } else if ((aSAvatarProfileResult.status & 128) == 0) {
            Toast.makeText(this.mContext, R.string.mimoji_detect_faceshape_failed, 0).show();
        } else {
            Toast.makeText(this.mContext, R.string.mimoji_detect_unknow_failed, 0).show();
        }
        this.mActivityBase.runOnUiThread(new Runnable() {
            public void run() {
                ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).showOrHideMimojiProgress(false);
            }
        });
        ((LiveModule) this.mActivityBase.getCurrentModule()).onMimojiCreateCompleted(false);
    }

    private Map<String, String> getMimojiPara() {
        HashMap hashMap = new HashMap();
        if (this.mShowAvatar) {
            String str = "";
            if (this.mAvatarTemplatePath.equals(AvatarEngineManager.PersonTemplatePath)) {
                str = SchedulerSupport.CUSTOM;
            } else if (this.mAvatarTemplatePath.equals(AvatarEngineManager.PigTemplatePath)) {
                str = AvatarEngineManager.FAKE_PIG_CONFIGPATH;
            } else if (this.mAvatarTemplatePath.equals(AvatarEngineManager.BearTemplatePath)) {
                str = AvatarEngineManager.FAKE_BEAR_CONFIGPATH;
            } else if (this.mAvatarTemplatePath.equals(AvatarEngineManager.RoyanTemplatePath)) {
                str = AvatarEngineManager.FAKE_ROYAN_CONFIGPATH;
            } else if (this.mAvatarTemplatePath.equals(AvatarEngineManager.RabbitTemplatePath)) {
                str = AvatarEngineManager.FAKE_RABBIT_CONFIGPATH;
            }
            hashMap.put(CameraStat.PARAM_MIMOJI_CATEGORY, str);
        } else {
            hashMap.put(CameraStat.PARAM_MIMOJI_CATEGORY, TEDefine.FACE_BEAUTY_NULL);
        }
        return hashMap;
    }

    private void initMimojiResource(Context context) {
        if (!FileUtils.hasDir(MimojiHelper.MIMOJI_DIR)) {
            FileUtils.delDir(MimojiHelper.MIMOJI_DIR);
        }
        try {
            Util.verifyAssetZip(this.mContext, "mimoji/data.zip", MimojiHelper.MIMOJI_DIR, 32768);
        } catch (Exception e) {
            Log.e(TAG, "verify asset zip failed...", e);
        }
        final String fR = DataRepository.dataItemFeature().fR();
        if (!fR.equals(CameraSettings.getMimojiModleVersion())) {
            DataRepository.dataItemLive().getMimojiStatusManager().setIsLoading(true);
        }
        this.mLoadResourceHandler.post(new Runnable() {
            public void run() {
                long currentTimeMillis = System.currentTimeMillis();
                try {
                    Util.verifyAssetZip(MimojiAvatarEngineImpl.this.mContext, "mimoji/model.zip", MimojiHelper.MIMOJI_DIR, 32768);
                } catch (Exception e) {
                    Log.e(MimojiAvatarEngineImpl.TAG, "verify asset zip failed...", e);
                }
                String access$100 = MimojiAvatarEngineImpl.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("init model spend time = ");
                sb.append(System.currentTimeMillis() - currentTimeMillis);
                Log.d(access$100, sb.toString());
                DataRepository.dataItemLive().getMimojiStatusManager().setIsLoading(false);
                CameraSettings.setMimojiModleVersion(fR);
                String access$1002 = MimojiAvatarEngineImpl.TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("mAvatarTemplatePath = ");
                sb2.append(MimojiAvatarEngineImpl.this.mAvatarTemplatePath);
                Log.i(access$1002, sb2.toString());
                MimojiAvatarEngineImpl.this.mUiHandler.post(new Runnable() {
                    public void run() {
                        MimojiAlert mimojiAlert = (MimojiAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(226);
                        if (mimojiAlert != null) {
                            mimojiAlert.firstProgressShow(false);
                        } else {
                            Log.i(MimojiAvatarEngineImpl.TAG, "mimojiAlert finish == null");
                        }
                    }
                });
            }
        });
    }

    static /* synthetic */ void lambda$createAvatar$0(int i) {
    }

    /* access modifiers changed from: private */
    public void onProfileFinish() {
        Log.d(TAG, "onProfileFinish");
        RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
        if (recordState != null) {
            recordState.onPostSavingFinish();
        }
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert != null) {
            topAlert.alertMimojiFaceDetect(false, -1);
        }
        releaseRender();
        this.mMainProtocol.mimojiEnd();
        this.mMimojiStatusManager.setMode(MimojiStatusManager.MIMOJI_EDIT_MID);
        MimojiEditor mimojiEditor = (MimojiEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(224);
        if (mimojiEditor != null) {
            mimojiEditor.startMimojiEdit();
        }
        ((LiveModule) this.mActivityBase.getCurrentModule()).onMimojiCreateCompleted(true);
        CameraStatUtil.trackMimojiClick(CameraStat.PARAM_MIMOJI_CLICK_CREATE_CAPTURE);
    }

    private void release() {
        Log.d(TAG, "avatar release");
        if (this.mGetThumCountDownLatch != null) {
            try {
                this.mGetThumCountDownLatch.await();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        this.mMimojiStatusManager.setAvatarInited(false);
        this.mCameraView.queueEvent(new Runnable() {
            public void run() {
                if (MimojiAvatarEngineImpl.this.mAvatar != null) {
                    synchronized (MimojiAvatarEngineImpl.this.mAvatarLock) {
                        Log.d(MimojiAvatarEngineImpl.TAG, "avatar destroy");
                        MimojiAvatarEngineImpl.this.mAvatar.saveConfig(AvatarEngineManager.TempEditConfigPath);
                        MimojiAvatarEngineImpl.this.mAvatar.destroyOutlineEngine();
                        MimojiAvatarEngineImpl.this.mAvatar.unInit();
                        if (MimojiAvatarEngineImpl.this.mRecordModule != null) {
                            MimojiAvatarEngineImpl.this.mRecordModule.unInit();
                        }
                        AvatarEngineManager.getInstance().releaseAvatar();
                        MimojiAvatarEngineImpl.this.mMimojiStatusManager.setAvatarInited(false);
                    }
                }
            }
        });
        this.mLoadThread.quit();
    }

    private void resetConfig() {
        int mode = this.mMimojiStatusManager.getMode();
        if (mode == MimojiStatusManager.MIMOJI_PREVIEW || mode == MimojiStatusManager.MIMOJI_NONE) {
            this.mMimojiStatusManager.setMode(MimojiStatusManager.MIMOJI_PREVIEW);
            this.mLoadHandler.post(new Runnable() {
                public void run() {
                    synchronized (MimojiAvatarEngineImpl.this.mAvatarLock) {
                        MimojiInfo mimojiInfo = MimojiAvatarEngineImpl.this.mMimojiStatusManager.mCurrentMimojiInfo;
                        if (mimojiInfo != null) {
                            MimojiAvatarEngineImpl.this.mShowAvatar = true;
                            if (!MimojiAvatarEngineImpl.this.mAvatarTemplatePath.equals(mimojiInfo.mAvatarTemplatePath)) {
                                MimojiAvatarEngineImpl.this.mAvatar.setTemplatePath(mimojiInfo.mAvatarTemplatePath);
                                MimojiAvatarEngineImpl.this.mAvatarTemplatePath = mimojiInfo.mAvatarTemplatePath;
                            }
                            String str = mimojiInfo.mConfigPath;
                            if (!AvatarEngineManager.isPrefabModel(str)) {
                                MimojiAvatarEngineImpl.this.mAvatar.loadConfig(str);
                            }
                        }
                    }
                }
            });
        } else if (mode == MimojiStatusManager.MIMOJI_EDIT_MID || mode == MimojiStatusManager.MIMOJI_EIDT) {
            this.mAvatar.setTemplatePath(AvatarEngineManager.PersonTemplatePath);
            this.mAvatarTemplatePath = AvatarEngineManager.PersonTemplatePath;
            MimojiEditor mimojiEditor = (MimojiEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(224);
            if (mimojiEditor != null) {
                mimojiEditor.resetConfig();
            }
        }
    }

    private void updateBeauty() {
        BaseModule baseModule = (BaseModule) this.mActivityBase.getCurrentModule();
        if (baseModule instanceof LiveModule) {
            ComponentRunningShine componentRunningShine = DataRepository.dataItemRunning().getComponentRunningShine();
            if (componentRunningShine.supportBeautyLevel()) {
                CameraSettings.setFaceBeautyLevel(3);
            } else if (componentRunningShine.supportSmoothLevel()) {
                CameraSettings.setFaceBeautySmoothLevel(40);
            }
            baseModule.updatePreferenceInWorkThread(13);
        }
    }

    private void updateVideoOrientation(int i) {
        if ((i > 315 && i <= 360) || (i >= 0 && i <= 45)) {
            this.mCurrentScreenOrientation = 0;
        } else if (i > 45 && i <= 135) {
            this.mCurrentScreenOrientation = 90;
        } else if (i > 135 && i <= 225) {
            this.mCurrentScreenOrientation = 180;
        } else if (i > 225 && i <= 315) {
            this.mCurrentScreenOrientation = 270;
        }
    }

    public void backToPreview(boolean z, boolean z2) {
        if ((this.mMimojiStatusManager.IsInMimojiEdit() || this.mMimojiStatusManager.IsInMimojiEditMid()) && !z && this.mMimojiStatusManager.mCurrentMimojiInfo != null) {
            if (AvatarEngineManager.isPrefabModel(this.mMimojiStatusManager.mCurrentMimojiInfo.mConfigPath)) {
                this.mAvatar.setTemplatePath(this.mMimojiStatusManager.mCurrentMimojiInfo.mAvatarTemplatePath);
            } else {
                this.mAvatar.loadConfig(this.mMimojiStatusManager.mCurrentMimojiInfo.mConfigPath);
            }
        }
        this.mMimojiStatusManager.setMode(MimojiStatusManager.MIMOJI_PREVIEW);
        if (this.mMimojiStatusManager.mCurrentMimojiInfo != null || z) {
            this.mShowAvatar = true;
        }
        this.mIsStopRender = false;
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        bottomPopupTips.reInitTipImage();
        if (z2 && !CameraSettings.getMimojiPannelState()) {
            bottomPopupTips.showMimoji();
        }
        topAlert.alertMimojiFaceDetect(false, -1);
        topAlert.enableMenuItem(true, 225, 193);
        if (this.mAvatar != null) {
            this.mAvatar.setRenderScene(true, 1.0f);
        }
        setDisableSingleTapUp(false);
    }

    public void initAvatarEngine(int i, int i2, int i3, int i4, boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("initAvatarEngine with parameters : displayOrientation = ");
        sb.append(i);
        sb.append(", width = ");
        sb.append(i3);
        sb.append(", height = ");
        sb.append(i4);
        sb.append(", isFrontCamera = ");
        sb.append(z);
        Log.d(str, sb.toString());
        this.mPreviewWidth = i3;
        this.mPreviewHeight = i4;
        this.mIsFrontCamera = z;
        this.mOrientation = i2;
        initMimojiResource(this.mContext);
        if (this.mActivityBase.startFromKeyguard()) {
            this.mMimojiStatusManager.setMode(MimojiStatusManager.MIMOJI_PREVIEW);
            this.mMimojiStatusManager.reset();
        }
        synchronized (this.mAvatarLock) {
            Log.d(TAG, "avatar start init");
            if (!this.mMimojiStatusManager.IsAvatarInited()) {
                Log.d(TAG, "avatar need really init");
                this.mAvatar = AvatarEngineManager.getInstance().queryAvatar();
                this.mAvatar.init(AvatarEngineManager.TRACK_DATA, AvatarEngineManager.FACE_MODEL);
                this.mAvatar.setRenderScene(true, 1.0f);
                this.mAvatar.createOutlineEngine(AvatarEngineManager.TRACK_DATA);
                this.mMimojiStatusManager.setAvatarInited(true);
                resetConfig();
            }
            if (this.mRecordModule == null) {
                this.mRecordModule = new RecordModule(this.mContext, this.mCaptureCallback);
                this.mRecordModule.init(i, i3, i4, this.mAvatar, z);
            } else {
                this.mRecordModule.setmImageOrientation(i);
                this.mRecordModule.setMirror(z);
                this.mRecordModule.setPreviewSize(i3, i4);
            }
            Rect previewRect = Util.getPreviewRect(this.mContext);
            this.mRecordModule.setDrawScope(0, Util.sWindowHeight - previewRect.bottom, previewRect.right, previewRect.bottom - previewRect.top);
            this.mDrawSize = new Size(previewRect.right, previewRect.bottom - previewRect.top);
            this.mIsStopRender = false;
        }
    }

    public boolean isOnCreateMimoji() {
        return this.mMimojiStatusManager.IsInMimojiCreate();
    }

    public boolean isRecordStopping() {
        return this.mIsRecordStopping;
    }

    public boolean isRecording() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("Recording = ");
        sb.append(this.mIsRecording);
        Log.d(str, sb.toString());
        return this.mIsRecording;
    }

    public void onCaptureImage() {
        if (this.mRecordModule != null) {
            this.mNeedCapture = true;
            CameraStatUtil.trackMimojiCaptureOrRecord(getMimojiPara(), CameraSettings.getFlashMode(this.mActivityBase.getCurrentModuleIndex()), true, this.mIsFrontCamera);
        }
    }

    public boolean onCreateCapture() {
        Log.d(TAG, "onCreateCapture");
        if (this.mFaceDectectResult != 0 || !this.mIsFaceDetectSuccess) {
            return false;
        }
        Module currentModule = this.mActivityBase.getCurrentModule();
        if (currentModule instanceof LiveModule) {
            LiveModule liveModule = (LiveModule) currentModule;
            CameraSettings.setFaceBeautyLevel(0);
            liveModule.updatePreferenceInWorkThread(13);
        }
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).showOrHideMimojiProgress(true);
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            bottomPopupTips.showTips(19, R.string.mimoji_start_create, 2);
        }
        this.mIsShutterButtonClick = true;
        animateCapture();
        return true;
    }

    public void onDeviceRotationChange(int i) {
        this.mDeviceRotation = i;
        updateVideoOrientation(i);
        if (this.mMimojiEditor != null) {
            this.mMimojiEditor.onDeviceRotationChange(i);
        }
    }

    public void onDrawFrame(Rect rect, int i, int i2, boolean z) {
        if (this.mRecordModule != null && rect != null && !this.mIsStopRender) {
            if (z) {
                GLES20.glViewport(0, 0, i, i2);
            } else {
                GLES20.glViewport(0, Util.sWindowHeight - rect.bottom, rect.right, rect.bottom - rect.top);
                if (this.mNeedCapture) {
                    this.mRecordModule.capture();
                    this.mNeedCapture = false;
                }
            }
            GLES20.glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
            GLES20.glClear(16384);
            this.mRecordModule.startRender(90, this.mIsFrontCamera, this.mDeviceRotation, 0, false, this.mTextureId, null, this.mShowAvatar);
        }
    }

    public void onMimojiCreate() {
        Log.d(TAG, "start create mimoji");
        this.mShowAvatar = false;
        this.mMimojiStatusManager.setMode(MimojiStatusManager.MIMOJI_CREATE);
        this.mMainProtocol.mimojiStart();
        ((RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212)).prepareCreateMimoji();
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            bottomPopupTips.showTips(19, R.string.mimoji_create_tips, 2);
        }
    }

    public void onMimojiDeleted() {
        this.mShowAvatar = false;
        this.mMimojiStatusManager.mCurrentMimojiInfo = null;
    }

    public void onMimojiSelect(final MimojiInfo mimojiInfo) {
        this.mLoadHandler.post(new Runnable() {
            public void run() {
                if (mimojiInfo == null || MimojiAvatarEngineImpl.this.mAvatar == null) {
                    MimojiAvatarEngineImpl.this.mShowAvatar = false;
                    MimojiAvatarEngineImpl.this.mMimojiStatusManager.mCurrentMimojiInfo = null;
                    return;
                }
                MimojiAvatarEngineImpl.this.mShowAvatar = true;
                MimojiAvatarEngineImpl.this.mMimojiStatusManager.mCurrentMimojiInfo = mimojiInfo;
                String str = mimojiInfo.mAvatarTemplatePath;
                String str2 = mimojiInfo.mConfigPath;
                String access$100 = MimojiAvatarEngineImpl.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("change mimoji with path = ");
                sb.append(str);
                sb.append(", and config = ");
                sb.append(str2);
                Log.d(access$100, sb.toString());
                synchronized (MimojiAvatarEngineImpl.this.mAvatarLock) {
                    boolean equals = MimojiAvatarEngineImpl.this.mAvatarTemplatePath.equals(str);
                    MimojiAvatarEngineImpl.this.mAvatarTemplatePath = str;
                    if (str2.isEmpty() || AvatarEngineManager.isPrefabModel(str2)) {
                        if (!equals) {
                            MimojiAvatarEngineImpl.this.mAvatar.setTemplatePath(str);
                        }
                    } else if (!equals) {
                        MimojiAvatarEngineImpl.this.mRecordModule.changeHumanTemplate(str, str2);
                    } else {
                        MimojiAvatarEngineImpl.this.mAvatar.loadConfig(str2);
                    }
                }
            }
        });
    }

    public void onPreviewFrame(Image image, Camera2Proxy camera2Proxy, int i) {
        boolean startProcess;
        if (!this.mMimojiStatusManager.IsAvatarInited() || this.mAvatar == null) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onPreviewFrame Error mAvatar = ");
            sb.append(this.mAvatar);
            Log.d(str, sb.toString());
            return;
        }
        long currentTimeMillis = System.currentTimeMillis();
        ASVLOFFSCREEN buildNV21SingleBuffer = AsvloffscreenUtil.buildNV21SingleBuffer(image);
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("buildNV21SingleBuffer spend time  = ");
        sb2.append(System.currentTimeMillis() - currentTimeMillis);
        Log.d(str2, sb2.toString());
        long currentTimeMillis2 = System.currentTimeMillis();
        if (this.mRecordModule != null) {
            if (this.mMimojiStatusManager.IsInMimojiEditMid() || this.mMimojiStatusManager.IsInMimojiEdit()) {
                if (this.mMimojiEditor == null) {
                    this.mMimojiEditor = (MimojiEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(224);
                }
                if (this.mMimojiEditor != null) {
                    ASAvatarProcessInfo aSAvatarProcessInfo = new ASAvatarProcessInfo();
                    synchronized (this.mAvatarLock) {
                        this.mAvatar.avatarProcessWithInfoEx(buildNV21SingleBuffer, 90, this.mIsFrontCamera, this.mOrientation, aSAvatarProcessInfo, true);
                    }
                    String str3 = TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("avatar edit process time = ");
                    sb3.append(System.currentTimeMillis() - currentTimeMillis2);
                    Log.d(str3, sb3.toString());
                    this.mMimojiEditor.requestRender();
                }
            } else {
                synchronized (this.mAvatarLock) {
                    startProcess = this.mRecordModule.startProcess(buildNV21SingleBuffer, MimojiHelper.getOutlineOrientation(this.mOrientation, this.mDeviceRotation, this.mIsFrontCamera), this.mShowAvatar);
                }
                boolean z = this.mNeedShowNoFaceTips;
                boolean z2 = true;
                boolean z3 = startProcess && this.mShowAvatar;
                this.mNeedShowNoFaceTips = z3;
                if (z == this.mNeedShowNoFaceTips) {
                    z2 = false;
                }
                if (z2 && !this.mMimojiStatusManager.IsInMimojiCreate()) {
                    this.mUiHandler.post(new Runnable() {
                        public void run() {
                            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                            if (topAlert != null) {
                                topAlert.alertMimojiFaceDetect(MimojiAvatarEngineImpl.this.mNeedShowNoFaceTips, R.string.mimoji_check_no_face);
                            }
                        }
                    });
                }
                if (this.mLastNeedBeauty != startProcess) {
                    this.mLastNeedBeauty = startProcess;
                    updateBeauty();
                }
                this.mCameraView.requestRender();
            }
        }
        String str4 = TAG;
        StringBuilder sb4 = new StringBuilder();
        sb4.append("process frame spend time  = ");
        sb4.append(System.currentTimeMillis() - currentTimeMillis2);
        Log.d(str4, sb4.toString());
        if (this.mMimojiStatusManager.IsInMimojiCreate()) {
            this.mShowAvatar = false;
            synchronized (this.mAvatarLock) {
                this.mFaceDectectResult = this.mAvatar.outlineProcessEx(buildNV21SingleBuffer, MimojiHelper.getOutlineOrientation(this.mOrientation, this.mDeviceRotation, this.mIsFrontCamera));
            }
            if (this.mMainProtocol != null) {
                this.mMainProtocol.mimojiFaceDetect(this.mFaceDectectResult);
            }
        }
        if (this.mIsShutterButtonClick) {
            this.mIsShutterButtonClick = false;
            Bitmap rotateBitmap = BitmapUtils.rotateBitmap(BitmapUtils.rawByteArray2RGBABitmap(buildNV21SingleBuffer.getYData(), image.getWidth(), image.getHeight(), image.getPlanes()[0].getRowStride()), this.mIsFrontCamera ? -90 : 90);
            int width = rotateBitmap.getWidth();
            int height = rotateBitmap.getHeight();
            ByteBuffer order = ByteBuffer.allocate(rotateBitmap.getRowBytes() * rotateBitmap.getHeight()).order(ByteOrder.nativeOrder());
            rotateBitmap.copyPixelsToBuffer(order);
            createAvatar(order.array(), width, height);
        }
    }

    public void onRecordStart(ContentValues contentValues) {
        Log.d(TAG, "start record...");
        if (!this.mIsRecording) {
            CameraStatUtil.trackMimojiCaptureOrRecord(getMimojiPara(), CameraSettings.getFlashMode(this.mActivityBase.getCurrentModuleIndex()), false, this.mIsFrontCamera);
            this.mIsRecording = true;
            this.mIsRecordStopping = false;
            this.mContentValues = contentValues;
            this.mSaveVideoPath = contentValues.getAsString("_data");
            this.mCameraView.queueEvent(new Runnable() {
                public void run() {
                    if (MimojiAvatarEngineImpl.this.mRecordModule != null) {
                        MimojiAvatarEngineImpl.this.mRecordModule.startRecording(MimojiAvatarEngineImpl.this.mSaveVideoPath, MimojiAvatarEngineImpl.this.mRecordingListener, MimojiAvatarEngineImpl.this.mCurrentScreenOrientation, MimojiAvatarEngineImpl.this.mPreviewWidth, MimojiAvatarEngineImpl.this.mPreviewHeight, 10000000, CameraSettings.getVideoEncoder() == 5 ? "video/hevc" : "video/avc");
                    }
                }
            });
            updateRecordingTime();
        }
    }

    public void onRecordStop(boolean z) {
        Log.d(TAG, "stop record...");
        this.mIsRecordStopping = true;
        if (z) {
            this.mGetThumCountDownLatch = new CountDownLatch(1);
        }
        if (this.mCountDownTimer != null) {
            this.mCountDownTimer.cancel();
        }
        this.mCameraView.queueEvent(new Runnable() {
            public void run() {
                if (MimojiAvatarEngineImpl.this.mRecordModule != null) {
                    new Thread(new Runnable() {
                        public void run() {
                            MimojiAvatarEngineImpl.this.mRecordModule.stopRecording();
                        }
                    }).start();
                }
            }
        });
    }

    public void onResume() {
        Log.d(TAG, "reset");
        if (this.mRecordModule != null) {
            this.mRecordModule.reset();
        }
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(217, this);
    }

    public void releaseRender() {
        if (this.mMimojiStatusManager.IsInPreviewSurface()) {
            this.mCameraView.queueEvent(new Runnable() {
                public void run() {
                    Log.d(MimojiAvatarEngineImpl.TAG, "releaseRender....");
                    if (MimojiAvatarEngineImpl.this.mAvatar != null) {
                        MimojiAvatarEngineImpl.this.mAvatar.releaseRender();
                    }
                    MimojiAvatarEngineImpl.this.mIsStopRender = true;
                }
            });
            return;
        }
        MimojiEditor mimojiEditor = (MimojiEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(224);
        if (mimojiEditor != null) {
            mimojiEditor.releaseRender();
        }
    }

    public void setDetectSuccess(boolean z) {
        this.mIsFaceDetectSuccess = z;
    }

    public void setDisableSingleTapUp(boolean z) {
        ((LiveModule) this.mActivityBase.getCurrentModule()).setDisableSingleTapUp(z);
    }

    public void unRegisterProtocol() {
        ModeCoordinatorImpl.getInstance().detachProtocol(217, this);
        release();
    }

    /* access modifiers changed from: protected */
    public void updateRecordingTime() {
        if (this.mCountDownTimer != null) {
            this.mCountDownTimer.cancel();
        }
        AnonymousClass7 r1 = new CountDownTimer(START_OFFSET_MS + ((long) this.mMaxVideoDurationInMs), 1000) {
            public void onFinish() {
                ((LiveModule) MimojiAvatarEngineImpl.this.mActivityBase.getCurrentModule()).stopVideoRecording(true, false);
            }

            public void onTick(long j) {
                String millisecondToTimeString = Util.millisecondToTimeString((j + 950) - MimojiAvatarEngineImpl.START_OFFSET_MS, false);
                TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                if (topAlert != null) {
                    topAlert.updateRecordingTime(millisecondToTimeString);
                }
            }
        };
        this.mCountDownTimer = r1;
        this.mCountDownTimer.start();
    }
}
