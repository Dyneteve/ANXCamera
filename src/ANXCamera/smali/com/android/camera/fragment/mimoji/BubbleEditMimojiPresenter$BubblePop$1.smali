.class Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "BubbleEditMimojiPresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->showBubbleAni(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

.field final synthetic val$targetLeftCoordinate:I

.field final synthetic val$targetTopCoordinate:I


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;II)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iput p2, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->val$targetTopCoordinate:I

    iput p3, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->val$targetLeftCoordinate:I

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 6

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->access$200(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mLocationSelect:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    int-to-double v2, v0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->this$0:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->access$000(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;)D

    move-result-wide v4

    add-double/2addr v2, v4

    double-to-int v0, v2

    iput v0, p1, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->access$200(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mLocationSelect:[I

    const/4 v2, 0x1

    aget v0, v0, v2

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v2, v2, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->this$0:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    invoke-static {v2}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->access$100(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;)I

    move-result v2

    add-int/2addr v0, v2

    iput v0, p1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mIvEditFirst:Landroid/widget/ImageView;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->access$200(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object p1

    iget v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->val$targetTopCoordinate:I

    iput v0, p1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->access$200(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object p1

    iget v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->val$targetLeftCoordinate:I

    iput v0, p1, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mIvEditFirst:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->access$200(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mIvEditFirst:Landroid/widget/ImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void
.end method
