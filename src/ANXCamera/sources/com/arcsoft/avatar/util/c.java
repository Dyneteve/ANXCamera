package com.arcsoft.avatar.util;

import android.content.res.Resources;
import android.opengl.GLES20;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;

/* compiled from: ShaderUtils */
public class c {
    private c() {
    }

    private static int a(int i, String str) {
        int glCreateShader = GLES20.glCreateShader(i);
        if (glCreateShader == 0) {
            return glCreateShader;
        }
        GLES20.glShaderSource(glCreateShader, str);
        GLES20.glCompileShader(glCreateShader);
        int[] iArr = new int[1];
        GLES20.glGetShaderiv(glCreateShader, 35713, iArr, 0);
        if (iArr[0] != 0) {
            return glCreateShader;
        }
        GLES20.glDeleteShader(glCreateShader);
        return 0;
    }

    public static int a(String str, String str2) {
        int a = a(35632, str2);
        if (a == 0) {
            return -1;
        }
        int a2 = a(35633, str);
        if (a2 == 0) {
            return -1;
        }
        int glCreateProgram = GLES20.glCreateProgram();
        if (glCreateProgram == 0) {
            return 0;
        }
        GLES20.glAttachShader(glCreateProgram, a2);
        a("glAttachShader");
        GLES20.glAttachShader(glCreateProgram, a);
        a("glAttachShader");
        GLES20.glLinkProgram(glCreateProgram);
        int[] iArr = new int[1];
        GLES20.glGetProgramiv(glCreateProgram, 35714, iArr, 0);
        if (iArr[0] != 1) {
            GLES20.glDeleteProgram(glCreateProgram);
            glCreateProgram = 0;
        }
        return glCreateProgram;
    }

    public static String a(String str, Resources resources) {
        String str2;
        try {
            InputStream open = resources.getAssets().open(str);
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            while (true) {
                int read = open.read();
                if (read != -1) {
                    byteArrayOutputStream.write(read);
                } else {
                    byte[] byteArray = byteArrayOutputStream.toByteArray();
                    byteArrayOutputStream.close();
                    open.close();
                    String str3 = new String(byteArray, "UTF-8");
                    try {
                        return str3.replaceAll("\\r\\n", "\n");
                    } catch (Exception e) {
                        Exception exc = e;
                        str2 = str3;
                        e = exc;
                        e.printStackTrace();
                        return str2;
                    }
                }
            }
        } catch (Exception e2) {
            e = e2;
            str2 = null;
            e.printStackTrace();
            return str2;
        }
    }

    public static void a(String str) {
        int glGetError = GLES20.glGetError();
        if (glGetError != 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(": glError ");
            sb.append(glGetError);
            throw new RuntimeException(sb.toString());
        }
    }
}
