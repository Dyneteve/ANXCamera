package com.bumptech.glide.request.a;

import android.content.Context;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import com.bumptech.glide.load.DataSource;

/* compiled from: ViewAnimationFactory */
public class h<R> implements g<R> {
    private final a pG;
    private f<R> pz;

    /* compiled from: ViewAnimationFactory */
    private static class a implements a {
        private final Animation pH;

        a(Animation animation) {
            this.pH = animation;
        }

        public Animation m(Context context) {
            return this.pH;
        }
    }

    /* compiled from: ViewAnimationFactory */
    private static class b implements a {
        private final int pI;

        b(int i) {
            this.pI = i;
        }

        public Animation m(Context context) {
            return AnimationUtils.loadAnimation(context, this.pI);
        }
    }

    public h(int i) {
        this((a) new b(i));
    }

    public h(Animation animation) {
        this((a) new a(animation));
    }

    h(a aVar) {
        this.pG = aVar;
    }

    public f<R> a(DataSource dataSource, boolean z) {
        if (dataSource == DataSource.MEMORY_CACHE || !z) {
            return e.eG();
        }
        if (this.pz == null) {
            this.pz = new k(this.pG);
        }
        return this.pz;
    }
}
