.class Lcom/android/camera/Camera$8;
.super Ljava/lang/Object;
.source "Camera.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/Camera;->showFirstUseHintIfNeeded()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/Camera;


# direct methods
.method constructor <init>(Lcom/android/camera/Camera;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/Camera$8;->this$0:Lcom/android/camera/Camera;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/Camera$8;->this$0:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera$8;->this$0:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/ScreenHint;->showFirstUseHint()V

    iget-object v0, p0, Lcom/android/camera/Camera$8;->this$0:Lcom/android/camera/Camera;

    iget-object v0, v0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/Camera$8;->this$0:Lcom/android/camera/Camera;

    iget-object v0, v0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraRootView;->enableTouchEvent()V

    :cond_1
    return-void
.end method
