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
.field private static final INVISIBLE_STATE:I = -0x1

.field public static final RESET_STATE:I = -0x2

.field private static final TAG:Ljava/lang/String; = "BubbleEditMimojiPresenter"

.field private static final VISIBLE_STATE:I = 0x1


# instance fields
.field bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

.field private downMove:I

.field private leftMove:D

.field mContext:Landroid/content/Context;

.field private mHashCodeBubble:I

.field public mShowBubbleState:[I

.field public mTargetView:Landroid/view/View;

.field private rightMove:D

.field private topMove:I


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/view/View$OnClickListener;Landroid/widget/RelativeLayout;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x3

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->mShowBubbleState:[I

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->mHashCodeBubble:I

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->mContext:Landroid/content/Context;

    new-instance p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->mContext:Landroid/content/Context;

    invoke-direct {p1, p0, v0, p2, p3}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;-><init>(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;Landroid/content/Context;Landroid/view/View$OnClickListener;Landroid/widget/RelativeLayout;)V

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    const-string p1, "BubbleEditMimojiPresenter"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "bubblePop1 hashCode:"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-virtual {p3}, Ljava/lang/Object;->hashCode()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;)D
    .locals 2

    iget-wide v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->leftMove:D

    return-wide v0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->topMove:I

    return p0
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;)D
    .locals 2

    iget-wide v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->rightMove:D

    return-wide v0
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->downMove:I

    return p0
.end method


# virtual methods
.method public processBubbleAni(IILandroid/view/View;)V
    .locals 5

    const/4 v0, -0x2

    if-ne v0, p1, :cond_1

    if-ne v0, p2, :cond_1

    iget-object p3, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-virtual {p3}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->getProcessState()I

    move-result p3

    const/16 v0, 0x67

    if-ne p3, v0, :cond_0

    iget-object p3, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-virtual {p3, p1, p2, v0}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->processBubbleAni(III)V

    :cond_0
    return-void

    :cond_1
    iput-object p3, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->mTargetView:Landroid/view/View;

    iget-object p3, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->mTargetView:Landroid/view/View;

    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result p3

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a017f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    int-to-double v1, v0

    const-wide/high16 v3, 0x3fe8000000000000L    # 0.75

    mul-double/2addr v1, v3

    iput-wide v1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->rightMove:D

    iget-wide v1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->rightMove:D

    neg-double v1, v1

    iput-wide v1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->leftMove:D

    neg-int p3, p3

    div-int/lit8 p3, p3, 0x2

    sub-int/2addr p3, v0

    iput p3, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->topMove:I

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->downMove:I

    const-string p3, "BubbleEditMimojiPresenter"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "calculate vector leftMove:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->leftMove:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, " rightMove:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->rightMove:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, "  topMove:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->topMove:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "  downMove:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->downMove:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p3, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->bubblePop1:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-virtual {p3, p1, p2, v0}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter$BubblePop;->processBubbleAni(III)V

    return-void
.end method

.method public setmHashCodeBubble(I)V
    .locals 3

    iput p1, p0, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->mHashCodeBubble:I

    const-string v0, "BubbleEditMimojiPresenter"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u5728show\u7684BubbleHashCode:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
