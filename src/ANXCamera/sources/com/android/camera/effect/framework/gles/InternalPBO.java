package com.android.camera.effect.framework.gles;

import android.opengl.GLES30;
import com.android.camera.effect.ShaderNativeUtil;
import java.nio.IntBuffer;

public class InternalPBO {
    private int mHeight;
    private int mPboReadPixel = -1;
    private int mWidth;

    private void initReadPixelBuffer(int i, int i2) {
        IntBuffer allocate = IntBuffer.allocate(1);
        GLES30.glGenBuffers(1, allocate);
        this.mPboReadPixel = allocate.get(0);
        GLES30.glBindBuffer(35051, this.mPboReadPixel);
        GLES30.glBufferData(35051, i * i2 * 3, null, 35045);
        GLES30.glBindBuffer(35051, 0);
    }

    public void PboReadpixels(int i, int i2, int i3) {
        GLES30.glBindBuffer(35051, this.mPboReadPixel);
        GLES30.glReadPixels(0, 0, i, i2, 6407, 5121, 0);
        ShaderNativeUtil.readPixelsPboPlainMerge(i, i2, i3);
        GLES30.glBindBuffer(35051, 0);
    }

    public void checkPbo(int i, int i2) {
        if (this.mPboReadPixel == -1) {
            initReadPixelBuffer(i, i2);
        } else if (this.mWidth < i || this.mHeight < i2) {
            GLES30.glBindBuffer(35051, this.mPboReadPixel);
            GLES30.glBufferData(35051, i * i2 * 3, null, 35045);
            GLES30.glBindBuffer(35051, 0);
            this.mWidth = i;
            this.mHeight = i2;
        }
    }

    public int getHeight() {
        return this.mHeight;
    }

    public int getWidth() {
        return this.mWidth;
    }

    public void releasePbo() {
        if (this.mPboReadPixel != -1) {
            GLES30.glDeleteBuffers(1, IntBuffer.wrap(new int[]{this.mPboReadPixel}));
        }
    }
}
