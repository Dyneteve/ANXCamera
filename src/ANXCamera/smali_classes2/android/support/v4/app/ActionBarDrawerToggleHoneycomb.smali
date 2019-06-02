.class Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb;
.super Ljava/lang/Object;
.source "ActionBarDrawerToggleHoneycomb.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ActionBarDrawerToggleHoneycomb"

.field private static final THEME_ATTRS:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x101030b

    aput v2, v0, v1

    sput-object v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb;->THEME_ATTRS:[I

    return-void
.end method

.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getThemeUpIndicator(Landroid/app/Activity;)Landroid/graphics/drawable/Drawable;
    .registers 3

    sget-object v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb;->THEME_ATTRS:[I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    return-object v1
.end method

.method public static setActionBarDescription(Ljava/lang/Object;Landroid/app/Activity;I)Ljava/lang/Object;
    .registers 9

    if-nez p0, :cond_8

    new-instance v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;

    invoke-direct {v0, p1}, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;-><init>(Landroid/app/Activity;)V

    move-object p0, v0

    :cond_8
    move-object v0, p0

    check-cast v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;

    iget-object v1, v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->setHomeAsUpIndicator:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_38

    :try_start_f
    invoke-virtual {p1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    iget-object v2, v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->setHomeActionContentDescription:Ljava/lang/reflect/Method;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-gt v2, v3, :cond_2f

    invoke-virtual {v1}, Landroid/app/ActionBar;->getSubtitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ActionBar;->setSubtitle(Ljava/lang/CharSequence;)V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_2f} :catch_30

    :cond_2f
    goto :goto_38

    :catch_30
    move-exception v1

    const-string v2, "ActionBarDrawerToggleHoneycomb"

    const-string v3, "Couldn\'t set content description via JB-MR2 API"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_38
    :goto_38
    return-object p0
.end method

.method public static setActionBarUpIndicator(Ljava/lang/Object;Landroid/app/Activity;Landroid/graphics/drawable/Drawable;I)Ljava/lang/Object;
    .registers 10

    if-nez p0, :cond_8

    new-instance v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;

    invoke-direct {v0, p1}, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;-><init>(Landroid/app/Activity;)V

    move-object p0, v0

    :cond_8
    move-object v0, p0

    check-cast v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;

    iget-object v1, v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->setHomeAsUpIndicator:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_35

    :try_start_f
    invoke-virtual {p1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    iget-object v2, v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->setHomeAsUpIndicator:Ljava/lang/reflect/Method;

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p2, v4, v5

    invoke-virtual {v2, v1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->setHomeActionContentDescription:Ljava/lang/reflect/Method;

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_2b} :catch_2c

    goto :goto_34

    :catch_2c
    move-exception v1

    const-string v2, "ActionBarDrawerToggleHoneycomb"

    const-string v3, "Couldn\'t set home-as-up indicator via JB-MR2 API"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_34
    goto :goto_46

    :cond_35
    iget-object v1, v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->upIndicatorView:Landroid/widget/ImageView;

    if-eqz v1, :cond_3f

    iget-object v1, v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->upIndicatorView:Landroid/widget/ImageView;

    invoke-virtual {v1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_46

    :cond_3f
    const-string v1, "ActionBarDrawerToggleHoneycomb"

    const-string v2, "Couldn\'t set home-as-up indicator"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_46
    return-object p0
.end method
