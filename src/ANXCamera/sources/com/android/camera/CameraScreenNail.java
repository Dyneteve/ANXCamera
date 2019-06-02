package com.android.camera;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.opengl.GLES20;
import android.opengl.Matrix;
import android.support.v4.view.ViewCompat;
import com.android.camera.SurfaceTextureScreenNail.SurfaceTextureScreenNailCallback;
import com.android.camera.effect.FrameBuffer;
import com.android.camera.effect.draw_mode.DrawBasicTexAttribute;
import com.android.camera.effect.draw_mode.DrawBlurTexAttribute;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.effect.draw_mode.FillRectAttribute;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera.statistic.ScenarioTrackUtil;
import com.android.gallery3d.ui.BitmapTexture;
import com.android.gallery3d.ui.GLCanvas;
import com.android.gallery3d.ui.RawTexture;
import com.mi.config.b;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;

public class CameraScreenNail extends SurfaceTextureScreenNail {
    private static final int ANIM_CAPTURE_RUNNING = 12;
    private static final int ANIM_CAPTURE_START = 11;
    private static final int ANIM_MODULE_COPY_TEXTURE = 31;
    private static final int ANIM_MODULE_COPY_TEXTURE_WITH_ALPHA = 37;
    private static final int ANIM_MODULE_DRAW_PREVIEW = 32;
    private static final int ANIM_MODULE_RESUME = 35;
    private static final int ANIM_MODULE_RUNNING = 33;
    private static final int ANIM_MODULE_WAITING_FIRST_FRAME = 34;
    private static final int ANIM_NONE = 0;
    private static final int ANIM_READ_LAST_FRAME_GAUSSIAN = 36;
    private static final int ANIM_SWITCH_COPY_TEXTURE = 21;
    private static final int ANIM_SWITCH_DRAW_PREVIEW = 22;
    private static final int ANIM_SWITCH_RESUME = 25;
    private static final int ANIM_SWITCH_RUNNING = 23;
    private static final int ANIM_SWITCH_WAITING_FIRST_FRAME = 24;
    public static final int FRAME_AVAILABLE_AFTER_CATCH = 4;
    public static final int FRAME_AVAILABLE_ON_CREATE = 1;
    private static final int STATE_HIBERNATE = 14;
    private static final int STATE_READ_PIXELS = 13;
    private static final String TAG = CameraScreenNail.class.getSimpleName();
    private int mAnimState = 0;
    private CaptureAnimManager mCaptureAnimManager = new CaptureAnimManager();
    private boolean mDisableSwitchAnimationOnce;
    private ExternalFrameProcessor mExternalFrameProcessor;
    private boolean mFirstFrameArrived;
    private AtomicBoolean mFrameAvailableNotified = new AtomicBoolean(false);
    private int mFrameNumber = 0;
    private volatile boolean mIsDrawBlackFrame;
    private Bitmap mLastFrameGaussianBitmap;
    private FrameBuffer mMimojiFrameBuffer;
    private RawTexture mMimojiTexture;
    private SwitchAnimManager mModuleAnimManager = new SwitchAnimManager();
    private NailListener mNailListener;
    private int mReadPixelsNum = 0;
    private List<RequestRenderListener> mRequestRenderListeners;
    private SwitchAnimManager mSwitchAnimManager = new SwitchAnimManager();
    private final float[] mTextureTransformMatrix = new float[16];
    private boolean mVisible;

    @Retention(RetentionPolicy.SOURCE)
    public @interface ArrivedType {
    }

    public interface ExternalFrameProcessor {
        void onDrawFrame(Rect rect, int i, int i2, boolean z);

        void releaseRender();
    }

    public interface NailListener extends SurfaceTextureScreenNailCallback {
        int getOrientation();

        boolean isKeptBitmapTexture();

        void onFrameAvailable(int i);

        void onPreviewPixelsRead(byte[] bArr, int i, int i2);

        void onPreviewTextureCopied();
    }

    public interface RequestRenderListener {
        void requestRender();
    }

    public CameraScreenNail(NailListener nailListener, RequestRenderListener requestRenderListener) {
        super(nailListener);
        this.mNailListener = nailListener;
        this.mRequestRenderListeners = new ArrayList();
        addRequestListener(requestRenderListener);
    }

    private void copyExternalPreviewTexture(GLCanvas gLCanvas, RawTexture rawTexture, FrameBuffer frameBuffer) {
        int width = rawTexture.getWidth();
        int height = rawTexture.getHeight();
        gLCanvas.beginBindFrameBuffer(frameBuffer);
        gLCanvas.getState().pushState();
        gLCanvas.getState().translate(((float) width) / 2.0f, ((float) height) / 2.0f);
        gLCanvas.getState().scale(1.0f, -1.0f, 1.0f);
        gLCanvas.getState().translate(((float) (-width)) / 2.0f, ((float) (-height)) / 2.0f);
        DrawBasicTexAttribute drawBasicTexAttribute = new DrawBasicTexAttribute(rawTexture, 0, 0, width, height);
        gLCanvas.draw(drawBasicTexAttribute);
        gLCanvas.getState().popState();
        gLCanvas.endBindFrameBuffer();
    }

    private void copyPreviewTexture(GLCanvas gLCanvas, RawTexture rawTexture, FrameBuffer frameBuffer) {
        int width = rawTexture.getWidth();
        int height = rawTexture.getHeight();
        getSurfaceTexture().getTransformMatrix(this.mTextureTransformMatrix);
        updateTransformMatrix(this.mTextureTransformMatrix);
        if (frameBuffer == null) {
            frameBuffer = new FrameBuffer(gLCanvas, rawTexture, 0);
        }
        if (rawTexture == this.mCaptureAnimTexture && this.mExternalFrameProcessor != null) {
            if (this.mMimojiTexture == null) {
                this.mMimojiTexture = new RawTexture(width, height, true);
            }
            if (this.mMimojiFrameBuffer == null) {
                this.mMimojiFrameBuffer = new FrameBuffer(gLCanvas, this.mMimojiTexture, 0);
            }
            gLCanvas.beginBindFrameBuffer(this.mMimojiFrameBuffer);
            this.mExternalFrameProcessor.onDrawFrame(getDisplayRect(), width, height, true);
            gLCanvas.endBindFrameBuffer();
            copyExternalPreviewTexture(gLCanvas, this.mMimojiTexture, frameBuffer);
        } else if (ModuleManager.getActiveModuleIndex() != 177) {
            gLCanvas.beginBindFrameBuffer(frameBuffer);
            DrawExtTexAttribute drawExtTexAttribute = new DrawExtTexAttribute(this.mExtTexture, this.mTextureTransformMatrix, 0, 0, width, height);
            gLCanvas.draw(drawExtTexAttribute);
            gLCanvas.endBindFrameBuffer();
        } else if (this.mExternalFrameProcessor != null) {
            if (this.mMimojiTexture == null) {
                this.mMimojiTexture = new RawTexture(width, height, true);
            }
            if (this.mMimojiFrameBuffer == null) {
                this.mMimojiFrameBuffer = new FrameBuffer(gLCanvas, this.mMimojiTexture, 0);
            }
            gLCanvas.beginBindFrameBuffer(this.mMimojiFrameBuffer);
            this.mExternalFrameProcessor.onDrawFrame(getDisplayRect(), width, height, true);
            gLCanvas.endBindFrameBuffer();
            copyExternalPreviewTexture(gLCanvas, this.mMimojiTexture, frameBuffer);
        } else {
            gLCanvas.beginBindFrameBuffer(frameBuffer);
            int i = width;
            int i2 = height;
            DrawExtTexAttribute drawExtTexAttribute2 = new DrawExtTexAttribute(this.mExtTexture, this.mTextureTransformMatrix, 0, 0, i, i2);
            gLCanvas.draw(drawExtTexAttribute2);
            gLCanvas.endBindFrameBuffer();
            gLCanvas.beginBindFrameBuffer(frameBuffer);
            DrawExtTexAttribute drawExtTexAttribute3 = new DrawExtTexAttribute(this.mExtTexture, this.mTextureTransformMatrix, 0, 0, i, i2);
            gLCanvas.draw(drawExtTexAttribute3);
            gLCanvas.endBindFrameBuffer();
        }
    }

    private void notifyFrameAvailable(int i) {
        if (!this.mFrameAvailableNotified.get()) {
            this.mFrameAvailableNotified.set(true);
            this.mNailListener.onFrameAvailable(i);
        }
    }

    private void postRequestListener() {
        for (RequestRenderListener requestRender : this.mRequestRenderListeners) {
            requestRender.requestRender();
        }
    }

    private byte[] readPreviewPixels(GLCanvas gLCanvas, int i, int i2) {
        ByteBuffer allocate = ByteBuffer.allocate(i * i2 * 4);
        getSurfaceTexture().getTransformMatrix(this.mTextureTransformMatrix);
        updateTransformMatrix(this.mTextureTransformMatrix);
        if (this.mCaptureAnimFrameBuffer == null) {
            this.mCaptureAnimFrameBuffer = new FrameBuffer(gLCanvas, this.mCaptureAnimTexture, 0);
        }
        gLCanvas.beginBindFrameBuffer(this.mCaptureAnimFrameBuffer);
        DrawExtTexAttribute drawExtTexAttribute = new DrawExtTexAttribute(this.mExtTexture, this.mTextureTransformMatrix, 0, 0, i, i2);
        gLCanvas.draw(drawExtTexAttribute);
        GLES20.glReadPixels(0, 0, i, i2, 6408, 5121, allocate);
        gLCanvas.endBindFrameBuffer();
        return allocate.array();
    }

    private void renderBlurTexture(GLCanvas gLCanvas, RawTexture rawTexture) {
        int width = rawTexture.getWidth();
        int height = rawTexture.getHeight();
        if (this.mFrameBuffer == null) {
            this.mFrameBuffer = new FrameBuffer(gLCanvas, rawTexture, 0);
        }
        gLCanvas.prepareBlurRenders();
        gLCanvas.beginBindFrameBuffer(this.mFrameBuffer);
        DrawBlurTexAttribute drawBlurTexAttribute = new DrawBlurTexAttribute(rawTexture, 0, 0, width, height);
        gLCanvas.draw(drawBlurTexAttribute);
        gLCanvas.endBindFrameBuffer();
    }

    public void acquireSurfaceTexture() {
        Log.v(TAG, "acquireSurfaceTexture");
        synchronized (this.mLock) {
            this.mFirstFrameArrived = false;
            this.mFrameNumber = 0;
            this.mReadPixelsNum = 0;
            this.mDisableSwitchAnimationOnce = false;
            super.acquireSurfaceTexture();
        }
    }

    public void addRequestListener(RequestRenderListener requestRenderListener) {
        synchronized (this.mLock) {
            this.mRequestRenderListeners.add(requestRenderListener);
        }
    }

    public void animateCapture(int i) {
        synchronized (this.mLock) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("animateCapture: state=");
            sb.append(this.mAnimState);
            Log.v(str, sb.toString());
            if (this.mAnimState == 0) {
                this.mCaptureAnimManager.animateHoldAndSlide();
                postRequestListener();
                this.mAnimState = 11;
            }
        }
    }

    public void animateHold(int i) {
        synchronized (this.mLock) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("animateHold: state=");
            sb.append(this.mAnimState);
            Log.v(str, sb.toString());
            if (this.mAnimState == 0) {
                this.mCaptureAnimManager.animateHold();
                postRequestListener();
                this.mAnimState = 11;
            }
        }
    }

    public void animateModuleCopyTexture(boolean z) {
        synchronized (this.mLock) {
            if (this.mAnimTexture == null || this.mFrameAvailableNotified.get()) {
                if (z) {
                    this.mAnimState = 37;
                    Log.v(TAG, "state=MODULE_COPY_TEXTURE_WITH_ALPHA");
                } else {
                    this.mAnimState = 31;
                    Log.v(TAG, "state=MODULE_COPY_TEXTURE");
                }
                postRequestListener();
            }
        }
    }

    public void animateSlide() {
        synchronized (this.mLock) {
            if (this.mAnimState != 12) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Cannot animateSlide outside of animateCapture! Animation state = ");
                sb.append(this.mAnimState);
                Log.w(str, sb.toString());
            }
            this.mCaptureAnimManager.animateSlide();
            postRequestListener();
        }
    }

    public void animateSwitchCameraBefore() {
        synchronized (this.mLock) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("switchBefore: state=");
            sb.append(this.mAnimState);
            Log.v(str, sb.toString());
            if (this.mAnimState == 22) {
                this.mAnimState = 23;
                this.mSwitchAnimManager.startAnimation(false);
                postRequestListener();
            }
        }
    }

    public void animateSwitchCopyTexture() {
        synchronized (this.mLock) {
            postRequestListener();
            this.mAnimState = 21;
            Log.v(TAG, "state=SWITCH_COPY_TEXTURE");
        }
    }

    public void clearAnimation() {
        if (this.mAnimState != 0) {
            this.mAnimState = 0;
            this.mSwitchAnimManager.clearAnimation();
            this.mCaptureAnimManager.clearAnimation();
            this.mModuleAnimManager.clearAnimation();
        }
    }

    public void directDraw(GLCanvas gLCanvas, int i, int i2, int i3, int i4) {
        super.draw(gLCanvas, i, i2, i3, i4);
    }

    public void disableSwitchAnimationOnce() {
        this.mDisableSwitchAnimationOnce = true;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:32:0x007c, code lost:
        r15 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:40:0x00d8, code lost:
        r8.updateTexImage();
        r15 = 0;
        r0.mSwitchAnimManager.drawPreview(r9, r10, r11, r12, r13, r0.mAnimTexture);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x0167, code lost:
        if (r0.mAnimState == 23) goto L_0x01cc;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:55:0x016d, code lost:
        if (r0.mAnimState == 24) goto L_0x01cc;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:57:0x0171, code lost:
        if (r0.mAnimState != 25) goto L_0x0174;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:60:0x0178, code lost:
        if (r0.mAnimState != 12) goto L_0x0196;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:62:0x0182, code lost:
        if (r0.mCaptureAnimManager.drawAnimation(r9, r0.mCaptureAnimTexture) == false) goto L_0x0188;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:63:0x0184, code lost:
        postRequestListener();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:64:0x0188, code lost:
        r0.mAnimState = r15;
        r0.mCaptureAnimManager.drawPreview(r9, r0.mCaptureAnimTexture);
        postRequestListener();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:67:0x019c, code lost:
        if (r0.mAnimState == 33) goto L_0x01a8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:69:0x01a2, code lost:
        if (r0.mAnimState == 34) goto L_0x01a8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:71:0x01a6, code lost:
        if (r0.mAnimState != 35) goto L_0x0207;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:72:0x01a8, code lost:
        r8.updateTexImage();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:73:0x01ba, code lost:
        if (r0.mModuleAnimManager.drawAnimation(r9, r10, r11, r12, r13, r0, r0.mAnimTexture) != false) goto L_0x01c8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:75:0x01be, code lost:
        if (r0.mAnimState == 35) goto L_0x01c1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:77:0x01c1, code lost:
        r0.mAnimState = 0;
        super.draw(r19, r20, r21, r22, r23);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:78:0x01c8, code lost:
        postRequestListener();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:79:0x01cc, code lost:
        r8.updateTexImage();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:80:0x01d2, code lost:
        if (r0.mDisableSwitchAnimationOnce == false) goto L_0x01e4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:81:0x01d4, code lost:
        r15 = 25;
        r0.mSwitchAnimManager.drawPreview(r9, r10, r11, r12, r13, r0.mAnimTexture);
        r6 = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:82:0x01e4, code lost:
        r15 = 25;
        r6 = r0.mSwitchAnimManager.drawAnimation(r9, r10, r11, r12, r13, r0, r0.mAnimTexture);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:83:0x01f3, code lost:
        if (r6 != false) goto L_0x0203;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:85:0x01f7, code lost:
        if (r0.mAnimState == r15) goto L_0x01fa;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:87:0x01fa, code lost:
        r0.mAnimState = 0;
        r0.mDisableSwitchAnimationOnce = false;
        super.draw(r19, r20, r21, r22, r23);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:88:0x0203, code lost:
        postRequestListener();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:91:0x0208, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:96:0x022f, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void draw(GLCanvas gLCanvas, int i, int i2, int i3, int i4) {
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        GLCanvas gLCanvas2 = gLCanvas;
        int i10 = i;
        int i11 = i2;
        int i12 = i3;
        int i13 = i4;
        synchronized (this.mLock) {
            boolean z = true;
            if (!this.mVisible) {
                this.mVisible = true;
            }
            if (this.mBitmapTexture != null) {
                if (ModuleManager.isSquareModule()) {
                    if (i12 > i13) {
                        i9 = ((i12 - i13) / 2) + i10;
                        i8 = i11;
                        i7 = i13;
                    } else {
                        i8 = ((i13 - i12) / 2) + i11;
                        i9 = i10;
                        i7 = i12;
                    }
                    i6 = i7;
                } else {
                    i9 = i10;
                    i8 = i11;
                    i7 = i12;
                    i6 = i13;
                }
                this.mBitmapTexture.draw(gLCanvas2, i9, i8, i7, i6);
            } else if (this.mIsDrawBlackFrame) {
                Log.d(TAG, "draw: skip frame...");
                FillRectAttribute fillRectAttribute = new FillRectAttribute((float) i10, (float) i11, (float) i12, (float) i13, ViewCompat.MEASURED_STATE_MASK);
                gLCanvas2.draw(fillRectAttribute);
                postRequestListener();
            } else {
                SurfaceTexture surfaceTexture = getSurfaceTexture();
                if (surfaceTexture != null) {
                    if (this.mFirstFrameArrived || this.mAnimState != 0) {
                        switch (this.mAnimState) {
                            case 0:
                                i5 = 0;
                                super.draw(gLCanvas, i, i2, i3, i4);
                                break;
                            case 11:
                                i5 = 0;
                                super.draw(gLCanvas, i, i2, i3, i4);
                                copyPreviewTexture(gLCanvas2, this.mCaptureAnimTexture, this.mCaptureAnimFrameBuffer);
                                this.mCaptureAnimManager.startAnimation(i10, i11, i12, i13);
                                this.mAnimState = 12;
                                Log.v(TAG, "draw: state=CAPTURE_RUNNING");
                                break;
                            case 13:
                                i5 = 0;
                                super.draw(gLCanvas, i, i2, i3, i4);
                                int width = this.mCaptureAnimTexture.getWidth();
                                int height = this.mCaptureAnimTexture.getHeight();
                                int i14 = i12 * height;
                                int i15 = i13 * width;
                                if (i14 > i15) {
                                    height = i15 / i12;
                                } else {
                                    width = i14 / i13;
                                }
                                byte[] readPreviewPixels = readPreviewPixels(gLCanvas2, width, height);
                                this.mReadPixelsNum--;
                                String str = TAG;
                                StringBuilder sb = new StringBuilder();
                                sb.append("draw: state=STATE_READ_PIXELS mReadPixelsNum=");
                                sb.append(this.mReadPixelsNum);
                                Log.d(str, sb.toString());
                                if (this.mReadPixelsNum < 1) {
                                    this.mAnimState = 0;
                                }
                                this.mNailListener.onPreviewPixelsRead(readPreviewPixels, width, height);
                                break;
                            case 14:
                                i5 = 0;
                                surfaceTexture.updateTexImage();
                                gLCanvas.clearBuffer();
                                break;
                            case 21:
                                copyPreviewTexture(gLCanvas2, this.mAnimTexture, this.mFrameBuffer);
                                this.mSwitchAnimManager.setReviewDrawingSize(i10, i11, i12, i13);
                                this.mNailListener.onPreviewTextureCopied();
                                this.mAnimState = 22;
                                Log.v(TAG, "draw: state=SWITCH_DRAW_PREVIEW");
                                break;
                            case 22:
                                break;
                            case 31:
                            case 37:
                                copyPreviewTexture(gLCanvas2, this.mAnimTexture, this.mFrameBuffer);
                                this.mModuleAnimManager.setReviewDrawingSize(i10, i11, i12, i13);
                                Log.v(TAG, "draw: state=MODULE_DRAW_PREVIEW");
                                if (this.mAnimState != 37) {
                                    z = false;
                                }
                                this.mAnimState = 33;
                                this.mModuleAnimManager.startAnimation(z);
                                postRequestListener();
                                break;
                            case 36:
                                super.draw(gLCanvas, i, i2, i3, i4);
                                Log.v(TAG, "draw: state=ANIM_READ_LAST_FRAME_GAUSSIAN");
                                copyPreviewTexture(gLCanvas2, this.mAnimTexture, this.mFrameBuffer);
                                drawGaussianBitmap(gLCanvas, i, i2, i3, i4);
                                this.mAnimState = 0;
                                break;
                        }
                    }
                }
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("draw: firstFrame=");
                sb2.append(this.mFirstFrameArrived);
                sb2.append(" surface=");
                sb2.append(surfaceTexture);
                Log.w(str2, sb2.toString());
                if (surfaceTexture != null) {
                    surfaceTexture.updateTexImage();
                }
            }
        }
    }

    public void drawBlackFrame(boolean z) {
        this.mIsDrawBlackFrame = z;
    }

    public void drawBlurTexture(GLCanvas gLCanvas, int i, int i2, int i3, int i4) {
        DrawBasicTexAttribute drawBasicTexAttribute = new DrawBasicTexAttribute(this.mAnimTexture, i, i2, i3, i4);
        gLCanvas.draw(drawBasicTexAttribute);
    }

    public void drawGaussianBitmap(GLCanvas gLCanvas, int i, int i2, int i3, int i4) {
        long currentTimeMillis = System.currentTimeMillis();
        int width = this.mAnimTexture.getWidth();
        int height = this.mAnimTexture.getHeight();
        for (int i5 = 0; i5 < 8; i5++) {
            renderBlurTexture(gLCanvas);
        }
        GLES20.glFlush();
        ByteBuffer allocate = ByteBuffer.allocate(width * height * 4);
        if (this.mFrameBuffer == null) {
            this.mFrameBuffer = new FrameBuffer(gLCanvas, this.mAnimTexture, 0);
        }
        gLCanvas.beginBindFrameBuffer(this.mFrameBuffer);
        DrawBasicTexAttribute drawBasicTexAttribute = new DrawBasicTexAttribute(this.mAnimTexture, 0, 0, width, height);
        gLCanvas.draw(drawBasicTexAttribute);
        GLES20.glReadPixels(0, 0, width, height, 6408, 5121, allocate);
        gLCanvas.endBindFrameBuffer();
        byte[] array = allocate.array();
        Bitmap createBitmap = Bitmap.createBitmap(width, height, Config.ARGB_8888);
        createBitmap.copyPixelsFromBuffer(ByteBuffer.wrap(array));
        this.mLastFrameGaussianBitmap = createBitmap;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("readLastFrameGaussian end... bitmap = ");
        sb.append(this.mLastFrameGaussianBitmap);
        sb.append(", cost time = ");
        sb.append(System.currentTimeMillis() - currentTimeMillis);
        sb.append("ms");
        Log.d(str, sb.toString());
    }

    public Rect getDisplayRect() {
        return this.mDisplayRect;
    }

    public ExternalFrameProcessor getExternalFrameProcessor() {
        return this.mExternalFrameProcessor;
    }

    public boolean getFrameAvailableFlag() {
        return this.mFrameAvailableNotified.get();
    }

    public Bitmap getLastFrameGaussianBitmap() {
        return this.mLastFrameGaussianBitmap;
    }

    public Rect getRenderRect() {
        return this.mRenderLayoutRect;
    }

    public boolean isAnimationRunning() {
        return this.mAnimState != 0;
    }

    public void noDraw() {
        synchronized (this.mLock) {
            this.mVisible = false;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:25:0x0075, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onFrameAvailable(SurfaceTexture surfaceTexture) {
        if (getSurfaceTexture() != surfaceTexture) {
            Log.e(TAG, "onFrameAvailable: surface changed");
            return;
        }
        synchronized (this.mLock) {
            if (!this.mFirstFrameArrived) {
                if (this.mFrameNumber < CameraSettings.getSkipFrameNumber()) {
                    this.mFrameNumber++;
                    postRequestListener();
                    return;
                }
                Log.d(TAG, "onFrameAvailable first frame arrived.");
                ScenarioTrackUtil.trackSwitchCameraEnd();
                ScenarioTrackUtil.trackSwitchModeEnd();
                notifyFrameAvailable(1);
                this.mVisible = true;
                this.mFirstFrameArrived = true;
            }
            if (this.mVisible) {
                if (this.mAnimState == 24) {
                    this.mAnimState = 25;
                    Log.v(TAG, "SWITCH_WAITING_FIRST_FRAME->SWITCH_RESUME");
                    this.mSwitchAnimManager.startResume();
                } else if (this.mAnimState == 34) {
                    this.mAnimState = 35;
                    Log.v(TAG, "MODULE_WAITING_FIRST_FRAME->MODULE_RESUME");
                    this.mModuleAnimManager.startResume();
                }
                postRequestListener();
                notifyFrameAvailable(4);
            }
        }
    }

    public void readLastFrameGaussian() {
        Log.d(TAG, "readLastFrameGaussian: state=ANIM_READ_LAST_FRAME_GAUSSIAN start");
        synchronized (this.mLock) {
            if (this.mFirstFrameArrived) {
                if (getSurfaceTexture() != null) {
                    if (this.mAnimTexture == null || this.mFrameAvailableNotified.get()) {
                        this.mAnimState = 36;
                        postRequestListener();
                        Log.d(TAG, "readLastFrameGaussian: state=ANIM_READ_LAST_FRAME_GAUSSIAN end");
                        return;
                    }
                    Log.w(TAG, "readLastFrameGaussian: not start preview return!!!");
                    return;
                }
            }
            Log.w(TAG, "readLastFrameGaussian: not start preview return!!!");
        }
    }

    public void recycle() {
        synchronized (this.mLock) {
            this.mVisible = false;
        }
    }

    public void releaseBitmapIfNeeded() {
        if (this.mBitmapTexture != null && !this.mNailListener.isKeptBitmapTexture()) {
            this.mBitmapTexture = null;
            postRequestListener();
        }
    }

    public void releaseSurfaceTexture() {
        synchronized (this.mLock) {
            super.releaseSurfaceTexture();
            this.mAnimState = 0;
            Log.v(TAG, "release: state=NONE");
            this.mFirstFrameArrived = false;
            this.mFrameNumber = 0;
            this.mReadPixelsNum = 0;
            this.mModuleSwitching = false;
            this.mMimojiTexture.recycle();
            this.mMimojiFrameBuffer.delete();
            this.mMimojiTexture = null;
            this.mMimojiFrameBuffer = null;
        }
    }

    public void removeRequestListener(RequestRenderListener requestRenderListener) {
        synchronized (this.mLock) {
            this.mRequestRenderListeners.remove(requestRenderListener);
        }
    }

    public void renderBitmapToCanvas(Bitmap bitmap) {
        this.mVisible = false;
        this.mBitmapTexture = new BitmapTexture(bitmap);
        postRequestListener();
    }

    public void renderBlurTexture(GLCanvas gLCanvas) {
        renderBlurTexture(gLCanvas, this.mAnimTexture);
    }

    public void requestAwaken() {
        synchronized (this.mLock) {
            if (this.mAnimState == 14) {
                this.mAnimState = 0;
                this.mFirstFrameArrived = false;
                this.mFrameNumber = 0;
                this.mReadPixelsNum = 0;
            }
        }
    }

    public void requestHibernate() {
        synchronized (this.mLock) {
            if (this.mAnimState == 0) {
                this.mAnimState = 14;
                postRequestListener();
            }
        }
    }

    public void requestReadPixels() {
        synchronized (this.mLock) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("requestReadPixels state=");
            sb.append(this.mAnimState);
            Log.d(str, sb.toString());
            if (this.mAnimState == 0 || this.mAnimState == 13 || 12 == this.mAnimState || 11 == this.mAnimState) {
                this.mAnimState = 13;
                this.mReadPixelsNum++;
                postRequestListener();
            }
        }
    }

    public void resetFrameAvailableFlag() {
        this.mFrameAvailableNotified.set(false);
        synchronized (this.mLock) {
            this.mFirstFrameArrived = false;
            this.mFrameNumber = 0;
            this.mReadPixelsNum = 0;
        }
    }

    public void setExternalFrameProcessor(ExternalFrameProcessor externalFrameProcessor) {
        this.mExternalFrameProcessor = externalFrameProcessor;
    }

    public void setPreviewFrameLayoutSize(int i, int i2) {
        synchronized (this.mLock) {
            Log.d(TAG, String.format(Locale.ENGLISH, "setPreviewFrameLayoutSize: %dx%d", new Object[]{Integer.valueOf(i), Integer.valueOf(i2)}));
            this.mSurfaceWidth = !b.hI() ? i : 720;
            if (b.hI()) {
                i2 = (Util.LIMIT_SURFACE_WIDTH * i2) / i;
            }
            this.mSurfaceHeight = i2;
            this.mSwitchAnimManager.setPreviewFrameLayoutSize(this.mSurfaceWidth, this.mSurfaceHeight);
            updateRenderRect();
        }
    }

    public void switchCameraDone() {
        synchronized (this.mLock) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("switchDone: state=");
            sb.append(this.mAnimState);
            Log.v(str, sb.toString());
            if (this.mAnimState == 23) {
                this.mAnimState = 24;
            }
        }
    }

    /* access modifiers changed from: protected */
    public void updateExtraTransformMatrix(float[] fArr) {
        float f;
        float f2;
        if (this.mAnimState == 23 || this.mAnimState == 24 || this.mAnimState == 25) {
            f2 = this.mSwitchAnimManager.getExtScaleX();
            f = this.mSwitchAnimManager.getExtScaleY();
        } else {
            f2 = 1.0f;
            f = 1.0f;
        }
        if (f2 != 1.0f || f != 1.0f) {
            Matrix.translateM(fArr, 0, 0.5f, 0.5f, 0.0f);
            Matrix.scaleM(fArr, 0, f2, f, 1.0f);
            Matrix.translateM(fArr, 0, -0.5f, -0.5f, 0.0f);
        }
    }
}
