package com.bumptech.glide.load.engine.bitmap_recycle;

import com.bumptech.glide.load.engine.bitmap_recycle.l;
import com.bumptech.glide.util.k;
import java.util.Queue;

/* compiled from: BaseKeyPool */
abstract class c<T extends l> {
    private static final int MAX_SIZE = 20;
    private final Queue<T> ik = k.ac(20);

    c() {
    }

    public void a(T t) {
        if (this.ik.size() < 20) {
            this.ik.offer(t);
        }
    }

    /* access modifiers changed from: 0000 */
    public abstract T bP();

    /* access modifiers changed from: 0000 */
    public T bQ() {
        T t = (l) this.ik.poll();
        return t == null ? bP() : t;
    }
}
