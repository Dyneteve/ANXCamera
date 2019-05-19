package com.android.camera.module.loader;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraDevice.StateCallback;
import android.hardware.camera2.CameraManager;
import android.support.annotation.NonNull;
import com.android.camera.CameraAppImpl;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2OpenManager;
import io.reactivex.SingleEmitter;
import io.reactivex.SingleOnSubscribe;

public class SurfaceCreatedOnSubScribe implements SurfaceCreatedCallback, SingleOnSubscribe<Boolean> {
    /* access modifiers changed from: private */
    public SingleEmitter<Boolean> mSingleEmitter;
    private SurfaceStateListener mSurfaceStateListener;

    public SurfaceCreatedOnSubScribe(SurfaceStateListener surfaceStateListener) {
        this.mSurfaceStateListener = surfaceStateListener;
    }

    private void onSurfaceCreated(SingleEmitter<Boolean> singleEmitter) {
        this.mSingleEmitter = singleEmitter;
        openCamera2();
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:0x0030 A[LOOP:0: B:10:0x002e->B:11:0x0030, LOOP_END] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @SuppressLint({"MissingPermission"})
    @TargetApi(21)
    private void openCamera2() {
        String[] strArr;
        CameraManager cameraManager = (CameraManager) CameraAppImpl.getAndroidContext().getSystemService("camera");
        String[] strArr2 = new String[0];
        try {
            strArr = cameraManager.getCameraIdList();
            try {
                cameraManager.openCamera(strArr[0], new StateCallback() {
                    public void onDisconnected(@NonNull CameraDevice cameraDevice) {
                    }

                    public void onError(@NonNull CameraDevice cameraDevice, int i) {
                    }

                    public void onOpened(@NonNull CameraDevice cameraDevice) {
                        SurfaceCreatedOnSubScribe.this.mSingleEmitter.onSuccess(Boolean.valueOf(true));
                    }
                }, Camera2OpenManager.getInstance().getCameraHandler());
            } catch (CameraAccessException e) {
                e = e;
            }
        } catch (CameraAccessException e2) {
            e = e2;
            strArr = strArr2;
            e.printStackTrace();
            while (r1 < r0) {
            }
        }
        for (String str : strArr) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append("");
            Log.e("ids:", sb.toString());
        }
    }

    public void onGlSurfaceCreated() {
        if (this.mSingleEmitter != null && !this.mSingleEmitter.isDisposed()) {
            onSurfaceCreated(this.mSingleEmitter);
            this.mSingleEmitter = null;
        }
    }

    public void subscribe(SingleEmitter<Boolean> singleEmitter) throws Exception {
        if (this.mSurfaceStateListener.hasSurface()) {
            this.mSingleEmitter = null;
            onSurfaceCreated(singleEmitter);
            return;
        }
        this.mSingleEmitter = singleEmitter;
    }
}
