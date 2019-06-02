.class Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;
.super Ljava/lang/Object;
.source "ImageSaver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/storage/ImageSaver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ThumbnailUpdater"
.end annotation


# instance fields
.field private mNeedAnimation:Z

.field final synthetic this$0:Lcom/android/camera/storage/ImageSaver;


# direct methods
.method public constructor <init>(Lcom/android/camera/storage/ImageSaver;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;->this$0:Lcom/android/camera/storage/ImageSaver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;->mNeedAnimation:Z

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;->this$0:Lcom/android/camera/storage/ImageSaver;

    invoke-static {v0}, Lcom/android/camera/storage/ImageSaver;->access$000(Lcom/android/camera/storage/ImageSaver;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/storage/ImageSaver$ImageSaverCallback;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/storage/ImageSaver$ImageSaverCallback;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;->this$0:Lcom/android/camera/storage/ImageSaver;

    iget-boolean v1, p0, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;->mNeedAnimation:Z

    invoke-static {v0, v1}, Lcom/android/camera/storage/ImageSaver;->access$100(Lcom/android/camera/storage/ImageSaver;Z)V

    return-void
.end method

.method public setNeedAnimation(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;->mNeedAnimation:Z

    return-void
.end method
