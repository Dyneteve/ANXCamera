package com.android.camera.effect.renders;

import android.opengl.GLES20;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.GLCanvas;

public class RgbToYuvRender extends PixelEffectRender {
    private static final String FRAGMENT_SHADER_NV12 = "precision highp float; \nuniform sampler2D sTexture; \nuniform vec2 uSize; \nvarying vec2 vTexCoord; \nuniform float uAlpha; \nfloat getY(float x, float y) { \n    vec3 pix = texture2D(sTexture, vec2(x, y)).rgb; \n    return 0.299 * pix.r + 0.587 * pix.g + 0.114 * pix.b; \n} \nfloat getU(float x, float y) { \n    vec3 pix = texture2D(sTexture, vec2(x, y)).rgb; \n    return clamp(-0.16874 * pix.r - 0.33126 * pix.g + 0.5 * pix.b + 0.5, 0.0, 1.0); \n} \nfloat getV(float x, float y) { \n    vec3 pix = texture2D(sTexture, vec2(x, y)).rgb; \n    return clamp(0.5 * pix.r - 0.41869 * pix.g - 0.08131 * pix.b + 0.5, 0.0, 1.0); \n} \nvoid main() { \n    float x, y; \n    if (vTexCoord.y < 0.5) { \n        if (vTexCoord.x < 0.25) { \n            x = (vTexCoord.x - 0.5 / uSize.x) * 4.0 + 0.5 / uSize.x; \n            y = (vTexCoord.y -  0.5 / uSize.y) * 2.0 + 0.5 / uSize.y; \n        } else if (vTexCoord.x < 0.5) { \n            x = (vTexCoord.x -  0.5 / uSize.x ) * 4.0 + 0.5 / uSize.x - 1.0; \n            y = (vTexCoord.y -  0.5 / uSize.y )* 2.0 + 0.5 / uSize.y + 1.0 / uSize.y; \n        } \n        vec4 yyyy; \n        yyyy.x = getY(x + 0.0 / uSize.x, y); \n        yyyy.y = getY(x + 1.0 / uSize.x, y); \n        yyyy.z = getY(x + 2.0 / uSize.x, y); \n        yyyy.w = getY(x + 3.0 / uSize.x, y); \n        gl_FragColor = yyyy; \n    } else if (vTexCoord.y < 0.75 + 0.6 / uSize.y) { \n        if (vTexCoord.x < 0.25) { \n            x = (vTexCoord.x -  0.5 / uSize.x) * 4.0 + 0.5 / uSize.x ; \n            y = (vTexCoord.y -  0.5 / uSize.y) * 4.0 + 0.5 / uSize.y - 2.0 ; \n        } else if (vTexCoord.x < 0.5) { \n            x = (vTexCoord.x - 0.5 / uSize.x )* 4.0 + 0.5 / uSize.x - 1.0 ; \n            y = (vTexCoord.y - 0.5 / uSize.y) * 4.0 + 0.5 /uSize.y - 2.0  + 2.0 / uSize.y; \n        } \n        vec4 uvuv; \n        uvuv.x = getU(x + 0.0 / uSize.x, y); \n        uvuv.y = getV(x + 0.0 / uSize.x, y); \n        uvuv.z = getU(x + 2.0 / uSize.x, y); \n        uvuv.w = getV(x + 2.0 / uSize.x, y); \n        gl_FragColor = uvuv; \n    } \n}";
    protected int mUniformSizeH;

    public RgbToYuvRender(GLCanvas gLCanvas, int i) {
        super(gLCanvas, i);
    }

    public boolean draw(DrawAttribute drawAttribute) {
        long currentTimeMillis = System.currentTimeMillis();
        boolean draw = super.draw(drawAttribute);
        StringBuilder sb = new StringBuilder();
        sb.append("drawTime=");
        sb.append(System.currentTimeMillis() - currentTimeMillis);
        Log.d("RgbToYuvRender", sb.toString());
        return draw;
    }

    public String getFragShaderString() {
        return FRAGMENT_SHADER_NV12;
    }

    /* access modifiers changed from: protected */
    public void initShader() {
        super.initShader();
        this.mUniformSizeH = GLES20.glGetUniformLocation(this.mProgram, "uSize");
    }

    /* access modifiers changed from: protected */
    public void initShaderValue(boolean z) {
        super.initShaderValue(z);
        GLES20.glUniform2f(this.mUniformSizeH, (float) this.mViewportWidth, (float) this.mViewportHeight);
    }
}
