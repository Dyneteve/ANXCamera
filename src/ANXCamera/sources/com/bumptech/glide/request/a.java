package com.bumptech.glide.request;

import android.support.annotation.Nullable;

/* compiled from: ErrorRequestCoordinator */
public final class a implements c, d {
    @Nullable
    private final d nF;
    private c nG;
    private c nH;

    public a(@Nullable d dVar) {
        this.nF = dVar;
    }

    private boolean dk() {
        return this.nF == null || this.nF.d(this);
    }

    private boolean dl() {
        return this.nF == null || this.nF.f(this);
    }

    private boolean dm() {
        return this.nF == null || this.nF.e(this);
    }

    /* renamed from: do reason: not valid java name */
    private boolean m2820do() {
        return this.nF != null && this.nF.dn();
    }

    private boolean g(c cVar) {
        return cVar.equals(this.nG) || (this.nG.isFailed() && cVar.equals(this.nH));
    }

    public void a(c cVar, c cVar2) {
        this.nG = cVar;
        this.nH = cVar2;
    }

    public void begin() {
        if (!this.nG.isRunning()) {
            this.nG.begin();
        }
    }

    public boolean c(c cVar) {
        boolean z = false;
        if (!(cVar instanceof a)) {
            return false;
        }
        a aVar = (a) cVar;
        if (this.nG.c(aVar.nG) && this.nH.c(aVar.nH)) {
            z = true;
        }
        return z;
    }

    public void clear() {
        this.nG.clear();
        if (this.nH.isRunning()) {
            this.nH.clear();
        }
    }

    public boolean d(c cVar) {
        return dk() && g(cVar);
    }

    public boolean dj() {
        return (this.nG.isFailed() ? this.nH : this.nG).dj();
    }

    public boolean dn() {
        return m2820do() || dj();
    }

    public boolean e(c cVar) {
        return dm() && g(cVar);
    }

    public boolean f(c cVar) {
        return dl() && g(cVar);
    }

    public void h(c cVar) {
        if (this.nF != null) {
            this.nF.h(this);
        }
    }

    public void i(c cVar) {
        if (!cVar.equals(this.nH)) {
            if (!this.nH.isRunning()) {
                this.nH.begin();
            }
            return;
        }
        if (this.nF != null) {
            this.nF.i(this);
        }
    }

    public boolean isCancelled() {
        return (this.nG.isFailed() ? this.nH : this.nG).isCancelled();
    }

    public boolean isComplete() {
        return (this.nG.isFailed() ? this.nH : this.nG).isComplete();
    }

    public boolean isFailed() {
        return this.nG.isFailed() && this.nH.isFailed();
    }

    public boolean isPaused() {
        return (this.nG.isFailed() ? this.nH : this.nG).isPaused();
    }

    public boolean isRunning() {
        return (this.nG.isFailed() ? this.nH : this.nG).isRunning();
    }

    public void pause() {
        if (!this.nG.isFailed()) {
            this.nG.pause();
        }
        if (this.nH.isRunning()) {
            this.nH.pause();
        }
    }

    public void recycle() {
        this.nG.recycle();
        this.nH.recycle();
    }
}
