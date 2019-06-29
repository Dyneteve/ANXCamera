.class Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;
.super Lcom/android/camera/ui/zoom/ScaleGestureDetector$SimpleOnScaleGestureListener;
.source "V6GestureRecognizer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/V6GestureRecognizer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyScaleListener"
.end annotation


# instance fields
.field private mZoomScaled:Z

.field final synthetic this$0:Lcom/android/camera/ui/V6GestureRecognizer;


# direct methods
.method private constructor <init>(Lcom/android/camera/ui/V6GestureRecognizer;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ScaleGestureDetector$SimpleOnScaleGestureListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/ui/V6GestureRecognizer;Lcom/android/camera/ui/V6GestureRecognizer$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;-><init>(Lcom/android/camera/ui/V6GestureRecognizer;)V

    return-void
.end method


# virtual methods
.method public onScale(Lcom/android/camera/ui/zoom/ScaleGestureDetector;)Z
    .locals 3

    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v0}, Lcom/android/camera/ui/V6GestureRecognizer;->access$1300(Lcom/android/camera/ui/V6GestureRecognizer;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v0, v1}, Lcom/android/camera/ui/V6GestureRecognizer;->access$600(Lcom/android/camera/ui/V6GestureRecognizer;Z)Z

    move-result v0

    const/16 v2, 0x9

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6GestureRecognizer;->getCurrentGesture()I

    move-result v0

    if-ne v0, v2, :cond_1

    goto :goto_0

    :cond_1
    return v1

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/V6GestureRecognizer;->setGesture(I)V

    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v0}, Lcom/android/camera/ui/V6GestureRecognizer;->access$700(Lcom/android/camera/ui/V6GestureRecognizer;)Lcom/android/camera/module/Module;

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->getFocusX()F

    move-result v1

    invoke-virtual {p1}, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->getFocusY()F

    move-result v2

    invoke-virtual {p1}, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->getScaleFactor()F

    move-result p1

    invoke-interface {v0, v1, v2, p1}, Lcom/android/camera/module/Module;->onScale(FFF)Z

    move-result p1

    iget-boolean v0, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->mZoomScaled:Z

    if-nez v0, :cond_3

    iput-boolean p1, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->mZoomScaled:Z

    :cond_3
    return p1
.end method

.method public onScaleBegin(Lcom/android/camera/ui/zoom/ScaleGestureDetector;)Z
    .locals 2

    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v0}, Lcom/android/camera/ui/V6GestureRecognizer;->access$1300(Lcom/android/camera/ui/V6GestureRecognizer;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v0}, Lcom/android/camera/ui/V6GestureRecognizer;->access$700(Lcom/android/camera/ui/V6GestureRecognizer;)Lcom/android/camera/module/Module;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isIgnoreTouchEvent()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iput-boolean v1, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->mZoomScaled:Z

    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v0}, Lcom/android/camera/ui/V6GestureRecognizer;->access$700(Lcom/android/camera/ui/V6GestureRecognizer;)Lcom/android/camera/module/Module;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/HybridZoomingSystem;->setZoomingSourceIdentity(I)V

    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v0}, Lcom/android/camera/ui/V6GestureRecognizer;->access$700(Lcom/android/camera/ui/V6GestureRecognizer;)Lcom/android/camera/module/Module;

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->getFocusX()F

    move-result v1

    invoke-virtual {p1}, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->getFocusY()F

    move-result p1

    invoke-interface {v0, v1, p1}, Lcom/android/camera/module/Module;->onScaleBegin(FF)Z

    move-result p1

    return p1

    :cond_1
    :goto_0
    return v1
.end method

.method public onScaleEnd(Lcom/android/camera/ui/zoom/ScaleGestureDetector;)V
    .locals 0

    iget-boolean p1, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->mZoomScaled:Z

    if-eqz p1, :cond_0

    const-string/jumbo p1, "\u624b\u52bf"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackZoomAdjusted(Ljava/lang/String;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->mZoomScaled:Z

    :cond_0
    iget-object p1, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {p1}, Lcom/android/camera/ui/V6GestureRecognizer;->access$1300(Lcom/android/camera/ui/V6GestureRecognizer;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {p1}, Lcom/android/camera/ui/V6GestureRecognizer;->access$700(Lcom/android/camera/ui/V6GestureRecognizer;)Lcom/android/camera/module/Module;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/module/Module;->onScaleEnd()V

    :cond_1
    return-void
.end method
