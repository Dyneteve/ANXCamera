.class public Lcom/ss/android/ttve/common/TECommon;
.super Ljava/lang/Object;
.source "TECommon.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttve/common/TECommon$IGetTimestampCallback;,
        Lcom/ss/android/ttve/common/TECommon$IShotScreenCallback;,
        Lcom/ss/android/ttve/common/TECommon$IOnOpenGLCallback;
    }
.end annotation


# static fields
.field public static final DEBUG:Z = true

.field public static final FULLSCREEN_VERTICES:[F

.field public static final TAG:Ljava/lang/String; = "WIX"

.field public static final USE_TEXTURE_ENCODE_INPUT:Z = true


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/ss/android/ttve/common/TECommon;->FULLSCREEN_VERTICES:[F

    return-void

    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static _texParamHelper(III)V
    .locals 1

    const/16 v0, 0x2801

    invoke-static {p0, v0, p1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v0, 0x2800

    invoke-static {p0, v0, p1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 p1, 0x2802

    invoke-static {p0, p1, p2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 p1, 0x2803

    invoke-static {p0, p1, p2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    return-void
.end method

.method public static checkGLError(Ljava/lang/String;)V
    .locals 8

    nop

    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v0

    const/4 v1, 0x0

    move v2, v0

    move v0, v1

    :goto_0
    const/16 v3, 0x20

    if-ge v0, v3, :cond_0

    if-eqz v2, :cond_0

    packed-switch v2, :pswitch_data_0

    :pswitch_0
    const-string/jumbo v3, "unknown error"

    goto :goto_1

    :pswitch_1
    const-string v3, "invalid framebuffer operation"

    goto :goto_1

    :pswitch_2
    const-string v3, "out of memory"

    goto :goto_1

    :pswitch_3
    const-string v3, "invalid operation"

    goto :goto_1

    :pswitch_4
    const-string v3, "invalid value"

    goto :goto_1

    :pswitch_5
    const-string v3, "invalid enum"

    nop

    :goto_1
    const-string v4, "WIX"

    const-string v5, "After tag \"%s\" glGetError %s(0x%x) "

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    aput-object p0, v6, v1

    const/4 v7, 0x1

    aput-object v3, v6, v7

    const/4 v3, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v6, v3

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void

    nop

    nop

    :pswitch_data_0
    .packed-switch 0x500
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    .locals 2

    const/4 v0, 0x0

    if-lez p0, :cond_1

    if-gtz p1, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    invoke-static {p0, p1, p2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string p1, "WIX"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "createBitmap: Error"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Error;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    :cond_1
    :goto_0
    return-object v0
.end method

.method public static deleteTextureID(I)V
    .locals 3

    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    aput p0, v1, v2

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    return-void
.end method

.method public static genBlankTextureID(II)I
    .locals 2

    const/16 v0, 0x2601

    const v1, 0x812f

    invoke-static {p0, p1, v0, v1}, Lcom/ss/android/ttve/common/TECommon;->genBlankTextureID(IIII)I

    move-result p0

    return p0
.end method

.method public static genBlankTextureID(IIII)I
    .locals 13

    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    aget v0, v1, v2

    const/16 v3, 0xde1

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/16 v4, 0xde1

    const/4 v5, 0x0

    const/16 v6, 0x1908

    const/4 v9, 0x0

    const/16 v10, 0x1908

    const/16 v11, 0x1401

    const/4 v12, 0x0

    move v7, p0

    move v8, p1

    invoke-static/range {v4 .. v12}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    move v0, p2

    move/from16 v4, p3

    invoke-static {v3, v0, v4}, Lcom/ss/android/ttve/common/TECommon;->_texParamHelper(III)V

    aget v0, v1, v2

    return v0
.end method

.method public static genFullscreenVertexArrayBuffer()I
    .locals 6

    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenBuffers(I[II)V

    aget v0, v1, v2

    if-nez v0, :cond_0

    const-string v0, "WIX"

    const-string v1, "Invalid VertexBuffer! You must call this within an OpenGL thread!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_0
    aget v0, v1, v2

    const v3, 0x8892

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    sget-object v0, Lcom/ss/android/ttve/common/TECommon;->FULLSCREEN_VERTICES:[F

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    sget-object v4, Lcom/ss/android/ttve/common/TECommon;->FULLSCREEN_VERTICES:[F

    invoke-virtual {v0, v4}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    const/16 v4, 0x20

    const v5, 0x88e4

    invoke-static {v3, v4, v0, v5}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    aget v0, v1, v2

    return v0
.end method

.method public static genNormalTextureID(Landroid/graphics/Bitmap;)I
    .locals 2

    const/16 v0, 0x2601

    const v1, 0x812f

    invoke-static {p0, v0, v1}, Lcom/ss/android/ttve/common/TECommon;->genNormalTextureID(Landroid/graphics/Bitmap;II)I

    move-result p0

    return p0
.end method

.method public static genNormalTextureID(Landroid/graphics/Bitmap;II)I
    .locals 4

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x1

    new-array v2, v1, [I

    invoke-static {v1, v2, v0}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    aget v1, v2, v0

    const/16 v3, 0xde1

    invoke-static {v3, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    invoke-static {v3, v0, p0, v0}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    invoke-static {v3, p1, p2}, Lcom/ss/android/ttve/common/TECommon;->_texParamHelper(III)V

    aget p0, v2, v0

    return p0
.end method

.method public static genSurfaceTextureID()I
    .locals 5

    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    aget v0, v1, v2

    const v3, 0x8d65

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/16 v0, 0x2601

    const v4, 0x812f

    invoke-static {v3, v0, v4}, Lcom/ss/android/ttve/common/TECommon;->_texParamHelper(III)V

    aget v0, v1, v2

    return v0
.end method

.method public static isTextureID(I)Z
    .locals 0

    invoke-static {p0}, Landroid/opengl/GLES20;->glIsTexture(I)Z

    move-result p0

    return p0
.end method
