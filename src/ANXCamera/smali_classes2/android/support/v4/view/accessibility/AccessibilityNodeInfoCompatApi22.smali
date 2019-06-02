.class Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompatApi22;
.super Ljava/lang/Object;
.source "AccessibilityNodeInfoCompatApi22.java"


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getTraversalAfter(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getTraversalAfter()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    return-object v0
.end method

.method public static getTraversalBefore(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getTraversalBefore()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    return-object v0
.end method

.method public static setTraversalAfter(Ljava/lang/Object;Landroid/view/View;)V
    .registers 3

    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setTraversalAfter(Landroid/view/View;)V

    return-void
.end method

.method public static setTraversalAfter(Ljava/lang/Object;Landroid/view/View;I)V
    .registers 4

    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0, p1, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setTraversalAfter(Landroid/view/View;I)V

    return-void
.end method

.method public static setTraversalBefore(Ljava/lang/Object;Landroid/view/View;)V
    .registers 3

    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setTraversalBefore(Landroid/view/View;)V

    return-void
.end method

.method public static setTraversalBefore(Ljava/lang/Object;Landroid/view/View;I)V
    .registers 4

    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0, p1, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setTraversalBefore(Landroid/view/View;I)V

    return-void
.end method
