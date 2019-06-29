package com.android.camera.effect.framework.gles;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.opengl.EGL14;
import android.opengl.EGLSurface;
import android.opengl.GLES20;
import com.android.camera.log.Log;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.IntBuffer;

public class EglSurfaceBase {
    protected static final String TAG = "EglSurfaceBase";
    private EGLSurface mEGLSurface = EGL14.EGL_NO_SURFACE;
    protected EglCore mEglCore;
    protected int mHeight = -1;
    protected int mWidth = -1;

    protected EglSurfaceBase(EglCore eglCore) {
        this.mEglCore = eglCore;
    }

    public void createPbufferSurface(int i, int i2) {
        if (this.mEGLSurface == EGL14.EGL_NO_SURFACE) {
            this.mEGLSurface = this.mEglCore.createPbufferSurface(i, i2);
            this.mWidth = i;
            this.mHeight = i2;
            return;
        }
        throw new IllegalStateException("surface already created");
    }

    public void createWindowSurface(Object obj) {
        if (this.mEGLSurface == EGL14.EGL_NO_SURFACE) {
            this.mEGLSurface = this.mEglCore.createWindowSurface(obj);
            return;
        }
        throw new IllegalStateException("surface already created");
    }

    public int getHeight() {
        return this.mHeight < 0 ? this.mEglCore.querySurface(this.mEGLSurface, 12374) : this.mHeight;
    }

    public int getWidth() {
        return this.mWidth < 0 ? this.mEglCore.querySurface(this.mEGLSurface, 12375) : this.mWidth;
    }

    public void makeCurrent() {
        this.mEglCore.makeCurrent(this.mEGLSurface);
    }

    public void makeCurrentReadFrom(EglSurfaceBase eglSurfaceBase) {
        this.mEglCore.makeCurrent(this.mEGLSurface, eglSurfaceBase.mEGLSurface);
    }

    public void makeNothingCurrent() {
        this.mEglCore.makeNothingCurrent();
    }

    public void releaseEglSurface() {
        this.mEglCore.releaseSurface(this.mEGLSurface);
        this.mEGLSurface = EGL14.EGL_NO_SURFACE;
        this.mHeight = -1;
        this.mWidth = -1;
    }

    /* JADX WARNING: Removed duplicated region for block: B:13:0x0089  */
    public void saveFrame(File file) throws IOException {
        BufferedOutputStream bufferedOutputStream;
        if (this.mEglCore.isCurrent(this.mEGLSurface)) {
            String file2 = file.toString();
            int width = getWidth();
            int height = getHeight();
            IntBuffer allocate = IntBuffer.allocate(width * height);
            GLES20.glReadPixels(0, 0, width, height, 6408, 5121, allocate);
            OpenGlUtils.checkGlError("glReadPixels");
            try {
                bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(file2));
                try {
                    Bitmap createBitmap = Bitmap.createBitmap(width, height, Config.ARGB_8888);
                    createBitmap.copyPixelsFromBuffer(IntBuffer.wrap(allocate.array()));
                    createBitmap.compress(CompressFormat.PNG, 90, bufferedOutputStream);
                    createBitmap.recycle();
                    bufferedOutputStream.close();
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Saved ");
                    sb.append(width);
                    sb.append("x");
                    sb.append(height);
                    sb.append(" frame as '");
                    sb.append(file2);
                    sb.append("'");
                    Log.d(str, sb.toString());
                } catch (Throwable th) {
                    th = th;
                    if (bufferedOutputStream != null) {
                        bufferedOutputStream.close();
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                bufferedOutputStream = null;
                if (bufferedOutputStream != null) {
                }
                throw th;
            }
        } else {
            throw new RuntimeException("Expected EGL context/surface is not current");
        }
    }

    public void setPresentationTime(long j) {
        this.mEglCore.setPresentationTime(this.mEGLSurface, j);
    }

    public boolean swapBuffers() {
        boolean swapBuffers = this.mEglCore.swapBuffers(this.mEGLSurface);
        if (!swapBuffers) {
            Log.d(TAG, "WARNING: swapBuffers() failed");
        }
        return swapBuffers;
    }
}
