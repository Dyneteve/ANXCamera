.class Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder$1;
.super Ljava/lang/Object;
.source "TEBufferedAudioRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->startRecording(Ljava/lang/String;DII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;


# direct methods
.method constructor <init>(Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder$1;->this$0:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    iget-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder$1;->this$0:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    iget v0, v0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->bufferSizeInBytes:I

    new-array v0, v0, [B

    nop

    :try_start_0
    iget-object v1, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder$1;->this$0:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    iget-object v1, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder$1;->this$0:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    iget-object v1, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v1}, Landroid/media/AudioRecord;->startRecording()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    nop

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    iget-object v3, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder$1;->this$0:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    iget-boolean v3, v3, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->isRecording:Z

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder$1;->this$0:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    iget-object v3, v3, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    if-eqz v3, :cond_0

    iget-object v2, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder$1;->this$0:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    iget-object v2, v2, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    iget-object v3, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder$1;->this$0:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    iget v3, v3, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->bufferSizeInBytes:I

    invoke-virtual {v2, v0, v1, v3}, Landroid/media/AudioRecord;->read([BII)I

    move-result v2

    :cond_0
    const/4 v3, -0x3

    if-eq v3, v2, :cond_3

    if-lez v2, :cond_2

    :try_start_1
    iget-object v3, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder$1;->this$0:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    iget-boolean v3, v3, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->isRecording:Z

    if-nez v3, :cond_1

    goto :goto_0

    :cond_1
    iget-object v3, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder$1;->this$0:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    iget-object v3, v3, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audioCaller:Lcom/ss/android/ttve/audio/TEAudioWriterInterface;

    invoke-interface {v3, v0, v2}, Lcom/ss/android/ttve/audio/TEAudioWriterInterface;->addPCMData([BI)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v3

    :goto_1
    goto :goto_0

    :cond_2
    const-wide/16 v3, 0x32

    :try_start_2
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :goto_2
    goto :goto_0

    :catch_1
    move-exception v3

    goto :goto_2

    :cond_3
    const-string v3, "TEBufferedAudioRecorder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "bad audio buffer len "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_4
    return-void

    :cond_5
    return-void

    :catch_2
    move-exception v0

    :try_start_3
    iget-object v1, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder$1;->this$0:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    iget-object v1, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder$1;->this$0:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    iget-object v1, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v1}, Landroid/media/AudioRecord;->release()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    :cond_6
    goto :goto_3

    :catch_3
    move-exception v1

    :goto_3
    iget-object v1, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder$1;->this$0:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    const/4 v2, 0x0

    iput-object v2, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    const-string v1, "TEBufferedAudioRecorder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "audio recording failed!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
