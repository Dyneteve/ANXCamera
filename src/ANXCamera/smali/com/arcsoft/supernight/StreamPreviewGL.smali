.class public Lcom/arcsoft/supernight/StreamPreviewGL;
.super Landroid/opengl/GLSurfaceView;
.source "StreamPreviewGL.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$Renderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/arcsoft/supernight/StreamPreviewGL$a;
    }
.end annotation


# static fields
.field private static final s:[F

.field private static final t:[F

.field private static final u:[F

.field private static final v:[F

.field private static final w:[F

.field private static final x:[F

.field private static final y:[F

.field private static final z:[F


# instance fields
.field private A:Lcom/arcsoft/supernight/StreamPreviewGL$a;

.field private B:Landroid/graphics/RectF;

.field private C:Z

.field private D:Z

.field private E:I

.field private F:I

.field private G:I

.field private H:[Ljava/nio/ByteBuffer;

.field private I:Z

.field private J:I

.field private K:Z

.field private L:Z

.field private a:Landroid/content/Context;

.field private b:Z

.field private c:I

.field private d:I

.field private e:[I

.field private f:Ljava/lang/String;

.field private g:Ljava/lang/String;

.field private h:I

.field private i:I

.field private j:I

.field private k:I

.field private l:I

.field private m:I

.field private n:Ljava/nio/FloatBuffer;

.field private o:Ljava/nio/FloatBuffer;

.field private p:Ljava/nio/ByteBuffer;

.field private q:I

.field private r:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x8

    new-array v1, v0, [F

    fill-array-data v1, :array_0

    sput-object v1, Lcom/arcsoft/supernight/StreamPreviewGL;->s:[F

    new-array v1, v0, [F

    fill-array-data v1, :array_1

    sput-object v1, Lcom/arcsoft/supernight/StreamPreviewGL;->t:[F

    new-array v1, v0, [F

    fill-array-data v1, :array_2

    sput-object v1, Lcom/arcsoft/supernight/StreamPreviewGL;->u:[F

    new-array v1, v0, [F

    fill-array-data v1, :array_3

    sput-object v1, Lcom/arcsoft/supernight/StreamPreviewGL;->v:[F

    new-array v1, v0, [F

    fill-array-data v1, :array_4

    sput-object v1, Lcom/arcsoft/supernight/StreamPreviewGL;->w:[F

    new-array v1, v0, [F

    fill-array-data v1, :array_5

    sput-object v1, Lcom/arcsoft/supernight/StreamPreviewGL;->x:[F

    new-array v1, v0, [F

    fill-array-data v1, :array_6

    sput-object v1, Lcom/arcsoft/supernight/StreamPreviewGL;->y:[F

    new-array v0, v0, [F

    fill-array-data v0, :array_7

    sput-object v0, Lcom/arcsoft/supernight/StreamPreviewGL;->z:[F

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
    .end array-data

    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_4
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_5
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
    .end array-data

    :array_6
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_7
    .array-data 4
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0, p1}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->b:Z

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->p:Ljava/nio/ByteBuffer;

    iput v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->q:I

    iput v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->r:I

    iput-object v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->A:Lcom/arcsoft/supernight/StreamPreviewGL$a;

    iput-boolean v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->C:Z

    iput-boolean v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->D:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->I:Z

    const/16 v1, 0x5a

    iput v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->J:I

    iput-boolean v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->K:Z

    invoke-virtual {p0, p1}, Lcom/arcsoft/supernight/StreamPreviewGL;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->b:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->p:Ljava/nio/ByteBuffer;

    iput p2, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->q:I

    iput p2, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->r:I

    iput-object v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->A:Lcom/arcsoft/supernight/StreamPreviewGL$a;

    iput-boolean p2, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->C:Z

    iput-boolean p2, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->D:Z

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->I:Z

    const/16 v0, 0x5a

    iput v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->J:I

    iput-boolean p2, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->K:Z

    invoke-virtual {p0, p1}, Lcom/arcsoft/supernight/StreamPreviewGL;->init(Landroid/content/Context;)V

    return-void
.end method

.method private a()V
    .locals 3

    const/16 v0, 0xc

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    array-length v1, v0

    mul-int/lit8 v1, v1, 0x4

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v1

    iput-object v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->n:Ljava/nio/FloatBuffer;

    iget-object v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->n:Ljava/nio/FloatBuffer;

    invoke-virtual {v1, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    iput-boolean v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->C:Z

    iput-boolean v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->D:Z

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
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x0
    .end array-data
.end method

.method private b()V
    .locals 10

    const/4 v0, 0x2

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->e:[I

    iget-object v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->e:[I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    iget-object v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->e:[I

    aget v0, v0, v2

    const/16 v1, 0xde1

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/high16 v0, 0x46180000    # 9728.0f

    const/16 v2, 0x2801

    invoke-static {v1, v2, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const v3, 0x46180400    # 9729.0f

    const/16 v4, 0x2800

    invoke-static {v1, v4, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v5, 0x2802

    const v6, 0x47012f00    # 33071.0f

    invoke-static {v1, v5, v6}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v7, 0x2803

    invoke-static {v1, v7, v6}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    iget-object v8, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->e:[I

    const/4 v9, 0x1

    aget v8, v8, v9

    invoke-static {v1, v8}, Landroid/opengl/GLES20;->glBindTexture(II)V

    invoke-static {v1, v2, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    invoke-static {v1, v4, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    invoke-static {v1, v5, v6}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    invoke-static {v1, v7, v6}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v0, 0xcf5

    invoke-static {v0, v9}, Landroid/opengl/GLES20;->glPixelStorei(II)V

    return-void
.end method

.method private c()V
    .locals 2

    const-string v0, "arcsoft/vertex.sh"

    iget-object v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arcsoft/supernight/ShaderUtils;->loadFromAssetsFile(Ljava/lang/String;Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->f:Ljava/lang/String;

    const-string v0, "arcsoft/frag.sh"

    iget-object v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arcsoft/supernight/ShaderUtils;->loadFromAssetsFile(Ljava/lang/String;Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->g:Ljava/lang/String;

    iget-object v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->f:Ljava/lang/String;

    iget-object v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->g:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/arcsoft/supernight/ShaderUtils;->createProgram(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->h:I

    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->h:I

    const-string v1, "aPosition"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->i:I

    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->h:I

    const-string v1, "aTexCoord"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->j:I

    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->h:I

    const-string/jumbo v1, "uTextureY"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->k:I

    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->h:I

    const-string/jumbo v1, "uTextureUV"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->l:I

    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->h:I

    const-string/jumbo v1, "uNV12"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->m:I

    return-void
.end method

.method private d()V
    .locals 3

    iget-boolean v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->K:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/arcsoft/supernight/StreamPreviewGL;->s:[F

    iget v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->J:I

    if-eqz v1, :cond_4

    const/16 v2, 0x5a

    if-eq v1, v2, :cond_3

    const/16 v2, 0xb4

    if-eq v1, v2, :cond_2

    const/16 v2, 0x10e

    if-eq v1, v2, :cond_1

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/arcsoft/supernight/StreamPreviewGL;->h()[F

    move-result-object v0

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/arcsoft/supernight/StreamPreviewGL;->g()[F

    move-result-object v0

    goto :goto_0

    :cond_3
    invoke-direct {p0}, Lcom/arcsoft/supernight/StreamPreviewGL;->f()[F

    move-result-object v0

    goto :goto_0

    :cond_4
    invoke-direct {p0}, Lcom/arcsoft/supernight/StreamPreviewGL;->e()[F

    move-result-object v0

    nop

    :goto_0
    array-length v1, v0

    mul-int/lit8 v1, v1, 0x4

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v1

    iput-object v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->o:Ljava/nio/FloatBuffer;

    iget-object v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->o:Ljava/nio/FloatBuffer;

    invoke-virtual {v1, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    iput-boolean v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->K:Z

    return-void
.end method

.method private e()[F
    .locals 1

    iget-boolean v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->I:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/arcsoft/supernight/StreamPreviewGL;->w:[F

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/arcsoft/supernight/StreamPreviewGL;->s:[F

    :goto_0
    return-object v0
.end method

.method private f()[F
    .locals 1

    iget-boolean v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->I:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/arcsoft/supernight/StreamPreviewGL;->x:[F

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/arcsoft/supernight/StreamPreviewGL;->t:[F

    :goto_0
    return-object v0
.end method

.method private g()[F
    .locals 1

    iget-boolean v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->I:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/arcsoft/supernight/StreamPreviewGL;->y:[F

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/arcsoft/supernight/StreamPreviewGL;->u:[F

    :goto_0
    return-object v0
.end method

.method private h()[F
    .locals 1

    iget-boolean v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->I:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/arcsoft/supernight/StreamPreviewGL;->z:[F

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/arcsoft/supernight/StreamPreviewGL;->v:[F

    :goto_0
    return-object v0
.end method

.method private i()V
    .locals 14

    iget-object v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->H:[Ljava/nio/ByteBuffer;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->h:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->i:I

    const/4 v2, 0x3

    const/16 v3, 0x1406

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->n:Ljava/nio/FloatBuffer;

    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->i:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    iget v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->j:I

    const/4 v2, 0x2

    iget-object v6, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->o:Ljava/nio/FloatBuffer;

    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->j:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    const v0, 0x84c0

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    iget-object v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->e:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    const/16 v2, 0xde1

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->G:I

    const/16 v3, 0xcf2

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glPixelStorei(II)V

    const/16 v4, 0xde1

    const/16 v6, 0x1909

    iget v7, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->c:I

    iget v8, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->d:I

    const/4 v9, 0x0

    const/16 v10, 0x1909

    const/16 v11, 0x1401

    iget-object v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->H:[Ljava/nio/ByteBuffer;

    aget-object v0, v0, v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v12

    invoke-static/range {v4 .. v12}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->k:I

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    const v0, 0x84c1

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    iget-object v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->e:[I

    const/4 v4, 0x1

    aget v0, v0, v4

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->G:I

    div-int/lit8 v0, v0, 0x2

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glPixelStorei(II)V

    const/16 v5, 0xde1

    const/4 v6, 0x0

    const/16 v7, 0x190a

    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->c:I

    div-int/lit8 v8, v0, 0x2

    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->d:I

    div-int/lit8 v9, v0, 0x2

    const/4 v10, 0x0

    const/16 v11, 0x190a

    const/16 v12, 0x1401

    iget-object v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->H:[Ljava/nio/ByteBuffer;

    aget-object v0, v0, v4

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v13

    invoke-static/range {v5 .. v13}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->l:I

    invoke-static {v0, v4}, Landroid/opengl/GLES20;->glUniform1i(II)V

    const/4 v0, 0x5

    const/4 v3, 0x4

    invoke-static {v0, v1, v3}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->i:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->j:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->m:I

    iget-boolean v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->L:Z

    xor-int/2addr v1, v4

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    return-void
.end method


# virtual methods
.method public drawBlackScreen()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->b:Z

    invoke-virtual {p0}, Lcom/arcsoft/supernight/StreamPreviewGL;->requestRender()V

    iget-object v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->A:Lcom/arcsoft/supernight/StreamPreviewGL$a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->A:Lcom/arcsoft/supernight/StreamPreviewGL$a;

    invoke-interface {v0}, Lcom/arcsoft/supernight/StreamPreviewGL$a;->a()V

    :cond_0
    return-void
.end method

.method public drawPreviewFrame([Ljava/nio/ByteBuffer;III)Z
    .locals 0

    iput-object p1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->H:[Ljava/nio/ByteBuffer;

    iput p4, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->G:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->b:Z

    invoke-virtual {p0}, Lcom/arcsoft/supernight/StreamPreviewGL;->requestRender()V

    iget-object p2, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->A:Lcom/arcsoft/supernight/StreamPreviewGL$a;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->A:Lcom/arcsoft/supernight/StreamPreviewGL$a;

    invoke-interface {p2}, Lcom/arcsoft/supernight/StreamPreviewGL$a;->a()V

    :cond_0
    iget-object p2, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->H:[Ljava/nio/ByteBuffer;

    if-eqz p2, :cond_1

    const/4 p1, 0x1

    nop

    :cond_1
    return p1
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->a:Landroid/content/Context;

    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lcom/arcsoft/supernight/StreamPreviewGL;->setEGLContextClientVersion(I)V

    invoke-virtual {p0, p0}, Lcom/arcsoft/supernight/StreamPreviewGL;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/arcsoft/supernight/StreamPreviewGL;->setRenderMode(I)V

    return-void
.end method

.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1

    const/16 p1, 0x4100

    invoke-static {p1}, Landroid/opengl/GLES20;->glClear(I)V

    iget-boolean p1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->b:Z

    if-eqz p1, :cond_0

    const/high16 p1, 0x3f800000    # 1.0f

    const/4 v0, 0x0

    invoke-static {v0, v0, v0, p1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/arcsoft/supernight/StreamPreviewGL;->d()V

    invoke-direct {p0}, Lcom/arcsoft/supernight/StreamPreviewGL;->a()V

    invoke-direct {p0}, Lcom/arcsoft/supernight/StreamPreviewGL;->i()V

    :goto_0
    return-void
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 0

    const/4 p1, 0x0

    invoke-static {p1, p1, p2, p3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    iget p1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->E:I

    if-ne p1, p2, :cond_0

    iget p1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->F:I

    if-eq p1, p3, :cond_1

    :cond_0
    iput p2, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->E:I

    iput p3, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->F:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->D:Z

    :cond_1
    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 0

    const/4 p1, 0x0

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-static {p1, p1, p1, p2}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    invoke-direct {p0}, Lcom/arcsoft/supernight/StreamPreviewGL;->b()V

    invoke-direct {p0}, Lcom/arcsoft/supernight/StreamPreviewGL;->c()V

    return-void
.end method

.method public releaseGLView()V
    .locals 3

    iget-object v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->e:[I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->e:[I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    :cond_0
    return-void
.end method

.method public setDataFormat(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->L:Z

    return-void
.end method

.method public setOrientationMirror(IZ)V
    .locals 1

    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->J:I

    if-ne v0, p1, :cond_0

    iget-boolean v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->I:Z

    if-eq v0, p2, :cond_1

    :cond_0
    iput p1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->J:I

    iput-boolean p2, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->I:Z

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->K:Z

    :cond_1
    return-void
.end method

.method public setPreviewArea(Landroid/graphics/RectF;)V
    .locals 0

    iput-object p1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->B:Landroid/graphics/RectF;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->C:Z

    return-void
.end method

.method public setPreviewSize(II)V
    .locals 1

    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->c:I

    if-ne v0, p1, :cond_0

    iget v0, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->d:I

    if-eq v0, p2, :cond_1

    :cond_0
    iput p1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->c:I

    iput p2, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->d:I

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->H:[Ljava/nio/ByteBuffer;

    :cond_1
    return-void
.end method

.method public setRenderListener(Lcom/arcsoft/supernight/StreamPreviewGL$a;)V
    .locals 0

    iput-object p1, p0, Lcom/arcsoft/supernight/StreamPreviewGL;->A:Lcom/arcsoft/supernight/StreamPreviewGL$a;

    return-void
.end method
