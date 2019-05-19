package com.android.camera.effect.renders;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.RectF;
import android.location.Location;
import android.net.Uri;
import android.opengl.EGLContext;
import android.opengl.GLES20;
import android.os.ConditionVariable;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.provider.MiuiSettings.ScreenEffect;
import android.text.TextUtils;
import android.util.TypedValue;
import com.android.camera.ActivityBase;
import com.android.camera.CameraSettings;
import com.android.camera.JpegEncodingQualityMappings;
import com.android.camera.R;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.runing.ComponentRunningTiltValue;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.FrameBuffer;
import com.android.camera.effect.ShaderNativeUtil;
import com.android.camera.effect.SnapshotCanvas;
import com.android.camera.effect.draw_mode.DrawBasicTexAttribute;
import com.android.camera.effect.draw_mode.DrawIntTexAttribute;
import com.android.camera.effect.draw_mode.DrawJPEGAttribute;
import com.android.camera.effect.framework.gles.EglCore;
import com.android.camera.effect.framework.gles.OpenGlUtils;
import com.android.camera.effect.framework.gles.PbufferSurface;
import com.android.camera.effect.framework.graphics.Block;
import com.android.camera.effect.framework.graphics.GraphicBuffer;
import com.android.camera.effect.framework.graphics.Splitter;
import com.android.camera.effect.framework.image.MemImage;
import com.android.camera.effect.framework.utils.CounterUtil;
import com.android.camera.log.Log;
import com.android.camera.storage.ImageSaver;
import com.android.camera.storage.Storage;
import com.android.camera.watermark.WaterMarkBitmap;
import com.android.camera.watermark.WaterMarkData;
import com.android.gallery3d.exif.ExifInterface;
import com.android.gallery3d.ui.BaseGLCanvas;
import com.mi.config.b;
import com.ss.android.ttve.common.TEDefine;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class SnapshotEffectRender {
    private static final int DEFAULT_BLOCK_HEIGHT = 1500;
    private static final int DEFAULT_BLOCK_WIDTH = 4000;
    private static final int QUEUE_LIMIT = 7;
    /* access modifiers changed from: private */
    public static final String TAG = SnapshotEffectRender.class.getSimpleName();
    /* access modifiers changed from: private */
    public Bitmap m48MCameraWaterMarkBitmap;
    /* access modifiers changed from: private */
    public ActivityBase mActivity;
    /* access modifiers changed from: private */
    public int mBlockHeight;
    /* access modifiers changed from: private */
    public int mBlockWidth;
    /* access modifiers changed from: private */
    public String mCurrentCustomWaterMarkText;
    /* access modifiers changed from: private */
    public Bitmap mDualCameraWaterMarkBitmap;
    /* access modifiers changed from: private */
    public float mDualCameraWaterMarkPaddingXRatio;
    /* access modifiers changed from: private */
    public float mDualCameraWaterMarkPaddingYRatio;
    /* access modifiers changed from: private */
    public float mDualCameraWaterMarkSizeRatio;
    /* access modifiers changed from: private */
    public EglCore mEglCore;
    private EGLHandler mEglHandler;
    private HandlerThread mEglThread;
    /* access modifiers changed from: private */
    public ConditionVariable mEglThreadBlockVar = new ConditionVariable();
    private boolean mExifNeeded = true;
    /* access modifiers changed from: private */
    public FrameBuffer mFrameBuffer;
    /* access modifiers changed from: private */
    public CounterUtil mFrameCounter;
    /* access modifiers changed from: private */
    public SnapshotCanvas mGLCanvas;
    /* access modifiers changed from: private */
    public GraphicBuffer mGraphicBuffer;
    /* access modifiers changed from: private */
    public ImageSaver mImageSaver;
    /* access modifiers changed from: private */
    public boolean mInitGraphicBuffer;
    private boolean mIsImageCaptureIntent;
    /* access modifiers changed from: private */
    public volatile int mJpegQueueSize = 0;
    /* access modifiers changed from: private */
    public final Object mLock = new Object();
    /* access modifiers changed from: private */
    public MemImage mMemImage;
    /* access modifiers changed from: private */
    public int mQuality = 97;
    private boolean mRelease;
    /* access modifiers changed from: private */
    public boolean mReleasePending;
    /* access modifiers changed from: private */
    public CounterUtil mRenderCounter;
    /* access modifiers changed from: private */
    public PbufferSurface mRenderSurface;
    /* access modifiers changed from: private */
    public Splitter mSplitter;
    /* access modifiers changed from: private */
    public int mSquareModeExtraMargin;
    /* access modifiers changed from: private */
    public int mTextureId;
    /* access modifiers changed from: private */
    public Map<String, String> mTitleMap = new HashMap(7);
    /* access modifiers changed from: private */
    public CounterUtil mTotalCounter;

    private class EGLHandler extends Handler {
        public static final int MSG_DRAW_MAIN_ASYNC = 1;
        public static final int MSG_DRAW_MAIN_SYNC = 2;
        public static final int MSG_DRAW_THUMB = 4;
        public static final int MSG_GET_DRAW_THUMB = 3;
        public static final int MSG_INIT_EGL_SYNC = 0;
        public static final int MSG_PREPARE_EFFECT_RENDER = 6;
        public static final int MSG_RELEASE = 5;

        public EGLHandler(Looper looper) {
            super(looper);
        }

        private byte[] applyEffect(DrawJPEGAttribute drawJPEGAttribute, int i, boolean z, Size size, Size size2) {
            int i2;
            int i3;
            int i4;
            int i5;
            int i6;
            int[] iArr;
            byte[] bArr;
            byte[] bArr2;
            int[] iArr2;
            DrawJPEGAttribute drawJPEGAttribute2 = drawJPEGAttribute;
            boolean z2 = z;
            Size size3 = size;
            Size size4 = size2;
            SnapshotEffectRender.this.mRenderSurface.makeCurrent();
            String access$2200 = SnapshotEffectRender.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("applyEffect: applyToThumb = ");
            sb.append(z2);
            Log.d(access$2200, sb.toString());
            byte[] thumbnailBytes = z2 ? drawJPEGAttribute2.mExif.getThumbnailBytes() : drawJPEGAttribute2.mData;
            if (thumbnailBytes == null) {
                String access$22002 = SnapshotEffectRender.TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Null ");
                sb2.append(z2 ? "thumb!" : "jpeg!");
                Log.w(access$22002, sb2.toString());
                return null;
            } else if (!z2 && drawJPEGAttribute2.mEffectIndex == FilterInfo.FILTER_ID_NONE && !CameraSettings.isAgeGenderAndMagicMirrorWaterOpen() && !CameraSettings.isGradienterOn() && !CameraSettings.isTiltShiftOn()) {
                return applyEffectOnlyWatermarkRange(drawJPEGAttribute2, size3, size4);
            } else {
                CounterUtil counterUtil = new CounterUtil();
                counterUtil.reset("init Texture");
                int[] iArr3 = new int[1];
                GLES20.glGenTextures(1, iArr3, 0);
                int[] initTexture = ShaderNativeUtil.initTexture(thumbnailBytes, iArr3[0], i);
                counterUtil.tick("init Texture");
                int i7 = initTexture[0];
                int i8 = initTexture[1];
                int i9 = z2 ? initTexture[0] : drawJPEGAttribute2.mPreviewWidth;
                int i10 = z2 ? initTexture[1] : drawJPEGAttribute2.mPreviewHeight;
                Render effectRender = getEffectRender(drawJPEGAttribute2.mEffectIndex);
                if (effectRender == null) {
                    Log.w(SnapshotEffectRender.TAG, "init render failed");
                    return thumbnailBytes;
                }
                if (effectRender instanceof PipeRender) {
                    ((PipeRender) effectRender).setFrameBufferSize(i7, i8);
                }
                effectRender.setPreviewSize(i9, i10);
                effectRender.setEffectRangeAttribute(drawJPEGAttribute2.mAttribute);
                effectRender.setMirror(drawJPEGAttribute2.mMirror);
                if (z2) {
                    effectRender.setSnapshotSize(i7, i8);
                } else {
                    effectRender.setSnapshotSize(size4.width, size4.height);
                }
                effectRender.setOrientation(drawJPEGAttribute2.mOrientation);
                effectRender.setShootRotation(drawJPEGAttribute2.mShootRotation);
                effectRender.setJpegOrientation(drawJPEGAttribute2.mJpegOrientation);
                checkFrameBuffer(i7, i8);
                SnapshotEffectRender.this.mGLCanvas.beginBindFrameBuffer(SnapshotEffectRender.this.mFrameBuffer);
                effectRender.setParentFrameBufferId(SnapshotEffectRender.this.mFrameBuffer.getId());
                DrawIntTexAttribute drawIntTexAttribute = new DrawIntTexAttribute(iArr3[0], 0, 0, i7, i8, true);
                effectRender.draw(drawIntTexAttribute);
                effectRender.deleteBuffer();
                int i11 = i8;
                int i12 = i7;
                int[] iArr4 = iArr3;
                CounterUtil counterUtil2 = counterUtil;
                drawAgeGenderAndMagicMirrorWater(drawJPEGAttribute2.mWaterInfos, i7, i8, 0, 0, i9, i10, drawJPEGAttribute2.mJpegOrientation, drawJPEGAttribute2.mIsPortraitRawData);
                if (drawJPEGAttribute2.mRequestModuleIdx == 165) {
                    int i13 = i12;
                    if (i13 > i11) {
                        i2 = ((i13 - i11) / 2) - ((SnapshotEffectRender.this.mSquareModeExtraMargin * i11) / Util.sWindowWidth);
                        i3 = i11;
                        i4 = 0;
                    } else {
                        i3 = i13;
                        i11 = i3;
                        i4 = ((i11 - i13) / 2) - ((SnapshotEffectRender.this.mSquareModeExtraMargin * i13) / Util.sWindowWidth);
                        i2 = 0;
                    }
                } else {
                    i3 = i11;
                    i2 = 0;
                    i4 = 0;
                    i11 = i12;
                }
                if (!z2) {
                    drawJPEGAttribute2.mWidth = i11;
                    drawJPEGAttribute2.mHeight = i3;
                } else if (size3 != null) {
                    size3.width = i11;
                    size3.height = i3;
                    String access$22003 = SnapshotEffectRender.TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("thumbSize=");
                    sb3.append(size3.width);
                    sb3.append("*");
                    sb3.append(size3.height);
                    Log.d(access$22003, sb3.toString());
                }
                if (drawJPEGAttribute2.mApplyWaterMark) {
                    if (!z2) {
                        int[] watermarkRange = Util.getWatermarkRange(i11, i3, (drawJPEGAttribute2.mJpegOrientation + 270) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT, drawJPEGAttribute2.mDualCameraWaterMarkEnabled, drawJPEGAttribute2.mTimeWaterMarkText != null, 0.11f);
                        i6 = 0;
                        iArr2 = watermarkRange;
                        bArr2 = ShaderNativeUtil.getPicture(watermarkRange[0] + i2, watermarkRange[1] + i4, watermarkRange[2], watermarkRange[3], SnapshotEffectRender.this.mQuality);
                    } else {
                        i6 = 0;
                        iArr2 = null;
                        bArr2 = null;
                    }
                    DrawJPEGAttribute drawJPEGAttribute3 = drawJPEGAttribute2;
                    int i14 = i2;
                    int i15 = i11;
                    int i16 = i3;
                    i5 = i4;
                    drawTimeWaterMark(drawJPEGAttribute3, i14, i4, i15, i16, drawJPEGAttribute2.mJpegOrientation, null);
                    drawDoubleShotWaterMark(drawJPEGAttribute3, i14, i5, i15, i16, drawJPEGAttribute2.mJpegOrientation, null);
                    iArr = iArr2;
                    bArr = bArr2;
                } else {
                    i5 = i4;
                    i6 = 0;
                    bArr = null;
                    iArr = null;
                }
                CounterUtil counterUtil3 = counterUtil2;
                counterUtil3.tick("draw");
                GLES20.glPixelStorei(3333, 1);
                int access$2400 = SnapshotEffectRender.this.mQuality;
                if (z2) {
                    access$2400 = Math.min(SnapshotEffectRender.this.mQuality, JpegEncodingQualityMappings.getQualityNumber("normal"));
                }
                byte[] picture = ShaderNativeUtil.getPicture(i2, i5, i11, i3, access$2400);
                counterUtil3.tick("readpixels");
                int[] iArr5 = iArr4;
                if (GLES20.glIsTexture(iArr5[i6])) {
                    GLES20.glDeleteTextures(1, iArr5, i6);
                }
                SnapshotEffectRender.this.mGLCanvas.endBindFrameBuffer();
                SnapshotEffectRender.this.mRenderSurface.makeNothingCurrent();
                drawJPEGAttribute2.mDataOfTheRegionUnderWatermarks = bArr;
                drawJPEGAttribute2.mCoordinatesOfTheRegionUnderWatermarks = iArr;
                return picture;
            }
        }

        private byte[] applyEffectOnlyWatermarkRange(DrawJPEGAttribute drawJPEGAttribute, Size size, Size size2) {
            int i;
            int i2;
            int i3;
            int i4;
            DrawJPEGAttribute drawJPEGAttribute2 = drawJPEGAttribute;
            Size size3 = size2;
            if (!drawJPEGAttribute2.mApplyWaterMark) {
                return drawJPEGAttribute2.mData;
            }
            long currentTimeMillis = System.currentTimeMillis();
            int[] decompressPicture = ShaderNativeUtil.decompressPicture(drawJPEGAttribute2.mData, 1);
            String access$2200 = SnapshotEffectRender.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("jpeg decompress total time =");
            sb.append(System.currentTimeMillis() - currentTimeMillis);
            Log.d(access$2200, sb.toString());
            int i5 = drawJPEGAttribute2.mPreviewWidth;
            int i6 = drawJPEGAttribute2.mPreviewHeight;
            int i7 = decompressPicture[0];
            int i8 = decompressPicture[1];
            if (drawJPEGAttribute2.mRequestModuleIdx != 165) {
                i2 = i8;
                i3 = i7;
                i4 = 0;
                i = 0;
            } else if (i7 > i8) {
                i3 = i8;
                i2 = i3;
                i = ((i7 - i8) / 2) - ((SnapshotEffectRender.this.mSquareModeExtraMargin * i8) / Util.sWindowWidth);
                i4 = 0;
            } else {
                i4 = ((i8 - i7) / 2) - ((SnapshotEffectRender.this.mSquareModeExtraMargin * i7) / Util.sWindowWidth);
                i3 = i7;
                i2 = i3;
                i = 0;
            }
            drawJPEGAttribute2.mWidth = i3;
            drawJPEGAttribute2.mHeight = i2;
            if (drawJPEGAttribute2.mRequestModuleIdx == 165 && !drawJPEGAttribute2.mDualCameraWaterMarkEnabled && drawJPEGAttribute2.mTimeWaterMarkText == null) {
                ShaderNativeUtil.getCenterSquareImage(i, i4);
                return ShaderNativeUtil.compressPicture(i3, i2, SnapshotEffectRender.this.mQuality);
            }
            int[] watermarkRange = Util.getWatermarkRange(drawJPEGAttribute2.mWidth, drawJPEGAttribute2.mHeight, (drawJPEGAttribute2.mJpegOrientation + 270) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT, drawJPEGAttribute2.mDualCameraWaterMarkEnabled, drawJPEGAttribute2.mTimeWaterMarkText != null, 0.11f);
            int i9 = watermarkRange[2];
            int i10 = watermarkRange[3];
            SnapshotEffectRender.this.mRenderSurface.makeCurrent();
            SnapshotEffectRender.this.mGraphicBuffer.reszieBuffer(i9, i10);
            SnapshotEffectRender.this.mBlockWidth = i9;
            SnapshotEffectRender.this.mBlockHeight = i10;
            long currentTimeMillis2 = System.currentTimeMillis();
            int[] iArr = {OpenGlUtils.genTexture()};
            int i11 = i2;
            int i12 = i3;
            byte[] jpegFromMemImage = ShaderNativeUtil.getJpegFromMemImage(watermarkRange[0] + i, watermarkRange[1] + i4, watermarkRange[2], watermarkRange[3], SnapshotEffectRender.this.mQuality);
            int i13 = (((watermarkRange[1] + i4) * i7) + watermarkRange[0] + i) * 3;
            ShaderNativeUtil.updateTextureWidthStride(iArr[0], i9, i10, i7, i13);
            String access$22002 = SnapshotEffectRender.TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("get pixel and upload total time =");
            int i14 = i4;
            sb2.append(System.currentTimeMillis() - currentTimeMillis2);
            Log.d(access$22002, sb2.toString());
            Render effectRender = getEffectRender(drawJPEGAttribute2.mEffectIndex);
            if (effectRender == null) {
                Log.w(SnapshotEffectRender.TAG, "init render failed");
                return drawJPEGAttribute2.mData;
            }
            effectRender.setPreviewSize(i5, i6);
            effectRender.setEffectRangeAttribute(drawJPEGAttribute2.mAttribute);
            effectRender.setMirror(drawJPEGAttribute2.mMirror);
            Size size4 = size2;
            effectRender.setSnapshotSize(size4.width, size4.height);
            effectRender.setOrientation(drawJPEGAttribute2.mOrientation);
            effectRender.setShootRotation(drawJPEGAttribute2.mShootRotation);
            effectRender.setJpegOrientation(drawJPEGAttribute2.mJpegOrientation);
            SnapshotEffectRender.this.mGLCanvas.beginBindFrameBuffer(SnapshotEffectRender.this.mGraphicBuffer.getFrameBufferId(), i9, i10);
            long currentTimeMillis3 = System.currentTimeMillis();
            PipeRender pipeRender = (PipeRender) effectRender;
            DrawIntTexAttribute drawIntTexAttribute = new DrawIntTexAttribute(iArr[0], 0, 0, i9, i10, true);
            pipeRender.drawOnExtraFrameBufferOnce(drawIntTexAttribute);
            effectRender.deleteBuffer();
            int i15 = -watermarkRange[0];
            int i16 = -watermarkRange[1];
            DrawJPEGAttribute drawJPEGAttribute3 = drawJPEGAttribute2;
            int i17 = i16;
            int i18 = i16;
            int i19 = i12;
            int i20 = i10;
            int i21 = i11;
            int i22 = i15;
            int[] iArr2 = iArr;
            byte[] bArr = jpegFromMemImage;
            int i23 = i14;
            Render render = effectRender;
            drawTimeWaterMark(drawJPEGAttribute3, i15, i17, i19, i21, drawJPEGAttribute2.mJpegOrientation, null);
            drawDoubleShotWaterMark(drawJPEGAttribute3, i22, i18, i19, i21, drawJPEGAttribute2.mJpegOrientation, null);
            String access$22003 = SnapshotEffectRender.TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("drawTime=");
            sb3.append(System.currentTimeMillis() - currentTimeMillis3);
            Log.d(access$22003, sb3.toString());
            render.deleteBuffer();
            GLES20.glFinish();
            if (drawJPEGAttribute2.mRequestModuleIdx == 165) {
                ShaderNativeUtil.getCenterSquareImage(i, i23);
                SnapshotEffectRender.this.mGraphicBuffer.readBuffer(i9, i20, ((watermarkRange[1] * i12) + watermarkRange[0]) * 3);
            } else {
                SnapshotEffectRender.this.mGraphicBuffer.readBuffer(i9, i20, i13);
            }
            long currentTimeMillis4 = System.currentTimeMillis();
            byte[] compressPicture = ShaderNativeUtil.compressPicture(i12, i11, SnapshotEffectRender.this.mQuality);
            String access$22004 = SnapshotEffectRender.TAG;
            StringBuilder sb4 = new StringBuilder();
            sb4.append("compress=");
            sb4.append(System.currentTimeMillis() - currentTimeMillis4);
            Log.d(access$22004, sb4.toString());
            if (GLES20.glIsTexture(iArr2[0])) {
                GLES20.glDeleteTextures(1, iArr2, 0);
            }
            SnapshotEffectRender.this.mGLCanvas.endBindFrameBuffer();
            SnapshotEffectRender.this.mRenderSurface.makeNothingCurrent();
            drawJPEGAttribute2.mDataOfTheRegionUnderWatermarks = bArr;
            drawJPEGAttribute2.mCoordinatesOfTheRegionUnderWatermarks = watermarkRange;
            return compressPicture;
        }

        /* JADX WARNING: Removed duplicated region for block: B:28:0x017b  */
        /* JADX WARNING: Removed duplicated region for block: B:33:0x01dc  */
        /* JADX WARNING: Removed duplicated region for block: B:37:0x01f2  */
        /* JADX WARNING: Removed duplicated region for block: B:46:0x0457  */
        /* JADX WARNING: Removed duplicated region for block: B:49:0x046b  */
        /* JADX WARNING: Removed duplicated region for block: B:52:0x048c  */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        private void blockSplitApplyEffect(DrawJPEGAttribute drawJPEGAttribute, int i, boolean z, Size size, Size size2) {
            int i2;
            int i3;
            int i4;
            int i5;
            int i6;
            int i7;
            RectF rectF;
            int[] iArr;
            int i8;
            DrawJPEGAttribute drawJPEGAttribute2;
            int i9;
            char c;
            DrawJPEGAttribute drawJPEGAttribute3 = drawJPEGAttribute;
            boolean z2 = z;
            Size size3 = size2;
            String access$2200 = SnapshotEffectRender.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("applyEffect: applyToThumb = ");
            sb.append(z2);
            Log.d(access$2200, sb.toString());
            byte[] thumbnailBytes = z2 ? drawJPEGAttribute3.mExif.getThumbnailBytes() : drawJPEGAttribute3.mData;
            if (thumbnailBytes == null) {
                String access$22002 = SnapshotEffectRender.TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Null ");
                sb2.append(z2 ? "thumb!" : "jpeg!");
                Log.w(access$22002, sb2.toString());
                return;
            }
            SnapshotEffectRender.this.mRenderSurface.makeCurrent();
            SnapshotEffectRender.this.mTextureId = OpenGlUtils.genTexture();
            SnapshotEffectRender.this.mMemImage.getPixelsFromJpg(thumbnailBytes);
            int i10 = SnapshotEffectRender.this.mMemImage.mWidth;
            int i11 = SnapshotEffectRender.this.mMemImage.mHeight;
            int i12 = drawJPEGAttribute3.mPreviewWidth;
            int i13 = drawJPEGAttribute3.mPreviewHeight;
            SnapshotEffectRender.this.mRenderCounter.reset("[NewEffectFramework]start");
            CounterUtil counterUtil = new CounterUtil();
            counterUtil.reset("local start");
            List split = SnapshotEffectRender.this.mSplitter.split(SnapshotEffectRender.this.mMemImage.mWidth, SnapshotEffectRender.this.mMemImage.mHeight, SnapshotEffectRender.this.mBlockWidth, SnapshotEffectRender.this.mBlockHeight);
            counterUtil.tick("local start setImageSettings");
            Render effectRender = getEffectRender(drawJPEGAttribute3.mEffectIndex);
            if (effectRender == null) {
                Log.w(SnapshotEffectRender.TAG, "init render failed");
                return;
            }
            effectRender.setPreviewSize(i12, i13);
            effectRender.setEffectRangeAttribute(drawJPEGAttribute3.mAttribute);
            effectRender.setMirror(drawJPEGAttribute3.mMirror);
            if (z2) {
                effectRender.setSnapshotSize(i10, i11);
            } else {
                effectRender.setSnapshotSize(size3.width, size3.height);
            }
            effectRender.setOrientation(drawJPEGAttribute3.mOrientation);
            effectRender.setShootRotation(drawJPEGAttribute3.mShootRotation);
            effectRender.setJpegOrientation(drawJPEGAttribute3.mJpegOrientation);
            counterUtil.tick("local start render");
            SnapshotEffectRender.this.mGLCanvas.beginBindFrameBuffer(SnapshotEffectRender.this.mGraphicBuffer.getFrameBufferId(), SnapshotEffectRender.this.mBlockWidth, SnapshotEffectRender.this.mBlockHeight);
            counterUtil.tick("local beginBindFrameBuffer");
            SnapshotEffectRender.this.mGLCanvas.getState().pushState();
            counterUtil.tick("local beginBindFrameBuffer");
            if (drawJPEGAttribute3.mRequestModuleIdx != 165) {
                i2 = i10;
                i3 = i11;
                i5 = 0;
            } else if (i10 > i11) {
                i4 = ((i10 - i11) / 2) - ((SnapshotEffectRender.this.mSquareModeExtraMargin * i11) / Util.sWindowWidth);
                i3 = i11;
                i2 = i3;
                i5 = 0;
                drawJPEGAttribute3.mWidth = i2;
                drawJPEGAttribute3.mHeight = i3;
                WaterMark waterMark = null;
                if (!drawJPEGAttribute3.mApplyWaterMark) {
                    i7 = i3;
                    int[] watermarkRange = Util.getWatermarkRange(drawJPEGAttribute3.mWidth, drawJPEGAttribute3.mHeight, (drawJPEGAttribute3.mJpegOrientation + 270) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT, drawJPEGAttribute3.mDualCameraWaterMarkEnabled, drawJPEGAttribute3.mTimeWaterMarkText != null, 0.11f);
                    i6 = i2;
                    RectF rectF2 = new RectF((float) (watermarkRange[0] + i4), (float) (watermarkRange[1] + i5), (float) (watermarkRange[0] + i4 + watermarkRange[2]), (float) (watermarkRange[1] + i5 + watermarkRange[3]));
                    ShaderNativeUtil.genWaterMarkRange(watermarkRange[0] + i4, watermarkRange[1] + i5, watermarkRange[2], watermarkRange[3]);
                    iArr = watermarkRange;
                    rectF = rectF2;
                } else {
                    i7 = i3;
                    i6 = i2;
                    iArr = null;
                    rectF = null;
                }
                RectF rectF3 = new RectF();
                WaterMark waterMark2 = null;
                i8 = 0;
                while (i8 < split.size()) {
                    int[] iArr2 = iArr;
                    SnapshotEffectRender.this.mFrameCounter.reset(String.format("[loop%d/%d]begin", new Object[]{Integer.valueOf(i8), Integer.valueOf(split.size())}));
                    Block block = (Block) split.get(i8);
                    int i14 = block.mWidth;
                    int i15 = block.mHeight;
                    RectF rectF4 = rectF;
                    int i16 = block.mRowStride;
                    int i17 = i13;
                    int i18 = block.mOffset;
                    int i19 = i12;
                    int i20 = SnapshotEffectRender.this.mMemImage.mChannels;
                    GLES20.glViewport(0, 0, i14, i15);
                    int i21 = i5;
                    GLES20.glClearColor(1.0f, 0.0f, 0.0f, 1.0f);
                    GLES20.glClear(16640);
                    int i22 = i4;
                    SnapshotEffectRender.this.mFrameCounter.tick(String.format("[loop%d/%d]gl predraw", new Object[]{Integer.valueOf(i8), Integer.valueOf(split.size())}));
                    int i23 = i18 * i20;
                    SnapshotEffectRender.this.mMemImage.textureWithStride(SnapshotEffectRender.this.mTextureId, i14, i15, i16, i23);
                    SnapshotEffectRender.this.mFrameCounter.tick(String.format("[loop%d/%d]gl uploadtexture textureId %d", new Object[]{Integer.valueOf(i8), Integer.valueOf(split.size()), Integer.valueOf(SnapshotEffectRender.this.mTextureId)}));
                    PipeRender pipeRender = (PipeRender) effectRender;
                    DrawIntTexAttribute drawIntTexAttribute = new DrawIntTexAttribute(SnapshotEffectRender.this.mTextureId, 0, 0, i14, i15, true);
                    pipeRender.drawOnExtraFrameBufferOnce(drawIntTexAttribute);
                    int[] offset = block.getOffset(i10, i11);
                    rectF3.left = (float) offset[0];
                    rectF3.top = (float) offset[1];
                    rectF3.right = (float) (offset[0] + i14);
                    rectF3.bottom = (float) (offset[1] + i15);
                    int i24 = i22 - offset[0];
                    int i25 = i21 - offset[1];
                    SnapshotEffectRender.this.mGLCanvas.getState().pushState();
                    DrawJPEGAttribute drawJPEGAttribute4 = drawJPEGAttribute;
                    int i26 = i10;
                    int i27 = i21;
                    int i28 = i11;
                    DrawJPEGAttribute drawJPEGAttribute5 = drawJPEGAttribute4;
                    int i29 = i22;
                    int i30 = i7;
                    int i31 = i23;
                    int i32 = i6;
                    int i33 = i8;
                    int i34 = i15;
                    RectF rectF5 = rectF3;
                    int[] iArr3 = iArr2;
                    int i35 = i14;
                    RectF rectF6 = rectF4;
                    Render render = effectRender;
                    List list = split;
                    drawAgeGenderAndMagicMirrorWater(drawJPEGAttribute4.mWaterInfos, i24, i25, i32, i30, i19, i17, drawJPEGAttribute4.mJpegOrientation, drawJPEGAttribute4.mIsPortraitRawData);
                    if (drawJPEGAttribute5.mApplyWaterMark) {
                        if (rectangle_collision(rectF5.left, rectF5.top, rectF5.width(), rectF5.height(), rectF6.left, rectF6.top, rectF6.width(), rectF6.height())) {
                            float[] intersectRect = getIntersectRect(rectF5.left, rectF5.top, rectF5.right, rectF5.bottom, rectF6.left, rectF6.top, rectF6.right, rectF6.bottom);
                            c = 1;
                            i9 = 2;
                            ShaderNativeUtil.mergeWaterMarkRange((int) intersectRect[0], (int) intersectRect[1], (int) (intersectRect[2] - intersectRect[0]), (int) (intersectRect[3] - intersectRect[1]), offset[0], offset[1]);
                            DrawJPEGAttribute drawJPEGAttribute6 = drawJPEGAttribute5;
                            int i36 = i24;
                            int i37 = i25;
                            int i38 = i32;
                            int i39 = i30;
                            waterMark = drawTimeWaterMark(drawJPEGAttribute6, i36, i37, i38, i39, drawJPEGAttribute5.mJpegOrientation, waterMark);
                            waterMark2 = drawDoubleShotWaterMark(drawJPEGAttribute6, i36, i37, i38, i39, drawJPEGAttribute5.mJpegOrientation, waterMark2);
                            SnapshotEffectRender.this.mGLCanvas.getState().popState();
                            Object[] objArr = new Object[i9];
                            int i40 = i33;
                            objArr[0] = Integer.valueOf(i40);
                            List list2 = list;
                            objArr[c] = Integer.valueOf(list2.size());
                            SnapshotEffectRender.this.mFrameCounter.tick(String.format("[loop%d/%d]gl gldraw", objArr));
                            GLES20.glFinish();
                            SnapshotEffectRender.this.mGraphicBuffer.readBuffer(i35, i34, i31);
                            Object[] objArr2 = new Object[i9];
                            objArr2[0] = Integer.valueOf(i40);
                            objArr2[c] = Integer.valueOf(list2.size());
                            SnapshotEffectRender.this.mFrameCounter.tick(String.format("[loop%d/%d]gl readPixelAndMerge", objArr2));
                            i8 = i40 + 1;
                            split = list2;
                            rectF = rectF6;
                            rectF3 = rectF5;
                            drawJPEGAttribute3 = drawJPEGAttribute5;
                            effectRender = render;
                            i7 = i30;
                            i6 = i32;
                            i13 = i17;
                            i12 = i19;
                            i10 = i26;
                            i11 = i28;
                            i5 = i27;
                            i4 = i29;
                            iArr = iArr3;
                        }
                    }
                    c = 1;
                    i9 = 2;
                    SnapshotEffectRender.this.mGLCanvas.getState().popState();
                    Object[] objArr3 = new Object[i9];
                    int i402 = i33;
                    objArr3[0] = Integer.valueOf(i402);
                    List list22 = list;
                    objArr3[c] = Integer.valueOf(list22.size());
                    SnapshotEffectRender.this.mFrameCounter.tick(String.format("[loop%d/%d]gl gldraw", objArr3));
                    GLES20.glFinish();
                    SnapshotEffectRender.this.mGraphicBuffer.readBuffer(i35, i34, i31);
                    Object[] objArr22 = new Object[i9];
                    objArr22[0] = Integer.valueOf(i402);
                    objArr22[c] = Integer.valueOf(list22.size());
                    SnapshotEffectRender.this.mFrameCounter.tick(String.format("[loop%d/%d]gl readPixelAndMerge", objArr22));
                    i8 = i402 + 1;
                    split = list22;
                    rectF = rectF6;
                    rectF3 = rectF5;
                    drawJPEGAttribute3 = drawJPEGAttribute5;
                    effectRender = render;
                    i7 = i30;
                    i6 = i32;
                    i13 = i17;
                    i12 = i19;
                    i10 = i26;
                    i11 = i28;
                    i5 = i27;
                    i4 = i29;
                    iArr = iArr3;
                }
                int i41 = i5;
                int i42 = i4;
                int[] iArr4 = iArr;
                drawJPEGAttribute2 = drawJPEGAttribute3;
                if (GLES20.glIsTexture(SnapshotEffectRender.this.mTextureId)) {
                    GLES20.glDeleteTextures(1, new int[]{SnapshotEffectRender.this.mTextureId}, 0);
                }
                if (drawJPEGAttribute2.mRequestModuleIdx == 165) {
                    ShaderNativeUtil.getCenterSquareImage(i42, i41);
                }
                SnapshotEffectRender.this.mGLCanvas.getState().popState();
                SnapshotEffectRender.this.mRenderSurface.makeNothingCurrent();
                if (drawJPEGAttribute2.mApplyWaterMark) {
                    drawJPEGAttribute2.mDataOfTheRegionUnderWatermarks = ShaderNativeUtil.getWaterMarkRange(SnapshotEffectRender.this.mQuality);
                    drawJPEGAttribute2.mCoordinatesOfTheRegionUnderWatermarks = iArr4;
                }
            } else {
                i5 = ((i11 - i10) / 2) - ((SnapshotEffectRender.this.mSquareModeExtraMargin * i10) / Util.sWindowWidth);
                i3 = i10;
                i2 = i3;
            }
            i4 = 0;
            drawJPEGAttribute3.mWidth = i2;
            drawJPEGAttribute3.mHeight = i3;
            WaterMark waterMark3 = null;
            if (!drawJPEGAttribute3.mApplyWaterMark) {
            }
            RectF rectF32 = new RectF();
            WaterMark waterMark22 = null;
            i8 = 0;
            while (i8 < split.size()) {
            }
            int i412 = i5;
            int i422 = i4;
            int[] iArr42 = iArr;
            drawJPEGAttribute2 = drawJPEGAttribute3;
            if (GLES20.glIsTexture(SnapshotEffectRender.this.mTextureId)) {
            }
            if (drawJPEGAttribute2.mRequestModuleIdx == 165) {
            }
            SnapshotEffectRender.this.mGLCanvas.getState().popState();
            SnapshotEffectRender.this.mRenderSurface.makeNothingCurrent();
            if (drawJPEGAttribute2.mApplyWaterMark) {
            }
        }

        private void checkFrameBuffer(int i, int i2) {
            if (SnapshotEffectRender.this.mFrameBuffer == null || SnapshotEffectRender.this.mFrameBuffer.getWidth() < i || SnapshotEffectRender.this.mFrameBuffer.getHeight() < i2) {
                SnapshotEffectRender.this.mFrameBuffer = null;
                SnapshotEffectRender.this.mFrameBuffer = new FrameBuffer(SnapshotEffectRender.this.mGLCanvas, i, i2, 0);
            }
        }

        private void drawAgeGenderAndMagicMirrorWater(List<WaterMarkData> list, int i, int i2, int i3, int i4, int i5, int i6, int i7, boolean z) {
            if (b.hJ() && !z && CameraSettings.isAgeGenderAndMagicMirrorWaterOpen()) {
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

        private WaterMark drawDoubleShotWaterMark(DrawJPEGAttribute drawJPEGAttribute, int i, int i2, int i3, int i4, int i5, WaterMark waterMark) {
            if (!b.hJ()) {
                return null;
            }
            if (waterMark != null) {
                drawWaterMark(waterMark, i, i2, i5);
                return waterMark;
            } else if (!drawJPEGAttribute.mDualCameraWaterMarkEnabled || SnapshotEffectRender.this.mDualCameraWaterMarkBitmap == null) {
                return null;
            } else {
                if (!SnapshotEffectRender.this.mCurrentCustomWaterMarkText.equals(CameraSettings.getCustomWatermark())) {
                    SnapshotEffectRender.this.mCurrentCustomWaterMarkText = CameraSettings.getCustomWatermark();
                    SnapshotEffectRender.this.mDualCameraWaterMarkBitmap = SnapshotEffectRender.this.loadCameraWatermark(SnapshotEffectRender.this.mActivity);
                }
                Bitmap access$1400 = SnapshotEffectRender.this.mDualCameraWaterMarkBitmap;
                boolean equals = CameraSettings.getCustomWatermark().equals(CameraSettings.getDefaultWatermarkStr());
                if (CameraSettings.isUltraPixelRear48MPOn() && !DataRepository.dataItemFeature().ga() && equals) {
                    if (SnapshotEffectRender.this.m48MCameraWaterMarkBitmap == null) {
                        SnapshotEffectRender.this.m48MCameraWaterMarkBitmap = SnapshotEffectRender.this.load48MWatermark(SnapshotEffectRender.this.mActivity);
                    }
                    if (SnapshotEffectRender.this.m48MCameraWaterMarkBitmap != null) {
                        access$1400 = SnapshotEffectRender.this.m48MCameraWaterMarkBitmap;
                    }
                }
                ImageWaterMark imageWaterMark = new ImageWaterMark(access$1400, i3, i4, i5, SnapshotEffectRender.this.mDualCameraWaterMarkSizeRatio, SnapshotEffectRender.this.mDualCameraWaterMarkPaddingXRatio, SnapshotEffectRender.this.mDualCameraWaterMarkPaddingYRatio);
                drawWaterMark(imageWaterMark, i, i2, i5);
                return imageWaterMark;
            }
        }

        private boolean drawMainJpeg(DrawJPEGAttribute drawJPEGAttribute, boolean z, boolean z2) {
            Size size = new Size(drawJPEGAttribute.mWidth, drawJPEGAttribute.mHeight);
            int i = 1;
            while (true) {
                if (drawJPEGAttribute.mWidth <= BaseGLCanvas.sMaxTextureSize && drawJPEGAttribute.mHeight <= BaseGLCanvas.sMaxTextureSize) {
                    break;
                }
                drawJPEGAttribute.mWidth /= 2;
                drawJPEGAttribute.mHeight /= 2;
                i *= 2;
            }
            Log.d(SnapshotEffectRender.TAG, String.format(Locale.US, "downScale: %d width: %d %d parallel: %b", new Object[]{Integer.valueOf(i), Integer.valueOf(drawJPEGAttribute.mWidth), Integer.valueOf(drawJPEGAttribute.mPreviewWidth), Boolean.valueOf(z2)}));
            if (drawJPEGAttribute.mEffectIndex == FilterInfo.FILTER_ID_NONE && !CameraSettings.isAgeGenderAndMagicMirrorWaterOpen() && !CameraSettings.isGradienterOn() && !CameraSettings.isTiltShiftOn()) {
                return saveMainJpeg(drawJPEGAttribute, z, z2, applyEffectOnlyWatermarkRange(drawJPEGAttribute, null, size));
            }
            if (CameraSettings.isGradienterOn() || CameraSettings.isTiltShiftOn()) {
                saveMainJpeg(drawJPEGAttribute, false, z2, applyEffect(drawJPEGAttribute, i, false, null, size));
            } else {
                blockSplitApplyEffect(drawJPEGAttribute, i, false, null, size);
                SnapshotEffectRender.this.mRenderCounter.tick("[NewEffectFramework] done");
                saveMainJpeg(drawJPEGAttribute, false, z2, SnapshotEffectRender.this.mMemImage.encodeJpeg(SnapshotEffectRender.this.mQuality, drawJPEGAttribute.mWidth, drawJPEGAttribute.mHeight));
            }
            SnapshotEffectRender.this.mTotalCounter.tick("TOTAL finish");
            return true;
        }

        private boolean drawThumbJpeg(DrawJPEGAttribute drawJPEGAttribute, boolean z) {
            DrawJPEGAttribute drawJPEGAttribute2 = drawJPEGAttribute;
            if (drawJPEGAttribute2.mExif == null) {
                drawJPEGAttribute2.mExif = SnapshotEffectRender.this.getExif(drawJPEGAttribute2);
                if (!TextUtils.isEmpty(drawJPEGAttribute2.mAlgorithmName)) {
                    drawJPEGAttribute2.mExif.addAlgorithmComment(drawJPEGAttribute2.mAlgorithmName);
                }
            }
            Size size = new Size();
            byte[] applyEffect = applyEffect(drawJPEGAttribute2, 1, true, size, null);
            String access$2200 = SnapshotEffectRender.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("drawThumbJpeg: thumbLen=");
            sb.append(applyEffect == null ? TEDefine.FACE_BEAUTY_NULL : Integer.valueOf(applyEffect.length));
            Log.d(access$2200, sb.toString());
            if (applyEffect != null) {
                drawJPEGAttribute2.mExif.setCompressedThumbnail(applyEffect);
            }
            boolean z2 = drawJPEGAttribute2.mJpegOrientation != 0;
            if (z && drawJPEGAttribute2.mExif.getThumbnailBytes() != null) {
                drawJPEGAttribute2.mUri = Storage.addImage(SnapshotEffectRender.this.mActivity, drawJPEGAttribute2.mTitle, drawJPEGAttribute2.mDate, drawJPEGAttribute2.mLoc, drawJPEGAttribute2.mJpegOrientation, drawJPEGAttribute2.mExif.getThumbnailBytes(), size.width, size.height, false, false, false, z2, false, drawJPEGAttribute2.mAlgorithmName, null);
                if (drawJPEGAttribute2.mUri != null) {
                    SnapshotEffectRender.this.mActivity.onNewUriArrived(drawJPEGAttribute2.mUri, drawJPEGAttribute2.mTitle);
                }
            }
            return true;
        }

        private WaterMark drawTimeWaterMark(DrawJPEGAttribute drawJPEGAttribute, int i, int i2, int i3, int i4, int i5, WaterMark waterMark) {
            if (!b.hJ()) {
                return null;
            }
            if (waterMark != null) {
                drawWaterMark(waterMark, i, i2, i5);
                return waterMark;
            } else if (drawJPEGAttribute.mTimeWaterMarkText == null || waterMark != null) {
                return null;
            } else {
                String str = drawJPEGAttribute.mTimeWaterMarkText;
                WaterMark newStyleTextWaterMark = b.gT() ? new NewStyleTextWaterMark(str, i3, i4, i5) : new TextWaterMark(str, i3, i4, i5);
                drawWaterMark(newStyleTextWaterMark, i, i2, i5);
                return newStyleTextWaterMark;
            }
        }

        private void drawWaterMark(DrawJPEGAttribute drawJPEGAttribute, int i, int i2, int i3, int i4, int i5, int i6, int i7) {
            DrawJPEGAttribute drawJPEGAttribute2 = drawJPEGAttribute;
            int i8 = i;
            int i9 = i2;
            int i10 = i3;
            int i11 = i4;
            int i12 = i7;
            if (b.hJ()) {
                if (drawJPEGAttribute2.mTimeWaterMarkText != null) {
                    String str = drawJPEGAttribute2.mTimeWaterMarkText;
                    WaterMark newStyleTextWaterMark = b.gT() ? new NewStyleTextWaterMark(str, i10, i11, i12) : new TextWaterMark(str, i10, i11, i12);
                    drawWaterMark(newStyleTextWaterMark, i8, i9, i12);
                    int id = newStyleTextWaterMark.getTexture().getId();
                    if (GLES20.glIsTexture(id)) {
                        GLES20.glDeleteTextures(1, new int[]{id}, 0);
                    }
                }
                if (drawJPEGAttribute2.mDualCameraWaterMarkEnabled && SnapshotEffectRender.this.mDualCameraWaterMarkBitmap != null) {
                    if (!SnapshotEffectRender.this.mCurrentCustomWaterMarkText.equals(CameraSettings.getCustomWatermark())) {
                        SnapshotEffectRender.this.mCurrentCustomWaterMarkText = CameraSettings.getCustomWatermark();
                        SnapshotEffectRender.this.mDualCameraWaterMarkBitmap = SnapshotEffectRender.this.loadCameraWatermark(SnapshotEffectRender.this.mActivity);
                    }
                    Bitmap access$1400 = SnapshotEffectRender.this.mDualCameraWaterMarkBitmap;
                    boolean equals = CameraSettings.getCustomWatermark().equals(CameraSettings.getDefaultWatermarkStr());
                    if (CameraSettings.isUltraPixelRear48MPOn() && !DataRepository.dataItemFeature().ga() && equals) {
                        if (SnapshotEffectRender.this.m48MCameraWaterMarkBitmap == null) {
                            SnapshotEffectRender.this.m48MCameraWaterMarkBitmap = SnapshotEffectRender.this.load48MWatermark(SnapshotEffectRender.this.mActivity);
                        }
                        if (SnapshotEffectRender.this.m48MCameraWaterMarkBitmap != null) {
                            access$1400 = SnapshotEffectRender.this.m48MCameraWaterMarkBitmap;
                        }
                    }
                    ImageWaterMark imageWaterMark = new ImageWaterMark(access$1400, i10, i11, i12, SnapshotEffectRender.this.mDualCameraWaterMarkSizeRatio, SnapshotEffectRender.this.mDualCameraWaterMarkPaddingXRatio, SnapshotEffectRender.this.mDualCameraWaterMarkPaddingYRatio);
                    drawWaterMark(imageWaterMark, i8, i9, i12);
                    int id2 = imageWaterMark.getTexture().getId();
                    if (GLES20.glIsTexture(id2)) {
                        GLES20.glDeleteTextures(1, new int[]{id2}, 0);
                    }
                }
            }
        }

        private void drawWaterMark(WaterMark waterMark, int i, int i2, int i3) {
            SnapshotEffectRender.this.mGLCanvas.getState().pushState();
            if (i3 != 0) {
                SnapshotEffectRender.this.mGLCanvas.getState().translate((float) (waterMark.getCenterX() + i), (float) (waterMark.getCenterY() + i2));
                SnapshotEffectRender.this.mGLCanvas.getState().rotate((float) (-i3), 0.0f, 0.0f, 1.0f);
                SnapshotEffectRender.this.mGLCanvas.getState().translate((float) ((-i) - waterMark.getCenterX()), (float) ((-i2) - waterMark.getCenterY()));
            }
            int left = i + waterMark.getLeft();
            int top = i2 + waterMark.getTop();
            BasicRender basicRender = SnapshotEffectRender.this.mGLCanvas.getBasicRender();
            DrawBasicTexAttribute drawBasicTexAttribute = new DrawBasicTexAttribute(waterMark.getTexture(), left, top, waterMark.getWidth(), waterMark.getHeight());
            basicRender.draw(drawBasicTexAttribute);
            SnapshotEffectRender.this.mGLCanvas.getState().popState();
        }

        private Render fetchRender(int i) {
            RenderGroup effectRenderGroup = SnapshotEffectRender.this.mGLCanvas.getEffectRenderGroup();
            Render render = effectRenderGroup.getRender(i);
            if (render != null) {
                return render;
            }
            SnapshotEffectRender.this.mGLCanvas.prepareEffectRenders(false, i);
            return effectRenderGroup.getRender(i);
        }

        private Render getEffectRender(int i) {
            PipeRender pipeRender = new PipeRender(SnapshotEffectRender.this.mGLCanvas);
            if (i != FilterInfo.FILTER_ID_NONE) {
                Render fetchRender = fetchRender(i);
                if (fetchRender != null) {
                    pipeRender.addRender(fetchRender);
                }
            }
            if (CameraSettings.isGradienterOn()) {
                Render fetchRender2 = fetchRender(FilterInfo.FILTER_ID_GRADIENTER);
                if (fetchRender2 != null) {
                    pipeRender.addRender(fetchRender2);
                }
            } else if (CameraSettings.isTiltShiftOn()) {
                Render render = null;
                String componentValue = DataRepository.dataItemRunning().getComponentRunningTiltValue().getComponentValue(160);
                if (ComponentRunningTiltValue.TILT_CIRCLE.equals(componentValue)) {
                    render = fetchRender(FilterInfo.FILTER_ID_GAUSSIAN);
                } else if (ComponentRunningTiltValue.TILT_PARALLEL.equals(componentValue)) {
                    render = fetchRender(FilterInfo.FILTER_ID_TILTSHIFT);
                }
                if (render != null) {
                    pipeRender.addRender(render);
                }
            }
            if (pipeRender.getRenderSize() == 0) {
                pipeRender.addRender(fetchRender(i));
            }
            return pipeRender;
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
            if (SnapshotEffectRender.this.mEglCore == null) {
                SnapshotEffectRender.this.mEglCore = new EglCore(eGLContext, 2);
            }
            if (z && SnapshotEffectRender.this.mRenderSurface != null) {
                SnapshotEffectRender.this.mRenderSurface.release();
                SnapshotEffectRender.this.mRenderSurface = null;
            }
            if (SnapshotEffectRender.this.mRenderSurface == null) {
                SnapshotEffectRender.this.mRenderSurface = new PbufferSurface(SnapshotEffectRender.this.mEglCore, 1, 1);
            }
            SnapshotEffectRender.this.mRenderSurface.makeCurrent();
        }

        private boolean rectangle_collision(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
            return f <= f7 + f5 && f + f3 >= f5 && f2 <= f8 + f6 && f2 + f4 >= f6;
        }

        private void release() {
            SnapshotEffectRender.this.mFrameBuffer = null;
            SnapshotEffectRender.this.mGLCanvas.recycledResources();
            SnapshotEffectRender.this.mGLCanvas = null;
            SnapshotEffectRender.this.destroy();
        }

        private boolean saveMainJpeg(DrawJPEGAttribute drawJPEGAttribute, boolean z, boolean z2, byte[] bArr) {
            String str;
            DrawJPEGAttribute drawJPEGAttribute2 = drawJPEGAttribute;
            byte[] bArr2 = bArr;
            String access$2200 = SnapshotEffectRender.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("mainLen=");
            sb.append(bArr2 == null ? TEDefine.FACE_BEAUTY_NULL : Integer.valueOf(bArr2.length));
            Log.d(access$2200, sb.toString());
            if (bArr2 != null) {
                drawJPEGAttribute2.mData = bArr2;
            }
            if (z) {
                synchronized (SnapshotEffectRender.this) {
                    str = (String) SnapshotEffectRender.this.mTitleMap.get(drawJPEGAttribute2.mTitle);
                    SnapshotEffectRender.this.mTitleMap.remove(drawJPEGAttribute2.mTitle);
                }
                String str2 = null;
                if (SnapshotEffectRender.this.mImageSaver != null) {
                    ImageSaver access$3200 = SnapshotEffectRender.this.mImageSaver;
                    byte[] bArr3 = drawJPEGAttribute2.mData;
                    boolean z3 = drawJPEGAttribute2.mNeedThumbnail;
                    String str3 = str == null ? drawJPEGAttribute2.mTitle : str;
                    if (str != null) {
                        str2 = drawJPEGAttribute2.mTitle;
                    }
                    access$3200.addImage(bArr3, z3, str3, str2, drawJPEGAttribute2.mDate, drawJPEGAttribute2.mUri, drawJPEGAttribute2.mLoc, drawJPEGAttribute2.mWidth, drawJPEGAttribute2.mHeight, drawJPEGAttribute2.mExif, drawJPEGAttribute2.mJpegOrientation, false, false, str == null ? drawJPEGAttribute2.mFinalImage : false, false, z2, drawJPEGAttribute2.mAlgorithmName, drawJPEGAttribute2.mInfo, drawJPEGAttribute2.mPreviewThumbnailHash);
                } else if (drawJPEGAttribute2.mUri == null) {
                    Log.d(SnapshotEffectRender.TAG, "addImageForEffect");
                    ActivityBase access$000 = SnapshotEffectRender.this.mActivity;
                    if (str == null) {
                        str = drawJPEGAttribute2.mTitle;
                    }
                    Storage.addImageForEffect(access$000, str, drawJPEGAttribute2.mDate, drawJPEGAttribute2.mLoc, drawJPEGAttribute2.mJpegOrientation, drawJPEGAttribute2.mData, drawJPEGAttribute2.mWidth, drawJPEGAttribute2.mHeight, false, z2, drawJPEGAttribute2.mAlgorithmName, drawJPEGAttribute2.mInfo);
                } else {
                    String access$22002 = SnapshotEffectRender.TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("updateImage: uri=");
                    sb2.append(drawJPEGAttribute2.mUri);
                    Log.d(access$22002, sb2.toString());
                    ActivityBase access$0002 = SnapshotEffectRender.this.mActivity;
                    byte[] bArr4 = drawJPEGAttribute2.mData;
                    ExifInterface exifInterface = drawJPEGAttribute2.mExif;
                    Uri uri = drawJPEGAttribute2.mUri;
                    String str4 = str == null ? drawJPEGAttribute2.mTitle : str;
                    Location location = drawJPEGAttribute2.mLoc;
                    int i = drawJPEGAttribute2.mJpegOrientation;
                    int i2 = drawJPEGAttribute2.mWidth;
                    int i3 = drawJPEGAttribute2.mHeight;
                    if (str != null) {
                        str2 = drawJPEGAttribute2.mTitle;
                    }
                    Storage.updateImage(access$0002, bArr4, exifInterface, uri, str4, location, i, i2, i3, str2);
                }
            } else if (drawJPEGAttribute2.mExif != null) {
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                try {
                    drawJPEGAttribute2.mExif.writeExif(drawJPEGAttribute2.mData, (OutputStream) byteArrayOutputStream);
                    byte[] byteArray = byteArrayOutputStream.toByteArray();
                    if (byteArray != null) {
                        drawJPEGAttribute2.mData = byteArray;
                    }
                    byteArrayOutputStream.close();
                } catch (IOException e) {
                    Log.e(SnapshotEffectRender.TAG, e.getMessage(), e);
                }
            }
            return true;
        }

        public void handleMessage(Message message) {
            if (SnapshotEffectRender.this.mActivity != null) {
                boolean z = false;
                switch (message.what) {
                    case 0:
                        initEGL(null, false);
                        SnapshotEffectRender.this.mGLCanvas = new SnapshotCanvas();
                        SnapshotEffectRender.this.mGraphicBuffer = new GraphicBuffer();
                        SnapshotEffectRender.this.mGLCanvas.setSize(SnapshotEffectRender.this.mActivity.getCameraScreenNail().getWidth(), SnapshotEffectRender.this.mActivity.getCameraScreenNail().getHeight());
                        SnapshotEffectRender.this.mEglThreadBlockVar.open();
                        break;
                    case 1:
                        DrawJPEGAttribute drawJPEGAttribute = (DrawJPEGAttribute) message.obj;
                        if (message.arg1 > 0) {
                            z = true;
                        }
                        drawMainJpeg(drawJPEGAttribute, true, z);
                        SnapshotEffectRender.this.mGLCanvas.recycledResources();
                        if (SnapshotEffectRender.this.mReleasePending && !hasMessages(1)) {
                            release();
                        }
                        synchronized (SnapshotEffectRender.this.mLock) {
                            SnapshotEffectRender.this.mJpegQueueSize = SnapshotEffectRender.this.mJpegQueueSize - 1;
                        }
                        break;
                    case 2:
                        DrawJPEGAttribute drawJPEGAttribute2 = (DrawJPEGAttribute) message.obj;
                        boolean z2 = message.arg1 > 0;
                        boolean z3 = message.arg2 > 0;
                        int access$700 = SnapshotEffectRender.this.mBlockWidth;
                        int access$800 = SnapshotEffectRender.this.mBlockHeight;
                        int access$900 = SnapshotEffectRender.this.calEachBlockHeight(drawJPEGAttribute2.mWidth, drawJPEGAttribute2.mHeight);
                        SnapshotEffectRender.this.mBlockWidth = drawJPEGAttribute2.mWidth;
                        SnapshotEffectRender.this.mBlockHeight = drawJPEGAttribute2.mHeight / access$900;
                        if (!(access$700 == SnapshotEffectRender.this.mBlockWidth && access$800 == SnapshotEffectRender.this.mBlockHeight) && SnapshotEffectRender.this.mInitGraphicBuffer) {
                            SnapshotEffectRender.this.mRenderSurface.makeCurrent();
                            SnapshotEffectRender.this.mGraphicBuffer.reszieBuffer(SnapshotEffectRender.this.mBlockWidth, SnapshotEffectRender.this.mBlockHeight);
                            SnapshotEffectRender.this.mRenderSurface.makeNothingCurrent();
                        } else {
                            SnapshotEffectRender.this.mRenderSurface.makeCurrent();
                            SnapshotEffectRender.this.mGraphicBuffer.initBuffer(SnapshotEffectRender.this.mBlockWidth, SnapshotEffectRender.this.mBlockHeight);
                            SnapshotEffectRender.this.mRenderSurface.makeNothingCurrent();
                            SnapshotEffectRender.this.mInitGraphicBuffer = true;
                        }
                        if (z2 && !z3) {
                            drawThumbJpeg(drawJPEGAttribute2, false);
                        }
                        SnapshotEffectRender.this.mTotalCounter.reset("TOTAL");
                        drawMainJpeg(drawJPEGAttribute2, false, z3);
                        SnapshotEffectRender.this.mRenderSurface.makeCurrent();
                        SnapshotEffectRender.this.mGLCanvas.recycledResources();
                        SnapshotEffectRender.this.mGraphicBuffer.release();
                        SnapshotEffectRender.this.mRenderSurface.makeNothingCurrent();
                        SnapshotEffectRender.this.mTotalCounter.tick("TOTAL");
                        SnapshotEffectRender.this.mEglThreadBlockVar.open();
                        break;
                    case 3:
                        drawThumbJpeg((DrawJPEGAttribute) message.obj, true);
                        break;
                    case 4:
                        drawThumbJpeg((DrawJPEGAttribute) message.obj, true);
                        SnapshotEffectRender.this.mEglThreadBlockVar.open();
                        break;
                    case 5:
                        release();
                        break;
                    case 6:
                        SnapshotEffectRender.this.mGLCanvas.prepareEffectRenders(false, message.arg1);
                        break;
                }
            }
        }

        public void sendMessageSync(int i) {
            SnapshotEffectRender.this.mEglThreadBlockVar.close();
            sendEmptyMessage(i);
            SnapshotEffectRender.this.mEglThreadBlockVar.block();
        }
    }

    private class Size {
        public int height;
        public int width;

        public Size() {
        }

        Size(int i, int i2) {
            this.width = i;
            this.height = i2;
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

    public SnapshotEffectRender(ActivityBase activityBase, boolean z) {
        Log.d(TAG, "SnapshotEffectRender: has been created!!!");
        this.mActivity = activityBase;
        this.mIsImageCaptureIntent = z;
        if (this.mMemImage == null) {
            this.mMemImage = new MemImage();
        }
        this.mFrameCounter = new CounterUtil();
        this.mTotalCounter = new CounterUtil();
        this.mRenderCounter = new CounterUtil();
        this.mEglThread = new HandlerThread("SnapshotEffectProcessor");
        this.mEglThread.start();
        this.mSplitter = new Splitter();
        this.mBlockWidth = 4000;
        this.mBlockHeight = DEFAULT_BLOCK_HEIGHT;
        this.mEglHandler = new EGLHandler(this.mEglThread.getLooper());
        this.mEglHandler.sendMessageSync(0);
        this.mRelease = false;
        this.mInitGraphicBuffer = false;
        if (CameraSettings.isSupportedDualCameraWaterMark()) {
            this.mDualCameraWaterMarkBitmap = loadCameraWatermark(activityBase);
            this.mCurrentCustomWaterMarkText = CameraSettings.getCustomWatermark();
            this.mDualCameraWaterMarkSizeRatio = getResourceFloat(R.dimen.dualcamera_watermark_size_ratio, 0.0f);
            this.mDualCameraWaterMarkPaddingXRatio = getResourceFloat(R.dimen.dualcamera_watermark_padding_x_ratio, 0.0f);
            this.mDualCameraWaterMarkPaddingYRatio = getResourceFloat(R.dimen.dualcamera_watermark_padding_y_ratio, 0.0f);
        }
        this.mSquareModeExtraMargin = this.mActivity.getResources().getDimensionPixelSize(R.dimen.square_mode_bottom_cover_extra_margin);
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
        this.mImageSaver = null;
        this.mRelease = true;
        this.mReleasePending = false;
        if (this.mGraphicBuffer != null) {
            this.mRenderSurface.makeCurrent();
            this.mGraphicBuffer.release();
            this.mRenderSurface.makeNothingCurrent();
            this.mGraphicBuffer = null;
        }
        if (this.mRenderSurface != null) {
            this.mRenderSurface.release();
            this.mRenderSurface = null;
        }
        if (this.mEglCore != null) {
            this.mEglCore.release();
            this.mEglCore = null;
        }
        this.mActivity = null;
        this.mEglThread.quit();
        if (this.mDualCameraWaterMarkBitmap != null && !this.mDualCameraWaterMarkBitmap.isRecycled()) {
            this.mDualCameraWaterMarkBitmap.recycle();
            this.mDualCameraWaterMarkBitmap = null;
        }
        System.gc();
        Log.d(TAG, "SnapshotEffectRender: has been released!!!");
    }

    /* access modifiers changed from: private */
    public ExifInterface getExif(DrawJPEGAttribute drawJPEGAttribute) {
        ExifInterface exifInterface = new ExifInterface();
        try {
            exifInterface.readExif(drawJPEGAttribute.mData);
            if (drawJPEGAttribute.mInfo != null) {
                exifInterface.addXiaomiComment(drawJPEGAttribute.mInfo.toString());
            }
        } catch (IOException e) {
            Log.d(TAG, e.getMessage());
        }
        return exifInterface;
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

    private void processorThumAsync(DrawJPEGAttribute drawJPEGAttribute) {
        if (this.mExifNeeded) {
            this.mEglHandler.obtainMessage(3, drawJPEGAttribute).sendToTarget();
        } else {
            drawJPEGAttribute.mUri = Storage.newImage(this.mActivity, drawJPEGAttribute.mTitle, drawJPEGAttribute.mDate, drawJPEGAttribute.mJpegOrientation, drawJPEGAttribute.mPreviewWidth, drawJPEGAttribute.mPreviewHeight);
        }
    }

    private boolean processorThumSync(DrawJPEGAttribute drawJPEGAttribute) {
        if (this.mExifNeeded) {
            drawJPEGAttribute.mExif = getExif(drawJPEGAttribute);
            if (!TextUtils.isEmpty(drawJPEGAttribute.mAlgorithmName)) {
                drawJPEGAttribute.mExif.addAlgorithmComment(drawJPEGAttribute.mAlgorithmName);
            }
            if (drawJPEGAttribute.mExif.getThumbnailBytes() != null) {
                this.mEglThreadBlockVar.close();
                this.mEglHandler.obtainMessage(4, drawJPEGAttribute).sendToTarget();
                this.mEglThreadBlockVar.block();
                return true;
            }
        }
        drawJPEGAttribute.mUri = Storage.newImage(this.mActivity, drawJPEGAttribute.mTitle, drawJPEGAttribute.mDate, drawJPEGAttribute.mJpegOrientation, drawJPEGAttribute.mPreviewWidth, drawJPEGAttribute.mPreviewHeight);
        return false;
    }

    public void changeJpegTitle(String str, String str2) {
        if (str2 != null && str2.length() != 0) {
            synchronized (this) {
                this.mTitleMap.put(str2, str);
            }
        }
    }

    public float getResourceFloat(int i, float f) {
        TypedValue typedValue = new TypedValue();
        try {
            this.mActivity.getResources().getValue(i, typedValue, true);
            return typedValue.getFloat();
        } catch (Exception e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Missing resource ");
            sb.append(Integer.toHexString(i));
            Log.e(str, sb.toString());
            return f;
        }
    }

    public boolean isRelease() {
        return this.mReleasePending || this.mRelease;
    }

    public void prepareEffectRender(int i) {
        this.mEglHandler.obtainMessage(6, i, 0).sendToTarget();
    }

    public boolean processorJpegAsync(DrawJPEGAttribute drawJPEGAttribute, boolean z) {
        boolean z2;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("queueSize=");
        sb.append(this.mJpegQueueSize);
        Log.d(str, sb.toString());
        if (z || this.mJpegQueueSize < 7) {
            if (!z) {
                boolean z3 = this.mJpegQueueSize == 0;
                if (z3) {
                    z2 = processorThumSync(drawJPEGAttribute);
                } else {
                    processorThumAsync(drawJPEGAttribute);
                    z2 = false;
                }
                if (!this.mIsImageCaptureIntent && z3 && this.mExifNeeded && z2) {
                    if (!drawJPEGAttribute.mNeedThumbnail) {
                        this.mActivity.getThumbnailUpdater().updatePreviewThumbnailUri(drawJPEGAttribute.mUri);
                    } else {
                        Bitmap thumbnailBitmap = drawJPEGAttribute.mExif.getThumbnailBitmap();
                        if (!(thumbnailBitmap == null || drawJPEGAttribute.mUri == null)) {
                            drawJPEGAttribute.mFinalImage = false;
                            this.mActivity.getThumbnailUpdater().setThumbnail(Thumbnail.createThumbnail(drawJPEGAttribute.mUri, thumbnailBitmap, drawJPEGAttribute.mJpegOrientation, false), true, true);
                        }
                    }
                }
            }
            synchronized (this.mLock) {
                this.mJpegQueueSize++;
            }
            this.mEglHandler.obtainMessage(1, z ? 1 : 0, 0, drawJPEGAttribute).sendToTarget();
            return true;
        }
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("queueSize is full, drop it ");
        sb2.append(drawJPEGAttribute.mTitle);
        Log.d(str2, sb2.toString());
        return false;
    }

    public void processorJpegSync(DrawJPEGAttribute drawJPEGAttribute, boolean z) {
        this.mEglThreadBlockVar.close();
        EGLHandler eGLHandler = this.mEglHandler;
        boolean z2 = this.mExifNeeded;
        eGLHandler.obtainMessage(2, z2 ? 1 : 0, z ? 1 : 0, drawJPEGAttribute).sendToTarget();
        this.mEglThreadBlockVar.block();
    }

    public void releaseIfNeeded() {
        if (this.mEglHandler.hasMessages(1)) {
            this.mReleasePending = true;
        } else {
            this.mEglHandler.sendEmptyMessage(5);
        }
    }

    public void setExifNeed(boolean z) {
        this.mExifNeeded = z;
    }

    public void setImageSaver(ImageSaver imageSaver) {
        this.mImageSaver = imageSaver;
    }

    public void setQuality(int i) {
        if (i >= 0 && i <= 97) {
            this.mQuality = i;
        }
    }
}
