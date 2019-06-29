package com.android.camera.effect.framework.gles;

import android.graphics.SurfaceTexture;
import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLExt;
import android.opengl.EGLSurface;
import android.view.Surface;
import com.android.camera.log.Log;

public final class EglCore {
    private static final int EGL_RECORDABLE_ANDROID = 12610;
    public static final int FLAG_RECORDABLE = 1;
    public static final int FLAG_TRY_GLES3 = 2;
    private static final String TAG = "EglCore";
    private EGLConfig mEGLConfig;
    private EGLContext mEGLContext;
    private EGLDisplay mEGLDisplay;
    private int mGlVersion;

    public EglCore() {
        this(null, 0);
    }

    public EglCore(EGLContext eGLContext, int i) {
        this.mEGLDisplay = EGL14.EGL_NO_DISPLAY;
        this.mEGLContext = EGL14.EGL_NO_CONTEXT;
        this.mEGLConfig = null;
        this.mGlVersion = -1;
        if (this.mEGLDisplay == EGL14.EGL_NO_DISPLAY) {
            if (eGLContext == null) {
                eGLContext = EGL14.EGL_NO_CONTEXT;
            }
            this.mEGLDisplay = EGL14.eglGetDisplay(0);
            if (this.mEGLDisplay != EGL14.EGL_NO_DISPLAY) {
                int[] iArr = new int[2];
                if (EGL14.eglInitialize(this.mEGLDisplay, iArr, 0, iArr, 1)) {
                    if ((i & 2) != 0) {
                        EGLConfig config = getConfig(i, 3);
                        if (config != null) {
                            EGLContext eglCreateContext = EGL14.eglCreateContext(this.mEGLDisplay, config, eGLContext, new int[]{12440, 3, 12344}, 0);
                            if (EGL14.eglGetError() == 12288) {
                                this.mEGLConfig = config;
                                this.mEGLContext = eglCreateContext;
                                this.mGlVersion = 3;
                            }
                        }
                    }
                    if (this.mEGLContext == EGL14.EGL_NO_CONTEXT) {
                        EGLConfig config2 = getConfig(i, 2);
                        if (config2 != null) {
                            EGLContext eglCreateContext2 = EGL14.eglCreateContext(this.mEGLDisplay, config2, eGLContext, new int[]{12440, 2, 12344}, 0);
                            checkEglError("eglCreateContext");
                            this.mEGLConfig = config2;
                            this.mEGLContext = eglCreateContext2;
                            this.mGlVersion = 2;
                        } else {
                            throw new RuntimeException("Unable to find a suitable EGLConfig");
                        }
                    }
                    int[] iArr2 = new int[1];
                    EGL14.eglQueryContext(this.mEGLDisplay, this.mEGLContext, 12440, iArr2, 0);
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("EGLContext created, client version ");
                    sb.append(iArr2[0]);
                    Log.d(str, sb.toString());
                    return;
                }
                this.mEGLDisplay = null;
                throw new RuntimeException("unable to initialize EGL14");
            }
            throw new RuntimeException("unable to get EGL14 display");
        }
        throw new RuntimeException("EGL already set up");
    }

    private void checkEglError(String str) {
        int eglGetError = EGL14.eglGetError();
        if (eglGetError != 12288) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(": EGL error: 0x");
            sb.append(Integer.toHexString(eglGetError));
            throw new RuntimeException(sb.toString());
        }
    }

    private EGLConfig getConfig(int i, int i2) {
        int[] iArr = {12324, 8, 12323, 8, 12322, 8, 12352, i2 >= 3 ? 68 : 4, 12344, 0, 12344};
        if ((i & 1) != 0) {
            iArr[iArr.length - 3] = 12610;
            iArr[iArr.length - 2] = 1;
        }
        EGLConfig[] eGLConfigArr = new EGLConfig[1];
        if (EGL14.eglChooseConfig(this.mEGLDisplay, iArr, 0, eGLConfigArr, 0, eGLConfigArr.length, new int[1], 0)) {
            return eGLConfigArr[0];
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("unable to find RGB8888 / ");
        sb.append(i2);
        sb.append(" EGLConfig");
        Log.w(str, sb.toString());
        return null;
    }

    public static void logCurrent(String str) {
        EGLDisplay eglGetCurrentDisplay = EGL14.eglGetCurrentDisplay();
        EGLContext eglGetCurrentContext = EGL14.eglGetCurrentContext();
        EGLSurface eglGetCurrentSurface = EGL14.eglGetCurrentSurface(12377);
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("Current EGL (");
        sb.append(str);
        sb.append("): display=");
        sb.append(eglGetCurrentDisplay);
        sb.append(", context=");
        sb.append(eglGetCurrentContext);
        sb.append(", surface=");
        sb.append(eglGetCurrentSurface);
        Log.i(str2, sb.toString());
    }

    public EGLSurface createPbufferSurface(int i, int i2) {
        EGLSurface eglCreatePbufferSurface = EGL14.eglCreatePbufferSurface(this.mEGLDisplay, this.mEGLConfig, new int[]{12375, i, 12374, i2, 12344}, 0);
        checkEglError("eglCreatePbufferSurface");
        if (eglCreatePbufferSurface != null) {
            return eglCreatePbufferSurface;
        }
        throw new RuntimeException("surface was null");
    }

    public EGLSurface createWindowSurface(Object obj) {
        if ((obj instanceof Surface) || (obj instanceof SurfaceTexture)) {
            EGLSurface eglCreateWindowSurface = EGL14.eglCreateWindowSurface(this.mEGLDisplay, this.mEGLConfig, obj, new int[]{12344}, 0);
            checkEglError("eglCreateWindowSurface");
            if (eglCreateWindowSurface != null) {
                return eglCreateWindowSurface;
            }
            throw new RuntimeException("surface was null");
        }
        StringBuilder sb = new StringBuilder();
        sb.append("invalid surface: ");
        sb.append(obj);
        throw new RuntimeException(sb.toString());
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        try {
            if (this.mEGLDisplay != EGL14.EGL_NO_DISPLAY) {
                Log.w(TAG, "WARNING: EglCore was not explicitly released -- state may be leaked");
                release();
            }
        } finally {
            super.finalize();
        }
    }

    public EGLContext getEGLContext() {
        return this.mEGLContext;
    }

    public int getGlVersion() {
        return this.mGlVersion;
    }

    public boolean isCurrent(EGLSurface eGLSurface) {
        return this.mEGLContext.equals(EGL14.eglGetCurrentContext()) && eGLSurface.equals(EGL14.eglGetCurrentSurface(12377));
    }

    public void makeCurrent(EGLSurface eGLSurface) {
        if (this.mEGLDisplay == EGL14.EGL_NO_DISPLAY) {
            Log.d(TAG, "NOTE: makeCurrent w/o display");
        }
        if (!EGL14.eglMakeCurrent(this.mEGLDisplay, eGLSurface, eGLSurface, this.mEGLContext)) {
            throw new RuntimeException("eglMakeCurrent failed");
        }
    }

    public void makeCurrent(EGLSurface eGLSurface, EGLSurface eGLSurface2) {
        if (this.mEGLDisplay == EGL14.EGL_NO_DISPLAY) {
            Log.d(TAG, "NOTE: makeCurrent w/o display");
        }
        if (!EGL14.eglMakeCurrent(this.mEGLDisplay, eGLSurface, eGLSurface2, this.mEGLContext)) {
            throw new RuntimeException("eglMakeCurrent(draw,read) failed");
        }
    }

    public void makeNothingCurrent() {
        if (!EGL14.eglMakeCurrent(this.mEGLDisplay, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT)) {
            throw new RuntimeException("eglMakeCurrent failed");
        }
    }

    public String queryString(int i) {
        return EGL14.eglQueryString(this.mEGLDisplay, i);
    }

    public int querySurface(EGLSurface eGLSurface, int i) {
        int[] iArr = new int[1];
        EGL14.eglQuerySurface(this.mEGLDisplay, eGLSurface, i, iArr, 0);
        return iArr[0];
    }

    public void release() {
        if (this.mEGLDisplay != EGL14.EGL_NO_DISPLAY) {
            EGL14.eglMakeCurrent(this.mEGLDisplay, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT);
            EGL14.eglDestroyContext(this.mEGLDisplay, this.mEGLContext);
            EGL14.eglReleaseThread();
            EGL14.eglTerminate(this.mEGLDisplay);
        }
        this.mEGLDisplay = EGL14.EGL_NO_DISPLAY;
        this.mEGLContext = EGL14.EGL_NO_CONTEXT;
        this.mEGLConfig = null;
    }

    public void releaseSurface(EGLSurface eGLSurface) {
        EGL14.eglDestroySurface(this.mEGLDisplay, eGLSurface);
    }

    public void setPresentationTime(EGLSurface eGLSurface, long j) {
        EGLExt.eglPresentationTimeANDROID(this.mEGLDisplay, eGLSurface, j);
    }

    public boolean swapBuffers(EGLSurface eGLSurface) {
        return EGL14.eglSwapBuffers(this.mEGLDisplay, eGLSurface);
    }
}
