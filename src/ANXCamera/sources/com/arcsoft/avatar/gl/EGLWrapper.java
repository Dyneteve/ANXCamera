package com.arcsoft.avatar.gl;

import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLExt;
import android.opengl.EGLSurface;
import android.view.Surface;
import com.arcsoft.avatar.util.b;

public class EGLWrapper {
    private static final String a = "Arc_EGLWrapper";
    private static final int b = 12610;
    private EGLContext c;
    private EGLDisplay d;
    private EGLSurface e;
    private EGLConfig[] f;
    private EGLContext g;
    private boolean h;
    private Surface i;
    private int j;
    private int k;
    private b l;

    public EGLWrapper(int i2, int i3) {
        this.c = EGL14.EGL_NO_CONTEXT;
        this.d = EGL14.EGL_NO_DISPLAY;
        this.e = EGL14.EGL_NO_SURFACE;
        this.f = new EGLConfig[1];
        this.g = EGL14.EGL_NO_CONTEXT;
        this.h = false;
        this.l = new b(a);
        this.h = true;
        this.j = i2;
        this.k = i3;
        c();
    }

    public EGLWrapper(Surface surface) {
        this.c = EGL14.EGL_NO_CONTEXT;
        this.d = EGL14.EGL_NO_DISPLAY;
        this.e = EGL14.EGL_NO_SURFACE;
        this.f = new EGLConfig[1];
        this.g = EGL14.EGL_NO_CONTEXT;
        this.h = false;
        this.l = new b(a);
        if (surface != null) {
            this.i = surface;
            c();
            return;
        }
        throw new NullPointerException();
    }

    public EGLWrapper(Surface surface, EGLContext eGLContext) {
        this.c = EGL14.EGL_NO_CONTEXT;
        this.d = EGL14.EGL_NO_DISPLAY;
        this.e = EGL14.EGL_NO_SURFACE;
        this.f = new EGLConfig[1];
        this.g = EGL14.EGL_NO_CONTEXT;
        this.h = false;
        this.l = new b(a);
        if (surface != null) {
            this.i = surface;
            this.g = eGLContext;
            c();
            return;
        }
        throw new NullPointerException();
    }

    private void a() {
        this.e = EGL14.eglCreateWindowSurface(this.d, this.f[0], this.i, new int[]{12344}, 0);
        a("eglCreateWindowSurface");
        if (this.e == null) {
            throw new RuntimeException("surface == null");
        }
    }

    private void a(String str) {
        int eglGetError = EGL14.eglGetError();
        if (eglGetError != 12288) {
            new Exception("NOT_ERROR_JUST_SEE_CALL_STACK").printStackTrace();
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(": EGL_ERROR_CODE: 0x");
            sb.append(Integer.toHexString(eglGetError));
            throw new RuntimeException(sb.toString());
        }
    }

    private void b() {
        this.e = EGL14.eglCreatePbufferSurface(this.d, this.f[0], new int[]{12375, this.j, 12374, this.k, 12344}, 0);
        a("createEGLPbufferSurface");
        if (this.e == null) {
            throw new RuntimeException("surface == null");
        }
    }

    private void c() {
        this.d = EGL14.eglGetDisplay(0);
        if (this.d != EGL14.EGL_NO_DISPLAY) {
            int[] iArr = new int[2];
            if (EGL14.eglInitialize(this.d, iArr, 0, iArr, 1)) {
                if (EGL14.eglChooseConfig(this.d, this.h ? new int[]{12339, 1, 12352, 4, 12324, 8, 12323, 8, 12322, 8, 12321, 8, 12325, 8, 12610, 1, 12344} : new int[]{12339, 4, 12352, 4, 12324, 8, 12323, 8, 12322, 8, 12321, 8, 12325, 8, 12610, 1, 12344}, 0, this.f, 0, this.f.length, new int[1], 0)) {
                    this.c = EGL14.eglCreateContext(this.d, this.f[0], this.g, new int[]{12440, 2, 12344}, 0);
                    a("eglCreateContext");
                    if (this.c != null) {
                        if (this.h) {
                            b();
                        } else {
                            a();
                        }
                        this.j = getWidth();
                        this.k = getHeight();
                        b bVar = this.l;
                        StringBuilder sb = new StringBuilder();
                        sb.append("egl_Setup , display=");
                        sb.append(this.d);
                        sb.append(" ,context=");
                        sb.append(this.c);
                        sb.append(" ,sharedContext= ");
                        sb.append(this.g);
                        sb.append(", surface=");
                        sb.append(this.e);
                        sb.append(", w=");
                        sb.append(this.j);
                        sb.append(" ,h=");
                        sb.append(this.k);
                        bVar.a(sb.toString());
                        return;
                    }
                    throw new RuntimeException("eglCreateContext == null");
                }
                throw new RuntimeException("eglChooseConfig [RGBA888 + recordable] ES2 EGL_config_fail...");
            }
            this.d = null;
            throw new RuntimeException("EGL14.eglInitialize fail...");
        }
        throw new RuntimeException("EGL14.eglGetDisplay fail...");
    }

    private void d() {
        if (this.d != EGL14.EGL_NO_DISPLAY) {
            EGL14.eglDestroySurface(this.d, this.e);
            this.e = EGL14.EGL_NO_SURFACE;
        }
    }

    public int getHeight() {
        int[] iArr = new int[1];
        EGL14.eglQuerySurface(this.d, this.e, 12374, iArr, 0);
        return iArr[0];
    }

    public Surface getSurface() {
        return this.i;
    }

    public int getWidth() {
        int[] iArr = new int[1];
        EGL14.eglQuerySurface(this.d, this.e, 12375, iArr, 0);
        return iArr[0];
    }

    public boolean makeCurrent() {
        if (this.d == null || this.e == null) {
            this.l.a("makeCurrent()-> failed");
            return false;
        }
        boolean eglMakeCurrent = EGL14.eglMakeCurrent(this.d, this.e, this.e, this.c);
        if (!eglMakeCurrent) {
            a("makeCurrent");
        }
        b bVar = this.l;
        StringBuilder sb = new StringBuilder();
        sb.append("makeCurrent()-> ");
        sb.append(eglMakeCurrent);
        bVar.a(sb.toString());
        return eglMakeCurrent;
    }

    public void makeUnCurrent() {
        if (!EGL14.eglMakeCurrent(this.d, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT)) {
            a("makeUnCurrent");
        }
    }

    public void release() {
        if (this.d != EGL14.EGL_NO_DISPLAY) {
            EGL14.eglDestroySurface(this.d, this.e);
            EGL14.eglDestroyContext(this.d, this.c);
            EGL14.eglTerminate(this.d);
        }
        this.d = EGL14.EGL_NO_DISPLAY;
        this.c = EGL14.EGL_NO_CONTEXT;
        this.e = EGL14.EGL_NO_SURFACE;
        this.g = EGL14.EGL_NO_CONTEXT;
        try {
            if (this.i != null) {
                this.i.release();
            }
        } catch (Exception e2) {
            b bVar = this.l;
            StringBuilder sb = new StringBuilder();
            sb.append("release release mSurface failed : ");
            sb.append(e2.getMessage());
            bVar.c(sb.toString());
        }
        this.i = null;
    }

    public void setPresentationTime(long j2) {
        EGLExt.eglPresentationTimeANDROID(this.d, this.e, j2);
        a("eglPresentationTimeANDROID");
    }

    public boolean swapBuffers() {
        if (this.d == null || this.e == null) {
            return false;
        }
        boolean eglSwapBuffers = EGL14.eglSwapBuffers(this.d, this.e);
        if (!eglSwapBuffers) {
            a("makeCurrent");
        }
        return eglSwapBuffers;
    }

    public void updateSize(int i2, int i3) {
        if (i2 != this.j || i3 != this.k) {
            this.l.a("re-create EGLSurface");
            d();
            a();
            this.j = getWidth();
            this.k = getHeight();
        }
    }
}
