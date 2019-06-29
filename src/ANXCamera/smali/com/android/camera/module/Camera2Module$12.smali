.class Lcom/android/camera/module/Camera2Module$12;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Lcom/android/camera/LocalParallelService$ServiceStatusListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/Camera2Module;->beginParallelProcess(Lcom/xiaomi/camera/core/ParallelTaskData;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;


# direct methods
.method constructor <init>(Lcom/android/camera/module/Camera2Module;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$12;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onImagePostProcessStart(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 1

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getAlgoType()I

    move-result p1

    const/4 v0, 0x4

    if-eq v0, p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$12;->this$0:Lcom/android/camera/module/Camera2Module;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/module/Camera2Module;->onPictureTakenFinished(Z)V

    invoke-static {v0}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackPictureCapture(I)V

    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$12;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p1, p1, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$12;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p1, p1, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1}, Lcom/android/camera2/Camera2Proxy;->onParallelImagePostProcStart()V

    :cond_0
    return-void
.end method
