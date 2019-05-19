package com.android.camera2;

import android.media.Image;
import com.android.camera.log.Log;
import com.android.camera.panorama.CaptureImage;
import java.nio.ByteBuffer;

public class PreviewImageProp extends CaptureImage {
    private static final String TAG = PreviewImageProp.class.getSimpleName();
    private byte[] mData;
    private Image mImage;
    private byte[] mNoStrideData;
    private boolean mReady = false;
    private int mUVStride;
    private int mYLength;
    private int mYStride;

    public PreviewImageProp(Image image) {
        super(image);
        this.mImage = image;
    }

    private void convert() {
        if (this.mImage != null) {
            Image image = this.mImage;
            if (image != null && image.getFormat() == 35) {
                ByteBuffer buffer = image.getPlanes()[0].getBuffer();
                ByteBuffer buffer2 = image.getPlanes()[2].getBuffer();
                int limit = buffer.limit();
                int limit2 = buffer2.limit();
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("convertYUV420888ToNV21: ");
                sb.append(image.getWidth());
                sb.append("x");
                sb.append(image.getHeight());
                sb.append(" ");
                sb.append(image.getPlanes()[2].getRowStride());
                Log.v(str, sb.toString());
                this.mData = new byte[(limit + limit2)];
                buffer.get(this.mData, 0, limit);
                buffer2.get(this.mData, limit, limit2);
                this.mYLength = limit;
                this.mYStride = image.getPlanes()[0].getRowStride();
                this.mUVStride = image.getPlanes()[2].getRowStride();
                Log.e("convert:", "yes");
            }
            image.close();
        }
        this.mImage = null;
        this.mReady = true;
    }

    public static byte[] removePadding(PreviewImageProp previewImageProp, int i, int i2) {
        byte[] data = previewImageProp.getData();
        double d = ((double) (i * i2)) * 1.5d;
        if (((double) data.length) <= d) {
            Log.d(TAG, "removePadding: no padding found in data");
            return data;
        }
        byte[] bArr = new byte[((int) d)];
        int i3 = 0;
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        while (i4 < i2) {
            System.arraycopy(data, i5, bArr, i6, i);
            i5 = i4 == i2 + -1 ? i5 + i : i5 + previewImageProp.getYStride();
            i6 += i;
            i4++;
        }
        while (true) {
            int i7 = i2 / 2;
            if (i3 >= i7) {
                return bArr;
            }
            if (i3 == i7 - 1) {
                System.arraycopy(data, i5, bArr, i6, i - 1);
            } else {
                System.arraycopy(data, i5, bArr, i6, i);
            }
            i5 += previewImageProp.getUVStride();
            i6 += i;
            i3++;
        }
    }

    public void close() {
        if (this.mImage != null) {
            this.mImage.close();
            this.mImage = null;
        }
    }

    public byte[] getData() {
        if (!this.mReady) {
            convert();
        }
        return this.mData;
    }

    public int getHeight() {
        if (this.mImage != null) {
            return this.mImage.getHeight();
        }
        return 0;
    }

    public String getImageFormat() {
        return null;
    }

    public int getUVStride() {
        if (!this.mReady) {
            convert();
        }
        return this.mUVStride;
    }

    public int getWidth() {
        if (this.mImage != null) {
            return this.mImage.getWidth();
        }
        return 0;
    }

    public int getYLength() {
        if (!this.mReady) {
            convert();
        }
        return this.mYLength;
    }

    public int getYStride() {
        if (!this.mReady) {
            convert();
        }
        return this.mYStride;
    }
}
