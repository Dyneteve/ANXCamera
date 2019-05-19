package com.bumptech.glide.load.engine.bitmap_recycle;

import com.bumptech.glide.load.engine.bitmap_recycle.l;
import com.bumptech.glide.util.k;
import java.util.Queue;

/* compiled from: BaseKeyPool */
abstract class c<T extends l> {
    private static final int MAX_SIZE = 20;
    private final Queue<T> hg = k.Y(20);

    c() {
    }

    public void a(T t) {
        if (this.hg.size() < 20) {
            this.hg.offer(t);
        }
    }

    public abstract T bo();

    /* access modifiers changed from: 0000 */
    public T bp() {
        T t = (l) this.hg.poll();
        return t == null ? bo() : t;
    }
}
