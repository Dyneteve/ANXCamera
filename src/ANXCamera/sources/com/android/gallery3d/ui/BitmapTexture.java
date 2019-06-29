package com.android.gallery3d.ui;

import android.graphics.Bitmap;

public class BitmapTexture extends UploadedTexture {
    protected Bitmap mContentBitmap;

    public BitmapTexture(Bitmap bitmap) {
        this(bitmap, false);
    }

    private BitmapTexture(Bitmap bitmap, boolean z) {
        super(z);
        Utils.assertTrue(bitmap != null && !bitmap.isRecycled());
        this.mContentBitmap = bitmap;
    }

    public Bitmap getBitmap() {
        return this.mContentBitmap;
    }

    /* access modifiers changed from: protected */
    public void onFreeBitmap(Bitmap bitmap) {
    }

    /* access modifiers changed from: protected */
    public Bitmap onGetBitmap() {
        return this.mContentBitmap;
    }
}
