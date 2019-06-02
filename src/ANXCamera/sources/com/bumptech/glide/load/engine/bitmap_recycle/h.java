package com.bumptech.glide.load.engine.bitmap_recycle;

/* compiled from: IntegerArrayAdapter */
public final class h implements a<int[]> {
    private static final String TAG = "IntegerArrayPool";

    public int bk() {
        return 4;
    }

    /* renamed from: c */
    public int n(int[] iArr) {
        return iArr.length;
    }

    public String getTag() {
        return TAG;
    }

    public int[] newArray(int i) {
        return new int[i];
    }
}
