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
    private final int bH;
    private final d bI;
    private final i bJ;
    private final a<T> bK;
    private final b<T> bL;
    private int bM;
    private int bN;
    private int bO = -1;
    private int bP;
    private boolean bQ = true;

    /* compiled from: ListPreloader */
    public interface a<U> {
        @Nullable
        h<?> f(@NonNull U u);

        @NonNull
        List<U> k(int i);
    }

    /* compiled from: ListPreloader */
    public interface b<T> {
        @Nullable
        int[] b(@NonNull T t, int i, int i2);
    }

    /* compiled from: ListPreloader */
    private static final class c extends com.bumptech.glide.request.target.b<Object> {
        int bR;
        int bS;

        c() {
        }

        public void a(@NonNull m mVar) {
            mVar.q(this.bS, this.bR);
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
            this.queue = k.ac(i);
            for (int i2 = 0; i2 < i; i2++) {
                this.queue.offer(new c());
            }
        }

        public c f(int i, int i2) {
            c cVar = (c) this.queue.poll();
            this.queue.offer(cVar);
            cVar.bS = i;
            cVar.bR = i2;
            return cVar;
        }
    }

    public f(@NonNull i iVar, @NonNull a<T> aVar, @NonNull b<T> bVar, int i) {
        this.bJ = iVar;
        this.bK = aVar;
        this.bL = bVar;
        this.bH = i;
        this.bI = new d(i + 1);
    }

    private void a(int i, boolean z) {
        if (this.bQ != z) {
            this.bQ = z;
            cancelAll();
        }
        e(i, (z ? this.bH : -this.bH) + i);
    }

    private void a(@Nullable T t, int i, int i2) {
        if (t != null) {
            int[] b2 = this.bL.b(t, i, i2);
            if (b2 != null) {
                h f = this.bK.f(t);
                if (f != null) {
                    f.b(this.bI.f(b2[0], b2[1]));
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
        for (int i = 0; i < this.bH; i++) {
            this.bJ.d((n<?>) this.bI.f(0, 0));
        }
    }

    private void e(int i, int i2) {
        int i3;
        int i4;
        if (i < i2) {
            i3 = Math.max(this.bM, i);
            i4 = i2;
        } else {
            i4 = Math.min(this.bN, i);
            i3 = i2;
        }
        int min = Math.min(this.bP, i4);
        int min2 = Math.min(this.bP, Math.max(0, i3));
        if (i < i2) {
            for (int i5 = min2; i5 < min; i5++) {
                a(this.bK.k(i5), i5, true);
            }
        } else {
            for (int i6 = min - 1; i6 >= min2; i6--) {
                a(this.bK.k(i6), i6, false);
            }
        }
        this.bN = min2;
        this.bM = min;
    }

    public void onScroll(AbsListView absListView, int i, int i2, int i3) {
        this.bP = i3;
        if (i > this.bO) {
            a(i2 + i, true);
        } else if (i < this.bO) {
            a(i, false);
        }
        this.bO = i;
    }

    public void onScrollStateChanged(AbsListView absListView, int i) {
    }
}
