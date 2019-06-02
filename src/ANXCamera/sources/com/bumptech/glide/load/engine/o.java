package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import android.support.v4.util.Pools.Pool;
import com.bumptech.glide.util.a.a;
import com.bumptech.glide.util.a.a.C0013a;
import com.bumptech.glide.util.a.a.c;
import com.bumptech.glide.util.i;

/* compiled from: LockedResource */
final class o<Z> implements p<Z>, c {
    private static final Pool<o<?>> gR = a.b(20, new C0013a<o<?>>() {
        /* renamed from: bi */
        public o<?> create() {
            return new o<>();
        }
    });
    private final com.bumptech.glide.util.a.c fe = com.bumptech.glide.util.a.c.eS();
    private boolean gJ;
    private p<Z> gS;
    private boolean isLocked;

    o() {
    }

    @NonNull
    static <Z> o<Z> f(p<Z> pVar) {
        o<Z> oVar = (o) i.checkNotNull((o) gR.acquire());
        oVar.g(pVar);
        return oVar;
    }

    private void g(p<Z> pVar) {
        this.gJ = false;
        this.isLocked = true;
        this.gS = pVar;
    }

    private void release() {
        this.gS = null;
        gR.release(this);
    }

    @NonNull
    public com.bumptech.glide.util.a.c aQ() {
        return this.fe;
    }

    @NonNull
    public Class<Z> bf() {
        return this.gS.bf();
    }

    @NonNull
    public Z get() {
        return this.gS.get();
    }

    public int getSize() {
        return this.gS.getSize();
    }

    public synchronized void recycle() {
        this.fe.eT();
        this.gJ = true;
        if (!this.isLocked) {
            this.gS.recycle();
            release();
        }
    }

    /* access modifiers changed from: 0000 */
    public synchronized void unlock() {
        this.fe.eT();
        if (this.isLocked) {
            this.isLocked = false;
            if (this.gJ) {
                recycle();
            }
        } else {
            throw new IllegalStateException("Already unlocked");
        }
    }
}
