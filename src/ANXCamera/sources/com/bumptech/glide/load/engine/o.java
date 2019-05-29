package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import android.support.v4.util.Pools.Pool;
import com.bumptech.glide.util.a.a;
import com.bumptech.glide.util.a.a.C0011a;
import com.bumptech.glide.util.a.a.c;
import com.bumptech.glide.util.i;

/* compiled from: LockedResource */
final class o<Z> implements p<Z>, c {
    private static final Pool<o<?>> gQ = a.b(20, new C0011a<o<?>>() {
        /* renamed from: bi */
        public o<?> create() {
            return new o<>();
        }
    });
    private final com.bumptech.glide.util.a.c fd = com.bumptech.glide.util.a.c.eS();
    private boolean gI;
    private p<Z> gR;
    private boolean isLocked;

    o() {
    }

    @NonNull
    static <Z> o<Z> f(p<Z> pVar) {
        o<Z> oVar = (o) i.checkNotNull((o) gQ.acquire());
        oVar.g(pVar);
        return oVar;
    }

    private void g(p<Z> pVar) {
        this.gI = false;
        this.isLocked = true;
        this.gR = pVar;
    }

    private void release() {
        this.gR = null;
        gQ.release(this);
    }

    @NonNull
    public com.bumptech.glide.util.a.c aQ() {
        return this.fd;
    }

    @NonNull
    public Class<Z> bf() {
        return this.gR.bf();
    }

    @NonNull
    public Z get() {
        return this.gR.get();
    }

    public int getSize() {
        return this.gR.getSize();
    }

    public synchronized void recycle() {
        this.fd.eT();
        this.gI = true;
        if (!this.isLocked) {
            this.gR.recycle();
            release();
        }
    }

    /* access modifiers changed from: 0000 */
    public synchronized void unlock() {
        this.fd.eT();
        if (this.isLocked) {
            this.isLocked = false;
            if (this.gI) {
                recycle();
            }
        } else {
            throw new IllegalStateException("Already unlocked");
        }
    }
}
