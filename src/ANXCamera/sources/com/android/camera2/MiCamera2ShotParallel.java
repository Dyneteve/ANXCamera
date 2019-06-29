package com.android.camera2;

import android.media.Image;
import android.util.Size;
import com.android.camera.CameraSize;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.parallel.AlgoConnector;
import com.xiaomi.camera.base.CameraDeviceUtil;
import com.xiaomi.engine.BufferFormat;
import com.xiaomi.engine.GraphDescriptorBean;

public abstract class MiCamera2ShotParallel<T> extends MiCamera2Shot<T> {
    private static final String TAG = "ShotParallelBase";
    CameraSize mCapturedImageSize;

    MiCamera2ShotParallel(MiCamera2 miCamera2) {
        super(miCamera2);
    }

    private boolean hasDualCamera() {
        return this.mMiCamera.getId() == Camera2DataContainer.getInstance().getSATFrontCameraId() || this.mMiCamera.getId() == Camera2DataContainer.getInstance().getBokehFrontCameraId() || this.mMiCamera.getId() == Camera2DataContainer.getInstance().getSATCameraId() || this.mMiCamera.getId() == Camera2DataContainer.getInstance().getBokehCameraId() || this.mMiCamera.getId() == Camera2DataContainer.getInstance().getUltraWideBokehCameraId();
    }

    /* access modifiers changed from: 0000 */
    public void configParallelSession(Size size) {
        GraphDescriptorBean graphDescriptorBean;
        if (ModuleManager.isPortraitModule()) {
            int i = hasDualCamera() ? 2 : 1;
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("configParallelSession: inputStreamNum = ");
            sb.append(i);
            Log.d(str, sb.toString());
            graphDescriptorBean = new GraphDescriptorBean(32770, i, true, CameraDeviceUtil.getCameraCombinationMode(this.mMiCamera.getId()));
        } else {
            graphDescriptorBean = new GraphDescriptorBean(0, 1, true, CameraDeviceUtil.getCameraCombinationMode(this.mMiCamera.getId()));
        }
        int width = size.getWidth();
        int height = size.getHeight();
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("[QCFA] configParallelSession: pictureSize = ");
        sb2.append(size);
        Log.d(str2, sb2.toString());
        AlgoConnector.getInstance().getLocalBinder().configCaptureSession(new BufferFormat(width, height, 35, graphDescriptorBean));
        this.mCapturedImageSize = new CameraSize(size);
    }

    /* access modifiers changed from: protected */
    public void notifyResultData(T t) {
    }

    /* access modifiers changed from: protected */
    public void onImageReceived(Image image, int i) {
    }
}
