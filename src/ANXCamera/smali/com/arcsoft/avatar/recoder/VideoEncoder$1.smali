.class Lcom/arcsoft/avatar/recoder/VideoEncoder$1;
.super Ljava/lang/Thread;
.source "VideoEncoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arcsoft/avatar/recoder/VideoEncoder;->startRecording()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/arcsoft/avatar/recoder/VideoEncoder;


# direct methods
.method constructor <init>(Lcom/arcsoft/avatar/recoder/VideoEncoder;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    invoke-super {p0}, Ljava/lang/Thread;->run()V

    const-string v0, "ARC_V"

    invoke-virtual {p0, v0}, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->setName(Ljava/lang/String;)V

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    iget-object v1, v1, Lcom/arcsoft/avatar/recoder/VideoEncoder;->i:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    nop

    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    invoke-static {v1}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->a(Lcom/arcsoft/avatar/recoder/VideoEncoder;)Lcom/arcsoft/avatar/gl/EGLWrapper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arcsoft/avatar/gl/EGLWrapper;->makeCurrent()Z

    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    invoke-static {v1}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->b(Lcom/arcsoft/avatar/recoder/VideoEncoder;)V

    nop

    :goto_0
    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    iget-boolean v1, v1, Lcom/arcsoft/avatar/recoder/VideoEncoder;->d:Z

    if-nez v1, :cond_3

    const/4 v1, 0x0

    :try_start_1
    iget-object v2, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    invoke-virtual {v2}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->lock()V

    :goto_1
    iget-object v2, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    iget-object v2, v2, Lcom/arcsoft/avatar/recoder/VideoEncoder;->s:Lcom/arcsoft/avatar/recoder/FrameQueue;

    invoke-virtual {v2}, Lcom/arcsoft/avatar/recoder/FrameQueue;->queueSize()I

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    iget-boolean v2, v2, Lcom/arcsoft/avatar/recoder/VideoEncoder;->d:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v2, :cond_0

    :try_start_2
    const-string v2, "Arc_VideoEncoder"

    const-string v3, "VideoEncoder frame_item_wait"

    invoke-static {v2, v3}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    iget-object v2, v2, Lcom/arcsoft/avatar/recoder/VideoEncoder;->r:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    :catch_0
    move-exception v2

    :try_start_3
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_2
    goto :goto_1

    :cond_0
    iget-object v2, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    iget-object v2, v2, Lcom/arcsoft/avatar/recoder/VideoEncoder;->s:Lcom/arcsoft/avatar/recoder/FrameQueue;

    invoke-virtual {v2}, Lcom/arcsoft/avatar/recoder/FrameQueue;->getFrameForConsumer()Lcom/arcsoft/avatar/recoder/FrameItem;

    move-result-object v2
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    nop

    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    invoke-virtual {v1}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->unLock()V

    nop

    move-object v1, v2

    goto :goto_3

    :catchall_0
    move-exception v0

    goto/16 :goto_7

    :catch_1
    move-exception v2

    :try_start_4
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    const-string v3, "Arc_VideoEncoder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "VideoEncoder meet exception when get item : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/arcsoft/avatar/util/CodecLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    iget-object v2, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    invoke-virtual {v2}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->unLock()V

    nop

    :goto_3
    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object v2, v1, Lcom/arcsoft/avatar/recoder/FrameItem;->mFramebuffer:Lcom/arcsoft/avatar/gl/GLFramebuffer;

    iget-object v3, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    invoke-virtual {v3}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->drain()V

    const-string v3, "Arc_VideoEncoder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "VideoEncoder frame_item_index = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v1, Lcom/arcsoft/avatar/recoder/FrameItem;->mFrameIndex:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 v3, 0x0

    iget-wide v5, v1, Lcom/arcsoft/avatar/recoder/FrameItem;->a:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_2

    const-string v3, "Arc_VideoEncoder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "VideoEncoder wait gpu by sync = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v5, v1, Lcom/arcsoft/avatar/recoder/FrameItem;->a:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v3, v1, Lcom/arcsoft/avatar/recoder/FrameItem;->a:J

    const-wide/16 v5, -0x1

    invoke-static {v3, v4, v0, v5, v6}, Landroid/opengl/GLES30;->glWaitSync(JIJ)V

    :cond_2
    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    invoke-static {v1}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->c(Lcom/arcsoft/avatar/recoder/VideoEncoder;)Lcom/arcsoft/avatar/gl/GLRender;

    move-result-object v1

    invoke-virtual {v2}, Lcom/arcsoft/avatar/gl/GLFramebuffer;->getTextureId()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/arcsoft/avatar/gl/GLRender;->renderWithTextureId(I)V

    nop

    :try_start_5
    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    invoke-virtual {v1}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->lock()V

    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    iget-object v1, v1, Lcom/arcsoft/avatar/recoder/VideoEncoder;->s:Lcom/arcsoft/avatar/recoder/FrameQueue;

    invoke-virtual {v1}, Lcom/arcsoft/avatar/recoder/FrameQueue;->addEmptyFrameForConsumer()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    nop

    :goto_4
    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    invoke-virtual {v1}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->unLock()V

    goto :goto_5

    :catchall_1
    move-exception v0

    goto :goto_6

    :catch_2
    move-exception v1

    :try_start_6
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    const-string v2, "Arc_VideoEncoder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "VideoEncoder meet exception when add item : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/arcsoft/avatar/util/CodecLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_4

    :goto_5
    nop

    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    invoke-static {v1}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->a(Lcom/arcsoft/avatar/recoder/VideoEncoder;)Lcom/arcsoft/avatar/gl/EGLWrapper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arcsoft/avatar/gl/EGLWrapper;->swapBuffers()Z

    nop

    goto/16 :goto_0

    :goto_6
    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    invoke-virtual {v1}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->unLock()V

    throw v0

    :goto_7
    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    invoke-virtual {v1}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->unLock()V

    throw v0

    :cond_3
    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->a:Z

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    iget-object v0, v0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->i:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->signalEndOfInputStream()V

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->drain()V

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    invoke-static {v0}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->d(Lcom/arcsoft/avatar/recoder/VideoEncoder;)V

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    invoke-static {v0}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->a(Lcom/arcsoft/avatar/recoder/VideoEncoder;)Lcom/arcsoft/avatar/gl/EGLWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arcsoft/avatar/gl/EGLWrapper;->makeUnCurrent()V

    return-void

    :catch_3
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    iget-object v1, v1, Lcom/arcsoft/avatar/recoder/VideoEncoder;->o:Lcom/arcsoft/avatar/recoder/RecordingListener;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;->a:Lcom/arcsoft/avatar/recoder/VideoEncoder;

    iget-object v1, v1, Lcom/arcsoft/avatar/recoder/VideoEncoder;->o:Lcom/arcsoft/avatar/recoder/RecordingListener;

    const/16 v2, 0x233

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Lcom/arcsoft/avatar/recoder/RecordingListener;->onRecordingListener(ILjava/lang/Object;)V

    :cond_4
    return-void
.end method
