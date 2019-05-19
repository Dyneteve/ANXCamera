.class public Lorg/a/a/d;
.super Ljava/lang/Object;
.source "BufferedAudioRecorder.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "BufferedAudioRecorder"

.field protected static channelConfigOffset:I

.field protected static channelConfigSuggested:[I

.field protected static sampleRateOffset:I

.field protected static sampleRateSuggested:[I


# instance fields
.field audio:Landroid/media/AudioRecord;

.field audioFormat:I

.field bufferSizeInBytes:I

.field channelConfig:I

.field isRecording:Z

.field sampleRateInHz:I

.field vQ:Lorg/a/a/c;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, -0x1

    sput v0, Lorg/a/a/d;->sampleRateOffset:I

    const/4 v1, 0x6

    new-array v1, v1, [I

    fill-array-data v1, :array_0

    sput-object v1, Lorg/a/a/d;->sampleRateSuggested:[I

    sput v0, Lorg/a/a/d;->channelConfigOffset:I

    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lorg/a/a/d;->channelConfigSuggested:[I

    return-void

    :array_0
    .array-data 4
        0xbb80
        0xac44
        0x1f40
        0x2b11
        0x3e80
        0x5622
    .end array-data

    :array_1
    .array-data 4
        0xc
        0x10
        0x1
    .end array-data
.end method

.method public constructor <init>(Lorg/a/a/c;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lorg/a/a/d;->sampleRateInHz:I

    const/4 v1, 0x0

    iput v1, p0, Lorg/a/a/d;->bufferSizeInBytes:I

    iput v0, p0, Lorg/a/a/d;->channelConfig:I

    const/4 v0, 0x2

    iput v0, p0, Lorg/a/a/d;->audioFormat:I

    iput-boolean v1, p0, Lorg/a/a/d;->isRecording:Z

    iput-object p1, p0, Lorg/a/a/d;->vQ:Lorg/a/a/c;

    const-string p1, "SM919"

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x3

    new-array p1, p1, [I

    fill-array-data p1, :array_0

    sput-object p1, Lorg/a/a/d;->channelConfigSuggested:[I

    :cond_0
    return-void

    nop

    :array_0
    .array-data 4
        0x10
        0xc
        0x1
    .end array-data
.end method


# virtual methods
.method public aa(I)I
    .locals 1

    const/16 v0, 0x10

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x2

    return p1
.end method

.method public d(D)V
    .locals 4

    const-string v0, "BufferedAudioRecorder"

    const-string v1, "audio startRecording"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/a/a/d;->isRecording:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/a/a/d;->isRecording:Z

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lorg/a/a/d;->vQ:Lorg/a/a/c;

    iget v1, p0, Lorg/a/a/d;->sampleRateInHz:I

    sget-object v2, Lorg/a/a/d;->channelConfigSuggested:[I

    sget v3, Lorg/a/a/d;->channelConfigOffset:I

    aget v2, v2, v3

    invoke-virtual {p0, v2}, Lorg/a/a/d;->aa(I)I

    move-result v2

    invoke-interface {v0, v1, v2, p1, p2}, Lorg/a/a/c;->initWavFile(IID)I

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "BufferedAudioRecorder"

    const-string p2, "init wav file failed"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    new-instance p1, Ljava/lang/Thread;

    new-instance p2, Lorg/a/a/d$1;

    invoke-direct {p2, p0}, Lorg/a/a/d$1;-><init>(Lorg/a/a/d;)V

    invoke-direct {p1, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void

    :cond_2
    :goto_0
    :try_start_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method protected finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    iget-object v0, p0, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, p0, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->getState()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V

    :cond_0
    iget-object v0, p0, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    :cond_1
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method public init(I)V
    .locals 20

    move-object/from16 v1, p0

    iget-object v0, v1, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    if-eqz v0, :cond_0

    const-string v0, "BufferedAudioRecorder"

    const-string v1, "second time audio init(), skip"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v2, -0x1

    :try_start_0
    sget v0, Lorg/a/a/d;->channelConfigOffset:I

    if-eq v0, v2, :cond_1

    sget v0, Lorg/a/a/d;->sampleRateOffset:I

    if-eq v0, v2, :cond_1

    sget-object v0, Lorg/a/a/d;->channelConfigSuggested:[I

    sget v3, Lorg/a/a/d;->channelConfigOffset:I

    aget v0, v0, v3

    iput v0, v1, Lorg/a/a/d;->channelConfig:I

    sget-object v0, Lorg/a/a/d;->sampleRateSuggested:[I

    sget v3, Lorg/a/a/d;->sampleRateOffset:I

    aget v0, v0, v3

    iput v0, v1, Lorg/a/a/d;->sampleRateInHz:I

    iget v0, v1, Lorg/a/a/d;->sampleRateInHz:I

    iget v3, v1, Lorg/a/a/d;->channelConfig:I

    iget v4, v1, Lorg/a/a/d;->audioFormat:I

    invoke-static {v0, v3, v4}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v0

    iput v0, v1, Lorg/a/a/d;->bufferSizeInBytes:I

    new-instance v0, Landroid/media/AudioRecord;

    iget v5, v1, Lorg/a/a/d;->sampleRateInHz:I

    iget v6, v1, Lorg/a/a/d;->channelConfig:I

    iget v7, v1, Lorg/a/a/d;->audioFormat:I

    iget v8, v1, Lorg/a/a/d;->bufferSizeInBytes:I

    move-object v3, v0

    move/from16 v4, p1

    invoke-direct/range {v3 .. v8}, Landroid/media/AudioRecord;-><init>(IIIII)V

    iput-object v0, v1, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    goto :goto_0

    :catch_0
    move-exception v0

    const-string v3, "BufferedAudioRecorder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u4f7f\u7528\u9884\u8bbe\u914d\u7f6e"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v5, Lorg/a/a/d;->channelConfigOffset:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v5, Lorg/a/a/d;->sampleRateOffset:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "\u5b9e\u4f8b\u5316audio recorder\u5931\u8d25\uff0c\u91cd\u65b0\u6d4b\u8bd5\u914d\u7f6e\u3002"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    iget-object v0, v1, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    if-nez v0, :cond_5

    nop

    sput v2, Lorg/a/a/d;->channelConfigOffset:I

    sget-object v3, Lorg/a/a/d;->channelConfigSuggested:[I

    array-length v4, v3

    const/4 v5, 0x0

    move v6, v5

    move v7, v6

    :goto_1
    if-ge v6, v4, :cond_5

    aget v0, v3, v6

    iput v0, v1, Lorg/a/a/d;->channelConfig:I

    sget v0, Lorg/a/a/d;->channelConfigOffset:I

    const/4 v8, 0x1

    add-int/2addr v0, v8

    sput v0, Lorg/a/a/d;->channelConfigOffset:I

    sput v2, Lorg/a/a/d;->sampleRateOffset:I

    sget-object v9, Lorg/a/a/d;->sampleRateSuggested:[I

    array-length v10, v9

    move v11, v5

    :goto_2
    if-ge v11, v10, :cond_3

    aget v12, v9, v11

    sget v0, Lorg/a/a/d;->sampleRateOffset:I

    add-int/2addr v0, v8

    sput v0, Lorg/a/a/d;->sampleRateOffset:I

    :try_start_1
    iget v0, v1, Lorg/a/a/d;->channelConfig:I

    iget v13, v1, Lorg/a/a/d;->audioFormat:I

    invoke-static {v12, v0, v13}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v0

    iput v0, v1, Lorg/a/a/d;->bufferSizeInBytes:I

    const-string v0, "BufferedAudioRecorder"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "\u8bd5\u7528hz "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, " "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v14, v1, Lorg/a/a/d;->channelConfig:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, " "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v14, v1, Lorg/a/a/d;->audioFormat:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v0, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, v1, Lorg/a/a/d;->bufferSizeInBytes:I

    if-lez v0, :cond_2

    iput v12, v1, Lorg/a/a/d;->sampleRateInHz:I

    new-instance v0, Landroid/media/AudioRecord;

    iget v15, v1, Lorg/a/a/d;->sampleRateInHz:I

    iget v14, v1, Lorg/a/a/d;->channelConfig:I

    iget v13, v1, Lorg/a/a/d;->audioFormat:I

    iget v2, v1, Lorg/a/a/d;->bufferSizeInBytes:I

    move/from16 v17, v13

    move-object v13, v0

    move/from16 v16, v14

    move/from16 v14, p1

    move/from16 v18, v2

    invoke-direct/range {v13 .. v18}, Landroid/media/AudioRecord;-><init>(IIIII)V

    iput-object v0, v1, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    nop

    nop

    move v7, v8

    goto :goto_4

    :cond_2
    sget v0, Lorg/a/a/d;->sampleRateOffset:I

    add-int/2addr v0, v8

    sput v0, Lorg/a/a/d;->sampleRateOffset:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    :catch_1
    move-exception v0

    iput v5, v1, Lorg/a/a/d;->sampleRateInHz:I

    const/4 v2, 0x0

    iput-object v2, v1, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    const-string v2, "BufferedAudioRecorder"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "apply audio record sample rate "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, " failed: "

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget v0, Lorg/a/a/d;->sampleRateOffset:I

    add-int/2addr v0, v8

    sput v0, Lorg/a/a/d;->sampleRateOffset:I

    nop

    :goto_3
    add-int/lit8 v11, v11, 0x1

    const/4 v2, -0x1

    goto/16 :goto_2

    :cond_3
    :goto_4
    if-eqz v7, :cond_4

    goto :goto_5

    :cond_4
    add-int/lit8 v6, v6, 0x1

    const/4 v2, -0x1

    goto/16 :goto_1

    :cond_5
    :goto_5
    iget v0, v1, Lorg/a/a/d;->sampleRateInHz:I

    if-gtz v0, :cond_6

    const-string v0, "BufferedAudioRecorder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "!Init audio recorder failed, hz "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v1, Lorg/a/a/d;->sampleRateInHz:I

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_6
    const-string v0, "BufferedAudioRecorder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Init audio recorder succeed, apply audio record sample rate "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v1, Lorg/a/a/d;->sampleRateInHz:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " buffer "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v1, Lorg/a/a/d;->bufferSizeInBytes:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " state "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v1}, Landroid/media/AudioRecord;->getState()I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public stopRecording()Z
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/a/a/d;->isRecording:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iput-boolean v1, p0, Lorg/a/a/d;->isRecording:Z

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->getState()I

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V

    :cond_1
    iget-object v0, p0, Lorg/a/a/d;->vQ:Lorg/a/a/c;

    invoke-interface {v0}, Lorg/a/a/c;->closeWavFile()I

    const/4 v0, 0x1

    return v0

    :cond_2
    :goto_0
    :try_start_1
    const-string v0, "BufferedAudioRecorder"

    const-string v2, "\u672a\u542f\u52a8\u97f3\u9891\u6a21\u5757\u4f46\u8c03\u7528stopRecording"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    :cond_3
    monitor-exit p0

    return v1

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public unInit()V
    .locals 2

    iget-object v0, p0, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, p0, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->getState()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V

    :cond_0
    iget-object v0, p0, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :goto_0
    iput-object v1, p0, Lorg/a/a/d;->audio:Landroid/media/AudioRecord;

    :cond_1
    iput-object v1, p0, Lorg/a/a/d;->vQ:Lorg/a/a/c;

    return-void
.end method
