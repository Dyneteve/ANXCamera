.class public Landroid/support/v4/widget/PopupWindowCompat;
.super Ljava/lang/Object;
.source "PopupWindowCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/widget/PopupWindowCompat$Api23PopupWindowImpl;,
        Landroid/support/v4/widget/PopupWindowCompat$Api21PopupWindowImpl;,
        Landroid/support/v4/widget/PopupWindowCompat$KitKatPopupWindowImpl;,
        Landroid/support/v4/widget/PopupWindowCompat$GingerbreadPopupWindowImpl;,
        Landroid/support/v4/widget/PopupWindowCompat$BasePopupWindowImpl;,
        Landroid/support/v4/widget/PopupWindowCompat$PopupWindowImpl;
    }
.end annotation


# static fields
.field static final IMPL:Landroid/support/v4/widget/PopupWindowCompat$PopupWindowImpl;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_e

    new-instance v1, Landroid/support/v4/widget/PopupWindowCompat$Api23PopupWindowImpl;

    invoke-direct {v1}, Landroid/support/v4/widget/PopupWindowCompat$Api23PopupWindowImpl;-><init>()V

    sput-object v1, Landroid/support/v4/widget/PopupWindowCompat;->IMPL:Landroid/support/v4/widget/PopupWindowCompat$PopupWindowImpl;

    goto :goto_39

    :cond_e
    const/16 v1, 0x15

    if-lt v0, v1, :cond_1a

    new-instance v1, Landroid/support/v4/widget/PopupWindowCompat$Api21PopupWindowImpl;

    invoke-direct {v1}, Landroid/support/v4/widget/PopupWindowCompat$Api21PopupWindowImpl;-><init>()V

    sput-object v1, Landroid/support/v4/widget/PopupWindowCompat;->IMPL:Landroid/support/v4/widget/PopupWindowCompat$PopupWindowImpl;

    goto :goto_39

    :cond_1a
    const/16 v1, 0x13

    if-lt v0, v1, :cond_26

    new-instance v1, Landroid/support/v4/widget/PopupWindowCompat$KitKatPopupWindowImpl;

    invoke-direct {v1}, Landroid/support/v4/widget/PopupWindowCompat$KitKatPopupWindowImpl;-><init>()V

    sput-object v1, Landroid/support/v4/widget/PopupWindowCompat;->IMPL:Landroid/support/v4/widget/PopupWindowCompat$PopupWindowImpl;

    goto :goto_39

    :cond_26
    const/16 v1, 0x9

    if-lt v0, v1, :cond_32

    new-instance v1, Landroid/support/v4/widget/PopupWindowCompat$GingerbreadPopupWindowImpl;

    invoke-direct {v1}, Landroid/support/v4/widget/PopupWindowCompat$GingerbreadPopupWindowImpl;-><init>()V

    sput-object v1, Landroid/support/v4/widget/PopupWindowCompat;->IMPL:Landroid/support/v4/widget/PopupWindowCompat$PopupWindowImpl;

    goto :goto_39

    :cond_32
    new-instance v1, Landroid/support/v4/widget/PopupWindowCompat$BasePopupWindowImpl;

    invoke-direct {v1}, Landroid/support/v4/widget/PopupWindowCompat$BasePopupWindowImpl;-><init>()V

    sput-object v1, Landroid/support/v4/widget/PopupWindowCompat;->IMPL:Landroid/support/v4/widget/PopupWindowCompat$PopupWindowImpl;

    :goto_39
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getOverlapAnchor(Landroid/widget/PopupWindow;)Z
    .registers 2

    sget-object v0, Landroid/support/v4/widget/PopupWindowCompat;->IMPL:Landroid/support/v4/widget/PopupWindowCompat$PopupWindowImpl;

    invoke-interface {v0, p0}, Landroid/support/v4/widget/PopupWindowCompat$PopupWindowImpl;->getOverlapAnchor(Landroid/widget/PopupWindow;)Z

    move-result v0

    return v0
.end method

.method public static getWindowLayoutType(Landroid/widget/PopupWindow;)I
    .registers 2

    sget-object v0, Landroid/support/v4/widget/PopupWindowCompat;->IMPL:Landroid/support/v4/widget/PopupWindowCompat$PopupWindowImpl;

    invoke-interface {v0, p0}, Landroid/support/v4/widget/PopupWindowCompat$PopupWindowImpl;->getWindowLayoutType(Landroid/widget/PopupWindow;)I

    move-result v0

    return v0
.end method

.method public static setOverlapAnchor(Landroid/widget/PopupWindow;Z)V
    .registers 3

    sget-object v0, Landroid/support/v4/widget/PopupWindowCompat;->IMPL:Landroid/support/v4/widget/PopupWindowCompat$PopupWindowImpl;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/widget/PopupWindowCompat$PopupWindowImpl;->setOverlapAnchor(Landroid/widget/PopupWindow;Z)V

    return-void
.end method

.method public static setWindowLayoutType(Landroid/widget/PopupWindow;I)V
    .registers 3

    sget-object v0, Landroid/support/v4/widget/PopupWindowCompat;->IMPL:Landroid/support/v4/widget/PopupWindowCompat$PopupWindowImpl;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/widget/PopupWindowCompat$PopupWindowImpl;->setWindowLayoutType(Landroid/widget/PopupWindow;I)V

    return-void
.end method

.method public static showAsDropDown(Landroid/widget/PopupWindow;Landroid/view/View;III)V
    .registers 11

    sget-object v0, Landroid/support/v4/widget/PopupWindowCompat;->IMPL:Landroid/support/v4/widget/PopupWindowCompat$PopupWindowImpl;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-interface/range {v0 .. v5}, Landroid/support/v4/widget/PopupWindowCompat$PopupWindowImpl;->showAsDropDown(Landroid/widget/PopupWindow;Landroid/view/View;III)V

    return-void
.end method
