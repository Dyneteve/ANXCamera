package com.android.camera.effect.renders;

import android.opengl.GLES20;
import android.text.TextUtils;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.renders.Render.FrameBufferCallback;
import com.android.camera.log.Log;
import com.android.camera.sticker.StickerHelper;
import com.android.camera.sticker.beautyprocessor.StickerBeautyProcessor;
import com.android.camera.sticker.glutils.GlUtil;
import com.android.gallery3d.ui.BasicTexture;
import com.android.gallery3d.ui.GLCanvas;
import com.miui.filtersdk.beauty.IntelligentBeautyProcessor;
import com.sensetime.stmobile.STBeautifyNative;
import com.sensetime.stmobile.STHumanAction;
import com.sensetime.stmobile.STMobileHumanActionNative;
import com.sensetime.stmobile.STMobileStickerNative;
import com.sensetime.stmobile.model.STMobile106;
import java.nio.ByteBuffer;

public class StickerRender extends PixelEffectRender {
    private static final String FRAG_SHADER = "uniform sampler2D sTexture; \nvarying vec2 vTexCoord; \nvoid main() \n{ \n    gl_FragColor = texture2D(sTexture, vTexCoord); \n}";
    /* access modifiers changed from: private */
    public static final String TAG = StickerRender.class.getSimpleName();
    private int[] mBeautifyTextureId;
    private String mCurrentSticker;
    private int mFrameBufferHeight;
    private int mFrameBufferId;
    private int mFrameBufferWidth;
    /* access modifiers changed from: private */
    public Object mHumanActionHandleLock = new Object();
    /* access modifiers changed from: private */
    public boolean mHumanActionInitDone;
    private IntelligentBeautyProcessor mMakeupProcessor;
    private boolean mNeedBeautify = true;
    private ByteBuffer mRGBABuffer;
    /* access modifiers changed from: private */
    public STMobileHumanActionNative mSTHumanActionNative = new STMobileHumanActionNative();
    private STBeautifyNative mStBeautifyNative = new STBeautifyNative();
    private STMobileStickerNative mStStickerNative = new STMobileStickerNative();
    private int[] mTextureOutId;

    public StickerRender(GLCanvas gLCanvas, int i, String str) {
        super(gLCanvas, i);
        this.mCurrentSticker = str;
        onInit();
    }

    private void destroyGLResource() {
        this.mRGBABuffer = null;
        if (this.mBeautifyTextureId != null) {
            GLES20.glDeleteTextures(1, this.mBeautifyTextureId, 0);
            this.mBeautifyTextureId = null;
        }
        if (this.mTextureOutId != null) {
            GLES20.glDeleteTextures(1, this.mTextureOutId, 0);
            this.mTextureOutId = null;
        }
    }

    private ByteBuffer getRGBABuffer(int i, int i2) {
        if (this.mRGBABuffer == null) {
            this.mRGBABuffer = ByteBuffer.allocate(i * i2 * 4);
        }
        this.mRGBABuffer.rewind();
        return this.mRGBABuffer;
    }

    private int getRotateType() {
        int orientation = EffectController.getInstance().getOrientation();
        if (orientation == 90) {
            return 1;
        }
        if (orientation != 180) {
            return orientation != 270 ? 0 : 3;
        }
        return 2;
    }

    private boolean hasSticker() {
        return !this.mCurrentSticker.isEmpty();
    }

    private void initBeauty() {
        int createInstance = this.mStBeautifyNative.createInstance(this.mPreviewWidth, this.mPreviewHeight);
        this.mMakeupProcessor = new StickerBeautyProcessor(this.mStBeautifyNative);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("initBeautify: result=");
        sb.append(createInstance);
        Log.d(str, sb.toString());
        if (createInstance == 0) {
            this.mStBeautifyNative.setParam(1, 0.36f);
            this.mStBeautifyNative.setParam(3, 0.74f);
            this.mStBeautifyNative.setParam(4, 0.02f);
            this.mStBeautifyNative.setParam(5, 0.13f);
            this.mStBeautifyNative.setParam(6, 0.11f);
            this.mStBeautifyNative.setParam(7, 0.1f);
        }
    }

    private void initHumanAction() {
        new Thread(new Runnable() {
            public void run() {
                synchronized (StickerRender.this.mHumanActionHandleLock) {
                    int createInstance = StickerRender.this.mSTHumanActionNative.createInstance(StickerHelper.getInstance().getTrackModelPath(), STMobileHumanActionNative.ST_MOBILE_HUMAN_ACTION_DEFAULT_CONFIG_VIDEO);
                    if (createInstance == 0) {
                        StickerRender.this.mSTHumanActionNative.setParam(2, 0.35f);
                    }
                    StickerRender.this.mHumanActionInitDone = true;
                    StickerRender.this.mHumanActionHandleLock.notify();
                    String access$300 = StickerRender.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("initHumanAction: result=");
                    sb.append(createInstance);
                    Log.d(access$300, sb.toString());
                }
            }
        }).start();
    }

    private void initSticker() {
        int createInstance = this.mStStickerNative.createInstance(this.mCurrentSticker);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("initSticker: result=");
        sb.append(createInstance);
        Log.d(str, sb.toString());
    }

    private void onDestroy() {
        this.mSTHumanActionNative.destroyInstance();
        this.mStStickerNative.destroyInstance();
        this.mStBeautifyNative.destroyBeautify();
        destroyGLResource();
    }

    private void onInit() {
        initHumanAction();
        initBeauty();
        initSticker();
        synchronized (this.mHumanActionHandleLock) {
            while (!this.mHumanActionInitDone) {
                try {
                    this.mHumanActionHandleLock.wait();
                } catch (InterruptedException e) {
                    Log.e(TAG, e.getMessage(), e);
                }
            }
        }
    }

    private int processTexture(int i, int i2, int i3, int i4) {
        int i5;
        STMobile106[] sTMobile106Arr;
        STMobile106[] sTMobile106Arr2;
        int i6 = i3;
        int i7 = i4;
        if (this.mBeautifyTextureId == null) {
            this.mBeautifyTextureId = new int[1];
            GlUtil.initEffectTexture(i6, i7, this.mBeautifyTextureId, 3553);
        }
        if (this.mTextureOutId == null) {
            this.mTextureOutId = new int[1];
            GlUtil.initEffectTexture(i6, i7, this.mTextureOutId, 3553);
        }
        GLES20.glBindFramebuffer(36160, i2);
        GlUtil.checkGlError("glBindFramebuffer");
        GLES20.glReadPixels(0, 0, i6, i7, 6408, 5121, getRGBABuffer(i6, i7));
        GLES20.glBindFramebuffer(36160, this.mParentFrameBufferId);
        int i8 = -1;
        if (this.mNeedBeautify || (hasSticker() && this.mRGBABuffer != null)) {
            int rotateType = getRotateType();
            STHumanAction humanActionDetect = this.mSTHumanActionNative.humanActionDetect(this.mRGBABuffer.array(), 6, STMobileHumanActionNative.ST_MOBILE_HUMAN_ACTION_DEFAULT_CONFIG_DETECT, rotateType, i6, i7);
            if (this.mNeedBeautify) {
                STMobile106[] sTMobile106Arr3 = null;
                if (humanActionDetect != null) {
                    STMobile106[] mobileFaces = humanActionDetect.getMobileFaces();
                    if (mobileFaces != null && mobileFaces.length > 0) {
                        sTMobile106Arr3 = new STMobile106[mobileFaces.length];
                    }
                    sTMobile106Arr = sTMobile106Arr3;
                    sTMobile106Arr2 = mobileFaces;
                } else {
                    sTMobile106Arr2 = null;
                    sTMobile106Arr = null;
                }
                int i9 = this.mStBeautifyNative.processTexture(i, i6, i7, sTMobile106Arr2, this.mBeautifyTextureId[0], sTMobile106Arr) == 0 ? this.mBeautifyTextureId[0] : i;
                if (!(sTMobile106Arr == null || sTMobile106Arr.length == 0 || humanActionDetect == null)) {
                    humanActionDetect.replaceMobile106(sTMobile106Arr);
                }
                i5 = i9;
            } else {
                i5 = i;
            }
            FrameBufferCallback frameBufferCallback = getFrameBufferCallback();
            if (frameBufferCallback != null) {
                ByteBuffer allocate = ByteBuffer.allocate(i6 * i7 * 4);
                ByteBuffer byteBuffer = allocate;
                i8 = this.mStStickerNative.processTextureAndOutputBuffer(i5, humanActionDetect, rotateType, i6, i7, false, this.mTextureOutId[0], 6, allocate.array());
                if (i8 == 0) {
                    frameBufferCallback.onFrameBuffer(byteBuffer, i6, i7);
                }
            } else {
                i8 = this.mStStickerNative.processTexture(i5, humanActionDetect, rotateType, i6, i7, false, this.mTextureOutId[0]);
            }
        } else {
            i5 = i;
        }
        if (i8 == 0) {
            return this.mTextureOutId[0];
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("processTexture: result=");
        sb.append(i8);
        sb.append(" outTexId=");
        sb.append(this.mTextureOutId[0]);
        Log.e(str, sb.toString());
        return i5;
    }

    /* access modifiers changed from: protected */
    public void drawTexture(int i, float f, float f2, float f3, float f4, boolean z) {
        super.drawTexture(processTexture(i, this.mFrameBufferId, this.mFrameBufferWidth, this.mFrameBufferHeight), f, f2, f3, f4, z);
    }

    /* access modifiers changed from: protected */
    public void drawTexture(BasicTexture basicTexture, float f, float f2, float f3, float f4, boolean z) {
        if (!basicTexture.onBind(this.mGLCanvas)) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("drawTexture: fail to bind texture ");
            sb.append(basicTexture.getId());
            Log.e(str, sb.toString());
            return;
        }
        super.drawTexture(processTexture(basicTexture.getId(), this.mFrameBufferId, this.mFrameBufferWidth, this.mFrameBufferHeight), f, f2, f3, f4, z);
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        onDestroy();
        super.finalize();
    }

    public boolean getBeautify() {
        return this.mNeedBeautify;
    }

    public String getFragShaderString() {
        return FRAG_SHADER;
    }

    public IntelligentBeautyProcessor getMakeupProcessor() {
        return this.mMakeupProcessor;
    }

    public void setBeautify(boolean z) {
        this.mNeedBeautify = z;
    }

    public void setPreviousFrameBufferInfo(int i, int i2, int i3) {
        this.mFrameBufferId = i;
        if (this.mFrameBufferWidth != i2 || this.mFrameBufferHeight != i3) {
            this.mFrameBufferWidth = i2;
            this.mFrameBufferHeight = i3;
            destroyGLResource();
        }
    }

    public void setSticker(String str) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setSticker: ");
        sb.append(str);
        Log.d(str2, sb.toString());
        if (!TextUtils.equals(str, this.mCurrentSticker)) {
            this.mStStickerNative.changeSticker(str);
        }
        this.mCurrentSticker = str;
    }
}
