package com.android.camera.effect;

import android.opengl.GLES20;
import com.android.camera.effect.framework.gles.RGBTexture;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.GLCanvas;
import com.android.gallery3d.ui.RawTexture;
import java.util.Locale;

public class FrameBuffer {
    private static final String TAG = FrameBuffer.class.getSimpleName();
    private int[] mFrameBufferID;
    private GLCanvas mGLCanvas;
    private RawTexture mTexture;

    public FrameBuffer(GLCanvas gLCanvas, int i, int i2, int i3) {
        this.mFrameBufferID = new int[1];
        this.mTexture = new RawTexture(i, i2, true);
        this.mTexture.prepare(gLCanvas);
        GLES20.glGenFramebuffers(1, this.mFrameBufferID, 0);
        GLES20.glBindFramebuffer(36160, this.mFrameBufferID[0]);
        GLES20.glFramebufferTexture2D(36160, 36064, 3553, this.mTexture.getId(), 0);
        GLES20.glBindFramebuffer(36160, i3);
        this.mGLCanvas = gLCanvas;
        Log.v(TAG, String.format(Locale.ENGLISH, "init@2: fbo=%d tex=%d %d*%d thread=%d", new Object[]{Integer.valueOf(getId()), Integer.valueOf(this.mTexture.getId()), Integer.valueOf(i), Integer.valueOf(i2), Long.valueOf(Thread.currentThread().getId())}));
    }

    public FrameBuffer(GLCanvas gLCanvas, RGBTexture rGBTexture, int i) {
        this.mFrameBufferID = new int[1];
        if (!rGBTexture.isLoaded()) {
            rGBTexture.prepare(gLCanvas);
        }
        GLES20.glGenFramebuffers(1, this.mFrameBufferID, 0);
        GLES20.glBindFramebuffer(36160, this.mFrameBufferID[0]);
        GLES20.glFramebufferTexture2D(36160, 36064, 3553, rGBTexture.getId(), 0);
        GLES20.glBindFramebuffer(36160, i);
        this.mTexture = rGBTexture;
        this.mGLCanvas = gLCanvas;
        Log.v(TAG, String.format(Locale.ENGLISH, "init@1: fbo=%d tex=%d", new Object[]{Integer.valueOf(getId()), Integer.valueOf(this.mTexture.getId())}));
    }

    public FrameBuffer(GLCanvas gLCanvas, RawTexture rawTexture, int i) {
        this.mFrameBufferID = new int[1];
        if (!rawTexture.isLoaded()) {
            rawTexture.prepare(gLCanvas);
        }
        GLES20.glGenFramebuffers(1, this.mFrameBufferID, 0);
        GLES20.glBindFramebuffer(36160, this.mFrameBufferID[0]);
        GLES20.glFramebufferTexture2D(36160, 36064, 3553, rawTexture.getId(), 0);
        GLES20.glBindFramebuffer(36160, i);
        this.mTexture = rawTexture;
        this.mGLCanvas = gLCanvas;
        Log.v(TAG, String.format(Locale.ENGLISH, "init@1: fbo=%d tex=%d %d*%d thread=%d", new Object[]{Integer.valueOf(getId()), Integer.valueOf(this.mTexture.getId()), Integer.valueOf(rawTexture.getWidth()), Integer.valueOf(rawTexture.getHeight()), Long.valueOf(Thread.currentThread().getId())}));
    }

    public void delete() {
        GLES20.glDeleteFramebuffers(1, this.mFrameBufferID, 0);
    }

    /* access modifiers changed from: protected */
    public void finalize() {
        if (this.mGLCanvas != null) {
            Log.d(TAG, String.format(Locale.ENGLISH, "delete fbo thread=%d id=%d", new Object[]{Long.valueOf(Thread.currentThread().getId()), Integer.valueOf(getId())}));
            this.mGLCanvas.deleteFrameBuffer(getId());
        }
    }

    public int getHeight() {
        return this.mTexture.getHeight();
    }

    public int getId() {
        return this.mFrameBufferID[0];
    }

    public RawTexture getTexture() {
        return this.mTexture;
    }

    public int getWidth() {
        return this.mTexture.getWidth();
    }
}
