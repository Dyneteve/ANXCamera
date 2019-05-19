package com.bumptech.glide.request;

import android.support.annotation.Nullable;

/* compiled from: ErrorRequestCoordinator */
public final class a implements c, d {
    @Nullable
    private final d nE;
    private c nF;
    private c nG;

    public a(@Nullable d dVar) {
        this.nE = dVar;
    }

    private boolean dk() {
        return this.nE == null || this.nE.d(this);
    }

    private boolean dl() {
        return this.nE == null || this.nE.f(this);
    }

    private boolean dm() {
        return this.nE == null || this.nE.e(this);
    }

    /* renamed from: do reason: not valid java name */
    private boolean m2805do() {
        return this.nE != null && this.nE.dn();
    }

    private boolean g(c cVar) {
        return cVar.equals(this.nF) || (this.nF.isFailed() && cVar.equals(this.nG));
    }

    public void a(c cVar, c cVar2) {
        this.nF = cVar;
        this.nG = cVar2;
    }

    public void begin() {
        if (!this.nF.isRunning()) {
            this.nF.begin();
        }
    }

    public boolean c(c cVar) {
        boolean z = false;
        if (!(cVar instanceof a)) {
            return false;
        }
        a aVar = (a) cVar;
        if (this.nF.c(aVar.nF) && this.nG.c(aVar.nG)) {
            z = true;
        }
        return z;
    }

    public void clear() {
        this.nF.clear();
        if (this.nG.isRunning()) {
            this.nG.clear();
        }
    }

    public boolean d(c cVar) {
        return dk() && g(cVar);
    }

    public boolean dj() {
        return (this.nF.isFailed() ? this.nG : this.nF).dj();
    }

    public boolean dn() {
        return m2805do() || dj();
    }

    public boolean e(c cVar) {
        return dm() && g(cVar);
    }

    public boolean f(c cVar) {
        return dl() && g(cVar);
    }

    public void h(c cVar) {
        if (this.nE != null) {
            this.nE.h(this);
        }
    }

    public void i(c cVar) {
        if (!cVar.equals(this.nG)) {
            if (!this.nG.isRunning()) {
                this.nG.begin();
            }
            return;
        }
        if (this.nE != null) {
            this.nE.i(this);
        }
    }

    public boolean isCancelled() {
        return (this.nF.isFailed() ? this.nG : this.nF).isCancelled();
    }

    public boolean isComplete() {
        return (this.nF.isFailed() ? this.nG : this.nF).isComplete();
    }

    public boolean isFailed() {
        return this.nF.isFailed() && this.nG.isFailed();
    }

    public boolean isPaused() {
        return (this.nF.isFailed() ? this.nG : this.nF).isPaused();
    }

    public boolean isRunning() {
        return (this.nF.isFailed() ? this.nG : this.nF).isRunning();
    }

    public void pause() {
        if (!this.nF.isFailed()) {
            this.nF.pause();
        }
        if (this.nG.isRunning()) {
            this.nG.pause();
        }
    }

    public void recycle() {
        this.nF.recycle();
        this.nG.recycle();
    }
}
