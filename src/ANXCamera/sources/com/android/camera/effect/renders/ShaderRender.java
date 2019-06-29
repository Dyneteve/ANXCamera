package com.android.camera.effect.renders;

import android.opengl.GLES20;
import com.android.camera.effect.ShaderUtil;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.BasicTexture;
import com.android.gallery3d.ui.GLCanvas;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.util.ArrayList;

public abstract class ShaderRender extends Render {
    protected static final float OPAQUE_ALPHA = 0.95f;
    private static final String VERTEX = ShaderUtil.loadFromAssetsFile("vertex_normal.txt");
    protected ArrayList<Integer> mAttriSupportedList = new ArrayList<>();
    protected int mAttributePositionH;
    protected int mAttributeTexCoorH;
    protected boolean mBlendEnabled = true;
    protected float[] mPreviewEffectRect = {0.0f, 0.0f, 1.0f, 1.0f};
    protected int mProgram = 0;
    protected float[] mSnapshotEffectRect = {0.0f, 0.0f, 1.0f, 1.0f};
    protected FloatBuffer mTexCoorBuffer;
    protected int mUniformAlphaH;
    protected int mUniformBlendAlphaH;
    protected int mUniformMVPMatrixH;
    protected int mUniformSTMatrixH;
    protected int mUniformTextureH;
    protected FloatBuffer mVertexBuffer;

    public ShaderRender(GLCanvas gLCanvas) {
        super(gLCanvas);
        initShader();
        initVertexData();
        initSupportAttriList();
    }

    public ShaderRender(GLCanvas gLCanvas, int i) {
        super(gLCanvas, i);
        initShader();
        initVertexData();
        initSupportAttriList();
    }

    public static ByteBuffer allocateByteBuffer(int i) {
        return ByteBuffer.allocateDirect(i).order(ByteOrder.nativeOrder());
    }

    public static boolean isOpaque(int i) {
        return (i >>> 24) == 255;
    }

    /* access modifiers changed from: protected */
    public boolean bindTexture(int i, int i2) {
        GLES20.glActiveTexture(i2);
        GLES20.glBindTexture(3553, 0);
        GLES20.glBindTexture(3553, i);
        return true;
    }

    /* access modifiers changed from: protected */
    public boolean bindTexture(BasicTexture basicTexture, int i) {
        if (!basicTexture.onBind(this.mGLCanvas)) {
            return false;
        }
        GLES20.glActiveTexture(i);
        GLES20.glBindTexture(basicTexture.getTarget(), 0);
        GLES20.glBindTexture(basicTexture.getTarget(), basicTexture.getId());
        return true;
    }

    public void destroy() {
        if (this.mProgram != 0 && this.mGLCanvas != null) {
            String simpleName = getClass().getSimpleName();
            StringBuilder sb = new StringBuilder();
            sb.append("delete program ");
            sb.append(this.mProgram);
            Log.d(simpleName, sb.toString());
            this.mGLCanvas.deleteProgram(this.mProgram);
            this.mProgram = 0;
        }
    }

    public abstract boolean draw(DrawAttribute drawAttribute);

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        destroy();
        super.finalize();
    }

    public abstract String getFragShaderString();

    public String getVertexShaderString() {
        return VERTEX;
    }

    /* access modifiers changed from: protected */
    public abstract void initShader();

    /* access modifiers changed from: protected */
    public abstract void initSupportAttriList();

    /* access modifiers changed from: protected */
    public abstract void initVertexData();

    public boolean isAttriSupported(int i) {
        return this.mAttriSupportedList.contains(Integer.valueOf(i));
    }

    /* access modifiers changed from: protected */
    public void setBlendEnabled(boolean z) {
        setBlendEnabled(z, false);
    }

    /* access modifiers changed from: protected */
    public void setBlendEnabled(boolean z, boolean z2) {
        if (z) {
            GLES20.glEnable(3042);
            GLES20.glBlendFunc(z2 ? 1 : 770, 771);
            return;
        }
        GLES20.glDisable(3042);
    }
}
