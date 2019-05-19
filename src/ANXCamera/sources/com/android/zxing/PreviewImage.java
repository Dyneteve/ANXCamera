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
    private int mPreviewStatus;
    private long mTimestamp;
    private int mWidth;

    public PreviewImage(int i, int i2) {
        this.mPreviewStatus = 0;
        this.mPreviewStatus = i;
        this.mCameraId = i2;
    }

    public PreviewImage(Image image, int i) {
        this(image, -1, -1, i);
    }

    public PreviewImage(Image image, int i, int i2, int i3) {
        this.mPreviewStatus = 0;
        long currentTimeMillis = System.currentTimeMillis();
        convertYUV420ToNV21(image, i, i2);
        this.mOrientation = i3;
        this.mPreviewStatus = 2;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("PreviewDecodeManager convertYUV420ToNV21: cost = ");
        sb.append(System.currentTimeMillis() - currentTimeMillis);
        sb.append("ms");
        Log.d(str, sb.toString());
    }

    private void convertYUV420ToNV21(Image image, int i, int i2) {
        if (image != null) {
            try {
                if (image.getFormat() == 35) {
                    this.mTimestamp = image.getTimestamp();
                    this.mWidth = image.getWidth();
                    this.mHeight = image.getHeight();
                    this.mFormat = image.getFormat();
                    if (i < 0 || i2 < 0) {
                        i = this.mWidth;
                        i2 = this.mHeight;
                    }
                    int i3 = 0;
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
                    double d = ((double) (i * i2)) * 1.5d;
                    if (((double) this.mData.length) > d) {
                        byte[] bArr = new byte[((int) d)];
                        int i4 = 0;
                        int i5 = 0;
                        int i6 = 0;
                        while (i4 < i2) {
                            System.arraycopy(this.mData, i5, bArr, i6, i);
                            i5 = i4 == i2 + -1 ? i5 + i : i5 + rowStride;
                            i6 += i;
                            i4++;
                        }
                        while (true) {
                            int i7 = i2 / 2;
                            if (i3 < i7) {
                                if (i3 == i7 - 1) {
                                    System.arraycopy(this.mData, i5, bArr, i6, i - 1);
                                } else {
                                    System.arraycopy(this.mData, i5, bArr, i6, i);
                                }
                                i5 += rowStride2;
                                i6 += i;
                                i3++;
                            } else {
                                this.mData = bArr;
                                return;
                            }
                        }
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
