package com.android.camera;

import android.app.AlertDialog;
import android.app.KeyguardManager;
import android.app.NotificationManager;
import android.content.ActivityNotFoundException;
import android.content.ContentUris;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.annotation.UiThread;
import android.support.v4.app.FragmentActivity;
import android.view.Display;
import android.view.KeyEvent;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.camera.CameraScreenNail.NailListener;
import com.android.camera.CameraScreenNail.RequestRenderListener;
import com.android.camera.data.DataRepository;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.camera.module.Module;
import com.android.camera.module.loader.SurfaceStateListener;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.statistic.ScenarioTrackUtil;
import com.android.camera.storage.ImageSaver.ImageSaverCallback;
import com.android.camera.ui.CameraRootView;
import com.android.camera.ui.PopupManager;
import com.android.camera.ui.ScreenHint;
import com.android.camera.ui.V6CameraGLSurfaceView;
import com.android.camera.ui.V9EdgeShutterView;
import com.android.camera2.Camera2Proxy;
import com.mi.config.b;
import com.ss.android.ttve.common.TEDefine;
import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;

public abstract class ActivityBase extends FragmentActivity implements AppController, SurfaceStateListener, ImageSaverCallback {
    public static final int MSG_CAMERA_OPEN_EXCEPTION = 10;
    protected static final int MSG_DEBUG_INFO = 0;
    protected static final int MSG_KEYGUARD_TWICE_RESUME = 1;
    protected static final int MSG_TRACK_MODE_SWITCH = 2;
    private static final int START_GALLERY_TIMEOUT = 300;
    private static final String TAG = "ActivityBase";
    private static final int TOUCH_EVENT_TRACK_TIME_OUT = 1000;
    protected volatile boolean mActivityPaused;
    protected volatile boolean mActivityStopped;
    /* access modifiers changed from: private */
    public HashMap mAppLunchMap;
    protected long mAppStartTime;
    protected CameraAppImpl mApplication;
    protected Camera2Proxy mCamera2Device;
    protected CameraBrightness mCameraBrightness;
    private boolean mCameraErrorShown;
    public CameraIntentManager mCameraIntentManager;
    protected CameraRootView mCameraRootView;
    protected CameraScreenNail mCameraScreenNail;
    private MiuiCameraSound mCameraSound;
    private Thread mCloseActivityThread;
    protected Module mCurrentModule;
    private int mCurrentSurfaceState = 1;
    protected TextView mDebugInfoView;
    protected int mDisplayRotation;
    protected V9EdgeShutterView mEdgeShutterView;
    private AlertDialog mErrorDialog;
    private Disposable mGLCoverDisposable;
    protected ImageView mGLCoverView;
    protected V6CameraGLSurfaceView mGLView;
    private boolean mGalleryLocked = false;
    protected final Handler mHandler = new ActivityHandler(this);
    /* access modifiers changed from: private */
    public boolean mIsFinishInKeyguard = false;
    private boolean mIsSwitchingModule;
    private int mJumpFlag = 0;
    protected boolean mJumpedToGallery;
    private KeyguardManager mKeyguardManager;
    private boolean mKeyguardSecureLocked = false;
    private int mLastJumpFlag = 0;
    private LocationManager mLocationManager;
    protected int mOrientation = -1;
    protected int mOrientationCompensation = 0;
    protected boolean mReleaseByModule;
    protected ScreenHint mScreenHint;
    private ArrayList<Uri> mSecureUriList;
    private boolean mStartFromKeyguard = false;
    private ThumbnailUpdater mThumbnailUpdater;
    private Disposable mTrackAppLunchDisposable;

    private static class ActivityHandler extends Handler {
        private final WeakReference<ActivityBase> mActivity;

        public ActivityHandler(ActivityBase activityBase) {
            this.mActivity = new WeakReference<>(activityBase);
        }

        public void handleMessage(Message message) {
            ActivityBase activityBase = (ActivityBase) this.mActivity.get();
            if (activityBase != null) {
                int i = message.what;
                if (i == 10) {
                    int i2 = message.arg1;
                    Log.d(ActivityBase.TAG, String.format(Locale.ENGLISH, "exception occurs, msg = %s , exception = 0x%x", new Object[]{message, Integer.valueOf(i2)}));
                    switch (i2) {
                        case 226:
                        case 228:
                        case 230:
                        case 231:
                        case 236:
                        case 237:
                            int i3 = Util.isInVideoCall(activityBase) ? R.string.cannot_connect_camera_volte_call : CameraSettings.updateOpenCameraFailTimes() > 1 ? R.string.cannot_connect_camera_twice : R.string.cannot_connect_camera_once;
                            Util.showErrorAndFinish(activityBase, i3);
                            activityBase.showErrorDialog();
                            break;
                        case 227:
                            Util.showErrorAndFinish(activityBase, R.string.camera_disabled);
                            activityBase.showErrorDialog();
                            break;
                    }
                } else {
                    switch (i) {
                        case 0:
                            if (!activityBase.isActivityPaused()) {
                                activityBase.showDebugInfo((String) message.obj);
                                break;
                            }
                            break;
                        case 1:
                            Log.d(ActivityBase.TAG, "handleMessage:  set mIsFinishInKeyguard = true;");
                            activityBase.mIsFinishInKeyguard = true;
                            break;
                        case 2:
                            CameraStatUtil.trackModeSwitch();
                            break;
                    }
                }
            }
        }
    }

    private void addSecureUriIfNecessary(Uri uri) {
        if (this.mSecureUriList != null) {
            if (this.mSecureUriList.size() == 100) {
                this.mSecureUriList.remove(0);
            }
            this.mSecureUriList.add(uri);
        }
    }

    private void checkGalleryLock() {
        this.mGalleryLocked = Util.isAppLocked(this, Util.REVIEW_ACTIVITY_PACKAGE);
    }

    private void checkKeyguardFlag() {
        String str;
        this.mStartFromKeyguard = getKeyguardFlag();
        if (this.mStartFromKeyguard && !this.mIsFinishInKeyguard) {
            getWindow().addFlags(524288);
            this.mKeyguardSecureLocked = this.mKeyguardManager.isKeyguardSecure();
            DataRepository.dataItemGlobal().setStartFromKeyguard(this.mKeyguardSecureLocked);
            this.mIsFinishInKeyguard = false;
            this.mHandler.sendEmptyMessageDelayed(1, 100);
        }
        if (!this.mKeyguardSecureLocked && !isGalleryLocked()) {
            this.mSecureUriList = null;
        } else if (this.mSecureUriList == null) {
            this.mSecureUriList = new ArrayList<>();
        }
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("checkKeyguard: fromKeyguard=");
        sb.append(this.mStartFromKeyguard);
        sb.append(" keyguardSecureLocked=");
        sb.append(this.mKeyguardSecureLocked);
        sb.append(" secureUriList is ");
        if (this.mSecureUriList == null) {
            str = TEDefine.FACE_BEAUTY_NULL;
        } else {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("not null (");
            sb2.append(this.mSecureUriList.size());
            sb2.append(")");
            str = sb2.toString();
        }
        sb.append(str);
        Log.v(str2, sb.toString());
    }

    private void clearNotification() {
        NotificationManager notificationManager = (NotificationManager) getSystemService("notification");
        if (notificationManager != null) {
            notificationManager.cancelAll();
        }
    }

    private boolean getAndroidOneKeyguardFlag() {
        return getCameraIntentManager().isQuickLaunch();
    }

    private long[] getSecureStoreIds() {
        int i = 0;
        if (this.mSecureUriList == null || this.mSecureUriList.isEmpty()) {
            return new long[0];
        }
        long[] jArr = new long[this.mSecureUriList.size()];
        Iterator it = this.mSecureUriList.iterator();
        while (it.hasNext()) {
            jArr[i] = ContentUris.parseId((Uri) it.next());
            i++;
        }
        return jArr;
    }

    public boolean couldShowErrorDialog() {
        return !this.mCameraErrorShown;
    }

    public void createCameraScreenNail(boolean z, boolean z2) {
        if (this.mCameraScreenNail == null) {
            this.mCameraScreenNail = new CameraScreenNail(new NailListener() {
                public int getOrientation() {
                    return ActivityBase.this.mOrientation;
                }

                public boolean isKeptBitmapTexture() {
                    return ActivityBase.this.mCurrentModule.isKeptBitmapTexture();
                }

                public void onFrameAvailable(int i) {
                    if (1 == i && ActivityBase.this.mAppStartTime != 0) {
                        try {
                            long currentTimeMillis = System.currentTimeMillis() - ActivityBase.this.mAppStartTime;
                            CameraStatUtil.trackStartAppCost(currentTimeMillis);
                            if (ActivityBase.this.mAppLunchMap != null) {
                                ScenarioTrackUtil.trackAppLunchTimeEnd(ActivityBase.this.mAppLunchMap, ActivityBase.this.getApplicationContext());
                            } else {
                                ScenarioTrackUtil.trackScenarioAbort(ScenarioTrackUtil.sLaunchTimeScenario);
                            }
                            String str = ActivityBase.TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("onFrameAvailable: trackStartAppCost: ");
                            sb.append(currentTimeMillis);
                            Log.d(str, sb.toString());
                        } catch (IllegalArgumentException e) {
                            String str2 = ActivityBase.TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append(e.getMessage());
                            sb2.append(", start time: ");
                            sb2.append(ActivityBase.this.mAppStartTime);
                            sb2.append(", now: ");
                            sb2.append(System.currentTimeMillis());
                            Log.w(str2, sb2.toString());
                        }
                        ActivityBase.this.mAppStartTime = 0;
                    }
                    ActivityBase.this.dismissBlurCover();
                    ActivityBase.this.notifyOnFirstFrameArrived(i);
                }

                public void onPreviewPixelsRead(byte[] bArr, int i, int i2) {
                    ActivityBase.this.mCurrentModule.onPreviewPixelsRead(bArr, i, i2);
                }

                public void onPreviewTextureCopied() {
                }

                public void onSurfaceTextureCreated(SurfaceTexture surfaceTexture) {
                }

                public void onSurfaceTextureReleased() {
                    if (ActivityBase.this.mCurrentModule != null) {
                        ActivityBase.this.mCurrentModule.onSurfaceTextureReleased();
                    }
                }

                public void onSurfaceTextureUpdated(DrawExtTexAttribute drawExtTexAttribute) {
                    if (ActivityBase.this.mCurrentModule != null) {
                        ActivityBase.this.mCurrentModule.onSurfaceTextureUpdated(drawExtTexAttribute);
                    }
                }
            }, new RequestRenderListener() {
                public void requestRender() {
                    if (ActivityBase.this.mCameraScreenNail.isAnimationRunning() || ActivityBase.this.mCameraScreenNail.getExternalFrameProcessor() == null || !ActivityBase.this.mCameraScreenNail.getExternalFrameProcessor().isProcessorReady()) {
                        ActivityBase.this.mGLView.requestRender();
                    }
                    if (ActivityBase.this.mCurrentModule != null) {
                        ActivityBase.this.mCurrentModule.requestRender();
                    }
                }
            });
        }
        initCameraScreenNail();
    }

    public void dismissBlurCover() {
        if (this.mGLCoverView != null && this.mGLCoverView.getVisibility() != 8) {
            this.mGLCoverView.post(new Runnable() {
                public void run() {
                    ActivityBase.this.mGLCoverView.animate().alpha(0.0f).setDuration(DataRepository.dataItemFeature().gU() ? 100 : 200).withEndAction(new Runnable() {
                        public void run() {
                            ActivityBase.this.mGLCoverView.setVisibility(8);
                        }
                    }).start();
                }
            });
        }
    }

    public void dismissKeyguard() {
        if (this.mStartFromKeyguard) {
            sendBroadcast(new Intent(Util.ACTION_DISMISS_KEY_GUARD));
        }
    }

    public CameraAppImpl getCameraAppImpl() {
        return this.mApplication;
    }

    public Camera2Proxy getCameraDevice() {
        return this.mCamera2Device;
    }

    public CameraIntentManager getCameraIntentManager() {
        if (this.mCameraIntentManager == null) {
            this.mCameraIntentManager = CameraIntentManager.getInstance(getIntent());
        }
        return this.mCameraIntentManager;
    }

    public CameraScreenNail getCameraScreenNail() {
        return this.mCameraScreenNail;
    }

    public Module getCurrentModule() {
        return this.mCurrentModule;
    }

    public int getDisplayRotation() {
        return Util.getDisplayRotation(this);
    }

    public V9EdgeShutterView getEdgeShutterView() {
        return this.mEdgeShutterView;
    }

    public V6CameraGLSurfaceView getGLView() {
        return this.mGLView;
    }

    /* access modifiers changed from: protected */
    public boolean getKeyguardFlag() {
        if (DataRepository.dataItemFeature().hg()) {
            return getAndroidOneKeyguardFlag();
        }
        boolean z = false;
        if (this.mKeyguardManager != null && getIntent().getBooleanExtra(CameraIntentManager.EXTRA_START_WHEN_LOCKED, false) && this.mKeyguardManager.isKeyguardLocked()) {
            z = true;
        }
        return z;
    }

    public int getOrientation() {
        return this.mOrientation;
    }

    public ScreenHint getScreenHint() {
        return this.mScreenHint;
    }

    public ArrayList<Uri> getSecureUriList() {
        return this.mSecureUriList;
    }

    public long getSoundPlayTime() {
        if (this.mCameraSound != null) {
            return this.mCameraSound.getLastSoundPlayTime();
        }
        return 0;
    }

    public ThumbnailUpdater getThumbnailUpdater() {
        return this.mThumbnailUpdater;
    }

    public void gotoGallery() {
        if (!isActivityPaused()) {
            Thumbnail thumbnail = this.mThumbnailUpdater.getThumbnail();
            if (thumbnail != null) {
                Uri uri = thumbnail.getUri();
                if (!Util.isUriValid(uri, getContentResolver())) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Uri invalid. uri=");
                    sb.append(uri);
                    Log.e(str, sb.toString());
                    if (!thumbnail.isWaitingForUri()) {
                        getThumbnailUpdater().getLastThumbnailUncached();
                    }
                    return;
                }
                try {
                    Intent intent = new Intent(Util.REVIEW_ACTION, uri);
                    intent.setPackage(DataRepository.dataItemFeature().hg() ? Util.ANDROID_ONE_REVIEW_ACTIVITY_PACKAGE : Util.REVIEW_ACTIVITY_PACKAGE);
                    intent.putExtra(Util.KEY_REVIEW_FROM_MIUICAMERA, true);
                    if (b.hP()) {
                        if (this.mCameraBrightness.getCurrentBrightnessAuto() != 0.0f) {
                            intent.putExtra(Util.KEY_CAMERA_BRIGHTNESS_AUTO, this.mCameraBrightness.getCurrentBrightnessAuto());
                        } else {
                            intent.putExtra(Util.KEY_CAMERA_BRIGHTNESS_MANUAL, this.mCameraBrightness.getCurrentBrightnessManual());
                            intent.putExtra(Util.KEY_CAMERA_BRIGHTNESS, this.mCameraBrightness.getCurrentBrightness());
                        }
                    }
                    if (startFromKeyguard()) {
                        if (DataRepository.dataItemFeature().hg()) {
                            intent.putExtra(Util.ANDROID_ONE_EXTRA_IS_SECURE_MODE, true);
                        } else {
                            intent.putExtra(CameraIntentManager.EXTRA_START_WHEN_LOCKED, true);
                        }
                    }
                    if (Util.isAppLocked(this, Util.REVIEW_ACTIVITY_PACKAGE)) {
                        intent.putExtra(Util.EXTRAS_SKIP_LOCK, true);
                    }
                    if (this.mSecureUriList != null) {
                        if (DataRepository.dataItemFeature().hg()) {
                            intent.putExtra(Util.ANDROID_ONE_EXTRA_SECURE_MODE_MEDIA_STORE_IDS, getSecureStoreIds());
                        } else {
                            intent.putParcelableArrayListExtra(Util.KEY_SECURE_ITEMS, this.mSecureUriList);
                        }
                    }
                    startActivity(intent);
                    this.mJumpFlag = 1;
                    this.mJumpedToGallery = true;
                    if (this.mCurrentModule != null) {
                        this.mCurrentModule.enableCameraControls(false);
                        CameraStatUtil.trackGotoGallery(this.mCurrentModule.getModuleIndex());
                    }
                } catch (ActivityNotFoundException e) {
                    Log.e(TAG, "review activity not found!", e);
                    try {
                        startActivity(new Intent("android.intent.action.VIEW", uri));
                    } catch (ActivityNotFoundException e2) {
                        String str2 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("review image fail. uri=");
                        sb2.append(uri);
                        Log.e(str2, sb2.toString(), e2);
                    }
                }
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:21:0x0034, code lost:
        return false;
     */
    public synchronized boolean hasSurface() {
        int i = this.mCurrentSurfaceState;
        if (i != 2) {
            if (i == 4) {
                if (getCameraScreenNail().getSurfaceTexture() != null) {
                    return true;
                }
                this.mGLView.onResume();
                return false;
            }
        } else if (Util.sIsFullScreenNavBarHidden) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    ActivityBase.this.mGLView.setVisibility(4);
                    ActivityBase.this.mGLView.setVisibility(0);
                }
            });
        } else {
            this.mGLView.onResume();
        }
    }

    public void initCameraScreenNail() {
        Log.d(TAG, "initCameraScreenNail");
        if (this.mCameraScreenNail != null && this.mCameraScreenNail.getSurfaceTexture() == null) {
            Display defaultDisplay = getWindowManager().getDefaultDisplay();
            Point point = new Point();
            defaultDisplay.getSize(point);
            this.mCameraScreenNail.setPreviewSize(point.x, point.y);
        }
    }

    public boolean isActivityPaused() {
        return this.mActivityPaused;
    }

    public boolean isActivityStopped() {
        return this.mActivityStopped;
    }

    public boolean isGalleryLocked() {
        return this.mGalleryLocked;
    }

    public boolean isGotoGallery() {
        return this.mJumpFlag == 1;
    }

    public boolean isJumpBack() {
        return this.mLastJumpFlag != 0;
    }

    public boolean isPostProcessing() {
        return this.mCurrentModule != null && this.mCurrentModule.isCreated() && this.mCurrentModule.isPostProcessing();
    }

    /* access modifiers changed from: protected */
    public boolean isShowBottomIntentDone() {
        if (getCameraIntentManager().isImageCaptureIntent() || getCameraIntentManager().isVideoCaptureIntent()) {
            BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
            if (baseDelegate != null && baseDelegate.getActiveFragment(R.id.bottom_action) == 4083) {
                return true;
            }
        }
        return false;
    }

    public boolean isSwitchingModule() {
        return this.mIsSwitchingModule;
    }

    public void loadCameraSound(int i) {
        if (this.mCameraSound != null) {
            this.mCameraSound.load(i);
        }
    }

    @UiThread
    public abstract void notifyOnFirstFrameArrived(int i);

    /* access modifiers changed from: protected */
    public void onActivityResult(int i, int i2, Intent intent) {
        this.mCurrentModule.onActivityResult(i, i2, intent);
    }

    public void onCreate(Bundle bundle) {
        if (Util.isNotchDevice) {
            CompatibilityUtils.setCutoutModeShortEdges(getWindow());
        }
        getWindow().addFlags(1024);
        super.onCreate(bundle);
        boolean z = true;
        setVolumeControlStream(1);
        this.mScreenHint = new ScreenHint(this);
        this.mThumbnailUpdater = new ThumbnailUpdater(this);
        this.mKeyguardManager = (KeyguardManager) getSystemService("keyguard");
        this.mStartFromKeyguard = getKeyguardFlag();
        if (this.mStartFromKeyguard) {
            this.mKeyguardSecureLocked = this.mKeyguardManager.isKeyguardSecure();
        }
        if (!this.mStartFromKeyguard || (getIntent().getFlags() & 8388608) != 0) {
            z = false;
        }
        if (z) {
            Log.d(TAG, "onCreate: addFlag --> FLAG_TURN_SCREEN_ON");
            getWindow().addFlags(2097152);
        }
        this.mApplication.addActivity(this);
        this.mCameraBrightness = new CameraBrightness(this);
        this.mLocationManager = LocationManager.instance();
        this.mCloseActivityThread = new Thread(new Runnable() {
            public void run() {
                ActivityBase.this.mApplication.closeAllActivitiesBut(ActivityBase.this);
            }
        });
        try {
            this.mCloseActivityThread.start();
        } catch (IllegalThreadStateException e) {
            Log.e(TAG, e.getMessage());
        }
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        if (!DataRepository.dataItemFeature().gU() && this.mCameraScreenNail != null) {
            final Bitmap lastFrameGaussianBitmap = this.mCameraScreenNail.getLastFrameGaussianBitmap();
            if (lastFrameGaussianBitmap != null) {
                Schedulers.io().scheduleDirect(new Runnable() {
                    public void run() {
                        Util.saveLastFrameGaussian2File(lastFrameGaussianBitmap);
                    }
                });
            }
        }
        PopupManager.removeInstance(this);
        this.mApplication.removeActivity(this);
        if (this.mTrackAppLunchDisposable != null) {
            this.mTrackAppLunchDisposable.dispose();
            this.mTrackAppLunchDisposable = null;
        }
        if (this.mCameraSound != null) {
            this.mCameraSound.release();
            this.mCameraSound = null;
        }
        super.onDestroy();
    }

    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (i != 84 || !keyEvent.isLongPress()) {
            return super.onKeyDown(i, keyEvent);
        }
        return true;
    }

    public void onLayoutChange(Rect rect) {
        this.mCameraScreenNail.setDisplayArea(rect);
        if (Util.getDisplayRotation(this) % 180 == 0) {
            this.mCameraScreenNail.setPreviewFrameLayoutSize(rect.width(), rect.height());
        } else {
            this.mCameraScreenNail.setPreviewFrameLayoutSize(rect.height(), rect.width());
        }
    }

    /* access modifiers changed from: protected */
    public void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        checkGalleryLock();
        checkKeyguardFlag();
    }

    public void onNewUriArrived(Uri uri, String str) {
        if (this.mCurrentModule != null) {
            this.mCurrentModule.onNewUriArrived(uri, str);
        }
        addSecureUriIfNecessary(uri);
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        super.onPause();
        getWindow().clearFlags(1024);
        if (this.mCameraScreenNail != null && !isShowBottomIntentDone() && !DataRepository.dataItemFeature().gU()) {
            Log.d(TAG, "onPause: readLastFrameGaussian...");
            this.mCameraScreenNail.readLastFrameGaussian();
        }
        if (this.mGLCoverDisposable != null) {
            this.mGLCoverDisposable.dispose();
        }
        if (this.mErrorDialog != null) {
            this.mErrorDialog.dismiss();
        }
        pause();
        if (startFromKeyguard() && this.mIsFinishInKeyguard) {
            Log.d(TAG, "onPause: clearFlag --> FLAG_TURN_SCREEN_ON");
            getWindow().clearFlags(2097152);
            if (this.mJumpFlag == 0) {
                finish();
            }
        }
        if (this.mJumpFlag == 0 && (startFromSecureKeyguard() || isGalleryLocked())) {
            this.mSecureUriList = null;
            this.mThumbnailUpdater.setThumbnail(null, true, false);
        } else if (this.mJumpFlag == 1) {
            clearNotification();
        }
        this.mHandler.removeMessages(1);
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        getWindow().addFlags(1024);
        showBlurCover();
        this.mLastJumpFlag = this.mJumpFlag;
        this.mJumpFlag = 0;
        checkGalleryLock();
        checkKeyguardFlag();
        resume();
    }

    /* access modifiers changed from: protected */
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        if (this.mCurrentModule != null) {
            this.mCurrentModule.onSaveInstanceState(bundle);
        }
    }

    public boolean onSearchRequested() {
        return false;
    }

    /* access modifiers changed from: protected */
    public void onStart() {
        super.onStart();
        this.mGLView.onResume();
    }

    /* access modifiers changed from: protected */
    public void onStop() {
        super.onStop();
        if (this.mGLView != null) {
            this.mGLView.onPause();
        }
    }

    public void pause() {
        this.mHandler.removeCallbacksAndMessages(null);
        this.mCameraBrightness.onPause();
        if (this.mCloseActivityThread != null) {
            try {
                this.mCloseActivityThread.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            this.mCloseActivityThread = null;
        }
        if (this.mLocationManager != null) {
            this.mLocationManager.recordLocation(false);
        }
        if (this.mThumbnailUpdater != null) {
            this.mThumbnailUpdater.saveThumbnailToFile();
            this.mThumbnailUpdater.cancelTask();
        }
    }

    public void playCameraSound(int i) {
        this.mCameraSound.playSound(i);
    }

    public void playCameraSound(int i, float f) {
        this.mCameraSound.playSound(i, f);
    }

    /* access modifiers changed from: protected */
    public void releaseCameraScreenNail() {
        Log.d(TAG, "releaseCameraScreenNail: ");
        if (this.mCameraScreenNail != null) {
            this.mCameraScreenNail.releaseSurfaceTexture();
        }
        if (this.mCurrentModule != null) {
            this.mCurrentModule.setFrameAvailable(false);
        }
    }

    public void resetStartTime() {
        this.mAppStartTime = 0;
    }

    public void resume() {
        if (this.mCameraSound == null) {
            this.mCameraSound = new MiuiCameraSound(this);
        }
        this.mLocationManager.recordLocation(CameraSettings.isRecordLocation());
        this.mCameraBrightness.onResume();
    }

    public void setErrorDialog(AlertDialog alertDialog) {
        this.mErrorDialog = alertDialog;
    }

    public void setJumpFlag(int i) {
        this.mJumpFlag = i;
    }

    public void setSwitchingModule(boolean z) {
        this.mIsSwitchingModule = z;
    }

    /* access modifiers changed from: protected */
    public void showBlurCover() {
        if (!isShowBottomIntentDone() && !this.mReleaseByModule && !isPostProcessing() && !getCameraIntentManager().isFromScreenSlide().booleanValue()) {
            if (!DataRepository.dataItemFeature().gU()) {
                final long currentTimeMillis = System.currentTimeMillis();
                this.mGLCoverDisposable = new Single<Bitmap>() {
                    /* access modifiers changed from: protected */
                    public void subscribeActual(SingleObserver<? super Bitmap> singleObserver) {
                        Bitmap lastFrameGaussianBitmap = ActivityBase.this.mCameraScreenNail != null ? ActivityBase.this.mCameraScreenNail.getLastFrameGaussianBitmap() : null;
                        if (lastFrameGaussianBitmap == null || lastFrameGaussianBitmap.isRecycled()) {
                            lastFrameGaussianBitmap = BitmapFactory.decodeFile(new File(ActivityBase.this.getFilesDir(), Util.LAST_FRAME_GAUSSIAN_FILE_NAME).getAbsolutePath());
                            Log.d(ActivityBase.TAG, "showBlurCover: blur bitmap from user blur file!");
                        } else {
                            Log.d(ActivityBase.TAG, "showBlurCover: blur bitmap from memory!");
                        }
                        singleObserver.onSuccess(lastFrameGaussianBitmap);
                    }
                }.subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer<? super T>) new Consumer<Bitmap>() {
                    public void accept(Bitmap bitmap) {
                        if (bitmap == null || bitmap.isRecycled()) {
                            ActivityBase.this.mGLCoverView.setVisibility(8);
                        } else {
                            Rect displayRect = Util.getDisplayRect(ActivityBase.this.getApplicationContext());
                            ((MarginLayoutParams) ActivityBase.this.mGLCoverView.getLayoutParams()).topMargin = displayRect.top;
                            ActivityBase.this.mGLCoverView.setMaxWidth(displayRect.right - displayRect.left);
                            ActivityBase.this.mGLCoverView.setMaxHeight(displayRect.bottom - displayRect.top);
                            ActivityBase.this.mGLCoverView.setImageBitmap(bitmap);
                            ActivityBase.this.mGLCoverView.setAlpha(1.0f);
                            ActivityBase.this.mGLCoverView.setVisibility(0);
                        }
                        String str = ActivityBase.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("showBlurCover: show... cost time = ");
                        sb.append(System.currentTimeMillis() - currentTimeMillis);
                        sb.append("ms");
                        Log.d(str, sb.toString());
                    }
                });
            } else {
                Rect displayRect = Util.getDisplayRect(getApplicationContext());
                MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.mGLCoverView.getLayoutParams();
                marginLayoutParams.topMargin = displayRect.top;
                marginLayoutParams.height = displayRect.bottom - displayRect.top;
                this.mGLCoverView.setBackgroundColor(2130706432);
                this.mGLCoverView.setAlpha(1.0f);
                this.mGLCoverView.setVisibility(0);
            }
        }
    }

    public void showDebugInfo(String str) {
        if (this.mDebugInfoView != null) {
            this.mDebugInfoView.setText(str);
        }
    }

    public void showErrorDialog() {
        this.mCameraErrorShown = true;
    }

    public boolean startFromKeyguard() {
        return this.mStartFromKeyguard;
    }

    public boolean startFromSecureKeyguard() {
        return this.mKeyguardSecureLocked;
    }

    /* access modifiers changed from: protected */
    public void trackAppLunchTimeStart(boolean z) {
        ScenarioTrackUtil.trackAppLunchTimeStart(z);
        this.mTrackAppLunchDisposable = new Single<HashMap>() {
            /* access modifiers changed from: protected */
            public void subscribeActual(SingleObserver<? super HashMap> singleObserver) {
                HashMap hashMap = new HashMap();
                String execCommand = Util.execCommand("cat /dev/cpuset/camera-daemon/cpus", false);
                if (execCommand != null) {
                    hashMap.put("cpus", execCommand);
                    String execCommand2 = Util.execCommand("cat $(dirname $(grep -nir \"xo_therm\" /sys/class/thermal/thermal_zone*/type))/temp", false);
                    if (execCommand2 != null) {
                        hashMap.put("temperature", execCommand2);
                        String execCommand3 = Util.execCommand("cat /proc/meminfo|grep -E 'MemFree|MemAvailable'", true);
                        if (execCommand3 != null) {
                            String[] split = execCommand3.split("\r\n");
                            if (split.length == 2) {
                                for (String split2 : split) {
                                    String[] split3 = split2.split(":");
                                    hashMap.put(split3[0], split3[1].replaceAll("\\D", ""));
                                }
                                singleObserver.onSuccess(hashMap);
                            }
                        }
                    }
                }
            }
        }.subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer<? super T>) new Consumer<HashMap>() {
            public void accept(HashMap hashMap) {
                ActivityBase.this.mAppLunchMap = hashMap;
            }
        });
    }

    public synchronized void updateSurfaceState(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("updateSurfaceState: ");
        sb.append(i);
        Log.d(str, sb.toString());
        this.mCurrentSurfaceState = i;
    }
}
