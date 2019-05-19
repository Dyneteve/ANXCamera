package com.bumptech.glide;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import com.bumptech.glide.request.target.m;
import com.bumptech.glide.request.target.n;
import com.bumptech.glide.util.k;
import java.util.List;
import java.util.Queue;

/* compiled from: ListPreloader */
public class f<T> implements OnScrollListener {
    private final int aF;
    private final d aG;
    private final i aH;
    private final a<T> aI;
    private final b<T> aJ;
    private int aK;
    private int aL;
    private int aM = -1;
    private int aN;
    private boolean aO = true;

    /* compiled from: ListPreloader */
    public interface a<U> {
        @Nullable
        h<?> c(@NonNull U u);

        @NonNull
        List<U> g(int i);
    }

    /* compiled from: ListPreloader */
    public interface b<T> {
        @Nullable
        int[] b(@NonNull T t, int i, int i2);
    }

    /* compiled from: ListPreloader */
    private static final class c extends com.bumptech.glide.request.target.b<Object> {
        int aP;
        int aQ;

        c() {
        }

        public void a(@NonNull m mVar) {
            mVar.p(this.aQ, this.aP);
        }

        public void a(@NonNull Object obj, @Nullable com.bumptech.glide.request.a.f<? super Object> fVar) {
        }

        public void b(@NonNull m mVar) {
        }
    }

    /* compiled from: ListPreloader */
    private static final class d {
        private final Queue<c> queue;

        d(int i) {
            this.queue = k.Y(i);
            for (int i2 = 0; i2 < i; i2++) {
                this.queue.offer(new c());
            }
        }

        public c e(int i, int i2) {
            c cVar = (c) this.queue.poll();
            this.queue.offer(cVar);
            cVar.aQ = i;
            cVar.aP = i2;
            return cVar;
        }
    }

    public f(@NonNull i iVar, @NonNull a<T> aVar, @NonNull b<T> bVar, int i) {
        this.aH = iVar;
        this.aI = aVar;
        this.aJ = bVar;
        this.aF = i;
        this.aG = new d(i + 1);
    }

    private void a(int i, boolean z) {
        if (this.aO != z) {
            this.aO = z;
            cancelAll();
        }
        d(i, (z ? this.aF : -this.aF) + i);
    }

    private void a(@Nullable T t, int i, int i2) {
        if (t != null) {
            int[] b2 = this.aJ.b(t, i, i2);
            if (b2 != null) {
                h c2 = this.aI.c(t);
                if (c2 != null) {
                    c2.b(this.aG.e(b2[0], b2[1]));
                }
            }
        }
    }

    private void a(List<T> list, int i, boolean z) {
        int size = list.size();
        if (z) {
            for (int i2 = 0; i2 < size; i2++) {
                a((T) list.get(i2), i, i2);
            }
            return;
        }
        for (int i3 = size - 1; i3 >= 0; i3--) {
            a((T) list.get(i3), i, i3);
        }
    }

    private void cancelAll() {
        for (int i = 0; i < this.aF; i++) {
            this.aH.d((n<?>) this.aG.e(0, 0));
        }
    }

    private void d(int i, int i2) {
        int i3;
        int i4;
        if (i < i2) {
            i3 = Math.max(this.aK, i);
            i4 = i2;
        } else {
            i4 = Math.min(this.aL, i);
            i3 = i2;
        }
        int min = Math.min(this.aN, i4);
        int min2 = Math.min(this.aN, Math.max(0, i3));
        if (i < i2) {
            for (int i5 = min2; i5 < min; i5++) {
                a(this.aI.g(i5), i5, true);
            }
        } else {
            for (int i6 = min - 1; i6 >= min2; i6--) {
                a(this.aI.g(i6), i6, false);
            }
        }
        this.aL = min2;
        this.aK = min;
    }

    public void onScroll(AbsListView absListView, int i, int i2, int i3) {
        this.aN = i3;
        if (i > this.aM) {
            a(i2 + i, true);
        } else if (i < this.aM) {
            a(i, false);
        }
        this.aM = i;
    }

    public void onScrollStateChanged(AbsListView absListView, int i) {
    }
}
