.class public Lcom/arcsoft/avatar/recoder/VideoEncoder;
.super Lcom/arcsoft/avatar/recoder/BaseEncoder;
.source "VideoEncoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/arcsoft/avatar/recoder/VideoEncoder$SaveThread;
    }
.end annotation


# static fields
.field private static E:Ljava/lang/String; = null

.field public static final ENCODER_THREAD_NAME:Ljava/lang/String; = "Arc_Video_Encoder"

.field public static final NAME:Ljava/lang/String; = "ARC_V"

.field private static final u:Ljava/lang/String; = "Arc_VideoEncoder"

.field private static final v:J = 0x3b9aca00L

.field private static final w:I = 0x989680

.field private static final x:I = 0x1e

.field private static final y:I = 0xa


# instance fields
.field private A:I

.field private B:I

.field private C:Z

.field private D:I

.field private F:Landroid/view/Surface;

.field private G:Ljava/lang/Thread;

.field private H:Lcom/arcsoft/avatar/gl/EGLWrapper;

.field private I:Landroid/opengl/EGLContext;

.field private J:Lcom/arcsoft/avatar/gl/GLRender;

.field private K:I

.field protected t:J

.field private z:Landroid/media/MediaFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "video/hevc"

    sput-object v0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->E:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/arcsoft/avatar/recoder/MuxerWrapper;IILjava/lang/Object;Lcom/arcsoft/avatar/recoder/RecordingListener;Landroid/opengl/EGLContext;ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p4, p5}, Lcom/arcsoft/avatar/recoder/BaseEncoder;-><init>(Lcom/arcsoft/avatar/recoder/MuxerWrapper;Ljava/lang/Object;Lcom/arcsoft/avatar/recoder/RecordingListener;)V

    sget-object p1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object p1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->I:Landroid/opengl/EGLContext;

    iput p2, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->A:I

    iput p3, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->B:I

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->G:Ljava/lang/Thread;

    iput p7, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->K:I

    iput-object p6, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->I:Landroid/opengl/EGLContext;

    sput-object p8, Lcom/arcsoft/avatar/recoder/VideoEncoder;->E:Ljava/lang/String;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->prepare(Z)V

    invoke-direct {p0}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->b()V

    new-instance p1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {p1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object p1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->q:Ljava/util/concurrent/locks/Lock;

    iget-object p1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->q:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object p1

    iput-object p1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->r:Ljava/util/concurrent/locks/Condition;

    const-string p1, "Arc_VideoEncoder"

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "VideoEncoder constructor mCustomerBitRate = "

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p5, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->K:I

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p1, p4}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "Arc_VideoEncoder"

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "VideoEncoder constructor mWidth = "

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " ,mHeight = "

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic a(Lcom/arcsoft/avatar/recoder/VideoEncoder;)Lcom/arcsoft/avatar/gl/EGLWrapper;
    .locals 0

    iget-object p0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->H:Lcom/arcsoft/avatar/gl/EGLWrapper;

    return-object p0
.end method

.method private a(Z)V
    .locals 6

    const-string v0, "Arc_VideoEncoder"

    const-string v1, "initVideoEncoder()->in"

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->E:Ljava/lang/String;

    iget v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->A:I

    iget v2, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->B:I

    invoke-static {v0, v1, v2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v0

    iput-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->z:Landroid/media/MediaFormat;

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->z:Landroid/media/MediaFormat;

    const-string v1, "color-format"

    const v2, 0x7f000789

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->z:Landroid/media/MediaFormat;

    const-string v1, "bitrate"

    iget v2, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->K:I

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->z:Landroid/media/MediaFormat;

    const-string v1, "frame-rate"

    const/16 v2, 0x1e

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->z:Landroid/media/MediaFormat;

    const-string v1, "i-frame-interval"

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const/4 v0, 0x0

    :try_start_0
    sget-object v1, Lcom/arcsoft/avatar/recoder/VideoEncoder;->E:Ljava/lang/String;

    invoke-static {v1}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v1

    iput-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->i:Landroid/media/MediaCodec;

    const-string v1, "Arc_VideoEncoder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "initVideoEncoder(): selected_codec_name = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->i:Landroid/media/MediaCodec;

    invoke-virtual {v3}, Landroid/media/MediaCodec;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/arcsoft/avatar/util/CodecLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "Arc_VideoEncoder"

    const-string v3, "initVideoEncoder()->createEncoderByType failed."

    invoke-static {v2, v3}, Lcom/arcsoft/avatar/util/CodecLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->o:Lcom/arcsoft/avatar/recoder/RecordingListener;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->o:Lcom/arcsoft/avatar/recoder/RecordingListener;

    const/16 v2, 0x231

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/arcsoft/avatar/recoder/RecordingListener;->onRecordingListener(ILjava/lang/Object;)V

    :cond_0
    :goto_0
    const/16 v1, 0x232

    const/4 v2, 0x0

    :try_start_1
    iget-object v3, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->i:Landroid/media/MediaCodec;

    iget-object v4, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->z:Landroid/media/MediaFormat;

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v2, v2, v5}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v3

    const-string v4, "Arc_VideoEncoder"

    const-string v5, "initVideoEncoder()->configure failed."

    invoke-static {v4, v5}, Lcom/arcsoft/avatar/util/CodecLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    iget-object v3, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->o:Lcom/arcsoft/avatar/recoder/RecordingListener;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->o:Lcom/arcsoft/avatar/recoder/RecordingListener;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v1, v4}, Lcom/arcsoft/avatar/recoder/RecordingListener;->onRecordingListener(ILjava/lang/Object;)V

    :cond_1
    :goto_1
    if-eqz p1, :cond_2

    :try_start_2
    iget-object p1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->i:Landroid/media/MediaCodec;

    invoke-virtual {p1}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    move-result-object p1

    iput-object p1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->F:Landroid/view/Surface;

    goto :goto_2

    :catch_2
    move-exception p1

    goto :goto_3

    :cond_2
    iput-object v2, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->F:Landroid/view/Surface;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :goto_2
    goto :goto_4

    :goto_3
    nop

    const-string v2, "Arc_VideoEncoder"

    const-string v3, "initVideoEncoder()->createInputSurface failed."

    invoke-static {v2, v3}, Lcom/arcsoft/avatar/util/CodecLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    iget-object p1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->o:Lcom/arcsoft/avatar/recoder/RecordingListener;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->o:Lcom/arcsoft/avatar/recoder/RecordingListener;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v1, v0}, Lcom/arcsoft/avatar/recoder/RecordingListener;->onRecordingListener(ILjava/lang/Object;)V

    :cond_3
    :goto_4
    const-string p1, "Arc_VideoEncoder"

    const-string v0, "initVideoEncoder()->out"

    invoke-static {p1, v0}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private b()V
    .locals 3

    invoke-virtual {p0}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->getInputSurface()Landroid/view/Surface;

    move-result-object v0

    new-instance v1, Lcom/arcsoft/avatar/gl/EGLWrapper;

    iget-object v2, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->I:Landroid/opengl/EGLContext;

    invoke-direct {v1, v0, v2}, Lcom/arcsoft/avatar/gl/EGLWrapper;-><init>(Landroid/view/Surface;Landroid/opengl/EGLContext;)V

    iput-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->H:Lcom/arcsoft/avatar/gl/EGLWrapper;

    return-void
.end method

.method static synthetic b(Lcom/arcsoft/avatar/recoder/VideoEncoder;)V
    .locals 0

    invoke-direct {p0}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->c()V

    return-void
.end method

.method static synthetic c(Lcom/arcsoft/avatar/recoder/VideoEncoder;)Lcom/arcsoft/avatar/gl/GLRender;
    .locals 0

    iget-object p0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->J:Lcom/arcsoft/avatar/gl/GLRender;

    return-object p0
.end method

.method private c()V
    .locals 5

    new-instance v0, Lcom/arcsoft/avatar/gl/GLRender;

    iget v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->A:I

    iget v2, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->B:I

    iget v3, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->D:I

    const/4 v4, 0x1

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/arcsoft/avatar/gl/GLRender;-><init>(IIIZ)V

    iput-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->J:Lcom/arcsoft/avatar/gl/GLRender;

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->J:Lcom/arcsoft/avatar/gl/GLRender;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/arcsoft/avatar/gl/GLRender;->initRender(Z)V

    const-string v0, "Arc_VideoEncoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "VideoEncoder initGL glError = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private d()V
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->J:Lcom/arcsoft/avatar/gl/GLRender;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/gl/GLRender;->unInitRender()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->J:Lcom/arcsoft/avatar/gl/GLRender;

    return-void
.end method

.method static synthetic d(Lcom/arcsoft/avatar/recoder/VideoEncoder;)V
    .locals 0

    invoke-direct {p0}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->d()V

    return-void
.end method

.method static synthetic e(Lcom/arcsoft/avatar/recoder/VideoEncoder;)I
    .locals 0

    iget p0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->A:I

    return p0
.end method

.method private e()V
    .locals 8

    iget v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->A:I

    iget v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->B:I

    mul-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    iget v3, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->A:I

    iget v4, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->B:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/16 v5, 0x1908

    const/16 v6, 0x1401

    move-object v7, v0

    invoke-static/range {v1 .. v7}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    new-instance v1, Lcom/arcsoft/avatar/recoder/VideoEncoder$SaveThread;

    invoke-direct {v1, p0, v0}, Lcom/arcsoft/avatar/recoder/VideoEncoder$SaveThread;-><init>(Lcom/arcsoft/avatar/recoder/VideoEncoder;Ljava/nio/ByteBuffer;)V

    invoke-virtual {v1}, Lcom/arcsoft/avatar/recoder/VideoEncoder$SaveThread;->start()V

    return-void
.end method

.method static synthetic f(Lcom/arcsoft/avatar/recoder/VideoEncoder;)I
    .locals 0

    iget p0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->B:I

    return p0
.end method


# virtual methods
.method public getInputSurface()Landroid/view/Surface;
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->i:Landroid/media/MediaCodec;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->F:Landroid/view/Surface;

    return-object v0

    :cond_0
    invoke-super {p0}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->getInputSurface()Landroid/view/Surface;

    move-result-object v0

    return-object v0
.end method

.method public notifyNewFrameAvailable()V
    .locals 0

    return-void
.end method

.method public pauseRecording()V
    .locals 2

    iget-boolean v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->e:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->e:Z

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->t:J

    :cond_0
    return-void
.end method

.method public prepare(Z)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->a(Z)V

    iget-object p1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->i:Landroid/media/MediaCodec;

    if-eqz p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Init video encoder is failed."

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public release(Z)V
    .locals 5

    const-string v0, "Arc_Video_Encoder"

    :try_start_0
    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->q:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    invoke-virtual {p0}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->sinalCondition()V

    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->q:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_5

    :catch_0
    move-exception v1

    :try_start_1
    const-string v2, "Arc_VideoEncoder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "release()-> meet error when get lock : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/arcsoft/avatar/util/CodecLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :goto_1
    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->G:Ljava/lang/Thread;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    :try_start_2
    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->G:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->join()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :goto_2
    iput-object v2, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->G:Ljava/lang/Thread;

    goto :goto_4

    :catchall_1
    move-exception p1

    goto :goto_3

    :catch_1
    move-exception v1

    :try_start_3
    const-string v3, "Arc_VideoEncoder"

    const-string v4, "Encoder Thread has been Interrupted, errors may be occurred."

    invoke-static {v3, v4}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :goto_3
    iput-object v2, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->G:Ljava/lang/Thread;

    throw p1

    :cond_0
    :goto_4
    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->H:Lcom/arcsoft/avatar/gl/EGLWrapper;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->H:Lcom/arcsoft/avatar/gl/EGLWrapper;

    invoke-virtual {v1}, Lcom/arcsoft/avatar/gl/EGLWrapper;->release()V

    iput-object v2, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->H:Lcom/arcsoft/avatar/gl/EGLWrapper;

    :cond_1
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->I:Landroid/opengl/EGLContext;

    const-string v1, "Arc_VideoEncoder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "VideoEncoder release() encoder thread exit. threadName ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->F:Landroid/view/Surface;

    iput-object v2, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->q:Ljava/util/concurrent/locks/Lock;

    iput-object v2, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->r:Ljava/util/concurrent/locks/Condition;

    iput-object v2, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->s:Lcom/arcsoft/avatar/recoder/FrameQueue;

    invoke-super {p0, p1}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->release(Z)V

    return-void

    :goto_5
    invoke-virtual {p0}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->sinalCondition()V

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->q:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public resumeRecording()V
    .locals 6

    iget-boolean v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->e:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->e:Z

    iget-wide v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->g:J

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->t:J

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->g:J

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->n:Ljava/util/Queue;

    iget-wide v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->g:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public startRecording()V
    .locals 2

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->G:Ljava/lang/Thread;

    if-nez v0, :cond_0

    invoke-super {p0}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->startRecording()V

    new-instance v0, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;

    const-string v1, "Arc_Video_Encoder"

    invoke-direct {v0, p0, v1}, Lcom/arcsoft/avatar/recoder/VideoEncoder$1;-><init>(Lcom/arcsoft/avatar/recoder/VideoEncoder;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->G:Ljava/lang/Thread;

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->G:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    const-string v0, "Arc_VideoEncoder"

    const-string v1, "VideoEncoder is started."

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/util/CodecLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const-string v0, "Arc_VideoEncoder"

    const-string v1, "startRecording()-> Video encoder thread has been started already, can not start twice."

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/util/CodecLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Video encoder thread has been started already, can not start twice."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public stopRecording()V
    .locals 4

    invoke-super {p0}, Lcom/arcsoft/avatar/recoder/BaseEncoder;->stopRecording()V

    :try_start_0
    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->q:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    invoke-virtual {p0}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->sinalCondition()V

    iget-object v0, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->q:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_0
    move-exception v0

    :try_start_1
    const-string v1, "Arc_VideoEncoder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "stopRecording()-> meet error when get lock : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/arcsoft/avatar/util/CodecLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :goto_1
    return-void

    :goto_2
    invoke-virtual {p0}, Lcom/arcsoft/avatar/recoder/VideoEncoder;->sinalCondition()V

    iget-object v1, p0, Lcom/arcsoft/avatar/recoder/VideoEncoder;->q:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method
