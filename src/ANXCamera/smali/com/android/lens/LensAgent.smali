.class public Lcom/android/lens/LensAgent;
.super Ljava/lang/Object;
.source "LensAgent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/lens/LensAgent$SingletonHandler;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "LensAgent"


# instance fields
.field private volatile mInitialized:Z

.field private volatile mIsResumed:Z

.field private mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/lens/LensAgent$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/lens/LensAgent;-><init>()V

    return-void
.end method

.method private applyCustomStyle(Landroid/content/Context;Landroid/view/ViewGroup;)V
    .locals 12

    iget-object v0, p0, Lcom/android/lens/LensAgent;->mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    invoke-virtual {v0}, Lcom/google/android/libraries/lens/lenslite/LensliteApi;->getUiController()Lcom/google/android/libraries/lens/lenslite/LensliteUiController;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p1, v2}, Lcom/android/camera/Util;->getDisplayRect(Landroid/content/Context;I)Landroid/graphics/Rect;

    move-result-object v3

    const v4, 0x7f0a0128

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v4

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    int-to-float v3, v3

    sub-float/2addr v3, v4

    sget v4, Lcom/android/camera/Util;->sPixelDensity:F

    div-float/2addr v3, v4

    new-instance v4, Landroid/graphics/PointF;

    const/4 v5, 0x0

    invoke-direct {v4, v5, v3}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-virtual {v0, v4}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setChipLocation(Landroid/graphics/PointF;)V

    const v3, 0x7f02002e

    invoke-virtual {v0, v3}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setChipDrawable(I)V

    sget v3, Lcom/android/camera/Util;->sNavigationBarHeight:I

    int-to-float v3, v3

    sget v4, Lcom/android/camera/Util;->sPixelDensity:F

    div-float/2addr v3, v4

    const/4 v4, 0x1

    invoke-virtual {v0, v4, v3}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setOobeLocation(IF)V

    const v3, 0x7f0d0008

    invoke-virtual {p2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    const/4 v5, -0x1

    const/4 v6, -0x2

    if-eqz v3, :cond_0

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v3}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    const/16 v8, 0x11

    iput v8, v7, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    iput v6, v7, Landroid/widget/LinearLayout$LayoutParams;->width:I

    iput v6, v7, Landroid/widget/LinearLayout$LayoutParams;->height:I

    const v9, 0x7f0a012a

    invoke-virtual {v1, v9}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v9

    invoke-virtual {v7, v2, v2, v2, v9}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setTextColor(I)V

    const v7, 0x7f0a0129

    invoke-virtual {v1, v7}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v7

    invoke-virtual {v3, v2, v7}, Landroid/widget/TextView;->setTextSize(IF)V

    :cond_0
    const v3, 0x7f0d0009

    invoke-virtual {p2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    const/16 v7, 0x10

    if-eqz v3, :cond_1

    const v8, 0x7f020031

    invoke-virtual {v3, v8}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-static {v5}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    const v5, 0x7f0a012f

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v5

    invoke-virtual {v3, v5, v5, v5, v5}, Landroid/widget/ImageView;->setPadding(IIII)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    invoke-direct {v5, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    iput v7, v5, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->width:I

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->height:I

    const-string v6, "cancel_margin_left"

    const v8, 0x7f0a0130

    invoke-virtual {v1, v8}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v8

    invoke-static {v6, v8}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v6

    const-string v8, "cancel_margin_right"

    const v9, 0x7f0a0131

    invoke-virtual {v1, v9}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v9

    invoke-static {v8, v9}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v8

    const-string v9, "LensAgent"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "applyCustomStyle: cancel button marginLeft = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v11, ", marginRight = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v5, v6, v2, v8, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1
    const v3, 0x7f0d000a

    invoke-virtual {p2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_2

    invoke-virtual {v3, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    :cond_2
    const v3, 0x7f0d000b

    invoke-virtual {p2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/FrameLayout;

    if-eqz p2, :cond_3

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    invoke-direct {v3, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    iput v7, v3, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const-string v5, "icon_margin_left"

    const v6, 0x7f0a012d

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v6

    invoke-static {v5, v6}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v5

    const-string v6, "icon_margin_right"

    const v7, 0x7f0a012e

    invoke-virtual {v1, v7}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    invoke-static {v6, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    const-string v6, "LensAgent"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "applyCustomStyle: icon marginLeft = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, ", marginRight = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v3, v5, v2, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {p2, v3}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_3
    const p2, 0x7f020033

    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {v0, v2, p2}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    nop

    const p2, 0x7f020034

    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v4, v1}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x2

    const v2, 0x7f02002f

    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x3

    const v2, 0x7f020036

    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x4

    const v2, 0x7f020032

    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x5

    const v2, 0x7f020037

    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x6

    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x7

    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/16 v1, 0x8

    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/16 v1, 0xc

    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/16 v1, 0xd

    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {v0, v1, p2}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/16 p2, 0xe

    const v1, 0x7f020030

    invoke-virtual {p1, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    const/16 p2, 0x12

    const v1, 0x7f020035

    invoke-virtual {p1, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v0, p2, p1}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setIconForResultType(ILandroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public static getInstance()Lcom/android/lens/LensAgent;
    .locals 1

    invoke-static {}, Lcom/android/lens/LensAgent$SingletonHandler;->access$000()Lcom/android/lens/LensAgent;

    move-result-object v0

    return-object v0
.end method

.method public static isConflictAiScene(I)Z
    .locals 1

    const/4 v0, -0x1

    if-eq p0, v0, :cond_1

    const/16 v0, 0x13

    if-eq p0, v0, :cond_1

    const/16 v0, 0x19

    if-eq p0, v0, :cond_1

    const/16 v0, 0x1f

    if-eq p0, v0, :cond_0

    const/16 v0, 0x22

    if-eq p0, v0, :cond_1

    const/16 v0, 0x25

    if-eq p0, v0, :cond_1

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fa()Z

    move-result p0

    return p0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$init$0(I)V
    .locals 4

    const-string v0, "LensAgent"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onOobeStatusUpdated: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_google_lens_oobe_key"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x3

    if-ne p0, v0, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    move v1, v2

    :goto_0
    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->trackGoogleLensOobeContinue(Z)V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    const-string v3, "pref_google_lens_oobe_key"

    invoke-interface {v1, v3, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    if-eq p0, v0, :cond_2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    const-string v0, "pref_camera_long_press_viewfinder_key"

    invoke-interface {p0, v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    :cond_2
    return-void
.end method


# virtual methods
.method public init(Landroid/app/Activity;Landroid/view/View;Landroid/view/ViewGroup;)V
    .locals 5

    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x3

    invoke-static {v0, v1}, Lcom/google/android/libraries/lens/lenslite/LensliteApi;->create(Landroid/content/Context;I)Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    move-result-object v0

    iput-object v0, p0, Lcom/android/lens/LensAgent;->mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/android/lens/LensAgent;->mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    new-instance v3, Lcom/google/android/libraries/lens/lenslite/LensliteUiContainer;

    invoke-direct {v3, p2, p3}, Lcom/google/android/libraries/lens/lenslite/LensliteUiContainer;-><init>(Landroid/view/View;Landroid/view/ViewGroup;)V

    sget-object p2, Lcom/android/lens/-$$Lambda$LensAgent$cohQvDa6AK2LPMEq2gBw2XH18Nc;->INSTANCE:Lcom/android/lens/-$$Lambda$LensAgent$cohQvDa6AK2LPMEq2gBw2XH18Nc;

    invoke-virtual {v2, v3, p1, p2}, Lcom/google/android/libraries/lens/lenslite/LensliteApi;->onStart(Lcom/google/android/libraries/lens/lenslite/LensliteUiContainer;Landroid/app/Activity;Lcom/google/android/libraries/lens/lenslite/StatusUpdateCallback;)V

    const-string p2, "LensAgent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "LensliteApi init cost "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v0

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "ms"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p3}, Lcom/android/lens/LensAgent;->applyCustomStyle(Landroid/content/Context;Landroid/view/ViewGroup;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/lens/LensAgent;->mInitialized:Z

    return-void
.end method

.method public onFocusChange(IFF)V
    .locals 3
    .param p1    # I
        .annotation build Lcom/google/android/libraries/lens/lenslite/LensliteUiController$FocusType;
        .end annotation
    .end param

    iget-boolean v0, p0, Lcom/android/lens/LensAgent;->mInitialized:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v0, "LensAgent"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onFocusChange: type = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    iget-object v0, p0, Lcom/android/lens/LensAgent;->mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    invoke-virtual {v0}, Lcom/google/android/libraries/lens/lenslite/LensliteApi;->getUiController()Lcom/google/android/libraries/lens/lenslite/LensliteUiController;

    move-result-object v0

    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1, p2, p3}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-virtual {v0, p1, v1}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->onFocusChange(ILandroid/graphics/PointF;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "LensAgent"

    const-string p3, "onFocusChange: "

    invoke-static {p2, p3, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public onNewImage(Landroid/media/Image;I)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/lens/LensAgent;->mInitialized:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/android/lens/LensAgent;->mIsResumed:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/lens/LensAgent;->mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    invoke-static {p1, p2}, Lcom/google/android/libraries/lens/lenslite/api/LinkImage;->create(Landroid/media/Image;I)Lcom/google/android/libraries/lens/lenslite/api/LinkImage;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/google/android/libraries/lens/lenslite/LensliteApi;->onNewImage(Lcom/google/android/libraries/lens/lenslite/api/LinkImage;)V

    goto :goto_0

    :cond_1
    const-string p1, "LensAgent"

    const-string p2, "onNewImage: lens api not resume..."

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public onPause()V
    .locals 6

    iget-boolean v0, p0, Lcom/android/lens/LensAgent;->mInitialized:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-boolean v2, p0, Lcom/android/lens/LensAgent;->mIsResumed:Z

    if-eqz v2, :cond_1

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/lens/LensAgent;->mIsResumed:Z

    iget-object v2, p0, Lcom/android/lens/LensAgent;->mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    invoke-virtual {v2}, Lcom/google/android/libraries/lens/lenslite/LensliteApi;->onPause()V

    :cond_1
    const-string v2, "LensAgent"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "LensliteApi onPause cost "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "ms"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onResume()V
    .locals 6

    iget-boolean v0, p0, Lcom/android/lens/LensAgent;->mInitialized:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-boolean v2, p0, Lcom/android/lens/LensAgent;->mIsResumed:Z

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/android/lens/LensAgent;->mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    invoke-virtual {v2}, Lcom/google/android/libraries/lens/lenslite/LensliteApi;->onResume()V

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/lens/LensAgent;->mIsResumed:Z

    :cond_1
    const-string v2, "LensAgent"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "LensliteApi onResume cost "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "ms"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public release()V
    .locals 6

    iget-boolean v0, p0, Lcom/android/lens/LensAgent;->mInitialized:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/android/lens/LensAgent;->mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    invoke-virtual {v2}, Lcom/google/android/libraries/lens/lenslite/LensliteApi;->onStop()V

    const-string v2, "LensAgent"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "LensliteApi release cost "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "ms"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/lens/LensAgent;->mInitialized:Z

    return-void
.end method

.method public showOrHideChip(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/lens/LensAgent;->mInitialized:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/lens/LensAgent;->mLensliteApi:Lcom/google/android/libraries/lens/lenslite/LensliteApi;

    invoke-virtual {v0}, Lcom/google/android/libraries/lens/lenslite/LensliteApi;->getUiController()Lcom/google/android/libraries/lens/lenslite/LensliteUiController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/libraries/lens/lenslite/LensliteUiController;->setLensSuggestionsEnabled(Z)V

    return-void
.end method
