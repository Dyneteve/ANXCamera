package com.android.camera.fragment.mimoji;

import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLExt;
import android.opengl.EGLSurface;
import android.view.Surface;
import com.android.camera.log.Log;

public class EGLWrapper {
    private static final int EGL_RECORDABLE_ANDROID = 12610;
    private static final String TAG = EGLWrapper.class.getSimpleName();
    private EGLContext EGL_SHARE_CONTEXT;
    private EGLConfig[] mEGLConfigs;
    private EGLContext mEGLContext;
    private EGLDisplay mEGLDisplay;
    private EGLSurface mEGLSurface;
    private int mHeight;
    private boolean mIsPbuffSurface;
    private Surface mSurface;
    private int mWidth;

    public EGLWrapper(int i, int i2) {
        this.mEGLContext = EGL14.EGL_NO_CONTEXT;
        this.mEGLDisplay = EGL14.EGL_NO_DISPLAY;
        this.mEGLSurface = EGL14.EGL_NO_SURFACE;
        this.mEGLConfigs = new EGLConfig[1];
        this.EGL_SHARE_CONTEXT = EGL14.EGL_NO_CONTEXT;
        this.mIsPbuffSurface = false;
        this.mIsPbuffSurface = true;
        this.mWidth = i;
        this.mHeight = i2;
        egl_Setup();
    }

    public EGLWrapper(Surface surface) {
        this.mEGLContext = EGL14.EGL_NO_CONTEXT;
        this.mEGLDisplay = EGL14.EGL_NO_DISPLAY;
        this.mEGLSurface = EGL14.EGL_NO_SURFACE;
        this.mEGLConfigs = new EGLConfig[1];
        this.EGL_SHARE_CONTEXT = EGL14.EGL_NO_CONTEXT;
        this.mIsPbuffSurface = false;
        if (surface != null) {
            this.mSurface = surface;
            egl_Setup();
            return;
        }
        throw new NullPointerException();
    }

    public EGLWrapper(Surface surface, EGLContext eGLContext) {
        this.mEGLContext = EGL14.EGL_NO_CONTEXT;
        this.mEGLDisplay = EGL14.EGL_NO_DISPLAY;
        this.mEGLSurface = EGL14.EGL_NO_SURFACE;
        this.mEGLConfigs = new EGLConfig[1];
        this.EGL_SHARE_CONTEXT = EGL14.EGL_NO_CONTEXT;
        this.mIsPbuffSurface = false;
        if (surface != null) {
            this.mSurface = surface;
            this.EGL_SHARE_CONTEXT = eGLContext;
            egl_Setup();
            return;
        }
        throw new NullPointerException();
    }

    private void checkEglError(String str) {
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

    private void createEGLPbufferSurface() {
        this.mEGLSurface = EGL14.eglCreatePbufferSurface(this.mEGLDisplay, this.mEGLConfigs[0], new int[]{12375, this.mWidth, 12374, this.mHeight, 12344}, 0);
        checkEglError("createEGLPbufferSurface");
        if (this.mEGLSurface == null) {
            throw new RuntimeException("surface == null");
        }
    }

    private void createEGLSurface() {
        this.mEGLSurface = EGL14.eglCreateWindowSurface(this.mEGLDisplay, this.mEGLConfigs[0], this.mSurface, new int[]{12344}, 0);
        checkEglError("eglCreateWindowSurface");
        if (this.mEGLSurface == null) {
            throw new RuntimeException("surface == null");
        }
    }

    private void egl_Setup() {
        this.mEGLDisplay = EGL14.eglGetDisplay(0);
        if (this.mEGLDisplay != EGL14.EGL_NO_DISPLAY) {
            int[] iArr = new int[2];
            if (EGL14.eglInitialize(this.mEGLDisplay, iArr, 0, iArr, 1)) {
                if (EGL14.eglChooseConfig(this.mEGLDisplay, this.mIsPbuffSurface ? new int[]{12339, 1, 12352, 4, 12324, 8, 12323, 8, 12322, 8, 12321, 8, 12325, 8, 12610, 1, 12344} : new int[]{12339, 4, 12352, 4, 12324, 8, 12323, 8, 12322, 8, 12321, 8, 12325, 8, 12610, 1, 12344}, 0, this.mEGLConfigs, 0, this.mEGLConfigs.length, new int[1], 0)) {
                    this.mEGLContext = EGL14.eglCreateContext(this.mEGLDisplay, this.mEGLConfigs[0], this.EGL_SHARE_CONTEXT, new int[]{12440, 2, 12344}, 0);
                    checkEglError("eglCreateContext");
                    if (this.mEGLContext != null) {
                        if (this.mIsPbuffSurface) {
                            createEGLPbufferSurface();
                        } else {
                            createEGLSurface();
                        }
                        this.mWidth = getWidth();
                        this.mHeight = getHeight();
                        return;
                    }
                    throw new RuntimeException("eglCreateContext == null");
                }
                throw new RuntimeException("eglChooseConfig [RGBA888 + recordable] ES2 EGL_config_fail...");
            }
            this.mEGLDisplay = null;
            throw new RuntimeException("EGL14.eglInitialize fail...");
        }
        throw new RuntimeException("EGL14.eglGetDisplay fail...");
    }

    private void releaseEGLSurface() {
        if (this.mEGLDisplay != EGL14.EGL_NO_DISPLAY) {
            EGL14.eglDestroySurface(this.mEGLDisplay, this.mEGLSurface);
            this.mEGLSurface = EGL14.EGL_NO_SURFACE;
        }
    }

    public int getHeight() {
        int[] iArr = new int[1];
        EGL14.eglQuerySurface(this.mEGLDisplay, this.mEGLSurface, 12374, iArr, 0);
        return iArr[0];
    }

    public Surface getSurface() {
        return this.mSurface;
    }

    public int getWidth() {
        int[] iArr = new int[1];
        EGL14.eglQuerySurface(this.mEGLDisplay, this.mEGLSurface, 12375, iArr, 0);
        return iArr[0];
    }

    public boolean makeCurrent() {
        if (this.mEGLDisplay == null || this.mEGLSurface == null) {
            Log.d(TAG, "makeCurrent()-> failed");
            return false;
        }
        boolean eglMakeCurrent = EGL14.eglMakeCurrent(this.mEGLDisplay, this.mEGLSurface, this.mEGLSurface, this.mEGLContext);
        if (!eglMakeCurrent) {
            checkEglError("makeCurrent");
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("makeCurrent()-> ");
        sb.append(eglMakeCurrent);
        Log.d(str, sb.toString());
        return eglMakeCurrent;
    }

    public void makeUnCurrent() {
        if (!EGL14.eglMakeCurrent(this.mEGLDisplay, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT)) {
            checkEglError("makeUnCurrent");
        }
    }

    public void release() {
        if (this.mEGLDisplay != EGL14.EGL_NO_DISPLAY) {
            EGL14.eglDestroySurface(this.mEGLDisplay, this.mEGLSurface);
            EGL14.eglDestroyContext(this.mEGLDisplay, this.mEGLContext);
            EGL14.eglTerminate(this.mEGLDisplay);
        }
        this.mEGLDisplay = EGL14.EGL_NO_DISPLAY;
        this.mEGLContext = EGL14.EGL_NO_CONTEXT;
        this.mEGLSurface = EGL14.EGL_NO_SURFACE;
        this.EGL_SHARE_CONTEXT = EGL14.EGL_NO_CONTEXT;
        try {
            if (this.mSurface != null) {
                this.mSurface.release();
            }
        } catch (Exception e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("release release mSurface failed : ");
            sb.append(e.getMessage());
            Log.e(str, sb.toString());
        }
        this.mSurface = null;
    }

    public void setPresentationTime(long j) {
        EGLExt.eglPresentationTimeANDROID(this.mEGLDisplay, this.mEGLSurface, j);
        checkEglError("eglPresentationTimeANDROID");
    }

    public boolean swapBuffers() {
        if (this.mEGLDisplay == null || this.mEGLSurface == null) {
            return false;
        }
        boolean eglSwapBuffers = EGL14.eglSwapBuffers(this.mEGLDisplay, this.mEGLSurface);
        if (!eglSwapBuffers) {
            checkEglError("makeCurrent");
        }
        return eglSwapBuffers;
    }

    public void updateSize(int i, int i2) {
        if (i != this.mWidth || i2 != this.mHeight) {
            Log.d(TAG, "re-create EGLSurface");
            releaseEGLSurface();
            createEGLSurface();
            this.mWidth = getWidth();
            this.mHeight = getHeight();
        }
    }
}
