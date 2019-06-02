package com.android.zxing;

import android.media.Image;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.lens.LensAgent;

class GoogleLensDecoder extends Decoder {
    private int mSensorOrientation;

    GoogleLensDecoder() {
    }

    public void init(int i) {
        this.mSensorOrientation = Camera2DataContainer.getInstance().getCapabilities(i).getSensorOrientation();
    }

    /* access modifiers changed from: protected */
    public boolean isNeedImage() {
        return true;
    }

    public boolean needPreviewFrame() {
        return true;
    }

    public void onPreviewFrame(Image image) {
        super.onPreviewFrame(image);
        LensAgent.getInstance().onNewImage(image, this.mSensorOrientation);
    }

    public void onPreviewFrame(PreviewImage previewImage) {
    }

    public void reset() {
    }

    public void startDecode() {
    }
}
