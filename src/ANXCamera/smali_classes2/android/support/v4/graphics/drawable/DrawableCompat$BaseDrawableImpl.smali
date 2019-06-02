.class Landroid/support/v4/graphics/drawable/DrawableCompat$BaseDrawableImpl;
.super Ljava/lang/Object;
.source "DrawableCompat.java"

# interfaces
.implements Landroid/support/v4/graphics/drawable/DrawableCompat$DrawableImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/graphics/drawable/DrawableCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "BaseDrawableImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getLayoutDirection(Landroid/graphics/drawable/Drawable;)I
    .registers 3

    const/4 v0, 0x0

    return v0
.end method

.method public isAutoMirrored(Landroid/graphics/drawable/Drawable;)Z
    .registers 3

    const/4 v0, 0x0

    return v0
.end method

.method public jumpToCurrentState(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    return-void
.end method

.method public setAutoMirrored(Landroid/graphics/drawable/Drawable;Z)V
    .registers 3

    return-void
.end method

.method public setHotspot(Landroid/graphics/drawable/Drawable;FF)V
    .registers 4

    return-void
.end method

.method public setHotspotBounds(Landroid/graphics/drawable/Drawable;IIII)V
    .registers 6

    return-void
.end method

.method public setLayoutDirection(Landroid/graphics/drawable/Drawable;I)V
    .registers 3

    return-void
.end method

.method public setTint(Landroid/graphics/drawable/Drawable;I)V
    .registers 3

    invoke-static {p1, p2}, Landroid/support/v4/graphics/drawable/DrawableCompatBase;->setTint(Landroid/graphics/drawable/Drawable;I)V

    return-void
.end method

.method public setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V
    .registers 3

    invoke-static {p1, p2}, Landroid/support/v4/graphics/drawable/DrawableCompatBase;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setTintMode(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    invoke-static {p1, p2}, Landroid/support/v4/graphics/drawable/DrawableCompatBase;->setTintMode(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    return-void
.end method

.method public wrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .registers 3

    invoke-static {p1}, Landroid/support/v4/graphics/drawable/DrawableCompatBase;->wrapForTinting(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method
