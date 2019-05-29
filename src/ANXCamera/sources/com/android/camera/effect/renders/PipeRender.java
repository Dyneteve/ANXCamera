package com.android.camera.effect.renders;

import android.opengl.GLES20;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.draw_mode.DrawBasicTexAttribute;
import com.android.camera.effect.draw_mode.DrawIntTexAttribute;
import com.android.camera.effect.draw_mode.DrawYuvAttribute;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.GLCanvas;
import java.util.ArrayList;
import java.util.Locale;

public class PipeRender extends RenderGroup {
    private static final boolean DUMP_TEXTURE = false;
    private static final String TAG = PipeRender.class.getSimpleName();
    private int mBufferHeight;
    private int mBufferWidth;
    private int[] mFrameBufferTextures;
    private int[] mFrameBuffers;

    public PipeRender(GLCanvas gLCanvas) {
        super(gLCanvas);
    }

    public PipeRender(GLCanvas gLCanvas, int i) {
        super(gLCanvas, i);
    }

    private synchronized void destroyFrameBuffers() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("destroyFrameBuffers: count=");
        sb.append(this.mFrameBuffers == null ? 0 : this.mFrameBuffers.length);
        Log.v(str, sb.toString());
        if (this.mFrameBuffers != null) {
            for (int valueOf : this.mFrameBuffers) {
                Log.d(TAG, String.format(Locale.ENGLISH, "delete fbo thread=%d id=%d", new Object[]{Long.valueOf(Thread.currentThread().getId()), Integer.valueOf(valueOf)}));
            }
        }
        if (this.mFrameBufferTextures != null) {
            GLES20.glDeleteTextures(this.mFrameBufferTextures.length, this.mFrameBufferTextures, 0);
            this.mFrameBufferTextures = null;
        }
        if (this.mFrameBuffers != null) {
            GLES20.glDeleteFramebuffers(this.mFrameBuffers.length, this.mFrameBuffers, 0);
            this.mFrameBuffers = null;
        }
    }

    private synchronized void initFrameBuffers(int i, int i2, int i3) {
        int i4 = i;
        synchronized (this) {
            if (i4 > 0) {
                Log.v(TAG, String.format(Locale.ENGLISH, "initFrameBuffers: count=%d size=%dx%d", new Object[]{Integer.valueOf(i), Integer.valueOf(i2), Integer.valueOf(i3)}));
                this.mFrameBuffers = new int[i4];
                this.mFrameBufferTextures = new int[i4];
                for (int i5 = 0; i5 < i4; i5++) {
                    GLES20.glGenFramebuffers(1, this.mFrameBuffers, i5);
                    GLES20.glGenTextures(1, this.mFrameBufferTextures, i5);
                    GLES20.glBindTexture(3553, this.mFrameBufferTextures[i5]);
                    GLES20.glTexImage2D(3553, 0, 6408, i2, i3, 0, 6408, 5121, null);
                    GLES20.glTexParameterf(3553, 10240, 9729.0f);
                    GLES20.glTexParameterf(3553, 10241, 9729.0f);
                    GLES20.glTexParameterf(3553, 10242, 33071.0f);
                    GLES20.glTexParameterf(3553, 10243, 33071.0f);
                    GLES20.glBindFramebuffer(36160, this.mFrameBuffers[i5]);
                    GLES20.glFramebufferTexture2D(36160, 36064, 3553, this.mFrameBufferTextures[i5], 0);
                    Log.v(TAG, String.format(Locale.ENGLISH, "fbo[%d]: %d %d %d*%d thread=%d", new Object[]{Integer.valueOf(i5), Integer.valueOf(this.mFrameBuffers[i5]), Integer.valueOf(this.mFrameBufferTextures[i5]), Integer.valueOf(i2), Integer.valueOf(i3), Long.valueOf(Thread.currentThread().getId())}));
                    GLES20.glBindTexture(3553, 0);
                    GLES20.glBindFramebuffer(36160, 0);
                }
            }
        }
    }

    public void addRender(Render render) {
        super.addRender(render);
        int renderSize = getRenderSize() - 1;
        if ((this.mFrameBuffers == null || renderSize > this.mFrameBuffers.length) && this.mBufferWidth > 0 && this.mBufferHeight > 0) {
            reInitFrameBuffers(this.mBufferWidth, this.mBufferHeight);
        }
    }

    public void deleteBuffer() {
        super.deleteBuffer();
        destroyFrameBuffers();
    }

    public boolean draw(DrawAttribute drawAttribute) {
        boolean z;
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        ArrayList arrayList;
        char c;
        int i7;
        int i8;
        int i9;
        int i10;
        int i11;
        int i12;
        boolean z2;
        DrawAttribute drawAttribute2 = drawAttribute;
        if (this.mFrameBuffers == null || this.mFrameBufferTextures == null) {
            Log.e(TAG, "framebuffer hasn't been initialized");
            return false;
        }
        int target = drawAttribute.getTarget();
        if (target != 11) {
            switch (target) {
                case 5:
                    DrawBasicTexAttribute drawBasicTexAttribute = (DrawBasicTexAttribute) drawAttribute2;
                    i4 = drawBasicTexAttribute.mX;
                    i3 = drawBasicTexAttribute.mY;
                    i2 = drawBasicTexAttribute.mWidth;
                    i = drawBasicTexAttribute.mHeight;
                    i12 = drawBasicTexAttribute.mBasicTexture.getId();
                    z2 = drawBasicTexAttribute.mIsSnapshot;
                    break;
                case 6:
                    DrawIntTexAttribute drawIntTexAttribute = (DrawIntTexAttribute) drawAttribute2;
                    i4 = drawIntTexAttribute.mX;
                    i3 = drawIntTexAttribute.mY;
                    i2 = drawIntTexAttribute.mWidth;
                    i = drawIntTexAttribute.mHeight;
                    i12 = drawIntTexAttribute.mTexId;
                    z2 = drawIntTexAttribute.mIsSnapshot;
                    break;
                default:
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("unsupported target ");
                    sb.append(target);
                    Log.w(str, sb.toString());
                    i5 = 0;
                    i4 = 0;
                    i3 = 0;
                    i2 = 0;
                    i = 0;
                    z = false;
                    break;
            }
            z = z2;
            i5 = i12;
        } else {
            DrawYuvAttribute drawYuvAttribute = (DrawYuvAttribute) drawAttribute2;
            if (drawYuvAttribute.mBlockWidth == 0 && drawYuvAttribute.mBlockHeight == 0) {
                i10 = drawYuvAttribute.mPictureSize.getWidth();
                i11 = drawYuvAttribute.mPictureSize.getHeight();
            } else {
                i10 = drawYuvAttribute.mBlockWidth;
                i11 = drawYuvAttribute.mBlockHeight;
            }
            i = i11;
            i2 = i10;
            i5 = 0;
            i4 = 0;
            i3 = 0;
            z = true;
        }
        if (i2 == 0 || i == 0) {
            Log.e(TAG, String.format(Locale.ENGLISH, "invalid size: %dx%d", new Object[]{Integer.valueOf(i2), Integer.valueOf(i)}));
            return false;
        }
        int i13 = this.mBufferWidth;
        int i14 = this.mBufferHeight;
        ArrayList renders = getRenders();
        if (renders != null) {
            int size = renders.size();
            DrawIntTexAttribute drawIntTexAttribute2 = null;
            int i15 = 0;
            while (i15 < size) {
                Render render = (Render) renders.get(i15);
                boolean z3 = i15 < size + -1;
                if (z3) {
                    i6 = size;
                    beginBindFrameBuffer(this.mFrameBuffers[i15], i13, i14);
                } else {
                    i6 = size;
                }
                if (i15 != 0) {
                    i7 = i15;
                    arrayList = renders;
                    int i16 = i14;
                    int i17 = i13;
                    c = 11;
                    render.setPreviousFrameBufferInfo(this.mFrameBuffers[i7 - 1], i13, i14);
                    if (!z3) {
                        drawIntTexAttribute2.mX = i4;
                        drawIntTexAttribute2.mY = i3;
                        drawIntTexAttribute2.mWidth = i2;
                        drawIntTexAttribute2.mHeight = i;
                    }
                    render.draw(drawIntTexAttribute2);
                } else if (11 == target || !z3) {
                    i7 = i15;
                    c = 11;
                    arrayList = renders;
                    int i18 = i14;
                    int i19 = i13;
                    render.draw(drawAttribute2);
                    i14 = i18;
                    i13 = i19;
                } else {
                    i7 = i15;
                    c = 11;
                    arrayList = renders;
                    int i20 = i14;
                    int i21 = i13;
                    drawIntTexAttribute2 = new DrawIntTexAttribute(i5, 0, 0, i13, i20, z);
                    render.draw(drawIntTexAttribute2);
                    i14 = i20;
                }
                if (z3) {
                    i8 = i14;
                    i9 = i13;
                    drawIntTexAttribute2 = new DrawIntTexAttribute(this.mFrameBufferTextures[i7], 0, 0, i13, i8, z);
                    endBindFrameBuffer();
                } else {
                    i8 = i14;
                    i9 = i13;
                }
                i15 = i7 + 1;
                i13 = i9;
                i14 = i8;
                size = i6;
                char c2 = c;
                renders = arrayList;
            }
        }
        return true;
    }

    public boolean drawOnExtraFrameBufferOnce(DrawAttribute drawAttribute) {
        int i;
        int i2;
        int target = drawAttribute.getTarget();
        switch (target) {
            case 5:
                DrawBasicTexAttribute drawBasicTexAttribute = (DrawBasicTexAttribute) drawAttribute;
                i = drawBasicTexAttribute.mWidth;
                i2 = drawBasicTexAttribute.mHeight;
                break;
            case 6:
                DrawIntTexAttribute drawIntTexAttribute = (DrawIntTexAttribute) drawAttribute;
                i = drawIntTexAttribute.mWidth;
                i2 = drawIntTexAttribute.mHeight;
                break;
            default:
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("unsupported target ");
                sb.append(target);
                Log.w(str, sb.toString());
                i2 = 0;
                i = 0;
                break;
        }
        if (i == 0 || i2 == 0) {
            Log.e(TAG, String.format(Locale.ENGLISH, "invalid size: %dx%d", new Object[]{Integer.valueOf(i), Integer.valueOf(i2)}));
            return false;
        }
        ArrayList renders = getRenders();
        if (renders != null) {
            int size = renders.size();
            if (size == 1) {
                ((Render) renders.get(0)).draw(drawAttribute);
            } else {
                Log.e(TAG, String.format(Locale.ENGLISH, "renders more than 1: %d", new Object[]{Integer.valueOf(size)}));
            }
        }
        return true;
    }

    public void reInitFrameBuffers(int i, int i2) {
        destroyFrameBuffers();
        initFrameBuffers(Math.max(2, getRenderSize() - 1), i, i2);
    }

    public void setFrameBufferSize(int i, int i2) {
        if (this.mBufferWidth != i || this.mBufferHeight != i2) {
            this.mBufferWidth = i;
            this.mBufferHeight = i2;
            reInitFrameBuffers(i, i2);
        }
    }
}
