.class public Lcom/android/camera/storage/ImageSaverThread;
.super Ljava/lang/Thread;
.source "ImageSaverThread.java"


# instance fields
.field private final mQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/camera/storage/SaveRequest;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mQuit:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/concurrent/BlockingQueue;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/camera/storage/SaveRequest;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    iput-object p2, p0, Lcom/android/camera/storage/ImageSaverThread;->mQueue:Ljava/util/concurrent/BlockingQueue;

    return-void
.end method


# virtual methods
.method public quit()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/storage/ImageSaverThread;->mQuit:Z

    iget-object v0, p0, Lcom/android/camera/storage/ImageSaverThread;->mQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaverThread;->interrupt()V

    :cond_0
    return-void
.end method

.method public run()V
    .locals 1

    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaverThread;->mQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/storage/SaveRequest;

    invoke-interface {v0}, Lcom/android/camera/storage/SaveRequest;->save()V

    invoke-interface {v0}, Lcom/android/camera/storage/SaveRequest;->onFinish()V

    iget-boolean v0, p0, Lcom/android/camera/storage/ImageSaverThread;->mQuit:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaverThread;->interrupt()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    iget-boolean v0, p0, Lcom/android/camera/storage/ImageSaverThread;->mQuit:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/storage/ImageSaverThread;->mQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->clear()V

    :cond_0
    :goto_1
    goto :goto_0
.end method
