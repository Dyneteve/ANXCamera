package com.android.camera.module.loader.camera2;

import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera.module.loader.SurfaceCreatedCallback;
import com.android.camera.module.loader.SurfaceStateListener;
import com.android.camera.snap.SnapTrigger;
import io.reactivex.Observer;
import io.reactivex.SingleEmitter;
import io.reactivex.SingleOnSubscribe;
import io.reactivex.disposables.Disposable;

public class Camera2OpenOnSubScribe implements SurfaceCreatedCallback, Observer<Camera2Result>, SingleOnSubscribe<Camera2Result> {
    private static final String TAG = "Camera2OpenOnSubScribe";
    private Camera2Result mCamera2Result;
    private SingleEmitter<Camera2Result> mSingleEmitter;
    private SurfaceStateListener mSurfaceStateListener;

    public Camera2OpenOnSubScribe(SurfaceStateListener surfaceStateListener) {
        this.mSurfaceStateListener = surfaceStateListener;
    }

    private void openCamera() {
        if (SnapTrigger.getInstance().isRunning()) {
            SnapTrigger.getInstance();
            SnapTrigger.destroy();
        }
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        int currentCameraId = dataItemGlobal.getCurrentCameraId();
        int currentMode = dataItemGlobal.getCurrentMode();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("openCamera: pendingOpenId = ");
        sb.append(currentCameraId);
        sb.append(", pendingOpenModule = ");
        sb.append(currentMode);
        Log.d(str, sb.toString());
        Camera2OpenManager.getInstance().openCamera(currentCameraId, currentMode, this, false);
    }

    private void submitResult(Camera2Result camera2Result) {
        if (this.mSingleEmitter != null) {
            this.mSingleEmitter.onSuccess(camera2Result);
        }
    }

    public void onComplete() {
    }

    public void onError(Throwable th) {
        this.mCamera2Result = Camera2Result.create(3);
        submitResult(this.mCamera2Result);
    }

    public void onGlSurfaceCreated() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onGlSurfaceCreated: mSingleEmitter = ");
        sb.append(this.mSingleEmitter);
        Log.d(str, sb.toString());
        if (!(this.mSingleEmitter == null || this.mSingleEmitter.isDisposed() || this.mCamera2Result == null)) {
            submitResult(this.mCamera2Result);
        }
    }

    public void onNext(Camera2Result camera2Result) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onNext: hasSurface = ");
        sb.append(this.mSurfaceStateListener.hasSurface());
        Log.d(str, sb.toString());
        this.mCamera2Result = camera2Result;
        if (ModuleManager.isCapture() || this.mSurfaceStateListener.hasSurface()) {
            submitResult(camera2Result);
        }
    }

    public void onSubscribe(Disposable disposable) {
    }

    public void subscribe(SingleEmitter<Camera2Result> singleEmitter) throws Exception {
        this.mCamera2Result = null;
        this.mSingleEmitter = singleEmitter;
        openCamera();
    }
}
