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
    private int[] pS;
    private a qf;

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
        this.qf = new a(view, this);
    }

    @Nullable
    public int[] b(@NonNull T t, int i, int i2) {
        if (this.pS == null) {
            return null;
        }
        return Arrays.copyOf(this.pS, this.pS.length);
    }

    public void p(int i, int i2) {
        this.pS = new int[]{i, i2};
        this.qf = null;
    }

    public void setView(@NonNull View view) {
        if (this.pS == null && this.qf == null) {
            this.qf = new a(view, this);
        }
    }
}
