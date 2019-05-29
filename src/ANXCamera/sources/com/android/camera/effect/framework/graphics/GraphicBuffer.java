package com.android.camera.effect.framework.graphics;

import android.opengl.GLES20;
import com.android.camera.effect.ShaderNativeUtil;

public class GraphicBuffer {
    private int mFboId;
    private int mHeight;
    private int mWidth;

    public void bindFrameBuffer() {
        GLES20.glBindFramebuffer(36160, this.mFboId);
    }

    public int getFrameBufferId() {
        return this.mFboId;
    }

    public int getFrameBufferTexId() {
        return ShaderNativeUtil.getGraphicBufferFboTexId();
    }

    public void initBuffer(int i, int i2) {
        this.mFboId = ShaderNativeUtil.setupGraphicBuffer(i, i2);
        this.mWidth = i;
        this.mHeight = i2;
    }

    public void initBuffer(int i, int i2, int i3) {
        this.mFboId = ShaderNativeUtil.setupGraphicBufferWithChannels(i, i2, i3);
    }

    public void readBuffer(int i, int i2, int i3) {
        ShaderNativeUtil.readGraphicBuffer(i, i2, i3);
    }

    public void release() {
        ShaderNativeUtil.releaseGraphicBuffer();
    }

    public void reszieBuffer(int i, int i2) {
        if (this.mWidth != i || this.mHeight != i2) {
            this.mFboId = ShaderNativeUtil.resizeGraphicBuffer(i, i2);
            this.mWidth = i;
            this.mHeight = i2;
        }
    }

    public void unbindFrameBuffer() {
        GLES20.glBindFramebuffer(36160, 0);
    }
}
