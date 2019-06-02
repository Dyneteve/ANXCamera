package com.android.camera.panorama;

import android.media.Image;
import android.media.Image.Plane;
import java.nio.ByteBuffer;

public abstract class AttachRunnable implements Runnable {
    protected final ByteBuffer[] byteBuffer = new ByteBuffer[3];
    private boolean isNativeBuffer = false;
    protected final int[] pixelStride = new int[3];
    protected final int[] rowStride = new int[3];
    protected CaptureImage srcImage;

    private static ByteBuffer createBuffer(byte[] bArr, int i, int i2) {
        ByteBuffer allocateBuffer = NativeMemoryAllocator.allocateBuffer(i2);
        allocateBuffer.put(bArr, i, i2);
        allocateBuffer.clear();
        return allocateBuffer;
    }

    private void setPlane(Plane plane, int i) {
        this.byteBuffer[i] = plane.getBuffer();
        this.rowStride[i] = plane.getRowStride();
        this.pixelStride[i] = plane.getPixelStride();
    }

    /* access modifiers changed from: protected */
    public void closeSrc() {
        this.srcImage.close();
        if (this.isNativeBuffer) {
            NativeMemoryAllocator.freeBuffer(this.byteBuffer[0]);
            NativeMemoryAllocator.freeBuffer(this.byteBuffer[1]);
            NativeMemoryAllocator.freeBuffer(this.byteBuffer[2]);
            this.byteBuffer[0] = null;
            this.byteBuffer[1] = null;
            this.byteBuffer[2] = null;
            this.isNativeBuffer = false;
        }
    }

    /* access modifiers changed from: protected */
    public void setImage(CaptureImage captureImage) {
        Image image = captureImage.image();
        if (image != null) {
            Plane[] planes = image.getPlanes();
            setPlane(planes[0], 0);
            setPlane(planes[1], 1);
            setPlane(planes[2], 2);
        } else {
            int width = captureImage.getWidth();
            int height = captureImage.getHeight();
            byte[] raw = captureImage.raw();
            int i = height * width;
            this.byteBuffer[0] = createBuffer(raw, 0, i);
            int i2 = i / 2;
            this.byteBuffer[1] = createBuffer(raw, i + 1, i2 - 1);
            this.byteBuffer[2] = createBuffer(raw, i, i2);
            this.rowStride[0] = width;
            this.rowStride[1] = width;
            this.rowStride[2] = width;
            this.pixelStride[0] = 1;
            this.pixelStride[1] = 2;
            this.pixelStride[2] = 2;
            this.isNativeBuffer = true;
        }
        this.srcImage = captureImage;
    }
}
