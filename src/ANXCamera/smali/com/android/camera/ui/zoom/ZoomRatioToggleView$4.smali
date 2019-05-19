.class Lcom/android/camera/ui/zoom/ZoomRatioToggleView$4;
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

    iput-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$4;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    const-string v0, "ZoomRatioToggleView"

    const-string v1, "mInactiveTask: run..."

    invoke-static {v0, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$200(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$4;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    iget-object v4, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$4;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {v4, v3}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/android/camera/ui/zoom/ZoomRatioView;

    iget-object v5, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$4;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {v5}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$1400(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)I

    move-result v5

    const/4 v6, 0x2

    if-eq v3, v5, :cond_0

    invoke-virtual {v4}, Lcom/android/camera/ui/zoom/ZoomRatioView;->getIconView()Landroid/widget/ImageView;

    move-result-object v5

    sget-object v7, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v6, v6, [F

    invoke-virtual {v4}, Lcom/android/camera/ui/zoom/ZoomRatioView;->getAlpha()F

    move-result v4

    aput v4, v6, v2

    const v4, 0x3f19999a    # 0.6f

    const/4 v8, 0x1

    aput v4, v6, v8

    invoke-static {v5, v7, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_0
    invoke-virtual {v4}, Lcom/android/camera/ui/zoom/ZoomRatioView;->getIconView()Landroid/widget/ImageView;

    move-result-object v4

    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v6, v6, [F

    fill-array-data v6, :array_0

    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$4;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$1500(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)Landroid/animation/AnimatorSet;

    move-result-object v1

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->removeAllListeners()V

    iget-object v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$4;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$1500(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)Landroid/animation/AnimatorSet;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$4;->this$0:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->access$1500(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)Landroid/animation/AnimatorSet;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    return-void

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method
