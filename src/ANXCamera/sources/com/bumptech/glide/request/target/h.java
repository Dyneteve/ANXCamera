package com.bumptech.glide.request.target;

import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.widget.ImageView;
import com.bumptech.glide.request.a.f;
import com.bumptech.glide.request.a.f.a;

/* compiled from: ImageViewTarget */
public abstract class h<Z> extends ViewTarget<ImageView, Z> implements a {
    @Nullable
    private Animatable qh;

    public h(ImageView imageView) {
        super(imageView);
    }

    @Deprecated
    public h(ImageView imageView, boolean z) {
        super(imageView, z);
    }

    private void A(@Nullable Z z) {
        if (z instanceof Animatable) {
            this.qh = (Animatable) z;
            this.qh.start();
            return;
        }
        this.qh = null;
    }

    private void z(@Nullable Z z) {
        x(z);
        A(z);
    }

    public void a(@NonNull Z z, @Nullable f<? super Z> fVar) {
        if (fVar == null || !fVar.a(z, this)) {
            z(z);
        } else {
            A(z);
        }
    }

    public void d(@Nullable Drawable drawable) {
        super.d(drawable);
        if (this.qh != null) {
            this.qh.stop();
        }
        z(null);
        setDrawable(drawable);
    }

    public void e(@Nullable Drawable drawable) {
        super.e(drawable);
        z(null);
        setDrawable(drawable);
    }

    public void f(@Nullable Drawable drawable) {
        super.f(drawable);
        z(null);
        setDrawable(drawable);
    }

    @Nullable
    public Drawable getCurrentDrawable() {
        return ((ImageView) this.view).getDrawable();
    }

    public void onStart() {
        if (this.qh != null) {
            this.qh.start();
        }
    }

    public void onStop() {
        if (this.qh != null) {
            this.qh.stop();
        }
    }

    public void setDrawable(Drawable drawable) {
        ((ImageView) this.view).setImageDrawable(drawable);
    }

    /* access modifiers changed from: protected */
    public abstract void x(@Nullable Z z);
}
