package com.bumptech.glide.load.engine.bitmap_recycle;

/* compiled from: IntegerArrayAdapter */
public final class h implements a<int[]> {
    private static final String TAG = "IntegerArrayPool";

    public int bL() {
        return 4;
    }

    /* renamed from: c */
    public int q(int[] iArr) {
        return iArr.length;
    }

    public String getTag() {
        return TAG;
    }

    public int[] newArray(int i) {
        return new int[i];
    }
}
