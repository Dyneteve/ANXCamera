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
import android.util.Size;
import android.widget.Toast;
import com.android.camera.ActivityBase;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.constant.DurationConstant;
import com.android.camera.data.DataRepository;
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
import com.android.camera.protocol.ModeProtocol.MimojiAvatarEngine;
import com.android.camera.protocol.ModeProtocol.MimojiEditor;
import com.android.camera.protocol.ModeProtocol.RecordState;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.ui.V6CameraGLSurfaceView;
import com.arcsoft.avatar.AvatarConfig.ASAvatarProcessInfo;
import com.arcsoft.avatar.AvatarConfig.ASAvatarProfileResult;
import com.arcsoft.avatar.AvatarEngine;
import com.arcsoft.avatar.RecordModule;
import com.arcsoft.avatar.RecordModule.MediaResultCallback;
import com.arcsoft.avatar.recoder.RecordingListener;
import com.arcsoft.avatar.util.ASVLOFFSCREEN;
import com.arcsoft.avatar.util.AsvloffscreenUtil;
import com.arcsoft.avatar.util.LOG;
import com.sensetime.stmobile.STMobileHumanActionNative;
import com.xiaomi.camera.core.ParallelTaskData;
import com.xiaomi.camera.core.ParallelTaskDataParameter.Builder;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

public class MimojiAvatarEngineImpl implements MimojiAvatarEngine {
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
    public String mAvatarTemplatePath = AvatarEngineManager.PersonTemplatePath;
    private V6CameraGLSurfaceView mCameraView;
    private MediaResultCallback mCaptureCallback = new MediaResultCallback() {
        public void onCaptureResult(ByteBuffer byteBuffer) {
            Bitmap bitmap;
            byte[] bArr;
            Bitmap createBitmap = Bitmap.createBitmap(MimojiAvatarEngineImpl.this.mDrawSize.getWidth(), MimojiAvatarEngineImpl.this.mDrawSize.getHeight(), Config.ARGB_8888);
            createBitmap.copyPixelsFromBuffer(byteBuffer);
            if (!MimojiAvatarEngineImpl.this.mIsFrontCamera) {
                Matrix matrix = new Matrix();
                matrix.postScale(1.0f, -1.0f);
                bitmap = Bitmap.createBitmap(createBitmap, 0, 0, MimojiAvatarEngineImpl.this.mDrawSize.getWidth(), MimojiAvatarEngineImpl.this.mDrawSize.getHeight(), matrix, false);
                bArr = Util.getBitmapData(bitmap);
            } else {
                bArr = Util.getBitmapData(createBitmap);
                bitmap = null;
            }
            int access$1900 = (!MimojiAvatarEngineImpl.this.mIsFrontCamera || MimojiAvatarEngineImpl.this.mDeviceRotation % 180 != 0) ? MimojiAvatarEngineImpl.this.mDeviceRotation : (MimojiAvatarEngineImpl.this.mDeviceRotation + 180) % 360;
            if (MimojiAvatarEngineImpl.this.mIsFrontCamera) {
                bitmap = createBitmap;
            }
            Thumbnail createThumbnail = Thumbnail.createThumbnail(null, bitmap, access$1900, false);
            createThumbnail.startWaitingForUri();
            MimojiAvatarEngineImpl.this.mActivityBase.getThumbnailUpdater().setThumbnail(createThumbnail, true, true);
            ParallelTaskData parallelTaskData = new ParallelTaskData(System.currentTimeMillis(), -4, null);
            parallelTaskData.fillJpegData(bArr, 0);
            parallelTaskData.fillParameter(new Builder(MimojiAvatarEngineImpl.this.mDrawSize, MimojiAvatarEngineImpl.this.mDrawSize, MimojiAvatarEngineImpl.this.mDrawSize).setHasDualWaterMark(CameraSettings.isDualCameraWaterMarkOpen()).setJpegRotation((Util.getJpegRotation(MimojiAvatarEngineImpl.this.mIsFrontCamera ? 1 : 0, MimojiAvatarEngineImpl.this.mDeviceRotation) + 270) % 360).setJpegQuality(BaseModule.getJpegQuality(false)).setFilterId(FilterInfo.FILTER_ID_NONE).build());
            MimojiAvatarEngineImpl.this.mActivityBase.getImageSaver().onParallelProcessFinish(parallelTaskData);
        }

        public void onVideoResult() {
            Log.d(MimojiAvatarEngineImpl.TAG, "stop video record callback");
            MimojiAvatarEngineImpl.this.mActivityBase.getImageSaver().addVideo(MimojiAvatarEngineImpl.this.mSaveVideoPath, MimojiAvatarEngineImpl.this.mContentValues, true);
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
    public Handler mHandler = new Handler(Looper.getMainLooper()) {
        public void handleMessage(Message message) {
            super.handleMessage(message);
            switch (message.what) {
                case 0:
                    Toast.makeText(MimojiAvatarEngineImpl.this.mContext, (String) message.obj, 0).show();
                    return;
                default:
                    return;
            }
        }
    };
    private boolean mIsFaceDetectSuccess = false;
    /* access modifiers changed from: private */
    public boolean mIsFrontCamera;
    /* access modifiers changed from: private */
    public boolean mIsRecording;
    private boolean mIsShutterButtonClick = false;
    /* access modifiers changed from: private */
    public boolean mIsStopRender = false;
    private Handler mLoadHandler;
    private HandlerThread mLoadThread = new HandlerThread("LoadConfig");
    private MainContentProtocol mMainProtocol;
    private int mMaxVideoDurationInMs = DurationConstant.DURATION_VIDEO_RECORDING_FUN;
    /* access modifiers changed from: private */
    public MimojiEditor mMimojiEditor;
    /* access modifiers changed from: private */
    public MimojiStatusManager mMimojiStatusManager;
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
                    obtainMessage.arg1 = (int) (((Long) obj).longValue() / 1024);
                    obtainMessage.what = 4;
                    break;
                case 260:
                    obtainMessage.arg1 = (int) (((Long) obj).longValue() / 1024);
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

    public MimojiAvatarEngineImpl(ActivityBase activityBase) {
        this.mActivityBase = activityBase;
        this.mCameraView = activityBase.getGLView();
        this.mContext = activityBase.getCameraAppImpl().getApplicationContext();
        this.mMainProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        this.mMimojiStatusManager = DataRepository.dataItemLive().getMimojiStatusManager();
    }

    private void animateCapture() {
        this.mActivityBase.getCameraScreenNail().animateCapture(this.mOrientation);
        this.mActivityBase.playCameraSound(0);
    }

    public static MimojiAvatarEngineImpl create(ActivityBase activityBase) {
        return new MimojiAvatarEngineImpl(activityBase);
    }

    private void createAvatar(byte[] bArr, int i, int i2) {
        int avatarProfile;
        ASAvatarProfileResult aSAvatarProfileResult = new ASAvatarProfileResult();
        synchronized (this.mAvatarLock) {
            avatarProfile = this.mAvatar.avatarProfile(AvatarEngineManager.PersonTemplatePath, i, i2, i * 4, bArr, 0, true, aSAvatarProfileResult, null, $$Lambda$MimojiAvatarEngineImpl$RJYDigwssyCC_737Br9t7yY1rs.INSTANCE);
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
                    ((LiveModule) MimojiAvatarEngineImpl.this.mActivityBase.getCurrentModule()).setDisableSingleTapUp(true);
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
    }

    private void initResource() {
        this.mLoadHandler.post(new Runnable() {
            public void run() {
                if (!FileUtils.hasDir(MimojiHelper.MIMOJI_DIR)) {
                    FileUtils.delDir(MimojiHelper.MIMOJI_DIR);
                }
                try {
                    Util.verifyAssetZip(MimojiAvatarEngineImpl.this.mContext, "mimoji/mimoji.zip", MimojiHelper.MIMOJI_DIR, 32768);
                } catch (Exception e) {
                    Log.e(MimojiAvatarEngineImpl.TAG, "verify asset zip failed...", e);
                }
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
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            bottomPopupTips.directlyHideTips();
        }
        this.mMainProtocol.mimojiEnd();
        this.mMimojiStatusManager.setMode(MimojiStatusManager.MIMOJI_EDIT_MID);
        MimojiEditor mimojiEditor = (MimojiEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(224);
        if (mimojiEditor != null) {
            mimojiEditor.startMimojiEdit();
        }
        this.mCameraView.queueEvent(new Runnable() {
            public void run() {
                Log.d(MimojiAvatarEngineImpl.TAG, "releaseRender 1");
                if (MimojiAvatarEngineImpl.this.mAvatar != null) {
                    MimojiAvatarEngineImpl.this.mAvatar.releaseRender();
                }
                MimojiAvatarEngineImpl.this.mIsStopRender = true;
            }
        });
    }

    private void release() {
        this.mCameraView.queueEvent(new Runnable() {
            public void run() {
                if (MimojiAvatarEngineImpl.this.mAvatar != null) {
                    synchronized (MimojiAvatarEngineImpl.this.mAvatarLock) {
                        Log.d(MimojiAvatarEngineImpl.TAG, "avatar destroy");
                        MimojiAvatarEngineImpl.this.mAvatar.saveConfig(AvatarEngineManager.TempEditConfigPath);
                        MimojiAvatarEngineImpl.this.mIsStopRender = true;
                        MimojiAvatarEngineImpl.this.mAvatar.releaseRender();
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
        if (mode == MimojiStatusManager.MIMOJI_PREVIEW) {
            this.mLoadHandler.postDelayed(new Runnable() {
                public void run() {
                    synchronized (MimojiAvatarEngineImpl.this.mAvatarLock) {
                        if (MimojiAvatarEngineImpl.this.mMimojiStatusManager.mCurrentMimojiInfo != null) {
                            MimojiAvatarEngineImpl.this.mAvatar.loadConfig(MimojiAvatarEngineImpl.this.mMimojiStatusManager.mCurrentMimojiInfo.mConfigPath);
                            MimojiAvatarEngineImpl.this.mShowAvatar = true;
                        }
                    }
                }
            }, 10);
        } else if (mode == MimojiStatusManager.MIMOJI_EDIT_MID || mode == MimojiStatusManager.MIMOJI_EIDT) {
            this.mAvatar.loadConfig(mode == MimojiStatusManager.MIMOJI_EDIT_MID ? AvatarEngineManager.TempOriginalConfigPath : AvatarEngineManager.TempEditConfigPath);
            MimojiEditor mimojiEditor = (MimojiEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(224);
            if (mimojiEditor != null) {
                mimojiEditor.resetConfig();
            }
        } else if (mode == MimojiStatusManager.MIMOJI_NONE) {
            this.mMimojiStatusManager.setMode(MimojiStatusManager.MIMOJI_PREVIEW);
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

    public void backToPreview(boolean z) {
        this.mMimojiStatusManager.setMode(MimojiStatusManager.MIMOJI_PREVIEW);
        this.mShowAvatar = z;
        this.mIsStopRender = false;
        ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).showOrHideMimojiCreateTitle(false);
        ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).reInitTipImage();
        this.mAvatar.setRenderScene(true, 1.0f);
        ((LiveModule) this.mActivityBase.getCurrentModule()).setDisableSingleTapUp(false);
    }

    public void initAvatarEngine(int i, int i2, int i3, int i4, boolean z) {
        int i5 = i3;
        int i6 = i4;
        boolean z2 = z;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("initAvatarEngine with parameters : displayOrientation = ");
        int i7 = i;
        sb.append(i7);
        sb.append(", width = ");
        sb.append(i5);
        sb.append(", height = ");
        sb.append(i6);
        sb.append(", isFrontCamera = ");
        sb.append(z2);
        Log.d(str, sb.toString());
        this.mShowAvatar = false;
        this.mPreviewWidth = i5;
        this.mPreviewHeight = i6;
        this.mIsFrontCamera = z2;
        this.mOrientation = i2;
        if (this.mLoadHandler == null) {
            this.mLoadThread.start();
            this.mLoadHandler = new Handler(this.mLoadThread.getLooper());
        }
        synchronized (this.mAvatarLock) {
            this.mAvatar = AvatarEngineManager.getInstance().queryAvatar();
            this.mAvatar.init(AvatarEngineManager.TRACK_DATA, AvatarEngineManager.FACE_MODEL, AvatarEngineManager.PersonTemplatePath);
            this.mAvatar.setRenderScene(true, 1.0f);
            this.mAvatar.createOutlineEngine(AvatarEngineManager.TRACK_DATA);
            this.mAvatar.setTemplatePath(AvatarEngineManager.PersonTemplatePath);
            this.mRecordModule = new RecordModule(this.mContext, this.mCaptureCallback);
            this.mRecordModule.init(i7, i5, i6, this.mAvatar, z2);
            Rect displayRect = Util.getDisplayRect(this.mContext);
            this.mRecordModule.setDrawScope(0, Util.sWindowHeight - displayRect.bottom, displayRect.right, displayRect.bottom - displayRect.top);
            this.mDrawSize = new Size(displayRect.right, displayRect.bottom - displayRect.top);
        }
        resetConfig();
        MimojiHelper.init(this.mContext);
        initResource();
        this.mMimojiStatusManager.setAvatarInited(true);
    }

    public boolean isOnCreateMimoji() {
        return this.mMimojiStatusManager.IsInMimojiCreate();
    }

    public boolean isRecording() {
        return this.mIsRecording;
    }

    public void onCaptureImage() {
        this.mRecordModule.capture();
    }

    public boolean onCreateCapture() {
        if (this.mFaceDectectResult != 0 || !this.mIsFaceDetectSuccess) {
            return false;
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

    public void onDrawFrame() {
        if (this.mRecordModule != null && !this.mIsStopRender) {
            Rect displayRect = Util.getDisplayRect(this.mContext);
            GLES20.glViewport(0, Util.sWindowHeight - displayRect.bottom, displayRect.right, displayRect.bottom - displayRect.top);
            GLES20.glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
            GLES20.glClear(STMobileHumanActionNative.ST_MOBILE_HAND_LOVE);
            this.mRecordModule.startRender(90, this.mIsFrontCamera, this.mDeviceRotation, 0, false, this.mTextureId, null, this.mShowAvatar);
        }
    }

    public void onMimojiCreate() {
        Log.d(TAG, "start create mimoji");
        this.mShowAvatar = false;
        this.mMimojiStatusManager.setMode(MimojiStatusManager.MIMOJI_CREATE);
        this.mMainProtocol.mimojiStart();
        ((RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212)).prepareCreateMimoji();
    }

    public void onMimojiSelect(final MimojiInfo mimojiInfo) {
        if (mimojiInfo == null) {
            this.mShowAvatar = false;
        } else {
            this.mLoadHandler.post(new Runnable() {
                public void run() {
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
                    if (!MimojiAvatarEngineImpl.this.mAvatarTemplatePath.equals(str)) {
                        MimojiAvatarEngineImpl.this.mAvatar.setTemplatePath(str);
                        MimojiAvatarEngineImpl.this.mAvatarTemplatePath = str;
                    }
                    if (!str2.isEmpty()) {
                        MimojiAvatarEngineImpl.this.mAvatar.loadConfig(str2);
                    }
                }
            });
        }
    }

    public void onPreviewFrame(Image image) {
        final int checkOutlineInfo;
        boolean startProcess;
        if (this.mMimojiStatusManager.IsAvatarInited() && this.mAvatar != null) {
            long currentTimeMillis = System.currentTimeMillis();
            ASVLOFFSCREEN buildNV21SingleBuffer = AsvloffscreenUtil.buildNV21SingleBuffer(image);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("buildNV21SingleBuffer spend time  = ");
            sb.append(System.currentTimeMillis() - currentTimeMillis);
            Log.d(str, sb.toString());
            long currentTimeMillis2 = System.currentTimeMillis();
            if (this.mRecordModule != null) {
                if (this.mMimojiStatusManager.IsInMimojiEditMid() || this.mMimojiStatusManager.IsInMimojiEdit()) {
                    if (this.mMimojiEditor == null) {
                        this.mMimojiEditor = (MimojiEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(224);
                    }
                    if (this.mMimojiEditor != null) {
                        ASAvatarProcessInfo aSAvatarProcessInfo = new ASAvatarProcessInfo();
                        synchronized (this.mAvatarLock) {
                            this.mAvatar.avatarProcessWithInfoEx(buildNV21SingleBuffer, 90, this.mIsFrontCamera, this.mOrientation, aSAvatarProcessInfo);
                            checkOutlineInfo = this.mAvatar.checkOutlineInfo(aSAvatarProcessInfo);
                        }
                        if (this.mMimojiStatusManager.IsInMimojiEditMid()) {
                            this.mActivityBase.runOnUiThread(new Runnable() {
                                public void run() {
                                    MimojiEditor access$2000 = MimojiAvatarEngineImpl.this.mMimojiEditor;
                                    boolean z = true;
                                    if (checkOutlineInfo != 1) {
                                        z = false;
                                    }
                                    access$2000.showOrHideTips(z);
                                }
                            });
                        }
                        String str2 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("avatar edit process time = ");
                        sb2.append(System.currentTimeMillis() - currentTimeMillis2);
                        Log.d(str2, sb2.toString());
                        this.mMimojiEditor.requestRender();
                    }
                } else {
                    synchronized (this.mAvatarLock) {
                        startProcess = this.mRecordModule.startProcess(buildNV21SingleBuffer, MimojiHelper.getOutlineOrientation(this.mOrientation, this.mDeviceRotation, this.mIsFrontCamera), this.mShowAvatar);
                    }
                    Module currentModule = this.mActivityBase.getCurrentModule();
                    if (currentModule instanceof LiveModule) {
                        LiveModule liveModule = (LiveModule) currentModule;
                        CameraSettings.setFaceBeautyLevel(startProcess ? 3 : 0);
                        liveModule.updatePreferenceInWorkThread(13);
                    }
                    this.mCameraView.requestRender();
                }
            }
            String str3 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("process frame spend time  = ");
            sb3.append(System.currentTimeMillis() - currentTimeMillis2);
            Log.d(str3, sb3.toString());
            if (this.mMimojiStatusManager.IsInMimojiCreate()) {
                this.mShowAvatar = false;
                synchronized (this.mAvatarLock) {
                    this.mFaceDectectResult = this.mAvatar.outlineProcessEx(buildNV21SingleBuffer, MimojiHelper.getOutlineOrientation(this.mOrientation, this.mDeviceRotation, this.mIsFrontCamera));
                }
                String str4 = TAG;
                StringBuilder sb4 = new StringBuilder();
                sb4.append("mimoji check result = ");
                sb4.append(this.mFaceDectectResult);
                Log.d(str4, sb4.toString());
                if (this.mMainProtocol != null) {
                    this.mMainProtocol.mimojiFaceDetect(this.mFaceDectectResult);
                }
            }
            if (this.mIsShutterButtonClick) {
                this.mIsShutterButtonClick = false;
                Bitmap horizMirrorBitmap = BitmapUtils.horizMirrorBitmap(BitmapUtils.rotateBitmap(BitmapUtils.rawByteArray2RGBABitmap(buildNV21SingleBuffer.getYData(), image.getWidth(), image.getHeight()), -90));
                int width = horizMirrorBitmap.getWidth();
                int height = horizMirrorBitmap.getHeight();
                ByteBuffer order = ByteBuffer.allocate(horizMirrorBitmap.getRowBytes() * horizMirrorBitmap.getHeight()).order(ByteOrder.nativeOrder());
                horizMirrorBitmap.copyPixelsToBuffer(order);
                createAvatar(order.array(), width, height);
            }
        }
    }

    public void onRecordStart(final ContentValues contentValues) {
        Log.d(TAG, "start record...");
        this.mCameraView.queueEvent(new Runnable() {
            public void run() {
                if (MimojiAvatarEngineImpl.this.mRecordModule != null) {
                    MimojiAvatarEngineImpl.this.mIsRecording = true;
                    MimojiAvatarEngineImpl.this.mContentValues = contentValues;
                    MimojiAvatarEngineImpl.this.mSaveVideoPath = contentValues.getAsString("_data");
                    MimojiAvatarEngineImpl.this.mRecordModule.startRecording(MimojiAvatarEngineImpl.this.mSaveVideoPath, MimojiAvatarEngineImpl.this.mRecordingListener, MimojiAvatarEngineImpl.this.mCurrentScreenOrientation, MimojiAvatarEngineImpl.this.mPreviewWidth, MimojiAvatarEngineImpl.this.mPreviewHeight, 10000000);
                }
            }
        });
        updateRecordingTime();
    }

    public void onRecordStop() {
        Log.d(TAG, "stop record...");
        this.mCameraView.queueEvent(new Runnable() {
            public void run() {
                if (MimojiAvatarEngineImpl.this.mRecordModule != null) {
                    MimojiAvatarEngineImpl.this.mIsRecording = false;
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
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(217, this);
    }

    public void releaseRender() {
        this.mCameraView.queueEvent(new Runnable() {
            public void run() {
                MimojiAvatarEngineImpl.this.mAvatar.releaseRender();
            }
        });
    }

    public void setDetectSuccess(boolean z) {
        this.mIsFaceDetectSuccess = z;
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
        AnonymousClass7 r1 = new CountDownTimer((long) this.mMaxVideoDurationInMs, 1000) {
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
