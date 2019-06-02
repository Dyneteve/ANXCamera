.class Landroid/support/v4/widget/NestedScrollView$AccessibilityDelegate;
.super Landroid/support/v4/view/AccessibilityDelegateCompat;
.source "NestedScrollView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/widget/NestedScrollView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AccessibilityDelegate"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/support/v4/view/AccessibilityDelegateCompat;-><init>()V

    return-void
.end method


# virtual methods
.method public onInitializeAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 7

    invoke-super {p0, p1, p2}, Landroid/support/v4/view/AccessibilityDelegateCompat;->onInitializeAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    move-object v0, p1

    check-cast v0, Landroid/support/v4/widget/NestedScrollView;

    const-class v1, Landroid/widget/ScrollView;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    invoke-static {p2}, Landroid/support/v4/view/accessibility/AccessibilityEventCompat;->asRecord(Landroid/view/accessibility/AccessibilityEvent;)Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;

    move-result-object v1

    # invokes: Landroid/support/v4/widget/NestedScrollView;->getScrollRange()I
    invoke-static {v0}, Landroid/support/v4/widget/NestedScrollView;->access$000(Landroid/support/v4/widget/NestedScrollView;)I

    move-result v2

    if-lez v2, :cond_1b

    const/4 v2, 0x1

    goto :goto_1c

    :cond_1b
    const/4 v2, 0x0

    :goto_1c
    invoke-virtual {v1, v2}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setScrollable(Z)V

    invoke-virtual {v0}, Landroid/support/v4/widget/NestedScrollView;->getScrollX()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setScrollX(I)V

    invoke-virtual {v0}, Landroid/support/v4/widget/NestedScrollView;->getScrollY()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setScrollY(I)V

    invoke-virtual {v0}, Landroid/support/v4/widget/NestedScrollView;->getScrollX()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setMaxScrollX(I)V

    # invokes: Landroid/support/v4/widget/NestedScrollView;->getScrollRange()I
    invoke-static {v0}, Landroid/support/v4/widget/NestedScrollView;->access$000(Landroid/support/v4/widget/NestedScrollView;)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setMaxScrollY(I)V

    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;)V
    .registers 6

    invoke-super {p0, p1, p2}, Landroid/support/v4/view/AccessibilityDelegateCompat;->onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;)V

    move-object v0, p1

    check-cast v0, Landroid/support/v4/widget/NestedScrollView;

    const-class v1, Landroid/widget/ScrollView;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->setClassName(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Landroid/support/v4/widget/NestedScrollView;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_35

    # invokes: Landroid/support/v4/widget/NestedScrollView;->getScrollRange()I
    invoke-static {v0}, Landroid/support/v4/widget/NestedScrollView;->access$000(Landroid/support/v4/widget/NestedScrollView;)I

    move-result v1

    if-lez v1, :cond_35

    const/4 v2, 0x1

    invoke-virtual {p2, v2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->setScrollable(Z)V

    invoke-virtual {v0}, Landroid/support/v4/widget/NestedScrollView;->getScrollY()I

    move-result v2

    if-lez v2, :cond_2a

    const/16 v2, 0x2000

    invoke-virtual {p2, v2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->addAction(I)V

    :cond_2a
    invoke-virtual {v0}, Landroid/support/v4/widget/NestedScrollView;->getScrollY()I

    move-result v2

    if-ge v2, v1, :cond_35

    const/16 v2, 0x1000

    invoke-virtual {p2, v2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->addAction(I)V

    :cond_35
    return-void
.end method

.method public performAccessibilityAction(Landroid/view/View;ILandroid/os/Bundle;)Z
    .registers 10

    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/view/AccessibilityDelegateCompat;->performAccessibilityAction(Landroid/view/View;ILandroid/os/Bundle;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    return v1

    :cond_8
    move-object v0, p1

    check-cast v0, Landroid/support/v4/widget/NestedScrollView;

    invoke-virtual {v0}, Landroid/support/v4/widget/NestedScrollView;->isEnabled()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_13

    return v3

    :cond_13
    const/16 v2, 0x1000

    if-eq p2, v2, :cond_3e

    const/16 v2, 0x2000

    if-eq p2, v2, :cond_1c

    return v3

    :cond_1c
    invoke-virtual {v0}, Landroid/support/v4/widget/NestedScrollView;->getHeight()I

    move-result v2

    invoke-virtual {v0}, Landroid/support/v4/widget/NestedScrollView;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v2, v4

    invoke-virtual {v0}, Landroid/support/v4/widget/NestedScrollView;->getPaddingTop()I

    move-result v4

    sub-int/2addr v2, v4

    invoke-virtual {v0}, Landroid/support/v4/widget/NestedScrollView;->getScrollY()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-virtual {v0}, Landroid/support/v4/widget/NestedScrollView;->getScrollY()I

    move-result v5

    if-eq v4, v5, :cond_3d

    invoke-virtual {v0, v3, v4}, Landroid/support/v4/widget/NestedScrollView;->smoothScrollTo(II)V

    return v1

    :cond_3d
    return v3

    :cond_3e
    invoke-virtual {v0}, Landroid/support/v4/widget/NestedScrollView;->getHeight()I

    move-result v2

    invoke-virtual {v0}, Landroid/support/v4/widget/NestedScrollView;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v2, v4

    invoke-virtual {v0}, Landroid/support/v4/widget/NestedScrollView;->getPaddingTop()I

    move-result v4

    sub-int/2addr v2, v4

    invoke-virtual {v0}, Landroid/support/v4/widget/NestedScrollView;->getScrollY()I

    move-result v4

    add-int/2addr v4, v2

    # invokes: Landroid/support/v4/widget/NestedScrollView;->getScrollRange()I
    invoke-static {v0}, Landroid/support/v4/widget/NestedScrollView;->access$000(Landroid/support/v4/widget/NestedScrollView;)I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-virtual {v0}, Landroid/support/v4/widget/NestedScrollView;->getScrollY()I

    move-result v5

    if-eq v4, v5, :cond_63

    invoke-virtual {v0, v3, v4}, Landroid/support/v4/widget/NestedScrollView;->smoothScrollTo(II)V

    return v1

    :cond_63
    return v3
.end method
