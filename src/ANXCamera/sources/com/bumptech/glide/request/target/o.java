package com.bumptech.glide.request.target;

import android.graphics.drawable.Drawable;
import android.support.annotation.Nullable;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;

/* compiled from: ThumbnailImageViewTarget */
public abstract class o<T> extends h<T> {
    public o(ImageView imageView) {
        super(imageView);
    }

    @Deprecated
    public o(ImageView imageView, boolean z) {
        super(imageView, z);
    }

    /* access modifiers changed from: protected */
    public void x(@Nullable T t) {
        LayoutParams layoutParams = ((ImageView) this.view).getLayoutParams();
        Drawable y = y(t);
        if (layoutParams != null && layoutParams.width > 0 && layoutParams.height > 0) {
            y = new g(y, layoutParams.width, layoutParams.height);
        }
        ((ImageView) this.view).setImageDrawable(y);
    }

    /* access modifiers changed from: protected */
    public abstract Drawable y(T t);
}
