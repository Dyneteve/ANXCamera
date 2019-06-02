.class Landroid/support/v4/view/ViewCompatLollipop;
.super Ljava/lang/Object;
.source "ViewCompatLollipop.java"


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dispatchApplyWindowInsets(Landroid/view/View;Landroid/support/v4/view/WindowInsetsCompat;)Landroid/support/v4/view/WindowInsetsCompat;
    .registers 5

    instance-of v0, p1, Landroid/support/v4/view/WindowInsetsCompatApi21;

    if-eqz v0, :cond_17

    move-object v0, p1

    check-cast v0, Landroid/support/v4/view/WindowInsetsCompatApi21;

    invoke-virtual {v0}, Landroid/support/v4/view/WindowInsetsCompatApi21;->unwrap()Landroid/view/WindowInsets;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/View;->dispatchApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object v1

    if-eq v1, v0, :cond_17

    new-instance v2, Landroid/support/v4/view/WindowInsetsCompatApi21;

    invoke-direct {v2, v1}, Landroid/support/v4/view/WindowInsetsCompatApi21;-><init>(Landroid/view/WindowInsets;)V

    move-object p1, v2

    :cond_17
    return-object p1
.end method

.method public static dispatchNestedFling(Landroid/view/View;FFZ)Z
    .registers 5

    invoke-virtual {p0, p1, p2, p3}, Landroid/view/View;->dispatchNestedFling(FFZ)Z

    move-result v0

    return v0
.end method

.method public static dispatchNestedPreFling(Landroid/view/View;FF)Z
    .registers 4

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->dispatchNestedPreFling(FF)Z

    move-result v0

    return v0
.end method

.method public static dispatchNestedPreScroll(Landroid/view/View;II[I[I)Z
    .registers 6

    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/view/View;->dispatchNestedPreScroll(II[I[I)Z

    move-result v0

    return v0
.end method

.method public static dispatchNestedScroll(Landroid/view/View;IIII[I)Z
    .registers 7

    invoke-virtual/range {p0 .. p5}, Landroid/view/View;->dispatchNestedScroll(IIII[I)Z

    move-result v0

    return v0
.end method

.method static getBackgroundTintList(Landroid/view/View;)Landroid/content/res/ColorStateList;
    .registers 2

    invoke-virtual {p0}, Landroid/view/View;->getBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method static getBackgroundTintMode(Landroid/view/View;)Landroid/graphics/PorterDuff$Mode;
    .registers 2

    invoke-virtual {p0}, Landroid/view/View;->getBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    return-object v0
.end method

.method public static getElevation(Landroid/view/View;)F
    .registers 2

    invoke-virtual {p0}, Landroid/view/View;->getElevation()F

    move-result v0

    return v0
.end method

.method public static getTransitionName(Landroid/view/View;)Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Landroid/view/View;->getTransitionName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getTranslationZ(Landroid/view/View;)F
    .registers 2

    invoke-virtual {p0}, Landroid/view/View;->getTranslationZ()F

    move-result v0

    return v0
.end method

.method public static getZ(Landroid/view/View;)F
    .registers 2

    invoke-virtual {p0}, Landroid/view/View;->getZ()F

    move-result v0

    return v0
.end method

.method public static hasNestedScrollingParent(Landroid/view/View;)Z
    .registers 2

    invoke-virtual {p0}, Landroid/view/View;->hasNestedScrollingParent()Z

    move-result v0

    return v0
.end method

.method public static isImportantForAccessibility(Landroid/view/View;)Z
    .registers 2

    invoke-virtual {p0}, Landroid/view/View;->isImportantForAccessibility()Z

    move-result v0

    return v0
.end method

.method public static isNestedScrollingEnabled(Landroid/view/View;)Z
    .registers 2

    invoke-virtual {p0}, Landroid/view/View;->isNestedScrollingEnabled()Z

    move-result v0

    return v0
.end method

.method public static onApplyWindowInsets(Landroid/view/View;Landroid/support/v4/view/WindowInsetsCompat;)Landroid/support/v4/view/WindowInsetsCompat;
    .registers 5

    instance-of v0, p1, Landroid/support/v4/view/WindowInsetsCompatApi21;

    if-eqz v0, :cond_17

    move-object v0, p1

    check-cast v0, Landroid/support/v4/view/WindowInsetsCompatApi21;

    invoke-virtual {v0}, Landroid/support/v4/view/WindowInsetsCompatApi21;->unwrap()Landroid/view/WindowInsets;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/View;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object v1

    if-eq v1, v0, :cond_17

    new-instance v2, Landroid/support/v4/view/WindowInsetsCompatApi21;

    invoke-direct {v2, v1}, Landroid/support/v4/view/WindowInsetsCompatApi21;-><init>(Landroid/view/WindowInsets;)V

    move-object p1, v2

    :cond_17
    return-object p1
.end method

.method public static requestApplyInsets(Landroid/view/View;)V
    .registers 1

    invoke-virtual {p0}, Landroid/view/View;->requestApplyInsets()V

    return-void
.end method

.method static setBackgroundTintList(Landroid/view/View;Landroid/content/res/ColorStateList;)V
    .registers 2

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method static setBackgroundTintMode(Landroid/view/View;Landroid/graphics/PorterDuff$Mode;)V
    .registers 2

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V

    return-void
.end method

.method public static setElevation(Landroid/view/View;F)V
    .registers 2

    invoke-virtual {p0, p1}, Landroid/view/View;->setElevation(F)V

    return-void
.end method

.method public static setNestedScrollingEnabled(Landroid/view/View;Z)V
    .registers 2

    invoke-virtual {p0, p1}, Landroid/view/View;->setNestedScrollingEnabled(Z)V

    return-void
.end method

.method public static setOnApplyWindowInsetsListener(Landroid/view/View;Landroid/support/v4/view/OnApplyWindowInsetsListener;)V
    .registers 3

    new-instance v0, Landroid/support/v4/view/ViewCompatLollipop$1;

    invoke-direct {v0, p1}, Landroid/support/v4/view/ViewCompatLollipop$1;-><init>(Landroid/support/v4/view/OnApplyWindowInsetsListener;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    return-void
.end method

.method public static setTransitionName(Landroid/view/View;Ljava/lang/String;)V
    .registers 2

    invoke-virtual {p0, p1}, Landroid/view/View;->setTransitionName(Ljava/lang/String;)V

    return-void
.end method

.method public static setTranslationZ(Landroid/view/View;F)V
    .registers 2

    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationZ(F)V

    return-void
.end method

.method public static startNestedScroll(Landroid/view/View;I)Z
    .registers 3

    invoke-virtual {p0, p1}, Landroid/view/View;->startNestedScroll(I)Z

    move-result v0

    return v0
.end method

.method public static stopNestedScroll(Landroid/view/View;)V
    .registers 1

    invoke-virtual {p0}, Landroid/view/View;->stopNestedScroll()V

    return-void
.end method
