package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import android.support.v4.util.Pools.Pool;
import com.bumptech.glide.util.a.a;
import com.bumptech.glide.util.a.a.C0012a;
import com.bumptech.glide.util.a.a.c;
import com.bumptech.glide.util.i;

/* compiled from: LockedResource */
final class o<Z> implements p<Z>, c {
    private static final Pool<o<?>> hR = a.b(20, new C0012a<o<?>>() {
        /* renamed from: bJ */
        public o<?> create() {
            return new o<>();
        }
    });
    private final com.bumptech.glide.util.a.c ge = com.bumptech.glide.util.a.c.fu();
    private boolean hJ;
    private p<Z> hS;
    private boolean isLocked;

    o() {
    }

    @NonNull
    static <Z> o<Z> f(p<Z> pVar) {
        o<Z> oVar = (o) i.checkNotNull((o) hR.acquire());
        oVar.g(pVar);
        return oVar;
    }

    private void g(p<Z> pVar) {
        this.hJ = false;
        this.isLocked = true;
        this.hS = pVar;
    }

    private void release() {
        this.hS = null;
        hR.release(this);
    }

    @NonNull
    public Class<Z> bG() {
        return this.hS.bG();
    }

    @NonNull
    public com.bumptech.glide.util.a.c bq() {
        return this.ge;
    }

    @NonNull
    public Z get() {
        return this.hS.get();
    }

    public int getSize() {
        return this.hS.getSize();
    }

    public synchronized void recycle() {
        this.ge.fv();
        this.hJ = true;
        if (!this.isLocked) {
            this.hS.recycle();
            release();
        }
    }

    /* access modifiers changed from: 0000 */
    public synchronized void unlock() {
        this.ge.fv();
        if (this.isLocked) {
            this.isLocked = false;
            if (this.hJ) {
                recycle();
            }
        } else {
            throw new IllegalStateException("Already unlocked");
        }
    }
}
