.class Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;
.super Landroid/animation/AnimatorListenerAdapter;
.source "BubbleEditMimojiPresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->hideBubbleAni()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 5

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->access$600(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mLocationSelect:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v2, v2, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mLocationSelect:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    iget-object v4, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v4, v4, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->this$0:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    invoke-static {v4}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->access$700(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;)I

    move-result v4

    add-int/2addr v2, v4

    iget-object v4, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v4, v4, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->this$0:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    invoke-static {v4}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->access$300(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;)I

    move-result v4

    add-int/2addr v2, v4

    invoke-virtual {p1, v0, v2, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mIvDeleteFisrt:Landroid/widget/ImageView;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mIvDeleteFisrt:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->access$600(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mLocationSelect:[I

    const/4 v0, -0x1

    aput v0, p1, v1

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mLocationSelect:[I

    aput v0, p1, v3

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mLocationSelect:[I

    const/4 v2, 0x2

    aput v0, p1, v2

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->this$0:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    invoke-static {p1, v1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->access$102(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;Z)Z

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 4

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->access$600(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mLocationSelect:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    int-to-double v0, v0

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v2, v2, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->this$0:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    invoke-static {v2}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->access$500(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;)D

    move-result-wide v2

    add-double/2addr v0, v2

    double-to-int v0, v0

    iput v0, p1, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->access$600(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mLocationSelect:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v2, v2, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->this$0:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    invoke-static {v2}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->access$300(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;)I

    move-result v2

    add-int/2addr v0, v2

    iput v0, p1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mIvDeleteFisrt:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->access$600(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$4;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->this$0:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    invoke-static {p1, v1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->access$102(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;Z)Z

    return-void
.end method
