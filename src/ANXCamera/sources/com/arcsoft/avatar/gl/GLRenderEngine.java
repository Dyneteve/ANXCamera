package com.arcsoft.avatar.gl;

import android.opengl.GLES20;
import android.opengl.GLES30;
import com.arcsoft.avatar.util.ASVLOFFSCREEN;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;

public class GLRenderEngine {
    public static String FRAGMENT_SHADER_NV21 = "#version 310 es\nprecision mediump float;\nlayout(location = 0) in vec2 v_texCoord;\nout vec4 outColor;\nuniform sampler2D y_sampler;\nuniform sampler2D uv_sampler;\nvoid main() {vec3 yuv;\nvec3 rgb;\nvec4 temp;\nyuv.x = texture(y_sampler,v_texCoord).r;\ntemp = texture(uv_sampler,v_texCoord);\nyuv.y = temp.a - 0.5;\nyuv.z = temp.r - 0.5;\nrgb = mat3(1.0,1.0,1.0,   0.0,-0.344,1.770,   1.403,-0.714,0.0) * yuv;\noutColor = vec4(rgb,1.0);\n}";
    public static String FRAGMENT_SHADER_RGBA8 = "#version 310 es\nprecision mediump float;\nlayout(location = 0) in vec2 v_texCoord;\nout vec4 outColor;\nuniform sampler2D rgba_sampler;\nvoid main(){outColor = texture(rgba_sampler,v_texCoord);\n}";
    public static final int MIRROR_MIRROR = 1;
    public static final int MIRROR_NO_MIRROR = 0;
    public static final int VERTEX_FLIP_Y = 1;
    public static final int VERTEX_NO_FLIP_Y = 0;
    public static String VERTEX_SHADER = "#version 310 es\nlayout(location = 0) in vec3 a_position;\nlayout(location = 1) in vec2 a_texCoord;\nuniform int needFlipY;\nuniform float depth_value;\nlayout (location = 0) out vec2 v_texCoord;\nvoid main() {vec3 newPos = a_position;\nif(1==needFlipY){ newPos = vec3(a_position.x,a_position.y * -1.0,a_position.z);\n}gl_Position = vec4(newPos.xy,depth_value,1.0);\nv_texCoord = a_texCoord;\n}";
    private static final String a = GLRenderEngine.class.getSimpleName();
    private static final String b = "y_sampler";
    private static final String c = "uv_sampler";
    private static final String d = "rgba_sampler";
    private static final String e = "needFlipY";
    private static final String f = "depth_value";
    private static final float g = 1.0f;
    private int A;
    private boolean B;
    private int C;
    private int D;
    private GLFramebuffer E;
    private float F;
    private float h;
    private int[] i;
    private int[] j;
    private int[] k;
    private int[] l;
    private int m;
    private int n;
    private int o;
    private int[] p;
    private int[] q;
    private FloatBuffer r;
    private FloatBuffer s;
    private int t;
    private float[] u;
    private float[] v;
    private final int w;
    private final int x;
    private int[] y;
    private int z;

    public GLRenderEngine(int i2) {
        this.h = 1.0f;
        this.i = new int[2];
        this.j = new int[1];
        this.k = new int[2];
        this.l = new int[1];
        this.m = -1;
        this.n = -1;
        this.p = new int[2];
        this.q = new int[1];
        this.u = new float[]{-1.0f, 1.0f, 0.0f, -1.0f, -1.0f, 0.0f, 1.0f, -1.0f, 0.0f, 1.0f, 1.0f, 0.0f};
        this.v = new float[]{0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f, 0.0f};
        this.w = this.u.length * 4;
        this.x = this.v.length * 4;
        this.y = new int[4];
        this.z = 0;
        this.A = 0;
        this.t = i2;
    }

    public GLRenderEngine(int i2, int i3) {
        this.h = 1.0f;
        this.i = new int[2];
        this.j = new int[1];
        this.k = new int[2];
        this.l = new int[1];
        this.m = -1;
        this.n = -1;
        this.p = new int[2];
        this.q = new int[1];
        this.u = new float[]{-1.0f, 1.0f, 0.0f, -1.0f, -1.0f, 0.0f, 1.0f, -1.0f, 0.0f, 1.0f, 1.0f, 0.0f};
        this.v = new float[]{0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f, 0.0f};
        this.w = this.u.length * 4;
        this.x = this.v.length * 4;
        this.y = new int[4];
        this.z = i2;
        this.A = i3;
        this.t = 2050;
    }

    public GLRenderEngine(int i2, int i3, int i4) {
        this.h = 1.0f;
        this.i = new int[2];
        this.j = new int[1];
        this.k = new int[2];
        this.l = new int[1];
        this.m = -1;
        this.n = -1;
        this.p = new int[2];
        this.q = new int[1];
        this.u = new float[]{-1.0f, 1.0f, 0.0f, -1.0f, -1.0f, 0.0f, 1.0f, -1.0f, 0.0f, 1.0f, 1.0f, 0.0f};
        this.v = new float[]{0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f, 0.0f};
        this.w = this.u.length * 4;
        this.x = this.v.length * 4;
        this.y = new int[4];
        this.z = i2;
        this.A = i3;
        this.t = i4;
    }

    private void a() {
        GLES20.glUseProgram(this.o);
        GLES30.glBindVertexArray(this.q[0]);
        int i2 = this.t;
        if (i2 == 773) {
            GLES20.glUniform1i(this.l[0], 3);
        } else if (i2 == 2050) {
            GLES20.glUniform1i(this.k[0], 0);
            GLES20.glUniform1i(this.k[1], 1);
        } else {
            return;
        }
        if (1 == this.D) {
            GLES20.glUniform1i(this.m, 1);
        } else {
            GLES20.glUniform1i(this.m, 0);
        }
        GLES20.glUniform1f(this.n, this.F);
        GLES20.glDrawArrays(6, 0, 4);
        GLES30.glBindVertexArray(0);
        GLES20.glBindTexture(3553, 0);
    }

    private void a(float[] fArr) {
        if (this.B) {
            int i2 = this.C;
            if (i2 == 0) {
                fArr[0] = this.h;
                fArr[1] = 0.0f;
                fArr[2] = this.h;
                fArr[3] = 1.0f;
                fArr[4] = 0.0f;
                fArr[5] = 1.0f;
                fArr[6] = 0.0f;
                fArr[7] = 0.0f;
            } else if (i2 == 90) {
                fArr[0] = this.h;
                fArr[1] = 1.0f;
                fArr[2] = 0.0f;
                fArr[3] = 1.0f;
                fArr[4] = 0.0f;
                fArr[5] = 0.0f;
                fArr[6] = this.h;
                fArr[7] = 0.0f;
            } else if (i2 == 180) {
                fArr[0] = 0.0f;
                fArr[1] = 1.0f;
                fArr[2] = 0.0f;
                fArr[3] = 0.0f;
                fArr[4] = this.h;
                fArr[5] = 0.0f;
                fArr[6] = this.h;
                fArr[7] = 1.0f;
            } else if (i2 == 270) {
                fArr[0] = 0.0f;
                fArr[1] = 0.0f;
                fArr[2] = this.h;
                fArr[3] = 0.0f;
                fArr[4] = this.h;
                fArr[5] = 1.0f;
                fArr[6] = 0.0f;
                fArr[7] = 1.0f;
            }
        } else {
            int i3 = this.C;
            if (i3 == 0) {
                fArr[0] = 0.0f;
                fArr[1] = 0.0f;
                fArr[2] = 0.0f;
                fArr[3] = 1.0f;
                fArr[4] = this.h;
                fArr[5] = 1.0f;
                fArr[6] = this.h;
                fArr[7] = 0.0f;
            } else if (i3 == 90) {
                fArr[0] = 0.0f;
                fArr[1] = 1.0f;
                fArr[2] = this.h;
                fArr[3] = 1.0f;
                fArr[4] = this.h;
                fArr[5] = 0.0f;
                fArr[6] = 0.0f;
                fArr[7] = 0.0f;
            } else if (i3 == 180) {
                fArr[0] = this.h;
                fArr[1] = 1.0f;
                fArr[2] = this.h;
                fArr[3] = 0.0f;
                fArr[4] = 0.0f;
                fArr[5] = 0.0f;
                fArr[6] = 0.0f;
                fArr[7] = 1.0f;
            } else if (i3 == 270) {
                fArr[0] = this.h;
                fArr[1] = 0.0f;
                fArr[2] = 0.0f;
                fArr[3] = 0.0f;
                fArr[4] = 0.0f;
                fArr[5] = 1.0f;
                fArr[6] = this.h;
                fArr[7] = 1.0f;
            }
        }
        GLES20.glBindBuffer(34962, this.p[1]);
        this.s.position(0);
        this.s.put(fArr);
        this.s.position(0);
        GLES20.glBufferData(34962, fArr.length * 4, this.s, 35048);
    }

    private void b() {
        this.D = 0;
        this.B = false;
        this.C = 0;
        this.A = 0;
        this.z = 0;
        this.o = 0;
    }

    private void c() {
        GLES20.glTexParameteri(3553, 10242, 33071);
        GLES20.glTexParameteri(3553, 10243, 33071);
        GLES20.glTexParameteri(3553, 10241, 9728);
        GLES20.glTexParameteri(3553, 10240, 9729);
    }

    public void initNv21TextureIds() {
        GLES20.glGenTextures(2, this.i, 0);
        GLES20.glBindTexture(3553, this.i[0]);
        c();
        GLES20.glBindTexture(3553, 0);
        GLES20.glBindTexture(3553, this.i[1]);
        c();
        GLES20.glBindTexture(3553, 0);
        this.o = ShaderManager.createProgram(VERTEX_SHADER, FRAGMENT_SHADER_NV21);
        this.k[0] = GLES20.glGetUniformLocation(this.o, b);
        this.k[1] = GLES20.glGetUniformLocation(this.o, c);
        this.m = GLES20.glGetUniformLocation(this.o, e);
        this.n = GLES20.glGetUniformLocation(this.o, f);
    }

    public void initRgbaTextureIds() {
        this.o = ShaderManager.createProgram(VERTEX_SHADER, FRAGMENT_SHADER_RGBA8);
        this.l[0] = GLES20.glGetUniformLocation(this.o, d);
        this.m = GLES20.glGetUniformLocation(this.o, e);
        this.n = GLES20.glGetUniformLocation(this.o, f);
    }

    public void initVao() {
        this.F = 0.0f;
        GLES30.glGenVertexArrays(1, this.q, 0);
        GLES30.glBindVertexArray(this.q[0]);
        GLES20.glGenBuffers(2, this.p, 0);
        GLES20.glBindBuffer(34962, this.p[0]);
        ByteBuffer allocateDirect = ByteBuffer.allocateDirect(this.w);
        allocateDirect.order(ByteOrder.nativeOrder());
        this.r = allocateDirect.asFloatBuffer();
        this.r.position(0);
        this.r.put(this.u);
        this.r.position(0);
        GLES20.glBufferData(34962, this.w, this.r, 35044);
        GLES20.glEnableVertexAttribArray(0);
        GLES20.glVertexAttribPointer(0, 3, 5126, false, 12, 0);
        GLES20.glBindBuffer(34962, this.p[1]);
        ByteBuffer allocateDirect2 = ByteBuffer.allocateDirect(this.x);
        allocateDirect2.order(ByteOrder.nativeOrder());
        this.s = allocateDirect2.asFloatBuffer();
        this.s.position(0);
        this.s.put(this.v);
        this.s.position(0);
        GLES20.glBufferData(34962, this.x, this.s, 35044);
        GLES20.glEnableVertexAttribArray(1);
        GLES20.glVertexAttribPointer(1, 2, 5126, false, 8, 0);
        GLES20.glBindBuffer(34962, 0);
        GLES30.glBindVertexArray(0);
    }

    public void renderWithImageBuffer(ASVLOFFSCREEN asvloffscreen) {
        if (this.t == 2050) {
            int i2 = asvloffscreen.getRowStride()[0];
            int height = asvloffscreen.getHeight() * i2;
            ByteBuffer wrap = ByteBuffer.wrap(asvloffscreen.getYData(), 0, height);
            wrap.position(0);
            int i3 = height >> 1;
            ByteBuffer allocate = ByteBuffer.allocate(i3);
            allocate.put(asvloffscreen.getYData(), height, i3);
            allocate.position(0);
            GLES20.glActiveTexture(33984);
            GLES20.glBindTexture(3553, this.i[0]);
            GLES20.glTexImage2D(3553, 0, 6409, i2, asvloffscreen.getHeight(), 0, 6409, 5121, wrap);
            GLES20.glActiveTexture(33985);
            GLES20.glBindTexture(3553, this.i[1]);
            GLES20.glTexImage2D(3553, 0, 6410, i2 >> 1, asvloffscreen.getHeight() >> 1, 0, 6410, 5121, allocate);
            a();
        }
    }

    public void renderWithTextureId(int i2) {
        int i3 = this.t;
        if (i3 == 773) {
            GLES20.glActiveTexture(33987);
            GLES20.glBindTexture(3553, i2);
        } else if (i3 != 2050) {
        }
        a();
    }

    public void setDepthValue(float f2) {
        this.F = f2;
    }

    public void setEnableFlipY(int i2) {
        this.D = i2;
    }

    public void setMirrorAndDegree(boolean z2, int i2) {
        this.B = z2;
        this.C = i2;
        a(new float[this.v.length]);
    }

    public void setPitches(int[] iArr) {
        if (iArr == null) {
            int[] iArr2 = this.y;
            int[] iArr3 = this.y;
            int i2 = this.z;
            iArr3[1] = i2;
            iArr2[0] = i2;
            return;
        }
        this.y[0] = iArr[0];
        this.y[1] = iArr[1];
        int[] iArr4 = this.y;
        int[] iArr5 = this.y;
        int i3 = this.y[1];
        iArr5[3] = i3;
        iArr4[2] = i3;
        if (this.z != this.y[0]) {
            float f2 = 1.0f - ((((float) (this.y[0] - this.z)) + 1.0f) / ((float) this.y[0]));
            float[] fArr = this.v;
            this.v[6] = f2;
            fArr[4] = f2;
            this.h = f2;
        }
    }

    public void unInit() {
        if (this.o != 0) {
            GLES20.glDeleteProgram(this.o);
            this.o = 0;
        }
        if (this.q[0] != 0) {
            GLES30.glDeleteVertexArrays(1, this.q, 0);
            this.q[0] = 0;
        }
        if (this.i[0] != 0) {
            GLES20.glDeleteTextures(2, this.i, 0);
            int[] iArr = this.i;
            this.i[1] = 0;
            iArr[0] = 0;
        }
        if (this.j[0] != 0) {
            GLES20.glDeleteTextures(1, this.j, 0);
            this.j[0] = 0;
        }
        if (this.p[0] != 0) {
            GLES20.glDeleteBuffers(2, this.p, 0);
            int[] iArr2 = this.p;
            this.p[1] = 0;
            iArr2[0] = 0;
        }
        b();
    }
}
