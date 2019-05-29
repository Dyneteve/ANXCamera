package com.bumptech.glide.request;

import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;

/* compiled from: ThumbnailRequestCoordinator */
public class h implements c, d {
    private boolean isRunning;
    @Nullable
    private final d nF;
    private c oX;
    private c oY;

    @VisibleForTesting
    h() {
        this(null);
    }

    public h(@Nullable d dVar) {
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
    private boolean m2842do() {
        return this.nF != null && this.nF.dn();
    }

    public void a(c cVar, c cVar2) {
        this.oX = cVar;
        this.oY = cVar2;
    }

    public void begin() {
        this.isRunning = true;
        if (!this.oX.isComplete() && !this.oY.isRunning()) {
            this.oY.begin();
        }
        if (this.isRunning && !this.oX.isRunning()) {
            this.oX.begin();
        }
    }

    public boolean c(c cVar) {
        boolean z = false;
        if (!(cVar instanceof h)) {
            return false;
        }
        h hVar = (h) cVar;
        if (this.oX != null ? this.oX.c(hVar.oX) : hVar.oX == null) {
            if (this.oY != null ? this.oY.c(hVar.oY) : hVar.oY == null) {
                z = true;
            }
        }
        return z;
    }

    public void clear() {
        this.isRunning = false;
        this.oY.clear();
        this.oX.clear();
    }

    public boolean d(c cVar) {
        return dk() && (cVar.equals(this.oX) || !this.oX.dj());
    }

    public boolean dj() {
        return this.oX.dj() || this.oY.dj();
    }

    public boolean dn() {
        return m2842do() || dj();
    }

    public boolean e(c cVar) {
        return dm() && cVar.equals(this.oX) && !dn();
    }

    public boolean f(c cVar) {
        return dl() && cVar.equals(this.oX);
    }

    public void h(c cVar) {
        if (!cVar.equals(this.oY)) {
            if (this.nF != null) {
                this.nF.h(this);
            }
            if (!this.oY.isComplete()) {
                this.oY.clear();
            }
        }
    }

    public void i(c cVar) {
        if (cVar.equals(this.oX) && this.nF != null) {
            this.nF.i(this);
        }
    }

    public boolean isCancelled() {
        return this.oX.isCancelled();
    }

    public boolean isComplete() {
        return this.oX.isComplete() || this.oY.isComplete();
    }

    public boolean isFailed() {
        return this.oX.isFailed();
    }

    public boolean isPaused() {
        return this.oX.isPaused();
    }

    public boolean isRunning() {
        return this.oX.isRunning();
    }

    public void pause() {
        this.isRunning = false;
        this.oX.pause();
        this.oY.pause();
    }

    public void recycle() {
        this.oX.recycle();
        this.oY.recycle();
    }
}
