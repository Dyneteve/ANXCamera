package com.bumptech.glide.load.engine;

import android.os.Looper;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import com.bumptech.glide.util.i;

/* compiled from: EngineResource */
class k<Z> implements p<Z> {
    private final boolean eE;
    private final p<Z> eF;
    private a ey;
    private final boolean gH;
    private int gI;
    private boolean gJ;
    private c key;

    /* compiled from: EngineResource */
    interface a {
        void b(c cVar, k<?> kVar);
    }

    k(p<Z> pVar, boolean z, boolean z2) {
        this.eF = (p) i.checkNotNull(pVar);
        this.eE = z;
        this.gH = z2;
    }

    /* access modifiers changed from: 0000 */
    public void a(c cVar, a aVar) {
        this.key = cVar;
        this.ey = aVar;
    }

    /* access modifiers changed from: 0000 */
    public void acquire() {
        if (this.gJ) {
            throw new IllegalStateException("Cannot acquire a recycled resource");
        } else if (Looper.getMainLooper().equals(Looper.myLooper())) {
            this.gI++;
        } else {
            throw new IllegalThreadStateException("Must call acquire on the main thread");
        }
    }

    /* access modifiers changed from: 0000 */
    public p<Z> bd() {
        return this.eF;
    }

    /* access modifiers changed from: 0000 */
    public boolean be() {
        return this.eE;
    }

    @NonNull
    public Class<Z> bf() {
        return this.eF.bf();
    }

    @NonNull
    public Z get() {
        return this.eF.get();
    }

    public int getSize() {
        return this.eF.getSize();
    }

    public void recycle() {
        if (this.gI > 0) {
            throw new IllegalStateException("Cannot recycle a resource while it is still acquired");
        } else if (!this.gJ) {
            this.gJ = true;
            if (this.gH) {
                this.eF.recycle();
            }
        } else {
            throw new IllegalStateException("Cannot recycle a resource that has already been recycled");
        }
    }

    /* access modifiers changed from: 0000 */
    public void release() {
        if (this.gI <= 0) {
            throw new IllegalStateException("Cannot release a recycled or not yet acquired resource");
        } else if (Looper.getMainLooper().equals(Looper.myLooper())) {
            int i = this.gI - 1;
            this.gI = i;
            if (i == 0) {
                this.ey.b(this.key, this);
            }
        } else {
            throw new IllegalThreadStateException("Must call release on the main thread");
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("EngineResource{isCacheable=");
        sb.append(this.eE);
        sb.append(", listener=");
        sb.append(this.ey);
        sb.append(", key=");
        sb.append(this.key);
        sb.append(", acquired=");
        sb.append(this.gI);
        sb.append(", isRecycled=");
        sb.append(this.gJ);
        sb.append(", resource=");
        sb.append(this.eF);
        sb.append('}');
        return sb.toString();
    }
}
