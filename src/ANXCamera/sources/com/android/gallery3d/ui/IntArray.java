package com.android.gallery3d.ui;

public class IntArray {
    private static final int INIT_CAPACITY = 8;
    private int[] mData = new int[8];
    private int mSize = 0;

    public void add(int i) {
        if (this.mData.length == this.mSize) {
            int[] iArr = new int[(this.mSize + this.mSize)];
            System.arraycopy(this.mData, 0, iArr, 0, this.mSize);
            this.mData = iArr;
        }
        int[] iArr2 = this.mData;
        int i2 = this.mSize;
        this.mSize = i2 + 1;
        iArr2[i2] = i;
    }

    public void clear() {
        this.mSize = 0;
        if (this.mData.length != 8) {
            this.mData = new int[8];
        }
    }

    public int[] getInternalArray() {
        return this.mData;
    }

    public int size() {
        return this.mSize;
    }

    public int[] toArray(int[] iArr) {
        if (iArr == null || iArr.length < this.mSize) {
            iArr = new int[this.mSize];
        }
        System.arraycopy(this.mData, 0, iArr, 0, this.mSize);
        return iArr;
    }
}
