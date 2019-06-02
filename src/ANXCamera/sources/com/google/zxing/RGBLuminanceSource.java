package com.google.zxing;

public final class RGBLuminanceSource extends LuminanceSource {
    private final int dataHeight;
    private final int dataWidth;
    private final int left;
    private final byte[] luminances;
    private final int top;

    public RGBLuminanceSource(int i, int i2, int[] iArr) {
        super(i, i2);
        this.dataWidth = i;
        this.dataHeight = i2;
        this.left = 0;
        this.top = 0;
        this.luminances = new byte[(i * i2)];
        for (int i3 = 0; i3 < i2; i3++) {
            int i4 = i3 * i;
            for (int i5 = 0; i5 < i; i5++) {
                int i6 = iArr[i4 + i5];
                int i7 = (i6 >> 16) & 255;
                int i8 = (i6 >> 8) & 255;
                int i9 = i6 & 255;
                if (i7 == i8 && i8 == i9) {
                    this.luminances[i4 + i5] = (byte) i7;
                } else {
                    this.luminances[i4 + i5] = (byte) ((((2 * i8) + i7) + i9) / 4);
                }
            }
        }
    }

    private RGBLuminanceSource(byte[] bArr, int i, int i2, int i3, int i4, int i5, int i6) {
        super(i5, i6);
        if (i3 + i5 > i || i4 + i6 > i2) {
            throw new IllegalArgumentException("Crop rectangle does not fit within image data.");
        }
        this.luminances = bArr;
        this.dataWidth = i;
        this.dataHeight = i2;
        this.left = i3;
        this.top = i4;
    }

    public LuminanceSource crop(int i, int i2, int i3, int i4) {
        RGBLuminanceSource rGBLuminanceSource = new RGBLuminanceSource(this.luminances, this.dataWidth, this.dataHeight, this.left + i, this.top + i2, i3, i4);
        return rGBLuminanceSource;
    }

    public byte[] getMatrix() {
        int width = getWidth();
        int height = getHeight();
        if (width == this.dataWidth && height == this.dataHeight) {
            return this.luminances;
        }
        int i = width * height;
        byte[] bArr = new byte[i];
        int i2 = (this.top * this.dataWidth) + this.left;
        if (width == this.dataWidth) {
            System.arraycopy(this.luminances, i2, bArr, 0, i);
            return bArr;
        }
        byte[] bArr2 = this.luminances;
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
        System.arraycopy(this.luminances, ((this.top + i) * this.dataWidth) + this.left, bArr, 0, width);
        return bArr;
    }

    public boolean isCropSupported() {
        return true;
    }
}
