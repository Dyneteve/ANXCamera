.class public Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;
.super Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemHolder;
.source "LiveBeautyFilterFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "FilterStillItemHolder"
.end annotation


# instance fields
.field private mImageView:Lcom/android/camera/ui/RoundImageView;

.field private mSelectedInnerIndicator:Landroid/widget/ImageView;

.field private mSelectedOuterIndicator:Landroid/widget/ImageView;

.field final synthetic this$0:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->this$0:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemHolder;-><init>(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;Landroid/view/View;)V

    const p1, 0x7f0d001a

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/RoundImageView;

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->mImageView:Lcom/android/camera/ui/RoundImageView;

    const p1, 0x7f0d001c

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->mSelectedOuterIndicator:Landroid/widget/ImageView;

    const p1, 0x7f0d00f0

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->mSelectedInnerIndicator:Landroid/widget/ImageView;

    return-void
.end method

.method private normalAnim(Landroid/view/View;)V
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v0, 0x1f4

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->this$0:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->access$400(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)Lmiui/view/animation/CubicEaseOutInterpolator;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    new-instance v0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder$2;-><init>(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;)V

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    return-void
.end method

.method private selectAnim(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->mSelectedOuterIndicator:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v0, 0x1f4

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->this$0:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->access$400(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)Lmiui/view/animation/CubicEaseOutInterpolator;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    new-instance v0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder$3;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder$3;-><init>(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;)V

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    return-void
.end method


# virtual methods
.method public bindEffectIndex(ILcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;)V
    .locals 3

    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemHolder;->bindEffectIndex(ILcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;)V

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->mImageView:Lcom/android/camera/ui/RoundImageView;

    iget-object p2, p2, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;->imageViewRes:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p2}, Lcom/android/camera/ui/RoundImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p2, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->this$0:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;

    invoke-static {p2}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->access$200(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)I

    move-result p2

    const/4 v0, 0x0

    if-ne p1, p2, :cond_3

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->itemView:Landroid/view/View;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/view/View;->setActivated(Z)V

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-static {}, Lcom/android/camera/Util;->isSetContentDesc()Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->itemView:Landroid/view/View;

    new-instance p2, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder$1;

    invoke-direct {p2, p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder$1;-><init>(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;)V

    const-wide/16 v1, 0x64

    invoke-virtual {p1, p2, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->this$0:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;

    invoke-static {p1}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->access$000(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->mSelectedOuterIndicator:Landroid/widget/ImageView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->selectAnim(Landroid/view/View;)V

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->mSelectedInnerIndicator:Landroid/widget/ImageView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->selectAnim(Landroid/view/View;)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->mSelectedOuterIndicator:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->mSelectedOuterIndicator:Landroid/widget/ImageView;

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setAlpha(F)V

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->mSelectedInnerIndicator:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->mSelectedInnerIndicator:Landroid/widget/ImageView;

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setAlpha(F)V

    goto :goto_0

    :cond_3
    iget-object p2, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2, v0}, Landroid/view/View;->setActivated(Z)V

    iget-object p2, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->this$0:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;

    invoke-static {p2}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->access$000(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)Z

    move-result p2

    if-eqz p2, :cond_4

    iget-object p2, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->this$0:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;

    invoke-static {p2}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->access$300(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)I

    move-result p2

    if-ne p1, p2, :cond_4

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->mSelectedOuterIndicator:Landroid/widget/ImageView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->normalAnim(Landroid/view/View;)V

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->mSelectedInnerIndicator:Landroid/widget/ImageView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->normalAnim(Landroid/view/View;)V

    goto :goto_0

    :cond_4
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->mSelectedOuterIndicator:Landroid/widget/ImageView;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->mSelectedOuterIndicator:Landroid/widget/ImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setAlpha(F)V

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->mSelectedInnerIndicator:Landroid/widget/ImageView;

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;->mSelectedInnerIndicator:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setAlpha(F)V

    :goto_0
    return-void
.end method
