.class public Lcom/android/camera/ui/ColorActivateTextView;
.super Landroid/widget/TextView;
.source "ColorActivateTextView.java"


# instance fields
.field private mActivateColor:I

.field private mNormalCor:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/ui/ColorActivateTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/camera/ui/ColorActivateTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public setActivateColor(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/ColorActivateTextView;->mActivateColor:I

    return-void
.end method

.method public setActivated(Z)V
    .locals 1

    if-eqz p1, :cond_0

    iget v0, p0, Lcom/android/camera/ui/ColorActivateTextView;->mActivateColor:I

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/android/camera/ui/ColorActivateTextView;->mNormalCor:I

    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/camera/ui/ColorActivateTextView;->setTextColor(I)V

    invoke-super {p0, p1}, Landroid/widget/TextView;->setActivated(Z)V

    return-void
.end method

.method public setNormalCor(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/ColorActivateTextView;->mNormalCor:I

    return-void
.end method
