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
    private final int aG;
    private final d aH;
    private final i aI;
    private final a<T> aJ;
    private final b<T> aK;
    private int aL;
    private int aM;
    private int aN = -1;
    private int aO;
    private boolean aP = true;

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
        int aQ;
        int aR;

        c() {
        }

        public void a(@NonNull m mVar) {
            mVar.p(this.aR, this.aQ);
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
            cVar.aR = i;
            cVar.aQ = i2;
            return cVar;
        }
    }

    public f(@NonNull i iVar, @NonNull a<T> aVar, @NonNull b<T> bVar, int i) {
        this.aI = iVar;
        this.aJ = aVar;
        this.aK = bVar;
        this.aG = i;
        this.aH = new d(i + 1);
    }

    private void a(int i, boolean z) {
        if (this.aP != z) {
            this.aP = z;
            cancelAll();
        }
        d(i, (z ? this.aG : -this.aG) + i);
    }

    private void a(@Nullable T t, int i, int i2) {
        if (t != null) {
            int[] b2 = this.aK.b(t, i, i2);
            if (b2 != null) {
                h c2 = this.aJ.c(t);
                if (c2 != null) {
                    c2.b(this.aH.e(b2[0], b2[1]));
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
        for (int i = 0; i < this.aG; i++) {
            this.aI.d((n<?>) this.aH.e(0, 0));
        }
    }

    private void d(int i, int i2) {
        int i3;
        int i4;
        if (i < i2) {
            i3 = Math.max(this.aL, i);
            i4 = i2;
        } else {
            i4 = Math.min(this.aM, i);
            i3 = i2;
        }
        int min = Math.min(this.aO, i4);
        int min2 = Math.min(this.aO, Math.max(0, i3));
        if (i < i2) {
            for (int i5 = min2; i5 < min; i5++) {
                a(this.aJ.g(i5), i5, true);
            }
        } else {
            for (int i6 = min - 1; i6 >= min2; i6--) {
                a(this.aJ.g(i6), i6, false);
            }
        }
        this.aM = min2;
        this.aL = min;
    }

    public void onScroll(AbsListView absListView, int i, int i2, int i3) {
        this.aO = i3;
        if (i > this.aN) {
            a(i2 + i, true);
        } else if (i < this.aN) {
            a(i, false);
        }
        this.aN = i;
    }

    public void onScrollStateChanged(AbsListView absListView, int i) {
    }
}
