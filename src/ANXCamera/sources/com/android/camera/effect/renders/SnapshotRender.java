package com.android.camera.effect.renders;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.RectF;
import android.media.Image.Plane;
import android.opengl.EGLContext;
import android.opengl.GLES20;
import android.os.ConditionVariable;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.provider.MiuiSettings.ScreenEffect;
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
import com.android.camera.effect.framework.gles.EglCore;
import com.android.camera.effect.framework.gles.PbufferSurface;
import com.android.camera.effect.framework.graphics.Block;
import com.android.camera.effect.framework.graphics.Splitter;
import com.android.camera.effect.framework.image.MemYuvImage;
import com.android.camera.effect.framework.utils.CounterUtil;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera.watermark.WaterMarkBitmap;
import com.android.camera.watermark.WaterMarkData;
import com.mi.config.b;
import com.ss.android.ttve.common.TEDefine;
import com.xiaomi.camera.base.ImageUtil;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.nio.ByteBuffer;
import java.nio.IntBuffer;
import java.util.List;
import java.util.Locale;

public class SnapshotRender {
    private static final boolean DUMP_TEXTURE = false;
    private static final int EGL_CONTEXT_CLIENT_VERSION = 12440;
    private static final int QUEUE_LIMIT = 7;
    /* access modifiers changed from: private */
    public static final String TAG = SnapshotRender.class.getSimpleName();
    /* access modifiers changed from: private */
    public Bitmap m48MCameraWaterMarkBitmap;
    /* access modifiers changed from: private */
    public int mBlockHeight;
    /* access modifiers changed from: private */
    public int mBlockWidth;
    /* access modifiers changed from: private */
    public String mCurrentCustomWaterMarkText;
    /* access modifiers changed from: private */
    public DeviceWatermarkParam mDeviceWaterMarkParam;
    /* access modifiers changed from: private */
    public Bitmap mDualCameraWaterMarkBitmap;
    /* access modifiers changed from: private */
    public EglCore mEglCore;
    private EGLHandler mEglHandler;
    private HandlerThread mEglThread;
    /* access modifiers changed from: private */
    public ConditionVariable mEglThreadBlockVar = new ConditionVariable();
    /* access modifiers changed from: private */
    public CounterUtil mFrameCounter;
    /* access modifiers changed from: private */
    public Bitmap mFrontCameraWaterMarkBitmap;
    /* access modifiers changed from: private */
    public volatile int mImageQueueSize = 0;
    /* access modifiers changed from: private */
    public final Object mLock = new Object();
    /* access modifiers changed from: private */
    public MemYuvImage mMemImage;
    /* access modifiers changed from: private */
    public int mQuality = 97;
    private boolean mRelease;
    /* access modifiers changed from: private */
    public boolean mReleasePending;
    private CounterUtil mRenderCounter;
    /* access modifiers changed from: private */
    public PbufferSurface mRenderSurface;
    /* access modifiers changed from: private */
    public Splitter mSplitter;
    private int mTextureId;
    /* access modifiers changed from: private */
    public CounterUtil mTotalCounter;

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

        /* JADX WARNING: type inference failed for: r8v4 */
        /* JADX WARNING: type inference failed for: r11v5 */
        /* JADX WARNING: type inference failed for: r8v6 */
        /* JADX WARNING: type inference failed for: r8v7 */
        /* JADX WARNING: type inference failed for: r8v11 */
        /* JADX WARNING: type inference failed for: r8v12 */
        /* JADX WARNING: Multi-variable type inference failed */
        /* JADX WARNING: Removed duplicated region for block: B:42:0x0201  */
        /* JADX WARNING: Removed duplicated region for block: B:63:0x034a  */
        /* JADX WARNING: Removed duplicated region for block: B:66:0x035b  */
        /* JADX WARNING: Removed duplicated region for block: B:68:0x0363  */
        /* JADX WARNING: Removed duplicated region for block: B:69:0x0365  */
        /* JADX WARNING: Removed duplicated region for block: B:72:0x03eb  */
        /* JADX WARNING: Removed duplicated region for block: B:73:0x041b  */
        /* JADX WARNING: Removed duplicated region for block: B:76:0x0453  */
        /* JADX WARNING: Unknown variable types count: 4 */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        private byte[] applyEffect(DrawYuvAttribute drawYuvAttribute) {
            PipeRender pipeRender;
            int i;
            int[] iArr;
            int i2;
            byte[] bArr;
            boolean z;
            DrawYuvAttribute drawYuvAttribute2;
            int i3;
            int i4;
            int i5;
            int i6;
            int[] iArr2;
            int i7;
            byte[] bArr2;
            DrawYuvAttribute drawYuvAttribute3;
            int i8;
            int i9;
            ? r8;
            int i10;
            int i11;
            DrawYuvAttribute drawYuvAttribute4 = drawYuvAttribute;
            PipeRender effectRender = getEffectRender(drawYuvAttribute);
            if (effectRender == null) {
                Log.w(SnapshotRender.TAG, "init render failed");
                return null;
            }
            int width = drawYuvAttribute4.mPictureSize.getWidth();
            int height = drawYuvAttribute4.mPictureSize.getHeight();
            long currentTimeMillis = System.currentTimeMillis();
            Plane plane = drawYuvAttribute4.mImage.getPlanes()[0];
            Plane plane2 = drawYuvAttribute4.mImage.getPlanes()[1];
            int rowStride = plane.getRowStride();
            int rowStride2 = plane2.getRowStride();
            String access$400 = SnapshotRender.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("plane0 stride =  ");
            sb.append(plane.getRowStride());
            sb.append(", plane1 stride = ");
            sb.append(plane2.getRowStride());
            Log.d(access$400, sb.toString());
            if (drawYuvAttribute4.mEffectIndex != FilterInfo.FILTER_ID_NONE || CameraSettings.isAgeGenderAndMagicMirrorWaterOpen() || ModuleManager.isSquareModule() || CameraSettings.isGradienterOn() || CameraSettings.isTiltShiftOn() || (!drawYuvAttribute4.mApplyWaterMark && drawYuvAttribute4.mTimeWatermark == null)) {
                pipeRender = effectRender;
                i2 = width;
                i = height;
                drawYuvAttribute2 = drawYuvAttribute4;
                z = false;
                bArr = null;
                iArr = null;
            } else {
                int[] watermarkRange = Util.getWatermarkRange(drawYuvAttribute4.mPictureSize.getWidth(), drawYuvAttribute4.mPictureSize.getHeight(), (drawYuvAttribute4.mJpegRotation + 270) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT, drawYuvAttribute4.mApplyWaterMark, drawYuvAttribute4.mTimeWatermark != null, 0.11f);
                byte[] yuvData = ImageUtil.getYuvData(drawYuvAttribute4.mImage);
                MiYuvImage subYuvImage = Util.getSubYuvImage(yuvData, width, height, rowStride, rowStride2, watermarkRange);
                String access$4002 = SnapshotRender.TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("get sub range data spend total tome =");
                sb2.append(System.currentTimeMillis() - currentTimeMillis);
                Log.d(access$4002, sb2.toString());
                i2 = width;
                iArr = watermarkRange;
                i = height;
                pipeRender = effectRender;
                MiYuvImage miYuvImage = subYuvImage;
                DrawYuvAttribute drawYuvAttribute5 = new DrawYuvAttribute(drawYuvAttribute4.mImage, drawYuvAttribute4.mPreviewSize, new Size(watermarkRange[2], watermarkRange[3]), drawYuvAttribute4.mEffectIndex, drawYuvAttribute4.mOrientation, drawYuvAttribute4.mJpegRotation, drawYuvAttribute4.mShootRotation, drawYuvAttribute4.mDate, drawYuvAttribute4.mMirror, drawYuvAttribute4.mApplyWaterMark, drawYuvAttribute4.mIsGradienterOn, drawYuvAttribute4.mTiltShiftMode, drawYuvAttribute4.mTimeWatermark, drawYuvAttribute4.mAttribute, drawYuvAttribute4.mWaterInfos);
                drawYuvAttribute5.mYuvImage = miYuvImage;
                drawYuvAttribute2 = drawYuvAttribute5;
                bArr = yuvData;
                z = true;
            }
            PipeRender pipeRender2 = pipeRender;
            updateRenderParameters(pipeRender2, drawYuvAttribute2);
            if (pipeRender2 instanceof PipeRender) {
                pipeRender2.setFrameBufferSize(drawYuvAttribute2.mPictureSize.getWidth(), drawYuvAttribute2.mPictureSize.getHeight());
            }
            int i12 = z ? iArr[2] : i2;
            int i13 = z ? iArr[3] : i;
            checkFrameBuffer(i12, i13);
            this.mGLCanvas.beginBindFrameBuffer(this.mFrameBuffer);
            long currentTimeMillis2 = System.currentTimeMillis();
            GLES20.glFlush();
            pipeRender2.setParentFrameBufferId(this.mFrameBuffer.getId());
            pipeRender2.draw(drawYuvAttribute2);
            String access$4003 = SnapshotRender.TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("drawTime=");
            sb3.append(System.currentTimeMillis() - currentTimeMillis2);
            Log.d(access$4003, sb3.toString());
            pipeRender2.deleteBuffer();
            int i14 = i2;
            int i15 = i;
            drawYuvAttribute2.mOriginalSize = new Size(i14, i15);
            if (!ModuleManager.isSquareModule()) {
                i6 = i14;
                i5 = i15;
                i4 = 0;
            } else if (i14 > i15) {
                i4 = (i14 - i15) / 2;
                i6 = i15;
                i5 = i6;
            } else {
                i3 = (i15 - i14) / 2;
                i6 = i14;
                i5 = i6;
                i4 = 0;
                if (!drawYuvAttribute2.mApplyWaterMark) {
                    if (z) {
                        i9 = -iArr[0];
                        i8 = -iArr[1];
                        r8 = 1;
                    } else {
                        i9 = 0;
                        i8 = 0;
                        r8 = 1;
                    }
                    long currentTimeMillis3 = System.currentTimeMillis();
                    if (!z) {
                        iArr = Util.getWatermarkRange(i6, i5, (drawYuvAttribute2.mJpegRotation + 270) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT, drawYuvAttribute2.mApplyWaterMark, drawYuvAttribute2.mTimeWatermark != null ? r8 : 0, 0.11f);
                        int i16 = iArr[0];
                        i10 = iArr[r8];
                        i11 = i16;
                    } else {
                        i11 = 0;
                        i10 = 0;
                    }
                    int i17 = drawYuvAttribute2.mJpegQuality;
                    int i18 = (i17 <= 0 || i17 > 97) ? 97 : i17;
                    int i19 = i18;
                    ? r11 = r8;
                    i7 = i13;
                    drawAgeGenderAndMagicMirrorWater(drawYuvAttribute2.mWaterInfos, i9, i8, i14, i15, drawYuvAttribute2.mPreviewSize.getWidth(), drawYuvAttribute2.mPreviewSize.getHeight(), drawYuvAttribute2.mJpegRotation, false);
                    bArr2 = ShaderNativeUtil.getPicture(i11 + i4, i10 + i3, iArr[2], iArr[3], i19);
                    String access$4004 = SnapshotRender.TAG;
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("for remove watermark spend more time = ");
                    sb4.append(System.currentTimeMillis() - currentTimeMillis3);
                    Log.d(access$4004, sb4.toString());
                    drawWaterMark(i9 + i4, i8 + i3, i6, i5, drawYuvAttribute2.mJpegRotation, drawYuvAttribute2.mTimeWatermark);
                    String access$4005 = SnapshotRender.TAG;
                    StringBuilder sb5 = new StringBuilder();
                    sb5.append("watermarkTime=");
                    sb5.append(System.currentTimeMillis() - currentTimeMillis3);
                    Log.d(access$4005, sb5.toString());
                    this.mGLCanvas.endBindFrameBuffer();
                    Size size = z ? new Size(i12, i7) : drawYuvAttribute2.mOriginalSize;
                    checkWatermarkFrameBuffer(size);
                    this.mGLCanvas.beginBindFrameBuffer(this.mWatermarkFrameBuffer);
                    long currentTimeMillis4 = System.currentTimeMillis();
                    RgbToYuvRender rgbToYuvRender = (RgbToYuvRender) fetchRender(FilterInfo.FILTER_ID_RGB2YUV);
                    updateRenderParameters(rgbToYuvRender, drawYuvAttribute2);
                    rgbToYuvRender.setParentFrameBufferId(this.mFrameBuffer.getId());
                    rgbToYuvRender.drawTexture(this.mFrameBuffer.getTexture().getId(), 0.0f, 0.0f, (float) size.getWidth(), (float) size.getHeight(), true);
                    String access$4006 = SnapshotRender.TAG;
                    StringBuilder sb6 = new StringBuilder();
                    sb6.append("rgb2YuvTime=");
                    sb6.append(System.currentTimeMillis() - currentTimeMillis4);
                    Log.d(access$4006, sb6.toString());
                    iArr2 = iArr;
                } else {
                    i7 = i13;
                    iArr2 = iArr;
                    bArr2 = null;
                }
                GLES20.glPixelStorei(3333, 1);
                long currentTimeMillis5 = System.currentTimeMillis();
                if (!z) {
                    i12 = drawYuvAttribute2.mOriginalSize.getWidth();
                }
                int height2 = !z ? i7 : drawYuvAttribute2.mOriginalSize.getHeight();
                int ceil = (int) Math.ceil(((double) i12) / 2.0d);
                int ceil2 = (int) Math.ceil((((double) height2) * 3.0d) / 4.0d);
                ByteBuffer allocate = ByteBuffer.allocate(ceil * ceil2 * 4);
                GLES20.glReadPixels(0, 0, ceil, ceil2, 6408, 5121, allocate);
                allocate.rewind();
                Log.d(SnapshotRender.TAG, String.format(Locale.ENGLISH, "readSize=%dx%d imageSize=%dx%d", new Object[]{Integer.valueOf(ceil), Integer.valueOf(ceil2), Integer.valueOf(i12), Integer.valueOf(height2)}));
                String access$4007 = SnapshotRender.TAG;
                StringBuilder sb7 = new StringBuilder();
                sb7.append("readTime=");
                sb7.append(System.currentTimeMillis() - currentTimeMillis5);
                Log.d(access$4007, sb7.toString());
                byte[] array = allocate.array();
                if (!z) {
                    long currentTimeMillis6 = System.currentTimeMillis();
                    Util.coverSubYuvImage(bArr, i6, i5, rowStride, rowStride2, allocate.array(), iArr2);
                    String access$4008 = SnapshotRender.TAG;
                    StringBuilder sb8 = new StringBuilder();
                    sb8.append("cover sub range data spend total time =");
                    sb8.append(System.currentTimeMillis() - currentTimeMillis6);
                    Log.d(access$4008, sb8.toString());
                } else {
                    bArr = array;
                }
                long currentTimeMillis7 = System.currentTimeMillis();
                ImageUtil.updateYuvImage(drawYuvAttribute2.mImage, bArr, z);
                String access$4009 = SnapshotRender.TAG;
                StringBuilder sb9 = new StringBuilder();
                sb9.append("updateImageTime=");
                sb9.append(System.currentTimeMillis() - currentTimeMillis7);
                Log.d(access$4009, sb9.toString());
                this.mGLCanvas.endBindFrameBuffer();
                this.mGLCanvas.recycledResources();
                drawYuvAttribute3 = drawYuvAttribute;
                if (drawYuvAttribute3.mApplyWaterMark) {
                    int[] watermarkRange2 = Util.getWatermarkRange(drawYuvAttribute3.mOutputSize.getWidth(), drawYuvAttribute3.mOutputSize.getHeight(), (drawYuvAttribute3.mJpegRotation + 270) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT, drawYuvAttribute3.mApplyWaterMark, drawYuvAttribute3.mTimeWatermark != null, 0.11f);
                    drawYuvAttribute3.mDataOfTheRegionUnderWatermarks = bArr2;
                    drawYuvAttribute3.mCoordinatesOfTheRegionUnderWatermarks = watermarkRange2;
                }
                return bArr;
            }
            i3 = 0;
            if (!drawYuvAttribute2.mApplyWaterMark) {
            }
            GLES20.glPixelStorei(3333, 1);
            long currentTimeMillis52 = System.currentTimeMillis();
            if (!z) {
            }
            if (!z) {
            }
            int ceil3 = (int) Math.ceil(((double) i12) / 2.0d);
            int ceil22 = (int) Math.ceil((((double) height2) * 3.0d) / 4.0d);
            ByteBuffer allocate2 = ByteBuffer.allocate(ceil3 * ceil22 * 4);
            GLES20.glReadPixels(0, 0, ceil3, ceil22, 6408, 5121, allocate2);
            allocate2.rewind();
            Log.d(SnapshotRender.TAG, String.format(Locale.ENGLISH, "readSize=%dx%d imageSize=%dx%d", new Object[]{Integer.valueOf(ceil3), Integer.valueOf(ceil22), Integer.valueOf(i12), Integer.valueOf(height2)}));
            String access$40072 = SnapshotRender.TAG;
            StringBuilder sb72 = new StringBuilder();
            sb72.append("readTime=");
            sb72.append(System.currentTimeMillis() - currentTimeMillis52);
            Log.d(access$40072, sb72.toString());
            byte[] array2 = allocate2.array();
            if (!z) {
            }
            long currentTimeMillis72 = System.currentTimeMillis();
            ImageUtil.updateYuvImage(drawYuvAttribute2.mImage, bArr, z);
            String access$40092 = SnapshotRender.TAG;
            StringBuilder sb92 = new StringBuilder();
            sb92.append("updateImageTime=");
            sb92.append(System.currentTimeMillis() - currentTimeMillis72);
            Log.d(access$40092, sb92.toString());
            this.mGLCanvas.endBindFrameBuffer();
            this.mGLCanvas.recycledResources();
            drawYuvAttribute3 = drawYuvAttribute;
            if (drawYuvAttribute3.mApplyWaterMark) {
            }
            return bArr;
        }

        private byte[] blockSplitApplyEffect(DrawYuvAttribute drawYuvAttribute) {
            int i;
            int i2;
            int i3;
            int i4;
            RectF rectF;
            PipeRender pipeRender;
            int i5;
            int i6;
            int i7;
            List list;
            int i8;
            int i9;
            int i10;
            int i11;
            char c;
            RectF rectF2;
            int i12;
            RectF rectF3;
            int i13;
            DrawYuvAttribute drawYuvAttribute2 = drawYuvAttribute;
            SnapshotRender.this.mTotalCounter.reset("TOTAL");
            PipeRender effectRender = getEffectRender(drawYuvAttribute);
            if (effectRender == null) {
                Log.w(SnapshotRender.TAG, "init render failed");
                return null;
            }
            int width = drawYuvAttribute2.mPictureSize.getWidth();
            int height = drawYuvAttribute2.mPictureSize.getHeight();
            Plane plane = drawYuvAttribute2.mImage.getPlanes()[0];
            Plane plane2 = drawYuvAttribute2.mImage.getPlanes()[1];
            int rowStride = plane.getRowStride();
            int rowStride2 = plane2.getRowStride();
            SnapshotRender.this.mMemImage.mWidth = width;
            SnapshotRender.this.mMemImage.mHeight = height;
            SnapshotRender.this.mMemImage.parseImage(drawYuvAttribute2.mImage);
            String access$400 = SnapshotRender.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("plane0 stride =  ");
            sb.append(plane.getRowStride());
            sb.append(", plane1 stride = ");
            sb.append(plane2.getRowStride());
            Log.d(access$400, sb.toString());
            updateRenderParameters(effectRender, drawYuvAttribute2);
            List split = SnapshotRender.this.mSplitter.split(width, height, SnapshotRender.this.mBlockWidth, SnapshotRender.this.mBlockHeight);
            if (ModuleManager.isSquareModule()) {
                if (width > height) {
                    i2 = (width - height) / 2;
                    i = 0;
                    i4 = height;
                } else {
                    i = (height - width) / 2;
                    i2 = 0;
                    i4 = width;
                }
                i3 = i4;
            } else {
                i2 = 0;
                i = 0;
                i3 = width;
                i4 = height;
            }
            if (drawYuvAttribute2.mApplyWaterMark) {
                int[] watermarkRange = Util.getWatermarkRange(i3, i4, (drawYuvAttribute2.mJpegRotation + 270) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT, drawYuvAttribute2.mApplyWaterMark, drawYuvAttribute2.mTimeWatermark != null, 0.11f);
                rectF = new RectF((float) (watermarkRange[0] + i2), (float) (watermarkRange[1] + i), (float) (watermarkRange[0] + watermarkRange[2] + i2), (float) (watermarkRange[1] + watermarkRange[3] + i));
                ShaderNativeUtil.genWaterMarkRange(watermarkRange[0] + i2, watermarkRange[1] + i, watermarkRange[2], watermarkRange[3], 4);
            } else {
                rectF = null;
            }
            RectF rectF4 = new RectF();
            int i14 = 0;
            while (i14 < split.size()) {
                SnapshotRender.this.mFrameCounter.reset(String.format("[loop%d/%d]begin", new Object[]{Integer.valueOf(i14), Integer.valueOf(split.size())}));
                Block block = (Block) split.get(i14);
                int i15 = block.mWidth;
                int i16 = block.mHeight;
                RectF rectF5 = rectF;
                int i17 = block.mRowStride;
                int i18 = block.mOffset;
                if (effectRender instanceof PipeRender) {
                    effectRender.setFrameBufferSize(i15, i16);
                }
                checkFrameBuffer(i15, i16);
                effectRender.setParentFrameBufferId(this.mFrameBuffer.getId());
                RectF rectF6 = rectF4;
                this.mGLCanvas.beginBindFrameBuffer(this.mFrameBuffer.getId(), i15, i16);
                GLES20.glViewport(0, 0, i15, i16);
                int[] yUVOffset = block.getYUVOffset(rowStride, rowStride2, width, height);
                int i19 = rowStride2;
                drawYuvAttribute2.mOffsetY = yUVOffset[0];
                drawYuvAttribute2.mOffsetUV = yUVOffset[1];
                drawYuvAttribute2.mBlockWidth = i15;
                drawYuvAttribute2.mBlockHeight = i16;
                effectRender.draw(drawYuvAttribute2);
                int i20 = rowStride;
                SnapshotRender.this.mFrameCounter.tick(String.format("[loop%d/%d]gl drawFrame", new Object[]{Integer.valueOf(i14), Integer.valueOf(split.size())}));
                drawYuvAttribute2.mOriginalSize = new Size(i3, i4);
                if (drawYuvAttribute2.mApplyWaterMark) {
                    CounterUtil counterUtil = new CounterUtil();
                    counterUtil.reset("drawWaterMark");
                    int[] offset = block.getOffset(width, height);
                    c = 0;
                    RectF rectF7 = rectF6;
                    rectF7.left = (float) offset[0];
                    rectF7.top = (float) offset[1];
                    rectF7.right = (float) (offset[0] + i15);
                    rectF7.bottom = (float) (offset[1] + i16);
                    int i21 = i2 - offset[0];
                    int i22 = i - offset[1];
                    int i23 = i16;
                    i8 = i4;
                    i10 = i3;
                    list = split;
                    i7 = i14;
                    i9 = i19;
                    i11 = i20;
                    i6 = width;
                    i5 = height;
                    i12 = i15;
                    pipeRender = effectRender;
                    rectF2 = rectF7;
                    CounterUtil counterUtil2 = counterUtil;
                    drawAgeGenderAndMagicMirrorWater(drawYuvAttribute2.mWaterInfos, -offset[0], -offset[1], width, height, drawYuvAttribute2.mPreviewSize.getWidth(), drawYuvAttribute2.mPreviewSize.getHeight(), drawYuvAttribute2.mJpegRotation, false);
                    rectF3 = rectF5;
                    if (rectangle_collision(rectF2.left, rectF2.top, rectF2.width(), rectF2.height(), rectF3.left, rectF3.top, rectF3.width(), rectF3.height())) {
                        float[] intersectRect = getIntersectRect(rectF2.left, rectF2.top, rectF2.right, rectF2.bottom, rectF3.left, rectF3.top, rectF3.right, rectF3.bottom);
                        ShaderNativeUtil.mergeWaterMarkRange((int) intersectRect[0], (int) intersectRect[1], (int) (intersectRect[2] - intersectRect[0]), (int) (intersectRect[3] - intersectRect[1]), offset[0], offset[1], 4);
                        i13 = 2;
                        drawWaterMark(i21, i22, i10, i8, drawYuvAttribute2.mJpegRotation, drawYuvAttribute2.mTimeWatermark);
                    } else {
                        i13 = 2;
                    }
                    counterUtil2.tick("drawWaterMark");
                    this.mGLCanvas.endBindFrameBuffer();
                    i16 = i23;
                    Size size = new Size(i12, i16);
                    checkWatermarkFrameBuffer(size);
                    this.mGLCanvas.beginBindFrameBuffer(this.mWatermarkFrameBuffer);
                    RgbToYuvRender rgbToYuvRender = (RgbToYuvRender) fetchRender(FilterInfo.FILTER_ID_RGB2YUV);
                    updateRenderParameters(rgbToYuvRender, drawYuvAttribute2);
                    rgbToYuvRender.setParentFrameBufferId(this.mFrameBuffer.getId());
                    rgbToYuvRender.drawTexture(this.mFrameBuffer.getTexture().getId(), 0.0f, 0.0f, (float) size.getWidth(), (float) size.getHeight(), true);
                    counterUtil2.tick("drawWaterMark rgb2yuv");
                } else {
                    i8 = i4;
                    i10 = i3;
                    i7 = i14;
                    list = split;
                    pipeRender = effectRender;
                    i6 = width;
                    i5 = height;
                    rectF3 = rectF5;
                    rectF2 = rectF6;
                    i9 = i19;
                    i11 = i20;
                    i13 = 2;
                    c = 0;
                    i12 = i15;
                }
                GLES20.glPixelStorei(3333, 1);
                ShaderNativeUtil.mergeYUV(i12, i16, yUVOffset[c], yUVOffset[1]);
                Object[] objArr = new Object[i13];
                int i24 = i7;
                objArr[c] = Integer.valueOf(i24);
                List list2 = list;
                objArr[1] = Integer.valueOf(list2.size());
                SnapshotRender.this.mFrameCounter.tick(String.format("[loop%d/%d]gl mergeYUV", objArr));
                int i25 = i24 + 1;
                split = list2;
                rectF = rectF3;
                rectF4 = rectF2;
                rowStride = i11;
                i3 = i10;
                rowStride2 = i9;
                i4 = i8;
                width = i6;
                height = i5;
                effectRender = pipeRender;
                i14 = i25;
            }
            effectRender.deleteBuffer();
            this.mGLCanvas.endBindFrameBuffer();
            this.mGLCanvas.recycledResources();
            if (drawYuvAttribute2.mApplyWaterMark) {
                byte[] waterMarkRange = ShaderNativeUtil.getWaterMarkRange(SnapshotRender.this.mQuality, 4);
                int[] watermarkRange2 = Util.getWatermarkRange(drawYuvAttribute2.mOutputSize.getWidth(), drawYuvAttribute2.mOutputSize.getHeight(), (drawYuvAttribute2.mJpegRotation + 270) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT, drawYuvAttribute2.mApplyWaterMark, drawYuvAttribute2.mTimeWatermark != null, 0.11f);
                drawYuvAttribute2.mDataOfTheRegionUnderWatermarks = waterMarkRange;
                drawYuvAttribute2.mCoordinatesOfTheRegionUnderWatermarks = watermarkRange2;
            }
            SnapshotRender.this.mTotalCounter.tick("TOTAL");
            return null;
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

        private void drawAgeGenderAndMagicMirrorWater(List<WaterMarkData> list, int i, int i2, int i3, int i4, int i5, int i6, int i7, boolean z) {
            if (b.hM() && !z && CameraSettings.isAgeGenderAndMagicMirrorWaterOpen()) {
                WaterMarkBitmap waterMarkBitmap = new WaterMarkBitmap(list);
                WaterMarkData waterMarkData = waterMarkBitmap.getWaterMarkData();
                if (waterMarkData != null) {
                    AgeGenderAndMagicMirrorWaterMark ageGenderAndMagicMirrorWaterMark = new AgeGenderAndMagicMirrorWaterMark(waterMarkData.getImage(), i3, i4, i7, i5, i6, 0.0f, 0.0f);
                    drawWaterMark(ageGenderAndMagicMirrorWaterMark, i, i2, i7 - waterMarkData.getOrientation());
                }
                waterMarkBitmap.releaseBitmap();
                Log.d(WaterMarkBitmap.class.getSimpleName(), "Draw age_gender_and_magic_mirror water mark");
            }
        }

        private boolean drawImage(DrawYuvAttribute drawYuvAttribute) {
            byte[] applyEffect = (CameraSettings.isGradienterOn() || CameraSettings.isTiltShiftOn() || (drawYuvAttribute.mEffectIndex == FilterInfo.FILTER_ID_NONE && !CameraSettings.isAgeGenderAndMagicMirrorWaterOpen() && !CameraSettings.isGradienterOn() && !CameraSettings.isTiltShiftOn() && (drawYuvAttribute.mApplyWaterMark || drawYuvAttribute.mTimeWatermark != null))) ? applyEffect(drawYuvAttribute) : blockSplitApplyEffect(drawYuvAttribute);
            String access$400 = SnapshotRender.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("mainLen=");
            sb.append(applyEffect == null ? TEDefine.FACE_BEAUTY_NULL : Integer.valueOf(applyEffect.length));
            Log.d(access$400, sb.toString());
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

        private Bitmap getGPUYYY(int i, int i2, int i3, int i4) {
            int i5 = i3 >> 1;
            int i6 = i4 >> 1;
            byte[] bArr = new byte[(i5 * i5 * 4)];
            int i7 = i3 * i4;
            int[] iArr = new int[i7];
            ByteBuffer wrap = ByteBuffer.wrap(bArr);
            wrap.position(0);
            GLES20.glReadPixels(i, i2, i5, i6, 6408, 5121, wrap);
            int i8 = 0;
            for (int i9 = 0; i9 < i7; i9++) {
                byte b = bArr[i9];
                iArr[i8] = (b & -1) | ((b << 8) & 0) | 0 | ((b << 16) & 0);
                i8++;
            }
            return Bitmap.createBitmap(iArr, i3, i4, Config.ARGB_8888);
        }

        private float[] getIntersectRect(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
            float[] fArr = new float[4];
            if (f <= f5) {
                f = f5;
            }
            fArr[0] = f;
            if (f2 <= f6) {
                f2 = f6;
            }
            fArr[1] = f2;
            int i = (f3 > f7 ? 1 : (f3 == f7 ? 0 : -1));
            fArr[2] = f7;
            if (f4 >= f8) {
                f4 = f8;
            }
            fArr[3] = f4;
            return fArr;
        }

        private void initEGL(EGLContext eGLContext, boolean z) {
            if (SnapshotRender.this.mEglCore == null) {
                SnapshotRender.this.mEglCore = new EglCore(eGLContext, 2);
            }
            if (z && SnapshotRender.this.mRenderSurface != null) {
                SnapshotRender.this.mRenderSurface.release();
                SnapshotRender.this.mRenderSurface = null;
            }
            SnapshotRender.this.mRenderSurface = new PbufferSurface(SnapshotRender.this.mEglCore, 1, 1);
            SnapshotRender.this.mRenderSurface.makeCurrent();
        }

        private boolean rectangle_collision(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
            return f <= f7 + f5 && f + f3 >= f5 && f2 <= f8 + f6 && f2 + f4 >= f6;
        }

        private void release() {
            this.mFrameBuffer = null;
            this.mWatermarkFrameBuffer = null;
            if (SnapshotRender.this.mRenderSurface != null) {
                SnapshotRender.this.mRenderSurface.makeCurrent();
                this.mGLCanvas.recycledResources();
                SnapshotRender.this.mRenderSurface.makeNothingCurrent();
            }
            this.mGLCanvas = null;
            SnapshotRender.this.destroy();
        }

        private void updateRenderParameters(Render render, DrawYuvAttribute drawYuvAttribute) {
            if (drawYuvAttribute.mBlockWidth == 0 || drawYuvAttribute.mBlockHeight == 0) {
                render.setViewportSize(drawYuvAttribute.mPictureSize.getWidth(), drawYuvAttribute.mPictureSize.getHeight());
            } else {
                render.setViewportSize(drawYuvAttribute.mBlockWidth, drawYuvAttribute.mBlockHeight);
            }
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
            Bitmap bitmap = null;
            if (SnapshotRender.this.mFrontCameraWaterMarkBitmap != null && SnapshotRender.this.mDeviceWaterMarkParam.isFrontWatermarkEnable()) {
                bitmap = SnapshotRender.this.mFrontCameraWaterMarkBitmap;
            } else if (SnapshotRender.this.mDualCameraWaterMarkBitmap != null && SnapshotRender.this.mDeviceWaterMarkParam.isDualWatermarkEnable()) {
                if (SnapshotRender.this.mCurrentCustomWaterMarkText != null && !SnapshotRender.this.mCurrentCustomWaterMarkText.equals(CameraSettings.getCustomWatermark())) {
                    SnapshotRender.this.mCurrentCustomWaterMarkText = CameraSettings.getCustomWatermark();
                    SnapshotRender.this.mDualCameraWaterMarkBitmap = SnapshotRender.this.loadCameraWatermark(CameraAppImpl.getAndroidContext());
                }
                bitmap = SnapshotRender.this.mDualCameraWaterMarkBitmap;
                boolean equals = CameraSettings.getCustomWatermark().equals(CameraSettings.getDefaultWatermarkStr());
                if (CameraSettings.isUltraPixelRear48MPOn() && equals) {
                    if (SnapshotRender.this.m48MCameraWaterMarkBitmap == null) {
                        SnapshotRender.this.m48MCameraWaterMarkBitmap = SnapshotRender.this.load48MWatermark(CameraAppImpl.getAndroidContext());
                    }
                    if (SnapshotRender.this.m48MCameraWaterMarkBitmap != null) {
                        bitmap = SnapshotRender.this.m48MCameraWaterMarkBitmap;
                    }
                }
            }
            Bitmap bitmap2 = bitmap;
            if (bitmap2 != null) {
                ImageWaterMark imageWaterMark = new ImageWaterMark(bitmap2, i3, i4, i5, SnapshotRender.this.mDeviceWaterMarkParam.getSize(), SnapshotRender.this.mDeviceWaterMarkParam.getPaddingX(), SnapshotRender.this.mDeviceWaterMarkParam.getPaddingY());
                drawWaterMark(imageWaterMark, i, i2, i5);
            }
        }

        public void handleMessage(Message message) {
            switch (message.what) {
                case 0:
                    initEGL(null, false);
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
                    DrawYuvAttribute drawYuvAttribute = (DrawYuvAttribute) message.obj;
                    if (drawYuvAttribute.mPictureSize.getWidth() == 0 || drawYuvAttribute.mPictureSize.getHeight() == 0) {
                        Log.e(SnapshotRender.TAG, String.format("yuv image is broken width %d height %d", new Object[]{Integer.valueOf(drawYuvAttribute.mPictureSize.getWidth()), Integer.valueOf(drawYuvAttribute.mPictureSize.getHeight())}));
                        SnapshotRender.this.mEglThreadBlockVar.open();
                        return;
                    }
                    int access$500 = SnapshotRender.this.calEachBlockHeight(drawYuvAttribute.mPictureSize.getWidth(), drawYuvAttribute.mPictureSize.getHeight());
                    SnapshotRender.this.mBlockWidth = drawYuvAttribute.mPictureSize.getWidth();
                    SnapshotRender.this.mBlockHeight = drawYuvAttribute.mPictureSize.getHeight() / access$500;
                    if (SnapshotRender.this.mBlockHeight % 2 != 0) {
                        SnapshotRender.access$712(SnapshotRender.this, 1);
                    }
                    drawImage(drawYuvAttribute);
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
        if (this.mMemImage == null) {
            this.mMemImage = new MemYuvImage();
        }
        this.mFrameCounter = new CounterUtil();
        this.mTotalCounter = new CounterUtil();
        this.mRenderCounter = new CounterUtil();
        this.mSplitter = new Splitter();
        this.mEglHandler.sendMessageSync(this.mEglHandler.obtainMessage(0, size));
        this.mRelease = false;
    }

    static /* synthetic */ int access$712(SnapshotRender snapshotRender, int i) {
        int i2 = snapshotRender.mBlockHeight + i;
        snapshotRender.mBlockHeight = i2;
        return i2;
    }

    /* access modifiers changed from: private */
    public int calEachBlockHeight(int i, int i2) {
        int i3 = 1;
        while (i * i2 > 6000000) {
            i2 >>= 1;
            i3 <<= 1;
        }
        return i3;
    }

    /* access modifiers changed from: private */
    public void destroy() {
        this.mRelease = true;
        this.mReleasePending = false;
        if (this.mRenderSurface != null) {
            this.mRenderSurface.release();
            this.mRenderSurface = null;
        }
        if (this.mEglCore != null) {
            this.mEglCore.release();
            this.mEglCore = null;
        }
        this.mEglThread.quit();
        if (this.mDualCameraWaterMarkBitmap != null && !this.mDualCameraWaterMarkBitmap.isRecycled()) {
            this.mDualCameraWaterMarkBitmap.recycle();
            this.mDualCameraWaterMarkBitmap = null;
        }
        if (this.mFrontCameraWaterMarkBitmap != null && !this.mFrontCameraWaterMarkBitmap.isRecycled()) {
            this.mFrontCameraWaterMarkBitmap.recycle();
            this.mFrontCameraWaterMarkBitmap = null;
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

    public void prepareEffectRender(DeviceWatermarkParam deviceWatermarkParam, int i) {
        this.mDeviceWaterMarkParam = deviceWatermarkParam;
        if (deviceWatermarkParam.isDualWatermarkEnable() && this.mDualCameraWaterMarkBitmap == null) {
            this.mDualCameraWaterMarkBitmap = loadCameraWatermark(CameraAppImpl.getAndroidContext());
            this.mCurrentCustomWaterMarkText = CameraSettings.getCustomWatermark();
        } else if (deviceWatermarkParam.isFrontWatermarkEnable() && this.mFrontCameraWaterMarkBitmap == null) {
            this.mFrontCameraWaterMarkBitmap = Util.loadFrontCameraWatermark(CameraAppImpl.getAndroidContext());
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
