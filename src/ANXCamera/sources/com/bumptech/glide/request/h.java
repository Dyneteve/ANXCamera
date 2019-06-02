package com.bumptech.glide.request;

import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;

/* compiled from: ThumbnailRequestCoordinator */
public class h implements c, d {
    private boolean isRunning;
    @Nullable
    private final d nG;
    private c oY;
    private c oZ;

    @VisibleForTesting
    h() {
        this(null);
    }

    public h(@Nullable d dVar) {
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
    private boolean m2864do() {
        return this.nG != null && this.nG.dn();
    }

    public void a(c cVar, c cVar2) {
        this.oY = cVar;
        this.oZ = cVar2;
    }

    public void begin() {
        this.isRunning = true;
        if (!this.oY.isComplete() && !this.oZ.isRunning()) {
            this.oZ.begin();
        }
        if (this.isRunning && !this.oY.isRunning()) {
            this.oY.begin();
        }
    }

    public boolean c(c cVar) {
        boolean z = false;
        if (!(cVar instanceof h)) {
            return false;
        }
        h hVar = (h) cVar;
        if (this.oY != null ? this.oY.c(hVar.oY) : hVar.oY == null) {
            if (this.oZ != null ? this.oZ.c(hVar.oZ) : hVar.oZ == null) {
                z = true;
            }
        }
        return z;
    }

    public void clear() {
        this.isRunning = false;
        this.oZ.clear();
        this.oY.clear();
    }

    public boolean d(c cVar) {
        return dk() && (cVar.equals(this.oY) || !this.oY.dj());
    }

    public boolean dj() {
        return this.oY.dj() || this.oZ.dj();
    }

    public boolean dn() {
        return m2864do() || dj();
    }

    public boolean e(c cVar) {
        return dm() && cVar.equals(this.oY) && !dn();
    }

    public boolean f(c cVar) {
        return dl() && cVar.equals(this.oY);
    }

    public void h(c cVar) {
        if (!cVar.equals(this.oZ)) {
            if (this.nG != null) {
                this.nG.h(this);
            }
            if (!this.oZ.isComplete()) {
                this.oZ.clear();
            }
        }
    }

    public void i(c cVar) {
        if (cVar.equals(this.oY) && this.nG != null) {
            this.nG.i(this);
        }
    }

    public boolean isCancelled() {
        return this.oY.isCancelled();
    }

    public boolean isComplete() {
        return this.oY.isComplete() || this.oZ.isComplete();
    }

    public boolean isFailed() {
        return this.oY.isFailed();
    }

    public boolean isPaused() {
        return this.oY.isPaused();
    }

    public boolean isRunning() {
        return this.oY.isRunning();
    }

    public void pause() {
        this.isRunning = false;
        this.oY.pause();
        this.oZ.pause();
    }

    public void recycle() {
        this.oY.recycle();
        this.oZ.recycle();
    }
}
