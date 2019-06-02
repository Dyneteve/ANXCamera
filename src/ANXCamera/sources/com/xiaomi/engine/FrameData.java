package com.xiaomi.engine;

import android.media.Image;
import android.os.Parcelable;
import android.util.Log;

public class FrameData {
    private static final String TAG = FrameData.class.getSimpleName();
    private Image mBufferImage;
    private Parcelable mCaptureResultMetadataNative;
    private long mFrameNumber;
    private FrameStatusCallback mFrameStatusCallback;
    private int mImageFlag;
    private int mSequenceId;

    public interface FrameStatusCallback {
        void onFrameImageClosed(Image image);
    }

    public FrameData(int i, int i2, long j, Parcelable parcelable, Image image) {
        this.mImageFlag = i;
        this.mSequenceId = i2;
        this.mFrameNumber = j;
        this.mCaptureResultMetadataNative = parcelable;
        this.mBufferImage = image;
    }

    public Image getBufferImage() {
        return this.mBufferImage;
    }

    public Parcelable getCaptureResultMetaDataNative() {
        return this.mCaptureResultMetadataNative;
    }

    public FrameStatusCallback getFrameCallback() {
        return this.mFrameStatusCallback;
    }

    public long getFrameNumber() {
        return this.mFrameNumber;
    }

    public int getImageFlag() {
        return this.mImageFlag;
    }

    public int getSequenceId() {
        return this.mSequenceId;
    }

    public void release() {
        if (this.mBufferImage != null) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("release: close Image: ");
            sb.append(this.mBufferImage);
            Log.d(str, sb.toString());
            this.mBufferImage.close();
            if (this.mFrameStatusCallback != null) {
                this.mFrameStatusCallback.onFrameImageClosed(this.mBufferImage);
            }
        }
    }

    public void setBufferImage(Image image) {
        this.mBufferImage = image;
    }

    public void setCaptureResultMetaDataNative(Parcelable parcelable) {
        this.mCaptureResultMetadataNative = parcelable;
    }

    public void setFrameCallback(FrameStatusCallback frameStatusCallback) {
        this.mFrameStatusCallback = frameStatusCallback;
    }

    public void setFrameNumber(long j) {
        this.mFrameNumber = j;
    }

    public void setImageFlag(int i) {
        this.mImageFlag = i;
    }

    public void setSequenceId(int i) {
        this.mSequenceId = i;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("FrameData{ mImageFlag=");
        sb.append(this.mImageFlag);
        sb.append(", mFrameNumber=");
        sb.append(this.mFrameNumber);
        sb.append(", mCaptureResultMetadataNative=");
        sb.append(this.mCaptureResultMetadataNative);
        sb.append(", mBufferImage=");
        sb.append(this.mBufferImage);
        sb.append('}');
        return sb.toString();
    }
}
