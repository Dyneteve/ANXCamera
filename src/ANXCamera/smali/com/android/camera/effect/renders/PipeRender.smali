.class public Lcom/android/camera/effect/renders/PipeRender;
.super Lcom/android/camera/effect/renders/RenderGroup;
.source "PipeRender.java"


# static fields
.field private static final DUMP_TEXTURE:Z = false

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mBufferHeight:I

.field private mBufferWidth:I

.field private mFrameBufferTextures:[I

.field private mFrameBuffers:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/effect/renders/PipeRender;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/renders/PipeRender;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/RenderGroup;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/effect/renders/RenderGroup;-><init>(Lcom/android/gallery3d/ui/GLCanvas;I)V

    return-void
.end method

.method private declared-synchronized destroyFrameBuffers()V
    .locals 8

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/android/camera/effect/renders/PipeRender;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "destroyFrameBuffers: count="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    const/4 v3, 0x0

    if-nez v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    array-length v2, v2

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    if-eqz v0, :cond_1

    move v0, v3

    :goto_1
    iget-object v1, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    array-length v1, v1

    if-ge v0, v1, :cond_1

    sget-object v1, Lcom/android/camera/effect/renders/PipeRender;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v4, "delete fbo thread=%d id=%d"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v3

    iget-object v6, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    aget v6, v6, v0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x1

    aput-object v6, v5, v7

    invoke-static {v2, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    array-length v0, v0

    iget-object v2, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    invoke-static {v0, v2, v3}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    iput-object v1, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    :cond_2
    iget-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    array-length v0, v0

    iget-object v2, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    invoke-static {v0, v2, v3}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    iput-object v1, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized initFrameBuffers(III)V
    .locals 20

    move-object/from16 v1, p0

    move/from16 v0, p1

    monitor-enter p0

    if-gtz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_0
    sget-object v2, Lcom/android/camera/effect/renders/PipeRender;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v4, "initFrameBuffers: count=%d size=%dx%d"

    const/4 v5, 0x3

    new-array v6, v5, [Ljava/lang/Object;

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x0

    aput-object v7, v6, v8

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v9, 0x1

    aput-object v7, v6, v9

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v10, 0x2

    aput-object v7, v6, v10

    invoke-static {v3, v4, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    new-array v2, v0, [I

    iput-object v2, v1, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    new-array v2, v0, [I

    iput-object v2, v1, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    move v2, v8

    :goto_0
    if-ge v2, v0, :cond_1

    iget-object v3, v1, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    invoke-static {v9, v3, v2}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    iget-object v3, v1, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    invoke-static {v9, v3, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    iget-object v3, v1, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    aget v3, v3, v2

    const/16 v4, 0xde1

    invoke-static {v4, v3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/16 v11, 0xde1

    const/4 v12, 0x0

    const/16 v13, 0x1908

    const/16 v16, 0x0

    const/16 v17, 0x1908

    const/16 v18, 0x1401

    const/16 v19, 0x0

    move/from16 v14, p2

    move/from16 v15, p3

    invoke-static/range {v11 .. v19}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    const/16 v3, 0x2800

    const v6, 0x46180400    # 9729.0f

    invoke-static {v4, v3, v6}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v3, 0x2801

    invoke-static {v4, v3, v6}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v3, 0x2802

    const v6, 0x47012f00    # 33071.0f

    invoke-static {v4, v3, v6}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v3, 0x2803

    invoke-static {v4, v3, v6}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    iget-object v3, v1, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    aget v3, v3, v2

    const v6, 0x8d40

    invoke-static {v6, v3}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    const v3, 0x8ce0

    iget-object v7, v1, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    aget v7, v7, v2

    invoke-static {v6, v3, v4, v7, v8}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    sget-object v3, Lcom/android/camera/effect/renders/PipeRender;->TAG:Ljava/lang/String;

    sget-object v7, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v11, "fbo[%d]: %d %d %d*%d thread=%d"

    const/4 v12, 0x6

    new-array v12, v12, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v12, v8

    iget-object v13, v1, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    aget v13, v13, v2

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v12, v9

    iget-object v13, v1, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    aget v13, v13, v2

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v12, v10

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v12, v5

    const/4 v13, 0x4

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x5

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Thread;->getId()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v7, v11, v12}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v7}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v4, v8}, Landroid/opengl/GLES20;->glBindTexture(II)V

    invoke-static {v6, v8}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public addRender(Lcom/android/camera/effect/renders/Render;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/effect/renders/RenderGroup;->addRender(Lcom/android/camera/effect/renders/Render;)V

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/PipeRender;->getRenderSize()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    iget-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    array-length v0, v0

    if-le p1, v0, :cond_1

    :cond_0
    iget p1, p0, Lcom/android/camera/effect/renders/PipeRender;->mBufferWidth:I

    if-lez p1, :cond_1

    iget p1, p0, Lcom/android/camera/effect/renders/PipeRender;->mBufferHeight:I

    if-lez p1, :cond_1

    iget p1, p0, Lcom/android/camera/effect/renders/PipeRender;->mBufferWidth:I

    iget v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mBufferHeight:I

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/effect/renders/PipeRender;->reInitFrameBuffers(II)V

    :cond_1
    return-void
.end method

.method public deleteBuffer()V
    .locals 0

    invoke-super {p0}, Lcom/android/camera/effect/renders/RenderGroup;->deleteBuffer()V

    invoke-direct {p0}, Lcom/android/camera/effect/renders/PipeRender;->destroyFrameBuffers()V

    return-void
.end method

.method public draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z
    .locals 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    if-eqz v2, :cond_c

    iget-object v2, v0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    if-nez v2, :cond_0

    goto/16 :goto_9

    :cond_0
    nop

    nop

    nop

    nop

    nop

    nop

    invoke-virtual/range {p1 .. p1}, Lcom/android/camera/effect/draw_mode/DrawAttribute;->getTarget()I

    move-result v2

    const/16 v4, 0xb

    if-eq v2, v4, :cond_1

    packed-switch v2, :pswitch_data_0

    sget-object v6, Lcom/android/camera/effect/renders/PipeRender;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "unsupported target "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/16 v18, 0x0

    goto :goto_2

    :pswitch_0
    move-object v6, v1

    check-cast v6, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;

    iget v7, v6, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mX:I

    iget v8, v6, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mY:I

    iget v9, v6, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mWidth:I

    iget v10, v6, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mHeight:I

    iget v11, v6, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mTexId:I

    iget-boolean v6, v6, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mIsSnapshot:Z

    goto :goto_0

    :pswitch_1
    move-object v6, v1

    check-cast v6, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    iget v7, v6, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mX:I

    iget v8, v6, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mY:I

    iget v9, v6, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mWidth:I

    iget v10, v6, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mHeight:I

    iget-object v11, v6, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mBasicTexture:Lcom/android/gallery3d/ui/BasicTexture;

    invoke-virtual {v11}, Lcom/android/gallery3d/ui/BasicTexture;->getId()I

    move-result v11

    iget-boolean v6, v6, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mIsSnapshot:Z

    nop

    :goto_0
    move/from16 v18, v6

    move v6, v11

    goto :goto_2

    :cond_1
    move-object v6, v1

    check-cast v6, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;

    nop

    nop

    iget v7, v6, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mBlockWidth:I

    if-nez v7, :cond_2

    iget v7, v6, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mBlockHeight:I

    if-nez v7, :cond_2

    iget-object v7, v6, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v7}, Landroid/util/Size;->getWidth()I

    move-result v7

    iget-object v6, v6, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v6}, Landroid/util/Size;->getHeight()I

    move-result v6

    goto :goto_1

    :cond_2
    iget v7, v6, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mBlockWidth:I

    iget v6, v6, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mBlockHeight:I

    :goto_1
    nop

    nop

    move v10, v6

    move v9, v7

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/16 v18, 0x1

    :goto_2
    if-eqz v9, :cond_b

    if-nez v10, :cond_3

    goto/16 :goto_8

    :cond_3
    iget v15, v0, Lcom/android/camera/effect/renders/PipeRender;->mBufferWidth:I

    iget v14, v0, Lcom/android/camera/effect/renders/PipeRender;->mBufferHeight:I

    const/4 v11, 0x0

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/effect/renders/PipeRender;->getRenders()Ljava/util/ArrayList;

    move-result-object v13

    if-eqz v13, :cond_a

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v12

    move-object v3, v11

    const/4 v11, 0x0

    :goto_3
    if-ge v11, v12, :cond_a

    invoke-interface {v13, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v5, v16

    check-cast v5, Lcom/android/camera/effect/renders/Render;

    add-int/lit8 v4, v12, -0x1

    if-ge v11, v4, :cond_4

    const/4 v4, 0x1

    goto :goto_4

    :cond_4
    nop

    const/4 v4, 0x0

    :goto_4
    if-eqz v4, :cond_5

    move/from16 v20, v12

    iget-object v12, v0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    aget v12, v12, v11

    invoke-virtual {v0, v12, v15, v14}, Lcom/android/camera/effect/renders/PipeRender;->beginBindFrameBuffer(III)V

    goto :goto_5

    :cond_5
    move/from16 v20, v12

    :goto_5
    if-nez v11, :cond_7

    const/16 v12, 0xb

    if-eq v12, v2, :cond_6

    if-eqz v4, :cond_6

    new-instance v3, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;

    const/16 v16, 0x0

    const/16 v17, 0x0

    move/from16 v19, v11

    move-object v11, v3

    move/from16 v21, v12

    move v12, v6

    move-object/from16 v22, v13

    move/from16 v13, v16

    move/from16 v23, v14

    move/from16 v14, v17

    move/from16 v24, v15

    move/from16 v16, v23

    move/from16 v17, v18

    invoke-direct/range {v11 .. v17}, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;-><init>(IIIIIZ)V

    invoke-virtual {v5, v3}, Lcom/android/camera/effect/renders/Render;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    move/from16 v14, v23

    goto :goto_6

    :cond_6
    move/from16 v19, v11

    move/from16 v21, v12

    move-object/from16 v22, v13

    move/from16 v23, v14

    move/from16 v24, v15

    invoke-virtual {v5, v1}, Lcom/android/camera/effect/renders/Render;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    move/from16 v14, v23

    move/from16 v15, v24

    goto :goto_6

    :cond_7
    move/from16 v19, v11

    move-object/from16 v22, v13

    move/from16 v23, v14

    move/from16 v24, v15

    const/16 v21, 0xb

    iget-object v11, v0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    add-int/lit8 v12, v19, -0x1

    aget v11, v11, v12

    invoke-virtual {v5, v11, v15, v14}, Lcom/android/camera/effect/renders/Render;->setPreviousFrameBufferInfo(III)V

    if-nez v4, :cond_8

    iput v7, v3, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mX:I

    iput v8, v3, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mY:I

    iput v9, v3, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mWidth:I

    iput v10, v3, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mHeight:I

    :cond_8
    invoke-virtual {v5, v3}, Lcom/android/camera/effect/renders/Render;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    :goto_6
    if-eqz v4, :cond_9

    new-instance v3, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;

    iget-object v4, v0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    aget v12, v4, v19

    const/4 v13, 0x0

    const/4 v4, 0x0

    move-object v11, v3

    move v5, v14

    move v14, v4

    move v4, v15

    move/from16 v16, v5

    move/from16 v17, v18

    invoke-direct/range {v11 .. v17}, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;-><init>(IIIIIZ)V

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/effect/renders/PipeRender;->endBindFrameBuffer()V

    goto :goto_7

    :cond_9
    move v5, v14

    move v4, v15

    :goto_7
    add-int/lit8 v11, v19, 0x1

    move v15, v4

    move v14, v5

    move/from16 v12, v20

    move/from16 v4, v21

    move-object/from16 v13, v22

    goto/16 :goto_3

    :cond_a
    const/4 v0, 0x1

    return v0

    :cond_b
    :goto_8
    const/4 v0, 0x1

    sget-object v1, Lcom/android/camera/effect/renders/PipeRender;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v3, "invalid size: %dx%d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v0

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v6

    :cond_c
    :goto_9
    const/4 v6, 0x0

    sget-object v0, Lcom/android/camera/effect/renders/PipeRender;->TAG:Ljava/lang/String;

    const-string v1, "framebuffer hasn\'t been initialized"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v6

    nop

    nop

    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public drawOnExtraFrameBufferOnce(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z
    .locals 7

    nop

    nop

    invoke-virtual {p1}, Lcom/android/camera/effect/draw_mode/DrawAttribute;->getTarget()I

    move-result v0

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    sget-object v2, Lcom/android/camera/effect/renders/PipeRender;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "unsupported target "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    move v2, v0

    goto :goto_0

    :pswitch_0
    move-object v0, p1

    check-cast v0, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;

    iget v2, v0, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mWidth:I

    iget v0, v0, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mHeight:I

    goto :goto_0

    :pswitch_1
    move-object v0, p1

    check-cast v0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    iget v2, v0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mWidth:I

    iget v0, v0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mHeight:I

    nop

    :goto_0
    const/4 v3, 0x1

    if-eqz v2, :cond_3

    if-nez v0, :cond_0

    goto :goto_2

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/effect/renders/PipeRender;->getRenders()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ne v2, v3, :cond_1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/renders/Render;

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/Render;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    goto :goto_1

    :cond_1
    sget-object p1, Lcom/android/camera/effect/renders/PipeRender;->TAG:Ljava/lang/String;

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v4, "renders more than 1: %d"

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v5, v1

    invoke-static {v0, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_1
    return v3

    :cond_3
    :goto_2
    sget-object p1, Lcom/android/camera/effect/renders/PipeRender;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v5, "invalid size: %dx%d"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v6, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v3

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public reInitFrameBuffers(II)V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/effect/renders/PipeRender;->destroyFrameBuffers()V

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/PipeRender;->getRenderSize()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-direct {p0, v0, p1, p2}, Lcom/android/camera/effect/renders/PipeRender;->initFrameBuffers(III)V

    return-void
.end method

.method public setFrameBufferSize(II)V
    .locals 1

    iget v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mBufferWidth:I

    if-ne v0, p1, :cond_0

    iget v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mBufferHeight:I

    if-eq v0, p2, :cond_1

    :cond_0
    iput p1, p0, Lcom/android/camera/effect/renders/PipeRender;->mBufferWidth:I

    iput p2, p0, Lcom/android/camera/effect/renders/PipeRender;->mBufferHeight:I

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/effect/renders/PipeRender;->reInitFrameBuffers(II)V

    :cond_1
    return-void
.end method
