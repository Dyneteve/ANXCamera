.class Lcom/android/camera/module/Camera2Module$DBRunnable;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/Camera2Module;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DBRunnable"
.end annotation


# instance fields
.field mData:Lcom/xiaomi/camera/core/ParallelTaskData;

.field mImageSaver:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera/storage/ImageSaver;",
            ">;"
        }
    .end annotation
.end field

.field mInsertMediaStore:Z


# direct methods
.method public constructor <init>(Lcom/xiaomi/camera/core/ParallelTaskData;ZLcom/android/camera/storage/ImageSaver;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$DBRunnable;->mData:Lcom/xiaomi/camera/core/ParallelTaskData;

    iput-boolean p2, p0, Lcom/android/camera/module/Camera2Module$DBRunnable;->mInsertMediaStore:Z

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$DBRunnable;->mImageSaver:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    invoke-static {}, Lcom/android/camera/db/DbRepository;->dbItemSaveTask()Lcom/android/camera/db/item/DbItemSaveTask;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$DBRunnable;->mData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getSavePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/db/item/DbItemSaveTask;->getItemByPath(Ljava/lang/String;)Lcom/android/camera/db/element/SaveTask;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/db/DbRepository;->dbItemSaveTask()Lcom/android/camera/db/item/DbItemSaveTask;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/db/item/DbItemSaveTask;->generateItem(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/db/element/SaveTask;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$DBRunnable;->mData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getSavePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/db/element/SaveTask;->setPath(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/camera/db/DbRepository;->dbItemSaveTask()Lcom/android/camera/db/item/DbItemSaveTask;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v0, v2, v3}, Lcom/android/camera/db/item/DbItemSaveTask;->endItemAndInsert(Ljava/lang/Object;J)J

    invoke-static {}, Lcom/android/camera/module/Camera2Module;->access$300()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "endItemAndInsert end getSavePath:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$DBRunnable;->mData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v2}, Lcom/xiaomi/camera/core/ParallelTaskData;->getSavePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module$DBRunnable;->mInsertMediaStore:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$DBRunnable;->mImageSaver:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$DBRunnable;->mImageSaver:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/storage/ImageSaver;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$DBRunnable;->mData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v0, v1}, Lcom/android/camera/storage/ImageSaver;->onParallelProcessFinish(Lcom/xiaomi/camera/core/ParallelTaskData;)Z

    :cond_1
    return-void
.end method
