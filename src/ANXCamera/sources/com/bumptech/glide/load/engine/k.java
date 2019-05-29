package com.bumptech.glide.load.engine;

import android.os.Looper;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import com.bumptech.glide.util.i;

/* compiled from: EngineResource */
class k<Z> implements p<Z> {
    private final boolean eD;
    private final p<Z> eE;
    private a ex;
    private final boolean gG;
    private int gH;
    private boolean gI;
    private c key;

    /* compiled from: EngineResource */
    interface a {
        void b(c cVar, k<?> kVar);
    }

    k(p<Z> pVar, boolean z, boolean z2) {
        this.eE = (p) i.checkNotNull(pVar);
        this.eD = z;
        this.gG = z2;
    }

    /* access modifiers changed from: 0000 */
    public void a(c cVar, a aVar) {
        this.key = cVar;
        this.ex = aVar;
    }

    /* access modifiers changed from: 0000 */
    public void acquire() {
        if (this.gI) {
            throw new IllegalStateException("Cannot acquire a recycled resource");
        } else if (Looper.getMainLooper().equals(Looper.myLooper())) {
            this.gH++;
        } else {
            throw new IllegalThreadStateException("Must call acquire on the main thread");
        }
    }

    /* access modifiers changed from: 0000 */
    public p<Z> bd() {
        return this.eE;
    }

    /* access modifiers changed from: 0000 */
    public boolean be() {
        return this.eD;
    }

    @NonNull
    public Class<Z> bf() {
        return this.eE.bf();
    }

    @NonNull
    public Z get() {
        return this.eE.get();
    }

    public int getSize() {
        return this.eE.getSize();
    }

    public void recycle() {
        if (this.gH > 0) {
            throw new IllegalStateException("Cannot recycle a resource while it is still acquired");
        } else if (!this.gI) {
            this.gI = true;
            if (this.gG) {
                this.eE.recycle();
            }
        } else {
            throw new IllegalStateException("Cannot recycle a resource that has already been recycled");
        }
    }

    /* access modifiers changed from: 0000 */
    public void release() {
        if (this.gH <= 0) {
            throw new IllegalStateException("Cannot release a recycled or not yet acquired resource");
        } else if (Looper.getMainLooper().equals(Looper.myLooper())) {
            int i = this.gH - 1;
            this.gH = i;
            if (i == 0) {
                this.ex.b(this.key, this);
            }
        } else {
            throw new IllegalThreadStateException("Must call release on the main thread");
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("EngineResource{isCacheable=");
        sb.append(this.eD);
        sb.append(", listener=");
        sb.append(this.ex);
        sb.append(", key=");
        sb.append(this.key);
        sb.append(", acquired=");
        sb.append(this.gH);
        sb.append(", isRecycled=");
        sb.append(this.gI);
        sb.append(", resource=");
        sb.append(this.eE);
        sb.append('}');
        return sb.toString();
    }
}
