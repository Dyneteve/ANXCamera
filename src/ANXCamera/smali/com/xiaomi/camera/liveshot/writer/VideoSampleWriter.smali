.class public Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;
.super Lcom/xiaomi/camera/liveshot/writer/SampleWriter;
.source "VideoSampleWriter.java"


# static fields
.field private static final DEBUG:Z = true

.field private static final MIN_DURATION:J = 0x7a120L

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final mMediaMuxer:Landroid/media/MediaMuxer;

.field private final mVideoFirstKeyFrameArrivedNotifier:Lcom/xiaomi/camera/liveshot/writer/SampleWriter$StatusNotifier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/xiaomi/camera/liveshot/writer/SampleWriter$StatusNotifier<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

.field private final mVideoTrackId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/media/MediaMuxer;Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;ILcom/xiaomi/camera/liveshot/writer/SampleWriter$StatusNotifier;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/media/MediaMuxer;",
            "Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;",
            "I",
            "Lcom/xiaomi/camera/liveshot/writer/SampleWriter$StatusNotifier<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/xiaomi/camera/liveshot/writer/SampleWriter;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mMediaMuxer:Landroid/media/MediaMuxer;

    iput-object p2, p0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iput p3, p0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoTrackId:I

    iput-object p4, p0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoFirstKeyFrameArrivedNotifier:Lcom/xiaomi/camera/liveshot/writer/SampleWriter$StatusNotifier;

    return-void
.end method


# virtual methods
.method protected writeSample()V
    .locals 29

    move-object/from16 v1, p0

    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    const-string v2, "writeVideoSamples: E"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v2, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->head:J

    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v4, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->tail:J

    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v6, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->time:J

    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget v8, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->filterId:I

    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "writeVideoSamples: head timestamp: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v10, v10, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->head:J

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v10, ":"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v0, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "writeVideoSamples: snap timestamp: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v10, v10, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->time:J

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v10, ":"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v10, v10, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->time:J

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v0, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "writeVideoSamples: tail timestamp: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v10, v10, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->tail:J

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v10, ":"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v0, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "writeVideoSamples: cur filterId: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget v10, v10, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->filterId:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ":"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v0, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    const-wide/16 v13, -0x1

    move-wide v9, v13

    const/4 v13, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    :goto_0
    if-nez v13, :cond_f

    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    const-string v12, "writeVideoSamples: take: E"

    invoke-static {v0, v12}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-object v0, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->samples:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    sget-object v12, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    const-string v11, "writeVideoSamples: take: X"

    invoke-static {v12, v11}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v0, :cond_0

    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    const-string v2, "sample null return"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_9

    :cond_0
    iget-object v11, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;->data:Ljava/nio/ByteBuffer;

    iget-object v12, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;->info:Landroid/media/MediaCodec$BufferInfo;

    iget-object v0, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;->livePhotoResult:Lcom/xiaomi/camera/liveshot/LivePhotoResult;

    move/from16 v20, v13

    sget-object v13, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    move-object/from16 v21, v11

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    move-wide/from16 v22, v4

    const-string v4, "writeVideoSamples: livePhotoResult "

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v13, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v4, v12, Landroid/media/MediaCodec$BufferInfo;->flags:I

    const/4 v5, 0x1

    and-int/2addr v4, v5

    if-nez v4, :cond_1

    if-nez v16, :cond_1

    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "writeVideoSamples: drop non-key frame sample timestamp: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v11, v12, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v4, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    nop

    :goto_1
    move-wide/from16 v26, v6

    goto/16 :goto_7

    :cond_1
    iget-wide v4, v12, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    sub-long v4, v6, v4

    const-wide/32 v24, 0x7a120

    cmp-long v4, v4, v24

    if-ltz v4, :cond_5

    if-nez v17, :cond_5

    if-nez v18, :cond_3

    invoke-static {v0, v8}, Lcom/android/camera/Util;->isLivePhotoStable(Lcom/xiaomi/camera/liveshot/LivePhotoResult;I)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "writeVideoSamples: drop not stable: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v11, v12, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v4, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_2
    nop

    nop

    sget-object v4, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "writeVideoSamples: drop first stable: "

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v11, v12, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v5, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    nop

    move/from16 v18, v0

    :goto_2
    move/from16 v13, v20

    move-wide/from16 v4, v22

    const/16 v17, 0x0

    goto/16 :goto_0

    :cond_3
    if-nez v17, :cond_5

    invoke-static {v0, v8}, Lcom/android/camera/Util;->isLivePhotoStable(Lcom/xiaomi/camera/liveshot/LivePhotoResult;I)Z

    move-result v18

    if-nez v18, :cond_4

    nop

    nop

    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "writeVideoSamples: drop second stable: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v11, v12, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v4, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_4
    nop

    nop

    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "writeVideoSamples: drop first and second stable: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v11, v12, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v4, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    nop

    move/from16 v13, v20

    move-wide/from16 v4, v22

    const/16 v17, 0x1

    const/16 v18, 0x1

    goto/16 :goto_0

    :cond_5
    iget-wide v4, v12, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    sub-long/2addr v4, v6

    cmp-long v4, v4, v24

    if-lez v4, :cond_7

    invoke-static {v0, v8}, Lcom/android/camera/Util;->isLivePhotoStable(Lcom/xiaomi/camera/liveshot/LivePhotoResult;I)Z

    move-result v0

    const/4 v4, 0x1

    xor-int/2addr v0, v4

    if-eqz v0, :cond_6

    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "writeVideoSamples: drop not stable 2: "

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-wide/from16 v26, v6

    iget-wide v6, v12, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    nop

    move/from16 v19, v4

    goto :goto_3

    :cond_6
    move-wide/from16 v26, v6

    goto :goto_3

    :cond_7
    move-wide/from16 v26, v6

    const/4 v4, 0x1

    :goto_3
    iget-wide v5, v12, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    cmp-long v0, v5, v2

    const/4 v5, 0x4

    if-ltz v0, :cond_c

    iget-wide v6, v12, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    sub-long/2addr v6, v14

    cmp-long v0, v9, v6

    if-gez v0, :cond_c

    if-nez v16, :cond_9

    nop

    iget-wide v14, v12, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-object v6, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v6, v6, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->head:J

    sub-long v6, v14, v6

    iput-wide v6, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->offset:J

    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoFirstKeyFrameArrivedNotifier:Lcom/xiaomi/camera/liveshot/writer/SampleWriter$StatusNotifier;

    if-eqz v0, :cond_8

    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoFirstKeyFrameArrivedNotifier:Lcom/xiaomi/camera/liveshot/writer/SampleWriter$StatusNotifier;

    iget-object v6, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v6, v6, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->offset:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/xiaomi/camera/liveshot/writer/SampleWriter$StatusNotifier;->notify(Ljava/lang/Object;)V

    :cond_8
    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "writeVideoSamples: first video sample timestamp: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move/from16 v16, v4

    :cond_9
    iget-wide v6, v12, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    cmp-long v0, v6, v22

    if-gez v0, :cond_a

    if-eqz v19, :cond_b

    :cond_a
    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    const-string v6, "writeVideoSamples: stop writing as reaching the ending timestamp"

    invoke-static {v0, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput v5, v12, Landroid/media/MediaCodec$BufferInfo;->flags:I

    :cond_b
    iget-wide v6, v12, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    sub-long/2addr v6, v14

    iput-wide v6, v12, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mMediaMuxer:Landroid/media/MediaMuxer;

    iget v6, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoTrackId:I

    move-object/from16 v7, v21

    invoke-virtual {v0, v6, v7, v12}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    iget-wide v9, v12, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "writeVideoSamples: video sample timestamp: "

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v4, v12, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    add-long/2addr v4, v14

    invoke-virtual {v6, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    :cond_c
    move-object/from16 v7, v21

    :goto_4
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    if-eqz v0, :cond_e

    iget v0, v12, Landroid/media/MediaCodec$BufferInfo;->flags:I

    const/4 v4, 0x4

    and-int/2addr v0, v4

    if-eqz v0, :cond_d

    goto :goto_5

    :cond_d
    const/4 v13, 0x0

    goto :goto_6

    :cond_e
    :goto_5
    nop

    const/4 v13, 0x1

    :goto_6
    goto :goto_8

    :catch_0
    move-exception v0

    move-wide/from16 v22, v4

    move-wide/from16 v26, v6

    move/from16 v20, v13

    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    const-string v4, "writeVideoSamples: take: meet interrupted exception"

    invoke-static {v0, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    nop

    :goto_7
    move/from16 v13, v20

    :goto_8
    move-wide/from16 v4, v22

    move-wide/from16 v6, v26

    goto/16 :goto_0

    :cond_f
    :goto_9
    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-object v2, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v2, v2, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->time:J

    sub-long/2addr v2, v14

    const-wide/16 v4, 0x0

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->time:J

    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "writeVideoSamples: cover frame timestamp: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v3, v3, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->time:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "writeVideoSamples: X: duration: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "writeVideoSamples: X: offset: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lcom/xiaomi/camera/liveshot/writer/VideoSampleWriter;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v3, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->offset:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
