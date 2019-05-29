package com.android.camera.effect.framework.graphics;

public class Block {
    public int mHeight;
    public int mOffset;
    public int mRowStride;
    public int mWidth;

    public int[] getOffset(int i, int i2) {
        return new int[]{((this.mOffset % i) / this.mWidth) * this.mWidth, ((this.mOffset / i) / this.mHeight) * this.mHeight};
    }

    public int[] getYUVOffset(int i, int i2, int i3, int i4) {
        int i5 = this.mOffset / i3;
        int i6 = this.mOffset % i3;
        return new int[]{(i * i5) + i6, (((int) Math.floor(((double) i5) / 2.0d)) * i2) + i6};
    }
}
