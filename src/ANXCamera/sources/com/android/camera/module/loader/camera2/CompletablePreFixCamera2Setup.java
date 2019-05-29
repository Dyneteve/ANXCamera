package com.android.camera.module.loader.camera2;

import android.content.Intent;
import android.support.annotation.WorkerThread;
import android.support.v4.util.Pair;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraScreenNail;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.ThermalDetector;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.log.Log;
import com.android.camera.module.Module;
import com.android.camera.module.loader.StartControl;
import com.android.camera.network.util.NetworkUtils;
import com.ss.android.ttve.common.TEDefine;
import io.reactivex.CompletableEmitter;
import io.reactivex.CompletableOnSubscribe;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;

public class CompletablePreFixCamera2Setup implements CompletableOnSubscribe, Observer<Camera2Result> {
    private static final String TAG = "prefix";
    private boolean isFromVoiceControl;
    private CameraScreenNail mCameraScreenNail;
    private CompletableEmitter mEmitter;
    private boolean mFromScreenSlide;
    private Intent mIntent;
    private Module mLastMode;
    private boolean mModuleChanged;
    private boolean mNeedBlur;
    private boolean mNeedConfigData;
    private boolean mStartFromKeyguard;

    public CompletablePreFixCamera2Setup(Module module, StartControl startControl, CameraScreenNail cameraScreenNail, Intent intent, boolean z, boolean z2) {
        this.mLastMode = module;
        if (startControl != null) {
            this.mNeedBlur = startControl.mNeedBlurAnimation;
            this.mFromScreenSlide = startControl.mFromScreenSlide;
            this.mNeedConfigData = startControl.mNeedReConfigureData;
        }
        boolean z3 = startControl == null || module == null || startControl.mTargetMode != module.getModuleIndex();
        this.mModuleChanged = z3;
        this.mCameraScreenNail = cameraScreenNail;
        this.mIntent = intent;
        this.mStartFromKeyguard = z;
        this.isFromVoiceControl = z2;
    }

    private void closeLastModule() {
        if (this.mLastMode != null) {
            this.mLastMode.unRegisterProtocol();
            this.mLastMode.onPause();
            this.mLastMode.onStop();
            this.mLastMode.onDestroy();
        }
    }

    private boolean isLastModuleAlive() {
        return this.mLastMode != null && this.mLastMode.isCreated();
    }

    public void onComplete() {
    }

    public void onError(Throwable th) {
    }

    public void onNext(Camera2Result camera2Result) {
        this.mEmitter.onComplete();
    }

    public void onSubscribe(Disposable disposable) {
    }

    @WorkerThread
    public void subscribe(CompletableEmitter completableEmitter) {
        int i;
        int i2;
        this.mEmitter = completableEmitter;
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("mModuleChanged ");
        sb.append(this.mModuleChanged);
        sb.append(" LastMode is ");
        sb.append(this.mLastMode == null ? TEDefine.FACE_BEAUTY_NULL : Integer.valueOf(this.mLastMode.getModuleIndex()));
        Log.d(str, sb.toString());
        if (this.mModuleChanged) {
            if (this.mLastMode != null) {
                this.mLastMode.unRegisterModulePersistProtocol();
            }
            HybridZoomingSystem.clearZoomRatioHistory();
        }
        if (isLastModuleAlive()) {
            if (this.mNeedConfigData) {
                DataRepository.getInstance().backUp().backupRunning(DataRepository.dataItemRunning(), dataItemGlobal.getDataBackUpKey(this.mLastMode.getModuleIndex()), dataItemGlobal.getLastCameraId(), true);
            }
            closeLastModule();
        }
        if (this.mNeedBlur) {
            this.mCameraScreenNail.animateModuleCopyTexture(this.mFromScreenSlide);
        }
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("subscribe: mIntent = ");
        sb2.append(this.mIntent);
        Log.d(str2, sb2.toString());
        if (this.mIntent != null) {
            Pair parseIntent = dataItemGlobal.parseIntent(this.mIntent, Boolean.valueOf(this.isFromVoiceControl), this.mStartFromKeyguard, true, true);
            int intValue = ((Integer) parseIntent.first).intValue();
            int intValue2 = ((Integer) parseIntent.second).intValue();
            ThermalDetector.getInstance().onCreate(CameraAppImpl.getAndroidContext());
            if (DataRepository.dataItemFeature().fO()) {
                NetworkUtils.tryRequestTTSticker();
            }
            int i3 = intValue;
            i2 = intValue2;
            i = i3;
        } else {
            i = dataItemGlobal.getCurrentCameraId();
            i2 = dataItemGlobal.getCurrentMode();
        }
        String str3 = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("openCamera: pendingOpenId = ");
        sb3.append(i);
        sb3.append(", pendingOpenModule = ");
        sb3.append(i2);
        Log.d(str3, sb3.toString());
        Camera2OpenManager.getInstance().openCamera(i, i2, this, DataRepository.dataItemFeature().gh());
    }
}
