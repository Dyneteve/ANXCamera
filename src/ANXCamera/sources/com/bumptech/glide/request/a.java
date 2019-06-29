package com.bumptech.glide.request;

import android.support.annotation.Nullable;

/* compiled from: ErrorRequestCoordinator */
public final class a implements c, d {
    @Nullable
    private final d oG;
    private c oH;
    private c oI;

    public a(@Nullable d dVar) {
        this.oG = dVar;
    }

    private boolean dM() {
        return this.oG == null || this.oG.d(this);
    }

    private boolean dN() {
        return this.oG == null || this.oG.f(this);
    }

    private boolean dO() {
        return this.oG == null || this.oG.e(this);
    }

    private boolean dQ() {
        return this.oG != null && this.oG.dP();
    }

    private boolean g(c cVar) {
        return cVar.equals(this.oH) || (this.oH.isFailed() && cVar.equals(this.oI));
    }

    public void a(c cVar, c cVar2) {
        this.oH = cVar;
        this.oI = cVar2;
    }

    public void begin() {
        if (!this.oH.isRunning()) {
            this.oH.begin();
        }
    }

    public boolean c(c cVar) {
        boolean z = false;
        if (!(cVar instanceof a)) {
            return false;
        }
        a aVar = (a) cVar;
        if (this.oH.c(aVar.oH) && this.oI.c(aVar.oI)) {
            z = true;
        }
        return z;
    }

    public void clear() {
        this.oH.clear();
        if (this.oI.isRunning()) {
            this.oI.clear();
        }
    }

    public boolean d(c cVar) {
        return dM() && g(cVar);
    }

    public boolean dL() {
        return (this.oH.isFailed() ? this.oI : this.oH).dL();
    }

    public boolean dP() {
        return dQ() || dL();
    }

    public boolean e(c cVar) {
        return dO() && g(cVar);
    }

    public boolean f(c cVar) {
        return dN() && g(cVar);
    }

    public void h(c cVar) {
        if (this.oG != null) {
            this.oG.h(this);
        }
    }

    public void i(c cVar) {
        if (!cVar.equals(this.oI)) {
            if (!this.oI.isRunning()) {
                this.oI.begin();
            }
            return;
        }
        if (this.oG != null) {
            this.oG.i(this);
        }
    }

    public boolean isCancelled() {
        return (this.oH.isFailed() ? this.oI : this.oH).isCancelled();
    }

    public boolean isComplete() {
        return (this.oH.isFailed() ? this.oI : this.oH).isComplete();
    }

    public boolean isFailed() {
        return this.oH.isFailed() && this.oI.isFailed();
    }

    public boolean isPaused() {
        return (this.oH.isFailed() ? this.oI : this.oH).isPaused();
    }

    public boolean isRunning() {
        return (this.oH.isFailed() ? this.oI : this.oH).isRunning();
    }

    public void pause() {
        if (!this.oH.isFailed()) {
            this.oH.pause();
        }
        if (this.oI.isRunning()) {
            this.oI.pause();
        }
    }

    public void recycle() {
        this.oH.recycle();
        this.oI.recycle();
    }
}
