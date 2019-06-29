package com.google.zxing;

public abstract class LuminanceSource {
    private final int height;
    private final int width;

    protected LuminanceSource(int i, int i2) {
        this.width = i;
        this.height = i2;
    }

    public LuminanceSource crop(int i, int i2, int i3, int i4) {
        throw new UnsupportedOperationException("This luminance source does not support cropping.");
    }

    public final int getHeight() {
        return this.height;
    }

    public abstract byte[] getMatrix();

    public abstract byte[] getRow(int i, byte[] bArr);

    public final int getWidth() {
        return this.width;
    }

    public LuminanceSource invert() {
        return new InvertedLuminanceSource(this);
    }

    public boolean isCropSupported() {
        return false;
    }

    public boolean isRotateSupported() {
        return false;
    }

    public LuminanceSource rotateCounterClockwise() {
        throw new UnsupportedOperationException("This luminance source does not support rotation by 90 degrees.");
    }

    public LuminanceSource rotateCounterClockwise45() {
        throw new UnsupportedOperationException("This luminance source does not support rotation by 45 degrees.");
    }

    public final String toString() {
        byte[] bArr = new byte[this.width];
        StringBuilder sb = new StringBuilder(this.height * (this.width + 1));
        for (int i = 0; i < this.height; i++) {
            bArr = getRow(i, bArr);
            for (int i2 = 0; i2 < this.width; i2++) {
                byte b = bArr[i2] & 255;
                char c = b < 64 ? '#' : b < 128 ? '+' : b < 192 ? '.' : ' ';
                sb.append(c);
            }
            sb.append(10);
        }
        return sb.toString();
    }
}
