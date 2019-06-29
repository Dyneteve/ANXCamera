.class public Lcom/android/camera/fragment/beauty/MiBeauty;
.super Ljava/lang/Object;
.source "MiBeauty.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/beauty/MiBeauty$BeautyMenuType;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final BACK_BEAUTY_MENU_TYPE:I = 0xa2

.field public static final FRONT_BEAUTY_MENU_TYPE:I = 0xa1

.field public static final LIVE_BEAUTY_MENU_TYPE:I = 0xa3

.field public static final LIVE_SPEED_MENU_TYPE:I = 0xa5

.field public static final LIVE_STICKER_MENU_TYPE:I = 0xa4

.field public static final MIMOJI_MENU_TYPE:I = 0xa6

.field public static final NONE_MENU_TYPE:I = 0xa0


# instance fields
.field public mBeautyBusiness:Lcom/android/camera/fragment/beauty/AbBeautyFragmentBusiness;

.field private mBeautyFragmentManager:Lcom/android/camera/fragment/beauty/BeautyFragmentManager;

.field private mBeautySettingManager:Lcom/android/camera/fragment/beauty/BeautySettingManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
