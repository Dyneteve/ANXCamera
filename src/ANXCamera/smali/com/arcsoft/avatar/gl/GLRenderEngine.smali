.class public Lcom/arcsoft/avatar/gl/GLRenderEngine;
.super Ljava/lang/Object;
.source "GLRenderEngine.java"


# static fields
.field public static FRAGMENT_SHADER_NV21:Ljava/lang/String; = null

.field public static FRAGMENT_SHADER_RGBA8:Ljava/lang/String; = null

.field public static final MIRROR_MIRROR:I = 0x1

.field public static final MIRROR_NO_MIRROR:I = 0x0

.field public static final VERTEX_FLIP_Y:I = 0x1

.field public static final VERTEX_NO_FLIP_Y:I = 0x0

.field public static VERTEX_SHADER:Ljava/lang/String; = null

.field private static final a:Ljava/lang/String;

.field private static final b:Ljava/lang/String; = "y_sampler"

.field private static final c:Ljava/lang/String; = "uv_sampler"

.field private static final d:Ljava/lang/String; = "rgba_sampler"

.field private static final e:Ljava/lang/String; = "needFlipY"

.field private static final f:Ljava/lang/String; = "depth_value"

.field private static final g:F = 1.0f


# instance fields
.field private A:I

.field private B:Z

.field private C:I

.field private D:I

.field private E:Lcom/arcsoft/avatar/gl/GLFramebuffer;

.field private F:F

.field private h:F

.field private i:[I

.field private j:[I

.field private k:[I

.field private l:[I

.field private m:I

.field private n:I

.field private o:I

.field private p:[I

.field private q:[I

.field private r:Ljava/nio/FloatBuffer;

.field private s:Ljava/nio/FloatBuffer;

.field private t:I

.field private u:[F

.field private v:[F

.field private final w:I

.field private final x:I

.field private y:[I

.field private z:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/arcsoft/avatar/gl/GLRenderEngine;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->a:Ljava/lang/String;

    const-string v0, "#version 310 es\nlayout(location = 0) in vec3 a_position;\nlayout(location = 1) in vec2 a_texCoord;\nuniform int needFlipY;\nuniform float depth_value;\nlayout (location = 0) out vec2 v_texCoord;\nvoid main() {vec3 newPos = a_position;\nif(1==needFlipY){ newPos = vec3(a_position.x,a_position.y * -1.0,a_position.z);\n}gl_Position = vec4(newPos.xy,depth_value,1.0);\nv_texCoord = a_texCoord;\n}"

    sput-object v0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->VERTEX_SHADER:Ljava/lang/String;

    const-string v0, "#version 310 es\nprecision mediump float;\nlayout(location = 0) in vec2 v_texCoord;\nout vec4 outColor;\nuniform sampler2D y_sampler;\nuniform sampler2D uv_sampler;\nvoid main() {vec3 yuv;\nvec3 rgb;\nvec4 temp;\nyuv.x = texture(y_sampler,v_texCoord).r;\ntemp = texture(uv_sampler,v_texCoord);\nyuv.y = temp.a - 0.5;\nyuv.z = temp.r - 0.5;\nrgb = mat3(1.0,1.0,1.0,   0.0,-0.344,1.770,   1.403,-0.714,0.0) * yuv;\noutColor = vec4(rgb,1.0);\n}"

    sput-object v0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->FRAGMENT_SHADER_NV21:Ljava/lang/String;

    const-string v0, "#version 310 es\nprecision mediump float;\nlayout(location = 0) in vec2 v_texCoord;\nout vec4 outColor;\nuniform sampler2D rgba_sampler;\nvoid main(){outColor = texture(rgba_sampler,v_texCoord);\n}"

    sput-object v0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->FRAGMENT_SHADER_RGBA8:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    const/4 v0, 0x2

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->i:[I

    const/4 v1, 0x1

    new-array v2, v1, [I

    iput-object v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->j:[I

    new-array v2, v0, [I

    iput-object v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->k:[I

    new-array v2, v1, [I

    iput-object v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->l:[I

    const/4 v2, -0x1

    iput v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->m:I

    iput v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->n:I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->p:[I

    new-array v0, v1, [I

    iput-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->q:[I

    const/16 v0, 0xc

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->u:[F

    const/16 v0, 0x8

    new-array v0, v0, [F

    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->v:[F

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->u:[F

    array-length v0, v0

    const/4 v1, 0x4

    mul-int/2addr v0, v1

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->w:I

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->v:[F

    array-length v0, v0

    mul-int/2addr v0, v1

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->x:I

    new-array v0, v1, [I

    iput-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->y:[I

    const/4 v0, 0x0

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->z:I

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->A:I

    iput p1, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->t:I

    return-void

    nop

    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x0
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x0
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public constructor <init>(II)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    const/4 v0, 0x2

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->i:[I

    const/4 v1, 0x1

    new-array v2, v1, [I

    iput-object v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->j:[I

    new-array v2, v0, [I

    iput-object v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->k:[I

    new-array v2, v1, [I

    iput-object v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->l:[I

    const/4 v2, -0x1

    iput v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->m:I

    iput v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->n:I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->p:[I

    new-array v0, v1, [I

    iput-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->q:[I

    const/16 v0, 0xc

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->u:[F

    const/16 v0, 0x8

    new-array v0, v0, [F

    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->v:[F

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->u:[F

    array-length v0, v0

    const/4 v1, 0x4

    mul-int/2addr v0, v1

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->w:I

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->v:[F

    array-length v0, v0

    mul-int/2addr v0, v1

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->x:I

    new-array v0, v1, [I

    iput-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->y:[I

    iput p1, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->z:I

    iput p2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->A:I

    const/16 p1, 0x802

    iput p1, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->t:I

    return-void

    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x0
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x0
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public constructor <init>(III)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    const/4 v0, 0x2

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->i:[I

    const/4 v1, 0x1

    new-array v2, v1, [I

    iput-object v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->j:[I

    new-array v2, v0, [I

    iput-object v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->k:[I

    new-array v2, v1, [I

    iput-object v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->l:[I

    const/4 v2, -0x1

    iput v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->m:I

    iput v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->n:I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->p:[I

    new-array v0, v1, [I

    iput-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->q:[I

    const/16 v0, 0xc

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->u:[F

    const/16 v0, 0x8

    new-array v0, v0, [F

    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->v:[F

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->u:[F

    array-length v0, v0

    const/4 v1, 0x4

    mul-int/2addr v0, v1

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->w:I

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->v:[F

    array-length v0, v0

    mul-int/2addr v0, v1

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->x:I

    new-array v0, v1, [I

    iput-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->y:[I

    iput p1, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->z:I

    iput p2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->A:I

    iput p3, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->t:I

    return-void

    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x0
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x0
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private a()V
    .locals 4

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->o:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->q:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    invoke-static {v0}, Landroid/opengl/GLES30;->glBindVertexArray(I)V

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->t:I

    const/16 v2, 0x305

    const/4 v3, 0x1

    if-eq v0, v2, :cond_1

    const/16 v2, 0x802

    if-eq v0, v2, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->k:[I

    aget v0, v0, v1

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->k:[I

    aget v0, v0, v3

    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->l:[I

    aget v0, v0, v1

    const/4 v2, 0x3

    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    nop

    :goto_0
    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->D:I

    if-ne v3, v0, :cond_2

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->m:I

    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    goto :goto_1

    :cond_2
    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->m:I

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    :goto_1
    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->n:I

    iget v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->F:F

    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    const/4 v0, 0x6

    const/4 v2, 0x4

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    invoke-static {v1}, Landroid/opengl/GLES30;->glBindVertexArray(I)V

    const/16 v0, 0xde1

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    return-void
.end method

.method private a([F)V
    .locals 14

    iget-boolean v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->B:Z

    const/16 v1, 0x10e

    const/16 v2, 0xb4

    const/16 v3, 0x5a

    const/4 v4, 0x7

    const/4 v5, 0x6

    const/4 v6, 0x5

    const/4 v7, 0x3

    const/4 v8, 0x2

    const/4 v9, 0x4

    const/4 v10, 0x1

    const/4 v11, 0x0

    const/high16 v12, 0x3f800000    # 1.0f

    const/4 v13, 0x0

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->C:I

    if-eqz v0, :cond_3

    if-eq v0, v3, :cond_2

    if-eq v0, v2, :cond_1

    if-eq v0, v1, :cond_0

    goto/16 :goto_0

    :cond_0
    aput v13, p1, v11

    aput v13, p1, v10

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    aput v0, p1, v8

    aput v13, p1, v7

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    aput v0, p1, v9

    aput v12, p1, v6

    aput v13, p1, v5

    aput v12, p1, v4

    goto/16 :goto_0

    :cond_1
    aput v13, p1, v11

    aput v12, p1, v10

    aput v13, p1, v8

    aput v13, p1, v7

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    aput v0, p1, v9

    aput v13, p1, v6

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    aput v0, p1, v5

    aput v12, p1, v4

    goto/16 :goto_0

    :cond_2
    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    aput v0, p1, v11

    aput v12, p1, v10

    aput v13, p1, v8

    aput v12, p1, v7

    aput v13, p1, v9

    aput v13, p1, v6

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    aput v0, p1, v5

    aput v13, p1, v4

    goto/16 :goto_0

    :cond_3
    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    aput v0, p1, v11

    aput v13, p1, v10

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    aput v0, p1, v8

    aput v12, p1, v7

    aput v13, p1, v9

    aput v12, p1, v6

    aput v13, p1, v5

    aput v13, p1, v4

    goto :goto_0

    :cond_4
    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->C:I

    if-eqz v0, :cond_8

    if-eq v0, v3, :cond_7

    if-eq v0, v2, :cond_6

    if-eq v0, v1, :cond_5

    goto :goto_0

    :cond_5
    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    aput v0, p1, v11

    aput v13, p1, v10

    aput v13, p1, v8

    aput v13, p1, v7

    aput v13, p1, v9

    aput v12, p1, v6

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    aput v0, p1, v5

    aput v12, p1, v4

    goto :goto_0

    :cond_6
    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    aput v0, p1, v11

    aput v12, p1, v10

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    aput v0, p1, v8

    aput v13, p1, v7

    aput v13, p1, v9

    aput v13, p1, v6

    aput v13, p1, v5

    aput v12, p1, v4

    goto :goto_0

    :cond_7
    aput v13, p1, v11

    aput v12, p1, v10

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    aput v0, p1, v8

    aput v12, p1, v7

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    aput v0, p1, v9

    aput v13, p1, v6

    aput v13, p1, v5

    aput v13, p1, v4

    goto :goto_0

    :cond_8
    aput v13, p1, v11

    aput v13, p1, v10

    aput v13, p1, v8

    aput v12, p1, v7

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    aput v0, p1, v9

    aput v12, p1, v6

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    aput v0, p1, v5

    aput v13, p1, v4

    nop

    :goto_0
    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->p:[I

    aget v0, v0, v10

    const v1, 0x8892

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->s:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v11}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->s:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->s:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v11}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    array-length p1, p1

    mul-int/2addr p1, v9

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->s:Ljava/nio/FloatBuffer;

    const v2, 0x88e8

    invoke-static {v1, p1, v0, v2}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    return-void
.end method

.method private b()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->D:I

    iput-boolean v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->B:Z

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->C:I

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->A:I

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->z:I

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->o:I

    return-void
.end method

.method private c()V
    .locals 3

    const v0, 0x812f

    const/16 v1, 0xde1

    const/16 v2, 0x2802

    invoke-static {v1, v2, v0}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v2, 0x2803

    invoke-static {v1, v2, v0}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v0, 0x2801

    const/16 v2, 0x2600

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v0, 0x2800

    const/16 v2, 0x2601

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    return-void
.end method


# virtual methods
.method public initNv21TextureIds()V
    .locals 5

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->i:[I

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->i:[I

    aget v0, v0, v1

    const/16 v2, 0xde1

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    invoke-direct {p0}, Lcom/arcsoft/avatar/gl/GLRenderEngine;->c()V

    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->i:[I

    const/4 v3, 0x1

    aget v0, v0, v3

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    invoke-direct {p0}, Lcom/arcsoft/avatar/gl/GLRenderEngine;->c()V

    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    sget-object v0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->VERTEX_SHADER:Ljava/lang/String;

    sget-object v2, Lcom/arcsoft/avatar/gl/GLRenderEngine;->FRAGMENT_SHADER_NV21:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/arcsoft/avatar/gl/ShaderManager;->createProgram(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->o:I

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->k:[I

    iget v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->o:I

    const-string v4, "y_sampler"

    invoke-static {v2, v4}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->k:[I

    iget v1, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->o:I

    const-string v2, "uv_sampler"

    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v1

    aput v1, v0, v3

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->o:I

    const-string v1, "needFlipY"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->m:I

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->o:I

    const-string v1, "depth_value"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->n:I

    return-void
.end method

.method public initRgbaTextureIds()V
    .locals 3

    sget-object v0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->VERTEX_SHADER:Ljava/lang/String;

    sget-object v1, Lcom/arcsoft/avatar/gl/GLRenderEngine;->FRAGMENT_SHADER_RGBA8:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/gl/ShaderManager;->createProgram(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->o:I

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->l:[I

    iget v1, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->o:I

    const-string v2, "rgba_sampler"

    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v1

    const/4 v2, 0x0

    aput v1, v0, v2

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->o:I

    const-string v1, "needFlipY"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->m:I

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->o:I

    const-string v1, "depth_value"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->n:I

    return-void
.end method

.method public initVao()V
    .locals 12

    const/4 v0, 0x0

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->F:F

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->q:[I

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES30;->glGenVertexArrays(I[II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->q:[I

    aget v0, v0, v2

    invoke-static {v0}, Landroid/opengl/GLES30;->glBindVertexArray(I)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->p:[I

    const/4 v3, 0x2

    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glGenBuffers(I[II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->p:[I

    aget v0, v0, v2

    const v3, 0x8892

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->w:I

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->r:Ljava/nio/FloatBuffer;

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->r:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->r:Ljava/nio/FloatBuffer;

    iget-object v4, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->u:[F

    invoke-virtual {v0, v4}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->r:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->w:I

    iget-object v4, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->r:Ljava/nio/FloatBuffer;

    const v5, 0x88e4

    invoke-static {v3, v0, v4, v5}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    invoke-static {v2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    const/4 v6, 0x0

    const/4 v7, 0x3

    const/16 v8, 0x1406

    const/4 v9, 0x0

    const/16 v10, 0xc

    const/4 v11, 0x0

    invoke-static/range {v6 .. v11}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZII)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->p:[I

    aget v0, v0, v1

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->x:I

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->s:Ljava/nio/FloatBuffer;

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->s:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->s:Ljava/nio/FloatBuffer;

    iget-object v4, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->v:[F

    invoke-virtual {v0, v4}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->s:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->x:I

    iget-object v4, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->s:Ljava/nio/FloatBuffer;

    invoke-static {v3, v0, v4, v5}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    invoke-static {v1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    const/4 v6, 0x1

    const/4 v7, 0x2

    const/16 v10, 0x8

    invoke-static/range {v6 .. v11}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZII)V

    invoke-static {v3, v2}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    invoke-static {v2}, Landroid/opengl/GLES30;->glBindVertexArray(I)V

    return-void
.end method

.method public renderWithImageBuffer(Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;)V
    .locals 21

    move-object/from16 v0, p0

    iget v1, v0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->t:I

    const/16 v2, 0x802

    if-eq v1, v2, :cond_0

    return-void

    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->getRowStride()[I

    move-result-object v1

    const/4 v2, 0x0

    aget v1, v1, v2

    invoke-virtual/range {p1 .. p1}, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->getHeight()I

    move-result v3

    mul-int/2addr v3, v1

    invoke-virtual/range {p1 .. p1}, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->getYData()[B

    move-result-object v4

    invoke-static {v4, v2, v3}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    shr-int/lit8 v4, v3, 0x1

    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v15

    invoke-virtual/range {p1 .. p1}, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->getYData()[B

    move-result-object v5

    invoke-virtual {v15, v5, v3, v4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    invoke-virtual {v15, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    const v3, 0x84c0

    invoke-static {v3}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    iget-object v3, v0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->i:[I

    aget v2, v3, v2

    const/16 v12, 0xde1

    invoke-static {v12, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/16 v3, 0xde1

    const/4 v4, 0x0

    const/16 v5, 0x1909

    invoke-virtual/range {p1 .. p1}, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->getHeight()I

    move-result v7

    const/4 v8, 0x0

    const/16 v9, 0x1909

    const/16 v10, 0x1401

    move v6, v1

    invoke-static/range {v3 .. v11}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    const v2, 0x84c1

    invoke-static {v2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    iget-object v2, v0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->i:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    invoke-static {v12, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/4 v13, 0x0

    const/16 v14, 0x190a

    shr-int/2addr v1, v3

    invoke-virtual/range {p1 .. p1}, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->getHeight()I

    move-result v2

    shr-int/lit8 v16, v2, 0x1

    const/16 v17, 0x0

    const/16 v18, 0x190a

    const/16 v19, 0x1401

    move-object v2, v15

    move v15, v1

    move-object/from16 v20, v2

    invoke-static/range {v12 .. v20}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    nop

    invoke-direct/range {p0 .. p0}, Lcom/arcsoft/avatar/gl/GLRenderEngine;->a()V

    return-void
.end method

.method public renderWithTextureId(I)V
    .locals 2

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->t:I

    const/16 v1, 0x305

    if-eq v0, v1, :cond_1

    const/16 p1, 0x802

    if-eq v0, p1, :cond_0

    goto :goto_0

    :cond_0
    goto :goto_0

    :cond_1
    const v0, 0x84c3

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    const/16 v0, 0xde1

    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    :goto_0
    invoke-direct {p0}, Lcom/arcsoft/avatar/gl/GLRenderEngine;->a()V

    return-void
.end method

.method public setDepthValue(F)V
    .locals 0

    iput p1, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->F:F

    return-void
.end method

.method public setEnableFlipY(I)V
    .locals 0

    iput p1, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->D:I

    return-void
.end method

.method public setMirrorAndDegree(ZI)V
    .locals 0

    iput-boolean p1, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->B:Z

    iput p2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->C:I

    iget-object p1, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->v:[F

    array-length p1, p1

    new-array p1, p1, [F

    invoke-direct {p0, p1}, Lcom/arcsoft/avatar/gl/GLRenderEngine;->a([F)V

    return-void
.end method

.method public setPitches([I)V
    .locals 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->y:[I

    iget-object v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->y:[I

    iget v3, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->z:I

    aput v3, v2, v0

    aput v3, p1, v1

    return-void

    :cond_0
    iget-object v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->y:[I

    aget v3, p1, v1

    aput v3, v2, v1

    iget-object v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->y:[I

    aget p1, p1, v0

    aput p1, v2, v0

    iget-object p1, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->y:[I

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->y:[I

    const/4 v4, 0x3

    iget-object v5, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->y:[I

    aget v0, v5, v0

    aput v0, v3, v4

    aput v0, p1, v2

    iget p1, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->z:I

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->y:[I

    aget v0, v0, v1

    if-ne p1, v0, :cond_1

    return-void

    :cond_1
    iget-object p1, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->y:[I

    aget p1, p1, v1

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->z:I

    sub-int/2addr p1, v0

    int-to-float p1, p1

    const/high16 v0, 0x3f800000    # 1.0f

    add-float/2addr p1, v0

    iget-object v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->y:[I

    aget v1, v2, v1

    int-to-float v1, v1

    div-float/2addr p1, v1

    sub-float/2addr v0, p1

    iget-object p1, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->v:[F

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->v:[F

    const/4 v3, 0x6

    aput v0, v2, v3

    aput v0, p1, v1

    iput v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->h:F

    return-void
.end method

.method public unInit()V
    .locals 5

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->o:I

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->o:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    iput v1, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->o:I

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->q:[I

    aget v0, v0, v1

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->q:[I

    invoke-static {v2, v0, v1}, Landroid/opengl/GLES30;->glDeleteVertexArrays(I[II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->q:[I

    aput v1, v0, v1

    :cond_1
    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->i:[I

    aget v0, v0, v1

    const/4 v3, 0x2

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->i:[I

    invoke-static {v3, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->i:[I

    iget-object v4, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->i:[I

    aput v1, v4, v2

    aput v1, v0, v1

    :cond_2
    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->j:[I

    aget v0, v0, v1

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->j:[I

    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->j:[I

    aput v1, v0, v1

    :cond_3
    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->p:[I

    aget v0, v0, v1

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->p:[I

    invoke-static {v3, v0, v1}, Landroid/opengl/GLES20;->glDeleteBuffers(I[II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->p:[I

    iget-object v3, p0, Lcom/arcsoft/avatar/gl/GLRenderEngine;->p:[I

    aput v1, v3, v2

    aput v1, v0, v1

    :cond_4
    invoke-direct {p0}, Lcom/arcsoft/avatar/gl/GLRenderEngine;->b()V

    return-void
.end method
