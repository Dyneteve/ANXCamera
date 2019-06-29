package com.bumptech.glide.load.engine;

import android.os.Looper;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import com.bumptech.glide.util.i;

/* compiled from: EngineResource */
class k<Z> implements p<Z> {
    private final boolean fE;
    private final p<Z> fF;
    private a fy;
    private final boolean hH;
    private int hI;
    private boolean hJ;
    private c key;

    /* compiled from: EngineResource */
    interface a {
        void b(c cVar, k<?> kVar);
    }

    k(p<Z> pVar, boolean z, boolean z2) {
        this.fF = (p) i.checkNotNull(pVar);
        this.fE = z;
        this.hH = z2;
    }

    /* access modifiers changed from: 0000 */
    public void a(c cVar, a aVar) {
        this.key = cVar;
        this.fy = aVar;
    }

    /* access modifiers changed from: 0000 */
    public void acquire() {
        if (this.hJ) {
            throw new IllegalStateException("Cannot acquire a recycled resource");
        } else if (Looper.getMainLooper().equals(Looper.myLooper())) {
            this.hI++;
        } else {
            throw new IllegalThreadStateException("Must call acquire on the main thread");
        }
    }

    /* access modifiers changed from: 0000 */
    public p<Z> bE() {
        return this.fF;
    }

    /* access modifiers changed from: 0000 */
    public boolean bF() {
        return this.fE;
    }

    @NonNull
    public Class<Z> bG() {
        return this.fF.bG();
    }

    @NonNull
    public Z get() {
        return this.fF.get();
    }

    public int getSize() {
        return this.fF.getSize();
    }

    public void recycle() {
        if (this.hI > 0) {
            throw new IllegalStateException("Cannot recycle a resource while it is still acquired");
        } else if (!this.hJ) {
            this.hJ = true;
            if (this.hH) {
                this.fF.recycle();
            }
        } else {
            throw new IllegalStateException("Cannot recycle a resource that has already been recycled");
        }
    }

    /* access modifiers changed from: 0000 */
    public void release() {
        if (this.hI <= 0) {
            throw new IllegalStateException("Cannot release a recycled or not yet acquired resource");
        } else if (Looper.getMainLooper().equals(Looper.myLooper())) {
            int i = this.hI - 1;
            this.hI = i;
            if (i == 0) {
                this.fy.b(this.key, this);
            }
        } else {
            throw new IllegalThreadStateException("Must call release on the main thread");
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("EngineResource{isCacheable=");
        sb.append(this.fE);
        sb.append(", listener=");
        sb.append(this.fy);
        sb.append(", key=");
        sb.append(this.key);
        sb.append(", acquired=");
        sb.append(this.hI);
        sb.append(", isRecycled=");
        sb.append(this.hJ);
        sb.append(", resource=");
        sb.append(this.fF);
        sb.append('}');
        return sb.toString();
    }
}
