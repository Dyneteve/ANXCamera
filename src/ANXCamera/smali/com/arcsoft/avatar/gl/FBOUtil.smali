.class public Lcom/arcsoft/avatar/gl/FBOUtil;
.super Ljava/lang/Object;
.source "FBOUtil.java"


# static fields
.field private static final f:Ljava/lang/String;

.field private static final j:Ljava/lang/String; = "/sdcard/Pictures/readfbo/"


# instance fields
.field a:[I

.field b:[I

.field c:[I

.field d:[I

.field e:Z

.field private g:I

.field private h:I

.field private i:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/arcsoft/avatar/gl/FBOUtil;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/arcsoft/avatar/gl/FBOUtil;->f:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/arcsoft/avatar/gl/FBOUtil;->a:[I

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/arcsoft/avatar/gl/FBOUtil;->b:[I

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/arcsoft/avatar/gl/FBOUtil;->c:[I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/arcsoft/avatar/gl/FBOUtil;->d:[I

    const/4 v0, 0x0

    iput v0, p0, Lcom/arcsoft/avatar/gl/FBOUtil;->i:I

    return-void
.end method


# virtual methods
.method public bindFramebuff()V
    .locals 3

    const/16 v0, 0xb71

    invoke-static {v0}, Landroid/opengl/GLES20;->glIsEnabled(I)Z

    move-result v1

    iput-boolean v1, p0, Lcom/arcsoft/avatar/gl/FBOUtil;->e:Z

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/FBOUtil;->a:[I

    const/4 v1, 0x0

    const v2, 0x8ca6

    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/FBOUtil;->b:[I

    aget v0, v0, v1

    const v1, 0x8d40

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    const/16 v0, 0x4100

    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    return-void
.end method

.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/arcsoft/avatar/gl/FBOUtil;->h:I

    return v0
.end method

.method public getTextureId()I
    .locals 2

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/FBOUtil;->c:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/arcsoft/avatar/gl/FBOUtil;->g:I

    return v0
.end method

.method public initFramebuff(II)V
    .locals 16

    move-object/from16 v0, p0

    move/from16 v10, p1

    move/from16 v11, p2

    iput v10, v0, Lcom/arcsoft/avatar/gl/FBOUtil;->g:I

    iput v11, v0, Lcom/arcsoft/avatar/gl/FBOUtil;->h:I

    iget-object v1, v0, Lcom/arcsoft/avatar/gl/FBOUtil;->a:[I

    const/4 v12, 0x0

    aput v12, v1, v12

    iget-object v1, v0, Lcom/arcsoft/avatar/gl/FBOUtil;->b:[I

    aput v12, v1, v12

    iget-object v1, v0, Lcom/arcsoft/avatar/gl/FBOUtil;->c:[I

    aput v12, v1, v12

    iget-object v1, v0, Lcom/arcsoft/avatar/gl/FBOUtil;->a:[I

    const v2, 0x8ca6

    invoke-static {v2, v1, v12}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    iget-object v1, v0, Lcom/arcsoft/avatar/gl/FBOUtil;->b:[I

    const/4 v13, 0x1

    invoke-static {v13, v1, v12}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    iget-object v1, v0, Lcom/arcsoft/avatar/gl/FBOUtil;->b:[I

    aget v1, v1, v12

    const v14, 0x8d40

    invoke-static {v14, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    const/16 v1, 0xcf5

    invoke-static {v1, v13}, Landroid/opengl/GLES20;->glPixelStorei(II)V

    iget-object v1, v0, Lcom/arcsoft/avatar/gl/FBOUtil;->c:[I

    invoke-static {v13, v1, v12}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    iget-object v1, v0, Lcom/arcsoft/avatar/gl/FBOUtil;->c:[I

    aget v1, v1, v12

    const/16 v15, 0xde1

    invoke-static {v15, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/16 v1, 0x2600

    const/16 v2, 0x2801

    invoke-static {v15, v2, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v2, 0x2800

    invoke-static {v15, v2, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const v1, 0x812f

    const/16 v2, 0x2802

    invoke-static {v15, v2, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v2, 0x2803

    invoke-static {v15, v2, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v1, 0xde1

    const/4 v2, 0x0

    const/16 v3, 0x1908

    const/4 v6, 0x0

    const/16 v7, 0x1908

    const/16 v8, 0x1401

    const/4 v9, 0x0

    move v4, v10

    move v5, v11

    invoke-static/range {v1 .. v9}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    iget-object v1, v0, Lcom/arcsoft/avatar/gl/FBOUtil;->c:[I

    aget v1, v1, v12

    const v2, 0x8ce0

    invoke-static {v14, v2, v15, v1, v12}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    iget-object v1, v0, Lcom/arcsoft/avatar/gl/FBOUtil;->d:[I

    invoke-static {v13, v1, v12}, Landroid/opengl/GLES20;->glGenRenderbuffers(I[II)V

    iget-object v1, v0, Lcom/arcsoft/avatar/gl/FBOUtil;->d:[I

    aget v1, v1, v12

    const v2, 0x8d41

    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindRenderbuffer(II)V

    const v1, 0x81a6

    invoke-static {v2, v1, v10, v11}, Landroid/opengl/GLES20;->glRenderbufferStorage(IIII)V

    iget-object v1, v0, Lcom/arcsoft/avatar/gl/FBOUtil;->d:[I

    aget v1, v1, v12

    const v3, 0x8d00

    invoke-static {v14, v3, v2, v1}, Landroid/opengl/GLES20;->glFramebufferRenderbuffer(IIII)V

    nop

    invoke-static {v14}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    iget-object v0, v0, Lcom/arcsoft/avatar/gl/FBOUtil;->a:[I

    aget v0, v0, v12

    invoke-static {v14, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    invoke-static {v15, v12}, Landroid/opengl/GLES20;->glBindTexture(II)V

    return-void
.end method

.method public unBindFramebuff()V
    .locals 3

    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    iget-boolean v0, p0, Lcom/arcsoft/avatar/gl/FBOUtil;->e:Z

    const/16 v1, 0xb71

    if-eqz v0, :cond_0

    invoke-static {v1}, Landroid/opengl/GLES20;->glEnable(I)V

    goto :goto_0

    :cond_0
    invoke-static {v1}, Landroid/opengl/GLES20;->glDisable(I)V

    :goto_0
    const v0, 0x8d40

    iget-object v1, p0, Lcom/arcsoft/avatar/gl/FBOUtil;->a:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    return-void
.end method

.method public uninitFramebuff()V
    .locals 3

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/FBOUtil;->c:[I

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/FBOUtil;->c:[I

    aput v2, v0, v2

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/FBOUtil;->b:[I

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/FBOUtil;->b:[I

    aput v2, v0, v2

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/FBOUtil;->d:[I

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteRenderbuffers(I[II)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/FBOUtil;->d:[I

    aput v2, v0, v2

    return-void
.end method
