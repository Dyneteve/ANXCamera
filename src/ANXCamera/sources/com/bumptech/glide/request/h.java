package com.bumptech.glide.request;

import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;

/* compiled from: ThumbnailRequestCoordinator */
public class h implements c, d {
    private boolean isRunning;
    @Nullable
    private final d nE;
    private c oW;
    private c oX;

    @VisibleForTesting
    h() {
        this(null);
    }

    public h(@Nullable d dVar) {
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
    private boolean m2827do() {
        return this.nE != null && this.nE.dn();
    }

    public void a(c cVar, c cVar2) {
        this.oW = cVar;
        this.oX = cVar2;
    }

    public void begin() {
        this.isRunning = true;
        if (!this.oW.isComplete() && !this.oX.isRunning()) {
            this.oX.begin();
        }
        if (this.isRunning && !this.oW.isRunning()) {
            this.oW.begin();
        }
    }

    public boolean c(c cVar) {
        boolean z = false;
        if (!(cVar instanceof h)) {
            return false;
        }
        h hVar = (h) cVar;
        if (this.oW != null ? this.oW.c(hVar.oW) : hVar.oW == null) {
            if (this.oX != null ? this.oX.c(hVar.oX) : hVar.oX == null) {
                z = true;
            }
        }
        return z;
    }

    public void clear() {
        this.isRunning = false;
        this.oX.clear();
        this.oW.clear();
    }

    public boolean d(c cVar) {
        return dk() && (cVar.equals(this.oW) || !this.oW.dj());
    }

    public boolean dj() {
        return this.oW.dj() || this.oX.dj();
    }

    public boolean dn() {
        return m2827do() || dj();
    }

    public boolean e(c cVar) {
        return dm() && cVar.equals(this.oW) && !dn();
    }

    public boolean f(c cVar) {
        return dl() && cVar.equals(this.oW);
    }

    public void h(c cVar) {
        if (!cVar.equals(this.oX)) {
            if (this.nE != null) {
                this.nE.h(this);
            }
            if (!this.oX.isComplete()) {
                this.oX.clear();
            }
        }
    }

    public void i(c cVar) {
        if (cVar.equals(this.oW) && this.nE != null) {
            this.nE.i(this);
        }
    }

    public boolean isCancelled() {
        return this.oW.isCancelled();
    }

    public boolean isComplete() {
        return this.oW.isComplete() || this.oX.isComplete();
    }

    public boolean isFailed() {
        return this.oW.isFailed();
    }

    public boolean isPaused() {
        return this.oW.isPaused();
    }

    public boolean isRunning() {
        return this.oW.isRunning();
    }

    public void pause() {
        this.isRunning = false;
        this.oW.pause();
        this.oX.pause();
    }

    public void recycle() {
        this.oW.recycle();
        this.oX.recycle();
    }
}
