.class public Lcom/ss/android/ttve/utils/UIUtils;
.super Ljava/lang/Object;
.source "UIUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;,
        Lcom/ss/android/ttve/utils/UIUtils$ToastHook;
    }
.end annotation


# static fields
.field public static final API_ET_20:Z

.field private static DPI:I = 0x0

.field public static final ELLIPSIS_CHAR:C = '\u2026'

.field public static final LAYOUT_PARAMS_KEEP_OLD:I = -0x3

.field public static sTempEllipsisResult:Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;

.field private static sToastHook:Lcom/ss/android/ttve/utils/UIUtils$ToastHook;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/ss/android/ttve/utils/UIUtils;->API_ET_20:Z

    const/4 v0, -0x1

    sput v0, Lcom/ss/android/ttve/utils/UIUtils;->DPI:I

    new-instance v0, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;

    invoke-direct {v0}, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;-><init>()V

    sput-object v0, Lcom/ss/android/ttve/utils/UIUtils;->sTempEllipsisResult:Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static assertInUIThread()V
    .locals 2

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    return-void

    :cond_1
    return-void
.end method

.method public static clearAnimation(Landroid/view/View;)Z
    .locals 1

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->clearAnimation()V

    const/4 p0, 0x1

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method public static detachFromParent(Landroid/view/View;)V
    .locals 2

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-nez v1, :cond_1

    return-void

    :cond_1
    :try_start_0
    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    :goto_0
    return-void

    :cond_2
    :goto_1
    return-void
.end method

.method public static dip2Px(Landroid/content/Context;F)F
    .locals 0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, p0

    const/high16 p0, 0x3f000000    # 0.5f

    add-float/2addr p1, p0

    return p1
.end method

.method public static displayLongTimeToast(Landroid/content/Context;II)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    const/4 v0, 0x1

    const/16 v1, 0x11

    invoke-static {p0, p1, p2, v0, v1}, Lcom/ss/android/ttve/utils/UIUtils;->displayToastInternal(Landroid/content/Context;ILjava/lang/String;II)V

    return-void
.end method

.method public static displayToast(Landroid/content/Context;I)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/ss/android/ttve/utils/UIUtils;->displayToast(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public static displayToast(Landroid/content/Context;II)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/utils/UIUtils;->displayToast(Landroid/content/Context;Ljava/lang/String;I)V

    return-void
.end method

.method public static displayToast(Landroid/content/Context;ILjava/lang/String;)V
    .locals 2

    const/4 v0, 0x0

    const/16 v1, 0x11

    invoke-static {p0, p1, p2, v0, v1}, Lcom/ss/android/ttve/utils/UIUtils;->displayToastInternal(Landroid/content/Context;ILjava/lang/String;II)V

    return-void
.end method

.method public static displayToast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/ss/android/ttve/utils/UIUtils;->displayToast(Landroid/content/Context;ILjava/lang/String;)V

    return-void
.end method

.method public static displayToast(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, v0, p1, v0, p2}, Lcom/ss/android/ttve/utils/UIUtils;->displayToastInternal(Landroid/content/Context;ILjava/lang/String;II)V

    return-void
.end method

.method private static displayToastInternal(Landroid/content/Context;ILjava/lang/String;II)V
    .locals 0

    return-void
.end method

.method public static displayToastWithIcon(Landroid/content/Context;II)V
    .locals 0

    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/utils/UIUtils;->displayToast(Landroid/content/Context;ILjava/lang/String;)V

    return-void
.end method

.method public static displayToastWithIcon(Landroid/content/Context;ILjava/lang/String;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/utils/UIUtils;->displayToast(Landroid/content/Context;ILjava/lang/String;)V

    return-void
.end method

.method public static ellipseSingleLineStr(Ljava/lang/String;ILandroid/graphics/Paint;ILcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;)V
    .locals 9

    const/4 v0, 0x0

    if-le p1, p3, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p2, p0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    invoke-static {v1}, Lcom/ss/android/ttve/utils/UIUtils;->floatToIntBig(F)I

    move-result v1

    if-gt v1, p1, :cond_1

    iput-object p0, p4, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;->ellipsisStr:Ljava/lang/String;

    iput v1, p4, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;->length:I

    return-void

    :cond_1
    sub-int p3, p1, p3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x1

    int-to-float v7, p3

    const/4 v8, 0x0

    move-object v2, p2

    move-object v3, p0

    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Paint;->breakText(Ljava/lang/CharSequence;IIZF[F)I

    move-result p2

    const/4 p3, 0x1

    if-ge p2, p3, :cond_2

    const-string p0, ""

    iput-object p0, p4, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;->ellipsisStr:Ljava/lang/String;

    iput v0, p4, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;->length:I

    return-void

    :cond_2
    invoke-virtual {p0, v0, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x2026

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p4, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;->ellipsisStr:Ljava/lang/String;

    iput p1, p4, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;->length:I

    return-void

    :cond_3
    :goto_0
    const-string p0, ""

    iput-object p0, p4, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;->ellipsisStr:Ljava/lang/String;

    iput v0, p4, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;->length:I

    return-void
.end method

.method public static expandClickRegion(Landroid/view/View;IIII)V
    .locals 7

    new-instance v6, Lcom/ss/android/ttve/utils/UIUtils$1;

    move-object v0, v6

    move-object v1, p0

    move v2, p2

    move v3, p4

    move v4, p1

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ttve/utils/UIUtils$1;-><init>(Landroid/view/View;IIII)V

    invoke-virtual {p0, v6}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public static floatToIntBig(F)I
    .locals 1

    const v0, 0x3f7fbe77    # 0.999f

    add-float/2addr p0, v0

    float-to-int p0, p0

    return p0
.end method

.method public static getDiggBuryWidth(Landroid/content/Context;)I
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    mul-int/lit16 v0, v0, 0x55f

    div-int/lit16 v0, v0, 0x2710

    const/high16 v1, 0x41a00000    # 20.0f

    invoke-static {p0, v1}, Lcom/ss/android/ttve/utils/UIUtils;->dip2Px(Landroid/content/Context;F)F

    move-result p0

    float-to-int p0, p0

    add-int/2addr v0, p0

    return v0
.end method

.method public static final getDisplayCount(I)Ljava/lang/String;
    .locals 7

    const/16 v0, 0x2710

    if-le p0, v0, :cond_1

    const-string v0, "%.1f"

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    int-to-double v5, p0

    mul-double/2addr v3, v5

    const-wide v5, 0x40c3880000000000L    # 10000.0

    div-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x30

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v0, v1, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo p0, "\u4e07"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo p0, "\u4e07"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getDpi(Landroid/content/Context;)I
    .locals 2

    sget v0, Lcom/ss/android/ttve/utils/UIUtils;->DPI:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->densityDpi:I

    sput p0, Lcom/ss/android/ttve/utils/UIUtils;->DPI:I

    :cond_0
    sget p0, Lcom/ss/android/ttve/utils/UIUtils;->DPI:I

    return p0
.end method

.method public static getIndexInParent(Landroid/view/View;)I
    .locals 3

    const/4 v0, -0x1

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result p0

    return p0

    :cond_1
    return v0

    :cond_2
    :goto_0
    return v0
.end method

.method public static getLocationInAncestor(Landroid/view/View;Landroid/view/View;)[I
    .locals 7

    const/4 v0, 0x0

    if-eqz p0, :cond_4

    if-nez p1, :cond_0

    goto :goto_2

    :cond_0
    const/4 v1, 0x2

    new-array v2, v1, [I

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    nop

    const/4 v3, 0x0

    aget v4, v1, v3

    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v4, v5

    aput v4, v1, v3

    const/4 v4, 0x1

    aget v5, v1, v4

    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v5, v6

    aput v5, v1, v4

    nop

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    :goto_0
    instance-of v5, p0, Landroid/view/View;

    if-eqz v5, :cond_2

    move-object v5, p0

    check-cast v5, Landroid/view/View;

    if-ne p0, p1, :cond_1

    nop

    nop

    move p0, v4

    goto :goto_1

    :cond_1
    aget p0, v1, v3

    invoke-virtual {v5}, Landroid/view/View;->getScrollX()I

    move-result v6

    int-to-float v6, v6

    sub-float/2addr p0, v6

    aput p0, v1, v3

    aget p0, v1, v4

    invoke-virtual {v5}, Landroid/view/View;->getScrollY()I

    move-result v6

    int-to-float v6, v6

    sub-float/2addr p0, v6

    aput p0, v1, v4

    aget p0, v1, v3

    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr p0, v6

    aput p0, v1, v3

    aget p0, v1, v4

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr p0, v6

    aput p0, v1, v4

    invoke-virtual {v5}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    goto :goto_0

    :cond_2
    move p0, v3

    :goto_1
    if-nez p0, :cond_3

    return-object v0

    :cond_3
    aget p0, v1, v3

    const/high16 p1, 0x3f000000    # 0.5f

    add-float/2addr p0, p1

    float-to-int p0, p0

    aput p0, v2, v3

    aget p0, v1, v4

    add-float/2addr p0, p1

    float-to-int p0, p0

    aput p0, v2, v4

    return-object v2

    :cond_4
    :goto_2
    return-object v0

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public static getLocationInUpView(Landroid/view/View;Landroid/view/View;[IZ)V
    .locals 5

    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    if-eqz p2, :cond_2

    array-length v0, p2

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p2}, Landroid/view/View;->getLocationInWindow([I)V

    const/4 p0, 0x0

    aget v0, p2, p0

    const/4 v2, 0x1

    aget v3, p2, v2

    invoke-virtual {p1, p2}, Landroid/view/View;->getLocationInWindow([I)V

    aget v4, p2, p0

    sub-int/2addr v4, v0

    aget v0, p2, v2

    sub-int/2addr v0, v3

    if-eqz p3, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p3

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    div-int/2addr p3, v1

    add-int/2addr v4, p3

    div-int/2addr p1, v1

    add-int/2addr v0, p1

    :cond_1
    aput v4, p2, p0

    aput v0, p2, v2

    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method public static final getRatioOfScreen(Landroid/content/Context;F)I
    .locals 0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float p0, p0

    mul-float/2addr p0, p1

    float-to-int p0, p0

    return p0
.end method

.method public static final getScreenHeight(Landroid/content/Context;)I
    .locals 1

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    if-nez p0, :cond_1

    goto :goto_0

    :cond_1
    iget v0, p0, Landroid/util/DisplayMetrics;->heightPixels:I

    :goto_0
    return v0
.end method

.method public static final getScreenWidth(Landroid/content/Context;)I
    .locals 1

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    if-nez p0, :cond_1

    goto :goto_0

    :cond_1
    iget v0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    :goto_0
    return v0
.end method

.method public static final getStatusBarHeight(Landroid/content/Context;)I
    .locals 5

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    nop

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "status_bar_height"

    const-string v3, "dimen"

    const-string v4, "android"

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    :cond_1
    return v0
.end method

.method public static isInUIThread()Z
    .locals 2

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static final isViewVisible(Landroid/view/View;)Z
    .locals 1

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p0

    if-nez p0, :cond_1

    const/4 v0, 0x1

    nop

    :cond_1
    return v0
.end method

.method public static px2dip(Landroid/content/Context;F)I
    .locals 0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr p1, p0

    const/high16 p0, 0x3f000000    # 0.5f

    add-float/2addr p1, p0

    float-to-int p0, p1

    return p0
.end method

.method public static requestOrienation(Landroid/app/Activity;Z)V
    .locals 1

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    xor-int/lit8 v0, p1, 0x1

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setRequestedOrientation(I)V

    const/16 v0, 0x400

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0, v0, v0}, Landroid/view/Window;->setFlags(II)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/Window;->clearFlags(I)V

    :goto_0
    return-void

    :cond_2
    :goto_1
    return-void
.end method

.method public static setClickListener(ZLandroid/view/View;Landroid/view/View$OnClickListener;)V
    .locals 0

    if-nez p1, :cond_0

    return-void

    :cond_0
    if-eqz p0, :cond_1

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Landroid/view/View;->setClickable(Z)V

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Landroid/view/View;->setClickable(Z)V

    :goto_0
    return-void
.end method

.method public static setColorAlpha(II)I
    .locals 1

    const/16 v0, 0xff

    if-le p1, v0, :cond_0

    nop

    move p1, v0

    goto :goto_0

    :cond_0
    if-gez p1, :cond_1

    const/4 p1, 0x0

    :cond_1
    :goto_0
    const v0, 0xffffff

    and-int/2addr p0, v0

    const/high16 v0, 0x1000000

    mul-int/2addr p1, v0

    or-int/2addr p0, p1

    return p0
.end method

.method public static setLayoutParams(Landroid/view/View;II)V
    .locals 1

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    if-nez p0, :cond_0

    return-void

    :cond_0
    const/high16 v0, -0x80000000

    if-eq p1, v0, :cond_1

    iput p1, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    :cond_1
    if-eq p2, v0, :cond_2

    iput p2, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    :cond_2
    return-void
.end method

.method public static setText(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .locals 1

    if-nez p0, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static setTextViewMaxLines(Landroid/widget/TextView;I)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    if-eqz p0, :cond_3

    if-gtz p1, :cond_0

    goto :goto_1

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_1

    invoke-virtual {p0}, Landroid/widget/TextView;->getMaxLines()I

    move-result v0

    if-ne v0, p1, :cond_1

    return-void

    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setSingleLine(Z)V

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMaxLines(I)V

    return-void

    :cond_3
    :goto_1
    return-void
.end method

.method public static setToastHook(Lcom/ss/android/ttve/utils/UIUtils$ToastHook;)V
    .locals 0

    sput-object p0, Lcom/ss/android/ttve/utils/UIUtils;->sToastHook:Lcom/ss/android/ttve/utils/UIUtils$ToastHook;

    return-void
.end method

.method public static setTopMargin(Landroid/view/View;F)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v1, p1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    const/4 v0, -0x3

    invoke-static {p0, v0, p1, v0, v0}, Lcom/ss/android/ttve/utils/UIUtils;->updateLayoutMargin(Landroid/view/View;IIII)V

    return-void
.end method

.method public static setTxtAndAdjustVisible(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 p1, 0x8

    invoke-static {p0, p1}, Lcom/ss/android/ttve/utils/UIUtils;->setViewVisibility(Landroid/view/View;I)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/ss/android/ttve/utils/UIUtils;->setViewVisibility(Landroid/view/View;I)V

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method public static setViewBackgroundWithPadding(Landroid/view/View;I)V
    .locals 4

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    invoke-virtual {p0, v0, v2, v1, v3}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method

.method public static setViewBackgroundWithPadding(Landroid/view/View;Landroid/content/res/Resources;I)V
    .locals 4

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-virtual {p0, v0, v2, v1, v3}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method

.method public static setViewBackgroundWithPadding(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V
    .locals 4

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v0, v2, v1, v3}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method

.method public static setViewMinHeight(Landroid/view/View;I)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    if-nez p0, :cond_0

    return-void

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getMinimumHeight()I

    move-result v0

    if-ne v0, p1, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0, p1}, Landroid/view/View;->setMinimumHeight(I)V

    return-void
.end method

.method public static final setViewVisibility(Landroid/view/View;I)V
    .locals 1

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eq v0, p1, :cond_1

    invoke-static {p1}, Lcom/ss/android/ttve/utils/UIUtils;->visibilityValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public static sp2px(Landroid/content/Context;F)F
    .locals 1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    const/4 v0, 0x2

    invoke-static {v0, p1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    return p0
.end method

.method public static updateLayout(Landroid/view/View;II)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-eqz v0, :cond_4

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v1, p1, :cond_1

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ne v1, p2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, -0x3

    if-eq p1, v1, :cond_2

    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    :cond_2
    if-eq p2, v1, :cond_3

    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    :cond_3
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    :cond_4
    :goto_0
    return-void
.end method

.method public static updateLayoutMargin(Landroid/view/View;IIII)V
    .locals 8

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v1, :cond_2

    move-object v3, v0

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    move-object v2, p0

    move v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    invoke-static/range {v2 .. v7}, Lcom/ss/android/ttve/utils/UIUtils;->updateMargin(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V

    :cond_2
    return-void
.end method

.method private static updateMargin(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
    .locals 1

    if-eqz p0, :cond_5

    if-eqz p1, :cond_5

    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-ne v0, p2, :cond_0

    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-ne v0, p3, :cond_0

    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-ne v0, p4, :cond_0

    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    if-ne v0, p5, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, -0x3

    if-eq p2, v0, :cond_1

    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    :cond_1
    if-eq p3, v0, :cond_2

    iput p3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    :cond_2
    if-eq p4, v0, :cond_3

    iput p4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    :cond_3
    if-eq p5, v0, :cond_4

    iput p5, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    :cond_4
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    :cond_5
    :goto_0
    return-void
.end method

.method private static visibilityValid(I)Z
    .locals 1

    if-eqz p0, :cond_1

    const/16 v0, 0x8

    if-eq p0, v0, :cond_1

    const/4 v0, 0x4

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method
