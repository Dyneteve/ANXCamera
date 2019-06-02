.class Lcom/android/camera/ui/zoom/ZoomRatioToggleView$1;
.super Ljava/lang/Object;
.source "ZoomRatioToggleView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/zoom/ZoomRatioToggleView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;


# direct methods
.method constructor <init>(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$1;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$1;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$000(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)F

    move-result v0

    invoke-static {v0}, Lcom/android/camera/HybridZoomingSystem;->getOpticalZoomRatioIndex(F)I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$1;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$100(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "ZoomRatioToggleView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "postpone index updater again: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$200(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$1;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$300(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_0
    const-string v1, "ZoomRatioToggleView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "run index updater: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$200(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$1;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$400(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;IZ)V

    :goto_0
    return-void
.end method
