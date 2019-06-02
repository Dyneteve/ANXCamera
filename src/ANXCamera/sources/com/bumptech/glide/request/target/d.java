package com.bumptech.glide.request.target;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;

/* compiled from: BitmapThumbnailImageViewTarget */
public class d extends o<Bitmap> {
    public d(ImageView imageView) {
        super(imageView);
    }

    @Deprecated
    public d(ImageView imageView, boolean z) {
        super(imageView, z);
    }

    /* access modifiers changed from: protected */
    /* renamed from: o */
    public Drawable v(Bitmap bitmap) {
        return new BitmapDrawable(((ImageView) this.view).getResources(), bitmap);
    }
}
