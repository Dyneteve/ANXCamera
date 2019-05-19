.class public Lcom/android/camera/fragment/mimoji/MeatureViewHeightWeight;
.super Ljava/lang/Object;
.source "MeatureViewHeightWeight.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setGridViewHeightBasedOnChildren(Landroid/content/Context;Landroid/widget/GridView;I)V
    .locals 2

    invoke-virtual {p1}, Landroid/widget/GridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v0, "window"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/WindowManager;

    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    nop

    invoke-virtual {p1}, Landroid/widget/GridView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    nop

    rem-int/lit8 v1, p2, 0x3

    if-eqz v1, :cond_1

    div-int/lit8 p2, p2, 0x3

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    div-int/lit8 p2, p2, 0x3

    :goto_0
    const/16 v1, 0x110

    mul-int/2addr v1, p2

    iput v1, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget p2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iput p2, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {p1, p0}, Landroid/widget/GridView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
