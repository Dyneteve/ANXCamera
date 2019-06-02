package com.bumptech.glide.request.target;

import android.graphics.drawable.Drawable;
import android.support.annotation.Nullable;
import com.bumptech.glide.request.c;

/* compiled from: BaseTarget */
public abstract class b<Z> implements n<Z> {
    private c nM;

    public void d(@Nullable Drawable drawable) {
    }

    @Nullable
    public c dp() {
        return this.nM;
    }

    public void e(@Nullable Drawable drawable) {
    }

    public void f(@Nullable Drawable drawable) {
    }

    public void j(@Nullable c cVar) {
        this.nM = cVar;
    }

    public void onDestroy() {
    }

    public void onStart() {
    }

    public void onStop() {
    }
}
