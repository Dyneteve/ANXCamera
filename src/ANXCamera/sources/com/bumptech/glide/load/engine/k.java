package com.bumptech.glide.load.engine;

import android.os.Looper;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import com.bumptech.glide.util.i;

/* compiled from: EngineResource */
class k<Z> implements p<Z> {
    private final boolean eC;
    private final p<Z> eD;
    private a ew;
    private final boolean gF;
    private int gG;
    private boolean gH;
    private c key;

    /* compiled from: EngineResource */
    interface a {
        void b(c cVar, k<?> kVar);
    }

    k(p<Z> pVar, boolean z, boolean z2) {
        this.eD = (p) i.checkNotNull(pVar);
        this.eC = z;
        this.gF = z2;
    }

    /* access modifiers changed from: 0000 */
    public void a(c cVar, a aVar) {
        this.key = cVar;
        this.ew = aVar;
    }

    /* access modifiers changed from: 0000 */
    public void acquire() {
        if (this.gH) {
            throw new IllegalStateException("Cannot acquire a recycled resource");
        } else if (Looper.getMainLooper().equals(Looper.myLooper())) {
            this.gG++;
        } else {
            throw new IllegalThreadStateException("Must call acquire on the main thread");
        }
    }

    /* access modifiers changed from: 0000 */
    public p<Z> bd() {
        return this.eD;
    }

    /* access modifiers changed from: 0000 */
    public boolean be() {
        return this.eC;
    }

    @NonNull
    public Class<Z> bf() {
        return this.eD.bf();
    }

    @NonNull
    public Z get() {
        return this.eD.get();
    }

    public int getSize() {
        return this.eD.getSize();
    }

    public void recycle() {
        if (this.gG > 0) {
            throw new IllegalStateException("Cannot recycle a resource while it is still acquired");
        } else if (!this.gH) {
            this.gH = true;
            if (this.gF) {
                this.eD.recycle();
            }
        } else {
            throw new IllegalStateException("Cannot recycle a resource that has already been recycled");
        }
    }

    /* access modifiers changed from: 0000 */
    public void release() {
        if (this.gG <= 0) {
            throw new IllegalStateException("Cannot release a recycled or not yet acquired resource");
        } else if (Looper.getMainLooper().equals(Looper.myLooper())) {
            int i = this.gG - 1;
            this.gG = i;
            if (i == 0) {
                this.ew.b(this.key, this);
            }
        } else {
            throw new IllegalThreadStateException("Must call release on the main thread");
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("EngineResource{isCacheable=");
        sb.append(this.eC);
        sb.append(", listener=");
        sb.append(this.ew);
        sb.append(", key=");
        sb.append(this.key);
        sb.append(", acquired=");
        sb.append(this.gG);
        sb.append(", isRecycled=");
        sb.append(this.gH);
        sb.append(", resource=");
        sb.append(this.eD);
        sb.append('}');
        return sb.toString();
    }
}
