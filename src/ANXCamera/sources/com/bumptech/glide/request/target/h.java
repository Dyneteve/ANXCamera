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
    private Animatable pf;

    public h(ImageView imageView) {
        super(imageView);
    }

    @Deprecated
    public h(ImageView imageView, boolean z) {
        super(imageView, z);
    }

    private void w(@Nullable Z z) {
        u(z);
        x(z);
    }

    private void x(@Nullable Z z) {
        if (z instanceof Animatable) {
            this.pf = (Animatable) z;
            this.pf.start();
            return;
        }
        this.pf = null;
    }

    public void a(@NonNull Z z, @Nullable f<? super Z> fVar) {
        if (fVar == null || !fVar.a(z, this)) {
            w(z);
        } else {
            x(z);
        }
    }

    public void d(@Nullable Drawable drawable) {
        super.d(drawable);
        if (this.pf != null) {
            this.pf.stop();
        }
        w(null);
        setDrawable(drawable);
    }

    public void e(@Nullable Drawable drawable) {
        super.e(drawable);
        w(null);
        setDrawable(drawable);
    }

    public void f(@Nullable Drawable drawable) {
        super.f(drawable);
        w(null);
        setDrawable(drawable);
    }

    @Nullable
    public Drawable getCurrentDrawable() {
        return ((ImageView) this.view).getDrawable();
    }

    public void onStart() {
        if (this.pf != null) {
            this.pf.start();
        }
    }

    public void onStop() {
        if (this.pf != null) {
            this.pf.stop();
        }
    }

    public void setDrawable(Drawable drawable) {
        ((ImageView) this.view).setImageDrawable(drawable);
    }

    public abstract void u(@Nullable Z z);
}
