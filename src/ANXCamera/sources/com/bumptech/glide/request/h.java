package com.bumptech.glide.request;

import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;

/* compiled from: ThumbnailRequestCoordinator */
public class h implements c, d {
    private boolean isRunning;
    @Nullable
    private final d oG;
    private c pX;
    private c pY;

    @VisibleForTesting
    h() {
        this(null);
    }

    public h(@Nullable d dVar) {
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

    public void a(c cVar, c cVar2) {
        this.pX = cVar;
        this.pY = cVar2;
    }

    public void begin() {
        this.isRunning = true;
        if (!this.pX.isComplete() && !this.pY.isRunning()) {
            this.pY.begin();
        }
        if (this.isRunning && !this.pX.isRunning()) {
            this.pX.begin();
        }
    }

    public boolean c(c cVar) {
        boolean z = false;
        if (!(cVar instanceof h)) {
            return false;
        }
        h hVar = (h) cVar;
        if (this.pX != null ? this.pX.c(hVar.pX) : hVar.pX == null) {
            if (this.pY != null ? this.pY.c(hVar.pY) : hVar.pY == null) {
                z = true;
            }
        }
        return z;
    }

    public void clear() {
        this.isRunning = false;
        this.pY.clear();
        this.pX.clear();
    }

    public boolean d(c cVar) {
        return dM() && (cVar.equals(this.pX) || !this.pX.dL());
    }

    public boolean dL() {
        return this.pX.dL() || this.pY.dL();
    }

    public boolean dP() {
        return dQ() || dL();
    }

    public boolean e(c cVar) {
        return dO() && cVar.equals(this.pX) && !dP();
    }

    public boolean f(c cVar) {
        return dN() && cVar.equals(this.pX);
    }

    public void h(c cVar) {
        if (!cVar.equals(this.pY)) {
            if (this.oG != null) {
                this.oG.h(this);
            }
            if (!this.pY.isComplete()) {
                this.pY.clear();
            }
        }
    }

    public void i(c cVar) {
        if (cVar.equals(this.pX) && this.oG != null) {
            this.oG.i(this);
        }
    }

    public boolean isCancelled() {
        return this.pX.isCancelled();
    }

    public boolean isComplete() {
        return this.pX.isComplete() || this.pY.isComplete();
    }

    public boolean isFailed() {
        return this.pX.isFailed();
    }

    public boolean isPaused() {
        return this.pX.isPaused();
    }

    public boolean isRunning() {
        return this.pX.isRunning();
    }

    public void pause() {
        this.isRunning = false;
        this.pX.pause();
        this.pY.pause();
    }

    public void recycle() {
        this.pX.recycle();
        this.pY.recycle();
    }
}
