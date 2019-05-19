package com.android.camera.effect.renders;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.media.Image.Plane;
import android.opengl.GLES20;
import android.os.ConditionVariable;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
import android.util.Size;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.runing.ComponentRunningTiltValue;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.FrameBuffer;
import com.android.camera.effect.MiYuvImage;
import com.android.camera.effect.ShaderNativeUtil;
import com.android.camera.effect.SnapshotCanvas;
import com.android.camera.effect.draw_mode.DrawBasicTexAttribute;
import com.android.camera.effect.draw_mode.DrawYuvAttribute;
import com.android.camera.effect.framework.utils.CounterUtil;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera.watermark.WaterMarkBitmap;
import com.android.camera.watermark.WaterMarkData;
import com.ss.android.ttve.common.TEDefine;
import com.xiaomi.camera.base.ImageUtil;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.nio.ByteBuffer;
import java.nio.IntBuffer;
import java.util.List;
import java.util.Locale;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.egl.EGLSurface;

public class SnapshotRender {
    private static final int[] CONFIG_SPEC = {12352, 4, 12324, 8, 12323, 8, 12322, 8, 12344};
    private static final boolean DUMP_TEXTURE = false;
    private static final int EGL_CONTEXT_CLIENT_VERSION = 12440;
    private static final int EGL_OPENGL_ES2_BIT = 4;
    private static final int QUEUE_LIMIT = 7;
    /* access modifiers changed from: private */
    public static final String TAG = SnapshotRender.class.getSimpleName();
    /* access modifiers changed from: private */
    public Bitmap m48MCameraWaterMarkBitmap;
    /* access modifiers changed from: private */
    public String mCurrentCustomWaterMarkText;
    /* access modifiers changed from: private */
    public Bitmap mDualCameraWaterMarkBitmap;
    /* access modifiers changed from: private */
    public DualWatermarkParam mDualCameraWaterMarkParam;
    /* access modifiers changed from: private */
    public EGL10 mEgl;
    /* access modifiers changed from: private */
    public EGLConfig mEglConfig;
    /* access modifiers changed from: private */
    public EGLContext mEglContext;
    /* access modifiers changed from: private */
    public EGLDisplay mEglDisplay;
    private EGLHandler mEglHandler;
    /* access modifiers changed from: private */
    public EGLSurface mEglSurface;
    private HandlerThread mEglThread;
    /* access modifiers changed from: private */
    public ConditionVariable mEglThreadBlockVar = new ConditionVariable();
    /* access modifiers changed from: private */
    public volatile int mImageQueueSize = 0;
    /* access modifiers changed from: private */
    public final Object mLock = new Object();
    private boolean mRelease;
    /* access modifiers changed from: private */
    public boolean mReleasePending;

    private class EGLHandler extends Handler implements WatermarkRender {
        public static final int MSG_DRAW_MAIN_ASYNC = 1;
        public static final int MSG_DRAW_MAIN_SYNC = 2;
        public static final int MSG_INIT_EGL_SYNC = 0;
        public static final int MSG_PREPARE_EFFECT_RENDER = 6;
        public static final int MSG_RELEASE = 5;
        private FrameBuffer mFrameBuffer;
        private SnapshotCanvas mGLCanvas;
        private FrameBuffer mWatermarkFrameBuffer;

        public EGLHandler(Looper looper) {
            super(looper);
        }

        private byte[] applyEffect(DrawYuvAttribute drawYuvAttribute) {
            PipeRender pipeRender;
            int[] iArr;
            int i;
            int i2;
            int i3;
            byte[] bArr;
            boolean z;
            DrawYuvAttribute drawYuvAttribute2;
            int i4;
            int i5;
            int i6;
            int i7;
            byte[] bArr2;
            byte[] bArr3;
            int i8;
            Bitmap bitmap;
            int i9;
            int i10;
            Bitmap bitmap2;
            int i11;
            int i12;
            int i13;
            int i14;
            int i15;
            int i16;
            Size size;
            DrawYuvAttribute drawYuvAttribute3 = drawYuvAttribute;
            PipeRender effectRender = getEffectRender(drawYuvAttribute);
            if (effectRender == null) {
                Log.w(SnapshotRender.TAG, "init render failed");
                return null;
            }
            int width = drawYuvAttribute3.mPictureSize.getWidth();
            int height = drawYuvAttribute3.mPictureSize.getHeight();
            long currentTimeMillis = System.currentTimeMillis();
            Plane plane = drawYuvAttribute3.mImage.getPlanes()[0];
            Plane plane2 = drawYuvAttribute3.mImage.getPlanes()[1];
            int rowStride = plane.getRowStride();
            int rowStride2 = plane2.getRowStride();
            String access$600 = SnapshotRender.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("plane0 stride =  ");
            sb.append(plane.getRowStride());
            sb.append(", plane1 stride = ");
            sb.append(plane2.getRowStride());
            Log.d(access$600, sb.toString());
            if (drawYuvAttribute3.mEffectIndex != FilterInfo.FILTER_ID_NONE || CameraSettings.isAgeGenderAndMagicMirrorWaterOpen() || ModuleManager.isSquareModule() || CameraSettings.isGradienterOn() || CameraSettings.isTiltShiftOn() || (!drawYuvAttribute3.mApplyWaterMark && drawYuvAttribute3.mTimeWatermark == null)) {
                pipeRender = effectRender;
                i2 = width;
                i = height;
                i3 = rowStride;
                drawYuvAttribute2 = drawYuvAttribute3;
                z = false;
                bArr = null;
                iArr = null;
            } else {
                int[] watermarkRange = Util.getWatermarkRange(drawYuvAttribute3.mPictureSize.getWidth(), drawYuvAttribute3.mPictureSize.getHeight(), (drawYuvAttribute3.mJpegRotation + 270) % 360, drawYuvAttribute3.mApplyWaterMark, drawYuvAttribute3.mTimeWatermark != null, 0.11f);
                byte[] yuvData = ImageUtil.getYuvData(drawYuvAttribute3.mImage);
                if (rowStride != drawYuvAttribute3.mPictureSize.getWidth()) {
                    watermarkRange[2] = watermarkRange[2] - 4;
                }
                i3 = rowStride;
                MiYuvImage subYuvImage = Util.getSubYuvImage(yuvData, width, height, rowStride, rowStride2, watermarkRange);
                String access$6002 = SnapshotRender.TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("get sub range data spend total tome =");
                sb2.append(System.currentTimeMillis() - currentTimeMillis);
                Log.d(access$6002, sb2.toString());
                i2 = width;
                i = height;
                iArr = watermarkRange;
                pipeRender = effectRender;
                MiYuvImage miYuvImage = subYuvImage;
                DrawYuvAttribute drawYuvAttribute4 = new DrawYuvAttribute(drawYuvAttribute3.mImage, drawYuvAttribute3.mPreviewSize, new Size(watermarkRange[2], watermarkRange[3]), drawYuvAttribute3.mEffectIndex, drawYuvAttribute3.mOrientation, drawYuvAttribute3.mJpegRotation, drawYuvAttribute3.mShootRotation, drawYuvAttribute3.mDate, drawYuvAttribute3.mMirror, drawYuvAttribute3.mApplyWaterMark, drawYuvAttribute3.mIsGradienterOn, drawYuvAttribute3.mTiltShiftMode, drawYuvAttribute3.mTimeWatermark, drawYuvAttribute3.mAttribute, drawYuvAttribute3.mWaterInfos);
                drawYuvAttribute4.mYuvImage = miYuvImage;
                drawYuvAttribute2 = drawYuvAttribute4;
                bArr = yuvData;
                z = true;
            }
            PipeRender pipeRender2 = pipeRender;
            updateRenderParameters(pipeRender2, drawYuvAttribute2);
            int i17 = z ? iArr[2] : i2;
            int i18 = z ? iArr[3] : i;
            checkFrameBuffer(i17, i18);
            this.mGLCanvas.beginBindFrameBuffer(this.mFrameBuffer);
            long currentTimeMillis2 = System.currentTimeMillis();
            GLES20.glFlush();
            pipeRender2.setParentFrameBufferId(this.mFrameBuffer.getId());
            pipeRender2.draw(drawYuvAttribute2);
            String access$6003 = SnapshotRender.TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("drawTime=");
            sb3.append(System.currentTimeMillis() - currentTimeMillis2);
            Log.d(access$6003, sb3.toString());
            pipeRender2.deleteBuffer();
            int i19 = i2;
            int i20 = i;
            drawYuvAttribute2.mOriginalSize = new Size(i19, i20);
            if (ModuleManager.isSquareModule()) {
                if (i19 > i20) {
                    i5 = i20;
                    i7 = (i19 - i20) / 2;
                    i6 = 0;
                } else {
                    i5 = i19;
                    i7 = 0;
                    i6 = (i20 - i19) / 2;
                }
                i4 = i5;
            } else {
                i5 = i19;
                i4 = i20;
                i7 = 0;
                i6 = 0;
            }
            if (drawYuvAttribute2.mApplyWaterMark) {
                if (z) {
                    i14 = -iArr[0];
                    i13 = -iArr[1];
                } else {
                    i14 = 0;
                    i13 = 0;
                }
                long currentTimeMillis3 = System.currentTimeMillis();
                if (!z) {
                    iArr = Util.getWatermarkRange(i5, i4, (drawYuvAttribute2.mJpegRotation + 270) % 360, drawYuvAttribute2.mApplyWaterMark, drawYuvAttribute2.mTimeWatermark != null, 0.11f);
                    i15 = iArr[0];
                    i16 = iArr[1];
                } else {
                    i16 = 0;
                    i15 = 0;
                }
                int i21 = drawYuvAttribute2.mJpegQuality;
                if (i21 <= 0 || i21 > 97) {
                    i21 = 97;
                }
                bArr2 = bArr;
                int i22 = i17;
                int i23 = i18;
                drawFaceWaterMarkInfos(drawYuvAttribute2.mOriginalSize, drawYuvAttribute2.mPreviewSize, drawYuvAttribute2.mJpegRotation, drawYuvAttribute2.mWaterInfos);
                int i24 = i15 + i7;
                int i25 = i16 + i6;
                byte[] picture = ShaderNativeUtil.getPicture(i24, i25, iArr[2], iArr[3], i21);
                bitmap = getGPURBGA(i24, i25, iArr[2], iArr[3]);
                String access$6004 = SnapshotRender.TAG;
                StringBuilder sb4 = new StringBuilder();
                sb4.append("for remove watermark spend more time = ");
                sb4.append(System.currentTimeMillis() - currentTimeMillis3);
                Log.d(access$6004, sb4.toString());
                i8 = 1;
                drawWaterMark(i14 + i7, i13 + i6, i5, i4, drawYuvAttribute2.mJpegRotation, drawYuvAttribute2.mTimeWatermark);
                String access$6005 = SnapshotRender.TAG;
                StringBuilder sb5 = new StringBuilder();
                sb5.append("watermarkTime=");
                sb5.append(System.currentTimeMillis() - currentTimeMillis3);
                Log.d(access$6005, sb5.toString());
                this.mGLCanvas.endBindFrameBuffer();
                if (z) {
                    i10 = i22;
                    i9 = i23;
                    size = new Size(i10, i9);
                } else {
                    i10 = i22;
                    i9 = i23;
                    size = drawYuvAttribute2.mOriginalSize;
                }
                checkWatermarkFrameBuffer(size);
                this.mGLCanvas.beginBindFrameBuffer(this.mWatermarkFrameBuffer);
                long currentTimeMillis4 = System.currentTimeMillis();
                RgbToYuvRender rgbToYuvRender = (RgbToYuvRender) fetchRender(FilterInfo.FILTER_ID_RGB2YUV);
                updateRenderParameters(rgbToYuvRender, drawYuvAttribute2);
                rgbToYuvRender.setParentFrameBufferId(this.mFrameBuffer.getId());
                rgbToYuvRender.drawTexture(this.mFrameBuffer.getTexture().getId(), 0.0f, 0.0f, (float) size.getWidth(), (float) size.getHeight(), true);
                String access$6006 = SnapshotRender.TAG;
                StringBuilder sb6 = new StringBuilder();
                sb6.append("rgb2YuvTime=");
                sb6.append(System.currentTimeMillis() - currentTimeMillis4);
                Log.d(access$6006, sb6.toString());
                bArr3 = picture;
            } else {
                bArr2 = bArr;
                i10 = i17;
                i9 = i18;
                i8 = 1;
                bitmap = null;
                bArr3 = null;
            }
            GLES20.glPixelStorei(3333, i8);
            long currentTimeMillis5 = System.currentTimeMillis();
            if (!z) {
                i10 = drawYuvAttribute2.mOriginalSize.getWidth();
            }
            int height2 = z ? i9 : drawYuvAttribute2.mOriginalSize.getHeight();
            int ceil = (int) Math.ceil(((double) i10) / 2.0d);
            int ceil2 = (int) Math.ceil((((double) height2) * 3.0d) / 4.0d);
            ByteBuffer allocate = ByteBuffer.allocate(ceil * ceil2 * 4);
            GLES20.glReadPixels(0, 0, ceil, ceil2, 6408, 5121, allocate);
            allocate.rewind();
            Bitmap bitmap3 = bitmap;
            Log.d(SnapshotRender.TAG, String.format(Locale.ENGLISH, "readSize=%dx%d imageSize=%dx%d", new Object[]{Integer.valueOf(ceil), Integer.valueOf(ceil2), Integer.valueOf(i10), Integer.valueOf(height2)}));
            String access$6007 = SnapshotRender.TAG;
            StringBuilder sb7 = new StringBuilder();
            sb7.append("readTime=");
            sb7.append(System.currentTimeMillis() - currentTimeMillis5);
            Log.d(access$6007, sb7.toString());
            byte[] array = allocate.array();
            if (z) {
                long currentTimeMillis6 = System.currentTimeMillis();
                Util.coverSubYuvImage(bArr2, i5, i4, i3, rowStride2, allocate.array(), iArr);
                String access$6008 = SnapshotRender.TAG;
                StringBuilder sb8 = new StringBuilder();
                sb8.append("cover sub range data spend total time =");
                sb8.append(System.currentTimeMillis() - currentTimeMillis6);
                Log.d(access$6008, sb8.toString());
                array = bArr2;
            }
            long currentTimeMillis7 = System.currentTimeMillis();
            ImageUtil.updateYuvImage(drawYuvAttribute2.mImage, array, z);
            String access$6009 = SnapshotRender.TAG;
            StringBuilder sb9 = new StringBuilder();
            sb9.append("updateImageTime=");
            sb9.append(System.currentTimeMillis() - currentTimeMillis7);
            Log.d(access$6009, sb9.toString());
            this.mGLCanvas.endBindFrameBuffer();
            this.mGLCanvas.recycledResources();
            DrawYuvAttribute drawYuvAttribute5 = drawYuvAttribute;
            if (!drawYuvAttribute5.mApplyWaterMark || drawYuvAttribute5.mOutputSize == null || drawYuvAttribute5.mPictureSize.getWidth() == drawYuvAttribute5.mOutputSize.getWidth() || drawYuvAttribute5.mPictureSize.getHeight() == drawYuvAttribute5.mOutputSize.getHeight()) {
                bitmap2 = bitmap3;
            } else {
                CounterUtil counterUtil = new CounterUtil();
                counterUtil.reset("UPSCALE");
                new Options().inPreferredConfig = Config.ARGB_8888;
                float width2 = ((float) drawYuvAttribute5.mOutputSize.getWidth()) / ((float) drawYuvAttribute5.mPictureSize.getWidth());
                float height3 = ((float) drawYuvAttribute5.mOutputSize.getHeight()) / ((float) drawYuvAttribute5.mPictureSize.getHeight());
                if (height3 > width2) {
                    width2 = height3;
                }
                bitmap2 = bitmap3;
                Bitmap createScaledBitmap = Bitmap.createScaledBitmap(bitmap2, (int) (((float) bitmap2.getWidth()) * width2), (int) (((float) bitmap2.getHeight()) * width2), false);
                bArr3 = compress(createScaledBitmap);
                createScaledBitmap.recycle();
                counterUtil.tick("UPSCALE");
                int width3 = drawYuvAttribute5.mOutputSize.getWidth();
                int height4 = drawYuvAttribute5.mOutputSize.getHeight();
                if (ModuleManager.isSquareModule()) {
                    if (width3 > height4) {
                        int i26 = (width3 - height4) / 2;
                        i12 = height4;
                    } else {
                        int i27 = (height4 - width3) / 2;
                        i12 = width3;
                    }
                    i11 = i12;
                } else {
                    i12 = width3;
                    i11 = height4;
                }
                iArr = Util.getWatermarkRange(i12, i11, (drawYuvAttribute2.mJpegRotation + 270) % 360, drawYuvAttribute2.mApplyWaterMark, drawYuvAttribute2.mTimeWatermark != null, 0.11f);
            }
            byte[] bArr4 = bArr3;
            int[] iArr2 = iArr;
            if (bitmap2 != null) {
                bitmap2.recycle();
            }
            drawYuvAttribute5.mDataOfTheRegionUnderWatermarks = bArr4;
            drawYuvAttribute5.mCoordinatesOfTheRegionUnderWatermarks = iArr2;
            return array;
        }

        private void checkFrameBuffer(int i, int i2) {
            if (this.mFrameBuffer == null || this.mFrameBuffer.getWidth() != i || this.mFrameBuffer.getHeight() != i2) {
                this.mFrameBuffer = new FrameBuffer(this.mGLCanvas, i, i2, 0);
            }
        }

        private void checkWatermarkFrameBuffer(Size size) {
            if (this.mWatermarkFrameBuffer == null || this.mWatermarkFrameBuffer.getWidth() < size.getWidth() || this.mWatermarkFrameBuffer.getHeight() < size.getHeight()) {
                this.mWatermarkFrameBuffer = new FrameBuffer(this.mGLCanvas, size.getWidth(), size.getHeight(), 0);
            }
        }

        private byte[] compress(Bitmap bitmap) {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            bitmap.compress(CompressFormat.JPEG, 100, byteArrayOutputStream);
            byte[] byteArray = byteArrayOutputStream.toByteArray();
            try {
                byteArrayOutputStream.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return byteArray;
        }

        private boolean drawImage(DrawYuvAttribute drawYuvAttribute) {
            byte[] applyEffect = applyEffect(drawYuvAttribute);
            String access$600 = SnapshotRender.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("mainLen=");
            sb.append(applyEffect == null ? TEDefine.FACE_BEAUTY_NULL : Integer.valueOf(applyEffect.length));
            Log.d(access$600, sb.toString());
            return true;
        }

        private void drawWaterMark(WaterMark waterMark, int i, int i2, int i3) {
            this.mGLCanvas.getState().pushState();
            if (i3 != 0) {
                this.mGLCanvas.getState().translate((float) (waterMark.getCenterX() + i), (float) (waterMark.getCenterY() + i2));
                this.mGLCanvas.getState().rotate((float) (-i3), 0.0f, 0.0f, 1.0f);
                this.mGLCanvas.getState().translate((float) ((-i) - waterMark.getCenterX()), (float) ((-i2) - waterMark.getCenterY()));
            }
            BasicRender basicRender = this.mGLCanvas.getBasicRender();
            DrawBasicTexAttribute drawBasicTexAttribute = new DrawBasicTexAttribute(waterMark.getTexture(), i + waterMark.getLeft(), i2 + waterMark.getTop(), waterMark.getWidth(), waterMark.getHeight());
            basicRender.draw(drawBasicTexAttribute);
            this.mGLCanvas.getState().popState();
            this.mGLCanvas.deleteTexture(waterMark.getTexture().getId());
        }

        private Render fetchRender(int i) {
            RenderGroup effectRenderGroup = this.mGLCanvas.getEffectRenderGroup();
            Render render = effectRenderGroup.getRender(i);
            if (render != null) {
                return render;
            }
            this.mGLCanvas.prepareEffectRenders(false, i);
            return effectRenderGroup.getRender(i);
        }

        private PipeRender getEffectRender(DrawYuvAttribute drawYuvAttribute) {
            PipeRender pipeRender = new PipeRender(this.mGLCanvas);
            pipeRender.addRender(fetchRender(FilterInfo.FILTER_ID_YUV2RGB));
            if (drawYuvAttribute.mEffectIndex != FilterInfo.FILTER_ID_NONE) {
                Render fetchRender = fetchRender(drawYuvAttribute.mEffectIndex);
                if (fetchRender != null) {
                    pipeRender.addRender(fetchRender);
                }
            }
            if (drawYuvAttribute.mIsGradienterOn) {
                Render fetchRender2 = fetchRender(FilterInfo.FILTER_ID_GRADIENTER);
                if (fetchRender2 != null) {
                    pipeRender.addRender(fetchRender2);
                }
            } else if (drawYuvAttribute.mTiltShiftMode != null) {
                Render render = null;
                if (ComponentRunningTiltValue.TILT_CIRCLE.equals(drawYuvAttribute.mTiltShiftMode)) {
                    render = fetchRender(FilterInfo.FILTER_ID_GAUSSIAN);
                } else if (ComponentRunningTiltValue.TILT_PARALLEL.equals(drawYuvAttribute.mTiltShiftMode)) {
                    render = fetchRender(FilterInfo.FILTER_ID_TILTSHIFT);
                }
                if (render != null) {
                    pipeRender.addRender(render);
                }
            }
            if (!drawYuvAttribute.mApplyWaterMark) {
                pipeRender.addRender(fetchRender(FilterInfo.FILTER_ID_RGB2YUV));
            }
            return pipeRender;
        }

        private Bitmap getGPURBGA(int i, int i2, int i3, int i4) {
            int i5 = i3 * i4;
            int[] iArr = new int[i5];
            int[] iArr2 = new int[i5];
            IntBuffer wrap = IntBuffer.wrap(iArr);
            wrap.position(0);
            GLES20.glReadPixels(i, i2, i3, i4, 6408, 5121, wrap);
            int i6 = 0;
            int i7 = 0;
            while (i6 < i4) {
                int i8 = i7;
                for (int i9 = 0; i9 < i3; i9++) {
                    int i10 = iArr[i8];
                    iArr2[i8] = (i10 & -16711936) | ((i10 << 16) & 16711680) | ((i10 >> 16) & 255);
                    i8++;
                }
                i6++;
                i7 = i8;
            }
            return Bitmap.createBitmap(iArr2, i3, i4, Config.ARGB_8888);
        }

        private void initEGL() {
            SnapshotRender.this.mEgl = (EGL10) EGLContext.getEGL();
            SnapshotRender.this.mEglDisplay = SnapshotRender.this.mEgl.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
            if (SnapshotRender.this.mEglDisplay != EGL10.EGL_NO_DISPLAY) {
                int[] iArr = new int[2];
                if (SnapshotRender.this.mEgl.eglInitialize(SnapshotRender.this.mEglDisplay, iArr)) {
                    String access$600 = SnapshotRender.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("EGL version: ");
                    sb.append(iArr[0]);
                    sb.append('.');
                    sb.append(iArr[1]);
                    Log.v(access$600, sb.toString());
                    int[] iArr2 = {SnapshotRender.EGL_CONTEXT_CLIENT_VERSION, 2, 12344};
                    SnapshotRender.this.mEglConfig = SnapshotRender.chooseConfig(SnapshotRender.this.mEgl, SnapshotRender.this.mEglDisplay);
                    SnapshotRender.this.mEglContext = SnapshotRender.this.mEgl.eglCreateContext(SnapshotRender.this.mEglDisplay, SnapshotRender.this.mEglConfig, EGL10.EGL_NO_CONTEXT, iArr2);
                    if (SnapshotRender.this.mEglContext == null || SnapshotRender.this.mEglContext == EGL10.EGL_NO_CONTEXT) {
                        throw new RuntimeException("failed to createContext");
                    }
                    SnapshotRender.this.mEglSurface = SnapshotRender.this.mEgl.eglCreatePbufferSurface(SnapshotRender.this.mEglDisplay, SnapshotRender.this.mEglConfig, new int[]{12375, Util.sWindowWidth, 12374, Util.sWindowHeight, 12344});
                    if (SnapshotRender.this.mEglSurface == null || SnapshotRender.this.mEglSurface == EGL10.EGL_NO_SURFACE) {
                        throw new RuntimeException("failed to createWindowSurface");
                    } else if (!SnapshotRender.this.mEgl.eglMakeCurrent(SnapshotRender.this.mEglDisplay, SnapshotRender.this.mEglSurface, SnapshotRender.this.mEglSurface, SnapshotRender.this.mEglContext)) {
                        throw new RuntimeException("failed to eglMakeCurrent");
                    }
                } else {
                    throw new RuntimeException("eglInitialize failed");
                }
            } else {
                throw new RuntimeException("eglGetDisplay failed");
            }
        }

        private void release() {
            this.mFrameBuffer = null;
            this.mWatermarkFrameBuffer = null;
            this.mGLCanvas.recycledResources();
            this.mGLCanvas = null;
            SnapshotRender.this.destroy();
        }

        private void updateRenderParameters(Render render, DrawYuvAttribute drawYuvAttribute) {
            if (render instanceof PipeRender) {
                ((PipeRender) render).setFrameBufferSize(drawYuvAttribute.mPictureSize.getWidth(), drawYuvAttribute.mPictureSize.getHeight());
            }
            render.setViewportSize(drawYuvAttribute.mPictureSize.getWidth(), drawYuvAttribute.mPictureSize.getHeight());
            render.setPreviewSize(drawYuvAttribute.mPreviewSize.getWidth(), drawYuvAttribute.mPreviewSize.getHeight());
            render.setEffectRangeAttribute(drawYuvAttribute.mAttribute);
            render.setMirror(drawYuvAttribute.mMirror);
            render.setSnapshotSize(drawYuvAttribute.mPictureSize.getWidth(), drawYuvAttribute.mPictureSize.getHeight());
            render.setOrientation(drawYuvAttribute.mOrientation);
            render.setShootRotation(drawYuvAttribute.mShootRotation);
            render.setJpegOrientation(drawYuvAttribute.mJpegRotation);
        }

        public void drawFaceWaterMarkInfos(Size size, Size size2, int i, List<WaterMarkData> list) {
            if (list != null && !list.isEmpty() && CameraSettings.isAgeGenderAndMagicMirrorWaterOpen()) {
                WaterMarkBitmap waterMarkBitmap = new WaterMarkBitmap(list);
                WaterMarkData waterMarkData = waterMarkBitmap.getWaterMarkData();
                if (waterMarkData != null) {
                    AgeGenderAndMagicMirrorWaterMark ageGenderAndMagicMirrorWaterMark = new AgeGenderAndMagicMirrorWaterMark(waterMarkData.getImage(), size.getWidth(), size.getHeight(), i, size2.getWidth(), size2.getHeight(), 0.0f, 0.0f);
                    drawWaterMark(ageGenderAndMagicMirrorWaterMark, 0, 0, i - waterMarkData.getOrientation());
                }
                waterMarkBitmap.releaseBitmap();
                Log.d(WaterMarkBitmap.class.getSimpleName(), "Draw age_gender_and_magic_mirror water mark");
            }
        }

        public void drawWaterMark(int i, int i2, int i3, int i4, int i5, String str) {
            if (str != null) {
                drawWaterMark(new NewStyleTextWaterMark(str, i3, i4, i5), i, i2, i5);
            }
            if (SnapshotRender.this.mDualCameraWaterMarkBitmap != null && SnapshotRender.this.mDualCameraWaterMarkParam.isDualWatermarkEnable()) {
                if (SnapshotRender.this.mCurrentCustomWaterMarkText != null && !SnapshotRender.this.mCurrentCustomWaterMarkText.equals(CameraSettings.getCustomWatermark())) {
                    SnapshotRender.this.mCurrentCustomWaterMarkText = CameraSettings.getCustomWatermark();
                    SnapshotRender.this.mDualCameraWaterMarkBitmap = SnapshotRender.this.loadCameraWatermark(CameraAppImpl.getAndroidContext());
                }
                Bitmap access$1100 = SnapshotRender.this.mDualCameraWaterMarkBitmap;
                boolean equals = CameraSettings.getCustomWatermark().equals(CameraSettings.getDefaultWatermarkStr());
                if (CameraSettings.isUltraPixelRear48MPOn() && equals) {
                    if (SnapshotRender.this.m48MCameraWaterMarkBitmap == null) {
                        SnapshotRender.this.m48MCameraWaterMarkBitmap = SnapshotRender.this.load48MWatermark(CameraAppImpl.getAndroidContext());
                    }
                    if (SnapshotRender.this.m48MCameraWaterMarkBitmap != null) {
                        access$1100 = SnapshotRender.this.m48MCameraWaterMarkBitmap;
                    }
                }
                ImageWaterMark imageWaterMark = new ImageWaterMark(access$1100, i3, i4, i5, SnapshotRender.this.mDualCameraWaterMarkParam.getSize(), SnapshotRender.this.mDualCameraWaterMarkParam.getPaddingX(), SnapshotRender.this.mDualCameraWaterMarkParam.getPaddingY());
                drawWaterMark(imageWaterMark, i, i2, i5);
            }
        }

        public void handleMessage(Message message) {
            switch (message.what) {
                case 0:
                    initEGL();
                    this.mGLCanvas = new SnapshotCanvas();
                    Size size = (Size) message.obj;
                    this.mGLCanvas.setSize(size.getWidth(), size.getHeight());
                    SnapshotRender.this.mEglThreadBlockVar.open();
                    return;
                case 1:
                    drawImage((DrawYuvAttribute) message.obj);
                    this.mGLCanvas.recycledResources();
                    if (SnapshotRender.this.mReleasePending && !hasMessages(1)) {
                        release();
                    }
                    synchronized (SnapshotRender.this.mLock) {
                        SnapshotRender.this.mImageQueueSize = SnapshotRender.this.mImageQueueSize - 1;
                    }
                    return;
                case 2:
                    drawImage((DrawYuvAttribute) message.obj);
                    this.mGLCanvas.recycledResources();
                    SnapshotRender.this.mEglThreadBlockVar.open();
                    return;
                case 5:
                    release();
                    return;
                case 6:
                    this.mGLCanvas.prepareEffectRenders(false, message.arg1);
                    return;
                default:
                    return;
            }
        }

        public void sendMessageSync(Message message) {
            SnapshotRender.this.mEglThreadBlockVar.close();
            sendMessage(message);
            SnapshotRender.this.mEglThreadBlockVar.block();
        }
    }

    private static /* synthetic */ void $closeResource(Throwable th, AutoCloseable autoCloseable) {
        if (th != null) {
            try {
                autoCloseable.close();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
        } else {
            autoCloseable.close();
        }
    }

    public SnapshotRender(@NonNull Size size) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("SnapshotRender created ");
        sb.append(this);
        sb.append("; with size : ");
        sb.append(size);
        Log.d(str, sb.toString());
        this.mEglThread = new HandlerThread("SnapshotRender");
        this.mEglThread.start();
        this.mEglHandler = new EGLHandler(this.mEglThread.getLooper());
        this.mEglHandler.sendMessageSync(this.mEglHandler.obtainMessage(0, size));
        this.mRelease = false;
    }

    /* access modifiers changed from: private */
    public static EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay) {
        int[] iArr = new int[1];
        if (egl10.eglChooseConfig(eGLDisplay, CONFIG_SPEC, null, 0, iArr)) {
            int i = iArr[0];
            if (i > 0) {
                EGLConfig[] eGLConfigArr = new EGLConfig[i];
                if (egl10.eglChooseConfig(eGLDisplay, CONFIG_SPEC, eGLConfigArr, i, iArr)) {
                    return eGLConfigArr[0];
                }
                throw new IllegalArgumentException("eglChooseConfig#2 failed");
            }
            throw new IllegalArgumentException("No configs match configSpec");
        }
        throw new IllegalArgumentException("eglChooseConfig failed");
    }

    /* access modifiers changed from: private */
    public void destroy() {
        this.mRelease = true;
        this.mReleasePending = false;
        this.mEgl.eglDestroySurface(this.mEglDisplay, this.mEglSurface);
        this.mEgl.eglDestroyContext(this.mEglDisplay, this.mEglContext);
        this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
        this.mEgl.eglTerminate(this.mEglDisplay);
        this.mEglSurface = null;
        this.mEglContext = null;
        this.mEglDisplay = null;
        this.mEglThread.quit();
        if (this.mDualCameraWaterMarkBitmap != null && !this.mDualCameraWaterMarkBitmap.isRecycled()) {
            this.mDualCameraWaterMarkBitmap.recycle();
            this.mDualCameraWaterMarkBitmap = null;
        }
        System.gc();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("SnapshotRender released ");
        sb.append(this);
        Log.d(str, sb.toString());
    }

    /* access modifiers changed from: private */
    public Bitmap load48MWatermark(Context context) {
        FileInputStream fileInputStream;
        Throwable th;
        Throwable th2;
        Options options = new Options();
        options.inScaled = false;
        options.inPurgeable = true;
        options.inPremultiplied = false;
        if (DataRepository.dataItemFeature().fn()) {
            File file = new File(context.getFilesDir(), Util.WATERMARK_48M_FILE_NAME);
            if (!file.exists()) {
                return Util.generate48MWatermark2File();
            }
            try {
                fileInputStream = new FileInputStream(file);
                try {
                    Bitmap decodeStream = BitmapFactory.decodeStream(fileInputStream, null, options);
                    $closeResource(null, fileInputStream);
                    return decodeStream;
                } catch (Throwable th3) {
                    Throwable th4 = th3;
                    th = r0;
                    th2 = th4;
                }
            } catch (Exception e) {
                Log.d(TAG, "Failed to load app camera watermark ", e);
            }
        }
        return null;
        $closeResource(th, fileInputStream);
        throw th2;
    }

    /* access modifiers changed from: private */
    public Bitmap loadCameraWatermark(Context context) {
        FileInputStream fileInputStream;
        Throwable th;
        Throwable th2;
        Options options = new Options();
        options.inScaled = false;
        options.inPurgeable = true;
        options.inPremultiplied = false;
        if (!DataRepository.dataItemFeature().fn()) {
            return BitmapFactory.decodeFile(CameraSettings.getDualCameraWaterMarkFilePathVendor(), options);
        }
        File file = new File(context.getFilesDir(), Util.WATERMARK_FILE_NAME);
        if (!file.exists()) {
            Util.generateWatermark2File();
        }
        try {
            fileInputStream = new FileInputStream(file);
            try {
                Bitmap decodeStream = BitmapFactory.decodeStream(fileInputStream, null, options);
                $closeResource(null, fileInputStream);
                return decodeStream;
            } catch (Throwable th3) {
                Throwable th4 = th3;
                th = r0;
                th2 = th4;
            }
        } catch (Exception e) {
            Log.d(TAG, "Failed to load app camera watermark ", e);
            return null;
        }
        $closeResource(th, fileInputStream);
        throw th2;
    }

    public boolean isRelease() {
        return this.mReleasePending || this.mRelease;
    }

    public void prepareEffectRender(DualWatermarkParam dualWatermarkParam, int i) {
        this.mDualCameraWaterMarkParam = dualWatermarkParam;
        if (dualWatermarkParam.isDualWatermarkEnable() && this.mDualCameraWaterMarkBitmap == null) {
            Options options = new Options();
            options.inScaled = false;
            options.inPurgeable = true;
            options.inPremultiplied = false;
            this.mDualCameraWaterMarkBitmap = loadCameraWatermark(CameraAppImpl.getAndroidContext());
            this.mCurrentCustomWaterMarkText = CameraSettings.getCustomWatermark();
        }
        if (i != FilterInfo.FILTER_ID_NONE) {
            this.mEglHandler.obtainMessage(6, i, 0).sendToTarget();
        }
    }

    public boolean processImageAsync(DrawYuvAttribute drawYuvAttribute) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("queueSize=");
        sb.append(this.mImageQueueSize);
        Log.d(str, sb.toString());
        if (this.mImageQueueSize >= 7) {
            Log.d(TAG, "queueSize is full");
            return false;
        }
        synchronized (this.mLock) {
            this.mImageQueueSize++;
        }
        this.mEglHandler.obtainMessage(1, drawYuvAttribute).sendToTarget();
        return true;
    }

    public void processImageSync(DrawYuvAttribute drawYuvAttribute) {
        this.mEglThreadBlockVar.close();
        this.mEglHandler.obtainMessage(2, drawYuvAttribute).sendToTarget();
        this.mEglThreadBlockVar.block();
    }

    public void release() {
        if (this.mEglHandler.hasMessages(1)) {
            Log.d(TAG, "release: try to release but message is not null, so pending it");
            this.mReleasePending = true;
            return;
        }
        this.mEglHandler.sendEmptyMessage(5);
    }
}
