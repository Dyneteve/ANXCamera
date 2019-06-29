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
    .locals 1

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mIvEditFirst:Landroid/widget/ImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->this$0:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    invoke-static {p1, v0}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->access$002(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;Z)Z

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->access$400(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object p1

    iget v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->val$targetTopCoordinate:I

    iput v0, p1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->access$400(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object p1

    iget v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->val$targetLeftCoordinate:I

    iput v0, p1, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mIvEditFirst:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->access$400(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mIvEditFirst:Landroid/widget/ImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop$1;->this$1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->this$0:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->access$002(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;Z)Z

    return-void
.end method
