package com.arcsoft.avatar.gl;

import android.opengl.GLES20;
import com.arcsoft.avatar.util.CodecLog;

public class ShaderManager {
    private static final String a = "Arc_ShaderManager";

    private static int a(int i, String str) {
        String a2 = a(i);
        int glCreateShader = GLES20.glCreateShader(i);
        if (glCreateShader == 0) {
            String str2 = a;
            StringBuilder sb = new StringBuilder();
            sb.append("create shader error, shader type=");
            sb.append(a2);
            sb.append(" , error=");
            sb.append(GLES20.glGetError());
            CodecLog.e(str2, sb.toString());
            return 0;
        }
        GLES20.glShaderSource(glCreateShader, str);
        GLES20.glCompileShader(glCreateShader);
        int[] iArr = new int[1];
        GLES20.glGetShaderiv(glCreateShader, 35713, iArr, 0);
        if (iArr[0] != 0) {
            return glCreateShader;
        }
        String glGetShaderInfoLog = GLES20.glGetShaderInfoLog(glCreateShader);
        String str3 = a;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("createShader shader = ");
        sb2.append(a2);
        sb2.append("  error: ");
        sb2.append(glGetShaderInfoLog);
        CodecLog.e(str3, sb2.toString());
        GLES20.glDeleteShader(glCreateShader);
        return 0;
    }

    private static String a(int i) {
        switch (i) {
            case 35632:
                return "fragment_shader";
            case 35633:
                return "vertext_shader";
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("invalid shader type = ");
                sb.append(i);
                return sb.toString();
        }
    }

    public static int createProgram(String str, String str2) {
        int glCreateProgram = GLES20.glCreateProgram();
        if (glCreateProgram == 0) {
            String str3 = a;
            StringBuilder sb = new StringBuilder();
            sb.append("create program error ,error=");
            sb.append(GLES20.glGetError());
            CodecLog.e(str3, sb.toString());
            return 0;
        }
        int a2 = a(35633, str);
        int a3 = a(35632, str2);
        if (a2 == 0 || a3 == 0) {
            GLES20.glDeleteShader(a2);
            GLES20.glDeleteShader(a3);
            GLES20.glDeleteProgram(glCreateProgram);
            return 0;
        }
        GLES20.glAttachShader(glCreateProgram, a2);
        GLES20.glAttachShader(glCreateProgram, a3);
        GLES20.glLinkProgram(glCreateProgram);
        int[] iArr = new int[1];
        GLES20.glGetProgramiv(glCreateProgram, 35714, iArr, 0);
        if (iArr[0] != 0) {
            return glCreateProgram;
        }
        String glGetProgramInfoLog = GLES20.glGetProgramInfoLog(glCreateProgram);
        String str4 = a;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("createProgram error : ");
        sb2.append(glGetProgramInfoLog);
        CodecLog.e(str4, sb2.toString());
        GLES20.glDeleteShader(a2);
        GLES20.glDeleteShader(a3);
        GLES20.glDeleteProgram(glCreateProgram);
        return 0;
    }
}
