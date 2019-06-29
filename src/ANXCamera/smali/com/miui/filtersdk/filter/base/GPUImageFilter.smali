.class public Lcom/miui/filtersdk/filter/base/GPUImageFilter;
.super Ljava/lang/Object;
.source "GPUImageFilter.java"


# static fields
.field private static final NO_FILTER_FRAGMENT_SHADER:Ljava/lang/String; = "varying highp vec2 textureCoordinate;\n \nuniform sampler2D inputImageTexture;\n \nvoid main()\n{\n     gl_FragColor = texture2D(inputImageTexture, textureCoordinate);\n}"

.field public static final NO_FILTER_VERTEX_SHADER:Ljava/lang/String; = "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}"


# instance fields
.field private final mFragmentShader:Ljava/lang/String;

.field protected mFrameBufferTextures:[I

.field protected mFrameBuffers:[I

.field protected mFrameHeight:I

.field protected mFrameWidth:I

.field protected mGLAttribPosition:I

.field protected mGLAttribTextureCoordinate:I

.field protected mGLCubeBuffer:Ljava/nio/FloatBuffer;

.field protected mGLProgId:I

.field protected mGLTextureBuffer:Ljava/nio/FloatBuffer;

.field protected mGLUniformTexture:I

.field protected mInputHeight:I

.field protected mInputWidth:I

.field protected mIsInitialized:Z

.field protected mOutputHeight:I

.field protected mOutputWidth:I

.field private final mRunOnDraw:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field protected mTextureId:I

.field private final mVertexShader:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    const-string v0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}"

    const-string/jumbo v1, "varying highp vec2 textureCoordinate;\n \nuniform sampler2D inputImageTexture;\n \nvoid main()\n{\n     gl_FragColor = texture2D(inputImageTexture, textureCoordinate);\n}"

    invoke-direct {p0, v0, v1}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mTextureId:I

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBuffers:[I

    iput-object v1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBufferTextures:[I

    iput v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameWidth:I

    iput v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameHeight:I

    if-nez p1, :cond_0

    const-string p1, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}"

    :cond_0
    if-nez p2, :cond_1

    const-string/jumbo p2, "varying highp vec2 textureCoordinate;\n \nuniform sampler2D inputImageTexture;\n \nvoid main()\n{\n     gl_FragColor = texture2D(inputImageTexture, textureCoordinate);\n}"

    :cond_1
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mRunOnDraw:Ljava/util/LinkedList;

    iput-object p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mVertexShader:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFragmentShader:Ljava/lang/String;

    sget-object p1, Lcom/miui/filtersdk/utils/TextureRotationUtil;->CUBE:[F

    array-length p1, p1

    mul-int/lit8 p1, p1, 0x4

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLCubeBuffer:Ljava/nio/FloatBuffer;

    iget-object p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLCubeBuffer:Ljava/nio/FloatBuffer;

    sget-object p2, Lcom/miui/filtersdk/utils/TextureRotationUtil;->CUBE:[F

    invoke-virtual {p1, p2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    sget-object p1, Lcom/miui/filtersdk/utils/TextureRotationUtil;->TEXTURE_NO_ROTATION:[F

    array-length p1, p1

    mul-int/lit8 p1, p1, 0x4

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLTextureBuffer:Ljava/nio/FloatBuffer;

    iget-object p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLTextureBuffer:Ljava/nio/FloatBuffer;

    sget-object v0, Lcom/miui/filtersdk/utils/Rotation;->NORMAL:Lcom/miui/filtersdk/utils/Rotation;

    const/4 v1, 0x1

    invoke-static {v0, p2, v1}, Lcom/miui/filtersdk/utils/TextureRotationUtil;->getRotation(Lcom/miui/filtersdk/utils/Rotation;ZZ)[F

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    return-void
.end method


# virtual methods
.method public final destroy()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mIsInitialized:Z

    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLProgId:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onDestroy()V

    return-void
.end method

.method public destroyFrameBuffers()V
    .locals 4

    iget-object v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBufferTextures:[I

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBufferTextures:[I

    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    iput-object v1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBufferTextures:[I

    :cond_0
    iget-object v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBuffers:[I

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBuffers:[I

    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    iput-object v1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBuffers:[I

    :cond_1
    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameWidth:I

    iput v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameHeight:I

    return-void
.end method

.method public freeTexture()V
    .locals 5

    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mTextureId:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    new-array v2, v0, [I

    iget v3, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mTextureId:I

    const/4 v4, 0x0

    aput v3, v2, v4

    invoke-static {v0, v2, v4}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    iput v1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mTextureId:I

    return-void
.end method

.method public getAttribPosition()I
    .locals 1

    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribPosition:I

    return v0
.end method

.method public getAttribTextureCoordinate()I
    .locals 1

    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribTextureCoordinate:I

    return v0
.end method

.method public getInitTextureId()I
    .locals 3

    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    aget v0, v1, v2

    iput v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mTextureId:I

    aget v0, v1, v2

    return v0
.end method

.method public getIntputHeight()I
    .locals 1

    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mInputHeight:I

    return v0
.end method

.method public getIntputWidth()I
    .locals 1

    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mInputWidth:I

    return v0
.end method

.method public getProgram()I
    .locals 1

    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLProgId:I

    return v0
.end method

.method public getTextureId()I
    .locals 1

    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mTextureId:I

    return v0
.end method

.method public getUniformTexture()I
    .locals 1

    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLUniformTexture:I

    return v0
.end method

.method protected hasPendingDrawTasks()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mRunOnDraw:Ljava/util/LinkedList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mRunOnDraw:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public init()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onInit()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mIsInitialized:Z

    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onInitialized()V

    return-void
.end method

.method public initFrameBuffers(II)V
    .locals 12

    iget-object v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBuffers:[I

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameWidth:I

    if-ne v0, p1, :cond_0

    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameHeight:I

    if-eq v0, p2, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->destroyFrameBuffers()V

    :cond_1
    iget-object v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBuffers:[I

    if-nez v0, :cond_2

    iput p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameWidth:I

    iput p2, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameHeight:I

    const/4 v0, 0x1

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBuffers:[I

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBufferTextures:[I

    iget-object v1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBuffers:[I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    iget-object v1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBufferTextures:[I

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    iget-object v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBufferTextures:[I

    aget v0, v0, v2

    const/16 v1, 0xde1

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/16 v3, 0xde1

    const/4 v4, 0x0

    const/16 v5, 0x1908

    const/4 v8, 0x0

    const/16 v9, 0x1908

    const/16 v10, 0x1401

    const/4 v11, 0x0

    move v6, p1

    move v7, p2

    invoke-static/range {v3 .. v11}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    const/16 p1, 0x2800

    const p2, 0x46180400    # 9729.0f

    invoke-static {v1, p1, p2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 p1, 0x2801

    invoke-static {v1, p1, p2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 p1, 0x2802

    const p2, 0x47012f00    # 33071.0f

    invoke-static {v1, p1, p2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 p1, 0x2803

    invoke-static {v1, p1, p2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    iget-object p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBuffers:[I

    aget p1, p1, v2

    const p2, 0x8d40

    invoke-static {p2, p1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    const p1, 0x8ce0

    iget-object v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBufferTextures:[I

    aget v0, v0, v2

    invoke-static {p2, p1, v1, v0, v2}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    invoke-static {p2, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    :cond_2
    return-void
.end method

.method public isInitialized()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mIsInitialized:Z

    return v0
.end method

.method protected onDestroy()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->destroyFrameBuffers()V

    return-void
.end method

.method public onDisplaySizeChanged(II)V
    .locals 0

    iput p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mOutputWidth:I

    iput p2, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mOutputHeight:I

    return-void
.end method

.method protected onDrawArraysAfter()V
    .locals 0

    return-void
.end method

.method protected onDrawArraysPre()V
    .locals 0

    return-void
.end method

.method public onDrawFrame(I)I
    .locals 9

    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLProgId:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->runPendingOnDrawTasks()V

    iget-boolean v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mIsInitialized:Z

    const/4 v1, -0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLCubeBuffer:Ljava/nio/FloatBuffer;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    iget v3, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribPosition:I

    const/4 v4, 0x2

    const/16 v5, 0x1406

    const/4 v6, 0x0

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLCubeBuffer:Ljava/nio/FloatBuffer;

    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribPosition:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    iget-object v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLTextureBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    iget v3, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribTextureCoordinate:I

    iget-object v8, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLTextureBuffer:Ljava/nio/FloatBuffer;

    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribTextureCoordinate:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    const/16 v0, 0xde1

    if-eq p1, v1, :cond_1

    const v1, 0x84c0

    invoke-static {v1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    iget p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLUniformTexture:I

    invoke-static {p1, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onDrawArraysPre()V

    const/4 p1, 0x5

    const/4 v1, 0x4

    invoke-static {p1, v2, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    iget p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribPosition:I

    invoke-static {p1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    iget p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribTextureCoordinate:I

    invoke-static {p1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onDrawArraysAfter()V

    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/4 p1, 0x1

    return p1
.end method

.method public onDrawFrame(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I
    .locals 8

    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLProgId:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->runPendingOnDrawTasks()V

    iget-boolean v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mIsInitialized:Z

    const/4 v1, -0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    iget v2, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribPosition:I

    const/4 v3, 0x2

    const/16 v4, 0x1406

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v7, p2

    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    iget p2, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribPosition:I

    invoke-static {p2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    invoke-virtual {p3, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    iget v2, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribTextureCoordinate:I

    move-object v7, p3

    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    iget p2, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribTextureCoordinate:I

    invoke-static {p2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    const/16 p2, 0xde1

    if-eq p1, v1, :cond_1

    const p3, 0x84c0

    invoke-static {p3}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    invoke-static {p2, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    iget p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLUniformTexture:I

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onDrawArraysPre()V

    const/4 p1, 0x5

    const/4 p3, 0x4

    invoke-static {p1, v0, p3}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    iget p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribPosition:I

    invoke-static {p1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    iget p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribTextureCoordinate:I

    invoke-static {p1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onDrawArraysAfter()V

    invoke-static {p2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/4 p1, 0x1

    return p1
.end method

.method public onDrawFrame(Ljava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I
    .locals 1

    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mTextureId:I

    invoke-virtual {p0, v0, p1, p2}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onDrawFrame(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I

    move-result p1

    return p1
.end method

.method public onDrawToTexture(I)I
    .locals 2

    iget-object v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLCubeBuffer:Ljava/nio/FloatBuffer;

    iget-object v1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLTextureBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {p0, p1, v0, v1}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onDrawToTexture(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I

    move-result p1

    return p1
.end method

.method public onDrawToTexture(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I
    .locals 10

    iget-object v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBuffers:[I

    const/4 v1, -0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLProgId:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->runPendingOnDrawTasks()V

    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameWidth:I

    iget v2, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameHeight:I

    const/4 v3, 0x0

    invoke-static {v3, v3, v0, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    iget-object v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBuffers:[I

    aget v0, v0, v3

    const v2, 0x8d40

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    invoke-virtual {p2, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    iget v4, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribPosition:I

    const/4 v5, 0x2

    const/16 v6, 0x1406

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v9, p2

    invoke-static/range {v4 .. v9}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    iget p2, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribPosition:I

    invoke-static {p2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    invoke-virtual {p3, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    iget v4, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribTextureCoordinate:I

    move-object v9, p3

    invoke-static/range {v4 .. v9}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    iget p2, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribTextureCoordinate:I

    invoke-static {p2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    const/16 p2, 0xde1

    if-eq p1, v1, :cond_2

    const p3, 0x84c0

    invoke-static {p3}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    invoke-static {p2, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    iget p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLUniformTexture:I

    invoke-static {p1, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    :cond_2
    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onDrawArraysPre()V

    const/4 p1, 0x5

    const/4 p3, 0x4

    invoke-static {p1, v3, p3}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    iget p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribPosition:I

    invoke-static {p1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    iget p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribTextureCoordinate:I

    invoke-static {p1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onDrawArraysAfter()V

    invoke-static {p2, v3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    invoke-static {v2, v3}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    iget p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mOutputWidth:I

    iget p2, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mOutputHeight:I

    invoke-static {v3, v3, p1, p2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    iget-object p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFrameBufferTextures:[I

    aget p1, p1, v3

    return p1
.end method

.method protected onInit()V
    .locals 2

    iget-object v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mVertexShader:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mFragmentShader:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/miui/filtersdk/utils/OpenGlUtils;->loadProgram(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLProgId:I

    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLProgId:I

    const-string v1, "position"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribPosition:I

    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLProgId:I

    const-string v1, "inputImageTexture"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLUniformTexture:I

    iget v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLProgId:I

    const-string v1, "inputTextureCoordinate"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mGLAttribTextureCoordinate:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mIsInitialized:Z

    return-void
.end method

.method protected onInitialized()V
    .locals 0

    return-void
.end method

.method public onInputSizeChanged(II)V
    .locals 0

    iput p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mInputWidth:I

    iput p2, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mInputHeight:I

    return-void
.end method

.method public passPreviewFrameToTexture([BII)V
    .locals 0

    return-void
.end method

.method protected runOnDraw(Ljava/lang/Runnable;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mRunOnDraw:Ljava/util/LinkedList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mRunOnDraw:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method protected runPendingOnDrawTasks()V
    .locals 2

    iget-object v0, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mRunOnDraw:Ljava/util/LinkedList;

    monitor-enter v0

    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mRunOnDraw:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mRunOnDraw:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected setFloat(IF)V
    .locals 1

    new-instance v0, Lcom/miui/filtersdk/filter/base/GPUImageFilter$2;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/filtersdk/filter/base/GPUImageFilter$2;-><init>(Lcom/miui/filtersdk/filter/base/GPUImageFilter;IF)V

    invoke-virtual {p0, v0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->runOnDraw(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected setFloatArray(I[F)V
    .locals 1

    new-instance v0, Lcom/miui/filtersdk/filter/base/GPUImageFilter$6;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/filtersdk/filter/base/GPUImageFilter$6;-><init>(Lcom/miui/filtersdk/filter/base/GPUImageFilter;I[F)V

    invoke-virtual {p0, v0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->runOnDraw(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected setFloatVec2(I[F)V
    .locals 1

    new-instance v0, Lcom/miui/filtersdk/filter/base/GPUImageFilter$3;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/filtersdk/filter/base/GPUImageFilter$3;-><init>(Lcom/miui/filtersdk/filter/base/GPUImageFilter;I[F)V

    invoke-virtual {p0, v0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->runOnDraw(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected setFloatVec3(I[F)V
    .locals 1

    new-instance v0, Lcom/miui/filtersdk/filter/base/GPUImageFilter$4;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/filtersdk/filter/base/GPUImageFilter$4;-><init>(Lcom/miui/filtersdk/filter/base/GPUImageFilter;I[F)V

    invoke-virtual {p0, v0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->runOnDraw(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected setFloatVec4(I[F)V
    .locals 1

    new-instance v0, Lcom/miui/filtersdk/filter/base/GPUImageFilter$5;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/filtersdk/filter/base/GPUImageFilter$5;-><init>(Lcom/miui/filtersdk/filter/base/GPUImageFilter;I[F)V

    invoke-virtual {p0, v0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->runOnDraw(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected setInteger(II)V
    .locals 1

    new-instance v0, Lcom/miui/filtersdk/filter/base/GPUImageFilter$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/filtersdk/filter/base/GPUImageFilter$1;-><init>(Lcom/miui/filtersdk/filter/base/GPUImageFilter;II)V

    invoke-virtual {p0, v0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->runOnDraw(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected setPoint(ILandroid/graphics/PointF;)V
    .locals 1

    new-instance v0, Lcom/miui/filtersdk/filter/base/GPUImageFilter$7;

    invoke-direct {v0, p0, p2, p1}, Lcom/miui/filtersdk/filter/base/GPUImageFilter$7;-><init>(Lcom/miui/filtersdk/filter/base/GPUImageFilter;Landroid/graphics/PointF;I)V

    invoke-virtual {p0, v0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->runOnDraw(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setTextureId(I)V
    .locals 0

    iput p1, p0, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->mTextureId:I

    return-void
.end method

.method public setTextureTransformMatrix([F)V
    .locals 0

    return-void
.end method

.method protected setUniformMatrix3f(I[F)V
    .locals 1

    new-instance v0, Lcom/miui/filtersdk/filter/base/GPUImageFilter$8;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/filtersdk/filter/base/GPUImageFilter$8;-><init>(Lcom/miui/filtersdk/filter/base/GPUImageFilter;I[F)V

    invoke-virtual {p0, v0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->runOnDraw(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected setUniformMatrix4f(I[F)V
    .locals 1

    new-instance v0, Lcom/miui/filtersdk/filter/base/GPUImageFilter$9;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/filtersdk/filter/base/GPUImageFilter$9;-><init>(Lcom/miui/filtersdk/filter/base/GPUImageFilter;I[F)V

    invoke-virtual {p0, v0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->runOnDraw(Ljava/lang/Runnable;)V

    return-void
.end method
