package com.android.camera.effect.framework.gles;

public class PbufferSurface extends EglSurfaceBase {
    protected PbufferSurface(EglCore eglCore) {
        super(eglCore);
    }

    public PbufferSurface(EglCore eglCore, int i, int i2) {
        super(eglCore);
        createPbufferSurface(i, i2);
    }

    public void release() {
        releaseEglSurface();
    }
}
