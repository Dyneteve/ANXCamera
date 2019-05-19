package com.android.camera.module.encoder;

import android.graphics.SurfaceTexture;
import android.opengl.EGLContext;
import android.text.TextUtils;
import android.view.Surface;
import android.view.SurfaceHolder;
import com.android.camera.effect.VideoRecorderCanvas;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.log.Log;
import com.android.camera.module.encoder.EGLBase.EglSurface;
import java.util.Locale;

public final class RenderHandler implements Runnable {
    private static final String TAG = RenderHandler.class.getSimpleName();
    private VideoRecorderCanvas mCanvas;
    private EGLBase mEgl;
    private DrawExtTexAttribute mExtTexture = new DrawExtTexAttribute();
    private EglSurface mInputSurface;
    private boolean mIsReady;
    private boolean mIsRecordable;
    private int mPreviewHeight;
    private int mPreviewWidth;
    private int mRequestDraw;
    private boolean mRequestRelease;
    private boolean mRequestSetEglContext;
    private EGLContext mShardContext;
    private Object mSurface;
    private final Object mSync = new Object();

    private RenderHandler(int i, int i2) {
        this.mPreviewWidth = i;
        this.mPreviewHeight = i2;
    }

    public static final RenderHandler createHandler(String str, int i, int i2) {
        Log.v(TAG, String.format(Locale.ENGLISH, "init: previewSize=%dx%d", new Object[]{Integer.valueOf(i), Integer.valueOf(i2)}));
        RenderHandler renderHandler = new RenderHandler(i, i2);
        synchronized (renderHandler.mSync) {
            renderHandler.mIsReady = false;
            if (TextUtils.isEmpty(str)) {
                str = TAG;
            }
            new Thread(renderHandler, str).start();
            if (!renderHandler.mIsReady) {
                try {
                    renderHandler.mSync.wait();
                } catch (InterruptedException e) {
                    Log.e(TAG, e.getMessage(), e);
                }
            }
        }
        return renderHandler;
    }

    private final void internalPrepare() {
        Log.v(TAG, "internalPrepare");
        internalRelease();
        this.mEgl = new EGLBase(this.mShardContext, false, this.mIsRecordable);
        this.mInputSurface = this.mEgl.createFromSurface(this.mSurface);
        this.mInputSurface.makeCurrent();
        this.mCanvas = new VideoRecorderCanvas();
        this.mCanvas.setSize(this.mPreviewWidth, this.mPreviewHeight);
        this.mSurface = null;
        this.mSync.notifyAll();
    }

    private final void internalRelease() {
        Log.v(TAG, "internalRelease");
        if (this.mInputSurface != null) {
            this.mInputSurface.release();
            this.mInputSurface = null;
        }
        if (this.mCanvas != null) {
            this.mCanvas.deleteProgram();
            this.mCanvas.recycledResources();
            this.mCanvas = null;
        }
        if (this.mEgl != null) {
            this.mEgl.release();
            this.mEgl = null;
        }
    }

    public final void draw(DrawExtTexAttribute drawExtTexAttribute) {
        synchronized (this.mSync) {
            if (!this.mRequestRelease) {
                this.mExtTexture.init(drawExtTexAttribute.mExtTexture, drawExtTexAttribute.mTextureTransform, 0, 0, this.mPreviewWidth, this.mPreviewHeight);
                this.mRequestDraw++;
                this.mSync.notifyAll();
            }
        }
    }

    public boolean isValid() {
        boolean z;
        synchronized (this.mSync) {
            if (this.mSurface instanceof Surface) {
                if (!((Surface) this.mSurface).isValid()) {
                    z = false;
                }
            }
            z = true;
        }
        return z;
    }

    public final void release() {
        Log.v(TAG, "release");
        synchronized (this.mSync) {
            if (!this.mRequestRelease) {
                this.mRequestRelease = true;
                this.mSync.notifyAll();
                try {
                    this.mSync.wait();
                } catch (InterruptedException e) {
                    Log.e(TAG, e.getMessage());
                }
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:23:0x003c, code lost:
        if (r0 == false) goto L_0x0058;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:25:0x0040, code lost:
        if (r5.mEgl == null) goto L_0x001a;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:27:0x0044, code lost:
        if (r5.mExtTexture == null) goto L_0x001a;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:28:0x0046, code lost:
        r5.mInputSurface.makeCurrent();
        r5.mCanvas.draw(r5.mExtTexture);
        r5.mInputSurface.swap();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:29:0x0058, code lost:
        r0 = r5.mSync;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:30:0x005a, code lost:
        monitor-enter(r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:32:?, code lost:
        r5.mSync.wait();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:34:?, code lost:
        monitor-exit(r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:36:0x0063, code lost:
        r1 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x0081, code lost:
        throw r1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public final void run() {
        Log.d(TAG, "renderHandlerThread>>>");
        synchronized (this.mSync) {
            this.mRequestSetEglContext = false;
            this.mRequestRelease = false;
            this.mRequestDraw = 0;
            this.mIsReady = true;
            this.mSync.notifyAll();
        }
        while (true) {
            synchronized (this.mSync) {
                if (!this.mRequestRelease) {
                    if (this.mRequestSetEglContext) {
                        this.mRequestSetEglContext = false;
                        internalPrepare();
                    }
                    boolean z = this.mRequestDraw > 0;
                    if (z) {
                        this.mRequestDraw--;
                    }
                }
            }
        }
        synchronized (this.mSync) {
            this.mRequestRelease = true;
            internalRelease();
            this.mSync.notifyAll();
        }
        Log.d(TAG, "renderHandlerThread<<<");
    }

    public final void setEglContext(EGLContext eGLContext, Object obj, boolean z) {
        Log.v(TAG, "setEglContext");
        if ((obj instanceof Surface) || (obj instanceof SurfaceTexture) || (obj instanceof SurfaceHolder)) {
            synchronized (this.mSync) {
                if (!this.mRequestRelease) {
                    this.mShardContext = eGLContext;
                    this.mSurface = obj;
                    this.mIsRecordable = z;
                    this.mRequestSetEglContext = true;
                    this.mSync.notifyAll();
                    try {
                        this.mSync.wait();
                    } catch (InterruptedException e) {
                        Log.e(TAG, e.getMessage(), e);
                    }
                }
            }
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("unsupported window type:");
            sb.append(obj);
            throw new RuntimeException(sb.toString());
        }
    }
}
