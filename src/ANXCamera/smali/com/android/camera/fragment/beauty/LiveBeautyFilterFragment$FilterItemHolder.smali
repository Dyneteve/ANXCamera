.class public abstract Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "LiveBeautyFilterFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x404
    name = "FilterItemHolder"
.end annotation


# instance fields
.field protected mEffectIndex:I

.field protected mTextView:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemHolder;->this$0:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;

    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const p1, 0x7f0d001b

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemHolder;->mTextView:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public bindEffectIndex(ILcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;)V
    .locals 0

    iput p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemHolder;->mEffectIndex:I

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemHolder;->mTextView:Landroid/widget/TextView;

    iget-object p2, p2, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;->name:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
