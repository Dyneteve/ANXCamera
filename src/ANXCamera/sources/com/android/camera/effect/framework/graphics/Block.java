package com.android.camera.effect.framework.graphics;

public class Block {
    public int mHeight;
    public int mOffset;
    public int mRowStride;
    public int mWidth;

    public int[] getOffset(int i, int i2) {
        return new int[]{((this.mOffset % i) / this.mWidth) * this.mWidth, ((this.mOffset / i) / this.mHeight) * this.mHeight};
    }
}
