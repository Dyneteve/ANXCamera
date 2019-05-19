package com.miui.filtersdk.filter;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.opengl.GLES20;
import android.os.Environment;
import android.util.Log;
import com.android.camera.storage.Storage;
import com.miui.filtersdk.filter.base.BaseBeautyFilter;
import com.miui.filtersdk.utils.OpenGlUtils;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.nio.ByteBuffer;
import java.nio.FloatBuffer;

public class NewBeautificationFilter extends BaseBeautyFilter {
    private static final String TAG = "BeautificationFilter";
    public static final String fragmentShader = "precision highp float;                             \nvarying vec2 v_texCoord;                           \nuniform sampler2D texture;                         \nvoid main (void){                                  \n   vec3 rgb = texture2D(texture, v_texCoord).rgb;  \n   gl_FragColor = vec4(rgb, 1.0);                  \n}                                                  \n";
    public static final String vertexShader = "attribute vec4 a_position;                         \nattribute vec2 a_texCoord;                         \nvarying vec2 v_texCoord;                           \nvoid main(){                                       \n   gl_Position = a_position;                       \n   v_texCoord = a_texCoord;                        \n}                                                  \n";
    private int mWindowHeight;
    private int mWindowWidth;
    /* access modifiers changed from: private */
    public boolean mbGetValidTexureID = false;

    public static String dumpMatrix(float[] fArr) {
        int length = fArr.length;
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < length; i++) {
            sb.append(String.format("%f", new Object[]{Float.valueOf(fArr[i])}));
            if (i != length - 1) {
                sb.append(" ");
            }
        }
        sb.append("]");
        return sb.toString();
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x0077 A[SYNTHETIC, Splitter:B:23:0x0077] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static void dumpToBitmap(int i, int i2, ByteBuffer byteBuffer) {
        FileOutputStream fileOutputStream;
        if (byteBuffer != null) {
            Bitmap createBitmap = Bitmap.createBitmap(i, i2, Config.ARGB_8888);
            createBitmap.copyPixelsFromBuffer(byteBuffer);
            StringBuilder sb = new StringBuilder();
            sb.append(Environment.getExternalStorageDirectory().getPath());
            sb.append("/hehe/");
            sb.append(System.currentTimeMillis());
            sb.append(Storage.JPEG_SUFFIX);
            String sb2 = sb.toString();
            FileOutputStream fileOutputStream2 = null;
            try {
                fileOutputStream = new FileOutputStream(new File(sb2));
                try {
                    createBitmap.compress(CompressFormat.JPEG, 100, fileOutputStream);
                    String str = TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("dump to ");
                    sb3.append(sb2);
                    Log.d(str, sb3.toString());
                } catch (FileNotFoundException e) {
                    e = e;
                    fileOutputStream2 = fileOutputStream;
                } catch (Throwable th) {
                    th = th;
                    if (fileOutputStream != null) {
                    }
                    throw th;
                }
                try {
                    fileOutputStream.close();
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            } catch (FileNotFoundException e3) {
                e = e3;
                try {
                    e.printStackTrace();
                    if (fileOutputStream2 != null) {
                        fileOutputStream2.close();
                    }
                } catch (Throwable th2) {
                    th = th2;
                    fileOutputStream = fileOutputStream2;
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.close();
                        } catch (Exception e4) {
                            e4.printStackTrace();
                        }
                    }
                    throw th;
                }
            }
        }
    }

    private void initBeauty() {
        this.mBeautyProcessor.init(this.mWindowWidth, this.mWindowHeight);
    }

    public void init() {
        onInit();
        initBeauty();
    }

    public void initBeautyProcessor(int i, int i2) {
        if (this.mBeautyProcessor != null) {
            this.mWindowWidth = i;
            this.mWindowHeight = i2;
        }
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
        this.mTextureId = -1;
        this.mbGetValidTexureID = false;
        this.mBeautyProcessor.release();
    }

    public void onDisplaySizeChanged(int i, int i2) {
        super.onDisplaySizeChanged(i, i2);
        this.mBeautyProcessor.onDisplaySizeChanged(i, i2);
    }

    public int onDrawFrame(int i, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
        runPendingOnDrawTasks();
        if (!this.mIsInitialized) {
            return -1;
        }
        GLES20.glUseProgram(this.mGLProgId);
        floatBuffer.position(0);
        GLES20.glVertexAttribPointer(this.mGLAttribPosition, 2, 5126, false, 0, floatBuffer);
        GLES20.glEnableVertexAttribArray(this.mGLAttribPosition);
        floatBuffer2.position(0);
        GLES20.glVertexAttribPointer(this.mGLAttribTextureCoordinate, 2, 5126, false, 0, floatBuffer2);
        GLES20.glEnableVertexAttribArray(this.mGLAttribTextureCoordinate);
        if (this.mTextureId != -1 && this.mbGetValidTexureID) {
            GLES20.glActiveTexture(33984);
            GLES20.glBindTexture(3553, this.mTextureId);
            GLES20.glUniform1i(this.mGLUniformTexture, 0);
        }
        onDrawArraysPre();
        GLES20.glDrawArrays(5, 0, 4);
        GLES20.glDisableVertexAttribArray(this.mGLAttribPosition);
        GLES20.glDisableVertexAttribArray(this.mGLAttribTextureCoordinate);
        onDrawArraysAfter();
        GLES20.glBindTexture(3553, 0);
        return 1;
    }

    public int onDrawToTexture(int i, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
        if (this.mFrameBuffers == null) {
            return -1;
        }
        runPendingOnDrawTasks();
        if (!isInitialized() || this.mTextureId == -1 || !this.mbGetValidTexureID) {
            return -1;
        }
        GLES20.glViewport(0, 0, this.mFrameWidth, this.mFrameHeight);
        GLES20.glBindFramebuffer(36160, this.mFrameBuffers[0]);
        GLES20.glUseProgram(this.mGLProgId);
        floatBuffer.position(0);
        GLES20.glVertexAttribPointer(this.mGLAttribPosition, 2, 5126, false, 0, floatBuffer);
        GLES20.glEnableVertexAttribArray(this.mGLAttribPosition);
        floatBuffer2.position(0);
        GLES20.glVertexAttribPointer(this.mGLAttribTextureCoordinate, 2, 5126, false, 0, floatBuffer2);
        GLES20.glEnableVertexAttribArray(this.mGLAttribTextureCoordinate);
        if (this.mTextureId != -1 && this.mbGetValidTexureID) {
            GLES20.glActiveTexture(33984);
            GLES20.glBindTexture(3553, this.mTextureId);
            GLES20.glUniform1i(this.mGLUniformTexture, 0);
        }
        onDrawArraysPre();
        GLES20.glDrawArrays(5, 0, 4);
        GLES20.glDisableVertexAttribArray(this.mGLAttribPosition);
        GLES20.glDisableVertexAttribArray(this.mGLAttribTextureCoordinate);
        onDrawArraysAfter();
        GLES20.glBindTexture(3553, 0);
        GLES20.glBindFramebuffer(36160, 0);
        GLES20.glViewport(0, 0, this.mOutputWidth, this.mOutputHeight);
        return this.mFrameBufferTextures[0];
    }

    /* access modifiers changed from: protected */
    public void onInit() {
        this.mGLProgId = OpenGlUtils.loadProgram("attribute vec4 a_position;                         \nattribute vec2 a_texCoord;                         \nvarying vec2 v_texCoord;                           \nvoid main(){                                       \n   gl_Position = a_position;                       \n   v_texCoord = a_texCoord;                        \n}                                                  \n", fragmentShader);
        this.mGLAttribPosition = GLES20.glGetAttribLocation(this.mGLProgId, "a_position");
        this.mGLAttribTextureCoordinate = GLES20.glGetAttribLocation(this.mGLProgId, "a_texCoord");
        this.mGLUniformTexture = GLES20.glGetUniformLocation(this.mGLProgId, "texture");
        initFrameBuffers(this.mWindowWidth, this.mWindowHeight);
        this.mIsInitialized = true;
    }

    public void onInputSizeChanged(int i, int i2) {
        super.onInputSizeChanged(i, i2);
        this.mBeautyProcessor.onDisplaySizeChanged(i, i2);
    }

    public void passPreviewFrameToTexture(final byte[] bArr, final int i, final int i2) {
        if (!hasPendingDrawTasks()) {
            runOnDraw(new Runnable() {
                public void run() {
                    NewBeautificationFilter.this.mTextureId = NewBeautificationFilter.this.mBeautyProcessor.beautify(bArr, i, i2);
                    NewBeautificationFilter.this.mbGetValidTexureID = true;
                }
            });
        }
    }
}
