.class public Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;
.super Ljava/lang/Object;
.source "TEMediaCodecDecoder.java"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation

.annotation build Landroid/support/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;
    }
.end annotation


# static fields
.field private static final ERROR_EOF:I = -0x1

.field private static final ERROR_FAIL:I = -0x2

.field private static final ERROR_OK:I = 0x0

.field private static final ERROR_UNUSUAL:I = -0x3

.field private static final TAG:Ljava/lang/String; = "MediaCodecDecoder"

.field private static final VIDEO_MIME_TYPE:Ljava/lang/String; = "video/avc"

.field private static final m_verbose:Z = false


# instance fields
.field private final MAX_DELAY_COUNT:I

.field private final MAX_SLEEP_MS:J

.field private m_bIsNeedReconfigure:Z

.field private m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private m_decoder:Landroid/media/MediaCodec;

.field private m_decoderStarted:Z

.field private m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

.field private m_extraDataBuf:Ljava/nio/ByteBuffer;

.field private m_format:Landroid/media/MediaFormat;

.field private m_frameAvailable:Z

.field private final m_frameSyncObject:Ljava/lang/Object;

.field private m_iCurCount:I

.field private m_iHeight:I

.field private m_iWidth:I

.field private m_inputBufferQueued:Z

.field private m_pendingInputFrameCount:I

.field private m_ppsBuf:Ljava/nio/ByteBuffer;

.field private m_sawInputEOS:Z

.field private m_sawOutputEOS:Z

.field private m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

.field private m_spsBuf:Ljava/nio/ByteBuffer;

.field private m_surface:Landroid/view/Surface;

.field private m_surfaceTexID:[I

.field private m_surfaceTexture:Landroid/graphics/SurfaceTexture;

.field private m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

.field private m_textureRender:Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

.field private m_timestampOfCurTexFrame:J

.field private m_timestampOfLastDecodedFrame:J


# direct methods
.method public constructor <init>()V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iWidth:I

    iput v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iHeight:I

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_extraDataBuf:Ljava/nio/ByteBuffer;

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_spsBuf:Ljava/nio/ByteBuffer;

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_ppsBuf:Ljava/nio/ByteBuffer;

    iput-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bIsNeedReconfigure:Z

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_format:Landroid/media/MediaFormat;

    const/4 v2, 0x1

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surface:Landroid/view/Surface;

    new-instance v2, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v2}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    iput-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoderStarted:Z

    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameSyncObject:Ljava/lang/Object;

    iput-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameAvailable:Z

    const-wide/high16 v2, -0x8000000000000000L

    iput-wide v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfLastDecodedFrame:J

    iput-wide v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfCurTexFrame:J

    iput-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_inputBufferQueued:Z

    iput v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_pendingInputFrameCount:I

    iput-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawInputEOS:Z

    iput-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawOutputEOS:Z

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureRender:Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->MAX_SLEEP_MS:J

    const/16 v1, 0xa

    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->MAX_DELAY_COUNT:I

    iput v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iCurCount:I

    return-void
.end method

.method private AwaitNewImage()Z
    .locals 6

    nop

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameSyncObject:Ljava/lang/Object;

    monitor-enter v0

    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameAvailable:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v2, 0x0

    if-nez v1, :cond_1

    :try_start_1
    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameSyncObject:Ljava/lang/Object;

    const-wide/16 v3, 0x1f4

    invoke-virtual {v1, v3, v4}, Ljava/lang/Object;->wait(J)V

    iget-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameAvailable:Z

    if-nez v1, :cond_0

    const-string v1, "MediaCodecDecoder"

    const-string v3, "Frame wait timed out!"

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    monitor-exit v0

    return v2

    :cond_0
    goto :goto_0

    :catch_0
    move-exception v1

    const-string v3, "MediaCodecDecoder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    monitor-exit v0

    return v2

    :cond_1
    iput-boolean v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameAvailable:Z

    monitor-exit v0

    const/4 v0, 0x1

    return v0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method private DecodeFrame2Surface([BIJ)I
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v1, p0

    move/from16 v5, p2

    nop

    nop

    nop

    nop

    iget-boolean v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawInputEOS:Z

    const/4 v9, 0x0

    const/4 v10, 0x1

    if-nez v0, :cond_4

    iget-object v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    const-wide/16 v2, 0x7530

    invoke-virtual {v0, v2, v3}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v0

    nop

    move v4, v9

    :cond_0
    if-gez v0, :cond_1

    const-wide/16 v6, 0x5

    :try_start_0
    invoke-static {v6, v7, v9}, Ljava/lang/Thread;->sleep(JI)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    move-object v6, v0

    invoke-virtual {v6}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_0
    iget-object v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0, v2, v3}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v0

    add-int/2addr v4, v10

    const/16 v6, 0x14

    if-lt v4, v6, :cond_0

    const-string v2, "MediaCodecDecoder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "try dequeueInputBuffer timeout -- "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    nop

    :cond_1
    move v12, v0

    if-ltz v12, :cond_3

    invoke-direct {v1, v12}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->getInputBufferByIdx(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    if-nez v5, :cond_2

    iget-object v11, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const-wide/16 v15, 0x0

    const/16 v17, 0x4

    invoke-virtual/range {v11 .. v17}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    iput-boolean v10, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawInputEOS:Z

    goto :goto_1

    :cond_2
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    move-object/from16 v2, p1

    invoke-virtual {v0, v2, v9, v5}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    iget-object v2, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    const/4 v4, 0x0

    const/4 v8, 0x0

    move v3, v12

    move-wide/from16 v6, p3

    invoke-virtual/range {v2 .. v8}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    iput-boolean v10, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_inputBufferQueued:Z

    iget v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_pendingInputFrameCount:I

    add-int/2addr v0, v10

    iput v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_pendingInputFrameCount:I

    :goto_1
    goto :goto_2

    :cond_3
    nop

    const-string v0, "MediaCodecDecoder"

    const-string v2, "Input buffer not available"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v10

    goto :goto_3

    :cond_4
    :goto_2
    move v0, v9

    :goto_3
    iget-boolean v2, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawOutputEOS:Z

    if-eqz v2, :cond_5

    const v2, 0x927c0

    goto :goto_4

    :cond_5
    iget v2, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_pendingInputFrameCount:I

    const/4 v3, 0x2

    if-le v2, v3, :cond_6

    const/16 v2, 0x7530

    goto :goto_4

    :cond_6
    nop

    move v2, v9

    :goto_4
    iget-object v3, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    iget-object v4, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    int-to-long v5, v2

    invoke-virtual {v3, v4, v5, v6}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v3

    const/4 v4, -0x3

    if-ne v3, v4, :cond_7

    goto :goto_4

    :cond_7
    const/4 v5, -0x2

    if-ne v3, v5, :cond_8

    iget-object v3, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v3}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    goto :goto_4

    :cond_8
    const/4 v2, -0x1

    if-ne v3, v2, :cond_a

    if-eqz v0, :cond_9

    return v4

    :cond_9
    return v5

    :cond_a
    if-gez v3, :cond_b

    const-string v0, "MediaCodecDecoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected result from decoder.dequeueOutputBuffer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v5

    :cond_b
    iget-object v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_c

    iput-boolean v10, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawOutputEOS:Z

    :cond_c
    nop

    iget-boolean v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawOutputEOS:Z

    if-nez v0, :cond_d

    iget-object v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v6, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iput-wide v6, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfLastDecodedFrame:J

    iget v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_pendingInputFrameCount:I

    sub-int/2addr v0, v10

    iput v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_pendingInputFrameCount:I

    goto :goto_5

    :cond_d
    move v10, v9

    :goto_5
    iget-object v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0, v3, v10}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    if-eqz v10, :cond_10

    invoke-direct/range {p0 .. p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->AwaitNewImage()Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v2, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iput-wide v2, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfCurTexFrame:J

    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v0

    if-nez v0, :cond_e

    return v9

    :cond_e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ": glError "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "MediaCodecDecoder"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ": glError "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_f
    const-string v0, "MediaCodecDecoder"

    const-string v1, "Render decoded frame to surface texture failed!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v5

    :cond_10
    return v2
.end method

.method public static IsInAndriodHardwareBlacklist()Z
    .locals 4

    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v2, "Meizu"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x1

    if-nez v2, :cond_0

    const-string v2, "m2"

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_0

    return v3

    :cond_0
    const-string v2, "Xiaomi"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "MI 4W"

    invoke-virtual {v1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    return v3

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public static IsInAndriodHardwareWhitelist()Z
    .locals 4

    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v2, "samsung"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x1

    if-nez v2, :cond_0

    const-string v2, "GT-I9152"

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_0

    return v3

    :cond_0
    const-string v2, "HUAWEI"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "HUAWEI P6-C00"

    invoke-virtual {v1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    return v3

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private IsValid()Z
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private SetupDecoder(Ljava/lang/String;)Z
    .locals 4

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p1}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_format:Landroid/media/MediaFormat;

    iget-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surface:Landroid/view/Surface;

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {p1}, Landroid/media/MediaCodec;->start()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoderStarted:Z

    iput v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iCurCount:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    nop

    return p1

    :catch_0
    move-exception p1

    const-string v1, "MediaCodecDecoder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    invoke-virtual {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->CleanupDecoder()V

    return v0
.end method

.method private createTexture()I
    .locals 4

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    aget v0, v0, v1

    if-gtz v0, :cond_0

    const-string v0, "MediaCodecDecoder"

    const-string v2, "createTexture failed"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    aget v0, v0, v1

    const v2, 0x8d65

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/16 v0, 0x2801

    const/high16 v3, 0x46180000    # 9728.0f

    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v0, 0x2800

    const v3, 0x46180400    # 9729.0f

    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v0, 0x2802

    const v3, 0x812f

    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v0, 0x2803

    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    aget v0, v0, v1

    return v0
.end method

.method private deleteTexture()V
    .locals 3

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iget-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    aput v1, v0, v1

    :cond_0
    return-void
.end method

.method private getInputBufferByIdx(I)Ljava/nio/ByteBuffer;
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0, p1}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    aget-object p1, v0, p1

    return-object p1
.end method

.method private reconfigureMediaFormat()I
    .locals 4

    nop

    const/4 v0, 0x0

    :try_start_0
    const-string v1, "video/avc"

    iget v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iWidth:I

    iget v3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iHeight:I

    invoke-static {v1, v2, v3}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v1

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_format:Landroid/media/MediaFormat;

    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_spsBuf:Ljava/nio/ByteBuffer;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_format:Landroid/media/MediaFormat;

    const-string v2, "csd-0"

    iget-object v3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_spsBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v2, v3}, Landroid/media/MediaFormat;->setByteBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    :cond_0
    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_ppsBuf:Ljava/nio/ByteBuffer;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_format:Landroid/media/MediaFormat;

    const-string v2, "csd-1"

    iget-object v3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_ppsBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v2, v3}, Landroid/media/MediaFormat;->setByteBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    :cond_1
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-ne v1, v2, :cond_2

    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_format:Landroid/media/MediaFormat;

    const-string v2, "max-input-size"

    invoke-virtual {v1, v2, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    nop

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method private restartDecoder()I
    .locals 1

    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->stopDecoder()I

    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->startDecoder()I

    move-result v0

    return v0
.end method

.method private startDecoder()I
    .locals 6

    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->IsValid()Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    const-string v0, "MediaCodecDecoder"

    const-string v2, "You can\'t call startDecoder() twice!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    const/4 v2, 0x0

    aget v0, v0, v2

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->createTexture()I

    move-result v0

    :cond_1
    if-nez v0, :cond_2

    return v1

    :cond_2
    :try_start_0
    new-instance v3, Landroid/graphics/SurfaceTexture;

    invoke-direct {v3, v0}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    iput-object v3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    const-string v3, "MediaCodecDecoder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Surface texture with texture (id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ") has been created."

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    new-instance v0, Landroid/view/Surface;

    iget-object v3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-direct {v0, v3}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surface:Landroid/view/Surface;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    nop

    new-instance v0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

    iget-object v3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-direct {v0, v3}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureRender:Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureRender:Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

    invoke-virtual {v0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->surfaceCreated()V

    const-string v0, "video/avc"

    invoke-direct {p0, v0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->SetupDecoder(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->stopDecoder()I

    return v1

    :cond_3
    return v2

    :catch_0
    move-exception v0

    const-string v2, "MediaCodecDecoder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->stopDecoder()I

    return v1
.end method

.method private stopDecoder()I
    .locals 2

    invoke-virtual {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->CleanupDecoder()V

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureRender:Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureRender:Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

    invoke-virtual {v0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->release()V

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureRender:Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surface:Landroid/view/Surface;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surface:Landroid/view/Surface;

    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    :cond_2
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public CleanupDecoder()V
    .locals 5

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoderStarted:Z

    if-eqz v0, :cond_1

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_inputBufferQueued:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->flush()V

    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_inputBufferQueued:Z

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v2, "MediaCodecDecoder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoderStarted:Z

    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    :cond_2
    const-wide/high16 v2, -0x8000000000000000L

    iput-wide v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfLastDecodedFrame:J

    iput-wide v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfCurTexFrame:J

    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_pendingInputFrameCount:I

    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawInputEOS:Z

    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawOutputEOS:Z

    return-void
.end method

.method public closeEncoder()I
    .locals 1

    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->stopDecoder()I

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TETextureDrawer;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    :cond_0
    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->deleteTexture()V

    const/4 v0, 0x0

    return v0
.end method

.method public decodeFrame([BIJI)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    if-nez v0, :cond_0

    new-instance v0, Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-direct {v0}, Lcom/ss/android/ttve/common/TEEglStateSaver;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TEEglStateSaver;->saveEGLState()V

    :cond_0
    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-virtual {v1}, Lcom/ss/android/ttve/common/TEEglStateSaver;->getSavedEGLContext()Landroid/opengl/EGLContext;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/opengl/EGLContext;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    const-string v0, "MediaCodecDecoder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "eglGetCurrentContext = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " getSavedEGLContext = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-virtual {v3}, Lcom/ss/android/ttve/common/TEEglStateSaver;->getSavedEGLContext()Landroid/opengl/EGLContext;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bIsNeedReconfigure:Z

    :cond_1
    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bIsNeedReconfigure:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->restartDecoder()I

    iput-boolean v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bIsNeedReconfigure:Z

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TEEglStateSaver;->saveEGLState()V

    :cond_2
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    if-nez v0, :cond_3

    const/4 p1, -0x2

    return p1

    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->DecodeFrame2Surface([BIJ)I

    move-result p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    sub-long/2addr p2, v3

    const-wide/16 v3, 0x0

    sub-long p2, v3, p2

    iget p4, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iCurCount:I

    const/16 v0, 0xa

    if-ge p4, v0, :cond_4

    cmp-long p4, p2, v3

    if-lez p4, :cond_4

    :try_start_0
    invoke-static {p2, p3, v2}, Ljava/lang/Thread;->sleep(JI)V

    const-string p4, "MediaCodecDecoder"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Sleep "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p2, "ms for delay output!!!"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p4, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    invoke-virtual {p2}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_0
    iget p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iCurCount:I

    add-int/2addr p2, v1

    iput p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iCurCount:I

    :cond_4
    if-nez p1, :cond_5

    iget-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {p2}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    iget-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureRender:Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

    if-eqz p2, :cond_5

    if-lez p5, :cond_5

    iget-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureRender:Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

    iget p3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iWidth:I

    iget p4, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iHeight:I

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    aget v0, v0, v2

    invoke-virtual {p2, p3, p4, v0, p5}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->drawFrame(IIII)V

    :cond_5
    return p1
.end method

.method public flushDecoder()I
    .locals 3

    nop

    const-string v0, "MediaCodecDecoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "flushDecoder m_decoder = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    const/4 v1, -0x3

    if-eqz v0, :cond_4

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawInputEOS:Z

    const/4 v2, 0x0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawOutputEOS:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_inputBufferQueued:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->flush()V

    iput-boolean v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_inputBufferQueued:Z

    iput v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_pendingInputFrameCount:I

    goto :goto_1

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->CleanupDecoder()V

    const-string v0, "video/avc"

    invoke-direct {p0, v0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->SetupDecoder(Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v0, :cond_2

    const/4 v0, -0x2

    move v1, v0

    goto :goto_2

    :cond_2
    nop

    :goto_1
    move v1, v2

    :cond_3
    :goto_2
    goto :goto_3

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_4
    :goto_3
    return v1
.end method

.method public getInfoByFlag([II)I
    .locals 8

    nop

    const/16 v0, 0x20

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const-wide/16 v4, -0x1

    if-ne p2, v2, :cond_0

    iget-wide v6, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfLastDecodedFrame:J

    and-long/2addr v6, v4

    long-to-int p2, v6

    aput p2, p1, v3

    iget-wide v6, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfLastDecodedFrame:J

    shr-long/2addr v6, v0

    and-long v3, v6, v4

    long-to-int p2, v3

    aput p2, p1, v2

    goto :goto_0

    :cond_0
    if-ne p2, v1, :cond_1

    iget-wide v6, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfCurTexFrame:J

    and-long/2addr v6, v4

    long-to-int p2, v6

    aput p2, p1, v3

    iget-wide v6, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfCurTexFrame:J

    shr-long/2addr v6, v0

    and-long v3, v6, v4

    long-to-int p2, v3

    aput p2, p1, v2

    goto :goto_0

    :cond_1
    move v1, v3

    :goto_0
    return v1
.end method

.method public initDecoder(II[BI[BI)I
    .locals 3

    const-string v0, "MediaCodecDecoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "width = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " height = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual/range {p0 .. p6}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->setEncoder(II[BI[BI)I

    move-result p1

    iget-boolean p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bIsNeedReconfigure:Z

    if-eqz p2, :cond_0

    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->reconfigureMediaFormat()I

    move-result p1

    :cond_0
    iget-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    if-nez p2, :cond_1

    new-instance p2, Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-direct {p2}, Lcom/ss/android/ttve/common/TEEglStateSaver;-><init>()V

    iput-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    iget-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-virtual {p2}, Lcom/ss/android/ttve/common/TEEglStateSaver;->saveEGLState()V

    :cond_1
    iget-boolean p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bIsNeedReconfigure:Z

    if-eqz p2, :cond_2

    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->restartDecoder()I

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bIsNeedReconfigure:Z

    :cond_2
    return p1
.end method

.method public initTextureDrawer()Z
    .locals 3

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TETextureDrawer;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    :cond_0
    invoke-static {}, Lcom/ss/android/ttve/common/TETextureDrawer;->create()Lcom/ss/android/ttve/common/TETextureDrawer;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/common/TETextureDrawer;->setRotation(F)V

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v2, -0x40800000    # -1.0f

    invoke-virtual {v0, v1, v2}, Lcom/ss/android/ttve/common/TETextureDrawer;->setFlipScale(FF)V

    const/4 v0, 0x1

    return v0
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 2

    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameSyncObject:Ljava/lang/Object;

    monitor-enter p1

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameAvailable:Z

    if-eqz v0, :cond_0

    const-string v0, "MediaCodecDecoder"

    const-string v1, "m_frameAvailable already set, frame could be dropped!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameAvailable:Z

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameSyncObject:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit p1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setEncoder(II[BI[BI)I
    .locals 0

    iput p1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iWidth:I

    iput p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iHeight:I

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_spsBuf:Ljava/nio/ByteBuffer;

    iput-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_ppsBuf:Ljava/nio/ByteBuffer;

    const/4 p1, 0x0

    if-lez p4, :cond_0

    invoke-static {p3, p1, p4}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object p2

    iput-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_spsBuf:Ljava/nio/ByteBuffer;

    :cond_0
    if-lez p6, :cond_1

    invoke-static {p5, p1, p6}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object p2

    iput-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_ppsBuf:Ljava/nio/ByteBuffer;

    :cond_1
    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bIsNeedReconfigure:Z

    return p1
.end method
