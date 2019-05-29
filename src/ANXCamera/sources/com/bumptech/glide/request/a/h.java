package com.bumptech.glide.request.a;

import android.content.Context;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import com.bumptech.glide.load.DataSource;

/* compiled from: ViewAnimationFactory */
public class h<R> implements g<R> {
    private final a pF;
    private f<R> py;

    /* compiled from: ViewAnimationFactory */
    private static class a implements a {
        private final Animation pG;

        a(Animation animation) {
            this.pG = animation;
        }

        public Animation m(Context context) {
            return this.pG;
        }
    }

    /* compiled from: ViewAnimationFactory */
    private static class b implements a {
        private final int pH;

        b(int i) {
            this.pH = i;
        }

        public Animation m(Context context) {
            return AnimationUtils.loadAnimation(context, this.pH);
        }
    }

    public h(int i) {
        this((a) new b(i));
    }

    public h(Animation animation) {
        this((a) new a(animation));
    }

    h(a aVar) {
        this.pF = aVar;
    }

    public f<R> a(DataSource dataSource, boolean z) {
        if (dataSource == DataSource.MEMORY_CACHE || !z) {
            return e.eG();
        }
        if (this.py == null) {
            this.py = new k(this.pF);
        }
        return this.py;
    }
}
