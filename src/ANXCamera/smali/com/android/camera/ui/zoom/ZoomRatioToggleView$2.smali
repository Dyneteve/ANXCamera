.class Lcom/android/camera/ui/zoom/ZoomRatioToggleView$2;
.super Ljava/lang/Object;
.source "ZoomRatioToggleView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->startLongPressCheck()V
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

    iput-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$2;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$2;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$600(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$2;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    iget-object v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$2;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$700(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)I

    move-result v1

    iget-object v2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$2;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$800(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$900(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;II)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$2;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {v1, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$1000(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;I)V

    :cond_0
    return-void
.end method
