package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import android.support.v4.util.Pools.Pool;
import com.bumptech.glide.util.a.a;
import com.bumptech.glide.util.a.a.C0011a;
import com.bumptech.glide.util.a.a.c;
import com.bumptech.glide.util.i;

/* compiled from: LockedResource */
final class o<Z> implements p<Z>, c {
    private static final Pool<o<?>> gP = a.b(20, new C0011a<o<?>>() {
        /* renamed from: bi */
        public o<?> create() {
            return new o<>();
        }
    });
    private final com.bumptech.glide.util.a.c fc = com.bumptech.glide.util.a.c.eS();
    private boolean gH;
    private p<Z> gQ;
    private boolean isLocked;

    o() {
    }

    @NonNull
    static <Z> o<Z> f(p<Z> pVar) {
        o<Z> oVar = (o) i.checkNotNull((o) gP.acquire());
        oVar.g(pVar);
        return oVar;
    }

    private void g(p<Z> pVar) {
        this.gH = false;
        this.isLocked = true;
        this.gQ = pVar;
    }

    private void release() {
        this.gQ = null;
        gP.release(this);
    }

    @NonNull
    public com.bumptech.glide.util.a.c aQ() {
        return this.fc;
    }

    @NonNull
    public Class<Z> bf() {
        return this.gQ.bf();
    }

    @NonNull
    public Z get() {
        return this.gQ.get();
    }

    public int getSize() {
        return this.gQ.getSize();
    }

    public synchronized void recycle() {
        this.fc.eT();
        this.gH = true;
        if (!this.isLocked) {
            this.gQ.recycle();
            release();
        }
    }

    /* access modifiers changed from: 0000 */
    public synchronized void unlock() {
        this.fc.eT();
        if (this.isLocked) {
            this.isLocked = false;
            if (this.gH) {
                recycle();
            }
        } else {
            throw new IllegalStateException("Already unlocked");
        }
    }
}
