.class Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ZoomRatioToggleView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->moveTo(IIIZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

.field final synthetic val$actionType:I

.field final synthetic val$currZoomRatioView:Lcom/android/camera/ui/zoom/ZoomRatioView;

.field final synthetic val$fadeIn:Z

.field final synthetic val$nextZoomRatioView:Lcom/android/camera/ui/zoom/ZoomRatioView;


# direct methods
.method constructor <init>(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;Lcom/android/camera/ui/zoom/ZoomRatioView;ILcom/android/camera/ui/zoom/ZoomRatioView;Z)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    iput-object p2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->val$nextZoomRatioView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    iput p3, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->val$actionType:I

    iput-object p4, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->val$currZoomRatioView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    iput-boolean p5, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->val$fadeIn:Z

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    const-string p1, "ZoomRatioToggleView"

    const-string v0, "onAnimationEnd()"

    invoke-static {p1, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$200(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->val$currZoomRatioView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->val$currZoomRatioView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-virtual {p1}, Lcom/android/camera/ui/zoom/ZoomRatioView;->getZoomRatioIndex()I

    move-result p1

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->val$currZoomRatioView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-static {p1}, Lcom/android/camera/HybridZoomingSystem;->getOpticalZoomRatioAt(I)F

    move-result p1

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setZoomRatio(F)V

    :cond_0
    iget-boolean p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->val$fadeIn:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$1100(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$1200(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "ZoomRatioToggleView"

    const-string v0, "onAnimationEnd(): startFadeInAnimation"

    invoke-static {p1, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$200(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$1300(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)V

    :cond_1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 5

    const-string p1, "ZoomRatioToggleView"

    const-string v0, "onAnimationStart()"

    invoke-static {p1, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$200(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->val$nextZoomRatioView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->val$nextZoomRatioView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-virtual {p1}, Lcom/android/camera/ui/zoom/ZoomRatioView;->getZoomRatioIndex()I

    move-result p1

    iget v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->val$actionType:I

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    invoke-static {p1}, Lcom/android/camera/HybridZoomingSystem;->getOpticalZoomRatioAt(I)F

    move-result p1

    const-string v0, "ZoomRatioToggleView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onAnimationStart(): click, set zoom ratio to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$200(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->val$nextZoomRatioView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setZoomRatio(F)V

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->val$actionType:I

    if-ne p1, v1, :cond_1

    goto :goto_0

    :cond_1
    const-string p1, "ZoomRatioToggleView"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onAnimationStart(): others, set zoom ratio to "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {v3}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$000(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)F

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$200(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->val$nextZoomRatioView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$000(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setZoomRatio(F)V

    :goto_0
    iget p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->val$actionType:I

    if-eq p1, v2, :cond_2

    iget p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->val$actionType:I

    if-ne p1, v1, :cond_3

    :cond_2
    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$1000(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$1000(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;->val$nextZoomRatioView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-interface {p1, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;->onClick(Lcom/android/camera/ui/zoom/ZoomRatioView;)V

    :cond_3
    return-void
.end method
