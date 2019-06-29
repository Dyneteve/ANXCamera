package com.android.camera.effect.framework.gles;

import android.graphics.SurfaceTexture;
import android.view.Surface;

public class WindowSurface extends EglSurfaceBase {
    private boolean mReleaseSurface;
    private Surface mSurface;

    public WindowSurface(EglCore eglCore, SurfaceTexture surfaceTexture) {
        super(eglCore);
        createWindowSurface(surfaceTexture);
    }

    public WindowSurface(EglCore eglCore, Surface surface, boolean z) {
        super(eglCore);
        createWindowSurface(surface);
        this.mSurface = surface;
        this.mReleaseSurface = z;
    }

    public void recreate(EglCore eglCore) {
        if (this.mSurface != null) {
            this.mEglCore = eglCore;
            createWindowSurface(this.mSurface);
            return;
        }
        throw new RuntimeException("not yet implemented for SurfaceTexture");
    }

    public void release() {
        releaseEglSurface();
        if (this.mSurface != null) {
            if (this.mReleaseSurface) {
                this.mSurface.release();
            }
            this.mSurface = null;
        }
    }
}
