.class public Lcom/arcsoft/avatar/gl/GLRender;
.super Ljava/lang/Object;
.source "GLRender.java"


# static fields
.field private static final a:Ljava/lang/String; = "Arc_GLRender"

.field private static final l:I = 0x4

.field private static final m:Ljava/lang/String; = "attribute vec2 vPos;\nattribute vec2 vTex;\nvarying   vec2 vTextureCoord;\nvoid main(){\ngl_Position=vec4(vPos,0.0,1.0);\nvTextureCoord = vTex;\n}\n"

.field private static final n:Ljava/lang/String; = "precision mediump float;\nvarying vec2 vTextureCoord;\nuniform sampler2D sTexture;\nvoid main() {\n    gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n"


# instance fields
.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:[I

.field private g:I

.field private h:I

.field private i:Z

.field private j:I

.field private k:Z


# direct methods
.method public constructor <init>(IIIZ)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p3, 0x2

    new-array p3, p3, [I

    iput-object p3, p0, Lcom/arcsoft/avatar/gl/GLRender;->f:[I

    mul-int p3, p2, p2

    if-lez p3, :cond_0

    if-ltz p1, :cond_0

    if-ltz p2, :cond_0

    iput p1, p0, Lcom/arcsoft/avatar/gl/GLRender;->g:I

    iput p2, p0, Lcom/arcsoft/avatar/gl/GLRender;->h:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/arcsoft/avatar/gl/GLRender;->k:Z

    return-void

    :cond_0
    new-instance p3, Ljava/lang/RuntimeException;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "GLRender() frameWidth="

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " ,frameHeight="

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " invalid."

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p3
.end method


# virtual methods
.method public initRender(Z)V
    .locals 7

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRender;->f:[I

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glGenBuffers(I[II)V

    const/16 v0, 0x8

    new-array v2, v0, [F

    fill-array-data v2, :array_0

    array-length v3, v2

    const/4 v4, 0x4

    mul-int/2addr v3, v4

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    invoke-virtual {v3, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v5, p0, Lcom/arcsoft/avatar/gl/GLRender;->f:[I

    aget v5, v5, v1

    const v6, 0x8892

    invoke-static {v6, v5}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    array-length v2, v2

    mul-int/2addr v2, v4

    const v5, 0x88e4

    invoke-static {v6, v2, v3, v5}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    invoke-static {v6, v1}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    nop

    new-array v2, v0, [F

    fill-array-data v2, :array_1

    new-array v0, v0, [F

    fill-array-data v0, :array_2

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    nop

    move-object v0, v2

    :goto_0
    array-length p1, v0

    mul-int/2addr p1, v4

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v2, p0, Lcom/arcsoft/avatar/gl/GLRender;->f:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    invoke-static {v6, v2}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    array-length v0, v0

    mul-int/2addr v4, v0

    invoke-static {v6, v4, p1, v5}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    invoke-static {v6, v1}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    const-string p1, "attribute vec2 vPos;\nattribute vec2 vTex;\nvarying   vec2 vTextureCoord;\nvoid main(){\ngl_Position=vec4(vPos,0.0,1.0);\nvTextureCoord = vTex;\n}\n"

    const-string v0, "precision mediump float;\nvarying vec2 vTextureCoord;\nuniform sampler2D sTexture;\nvoid main() {\n    gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n"

    invoke-static {p1, v0}, Lcom/arcsoft/avatar/gl/ShaderManager;->createProgram(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/arcsoft/avatar/gl/GLRender;->b:I

    iget p1, p0, Lcom/arcsoft/avatar/gl/GLRender;->b:I

    if-nez p1, :cond_1

    return-void

    :cond_1
    iget p1, p0, Lcom/arcsoft/avatar/gl/GLRender;->b:I

    const-string v0, "vPos"

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/arcsoft/avatar/gl/GLRender;->c:I

    iget p1, p0, Lcom/arcsoft/avatar/gl/GLRender;->b:I

    const-string v0, "vTex"

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/arcsoft/avatar/gl/GLRender;->d:I

    iget p1, p0, Lcom/arcsoft/avatar/gl/GLRender;->b:I

    const-string v0, "sTexture"

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/arcsoft/avatar/gl/GLRender;->e:I

    iput-boolean v3, p0, Lcom/arcsoft/avatar/gl/GLRender;->k:Z

    return-void

    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
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

    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public renderWithTextureId(I)V
    .locals 9

    iget-boolean v0, p0, Lcom/arcsoft/avatar/gl/GLRender;->k:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRender;->b:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    const/16 v0, 0x4100

    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRender;->f:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    const v2, 0x8892

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    iget v3, p0, Lcom/arcsoft/avatar/gl/GLRender;->c:I

    const/4 v4, 0x2

    const/16 v5, 0x1406

    const/4 v6, 0x0

    const/16 v7, 0x8

    const/4 v8, 0x0

    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZII)V

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRender;->c:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    iget-object v0, p0, Lcom/arcsoft/avatar/gl/GLRender;->f:[I

    const/4 v3, 0x1

    aget v0, v0, v3

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    iget v3, p0, Lcom/arcsoft/avatar/gl/GLRender;->d:I

    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZII)V

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRender;->d:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    const v0, 0x84c0

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    const/16 v0, 0xde1

    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    iget p1, p0, Lcom/arcsoft/avatar/gl/GLRender;->e:I

    invoke-static {p1, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    const/4 p1, 0x6

    const/4 v3, 0x4

    invoke-static {p1, v1, v3}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    iget p1, p0, Lcom/arcsoft/avatar/gl/GLRender;->c:I

    invoke-static {p1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    iget p1, p0, Lcom/arcsoft/avatar/gl/GLRender;->d:I

    invoke-static {p1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    invoke-static {v1}, Landroid/opengl/GLES20;->glUseProgram(I)V

    return-void
.end method

.method public unInitRender()V
    .locals 3

    iget-boolean v0, p0, Lcom/arcsoft/avatar/gl/GLRender;->k:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/arcsoft/avatar/gl/GLRender;->b:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    const/4 v0, 0x2

    iget-object v2, p0, Lcom/arcsoft/avatar/gl/GLRender;->f:[I

    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glDeleteBuffers(I[II)V

    :cond_0
    iput-boolean v1, p0, Lcom/arcsoft/avatar/gl/GLRender;->k:Z

    return-void
.end method

.method public updateMirrorAndOrientation()V
    .locals 0

    return-void
.end method
