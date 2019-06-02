package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.View;
import com.bumptech.glide.f.b;
import com.bumptech.glide.request.a.f;
import com.bumptech.glide.request.target.ViewTarget;
import com.bumptech.glide.request.target.m;
import java.util.Arrays;

/* compiled from: ViewPreloadSizeProvider */
public class l<T> implements b<T>, m {
    private int[] pU;
    private a qh;

    /* compiled from: ViewPreloadSizeProvider */
    private static final class a extends ViewTarget<View, Object> {
        a(@NonNull View view, @NonNull m mVar) {
            super(view);
            a(mVar);
        }

        public void a(@NonNull Object obj, @Nullable f<? super Object> fVar) {
        }
    }

    public l() {
    }

    public l(@NonNull View view) {
        this.qh = new a(view, this);
    }

    @Nullable
    public int[] b(@NonNull T t, int i, int i2) {
        if (this.pU == null) {
            return null;
        }
        return Arrays.copyOf(this.pU, this.pU.length);
    }

    public void p(int i, int i2) {
        this.pU = new int[]{i, i2};
        this.qh = null;
    }

    public void setView(@NonNull View view) {
        if (this.pU == null && this.qh == null) {
            this.qh = new a(view, this);
        }
    }
}
