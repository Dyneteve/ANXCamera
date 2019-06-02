.class Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImplBase;
.super Ljava/lang/Object;
.source "DrawerLayout.java"

# interfaces
.implements Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/widget/DrawerLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DrawerLayoutCompatImplBase"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public applyMarginInsets(Landroid/view/ViewGroup$MarginLayoutParams;Ljava/lang/Object;I)V
    .registers 4

    return-void
.end method

.method public configureApplyInsets(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method public dispatchChildInsets(Landroid/view/View;Ljava/lang/Object;I)V
    .registers 4

    return-void
.end method

.method public getDefaultStatusBarBackground(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 3

    const/4 v0, 0x0

    return-object v0
.end method

.method public getTopInset(Ljava/lang/Object;)I
    .registers 3

    const/4 v0, 0x0

    return v0
.end method
