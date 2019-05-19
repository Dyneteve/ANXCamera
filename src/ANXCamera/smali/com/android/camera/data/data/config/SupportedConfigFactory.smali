.class public Lcom/android/camera/data/data/config/SupportedConfigFactory;
.super Ljava/lang/Object;
.source "SupportedConfigFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/data/data/config/SupportedConfigFactory$CloseElementTrigger;,
        Lcom/android/camera/data/data/config/SupportedConfigFactory$ClosableElement;,
        Lcom/android/camera/data/data/config/SupportedConfigFactory$ConfigItem;
    }
.end annotation


# static fields
.field public static final AI_DETECT:I = 0xf2

.field public static final AI_SCENE:I = 0xc9

.field public static final AUTO_ZOOM:I = 0xfd

.field public static final BACKLIGHT:I = 0xf9

.field public static final BEAUTY:I = 0xef

.field public static final BOKEH:I = 0xc8

.field public static final CLOSE_BY_AI:Ljava/lang/String; = "e"

.field public static final CLOSE_BY_BOKEH:Ljava/lang/String; = "f"

.field public static final CLOSE_BY_BURST_SHOOT:Ljava/lang/String; = "d"

.field public static final CLOSE_BY_FILTER:Ljava/lang/String; = "k"

.field public static final CLOSE_BY_GROUP:Ljava/lang/String; = "b"

.field public static final CLOSE_BY_HDR:Ljava/lang/String; = "g"

.field public static final CLOSE_BY_HHT:Ljava/lang/String; = "a"

.field public static final CLOSE_BY_MACRO_MODE:Ljava/lang/String; = "m"

.field public static final CLOSE_BY_SQUARE:Ljava/lang/String; = "l"

.field public static final CLOSE_BY_SUPER_RESOLUTION:Ljava/lang/String; = "c"

.field public static final CLOSE_BY_ULTRA_PIXEL:Ljava/lang/String; = "j"

.field public static final CLOSE_BY_ULTRA_WIDE:Ljava/lang/String; = "i"

.field public static final CLOSE_BY_VIDEO:Ljava/lang/String; = "h"

.field public static final DUAL_WATER_MARK:I = 0xf0

.field public static final EYE_LIGHT:I = 0xfe

.field public static final FAST:I = 0xe9

.field public static final FILTER:I = 0xc4

.field public static final FLASH:I = 0xc1

.field public static final FLASH_BLANK:I = 0xb1

.field public static final FLASH_DISABLE:I = 0xc11

.field public static final FOCUS_PEAK:I = 0xc7

.field public static final GENDER_AGE:I = 0xee

.field public static final GRADIENTER:I = 0xe5

.field public static final GROUP:I = 0xeb

.field public static final HAND_GESTURE:I = 0xfc

.field public static final HDR:I = 0xc2

.field public static final HFR:I = 0xca

.field public static final HHT:I = 0xe6

.field public static final INVALID:I = 0xb0

.field public static final LIGHTING:I = 0xcb

.field public static final LIVE_MUSIC_SELECT:I = 0xf5

.field public static final LIVE_SHOT:I = 0xce

.field public static final MACRO_MODE:I = 0xff

.field public static final MAGIC_FOCUS:I = 0xe7

.field public static final MAGIC_MIRROR:I = 0xec

.field public static final MIMOJI_EDIT:I = 0xfa

.field public static final MOON:I = 0xf6

.field public static final MORE:I = 0xc5

.field public static final MUTEX_MENU_CONFIGS:[I

.field public static final NEW_SLOW_MOTION:I = 0xcc

.field public static final NIGHT:I = 0xf7

.field public static final PORTRAIT:I = 0xc3

.field public static final RATIO:I = 0xd2

.field public static final RAW:I = 0xed

.field public static final SCENE:I = 0xea

.field public static final SETTING:I = 0xe1

.field public static final SHINE:I = 0xd4

.field public static final SILHOUETTE:I = 0xf8

.field public static final SLOW:I = 0xe8

.field public static final SQUARE:I = 0xd3

.field public static final SUPER_RESOLUTION:I = 0xf1

.field public static final TILT:I = 0xe4

.field public static final TIMER:I = 0xe2

.field public static final ULTRA_PIXEL:I = 0xd1

.field public static final ULTRA_WIDE:I = 0xcd

.field public static final ULTRA_WIDE_BOKEH:I = 0xcf

.field public static final USER_DEFINE_WATER_MARK:I = 0xf4

.field public static final VIDEO_BOKEH:I = 0xf3


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0xd

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/camera/data/data/config/SupportedConfigFactory;->MUTEX_MENU_CONFIGS:[I

    return-void

    :array_0
    .array-data 4
        0xe5
        0xec
        0xeb
        0xe4
        0xe6
        0xf1
        0xea
        0xc3
        0xee
        0xc7
        0xcb
        0xce
        0xd1
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;
    .locals 1

    new-instance v0, Lcom/android/camera/data/data/config/TopConfigItem;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/config/TopConfigItem;-><init>(I)V

    return-object v0
.end method

.method private static createConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;
    .locals 1

    new-instance v0, Lcom/android/camera/data/data/config/TopConfigItem;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/data/data/config/TopConfigItem;-><init>(II)V

    return-object v0
.end method

.method public static getConfigKey(I)Ljava/lang/String;
    .locals 1

    sparse-switch p0, :sswitch_data_0

    new-instance p0, Ljava/lang/RuntimeException;

    const-string v0, "unknown config item"

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    :sswitch_0
    const-string p0, "pref_camera_auto_zoom"

    return-object p0

    :sswitch_1
    const-string p0, "pref_hand_gesture"

    return-object p0

    :sswitch_2
    const-string p0, "pref_camera_super_resolution_key"

    return-object p0

    :sswitch_3
    const-string p0, "pref_camera_show_gender_age_key"

    return-object p0

    :sswitch_4
    const-string p0, "pref_camera_magic_mirror_key"

    return-object p0

    :sswitch_5
    const-string p0, "pref_camera_groupshot_mode_key"

    return-object p0

    :sswitch_6
    const-string p0, "pref_camera_scenemode_setting_key"

    return-object p0

    :sswitch_7
    const-string p0, "pref_camera_hand_night_key"

    return-object p0

    :sswitch_8
    const-string p0, "pref_camera_gradienter_key"

    return-object p0

    :sswitch_9
    const-string p0, "pref_camera_tilt_shift_mode"

    return-object p0

    :sswitch_a
    const-string p0, "pref_ultra_pixel"

    return-object p0

    :sswitch_b
    const-string p0, "pref_live_shot_enabled"

    return-object p0

    :sswitch_c
    const-string p0, "pref_camera_ai_scene_mode_key"

    return-object p0

    :sswitch_d
    const-string p0, "pref_camera_peak_key"

    return-object p0

    :sswitch_e
    const-string p0, "pref_camera_portrait_mode_key"

    return-object p0

    :sswitch_data_0
    .sparse-switch
        0xc3 -> :sswitch_e
        0xc7 -> :sswitch_d
        0xc9 -> :sswitch_c
        0xce -> :sswitch_b
        0xd1 -> :sswitch_a
        0xe4 -> :sswitch_9
        0xe5 -> :sswitch_8
        0xe6 -> :sswitch_7
        0xea -> :sswitch_6
        0xeb -> :sswitch_5
        0xec -> :sswitch_4
        0xee -> :sswitch_3
        0xf1 -> :sswitch_2
        0xfc -> :sswitch_1
        0xfd -> :sswitch_0
    .end sparse-switch
.end method

.method public static final getSupportedExtraConfigs(IILcom/android/camera/data/cloud/DataCloud$CloudFeature;Lcom/android/camera2/CameraCapabilities;Z)Lcom/android/camera/data/data/config/SupportedConfigs;
    .locals 9

    new-instance v0, Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-direct {v0}, Lcom/android/camera/data/data/config/SupportedConfigs;-><init>()V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v2

    const/16 v3, 0xff

    const/16 v4, 0xfc

    const/16 v5, 0xec

    const/16 v6, 0xee

    const/16 v7, 0xe2

    const/16 v8, 0xe1

    packed-switch p0, :pswitch_data_0

    :pswitch_0
    invoke-virtual {v0, v8}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p3

    invoke-virtual {p3, v7}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    const/16 p3, 0xd3

    invoke-virtual {v0, p3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    const/16 p3, 0xd1

    const/16 v2, 0xeb

    const/16 v7, 0xa5

    packed-switch p1, :pswitch_data_1

    goto/16 :goto_1

    :pswitch_1
    invoke-virtual {v0, v8}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p0

    invoke-virtual {p0, v7}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    goto/16 :goto_2

    :pswitch_2
    invoke-virtual {v0, v8}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p0

    invoke-virtual {p0, v7}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    const/4 p0, 0x1

    if-ne p1, p0, :cond_11

    invoke-virtual {v2}, Lcom/mi/config/a;->gB()Z

    move-result p0

    if-eqz p0, :cond_11

    invoke-static {}, Lcom/mi/config/b;->gP()Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-static {}, Lcom/mi/config/b;->gO()Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-virtual {v0, v6}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    :cond_0
    invoke-static {}, Lcom/mi/config/b;->hQ()Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-virtual {v0, v5}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    :cond_1
    invoke-static {}, Lcom/mi/config/b;->ge()Z

    move-result p0

    if-eqz p0, :cond_11

    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    goto/16 :goto_2

    :pswitch_3
    invoke-virtual {v0, v8}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p0

    invoke-virtual {p0, v7}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    goto/16 :goto_2

    :pswitch_4
    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {v0, v8}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p0

    const/16 p1, 0xe9

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-static {}, Lcom/mi/config/b;->he()Z

    move-result p0

    if-eqz p0, :cond_3

    invoke-virtual {v2}, Lcom/mi/config/a;->fC()Z

    move-result p0

    if-nez p0, :cond_3

    const/16 p0, 0xe8

    invoke-virtual {v0, p0}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    :cond_3
    if-eqz p4, :cond_4

    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportMacroMode()Z

    move-result p0

    if-eqz p0, :cond_4

    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    :cond_4
    :goto_0
    goto/16 :goto_2

    :pswitch_5
    if-nez p1, :cond_11

    invoke-virtual {p3}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result p0

    if-eqz p0, :cond_11

    invoke-virtual {v0, v8}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    goto/16 :goto_2

    :pswitch_6
    if-eqz p4, :cond_5

    invoke-static {}, Lcom/mi/config/b;->id()Z

    move-result p1

    if-eqz p1, :cond_5

    if-eq p0, v7, :cond_5

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    :cond_5
    const/16 p1, 0xa3

    if-eq p0, v7, :cond_6

    if-ne p0, p1, :cond_10

    :cond_6
    invoke-static {}, Lcom/mi/config/b;->gP()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-static {}, Lcom/mi/config/b;->gO()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual {v0, v6}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    :cond_7
    invoke-static {}, Lcom/mi/config/b;->hQ()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-virtual {v0, v5}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    :cond_8
    if-eqz p4, :cond_9

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->supportUltraPixel()Z

    move-result p4

    if-eqz p4, :cond_9

    invoke-virtual {v0, p3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    :cond_9
    if-ne p0, p1, :cond_10

    invoke-static {}, Lcom/mi/config/b;->ge()Z

    move-result p0

    if-eqz p0, :cond_10

    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    goto :goto_1

    :pswitch_7
    invoke-static {}, Lcom/mi/config/b;->hL()Z

    move-result p1

    if-eqz p1, :cond_a

    const/16 p1, 0xe4

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    :cond_a
    invoke-static {}, Lcom/mi/config/b;->hE()Z

    move-result p1

    if-eqz p1, :cond_b

    const/16 p1, 0xe5

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    :cond_b
    invoke-static {}, Lcom/mi/config/b;->hl()Z

    move-result p1

    if-eqz p1, :cond_c

    const/16 p1, 0xea

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    :cond_c
    if-eq p0, v7, :cond_d

    if-eqz p4, :cond_d

    invoke-static {}, Lcom/mi/config/b;->id()Z

    move-result p0

    if-eqz p0, :cond_d

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    :cond_d
    if-eqz p4, :cond_e

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/android/camera/CameraSettings;->checkLensAvailability(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_e

    const/16 p0, 0xf2

    invoke-virtual {v0, p0}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    :cond_e
    if-eqz p4, :cond_f

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->supportUltraPixel()Z

    move-result p0

    if-eqz p0, :cond_f

    invoke-virtual {v0, p3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    :cond_f
    if-eqz p4, :cond_10

    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportMacroMode()Z

    move-result p0

    if-eqz p0, :cond_10

    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    :cond_10
    :goto_1
    nop

    :cond_11
    :goto_2
    invoke-interface {p2, v0}, Lcom/android/camera/data/cloud/DataCloud$CloudFeature;->filterFeature(Lcom/android/camera/data/data/config/SupportedConfigs;)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
    .end packed-switch
.end method

.method public static final getSupportedTopConfigs(IILcom/android/camera2/CameraCapabilities;Z)Lcom/android/camera/data/data/config/SupportedConfigs;
    .locals 12

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v2

    invoke-virtual {v0, p0, p1, p2}, Lcom/android/camera/data/data/config/DataItemConfig;->reInitComponent(IILcom/android/camera2/CameraCapabilities;)V

    invoke-virtual {v1, p0, p1, p2}, Lcom/android/camera/data/data/runing/DataItemRunning;->reInitComponent(IILcom/android/camera2/CameraCapabilities;)V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->supportFlash()Z

    move-result v4

    if-eqz v4, :cond_0

    const/16 v4, 0xc1

    invoke-static {v4}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    const/16 v4, 0xce

    const/16 v5, 0xc8

    const/16 v6, 0xc9

    const/16 v7, 0xf3

    const/16 v8, 0xc2

    const/16 v9, 0xc5

    const/16 v10, 0x11

    const/16 v11, 0xe1

    packed-switch p0, :pswitch_data_0

    :pswitch_0
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->supportHdr()Z

    move-result p0

    if-eqz p0, :cond_19

    invoke-static {v8}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_1
    invoke-static {v11}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :pswitch_2
    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->supportTopShineEntry()Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningShine()Lcom/android/camera/data/data/runing/ComponentRunningShine;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->getTopConfigItem()I

    move-result p0

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :pswitch_3
    if-eqz p3, :cond_2

    if-eqz p1, :cond_2

    invoke-virtual {v2}, Lcom/mi/config/a;->fm()Z

    move-result p0

    if-eqz p0, :cond_2

    invoke-static {v7}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    const/16 p0, 0xf5

    invoke-static {p0, v10}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {v11}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :pswitch_4
    invoke-static {v11}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :pswitch_5
    const/16 p0, 0xcc

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {v11}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :pswitch_6
    invoke-virtual {v2}, Lcom/mi/config/a;->isSupportUltraWide()Z

    move-result p0

    if-eqz p0, :cond_3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedOpticalZoom()Z

    move-result p0

    if-eqz p0, :cond_3

    if-nez p1, :cond_3

    if-eqz p3, :cond_3

    const/16 p0, 0xcf

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->supportAi()Z

    move-result p0

    if-eqz p0, :cond_4

    invoke-static {v6, v10}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->supportTopShineEntry()Z

    move-result p0

    if-eqz p0, :cond_5

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningShine()Lcom/android/camera/data/data/runing/ComponentRunningShine;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->getTopConfigItem()I

    move-result p0

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_5
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :pswitch_7
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getManuallyFocus()Lcom/android/camera/data/data/config/ComponentManuallyFocus;

    move-result-object p1

    invoke-static {}, Lcom/mi/config/b;->hA()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p1, p0}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p0}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->getDefaultValue(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6

    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isAFRegionSupported()Z

    move-result p0

    if-eqz p0, :cond_6

    const/16 p0, 0xc7

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_6
    if-eqz p3, :cond_7

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->supportUltraPixel()Z

    move-result p0

    if-eqz p0, :cond_7

    const/16 p0, 0xd1

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_7
    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->supportTopShineEntry()Z

    move-result p0

    if-eqz p0, :cond_8

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningShine()Lcom/android/camera/data/data/runing/ComponentRunningShine;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->getTopConfigItem()I

    move-result p0

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_8
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :pswitch_8
    invoke-interface {v3}, Ljava/util/List;->clear()V

    invoke-static {v11}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :pswitch_9
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->supportHdr()Z

    move-result p0

    if-eqz p0, :cond_9

    invoke-static {v8}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_9
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->supportAi()Z

    move-result p0

    if-eqz p0, :cond_a

    invoke-static {v6}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_a
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->supportBokeh()Z

    move-result p0

    if-eqz p0, :cond_b

    invoke-static {v5}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_b
    invoke-virtual {v2}, Lcom/mi/config/a;->fL()Z

    move-result p0

    if-eqz p0, :cond_c

    if-eqz p3, :cond_c

    invoke-static {v4}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_c
    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->supportTopShineEntry()Z

    move-result p0

    if-eqz p0, :cond_d

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningShine()Lcom/android/camera/data/data/runing/ComponentRunningShine;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->getTopConfigItem()I

    move-result p0

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_d
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :pswitch_a
    if-nez p1, :cond_14

    invoke-static {}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->isSupportedAutoZoom()Z

    move-result p0

    if-eqz p0, :cond_e

    if-eqz p3, :cond_e

    const/16 p0, 0xfd

    invoke-static {p0, v10}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_e
    if-nez p3, :cond_10

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->supportTopShineEntry()Z

    move-result p0

    if-eqz p0, :cond_f

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningShine()Lcom/android/camera/data/data/runing/ComponentRunningShine;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->getTopConfigItem()I

    move-result p0

    invoke-static {p0, v10}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_f
    invoke-static {v11}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_10
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->supportHdr()Z

    move-result p0

    if-eqz p0, :cond_11

    invoke-static {v8}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_11
    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->supportTopShineEntry()Z

    move-result p0

    if-eqz p0, :cond_12

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningShine()Lcom/android/camera/data/data/runing/ComponentRunningShine;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->getTopConfigItem()I

    move-result p0

    invoke-static {p0, v10}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_12
    invoke-virtual {v2}, Lcom/mi/config/a;->fC()Z

    move-result p0

    if-nez p0, :cond_13

    invoke-static {}, Lcom/mi/config/b;->he()Z

    move-result p0

    if-eqz p0, :cond_13

    invoke-static {}, Lcom/mi/config/b;->it()Z

    move-result p0

    if-eqz p0, :cond_13

    const/16 p0, 0xca

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_13
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_14
    if-eqz p3, :cond_15

    const/16 p1, 0xa2

    if-ne p0, p1, :cond_15

    invoke-virtual {v2}, Lcom/mi/config/a;->fm()Z

    move-result p0

    if-eqz p0, :cond_15

    invoke-static {v7}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_15
    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->supportTopShineEntry()Z

    move-result p0

    if-eqz p0, :cond_16

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningShine()Lcom/android/camera/data/data/runing/ComponentRunningShine;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->getTopConfigItem()I

    move-result p0

    invoke-static {p0, v10}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_16
    invoke-static {v11}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :pswitch_b
    if-eqz p3, :cond_17

    if-eqz p1, :cond_17

    invoke-virtual {v2}, Lcom/mi/config/a;->fm()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-static {v7}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_17
    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->supportTopShineEntry()Z

    move-result p0

    if-eqz p0, :cond_18

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningShine()Lcom/android/camera/data/data/runing/ComponentRunningShine;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->getTopConfigItem()I

    move-result p0

    invoke-static {p0, v10}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_18
    invoke-static {v11}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_19
    :goto_0
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->supportAi()Z

    move-result p0

    if-eqz p0, :cond_1a

    invoke-static {v6}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1a
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->supportBokeh()Z

    move-result p0

    if-eqz p0, :cond_1b

    invoke-static {v5}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1b
    invoke-virtual {v2}, Lcom/mi/config/a;->fL()Z

    move-result p0

    if-eqz p0, :cond_1c

    if-eqz p3, :cond_1c

    invoke-static {v4}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1c
    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->supportTopShineEntry()Z

    move-result p0

    if-eqz p0, :cond_1d

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningShine()Lcom/android/camera/data/data/runing/ComponentRunningShine;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->getTopConfigItem()I

    move-result p0

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1d
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    nop

    :goto_1
    invoke-static {v3}, Lcom/android/camera/data/data/config/TopViewPositionArray;->fillNotUseViewPosition(Ljava/util/List;)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p0

    return-object p0

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_b
        :pswitch_a
        :pswitch_0
        :pswitch_0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_8
        :pswitch_1
    .end packed-switch
.end method

.method public static isMutexConfig(I)Z
    .locals 5

    sget-object v0, Lcom/android/camera/data/data/config/SupportedConfigFactory;->MUTEX_MENU_CONFIGS:[I

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget v4, v0, v3

    if-ne v4, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method private static isSupportedAutoZoom()Z
    .locals 1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fJ()Z

    move-result v0

    return v0
.end method
