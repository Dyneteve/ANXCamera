package com.miui.filtersdk.utils;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.opengl.GLES20;
import android.opengl.GLUtils;
import android.util.Log;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.Buffer;

public class OpenGlUtils {
    public static final int NOT_INIT = -1;
    public static final int NO_TEXTURE = -1;
    public static final int ON_DRAWN = 1;
    private static final String TAG = "OpenGlUtils";

    public static void checkGlError(String str) {
        int glGetError = GLES20.glGetError();
        if (glGetError != 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(": glError 0x");
            sb.append(Integer.toHexString(glGetError));
            String sb2 = sb.toString();
            Log.e(TAG, sb2);
            throw new RuntimeException(sb2);
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:12:0x0021, code lost:
        r0 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0022, code lost:
        r1 = r0;
        r0 = r2;
        r2 = r1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x0026, code lost:
        r3 = th;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:25:?, code lost:
        r0.close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:29:?, code lost:
        r2.close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:30:0x0043, code lost:
        r2 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:31:0x0044, code lost:
        r2.printStackTrace();
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Removed duplicated region for block: B:14:0x0026 A[ExcHandler: all (th java.lang.Throwable), Splitter:B:3:0x000f] */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0038 A[SYNTHETIC, Splitter:B:24:0x0038] */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x003f A[SYNTHETIC, Splitter:B:28:0x003f] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static Bitmap getImageFromAssetsFile(Context context, String str) {
        Bitmap bitmap;
        InputStream inputStream = null;
        try {
            InputStream inputStream2 = context.getResources().getAssets().open(str);
            try {
                bitmap = BitmapFactory.decodeStream(inputStream2);
                inputStream2.close();
                if (inputStream2 != null) {
                    try {
                        inputStream2.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            } catch (IOException e2) {
                inputStream = inputStream2;
                e = e2;
                bitmap = null;
                try {
                    e.printStackTrace();
                    if (inputStream != null) {
                    }
                    return bitmap;
                } catch (Throwable th) {
                    th = th;
                    inputStream2 = inputStream;
                    if (inputStream2 != null) {
                    }
                    throw th;
                }
            } catch (Throwable th2) {
            }
        } catch (IOException e3) {
            e = e3;
            bitmap = null;
            e.printStackTrace();
            if (inputStream != null) {
            }
            return bitmap;
        }
        return bitmap;
    }

    /* JADX WARNING: Removed duplicated region for block: B:24:0x0030 A[SYNTHETIC, Splitter:B:24:0x0030] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static Bitmap getImageFromPath(String str) {
        InputStream inputStream;
        InputStream inputStream2 = null;
        try {
            inputStream = new FileInputStream(str);
            try {
                Bitmap decodeStream = BitmapFactory.decodeStream(inputStream);
                try {
                    inputStream.close();
                    return decodeStream;
                } catch (IOException e) {
                    e.printStackTrace();
                    return decodeStream;
                }
            } catch (IOException e2) {
                e = e2;
            }
        } catch (IOException e3) {
            e = e3;
            inputStream = null;
            try {
                e.printStackTrace();
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException e4) {
                        e4.printStackTrace();
                    }
                }
                return null;
            } catch (Throwable th) {
                th = th;
                inputStream2 = inputStream;
                if (inputStream2 != null) {
                }
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            if (inputStream2 != null) {
                try {
                    inputStream2.close();
                } catch (IOException e5) {
                    e5.printStackTrace();
                }
            }
            throw th;
        }
    }

    public static int initEffectTexture(int i, int i2, int[] iArr, int i3) {
        if (iArr == null || iArr.length < 1) {
            return -1;
        }
        if (iArr[0] == -1) {
            GLES20.glGenTextures(1, iArr, 0);
            GLES20.glBindTexture(i3, iArr[0]);
            GLES20.glTexParameterf(i3, 10240, 9729.0f);
            GLES20.glTexParameterf(i3, 10241, 9729.0f);
            GLES20.glTexParameterf(i3, 10242, 33071.0f);
            GLES20.glTexParameterf(i3, 10243, 33071.0f);
            GLES20.glTexImage2D(i3, 0, 6408, i, i2, 0, 6408, 5121, null);
        } else {
            GLES20.glBindTexture(i3, iArr[0]);
            GLES20.glTexImage2D(i3, 0, 6408, i, i2, 0, 6408, 5121, null);
        }
        return iArr[0];
    }

    public static int loadProgram(String str, String str2) {
        int[] iArr = new int[1];
        int loadShader = loadShader(str, 35633);
        if (loadShader == 0) {
            Log.d("Load Program", "Vertex Shader Failed");
            return 0;
        }
        int loadShader2 = loadShader(str2, 35632);
        if (loadShader2 == 0) {
            Log.d("Load Program", "Fragment Shader Failed");
            return 0;
        }
        int glCreateProgram = GLES20.glCreateProgram();
        GLES20.glAttachShader(glCreateProgram, loadShader);
        GLES20.glAttachShader(glCreateProgram, loadShader2);
        GLES20.glLinkProgram(glCreateProgram);
        GLES20.glGetProgramiv(glCreateProgram, 35714, iArr, 0);
        if (iArr[0] <= 0) {
            Log.d("Load Program", "Linking Failed");
            return 0;
        }
        GLES20.glDeleteShader(loadShader);
        GLES20.glDeleteShader(loadShader2);
        return glCreateProgram;
    }

    private static int loadShader(String str, int i) {
        int[] iArr = new int[1];
        int glCreateShader = GLES20.glCreateShader(i);
        GLES20.glShaderSource(glCreateShader, str);
        GLES20.glCompileShader(glCreateShader);
        GLES20.glGetShaderiv(glCreateShader, 35713, iArr, 0);
        if (iArr[0] != 0) {
            return glCreateShader;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Compilation\n");
        sb.append(GLES20.glGetShaderInfoLog(glCreateShader));
        Log.e("Load Shader Failed", sb.toString());
        return 0;
    }

    public static int loadTexture(Context context, String str) {
        int[] iArr = new int[1];
        GLES20.glGenTextures(1, iArr, 0);
        if (iArr[0] != 0) {
            Bitmap imageFromAssetsFile = getImageFromAssetsFile(context, str);
            GLES20.glBindTexture(3553, iArr[0]);
            GLES20.glTexParameteri(3553, 10240, 9729);
            GLES20.glTexParameteri(3553, 10241, 9729);
            GLES20.glTexParameteri(3553, 10242, 33071);
            GLES20.glTexParameteri(3553, 10243, 33071);
            GLUtils.texImage2D(3553, 0, imageFromAssetsFile, 0);
            imageFromAssetsFile.recycle();
        }
        if (iArr[0] != 0) {
            return iArr[0];
        }
        Log.e(TAG, String.format("loadTexture failed,path:%s", new Object[]{str}));
        return -1;
    }

    public static int loadTexture(Bitmap bitmap, int i) {
        return loadTexture(bitmap, i, false);
    }

    public static int loadTexture(Bitmap bitmap, int i, boolean z) {
        if (bitmap == null) {
            return -1;
        }
        int[] iArr = new int[1];
        if (i == -1) {
            GLES20.glGenTextures(1, iArr, 0);
            GLES20.glBindTexture(3553, iArr[0]);
            GLES20.glTexParameterf(3553, 10240, 9729.0f);
            GLES20.glTexParameterf(3553, 10241, 9729.0f);
            GLES20.glTexParameterf(3553, 10242, 33071.0f);
            GLES20.glTexParameterf(3553, 10243, 33071.0f);
            GLUtils.texImage2D(3553, 0, bitmap, 0);
        } else {
            GLES20.glBindTexture(3553, i);
            GLUtils.texImage2D(3553, 0, bitmap, 0);
            iArr[0] = i;
        }
        if (z) {
            bitmap.recycle();
        }
        return iArr[0];
    }

    public static int loadTexture(Buffer buffer, int i, int i2, int i3) {
        int i4 = i3;
        if (buffer == null) {
            return -1;
        }
        int[] iArr = new int[1];
        if (i4 == -1) {
            GLES20.glGenTextures(1, iArr, 0);
            GLES20.glBindTexture(3553, iArr[0]);
            GLES20.glTexParameterf(3553, 10240, 9729.0f);
            GLES20.glTexParameterf(3553, 10241, 9729.0f);
            GLES20.glTexParameterf(3553, 10242, 33071.0f);
            GLES20.glTexParameterf(3553, 10243, 33071.0f);
            GLES20.glTexImage2D(3553, 0, 6408, i, i2, 0, 6408, 5121, buffer);
        } else {
            GLES20.glBindTexture(3553, i4);
            GLES20.glTexSubImage2D(3553, 0, 0, 0, i, i2, 6408, 5121, buffer);
            iArr[0] = i4;
        }
        return iArr[0];
    }

    public static int loadTexture(Buffer buffer, int i, int i2, int i3, int i4) {
        int i5 = i3;
        if (buffer == null) {
            return -1;
        }
        int[] iArr = new int[1];
        if (i5 == -1) {
            GLES20.glGenTextures(1, iArr, 0);
            GLES20.glBindTexture(3553, iArr[0]);
            GLES20.glTexParameterf(3553, 10240, 9729.0f);
            GLES20.glTexParameterf(3553, 10241, 9729.0f);
            GLES20.glTexParameterf(3553, 10242, 33071.0f);
            GLES20.glTexParameterf(3553, 10243, 33071.0f);
            GLES20.glTexImage2D(3553, 0, 6408, i, i2, 0, 6408, i4, buffer);
        } else {
            GLES20.glBindTexture(3553, i5);
            GLES20.glTexSubImage2D(3553, 0, 0, 0, i, i2, 6408, i4, buffer);
            iArr[0] = i5;
        }
        return iArr[0];
    }

    public static int loadTextureFromPath(String str) {
        int[] iArr = new int[1];
        GLES20.glGenTextures(1, iArr, 0);
        if (iArr[0] != 0) {
            Bitmap imageFromPath = getImageFromPath(str);
            GLES20.glBindTexture(3553, iArr[0]);
            GLES20.glTexParameteri(3553, 10240, 9729);
            GLES20.glTexParameteri(3553, 10241, 9729);
            GLES20.glTexParameteri(3553, 10242, 33071);
            GLES20.glTexParameteri(3553, 10243, 33071);
            GLUtils.texImage2D(3553, 0, imageFromPath, 0);
            imageFromPath.recycle();
        }
        if (iArr[0] != 0) {
            return iArr[0];
        }
        throw new RuntimeException("Error loading texture.");
    }

    public static void loadYuvToTextures(Buffer buffer, Buffer buffer2, int i, int i2, int[] iArr) {
        int i3;
        float f;
        int[] iArr2 = iArr;
        if (buffer != null && buffer2 != null && iArr2 != null && iArr2.length >= 2) {
            if (iArr2[0] == -1) {
                GLES20.glGenTextures(1, iArr2, 0);
                GLES20.glActiveTexture(33984);
                GLES20.glBindTexture(3553, iArr2[0]);
                f = 9729.0f;
                i3 = 10240;
                GLES20.glTexImage2D(3553, 0, 6409, i, i2, 0, 6409, 5121, buffer);
                GLES20.glTexParameterf(3553, 10240, 9729.0f);
                GLES20.glTexParameterf(3553, 10241, 9729.0f);
                GLES20.glTexParameterf(3553, 10242, 33071.0f);
                GLES20.glTexParameterf(3553, 10243, 33071.0f);
            } else {
                f = 9729.0f;
                i3 = 10240;
                GLES20.glActiveTexture(33984);
                GLES20.glBindTexture(3553, iArr2[0]);
                GLES20.glTexImage2D(3553, 0, 6409, i, i2, 0, 6409, 5121, buffer);
            }
            if (iArr2[1] == -1) {
                GLES20.glGenTextures(1, iArr2, 1);
                GLES20.glActiveTexture(33985);
                GLES20.glBindTexture(3553, iArr2[1]);
                GLES20.glTexImage2D(3553, 0, 6410, i / 2, i2 / 2, 0, 6410, 5121, buffer2);
                GLES20.glTexParameterf(3553, i3, f);
                GLES20.glTexParameterf(3553, 10241, f);
                GLES20.glTexParameterf(3553, 10242, 33071.0f);
                GLES20.glTexParameterf(3553, 10243, 33071.0f);
            } else {
                GLES20.glActiveTexture(33985);
                GLES20.glBindTexture(3553, iArr2[1]);
                GLES20.glTexImage2D(3553, 0, 6410, i / 2, i2 / 2, 0, 6410, 5121, buffer2);
            }
        }
    }
}
