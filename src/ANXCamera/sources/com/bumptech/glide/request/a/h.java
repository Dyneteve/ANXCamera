package com.bumptech.glide.request.a;

import android.content.Context;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import com.bumptech.glide.load.DataSource;

/* compiled from: ViewAnimationFactory */
public class h<R> implements g<R> {
    private final a pE;
    private f<R> px;

    /* compiled from: ViewAnimationFactory */
    private static class a implements a {
        private final Animation pF;

        a(Animation animation) {
            this.pF = animation;
        }

        public Animation m(Context context) {
            return this.pF;
        }
    }

    /* compiled from: ViewAnimationFactory */
    private static class b implements a {
        private final int pG;

        b(int i) {
            this.pG = i;
        }

        public Animation m(Context context) {
            return AnimationUtils.loadAnimation(context, this.pG);
        }
    }

    public h(int i) {
        this((a) new b(i));
    }

    public h(Animation animation) {
        this((a) new a(animation));
    }

    h(a aVar) {
        this.pE = aVar;
    }

    public f<R> a(DataSource dataSource, boolean z) {
        if (dataSource == DataSource.MEMORY_CACHE || !z) {
            return e.eG();
        }
        if (this.px == null) {
            this.px = new k(this.pE);
        }
        return this.px;
    }
}
