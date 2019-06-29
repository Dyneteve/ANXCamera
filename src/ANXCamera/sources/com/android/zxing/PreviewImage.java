package com.android.zxing;

import android.media.Image;
import com.android.camera.log.Log;
import java.nio.ByteBuffer;
import java.util.Arrays;

public class PreviewImage {
    public static final int PREVIEW_STATUS_NORMAL = 2;
    public static final int PREVIEW_STATUS_START = 1;
    public static final int PREVIEW_STATUS_STOP = 3;
    public static final int PREVIEW_STATUS_UNKNOWN = 0;
    private static final String TAG = "PreviewImage";
    private int mCameraId;
    private byte[] mData;
    private int mFormat;
    private int mHeight;
    private int mOrientation;
    private int mPreviewStatus = 0;
    private long mTimestamp;
    private int mWidth;

    public PreviewImage(int i, int i2) {
        this.mPreviewStatus = i;
        this.mCameraId = i2;
    }

    public PreviewImage(Image image, int i) {
        long currentTimeMillis = System.currentTimeMillis();
        convertYUV420ToNV21(image);
        this.mOrientation = i;
        this.mPreviewStatus = 2;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("PreviewDecodeManager convertYUV420ToNV21: cost = ");
        sb.append(System.currentTimeMillis() - currentTimeMillis);
        sb.append("ms");
        Log.d(str, sb.toString());
    }

    private void convertYUV420ToNV21(Image image) {
        if (image != null) {
            try {
                if (image.getFormat() == 35) {
                    this.mTimestamp = image.getTimestamp();
                    this.mWidth = image.getWidth();
                    this.mHeight = image.getHeight();
                    this.mFormat = image.getFormat();
                    int rowStride = image.getPlanes()[0].getRowStride();
                    int rowStride2 = image.getPlanes()[2].getRowStride();
                    ByteBuffer buffer = image.getPlanes()[0].getBuffer();
                    ByteBuffer buffer2 = image.getPlanes()[2].getBuffer();
                    int limit = buffer.limit();
                    int limit2 = buffer2.limit();
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("convertYUV420888ToNV21: size = ");
                    sb.append(this.mWidth);
                    sb.append("x");
                    sb.append(this.mHeight);
                    sb.append(", yStride = ");
                    sb.append(rowStride);
                    sb.append(", uvStride = ");
                    sb.append(rowStride2);
                    Log.v(str, sb.toString());
                    this.mData = new byte[(limit + limit2)];
                    buffer.get(this.mData, 0, limit);
                    buffer2.get(this.mData, limit, limit2);
                    if (((double) this.mData.length) > ((double) (this.mWidth * this.mHeight)) * 1.5d) {
                        byte[] bArr = new byte[((int) (((double) (this.mWidth * this.mHeight)) * 1.5d))];
                        int i = 0;
                        int i2 = 0;
                        int i3 = 0;
                        while (i < this.mHeight) {
                            System.arraycopy(this.mData, i2, bArr, i3, this.mWidth);
                            i2 = i == this.mHeight + -1 ? i2 + this.mWidth : i2 + rowStride;
                            i3 += this.mWidth;
                            i++;
                        }
                        for (int i4 = 0; i4 < this.mHeight / 2; i4++) {
                            if (i4 == (this.mHeight / 2) - 1) {
                                System.arraycopy(this.mData, i2, bArr, i3, this.mWidth - 1);
                            } else {
                                System.arraycopy(this.mData, i2, bArr, i3, this.mWidth);
                            }
                            i2 += rowStride2;
                            i3 += this.mWidth;
                        }
                        this.mData = bArr;
                    }
                }
            } catch (Exception e) {
            }
        }
    }

    public int getCameraId() {
        return this.mCameraId;
    }

    public byte[] getData() {
        return this.mData;
    }

    public int getFormat() {
        return this.mFormat;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public int getOrientation() {
        return this.mOrientation;
    }

    public int getPreviewStatus() {
        return this.mPreviewStatus;
    }

    public long getTimestamp() {
        return this.mTimestamp;
    }

    public int getWidth() {
        return this.mWidth;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("PreviewImage{mData=");
        sb.append(Arrays.toString(this.mData));
        sb.append(", mTimestamp=");
        sb.append(this.mTimestamp);
        sb.append(", mWidth=");
        sb.append(this.mWidth);
        sb.append(", mHeight=");
        sb.append(this.mHeight);
        sb.append(", mFormat=");
        sb.append(this.mFormat);
        sb.append('}');
        return sb.toString();
    }
}
