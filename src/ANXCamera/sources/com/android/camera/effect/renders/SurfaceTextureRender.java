package com.android.camera.effect.renders;

import android.opengl.GLES20;
import com.android.camera.effect.ShaderUtil;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.BasicTexture;
import com.android.gallery3d.ui.ExtTexture;
import com.android.gallery3d.ui.GLCanvas;

public class SurfaceTextureRender extends ShaderRender {
    private static final String FRAG = "#extension GL_OES_EGL_image_external : require  \nprecision mediump float; \nuniform float uAlpha; \nuniform float uMixAlpha; \nuniform samplerExternalOES sTexture; \nvarying vec2 vTexCoord; \nvoid main() \n{ \n    gl_FragColor = texture2D(sTexture, vTexCoord)*uAlpha; \n    if (uMixAlpha >= 0.0) { \n       gl_FragColor.a = uMixAlpha; \n    } \n}";
    private static final String TAG = "SurfaceTextureRender";
    private static final float[] TEXTURES = {0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f};
    private static final float[] VERTICES = {0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f};

    public SurfaceTextureRender(GLCanvas gLCanvas) {
        super(gLCanvas);
    }

    private void drawTexture(ExtTexture extTexture, float[] fArr, float f, float f2, float f3, float f4) {
        GLES20.glUseProgram(0);
        GLES20.glUseProgram(this.mProgram);
        if (!bindTexture((BasicTexture) extTexture, 33984)) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("fail bind texture ");
            sb.append(extTexture.getId());
            Log.e(str, sb.toString());
            return;
        }
        initAttributePointer();
        updateViewport();
        float alpha = this.mGLCanvas.getState().getAlpha();
        float blendAlpha = this.mGLCanvas.getState().getBlendAlpha();
        boolean z = this.mBlendEnabled && (!extTexture.isOpaque() || alpha < 0.95f || blendAlpha >= 0.0f);
        setBlendEnabled(z);
        this.mGLCanvas.getState().pushState();
        this.mGLCanvas.getState().translate(f, f2, 0.0f);
        this.mGLCanvas.getState().scale(f3, f4, 1.0f);
        GLES20.glUniformMatrix4fv(this.mUniformMVPMatrixH, 1, false, this.mGLCanvas.getState().getFinalMatrix(), 0);
        GLES20.glUniformMatrix4fv(this.mUniformSTMatrixH, 1, false, fArr, 0);
        GLES20.glUniform1i(this.mUniformTextureH, 0);
        GLES20.glUniform1f(this.mUniformAlphaH, this.mGLCanvas.getState().getAlpha());
        GLES20.glUniform1f(this.mUniformBlendAlphaH, blendAlpha);
        GLES20.glDrawArrays(5, 0, 4);
        this.mGLCanvas.getState().popState();
    }

    private void initAttributePointer() {
        GLES20.glVertexAttribPointer(this.mAttributePositionH, 2, 5126, false, 8, this.mVertexBuffer);
        GLES20.glVertexAttribPointer(this.mAttributeTexCoorH, 2, 5126, false, 8, this.mTexCoorBuffer);
        GLES20.glEnableVertexAttribArray(this.mAttributePositionH);
        GLES20.glEnableVertexAttribArray(this.mAttributeTexCoorH);
    }

    public boolean draw(DrawAttribute drawAttribute) {
        if (!isAttriSupported(drawAttribute.getTarget())) {
            return false;
        }
        DrawExtTexAttribute drawExtTexAttribute = (DrawExtTexAttribute) drawAttribute;
        drawTexture(drawExtTexAttribute.mExtTexture, drawExtTexAttribute.mTextureTransform, (float) drawExtTexAttribute.mX, (float) drawExtTexAttribute.mY, (float) drawExtTexAttribute.mWidth, (float) drawExtTexAttribute.mHeight);
        return true;
    }

    public String getFragShaderString() {
        return FRAG;
    }

    /* access modifiers changed from: protected */
    public void initShader() {
        this.mProgram = ShaderUtil.createProgram(getVertexShaderString(), getFragShaderString());
        if (this.mProgram != 0) {
            GLES20.glUseProgram(this.mProgram);
            this.mUniformMVPMatrixH = GLES20.glGetUniformLocation(this.mProgram, "uMVPMatrix");
            this.mUniformSTMatrixH = GLES20.glGetUniformLocation(this.mProgram, "uSTMatrix");
            this.mUniformTextureH = GLES20.glGetUniformLocation(this.mProgram, "sTexture");
            this.mUniformAlphaH = GLES20.glGetUniformLocation(this.mProgram, "uAlpha");
            this.mUniformBlendAlphaH = GLES20.glGetUniformLocation(this.mProgram, "uMixAlpha");
            this.mAttributePositionH = GLES20.glGetAttribLocation(this.mProgram, "aPosition");
            this.mAttributeTexCoorH = GLES20.glGetAttribLocation(this.mProgram, "aTexCoord");
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(getClass());
        sb.append(": mProgram = 0");
        throw new IllegalArgumentException(sb.toString());
    }

    /* access modifiers changed from: protected */
    public void initSupportAttriList() {
        this.mAttriSupportedList.add(Integer.valueOf(8));
    }

    /* access modifiers changed from: protected */
    public void initVertexData() {
        this.mVertexBuffer = allocateByteBuffer((VERTICES.length * 32) / 8).asFloatBuffer();
        this.mVertexBuffer.put(VERTICES);
        this.mVertexBuffer.position(0);
        this.mTexCoorBuffer = allocateByteBuffer((TEXTURES.length * 32) / 8).asFloatBuffer();
        this.mTexCoorBuffer.put(TEXTURES);
        this.mTexCoorBuffer.position(0);
    }
}
