package com.bumptech.glide.request.a;

import android.content.Context;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import com.bumptech.glide.load.DataSource;

/* compiled from: ViewAnimationFactory */
public class h<R> implements g<R> {
    private f<R> qA;
    private final a qH;

    /* compiled from: ViewAnimationFactory */
    private static class a implements a {
        private final Animation animation;

        a(Animation animation2) {
            this.animation = animation2;
        }

        public Animation m(Context context) {
            return this.animation;
        }
    }

    /* compiled from: ViewAnimationFactory */
    private static class b implements a {
        private final int qI;

        b(int i) {
            this.qI = i;
        }

        public Animation m(Context context) {
            return AnimationUtils.loadAnimation(context, this.qI);
        }
    }

    public h(int i) {
        this((a) new b(i));
    }

    public h(Animation animation) {
        this((a) new a(animation));
    }

    h(a aVar) {
        this.qH = aVar;
    }

    public f<R> a(DataSource dataSource, boolean z) {
        if (dataSource == DataSource.MEMORY_CACHE || !z) {
            return e.fi();
        }
        if (this.qA == null) {
            this.qA = new k(this.qH);
        }
        return this.qA;
    }
}
