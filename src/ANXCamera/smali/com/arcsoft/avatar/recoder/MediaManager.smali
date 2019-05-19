.class public Lcom/arcsoft/avatar/recoder/MediaManager;
.super Ljava/lang/Object;
.source "MediaManager.java"

# interfaces
.implements Lcom/arcsoft/avatar/recoder/RecordingListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/arcsoft/avatar/recoder/MediaManager$SaveThread;
    }
.end annotation


# static fields
.field public static final MUXER_AUDIO_ENCODER:I = 0x1

.field public static final MUXER_VIDEO_AND_AUDIO_ENCODER:I = 0x2

.field public static final MUXER_VIDEO_ENCODER:I = 0x1

.field private static final a:Ljava/lang/String; = "Arc_VideoEncoder"

.field private static final s:I = 0x2


# instance fields
.field private b:I

.field private c:I

.field private d:I

.field private e:Z

.field private f:Z

.field private g:Ljava/lang/String;

.field private h:Ljava/lang/String;

.field private i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

.field private j:Lcom/arcsoft/avatar/recoder/BaseEncoder;

.field private k:Lcom/arcsoft/avatar/recoder/MuxerWrapper;

.field private l:Z

.field private m:Lcom/arcsoft/avatar/gl/GLRender;

.field private n:I

.field private o:I

.field private p:Ljava/lang/Object;

.field private q:Lcom/arcsoft/avatar/recoder/RecordingListener;

.field private r:Lcom/arcsoft/avatar/recoder/FrameQueue;

.field private t:I

.field private u:I

.field private v:[I


# direct methods
.method public constructor <init>(Ljava/lang/String;IIIZILcom/arcsoft/avatar/recoder/RecordingListener;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p7, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->q:Lcom/arcsoft/avatar/recoder/RecordingListener;

    iput p2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->b:I

    iput p3, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->c:I

    const/16 p7, 0x5a

    if-eq p7, p4, :cond_0

    const/16 p7, 0x10e

    if-ne p7, p4, :cond_1

    :cond_0
    iget p7, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->b:I

    iget v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->c:I

    xor-int/2addr p7, v0

    iput p7, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->b:I

    iget p7, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->b:I

    iget v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->c:I

    xor-int/2addr p7, v0

    iput p7, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->c:I

    iget p7, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->b:I

    iget v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->c:I

    xor-int/2addr p7, v0

    iput p7, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->b:I

    :cond_1
    iput p4, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->d:I

    iput-boolean p5, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->e:Z

    iput-object p1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->g:Ljava/lang/String;

    const/4 p1, 0x0

    iput p1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->n:I

    iput p1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->o:I

    new-instance p4, Lcom/arcsoft/avatar/recoder/MuxerWrapper;

    iget-object p5, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->g:Ljava/lang/String;

    invoke-direct {p4, p5, p6, p0}, Lcom/arcsoft/avatar/recoder/MuxerWrapper;-><init>(Ljava/lang/String;ILcom/arcsoft/avatar/recoder/RecordingListener;)V

    iput-object p4, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->k:Lcom/arcsoft/avatar/recoder/MuxerWrapper;

    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentDisplay()Landroid/opengl/EGLDisplay;

    move-result-object p4

    const/16 p5, 0x305a

    invoke-static {p5}, Landroid/opengl/EGL14;->eglGetCurrentSurface(I)Landroid/opengl/EGLSurface;

    move-result-object p5

    const/4 p6, 0x1

    new-array p7, p6, [I

    new-array p6, p6, [I

    const/16 v0, 0x3057

    invoke-static {p4, p5, v0, p7, p1}, Landroid/opengl/EGL14;->eglQuerySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;I[II)Z

    const/16 v0, 0x3056

    invoke-static {p4, p5, v0, p6, p1}, Landroid/opengl/EGL14;->eglQuerySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;I[II)Z

    aget p4, p7, p1

    iput p4, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->t:I

    aget p1, p6, p1

    iput p1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->u:I

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->p:Ljava/lang/Object;

    const-string p1, "Arc_VideoEncoder"

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "MediaManager constructor mFrameWidth = "

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " ,mFrameHeight = "

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic a(Lcom/arcsoft/avatar/recoder/MediaManager;)I
    .locals 0

    iget p0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->b:I

    return p0
.end method

.method private a()V
    .locals 3

    iget v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->n:I

    iget v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->o:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->f:Z

    return-void

    :cond_0
    iget v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->o:I

    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    return-void

    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Init encoder count great than need. need="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->n:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " ,but got="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->o:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic b(Lcom/arcsoft/avatar/recoder/MediaManager;)I
    .locals 0

    iget p0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->c:I

    return p0
.end method

.method private b()V
    .locals 8

    iget v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->b:I

    iget v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->c:I

    mul-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    iget v3, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->b:I

    iget v4, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->c:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/16 v5, 0x1908

    const/16 v6, 0x1401

    move-object v7, v0

    invoke-static/range {v1 .. v7}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    const-string v1, "Arc_VideoEncoder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "glReadPixels() glError = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/arcsoft/avatar/recoder/MediaManager$SaveThread;

    invoke-direct {v1, p0, v0}, Lcom/arcsoft/avatar/recoder/MediaManager$SaveThread;-><init>(Lcom/arcsoft/avatar/recoder/MediaManager;Ljava/nio/ByteBuffer;)V

    invoke-virtual {v1}, Lcom/arcsoft/avatar/recoder/MediaManager$SaveThread;->start()V

    return-void
.end method


# virtual methods
.method public drawSurfaceWithTextureId(I)V
    .locals 8

    iget-boolean v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->f:Z

    if-nez v0, :cond_0

    const-string p1, "Arc_VideoEncoder"

    const-string v0, "drawSurfaceWithTextureId()-> MediaManager has not been initialized."

    invoke-static {p1, v0}, Lcom/arcsoft/avatar/util/CodecLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    if-lez p1, :cond_7

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->m:Lcom/arcsoft/avatar/gl/GLRender;

    if-eqz v0, :cond_6

    const-string v0, "Arc_VideoEncoder"

    const-string v1, "drawSurfaceWithTextureId()->A-"

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    nop

    nop

    const/4 v1, 0x1

    const/4 v2, 0x0

    :try_start_0
    iget-object v3, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {v3}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->lock()V

    iget-object v3, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->r:Lcom/arcsoft/avatar/recoder/FrameQueue;

    invoke-virtual {v3}, Lcom/arcsoft/avatar/recoder/FrameQueue;->isIsInited()Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->r:Lcom/arcsoft/avatar/recoder/FrameQueue;

    invoke-virtual {v3}, Lcom/arcsoft/avatar/recoder/FrameQueue;->getFrameForProducer()Lcom/arcsoft/avatar/recoder/FrameItem;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_2

    :try_start_1
    iget-boolean v0, v3, Lcom/arcsoft/avatar/recoder/FrameItem;->mIsInited:Z

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    move-object v0, v3

    move v3, v1

    goto :goto_1

    :catch_0
    move-exception v0

    move-object v7, v3

    move-object v3, v0

    move-object v0, v7

    goto :goto_2

    :cond_2
    :goto_0
    const-string v0, "Arc_VideoEncoder"

    const-string v4, "drawSurfaceWithTextureId()-> get a null frame item."

    invoke-static {v0, v4}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object p1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {p1}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->unLock()V

    return-void

    :cond_3
    nop

    move v3, v2

    :goto_1
    iget-object v4, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {v4}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->unLock()V

    goto :goto_3

    :catchall_0
    move-exception p1

    goto/16 :goto_7

    :catch_1
    move-exception v3

    :goto_2
    nop

    :try_start_2
    const-string v4, "Arc_VideoEncoder"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "drawSurfaceWithTextureId meet error when get lock : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    iget-object v3, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {v3}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->unLock()V

    nop

    move v3, v2

    :goto_3
    if-nez v3, :cond_4

    return-void

    :cond_4
    iget-object v3, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->v:[I

    if-nez v3, :cond_5

    const/4 v3, 0x4

    new-array v3, v3, [I

    iput-object v3, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->v:[I

    const/16 v3, 0xba2

    iget-object v4, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->v:[I

    invoke-static {v3, v4, v2}, Landroid/opengl/GLES30;->glGetIntegerv(I[II)V

    :cond_5
    iget-object v3, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->r:Lcom/arcsoft/avatar/recoder/FrameQueue;

    invoke-virtual {v3, v0}, Lcom/arcsoft/avatar/recoder/FrameQueue;->deleteSync(Lcom/arcsoft/avatar/recoder/FrameItem;)V

    iget-object v3, v0, Lcom/arcsoft/avatar/recoder/FrameItem;->mFramebuffer:Lcom/arcsoft/avatar/gl/GLFramebuffer;

    invoke-virtual {v3, v2, v2}, Lcom/arcsoft/avatar/gl/GLFramebuffer;->bind(ZZ)V

    iget v3, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->b:I

    iget v4, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->c:I

    invoke-static {v2, v2, v3, v4}, Landroid/opengl/GLES20;->glViewport(IIII)V

    iget-object v3, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->m:Lcom/arcsoft/avatar/gl/GLRender;

    invoke-virtual {v3, p1}, Lcom/arcsoft/avatar/gl/GLRender;->renderWithTextureId(I)V

    const p1, 0x9117

    invoke-static {p1, v2}, Landroid/opengl/GLES30;->glFenceSync(II)J

    move-result-wide v3

    iput-wide v3, v0, Lcom/arcsoft/avatar/recoder/FrameItem;->a:J

    iget-object p1, v0, Lcom/arcsoft/avatar/recoder/FrameItem;->mFramebuffer:Lcom/arcsoft/avatar/gl/GLFramebuffer;

    invoke-virtual {p1, v2, v2}, Lcom/arcsoft/avatar/gl/GLFramebuffer;->unBind(ZZ)V

    iput-boolean v2, v0, Lcom/arcsoft/avatar/recoder/FrameItem;->mIsEmpty:Z

    iget-object p1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->v:[I

    aget p1, p1, v2

    iget-object v2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->v:[I

    aget v1, v2, v1

    iget-object v2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->v:[I

    const/4 v3, 0x2

    aget v2, v2, v3

    iget-object v3, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->v:[I

    const/4 v4, 0x3

    aget v3, v3, v4

    invoke-static {p1, v1, v2, v3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    const-string p1, "Arc_VideoEncoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "drawSurfaceWithTextureId()-> A glError = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", fbo = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " ,textureId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Lcom/arcsoft/avatar/recoder/FrameItem;->mFramebuffer:Lcom/arcsoft/avatar/gl/GLFramebuffer;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/gl/GLFramebuffer;->getTextureId()I

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_3
    iget-object p1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {p1}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->lock()V

    iget-object p1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->r:Lcom/arcsoft/avatar/recoder/FrameQueue;

    invoke-virtual {p1}, Lcom/arcsoft/avatar/recoder/FrameQueue;->addFrameForProducer()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    nop

    :goto_4
    iget-object p1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {p1}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->sinalCondition()V

    iget-object p1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {p1}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->unLock()V

    goto :goto_5

    :catchall_1
    move-exception p1

    goto :goto_6

    :catch_2
    move-exception p1

    nop

    :try_start_4
    const-string v0, "Arc_VideoEncoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "drawSurfaceWithTextureId meet error when get lock : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_4

    :goto_5
    const-string p1, "Arc_VideoEncoder"

    const-string v0, "drawSurfaceWithTextureId()->C"

    invoke-static {p1, v0}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :goto_6
    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->sinalCondition()V

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->unLock()V

    throw p1

    :goto_7
    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->unLock()V

    throw p1

    :cond_6
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Could not call drawSurfaceWithTextureId() in with a null GLRender."

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "textureId must >0 , your textureId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getMuxerSizeRecorded()J
    .locals 2

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->k:Lcom/arcsoft/avatar/recoder/MuxerWrapper;

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->k:Lcom/arcsoft/avatar/recoder/MuxerWrapper;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/recoder/MuxerWrapper;->getSizeRecordFile()J

    move-result-wide v0

    return-wide v0
.end method

.method public getMuxerTimeElapsed()J
    .locals 2

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->k:Lcom/arcsoft/avatar/recoder/MuxerWrapper;

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->k:Lcom/arcsoft/avatar/recoder/MuxerWrapper;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/recoder/MuxerWrapper;->getTimeElapse()J

    move-result-wide v0

    return-wide v0
.end method

.method public initAudioEncoder()V
    .locals 3

    new-instance v0, Lcom/arcsoft/avatar/recoder/AudioEncoder;

    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->k:Lcom/arcsoft/avatar/recoder/MuxerWrapper;

    iget-object v2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->p:Ljava/lang/Object;

    invoke-direct {v0, v1, v2, p0}, Lcom/arcsoft/avatar/recoder/AudioEncoder;-><init>(Lcom/arcsoft/avatar/recoder/MuxerWrapper;Ljava/lang/Object;Lcom/arcsoft/avatar/recoder/RecordingListener;)V

    iput-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->j:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->j:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->prepare(Z)V

    iget v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->o:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->o:I

    invoke-direct {p0}, Lcom/arcsoft/avatar/recoder/MediaManager;->a()V

    return-void
.end method

.method public initVideoEncoder()V
    .locals 10

    const-string v0, "Arc_VideoEncoder"

    const-string v1, "MediaManager initVideoEncoder in"

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/util/CodecLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/arcsoft/avatar/recoder/VideoEncoder;

    iget-object v3, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->k:Lcom/arcsoft/avatar/recoder/MuxerWrapper;

    iget v4, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->b:I

    iget v5, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->c:I

    iget-object v6, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->p:Ljava/lang/Object;

    sget-object v8, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    const v9, 0x989680

    move-object v2, v0

    move-object v7, p0

    invoke-direct/range {v2 .. v9}, Lcom/arcsoft/avatar/recoder/VideoEncoder;-><init>(Lcom/arcsoft/avatar/recoder/MuxerWrapper;IILjava/lang/Object;Lcom/arcsoft/avatar/recoder/RecordingListener;Landroid/opengl/EGLContext;I)V

    iput-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->prepare(Z)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->f:Z

    iget v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->o:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->o:I

    invoke-direct {p0}, Lcom/arcsoft/avatar/recoder/MediaManager;->a()V

    const-string v0, "Arc_VideoEncoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MediaManager initVideoEncoder out mInitedEncoderCount = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->o:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/util/CodecLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public initVideoEncoderWithSharedContext(Landroid/opengl/EGLContext;IZ)V
    .locals 10

    const-string v0, "Arc_VideoEncoder"

    const-string v1, "MediaManager initVideoEncoderWithSharedContext in"

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/arcsoft/avatar/recoder/VideoEncoder;

    iget-object v3, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->k:Lcom/arcsoft/avatar/recoder/MuxerWrapper;

    iget v4, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->b:I

    iget v5, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->c:I

    iget-object v6, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->p:Ljava/lang/Object;

    move-object v2, v0

    move-object v7, p0

    move-object v8, p1

    move v9, p2

    invoke-direct/range {v2 .. v9}, Lcom/arcsoft/avatar/recoder/VideoEncoder;-><init>(Lcom/arcsoft/avatar/recoder/MuxerWrapper;IILjava/lang/Object;Lcom/arcsoft/avatar/recoder/RecordingListener;Landroid/opengl/EGLContext;I)V

    iput-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    const-string p1, "Arc_VideoEncoder"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "MediaManager initVideoEncoderWithSharedContext encoder type = "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->getEncoderType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->l:Z

    iget-boolean p2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->l:Z

    const/4 v0, 0x0

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {p2}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->getInputSurface()Landroid/view/Surface;

    move-result-object p2

    if-eqz p2, :cond_0

    new-instance p2, Lcom/arcsoft/avatar/gl/GLRender;

    iget v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->b:I

    iget v2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->c:I

    iget v3, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->d:I

    iget-boolean v4, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->e:Z

    invoke-direct {p2, v1, v2, v3, v4}, Lcom/arcsoft/avatar/gl/GLRender;-><init>(IIIZ)V

    iput-object p2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->m:Lcom/arcsoft/avatar/gl/GLRender;

    iget-object p2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->m:Lcom/arcsoft/avatar/gl/GLRender;

    invoke-virtual {p2, p3}, Lcom/arcsoft/avatar/gl/GLRender;->initRender(Z)V

    goto :goto_0

    :cond_0
    const-string p2, "Arc_VideoEncoder"

    const-string p3, "initVideoEncoder()->getInputSurface null."

    invoke-static {p2, p3}, Lcom/arcsoft/avatar/util/CodecLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->q:Lcom/arcsoft/avatar/recoder/RecordingListener;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->q:Lcom/arcsoft/avatar/recoder/RecordingListener;

    const/16 p3, 0x232

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p2, p3, v1}, Lcom/arcsoft/avatar/recoder/RecordingListener;->onRecordingListener(ILjava/lang/Object;)V

    :cond_1
    :goto_0
    new-instance p2, Lcom/arcsoft/avatar/recoder/FrameQueue;

    invoke-direct {p2}, Lcom/arcsoft/avatar/recoder/FrameQueue;-><init>()V

    iput-object p2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->r:Lcom/arcsoft/avatar/recoder/FrameQueue;

    iget-object p2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->r:Lcom/arcsoft/avatar/recoder/FrameQueue;

    const/4 p3, 0x2

    iget v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->b:I

    iget v2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->c:I

    invoke-virtual {p2, p3, v1, v2, v0}, Lcom/arcsoft/avatar/recoder/FrameQueue;->init(IIIZ)V

    iget-object p2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    iget-object p3, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->r:Lcom/arcsoft/avatar/recoder/FrameQueue;

    invoke-virtual {p2, p3}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->setFrameQueue(Lcom/arcsoft/avatar/recoder/FrameQueue;)V

    iget p2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->o:I

    add-int/2addr p2, p1

    iput p2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->o:I

    invoke-direct {p0}, Lcom/arcsoft/avatar/recoder/MediaManager;->a()V

    const-string p1, "Arc_VideoEncoder"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "MediaManager initVideoEncoderWithSharedContext out mInitedEncoderCount = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p3, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->o:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/util/CodecLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onRecordingListener(ILjava/lang/Object;)V
    .locals 4

    const-string v0, "Arc_VideoEncoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onRecordingListener()->in msg = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " ,value = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    nop

    nop

    const/16 v0, 0x270

    const/16 v1, 0x220

    const/16 v2, 0x230

    const/16 v3, 0x260

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    packed-switch p1, :pswitch_data_2

    packed-switch p1, :pswitch_data_3

    goto :goto_3

    :pswitch_0
    nop

    goto :goto_0

    :pswitch_1
    nop

    goto :goto_0

    :pswitch_2
    nop

    nop

    :goto_0
    move v3, v0

    goto :goto_4

    :pswitch_3
    nop

    goto :goto_4

    :pswitch_4
    nop

    goto :goto_4

    :pswitch_5
    nop

    goto :goto_4

    :pswitch_6
    nop

    goto :goto_4

    :pswitch_7
    nop

    goto :goto_4

    :pswitch_8
    nop

    goto :goto_4

    :pswitch_9
    nop

    goto :goto_1

    :pswitch_a
    nop

    goto :goto_1

    :pswitch_b
    nop

    goto :goto_1

    :pswitch_c
    nop

    goto :goto_1

    :pswitch_d
    nop

    nop

    :goto_1
    move v3, v2

    goto :goto_4

    :pswitch_e
    nop

    goto :goto_2

    :pswitch_f
    nop

    goto :goto_2

    :pswitch_10
    nop

    goto :goto_2

    :pswitch_11
    nop

    goto :goto_2

    :pswitch_12
    nop

    nop

    :goto_2
    move v3, v1

    goto :goto_4

    :goto_3
    move v3, p1

    :goto_4
    iget-object p1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->q:Lcom/arcsoft/avatar/recoder/RecordingListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->q:Lcom/arcsoft/avatar/recoder/RecordingListener;

    invoke-interface {p1, v3, p2}, Lcom/arcsoft/avatar/recoder/RecordingListener;->onRecordingListener(ILjava/lang/Object;)V

    :cond_0
    const-string p1, "Arc_VideoEncoder"

    const-string p2, "onRecordingListener()->out"

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x221
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x231
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x261
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x271
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public pauseRecording()I
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->j:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->j:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->pauseRecording()V

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->pauseRecording()V

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public resumeRecording()I
    .locals 2

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->p:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->j:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->j:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {v1}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->resumeRecording()V

    :cond_0
    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {v1}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->resumeRecording()V

    :cond_1
    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->p:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v0

    const/4 v0, 0x0

    return v0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setEncoderCount(I)V
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->k:Lcom/arcsoft/avatar/recoder/MuxerWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->k:Lcom/arcsoft/avatar/recoder/MuxerWrapper;

    invoke-virtual {v0, p1}, Lcom/arcsoft/avatar/recoder/MuxerWrapper;->setEncoderCount(I)V

    :cond_0
    iput p1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->n:I

    return-void
.end method

.method public startRecording()V
    .locals 3

    iget-boolean v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->f:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->k:Lcom/arcsoft/avatar/recoder/MuxerWrapper;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->startRecording()V

    goto :goto_0

    :cond_0
    const-string v0, "Arc_VideoEncoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startRecording()-> VideoEncoder is null. maxEncoderCount="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->n:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/util/CodecLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->j:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->j:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->startRecording()V

    goto :goto_1

    :cond_1
    const-string v0, "Arc_VideoEncoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startRecording()-> AudioEncoder is null. maxEncoderCount="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->n:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/util/CodecLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void

    :cond_2
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Unit Encoder or Muxer is null."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public stopRecording()V
    .locals 3

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->p:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->p:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->stopRecording()V

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->release(Z)V

    iput-object v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->i:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->j:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->j:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->stopRecording()V

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->j:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->release(Z)V

    iput-object v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->j:Lcom/arcsoft/avatar/recoder/BaseEncoder;

    :cond_1
    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->m:Lcom/arcsoft/avatar/gl/GLRender;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->m:Lcom/arcsoft/avatar/gl/GLRender;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/gl/GLRender;->unInitRender()V

    iput-object v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->m:Lcom/arcsoft/avatar/gl/GLRender;

    :cond_2
    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->r:Lcom/arcsoft/avatar/recoder/FrameQueue;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->r:Lcom/arcsoft/avatar/recoder/FrameQueue;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/recoder/FrameQueue;->unInit()V

    iput-object v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->r:Lcom/arcsoft/avatar/recoder/FrameQueue;

    :cond_3
    iput-object v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->k:Lcom/arcsoft/avatar/recoder/MuxerWrapper;

    iput-object v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->p:Ljava/lang/Object;

    iput-object v1, p0, Lcom/arcsoft/avatar/recoder/MediaManager;->v:[I

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
