.class public Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;
.super Ljava/lang/Object;
.source "BubbleEditMimojiPresenter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;
    }
.end annotation


# static fields
.field private static final DELETE_PROCESS:I = 0x66

.field private static final EDIT_PROCESS:I = 0x65

.field private static final INVISIBLE_STATE:I = -0x1

.field private static final RESET_STATE:I = -0x2

.field private static final TAG:Ljava/lang/String; = "BubbleEditMimojiPresenter"

.field private static final VISIBLE_STATE:I = 0x1


# instance fields
.field bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

.field bubblePop2:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

.field mContext:Landroid/content/Context;

.field public mLocationSelect:[I


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/view/View$OnClickListener;Landroid/widget/RelativeLayout;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x3

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->mLocationSelect:[I

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->mContext:Landroid/content/Context;

    new-instance p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->mContext:Landroid/content/Context;

    invoke-direct {p1, p0, v0, p2, p3}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;-><init>(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;Landroid/content/Context;Landroid/view/View$OnClickListener;Landroid/widget/RelativeLayout;)V

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    new-instance p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->mContext:Landroid/content/Context;

    invoke-direct {p1, p0, v0, p2, p3}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;-><init>(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;Landroid/content/Context;Landroid/view/View$OnClickListener;Landroid/widget/RelativeLayout;)V

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop2:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    return-void
.end method


# virtual methods
.method public processBubbleAni(II)V
    .locals 4

    const/4 v0, -0x2

    const/16 v1, 0x67

    if-ne v0, p1, :cond_2

    if-ne v0, p2, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop2:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->getProcessState()I

    move-result v0

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop2:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop2:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v0, p2, p1, v2}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->processBubbleAni(III)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->getProcessState()I

    move-result v0

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop2:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, p2, p1, v1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->processBubbleAni(III)V

    :cond_1
    return-void

    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mLocationSelect:[I

    const/4 v2, 0x0

    aget v0, v0, v2

    const/4 v3, 0x1

    if-ne v0, p1, :cond_3

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mLocationSelect:[I

    aget v0, v0, v3

    if-ne v0, p2, :cond_3

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, p2, p1, v1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->processBubbleAni(III)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop2:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mLocationSelect:[I

    aget v0, v0, v2

    if-ne v0, p1, :cond_4

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop2:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mLocationSelect:[I

    aget v0, v0, v3

    if-ne v0, p2, :cond_4

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop2:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, p2, p1, v1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->processBubbleAni(III)V

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mLocationSelect:[I

    aget v0, v0, v2

    const/4 v2, -0x1

    if-ne v0, v2, :cond_5

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->mLocationSelect:[I

    aget v0, v0, v3

    if-ne v0, v2, :cond_5

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v0, p2, p1, v2}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->processBubbleAni(III)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop2:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->getProcessState()I

    move-result v0

    if-ne v0, v1, :cond_6

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop2:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop2:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, p2, p1, v1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->processBubbleAni(III)V

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, p2, p1, v1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->processBubbleAni(III)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop2:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop2:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, p2, p1, v1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->processBubbleAni(III)V

    :cond_6
    :goto_0
    return-void
.end method
