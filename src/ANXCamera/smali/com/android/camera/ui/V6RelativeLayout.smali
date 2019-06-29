.class public Lcom/android/camera/ui/V6RelativeLayout;
.super Landroid/widget/RelativeLayout;
.source "V6RelativeLayout.java"

# interfaces
.implements Lcom/android/camera/ui/Rotatable;
.implements Lcom/android/camera/ui/V6Animation;
.implements Lcom/android/camera/ui/V6FunctionUI;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public animateIn(Ljava/lang/Runnable;)V
    .locals 0

    return-void
.end method

.method public animateIn(Ljava/lang/Runnable;I)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/V6RelativeLayout;->animateIn(Ljava/lang/Runnable;)V

    return-void
.end method

.method public animateIn(Ljava/lang/Runnable;IZ)V
    .locals 0

    return-void
.end method

.method public animateOut(Ljava/lang/Runnable;)V
    .locals 0

    return-void
.end method

.method public animateOut(Ljava/lang/Runnable;I)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/V6RelativeLayout;->animateOut(Ljava/lang/Runnable;)V

    return-void
.end method

.method public animateOut(Ljava/lang/Runnable;IZ)V
    .locals 0

    return-void
.end method

.method public enableControls(Z)V
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/ui/V6RelativeLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/V6RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Lcom/android/camera/ui/V6FunctionUI;

    if-eqz v3, :cond_0

    check-cast v2, Lcom/android/camera/ui/V6FunctionUI;

    invoke-interface {v2, p1}, Lcom/android/camera/ui/V6FunctionUI;->enableControls(Z)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public findChildrenById(I)Landroid/view/View;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/V6RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onCameraOpen()V
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/ui/V6RelativeLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/V6RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Lcom/android/camera/ui/V6FunctionUI;

    if-eqz v3, :cond_0

    check-cast v2, Lcom/android/camera/ui/V6FunctionUI;

    invoke-interface {v2}, Lcom/android/camera/ui/V6FunctionUI;->onCameraOpen()V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public onCreate()V
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/ui/V6RelativeLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/V6RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Lcom/android/camera/ui/V6FunctionUI;

    if-eqz v3, :cond_0

    check-cast v2, Lcom/android/camera/ui/V6FunctionUI;

    invoke-interface {v2}, Lcom/android/camera/ui/V6FunctionUI;->onCreate()V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public onPause()V
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/ui/V6RelativeLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/V6RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Lcom/android/camera/ui/V6FunctionUI;

    if-eqz v3, :cond_0

    check-cast v2, Lcom/android/camera/ui/V6FunctionUI;

    invoke-interface {v2}, Lcom/android/camera/ui/V6FunctionUI;->onPause()V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public onResume()V
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/ui/V6RelativeLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/V6RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Lcom/android/camera/ui/V6FunctionUI;

    if-eqz v3, :cond_0

    check-cast v2, Lcom/android/camera/ui/V6FunctionUI;

    invoke-interface {v2}, Lcom/android/camera/ui/V6FunctionUI;->onResume()V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public setOrientation(IZ)V
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/ui/V6RelativeLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/V6RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Lcom/android/camera/ui/Rotatable;

    if-eqz v3, :cond_0

    check-cast v2, Lcom/android/camera/ui/Rotatable;

    invoke-interface {v2, p1, p2}, Lcom/android/camera/ui/Rotatable;->setOrientation(IZ)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method
