package com.android.camera.ui;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.graphics.drawable.Drawable;
import android.opengl.GLDebugHelper;
import android.opengl.GLSurfaceView.Renderer;
import android.util.AttributeSet;
import android.view.SurfaceHolder;
import android.view.TextureView;
import android.view.TextureView.SurfaceTextureListener;
import com.android.camera.log.Log;
import java.io.Writer;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.egl.EGLSurface;
import javax.microedition.khronos.opengles.GL;
import javax.microedition.khronos.opengles.GL10;

public class GLTextureView extends TextureView implements SurfaceTextureListener {
    public static final int DEBUG_CHECK_GL_ERROR = 1;
    public static final int DEBUG_LOG_GL_CALLS = 2;
    private static final boolean LOG_ATTACH_DETACH = false;
    private static final boolean LOG_EGL = false;
    private static final boolean LOG_PAUSE_RESUME = false;
    private static final boolean LOG_RENDERER = false;
    private static final boolean LOG_RENDERER_DRAW_FRAME = false;
    private static final boolean LOG_SURFACE = false;
    private static final boolean LOG_THREADS = false;
    public static final int RENDERMODE_CONTINUOUSLY = 1;
    public static final int RENDERMODE_WHEN_DIRTY = 0;
    private static final String TAG = "GLTextureView";
    /* access modifiers changed from: private */
    public static final GLThreadManager sGLThreadManager = new GLThreadManager();
    /* access modifiers changed from: private */
    public int mDebugFlags;
    private boolean mDetached;
    /* access modifiers changed from: private */
    public EGLConfigChooser mEGLConfigChooser;
    /* access modifiers changed from: private */
    public int mEGLContextClientVersion;
    /* access modifiers changed from: private */
    public EGLContextFactory mEGLContextFactory;
    /* access modifiers changed from: private */
    public EGLWindowSurfaceFactory mEGLWindowSurfaceFactory;
    private GLThread mGLThread;
    /* access modifiers changed from: private */
    public GLWrapper mGLWrapper;
    /* access modifiers changed from: private */
    public boolean mPreserveEGLContextOnPause;
    private int mPreservedHeight;
    private int mPreservedWidth;
    /* access modifiers changed from: private */
    public Renderer mRenderer;
    /* access modifiers changed from: private */
    public EGLShareContextGetter mShareContextGetter;
    private final WeakReference<GLTextureView> mThisWeakRef = new WeakReference<>(this);

    private abstract class BaseConfigChooser implements EGLConfigChooser {
        protected int[] mConfigSpec;

        public BaseConfigChooser(int[] iArr) {
            this.mConfigSpec = filterConfigSpec(iArr);
        }

        private int[] filterConfigSpec(int[] iArr) {
            if (GLTextureView.this.mEGLContextClientVersion != 2) {
                return iArr;
            }
            int length = iArr.length;
            int[] iArr2 = new int[(length + 2)];
            int i = length - 1;
            System.arraycopy(iArr, 0, iArr2, 0, i);
            iArr2[i] = 12352;
            iArr2[length] = 4;
            iArr2[length + 1] = 12344;
            return iArr2;
        }

        public EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay) {
            int[] iArr = new int[1];
            if (egl10.eglChooseConfig(eGLDisplay, this.mConfigSpec, null, 0, iArr)) {
                int i = iArr[0];
                if (i > 0) {
                    EGLConfig[] eGLConfigArr = new EGLConfig[i];
                    if (egl10.eglChooseConfig(eGLDisplay, this.mConfigSpec, eGLConfigArr, i, iArr)) {
                        EGLConfig chooseConfig = chooseConfig(egl10, eGLDisplay, eGLConfigArr);
                        if (chooseConfig != null) {
                            return chooseConfig;
                        }
                        throw new IllegalArgumentException("No config chosen");
                    }
                    throw new IllegalArgumentException("eglChooseConfig#2 failed");
                }
                throw new IllegalArgumentException("No configs match configSpec");
            }
            throw new IllegalArgumentException("eglChooseConfig failed");
        }

        /* access modifiers changed from: 0000 */
        public abstract EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig[] eGLConfigArr);
    }

    private class ComponentSizeChooser extends BaseConfigChooser {
        protected int mAlphaSize;
        protected int mBlueSize;
        protected int mDepthSize;
        protected int mGreenSize;
        protected int mRedSize;
        protected int mStencilSize;
        private int[] mValue = new int[1];

        public ComponentSizeChooser(int i, int i2, int i3, int i4, int i5, int i6) {
            super(new int[]{12324, i, 12323, i2, 12322, i3, 12321, i4, 12325, i5, 12326, i6, 12344});
            this.mRedSize = i;
            this.mGreenSize = i2;
            this.mBlueSize = i3;
            this.mAlphaSize = i4;
            this.mDepthSize = i5;
            this.mStencilSize = i6;
        }

        private int findConfigAttrib(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, int i, int i2) {
            return egl10.eglGetConfigAttrib(eGLDisplay, eGLConfig, i, this.mValue) ? this.mValue[0] : i2;
        }

        public EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig[] eGLConfigArr) {
            for (EGLConfig eGLConfig : eGLConfigArr) {
                EGL10 egl102 = egl10;
                EGLDisplay eGLDisplay2 = eGLDisplay;
                EGLConfig eGLConfig2 = eGLConfig;
                int findConfigAttrib = findConfigAttrib(egl102, eGLDisplay2, eGLConfig2, 12325, 0);
                int findConfigAttrib2 = findConfigAttrib(egl102, eGLDisplay2, eGLConfig2, 12326, 0);
                if (findConfigAttrib >= this.mDepthSize && findConfigAttrib2 >= this.mStencilSize) {
                    EGL10 egl103 = egl10;
                    EGLDisplay eGLDisplay3 = eGLDisplay;
                    EGLConfig eGLConfig3 = eGLConfig;
                    int findConfigAttrib3 = findConfigAttrib(egl103, eGLDisplay3, eGLConfig3, 12324, 0);
                    int findConfigAttrib4 = findConfigAttrib(egl103, eGLDisplay3, eGLConfig3, 12323, 0);
                    int findConfigAttrib5 = findConfigAttrib(egl103, eGLDisplay3, eGLConfig3, 12322, 0);
                    int findConfigAttrib6 = findConfigAttrib(egl103, eGLDisplay3, eGLConfig3, 12321, 0);
                    if (findConfigAttrib3 == this.mRedSize && findConfigAttrib4 == this.mGreenSize && findConfigAttrib5 == this.mBlueSize && findConfigAttrib6 == this.mAlphaSize) {
                        return eGLConfig;
                    }
                }
            }
            return null;
        }
    }

    private class DefaultContextFactory implements EGLContextFactory {
        private static final String TAG = "DefaultContextFactory";
        private int EGL_CONTEXT_CLIENT_VERSION;

        private DefaultContextFactory() {
            this.EGL_CONTEXT_CLIENT_VERSION = 12440;
        }

        public EGLContext createContext(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, EGLContext eGLContext) {
            int[] iArr = {this.EGL_CONTEXT_CLIENT_VERSION, GLTextureView.this.mEGLContextClientVersion, 12344};
            if (eGLContext == null) {
                eGLContext = EGL10.EGL_NO_CONTEXT;
            }
            if (GLTextureView.this.mEGLContextClientVersion == 0) {
                iArr = null;
            }
            return egl10.eglCreateContext(eGLDisplay, eGLConfig, eGLContext, iArr);
        }

        public void destroyContext(EGL10 egl10, EGLDisplay eGLDisplay, EGLContext eGLContext) {
            if (!egl10.eglDestroyContext(eGLDisplay, eGLContext)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("display:");
                sb.append(eGLDisplay);
                sb.append(" context: ");
                sb.append(eGLContext);
                Log.e(str, sb.toString());
                EglHelper.throwEglException("eglDestroyContex", egl10.eglGetError());
            }
        }
    }

    private static class DefaultWindowSurfaceFactory implements EGLWindowSurfaceFactory {
        private DefaultWindowSurfaceFactory() {
        }

        public EGLSurface createWindowSurface(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, Object obj) {
            try {
                return egl10.eglCreateWindowSurface(eGLDisplay, eGLConfig, obj, null);
            } catch (IllegalArgumentException e) {
                Log.e(GLTextureView.TAG, "eglCreateWindowSurface", e);
                return null;
            }
        }

        public void destroySurface(EGL10 egl10, EGLDisplay eGLDisplay, EGLSurface eGLSurface) {
            egl10.eglDestroySurface(eGLDisplay, eGLSurface);
        }
    }

    public interface EGLConfigChooser {
        EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay);
    }

    public interface EGLContextFactory {
        EGLContext createContext(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, EGLContext eGLContext);

        void destroyContext(EGL10 egl10, EGLDisplay eGLDisplay, EGLContext eGLContext);
    }

    public interface EGLShareContextGetter {
        EGLContext getShareContext();
    }

    public interface EGLWindowSurfaceFactory {
        EGLSurface createWindowSurface(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, Object obj);

        void destroySurface(EGL10 egl10, EGLDisplay eGLDisplay, EGLSurface eGLSurface);
    }

    private static class EglHelper {
        private static final String TAG = "EglHelper";
        EGL10 mEgl;
        EGLConfig mEglConfig;
        EGLContext mEglContext;
        EGLDisplay mEglDisplay;
        EGLSurface mEglSurface;
        private WeakReference<GLTextureView> mGLTextureViewWeakRef;

        public EglHelper(WeakReference<GLTextureView> weakReference) {
            this.mGLTextureViewWeakRef = weakReference;
        }

        private void destroySurfaceImp() {
            if (this.mEglSurface != null && this.mEglSurface != EGL10.EGL_NO_SURFACE) {
                this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
                GLTextureView gLTextureView = (GLTextureView) this.mGLTextureViewWeakRef.get();
                if (gLTextureView != null) {
                    gLTextureView.mEGLWindowSurfaceFactory.destroySurface(this.mEgl, this.mEglDisplay, this.mEglSurface);
                }
                this.mEglSurface = null;
            }
        }

        public static String formatEglError(String str, int i) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(" failed");
            return sb.toString();
        }

        public static void logEglErrorAsWarning(String str, String str2, int i) {
            Log.w(str, formatEglError(str2, i));
        }

        private void throwEglException(String str) {
            throwEglException(str, this.mEgl.eglGetError());
        }

        public static void throwEglException(String str, int i) {
            throw new RuntimeException(formatEglError(str, i));
        }

        /* access modifiers changed from: 0000 */
        public GL createGL() {
            GL gl = this.mEglContext.getGL();
            GLTextureView gLTextureView = (GLTextureView) this.mGLTextureViewWeakRef.get();
            if (gLTextureView == null) {
                return gl;
            }
            if (gLTextureView.mGLWrapper != null) {
                gl = gLTextureView.mGLWrapper.wrap(gl);
            }
            if ((gLTextureView.mDebugFlags & 3) == 0) {
                return gl;
            }
            int i = 0;
            LogWriter logWriter = null;
            if ((gLTextureView.mDebugFlags & 1) != 0) {
                i = 1;
            }
            if ((gLTextureView.mDebugFlags & 2) != 0) {
                logWriter = new LogWriter();
            }
            return GLDebugHelper.wrap(gl, i, logWriter);
        }

        public boolean createSurface() {
            if (this.mEgl == null) {
                throw new RuntimeException("egl not initialized");
            } else if (this.mEglDisplay == null) {
                throw new RuntimeException("eglDisplay not initialized");
            } else if (this.mEglConfig != null) {
                destroySurfaceImp();
                GLTextureView gLTextureView = (GLTextureView) this.mGLTextureViewWeakRef.get();
                if (gLTextureView != null) {
                    this.mEglSurface = gLTextureView.mEGLWindowSurfaceFactory.createWindowSurface(this.mEgl, this.mEglDisplay, this.mEglConfig, gLTextureView.getSurfaceTexture());
                } else {
                    this.mEglSurface = null;
                }
                if (this.mEglSurface == null || this.mEglSurface == EGL10.EGL_NO_SURFACE) {
                    if (this.mEgl.eglGetError() == 12299) {
                        Log.e(TAG, "createWindowSurface returned EGL_BAD_NATIVE_WINDOW.");
                    }
                    return false;
                } else if (this.mEgl.eglMakeCurrent(this.mEglDisplay, this.mEglSurface, this.mEglSurface, this.mEglContext)) {
                    return true;
                } else {
                    logEglErrorAsWarning(TAG, "eglMakeCurrent", this.mEgl.eglGetError());
                    return false;
                }
            } else {
                throw new RuntimeException("mEglConfig not initialized");
            }
        }

        public void destroySurface() {
            destroySurfaceImp();
        }

        public void finish() {
            if (this.mEglContext != null) {
                GLTextureView gLTextureView = (GLTextureView) this.mGLTextureViewWeakRef.get();
                if (gLTextureView != null) {
                    gLTextureView.mEGLContextFactory.destroyContext(this.mEgl, this.mEglDisplay, this.mEglContext);
                }
                this.mEglContext = null;
            }
            if (this.mEglDisplay != null) {
                this.mEgl.eglTerminate(this.mEglDisplay);
                this.mEglDisplay = null;
            }
        }

        public void start() {
            this.mEgl = (EGL10) EGLContext.getEGL();
            this.mEglDisplay = this.mEgl.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
            if (this.mEglDisplay != EGL10.EGL_NO_DISPLAY) {
                if (this.mEgl.eglInitialize(this.mEglDisplay, new int[2])) {
                    GLTextureView gLTextureView = (GLTextureView) this.mGLTextureViewWeakRef.get();
                    if (gLTextureView == null) {
                        this.mEglConfig = null;
                        this.mEglContext = null;
                    } else {
                        this.mEglConfig = gLTextureView.mEGLConfigChooser.chooseConfig(this.mEgl, this.mEglDisplay);
                        this.mEglContext = gLTextureView.mEGLContextFactory.createContext(this.mEgl, this.mEglDisplay, this.mEglConfig, gLTextureView.mShareContextGetter == null ? null : gLTextureView.mShareContextGetter.getShareContext());
                    }
                    if (this.mEglContext == null || this.mEglContext == EGL10.EGL_NO_CONTEXT) {
                        this.mEglContext = null;
                        throwEglException("createContext");
                    }
                    this.mEglSurface = null;
                    return;
                }
                throw new RuntimeException("eglInitialize failed");
            }
            throw new RuntimeException("eglGetDisplay failed");
        }

        public int swap() {
            if (!this.mEgl.eglSwapBuffers(this.mEglDisplay, this.mEglSurface)) {
                return this.mEgl.eglGetError();
            }
            return 12288;
        }
    }

    static class GLThread extends Thread {
        private static final String TAG = "GLThread";
        private EglHelper mEglHelper;
        private ArrayList<Runnable> mEventQueue;
        /* access modifiers changed from: private */
        public boolean mExited;
        private boolean mFinishedCreatingEglSurface;
        private WeakReference<GLTextureView> mGLTextureViewWeakRef;
        private boolean mHasSurface;
        private boolean mHaveEglContext;
        private boolean mHaveEglSurface;
        private int mHeight;
        private boolean mPaused;
        private boolean mRenderComplete;
        private int mRenderMode;
        private boolean mRequestPaused;
        private boolean mRequestRender;
        private boolean mShouldExit;
        private boolean mShouldReleaseEglContext;
        private boolean mSizeChanged;
        private boolean mSurfaceIsBad;
        private boolean mWaitingForSurface;
        private int mWidth;

        GLThread(WeakReference<GLTextureView> weakReference) {
            this.mEventQueue = new ArrayList<>();
            this.mSizeChanged = true;
            this.mWidth = 0;
            this.mHeight = 0;
            this.mRequestRender = true;
            this.mRenderMode = 1;
            this.mGLTextureViewWeakRef = weakReference;
        }

        GLThread(WeakReference<GLTextureView> weakReference, int i, int i2) {
            this.mEventQueue = new ArrayList<>();
            this.mSizeChanged = true;
            this.mWidth = i;
            this.mHeight = i2;
            this.mRequestRender = true;
            this.mRenderMode = 1;
            this.mGLTextureViewWeakRef = weakReference;
        }

        /* JADX WARNING: Code restructure failed: missing block: B:100:0x0182, code lost:
            if (r1.mEglHelper.createSurface() == false) goto L_0x019a;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:101:0x0184, code lost:
            r12 = com.android.camera.ui.GLTextureView.access$900();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:102:0x0188, code lost:
            monitor-enter(r12);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:105:?, code lost:
            r1.mFinishedCreatingEglSurface = true;
            com.android.camera.ui.GLTextureView.access$900().notifyAll();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:106:0x0193, code lost:
            monitor-exit(r12);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:107:0x0194, code lost:
            r12 = r2;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:112:0x019a, code lost:
            r15 = com.android.camera.ui.GLTextureView.access$900();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:113:0x019e, code lost:
            monitor-enter(r15);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:116:?, code lost:
            r1.mFinishedCreatingEglSurface = true;
            r1.mSurfaceIsBad = true;
            com.android.camera.ui.GLTextureView.access$900().notifyAll();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:117:0x01ab, code lost:
            monitor-exit(r15);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:118:0x01ac, code lost:
            r0 = r2;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:123:0x01b3, code lost:
            if (r13 == false) goto L_0x01c7;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:124:0x01b5, code lost:
            r0 = (javax.microedition.khronos.opengles.GL10) r1.mEglHelper.createGL();
            com.android.camera.ui.GLTextureView.access$900().checkGLDriver(r0);
            r7 = r0;
            r13 = r2;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:125:0x01c7, code lost:
            if (r11 == false) goto L_0x01e0;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:126:0x01c9, code lost:
            r0 = (com.android.camera.ui.GLTextureView) r1.mGLTextureViewWeakRef.get();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:127:0x01d1, code lost:
            if (r0 == null) goto L_0x01de;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:128:0x01d3, code lost:
            com.android.camera.ui.GLTextureView.access$1100(r0).onSurfaceCreated(r7, r1.mEglHelper.mEglConfig);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:129:0x01de, code lost:
            r11 = r2;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:130:0x01e0, code lost:
            if (r14 == false) goto L_0x01f5;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:131:0x01e2, code lost:
            r0 = (com.android.camera.ui.GLTextureView) r1.mGLTextureViewWeakRef.get();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:132:0x01ea, code lost:
            if (r0 == null) goto L_0x01f3;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:133:0x01ec, code lost:
            com.android.camera.ui.GLTextureView.access$1100(r0).onSurfaceChanged(r7, r8, r9);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:134:0x01f3, code lost:
            r14 = r2;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:135:0x01f5, code lost:
            r0 = (com.android.camera.ui.GLTextureView) r1.mGLTextureViewWeakRef.get();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:136:0x01fd, code lost:
            if (r0 == null) goto L_0x0206;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:137:0x01ff, code lost:
            com.android.camera.ui.GLTextureView.access$1100(r0).onDrawFrame(r7);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:138:0x0206, code lost:
            r0 = r1.mEglHelper.swap();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:139:0x020e, code lost:
            if (r0 == 12288) goto L_0x0233;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:141:0x0212, code lost:
            if (r0 == 12302) goto L_0x022f;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:142:0x0214, code lost:
            com.android.camera.ui.GLTextureView.EglHelper.logEglErrorAsWarning(TAG, "eglSwapBuffers", r0);
            r2 = com.android.camera.ui.GLTextureView.access$900();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:143:0x021f, code lost:
            monitor-enter(r2);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:144:0x0220, code lost:
            r0 = true;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:146:?, code lost:
            r1.mSurfaceIsBad = true;
            com.android.camera.ui.GLTextureView.access$900().notifyAll();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:147:0x022a, code lost:
            monitor-exit(r2);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:153:0x022f, code lost:
            r0 = true;
            r5 = true;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:154:0x0233, code lost:
            r0 = true;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:155:0x0234, code lost:
            if (r6 == false) goto L_0x0238;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:156:0x0236, code lost:
            r3 = r0;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:95:0x0170, code lost:
            if (r10 == null) goto L_0x017a;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:98:0x017a, code lost:
            if (r12 == false) goto L_0x01b3;
         */
        private void guardedRun() throws InterruptedException {
            boolean z;
            boolean z2;
            boolean z3;
            this.mEglHelper = new EglHelper(this.mGLTextureViewWeakRef);
            this.mHaveEglContext = false;
            this.mHaveEglSurface = false;
            boolean z4 = false;
            boolean z5 = false;
            boolean z6 = false;
            boolean z7 = false;
            int i = 0;
            int i2 = 0;
            boolean z8 = false;
            boolean z9 = false;
            boolean z10 = false;
            boolean z11 = false;
            GL10 gl10 = null;
            loop0:
            while (true) {
                Runnable runnable = null;
                while (true) {
                    try {
                        synchronized (GLTextureView.sGLThreadManager) {
                            while (!this.mShouldExit) {
                                if (!this.mEventQueue.isEmpty()) {
                                    runnable = (Runnable) this.mEventQueue.remove(0);
                                    z = false;
                                } else {
                                    if (this.mPaused != this.mRequestPaused) {
                                        z2 = this.mRequestPaused;
                                        this.mPaused = this.mRequestPaused;
                                        GLTextureView.sGLThreadManager.notifyAll();
                                    } else {
                                        z2 = false;
                                    }
                                    if (this.mShouldReleaseEglContext) {
                                        stopEglSurfaceLocked();
                                        stopEglContextLocked();
                                        this.mShouldReleaseEglContext = false;
                                        z5 = true;
                                    }
                                    if (z6) {
                                        stopEglSurfaceLocked();
                                        stopEglContextLocked();
                                        z6 = false;
                                    }
                                    if (z2 && this.mHaveEglSurface) {
                                        stopEglSurfaceLocked();
                                    }
                                    if (z2 && this.mHaveEglContext) {
                                        GLTextureView gLTextureView = (GLTextureView) this.mGLTextureViewWeakRef.get();
                                        if (!(gLTextureView == null ? false : gLTextureView.mPreserveEGLContextOnPause) || GLTextureView.sGLThreadManager.shouldReleaseEGLContextWhenPausing()) {
                                            stopEglContextLocked();
                                        }
                                    }
                                    if (z2 && GLTextureView.sGLThreadManager.shouldTerminateEGLWhenPausing()) {
                                        this.mEglHelper.finish();
                                    }
                                    if (!this.mHasSurface && !this.mWaitingForSurface) {
                                        if (this.mHaveEglSurface) {
                                            stopEglSurfaceLocked();
                                        }
                                        this.mWaitingForSurface = true;
                                        this.mSurfaceIsBad = false;
                                        GLTextureView.sGLThreadManager.notifyAll();
                                    }
                                    if (this.mHasSurface && this.mWaitingForSurface) {
                                        this.mWaitingForSurface = false;
                                        GLTextureView.sGLThreadManager.notifyAll();
                                    }
                                    if (z4) {
                                        this.mRenderComplete = true;
                                        GLTextureView.sGLThreadManager.notifyAll();
                                        z4 = false;
                                        z7 = false;
                                    }
                                    if (readyToDraw()) {
                                        if (!this.mHaveEglContext) {
                                            if (z5) {
                                                z5 = false;
                                            } else if (GLTextureView.sGLThreadManager.tryAcquireEglContextLocked(this)) {
                                                try {
                                                    this.mEglHelper.start();
                                                    this.mHaveEglContext = true;
                                                    GLTextureView.sGLThreadManager.notifyAll();
                                                    z8 = true;
                                                } catch (RuntimeException e) {
                                                    GLTextureView.sGLThreadManager.releaseEglContextLocked(this);
                                                    throw e;
                                                }
                                            }
                                        }
                                        if (!this.mHaveEglContext || this.mHaveEglSurface) {
                                            z3 = z9;
                                        } else {
                                            this.mHaveEglSurface = true;
                                            z3 = true;
                                            z10 = true;
                                            z11 = true;
                                        }
                                        if (this.mHaveEglSurface) {
                                            if (this.mSizeChanged) {
                                                i = this.mWidth;
                                                i2 = this.mHeight;
                                                z = false;
                                                this.mSizeChanged = false;
                                                z3 = true;
                                                z7 = true;
                                                z11 = true;
                                            } else {
                                                z = false;
                                            }
                                            this.mRequestRender = z;
                                            GLTextureView.sGLThreadManager.notifyAll();
                                            z9 = z3;
                                        } else {
                                            z9 = z3;
                                        }
                                    }
                                    GLTextureView.sGLThreadManager.wait();
                                }
                            }
                            synchronized (GLTextureView.sGLThreadManager) {
                                stopEglSurfaceLocked();
                                stopEglContextLocked();
                            }
                            return;
                        }
                    } catch (RuntimeException e2) {
                        try {
                            Log.d(TAG, "got exception", e2);
                            synchronized (GLTextureView.sGLThreadManager) {
                                stopEglSurfaceLocked();
                                stopEglContextLocked();
                                return;
                            }
                        } catch (Throwable th) {
                            synchronized (GLTextureView.sGLThreadManager) {
                                stopEglSurfaceLocked();
                                stopEglContextLocked();
                                throw th;
                            }
                        }
                    }
                }
                runnable.run();
                boolean z12 = z;
            }
        }

        private boolean readyToDraw() {
            return !this.mPaused && this.mHasSurface && !this.mSurfaceIsBad && this.mWidth > 0 && this.mHeight > 0 && (this.mRequestRender || this.mRenderMode == 1);
        }

        private void stopEglContextLocked() {
            if (this.mHaveEglContext) {
                this.mEglHelper.finish();
                this.mHaveEglContext = false;
                GLTextureView.sGLThreadManager.releaseEglContextLocked(this);
            }
        }

        private void stopEglSurfaceLocked() {
            if (this.mHaveEglSurface) {
                this.mHaveEglSurface = false;
                this.mEglHelper.destroySurface();
            }
        }

        public boolean ableToDraw() {
            return this.mHaveEglContext && this.mHaveEglSurface && readyToDraw();
        }

        public int getRenderMode() {
            int i;
            synchronized (GLTextureView.sGLThreadManager) {
                i = this.mRenderMode;
            }
            return i;
        }

        public void onPause() {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mRequestPaused = true;
                GLTextureView.sGLThreadManager.notifyAll();
                while (!this.mExited && !this.mPaused) {
                    try {
                        GLTextureView.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void onResume() {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mRequestPaused = false;
                this.mRequestRender = true;
                this.mRenderComplete = false;
                GLTextureView.sGLThreadManager.notifyAll();
                while (!this.mExited && this.mPaused && !this.mRenderComplete) {
                    try {
                        GLTextureView.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void onWindowResize(int i, int i2) {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mWidth = i;
                this.mHeight = i2;
                this.mSizeChanged = true;
                this.mRequestRender = true;
                this.mRenderComplete = false;
                GLTextureView.sGLThreadManager.notifyAll();
                while (!this.mExited && !this.mPaused && !this.mRenderComplete && ableToDraw()) {
                    try {
                        GLTextureView.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void queueEvent(Runnable runnable) {
            if (runnable != null) {
                synchronized (GLTextureView.sGLThreadManager) {
                    this.mEventQueue.add(runnable);
                    GLTextureView.sGLThreadManager.notifyAll();
                }
                return;
            }
            throw new IllegalArgumentException("r must not be null");
        }

        public void requestExitAndWait() {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mShouldExit = true;
                GLTextureView.sGLThreadManager.notifyAll();
                while (!this.mExited) {
                    try {
                        GLTextureView.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void requestReleaseEglContextLocked() {
            this.mShouldReleaseEglContext = true;
            GLTextureView.sGLThreadManager.notifyAll();
        }

        public void requestRender() {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mRequestRender = true;
                GLTextureView.sGLThreadManager.notifyAll();
            }
        }

        public void run() {
            StringBuilder sb = new StringBuilder();
            sb.append("GLThread ");
            sb.append(getId());
            setName(sb.toString());
            try {
                guardedRun();
            } catch (InterruptedException e) {
            } catch (Throwable th) {
                GLTextureView.sGLThreadManager.threadExiting(this);
                throw th;
            }
            GLTextureView.sGLThreadManager.threadExiting(this);
        }

        public void setRenderMode(int i) {
            if (i < 0 || i > 1) {
                throw new IllegalArgumentException("renderMode");
            }
            synchronized (GLTextureView.sGLThreadManager) {
                this.mRenderMode = i;
                GLTextureView.sGLThreadManager.notifyAll();
            }
        }

        public void surfaceCreated() {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mHasSurface = true;
                this.mFinishedCreatingEglSurface = false;
                GLTextureView.sGLThreadManager.notifyAll();
                while (this.mWaitingForSurface && !this.mFinishedCreatingEglSurface && !this.mExited) {
                    try {
                        GLTextureView.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void surfaceDestroyed() {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mHasSurface = false;
                GLTextureView.sGLThreadManager.notifyAll();
                while (!this.mWaitingForSurface && !this.mExited) {
                    try {
                        GLTextureView.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }
    }

    private static class GLThreadManager {
        private static String TAG = "GLThreadManager";
        private static final int kGLES_20 = 131072;
        private static final String kMSM7K_RENDERER_PREFIX = "Q3Dimension MSM7500 ";
        private GLThread mEglOwner;
        private boolean mGLESDriverCheckComplete;
        private int mGLESVersion;
        private boolean mGLESVersionCheckComplete;
        private boolean mLimitedGLESContexts;
        private boolean mMultipleGLESContextsAllowed;

        private GLThreadManager() {
        }

        private void checkGLESVersion() {
            if (!this.mGLESVersionCheckComplete) {
                this.mMultipleGLESContextsAllowed = true;
                this.mGLESVersionCheckComplete = true;
            }
        }

        public synchronized void checkGLDriver(GL10 gl10) {
            if (!this.mGLESDriverCheckComplete) {
                checkGLESVersion();
                String glGetString = gl10.glGetString(7937);
                if (this.mGLESVersion < 131072) {
                    this.mMultipleGLESContextsAllowed = !glGetString.startsWith(kMSM7K_RENDERER_PREFIX);
                    notifyAll();
                }
                this.mLimitedGLESContexts = !this.mMultipleGLESContextsAllowed;
                this.mGLESDriverCheckComplete = true;
            }
        }

        public void releaseEglContextLocked(GLThread gLThread) {
            if (this.mEglOwner == gLThread) {
                this.mEglOwner = null;
            }
            notifyAll();
        }

        public synchronized boolean shouldReleaseEGLContextWhenPausing() {
            return this.mLimitedGLESContexts;
        }

        public synchronized boolean shouldTerminateEGLWhenPausing() {
            checkGLESVersion();
            return !this.mMultipleGLESContextsAllowed;
        }

        public synchronized void threadExiting(GLThread gLThread) {
            gLThread.mExited = true;
            if (this.mEglOwner == gLThread) {
                this.mEglOwner = null;
            }
            notifyAll();
        }

        public boolean tryAcquireEglContextLocked(GLThread gLThread) {
            if (this.mEglOwner == gLThread || this.mEglOwner == null) {
                this.mEglOwner = gLThread;
                notifyAll();
                return true;
            }
            checkGLESVersion();
            if (this.mMultipleGLESContextsAllowed) {
                return true;
            }
            if (this.mEglOwner != null) {
                this.mEglOwner.requestReleaseEglContextLocked();
            }
            return false;
        }
    }

    public interface GLWrapper {
        GL wrap(GL gl);
    }

    static class LogWriter extends Writer {
        private StringBuilder mBuilder = new StringBuilder();

        LogWriter() {
        }

        private void flushBuilder() {
            if (this.mBuilder.length() > 0) {
                Log.v(Log.CONTINUAL, this.mBuilder.toString());
                this.mBuilder.delete(0, this.mBuilder.length());
            }
        }

        public void close() {
            flushBuilder();
        }

        public void flush() {
            flushBuilder();
        }

        public void write(char[] cArr, int i, int i2) {
            for (int i3 = 0; i3 < i2; i3++) {
                char c = cArr[i + i3];
                if (c == 10) {
                    flushBuilder();
                } else {
                    this.mBuilder.append(c);
                }
            }
        }
    }

    private class SimpleEGLConfigChooser extends ComponentSizeChooser {
        public SimpleEGLConfigChooser(boolean z) {
            super(8, 8, 8, 0, z ? 16 : 0, 0);
        }
    }

    public GLTextureView(Context context) {
        super(context);
        init();
    }

    public GLTextureView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    private void checkRenderThreadState() {
        if (this.mGLThread != null) {
            throw new IllegalStateException("setRenderer has already been called for this instance.");
        }
    }

    private void init() {
        setSurfaceTextureListener(this);
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        try {
            if (this.mGLThread != null) {
                this.mGLThread.requestExitAndWait();
            }
        } finally {
            super.finalize();
        }
    }

    public int getDebugFlags() {
        return this.mDebugFlags;
    }

    public boolean getPreserveEGLContextOnPause() {
        return this.mPreserveEGLContextOnPause;
    }

    public int getRenderMode() {
        return this.mGLThread.getRenderMode();
    }

    public Renderer getRenderer() {
        return this.mRenderer;
    }

    public void on(SurfaceHolder surfaceHolder) {
        this.mGLThread.surfaceCreated();
    }

    /* access modifiers changed from: protected */
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.mDetached && this.mRenderer != null) {
            int renderMode = this.mGLThread != null ? this.mGLThread.getRenderMode() : 1;
            this.mGLThread = new GLThread(this.mThisWeakRef, this.mPreservedWidth, this.mPreservedHeight);
            if (renderMode != 1) {
                this.mGLThread.setRenderMode(renderMode);
            }
            this.mGLThread.start();
        }
        this.mDetached = false;
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        if (this.mGLThread != null) {
            this.mGLThread.requestExitAndWait();
        }
        this.mDetached = true;
        super.onDetachedFromWindow();
    }

    public void onPause() {
        this.mGLThread.onPause();
    }

    public void onResume() {
        this.mGLThread.onResume();
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        this.mPreservedWidth = i;
        this.mPreservedHeight = i2;
        this.mGLThread.onWindowResize(i, i2);
    }

    public void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int i, int i2) {
        this.mGLThread.surfaceCreated();
    }

    public boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
        this.mGLThread.surfaceDestroyed();
        return true;
    }

    public void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int i, int i2) {
        this.mPreservedWidth = i;
        this.mPreservedHeight = i2;
        this.mGLThread.onWindowResize(i, i2);
    }

    public void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {
    }

    public void queueEvent(Runnable runnable) {
        this.mGLThread.queueEvent(runnable);
    }

    public void requestRender() {
        this.mGLThread.requestRender();
    }

    public void setBackgroundDrawable(Drawable drawable) {
    }

    public void setDebugFlags(int i) {
        this.mDebugFlags = i;
    }

    public void setEGLConfigChooser(int i, int i2, int i3, int i4, int i5, int i6) {
        ComponentSizeChooser componentSizeChooser = new ComponentSizeChooser(i, i2, i3, i4, i5, i6);
        setEGLConfigChooser((EGLConfigChooser) componentSizeChooser);
    }

    public void setEGLConfigChooser(EGLConfigChooser eGLConfigChooser) {
        checkRenderThreadState();
        this.mEGLConfigChooser = eGLConfigChooser;
    }

    public void setEGLConfigChooser(boolean z) {
        setEGLConfigChooser((EGLConfigChooser) new SimpleEGLConfigChooser(z));
    }

    public void setEGLContextClientVersion(int i) {
        checkRenderThreadState();
        this.mEGLContextClientVersion = i;
    }

    public void setEGLContextFactory(EGLContextFactory eGLContextFactory) {
        checkRenderThreadState();
        this.mEGLContextFactory = eGLContextFactory;
    }

    public void setEGLShareContextGetter(EGLShareContextGetter eGLShareContextGetter) {
        this.mShareContextGetter = eGLShareContextGetter;
    }

    public void setEGLWindowSurfaceFactory(EGLWindowSurfaceFactory eGLWindowSurfaceFactory) {
        checkRenderThreadState();
        this.mEGLWindowSurfaceFactory = eGLWindowSurfaceFactory;
    }

    public void setGLWrapper(GLWrapper gLWrapper) {
        this.mGLWrapper = gLWrapper;
    }

    public void setPreserveEGLContextOnPause(boolean z) {
        this.mPreserveEGLContextOnPause = z;
    }

    public void setRenderMode(int i) {
        this.mGLThread.setRenderMode(i);
    }

    public void setRenderer(Renderer renderer) {
        checkRenderThreadState();
        if (this.mEGLConfigChooser == null) {
            this.mEGLConfigChooser = new SimpleEGLConfigChooser(true);
        }
        if (this.mEGLContextFactory == null) {
            this.mEGLContextFactory = new DefaultContextFactory();
        }
        if (this.mEGLWindowSurfaceFactory == null) {
            this.mEGLWindowSurfaceFactory = new DefaultWindowSurfaceFactory();
        }
        this.mRenderer = renderer;
        this.mGLThread = new GLThread(this.mThisWeakRef, this.mPreservedWidth, this.mPreservedHeight);
        this.mGLThread.start();
    }
}
