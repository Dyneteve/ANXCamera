package com.bumptech.glide.request;

import android.support.annotation.Nullable;

/* compiled from: ErrorRequestCoordinator */
public final class a implements c, d {
    @Nullable
    private final d nG;
    private c nH;
    private c nI;

    public a(@Nullable d dVar) {
        this.nG = dVar;
    }

    private boolean dk() {
        return this.nG == null || this.nG.d(this);
    }

    private boolean dl() {
        return this.nG == null || this.nG.f(this);
    }

    private boolean dm() {
        return this.nG == null || this.nG.e(this);
    }

    /* renamed from: do reason: not valid java name */
    private boolean m2842do() {
        return this.nG != null && this.nG.dn();
    }

    private boolean g(c cVar) {
        return cVar.equals(this.nH) || (this.nH.isFailed() && cVar.equals(this.nI));
    }

    public void a(c cVar, c cVar2) {
        this.nH = cVar;
        this.nI = cVar2;
    }

    public void begin() {
        if (!this.nH.isRunning()) {
            this.nH.begin();
        }
    }

    public boolean c(c cVar) {
        boolean z = false;
        if (!(cVar instanceof a)) {
            return false;
        }
        a aVar = (a) cVar;
        if (this.nH.c(aVar.nH) && this.nI.c(aVar.nI)) {
            z = true;
        }
        return z;
    }

    public void clear() {
        this.nH.clear();
        if (this.nI.isRunning()) {
            this.nI.clear();
        }
    }

    public boolean d(c cVar) {
        return dk() && g(cVar);
    }

    public boolean dj() {
        return (this.nH.isFailed() ? this.nI : this.nH).dj();
    }

    public boolean dn() {
        return m2842do() || dj();
    }

    public boolean e(c cVar) {
        return dm() && g(cVar);
    }

    public boolean f(c cVar) {
        return dl() && g(cVar);
    }

    public void h(c cVar) {
        if (this.nG != null) {
            this.nG.h(this);
        }
    }

    public void i(c cVar) {
        if (!cVar.equals(this.nI)) {
            if (!this.nI.isRunning()) {
                this.nI.begin();
            }
            return;
        }
        if (this.nG != null) {
            this.nG.i(this);
        }
    }

    public boolean isCancelled() {
        return (this.nH.isFailed() ? this.nI : this.nH).isCancelled();
    }

    public boolean isComplete() {
        return (this.nH.isFailed() ? this.nI : this.nH).isComplete();
    }

    public boolean isFailed() {
        return this.nH.isFailed() && this.nI.isFailed();
    }

    public boolean isPaused() {
        return (this.nH.isFailed() ? this.nI : this.nH).isPaused();
    }

    public boolean isRunning() {
        return (this.nH.isFailed() ? this.nI : this.nH).isRunning();
    }

    public void pause() {
        if (!this.nH.isFailed()) {
            this.nH.pause();
        }
        if (this.nI.isRunning()) {
            this.nI.pause();
        }
    }

    public void recycle() {
        this.nH.recycle();
        this.nI.recycle();
    }
}
