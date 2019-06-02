.class Landroid/support/v4/view/accessibility/AccessibilityRecordCompatJellyBean;
.super Ljava/lang/Object;
.source "AccessibilityRecordCompatJellyBean.java"


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setSource(Ljava/lang/Object;Landroid/view/View;I)V
    .registers 4

    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityRecord;

    invoke-virtual {v0, p1, p2}, Landroid/view/accessibility/AccessibilityRecord;->setSource(Landroid/view/View;I)V

    return-void
.end method
