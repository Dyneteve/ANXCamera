package com.android.camera.module.encoder;

import android.annotation.TargetApi;
import android.graphics.SurfaceTexture;
import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLSurface;
import android.os.Build.VERSION;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import com.android.camera.log.Log;

@TargetApi(18)
public class EGLBase {
    private static final int EGL_RECORDABLE_ANDROID = 12610;
    /* access modifiers changed from: private */
    public static final String TAG = EGLBase.class.getSimpleName();
    private EGLContext mDefaultContext = EGL14.EGL_NO_CONTEXT;
    private EGLConfig mEglConfig = null;
    private EGLContext mEglContext = EGL14.EGL_NO_CONTEXT;
    private EGLDisplay mEglDisplay = EGL14.EGL_NO_DISPLAY;

    public static class EglSurface {
        private final EGLBase mEgl;
        private EGLSurface mEglSurface = EGL14.EGL_NO_SURFACE;
        private final int mHeight;
        private final int mWidth;

        EglSurface(EGLBase eGLBase, int i, int i2) {
            Log.v(EGLBase.TAG, "EglSurface");
            this.mEgl = eGLBase;
            this.mEglSurface = this.mEgl.createOffscreenSurface(i, i2);
            this.mWidth = i;
            this.mHeight = i2;
        }

        EglSurface(EGLBase eGLBase, Object obj) {
            Log.v(EGLBase.TAG, "EglSurface");
            if ((obj instanceof SurfaceView) || (obj instanceof Surface) || (obj instanceof SurfaceHolder) || (obj instanceof SurfaceTexture)) {
                this.mEgl = eGLBase;
                this.mEglSurface = this.mEgl.createWindowSurface(obj);
                this.mWidth = this.mEgl.querySurface(this.mEglSurface, 12375);
                this.mHeight = this.mEgl.querySurface(this.mEglSurface, 12374);
                Log.v(EGLBase.TAG, String.format("EglSurface: size(%d, %d)", new Object[]{Integer.valueOf(this.mWidth), Integer.valueOf(this.mHeight)}));
                return;
            }
            throw new IllegalArgumentException("unsupported surface");
        }

        public EGLContext getContext() {
            return this.mEgl.getContext();
        }

        public int getHeight() {
            return this.mHeight;
        }

        public int getWidth() {
            return this.mWidth;
        }

        public void makeCurrent() {
            this.mEgl.makeCurrent(this.mEglSurface);
        }

        public void release() {
            Log.v(EGLBase.TAG, "EglSurface:release");
            this.mEgl.makeDefault();
            this.mEgl.destroyWindowSurface(this.mEglSurface);
            this.mEglSurface = EGL14.EGL_NO_SURFACE;
        }

        public void swap() {
            this.mEgl.swap(this.mEglSurface);
        }
    }

    public EGLBase(EGLContext eGLContext, boolean z, boolean z2) {
        Log.v(TAG, "EGLBase");
        init(eGLContext, z, z2);
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

    private EGLContext createContext(EGLContext eGLContext) {
        Log.v(TAG, "createContext");
        EGLContext eglCreateContext = EGL14.eglCreateContext(this.mEglDisplay, this.mEglConfig, eGLContext, new int[]{12440, 2, 12344}, 0);
        checkEglError("eglCreateContext");
        return eglCreateContext;
    }

    /* access modifiers changed from: private */
    public EGLSurface createOffscreenSurface(int i, int i2) {
        EGLSurface eGLSurface;
        Throwable e;
        Throwable e2;
        Log.v(TAG, "createOffscreenSurface");
        try {
            eGLSurface = EGL14.eglCreatePbufferSurface(this.mEglDisplay, this.mEglConfig, new int[]{12375, i, 12374, i2, 12344}, 0);
            try {
                checkEglError("eglCreatePbufferSurface");
                if (eGLSurface != null) {
                    return eGLSurface;
                }
                throw new RuntimeException("surface was null");
            } catch (IllegalArgumentException e3) {
                e = e3;
                Log.e(TAG, "createOffscreenSurface", e);
                return eGLSurface;
            } catch (RuntimeException e4) {
                e2 = e4;
                Log.e(TAG, "createOffscreenSurface", e2);
                return eGLSurface;
            }
        } catch (IllegalArgumentException e5) {
            Throwable th = e5;
            eGLSurface = null;
            e = th;
            Log.e(TAG, "createOffscreenSurface", e);
            return eGLSurface;
        } catch (RuntimeException e6) {
            Throwable th2 = e6;
            eGLSurface = null;
            e2 = th2;
            Log.e(TAG, "createOffscreenSurface", e2);
            return eGLSurface;
        }
    }

    /* access modifiers changed from: private */
    public EGLSurface createWindowSurface(Object obj) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("createWindowSurface: nativeWindow=");
        sb.append(obj);
        Log.v(str, sb.toString());
        try {
            return EGL14.eglCreateWindowSurface(this.mEglDisplay, this.mEglConfig, obj, new int[]{12344}, 0);
        } catch (IllegalArgumentException e) {
            Log.e(TAG, "eglCreateWindowSurface", e);
            return null;
        }
    }

    private void destroyContext() {
        Log.v(TAG, "destroyContext");
        if (!EGL14.eglDestroyContext(this.mEglDisplay, this.mEglContext)) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("destroyContext: display=");
            sb.append(this.mEglDisplay);
            sb.append(" context=");
            sb.append(this.mEglContext);
            Log.e(str, sb.toString());
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("destroyContext: err=");
            sb2.append(EGL14.eglGetError());
            Log.e(str2, sb2.toString());
        }
        this.mEglContext = EGL14.EGL_NO_CONTEXT;
        if (this.mDefaultContext != EGL14.EGL_NO_CONTEXT) {
            if (!EGL14.eglDestroyContext(this.mEglDisplay, this.mDefaultContext)) {
                String str3 = TAG;
                StringBuilder sb3 = new StringBuilder();
                sb3.append("destroyDefaultContext: display=");
                sb3.append(this.mEglDisplay);
                sb3.append(" context=");
                sb3.append(this.mDefaultContext);
                Log.e(str3, sb3.toString());
                String str4 = TAG;
                StringBuilder sb4 = new StringBuilder();
                sb4.append("destroyDefaultContext: err=");
                sb4.append(EGL14.eglGetError());
                Log.e(str4, sb4.toString());
            }
            this.mDefaultContext = EGL14.EGL_NO_CONTEXT;
        }
    }

    /* access modifiers changed from: private */
    public void destroyWindowSurface(EGLSurface eGLSurface) {
        Log.v(TAG, "destroySurface>>>");
        if (eGLSurface != EGL14.EGL_NO_SURFACE) {
            EGL14.eglMakeCurrent(this.mEglDisplay, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT);
            EGL14.eglDestroySurface(this.mEglDisplay, eGLSurface);
        }
        EGLSurface eGLSurface2 = EGL14.EGL_NO_SURFACE;
        Log.v(TAG, "destroySurface<<<");
    }

    private EGLConfig getConfig(boolean z, boolean z2) {
        int[] iArr = {12352, 4, 12324, 8, 12323, 8, 12322, 8, 12321, 8, 12344, 12344, 12344, 12344, 12344, 12344, 12344};
        int i = 10;
        if (z) {
            iArr[10] = 12325;
            i = 12;
            iArr[11] = 16;
        }
        if (z2 && VERSION.SDK_INT >= 18) {
            int i2 = i + 1;
            iArr[i] = 12610;
            i = i2 + 1;
            iArr[i2] = 1;
        }
        for (int length = iArr.length - 1; length >= i; length--) {
            iArr[length] = 12344;
        }
        EGLConfig[] eGLConfigArr = new EGLConfig[1];
        if (EGL14.eglChooseConfig(this.mEglDisplay, iArr, 0, eGLConfigArr, 0, eGLConfigArr.length, new int[1], 0)) {
            return eGLConfigArr[0];
        }
        Log.w(TAG, "unable to find RGBA8888 /  EGLConfig");
        return null;
    }

    private void init(EGLContext eGLContext, boolean z, boolean z2) {
        Log.v(TAG, "init");
        if (this.mEglDisplay == EGL14.EGL_NO_DISPLAY) {
            this.mEglDisplay = EGL14.eglGetDisplay(0);
            if (this.mEglDisplay != EGL14.EGL_NO_DISPLAY) {
                int[] iArr = new int[2];
                if (EGL14.eglInitialize(this.mEglDisplay, iArr, 0, iArr, 1)) {
                    if (eGLContext == null) {
                        eGLContext = EGL14.EGL_NO_CONTEXT;
                    }
                    if (this.mEglContext == EGL14.EGL_NO_CONTEXT) {
                        this.mEglConfig = getConfig(z, z2);
                        if (this.mEglConfig != null) {
                            this.mEglContext = createContext(eGLContext);
                        } else {
                            throw new RuntimeException("chooseConfig failed");
                        }
                    }
                    int[] iArr2 = new int[1];
                    EGL14.eglQueryContext(this.mEglDisplay, this.mEglContext, 12440, iArr2, 0);
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("EGLContext created, client version ");
                    sb.append(iArr2[0]);
                    Log.d(str, sb.toString());
                    makeDefault();
                    return;
                }
                this.mEglDisplay = null;
                throw new RuntimeException("eglInitialize failed");
            }
            throw new RuntimeException("eglGetDisplay failed");
        }
        throw new RuntimeException("EGL already set up");
    }

    /* access modifiers changed from: private */
    public boolean makeCurrent(EGLSurface eGLSurface) {
        if (this.mEglDisplay == null) {
            Log.e(TAG, "makeCurrent: eglDisplay not initialized");
        }
        if (eGLSurface == null || eGLSurface == EGL14.EGL_NO_SURFACE) {
            if (EGL14.eglGetError() == 12299) {
                Log.e(TAG, "makeCurrent: returned EGL_BAD_NATIVE_WINDOW.");
            }
            return false;
        } else if (EGL14.eglMakeCurrent(this.mEglDisplay, eGLSurface, eGLSurface, this.mEglContext)) {
            return true;
        } else {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("eglMakeCurrent: err=");
            sb.append(EGL14.eglGetError());
            Log.e(str, sb.toString());
            return false;
        }
    }

    /* access modifiers changed from: private */
    public void makeDefault() {
        Log.v(TAG, "makeDefault");
        if (!EGL14.eglMakeCurrent(this.mEglDisplay, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT)) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("makeDefault: err=");
            sb.append(EGL14.eglGetError());
            Log.w(str, sb.toString());
        }
    }

    /* access modifiers changed from: private */
    public int swap(EGLSurface eGLSurface) {
        if (EGL14.eglSwapBuffers(this.mEglDisplay, eGLSurface)) {
            return 12288;
        }
        int eglGetError = EGL14.eglGetError();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("swap: err=");
        sb.append(eglGetError);
        Log.w(str, sb.toString());
        return eglGetError;
    }

    public EglSurface createFromSurface(Object obj) {
        Log.v(TAG, "createFromSurface");
        EglSurface eglSurface = new EglSurface(this, obj);
        eglSurface.makeCurrent();
        return eglSurface;
    }

    public EglSurface createOffscreen(int i, int i2) {
        Log.v(TAG, "createOffscreen");
        EglSurface eglSurface = new EglSurface(this, i, i2);
        eglSurface.makeCurrent();
        return eglSurface;
    }

    public EGLContext getContext() {
        return this.mEglContext;
    }

    public int querySurface(EGLSurface eGLSurface, int i) {
        int[] iArr = new int[1];
        EGL14.eglQuerySurface(this.mEglDisplay, eGLSurface, i, iArr, 0);
        return iArr[0];
    }

    public void release() {
        Log.v(TAG, "release");
        if (this.mEglDisplay != EGL14.EGL_NO_DISPLAY) {
            destroyContext();
            EGL14.eglTerminate(this.mEglDisplay);
            EGL14.eglReleaseThread();
        }
        this.mEglDisplay = EGL14.EGL_NO_DISPLAY;
        this.mEglContext = EGL14.EGL_NO_CONTEXT;
    }
}
