.class Landroid/support/v4/graphics/drawable/DrawableCompatLollipop;
.super Ljava/lang/Object;
.source "DrawableCompatLollipop.java"


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setHotspot(Landroid/graphics/drawable/Drawable;FF)V
    .registers 3

    invoke-virtual {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setHotspot(FF)V

    return-void
.end method

.method public static setHotspotBounds(Landroid/graphics/drawable/Drawable;IIII)V
    .registers 5

    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/graphics/drawable/Drawable;->setHotspotBounds(IIII)V

    return-void
.end method

.method public static setTint(Landroid/graphics/drawable/Drawable;I)V
    .registers 3

    instance-of v0, p0, Landroid/support/v4/graphics/drawable/DrawableWrapperLollipop;

    if-eqz v0, :cond_8

    invoke-static {p0, p1}, Landroid/support/v4/graphics/drawable/DrawableCompatBase;->setTint(Landroid/graphics/drawable/Drawable;I)V

    goto :goto_b

    :cond_8
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    :goto_b
    return-void
.end method

.method public static setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V
    .registers 3

    instance-of v0, p0, Landroid/support/v4/graphics/drawable/DrawableWrapperLollipop;

    if-eqz v0, :cond_8

    invoke-static {p0, p1}, Landroid/support/v4/graphics/drawable/DrawableCompatBase;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    goto :goto_b

    :cond_8
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    :goto_b
    return-void
.end method

.method public static setTintMode(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    instance-of v0, p0, Landroid/support/v4/graphics/drawable/DrawableWrapperLollipop;

    if-eqz v0, :cond_8

    invoke-static {p0, p1}, Landroid/support/v4/graphics/drawable/DrawableCompatBase;->setTintMode(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    goto :goto_b

    :cond_8
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    :goto_b
    return-void
.end method

.method public static wrapForTinting(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .registers 2

    instance-of v0, p0, Landroid/graphics/drawable/GradientDrawable;

    if-nez v0, :cond_a

    instance-of v0, p0, Landroid/graphics/drawable/DrawableContainer;

    if-eqz v0, :cond_9

    goto :goto_a

    :cond_9
    return-object p0

    :cond_a
    :goto_a
    new-instance v0, Landroid/support/v4/graphics/drawable/DrawableWrapperLollipop;

    invoke-direct {v0, p0}, Landroid/support/v4/graphics/drawable/DrawableWrapperLollipop;-><init>(Landroid/graphics/drawable/Drawable;)V

    return-object v0
.end method
