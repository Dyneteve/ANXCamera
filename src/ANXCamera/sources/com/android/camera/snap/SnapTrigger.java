package com.android.camera.snap;

import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.os.PowerManager;
import android.os.Vibrator;
import android.view.ViewConfiguration;
import com.android.camera.GeneralUtils;
import com.android.camera.ProximitySensorLock;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera.snap.SnapCamera.SnapStatusListener;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.storage.Storage;

public class SnapTrigger implements SnapStatusListener {
    private static final int INTERVAL_DELAY = 200;
    private static final int MAX_BURST_COUNT = 100;
    public static final int MAX_VIDEO_DURATION = 300000;
    public static final String STREET_SNAP_CHANNEL_ID = "com.android.camera.streetsnap";
    /* access modifiers changed from: private */
    public static final String TAG = SnapTrigger.class.getSimpleName();
    private static final int TRIGGER_KEY = 25;
    private static SnapTrigger sInstance;
    /* access modifiers changed from: private */
    public int mBurstCount = 0;
    /* access modifiers changed from: private */
    public SnapCamera mCamera = null;
    private boolean mCameraOpened;
    private Context mContext;
    /* access modifiers changed from: private */
    public Handler mHandler;
    private final Runnable mLongPressRunnable = new Runnable() {
        public void run() {
            SnapTrigger.this.initCamera();
        }
    };
    /* access modifiers changed from: private */
    public PowerManager mPowerManager = null;
    private ProximitySensorLock mProximityLock;
    private final Runnable mSnapRunnable = new Runnable() {
        public void run() {
            if (SnapTrigger.this.mCamera != null) {
                if (SnapTrigger.this.mPowerManager != null && SnapTrigger.this.mPowerManager.isScreenOn()) {
                    Log.d(SnapTrigger.TAG, "isScreenOn is true, stop take snap");
                    SnapTrigger.this.mHandler.removeMessages(101);
                } else if (!SnapTrigger.this.shouldQuitSnap() && Storage.getAvailableSpace() >= Storage.LOW_STORAGE_THRESHOLD) {
                    if (SnapTrigger.this.mCamera.isCamcorder()) {
                        SnapTrigger.this.shutdownWatchDog();
                        SnapTrigger.this.vibratorShort();
                        SnapTrigger.this.mCamera.startCamcorder();
                        Log.d(SnapTrigger.TAG, "take movie");
                        CameraStatUtil.trackSnapInfo(true);
                    } else {
                        SnapTrigger.this.triggerWatchdog(false);
                        SnapTrigger.this.mCamera.takeSnap();
                        SnapTrigger.this.mBurstCount = SnapTrigger.this.mBurstCount + 1;
                        Log.d(SnapTrigger.TAG, "take snap");
                        CameraStatUtil.trackSnapInfo(false);
                    }
                }
            }
        }
    };

    public static synchronized void destroy() {
        synchronized (SnapTrigger.class) {
            if (sInstance != null) {
                sInstance.onDestroy();
                sInstance.mBurstCount = 0;
                if (sInstance.mCamera != null) {
                    sInstance.mCamera.release();
                    sInstance.mCamera = null;
                }
                sInstance.mHandler = null;
                sInstance.mContext = null;
                sInstance = null;
            }
        }
    }

    public static SnapTrigger getInstance() {
        if (sInstance == null) {
            sInstance = new SnapTrigger();
        }
        return sInstance;
    }

    /* access modifiers changed from: private */
    public void initCamera() {
        if (this.mCamera == null && this.mContext != null) {
            this.mCameraOpened = false;
            this.mCamera = new SnapCamera(this.mContext, this);
        }
    }

    public static void notifyForDetail(Context context, Uri uri, String str, String str2, boolean z) {
        GeneralUtils.notifyForDetail(context, uri, str, str2, z);
    }

    private void onDestroy() {
        if (this.mProximityLock != null) {
            this.mProximityLock.destroy();
        }
        this.mProximityLock = null;
    }

    /* access modifiers changed from: private */
    public boolean shouldQuitSnap() {
        if (!ProximitySensorLock.enabled() || !Util.isNonUIEnabled()) {
            return this.mProximityLock != null && this.mProximityLock.shouldQuitSnap();
        }
        boolean isNonUI = Util.isNonUI();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("shouldQuitSnap isNonUI = ");
        sb.append(isNonUI);
        Log.d(str, sb.toString());
        if (isNonUI) {
            CameraStatUtil.track(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_POCKET_MODE_ENTER, CameraStat.PARAM_COMMON_MODE, CameraStat.POCKET_MODE_NONUI_ENTER_SNAP);
        }
        return isNonUI;
    }

    /* access modifiers changed from: private */
    public void shutdownWatchDog() {
        if (this.mHandler != null) {
            Log.d(TAG, "watch dog Off");
            this.mHandler.removeMessages(101);
        }
    }

    /* access modifiers changed from: private */
    public void triggerWatchdog(boolean z) {
        if (this.mHandler != null) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("watch dog On -");
            sb.append(z);
            Log.d(str, sb.toString());
            this.mHandler.removeMessages(101);
            this.mHandler.sendEmptyMessageDelayed(101, z ? 0 : 5000);
        }
    }

    private void vibrator(long[] jArr) {
        try {
            Log.d(TAG, "call vibrate to notify");
            ((Vibrator) this.mContext.getSystemService("vibrator")).vibrate(jArr, -1);
        } catch (Exception e) {
            Log.e(TAG, "vibrator exception", e);
        }
    }

    /* access modifiers changed from: private */
    public void vibratorShort() {
        vibrator(new long[]{10, 20});
    }

    public void handleKeyEvent(int i, int i2, long j) {
        if (isRunning()) {
            boolean z = true;
            if (i == 25) {
                if (i2 == 0) {
                    this.mHandler.postDelayed(this.mLongPressRunnable, ViewConfiguration.getGlobalActionKeyTimeout());
                } else if (i2 == 1) {
                    this.mHandler.removeCallbacks(this.mLongPressRunnable);
                    this.mHandler.removeCallbacks(this.mSnapRunnable);
                    triggerWatchdog(z);
                }
            } else if (i == 26) {
                this.mHandler.removeCallbacks(this.mLongPressRunnable);
                this.mHandler.removeCallbacks(this.mSnapRunnable);
                triggerWatchdog(z);
            }
            z = false;
            triggerWatchdog(z);
        }
    }

    public synchronized boolean init(Context context, Handler handler) {
        this.mContext = context;
        this.mHandler = handler;
        this.mPowerManager = (PowerManager) context.getSystemService("power");
        if (ProximitySensorLock.enabled() && !Util.isNonUIEnabled()) {
            this.mProximityLock = new ProximitySensorLock(this.mContext);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("init, create a new instance -> ");
            sb.append(this.mProximityLock);
            Log.d(str, sb.toString());
            this.mProximityLock.startWatching();
        }
        return isRunning();
    }

    public synchronized boolean isRunning() {
        return (this.mContext == null || this.mHandler == null) ? false : true;
    }

    public void onCameraOpened() {
        if (!isRunning()) {
            Log.w(TAG, "onCameraOpened: exit");
            return;
        }
        Log.d(TAG, "onCameraOpened");
        this.mCameraOpened = true;
        if (this.mHandler != null) {
            this.mHandler.postDelayed(this.mSnapRunnable, this.mCamera.isCamcorder() ? 100 : 0);
        }
    }

    public void onDone(Uri uri) {
        if (isRunning()) {
            triggerWatchdog(false);
            vibratorShort();
            if (!this.mCamera.isCamcorder() && this.mBurstCount < 100) {
                this.mHandler.postDelayed(this.mSnapRunnable, 200);
            }
            if (uri != null) {
                notifyForDetail(this.mContext, uri, this.mContext.getString(R.string.camera_snap_mode_title), this.mContext.getString(R.string.camera_snap_mode_title_detail), this.mCamera.isCamcorder());
            }
        }
    }

    public void onSkipCapture() {
        if (!isRunning()) {
            Log.w(TAG, "onSkipCapture: exit");
            return;
        }
        Log.d(TAG, "onSkipCapture");
        this.mBurstCount--;
        if (this.mHandler != null) {
            this.mHandler.postDelayed(this.mSnapRunnable, 200);
        }
    }
}
