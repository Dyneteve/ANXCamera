package com.android.gallery3d.ui;

import android.opengl.GLES20;
import com.android.camera.Util;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.renders.BasicRender;
import com.android.camera.effect.renders.EffectRenderGroup;
import com.android.camera.effect.renders.Render.FrameBufferCallback;
import com.android.camera.effect.renders.RenderGroup;
import com.android.camera.log.Log;

public class GLCanvasImpl extends BaseGLCanvas {
    private static final String TAG = "GLCanvasImpl";

    public GLCanvasImpl() {
        this.mRenderCaches = new RenderGroup(this);
        this.mRenderGroup = new RenderGroup(this);
        EffectRenderGroup effectRenderGroup = new EffectRenderGroup(this);
        EffectController.getInstance().addChangeListener(effectRenderGroup);
        this.mRenderGroup.addRender(effectRenderGroup);
        this.mRenderGroup.addRender(new BasicRender(this));
        initialize();
    }

    public void deleteProgram() {
        super.deleteProgram();
        this.mRenderCaches.destroy();
        this.mRenderGroup.destroy();
    }

    public void draw(DrawAttribute drawAttribute) {
        this.mRenderGroup.draw(drawAttribute);
    }

    /* access modifiers changed from: protected */
    public void initialize() {
        super.initialize();
        GLES20.glEnable(3024);
        GLES20.glLineWidth(1.0f);
    }

    public void prepareBlurRenders() {
        if (this.mRenderGroup.getRender(FilterInfo.FILTER_ID_BLUR) == null) {
            if (this.mRenderCaches.getRender(FilterInfo.FILTER_ID_BLUR) == null) {
                prepareEffectRenders(false, FilterInfo.FILTER_ID_BLUR);
            }
            this.mRenderGroup.addRender(this.mRenderCaches.getRender(FilterInfo.FILTER_ID_BLUR));
        }
    }

    public void prepareEffectRenders(boolean z, int i) {
        if (this.mRenderCaches.isNeedInit(i)) {
            EffectController.getInstance().getEffectGroup(this, this.mRenderCaches, z, false, i);
        }
    }

    public void setFrameBufferCallback(FrameBufferCallback frameBufferCallback, int i) {
        this.mRenderGroup.setFrameBufferCallback(frameBufferCallback, i);
    }

    public void setSize(int i, int i2) {
        super.setSize(i, i2);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setSize: size=");
        sb.append(i);
        sb.append("x");
        sb.append(i2);
        sb.append(" modelMatrix=");
        sb.append(Util.dumpMatrix(this.mState.getModelMatrix()));
        Log.c(str, sb.toString());
    }

    public void setSticker(String str) {
        this.mRenderGroup.setSticker(str);
    }
}
