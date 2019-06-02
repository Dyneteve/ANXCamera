package com.google.zxing;

public final class PlanarYUVLuminanceSource extends LuminanceSource {
    private static final int THUMBNAIL_SCALE_FACTOR = 2;
    private final int dataHeight;
    private final int dataWidth;
    private final int left;
    private final int top;
    private final byte[] yuvData;

    public PlanarYUVLuminanceSource(byte[] bArr, int i, int i2, int i3, int i4, int i5, int i6, boolean z) {
        super(i5, i6);
        if (i3 + i5 > i || i4 + i6 > i2) {
            throw new IllegalArgumentException("Crop rectangle does not fit within image data.");
        }
        this.yuvData = bArr;
        this.dataWidth = i;
        this.dataHeight = i2;
        this.left = i3;
        this.top = i4;
        if (z) {
            reverseHorizontal(i5, i6);
        }
    }

    private void reverseHorizontal(int i, int i2) {
        byte[] bArr = this.yuvData;
        int i3 = 0;
        int i4 = (this.top * this.dataWidth) + this.left;
        while (i3 < i2) {
            int i5 = (i / 2) + i4;
            int i6 = i4;
            int i7 = (i4 + i) - 1;
            while (i6 < i5) {
                byte b = bArr[i6];
                bArr[i6] = bArr[i7];
                bArr[i7] = b;
                i6++;
                i7--;
            }
            i3++;
            i4 += this.dataWidth;
        }
    }

    public LuminanceSource crop(int i, int i2, int i3, int i4) {
        PlanarYUVLuminanceSource planarYUVLuminanceSource = new PlanarYUVLuminanceSource(this.yuvData, this.dataWidth, this.dataHeight, this.left + i, this.top + i2, i3, i4, false);
        return planarYUVLuminanceSource;
    }

    public byte[] getMatrix() {
        int width = getWidth();
        int height = getHeight();
        if (width == this.dataWidth && height == this.dataHeight) {
            return this.yuvData;
        }
        int i = width * height;
        byte[] bArr = new byte[i];
        int i2 = (this.top * this.dataWidth) + this.left;
        if (width == this.dataWidth) {
            System.arraycopy(this.yuvData, i2, bArr, 0, i);
            return bArr;
        }
        byte[] bArr2 = this.yuvData;
        for (int i3 = 0; i3 < height; i3++) {
            System.arraycopy(bArr2, i2, bArr, i3 * width, width);
            i2 += this.dataWidth;
        }
        return bArr;
    }

    public byte[] getRow(int i, byte[] bArr) {
        if (i < 0 || i >= getHeight()) {
            StringBuilder sb = new StringBuilder("Requested row is outside the image: ");
            sb.append(i);
            throw new IllegalArgumentException(sb.toString());
        }
        int width = getWidth();
        if (bArr == null || bArr.length < width) {
            bArr = new byte[width];
        }
        System.arraycopy(this.yuvData, ((this.top + i) * this.dataWidth) + this.left, bArr, 0, width);
        return bArr;
    }

    public int getThumbnailHeight() {
        return getHeight() / 2;
    }

    public int getThumbnailWidth() {
        return getWidth() / 2;
    }

    public boolean isCropSupported() {
        return true;
    }

    public int[] renderThumbnail() {
        int width = getWidth() / 2;
        int height = getHeight() / 2;
        int[] iArr = new int[(width * height)];
        byte[] bArr = this.yuvData;
        int i = (this.top * this.dataWidth) + this.left;
        for (int i2 = 0; i2 < height; i2++) {
            int i3 = i2 * width;
            for (int i4 = 0; i4 < width; i4++) {
                iArr[i3 + i4] = -16777216 | (1 * (bArr[(i4 * 2) + i] & -1));
            }
            i += this.dataWidth * 2;
        }
        return iArr;
    }
}
