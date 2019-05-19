.class public Lcom/android/camera/data/data/global/DataItemGlobal;
.super Lcom/android/camera/data/data/DataItemBase;
.source "DataItemGlobal.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/data/data/global/DataItemGlobal$IntentType;
    }
.end annotation


# static fields
.field public static final CTA_CAN_CONNECT_NETWORK_BY_IMPUNITY:Ljava/lang/String; = "can_connect_network"

.field public static final DATA_COMMON_AI_SCENE_HINT:Ljava/lang/String; = "pref_camera_first_ai_scene_use_hint_shown_key"

.field public static final DATA_COMMON_CURRENT_CAMERA_ID:Ljava/lang/String; = "pref_camera_id_key"

.field public static final DATA_COMMON_CURRENT_MODE:Ljava/lang/String; = "pref_camera_mode_key_intent_"

.field public static final DATA_COMMON_CUSTOM_WATERMARK_VERSION:Ljava/lang/String; = "pref_custom_watermark_version"

.field public static final DATA_COMMON_DEVICE_WATERMARK:Ljava/lang/String; = "pref_dualcamera_watermark"

.field public static final DATA_COMMON_DUALCAMERA_USERDEFINE_WATERMARK:Ljava/lang/String; = "user_define_watermark"

.field public static final DATA_COMMON_FOCUS_SHOOT:Ljava/lang/String; = "pref_camera_focus_shoot_key"

.field public static final DATA_COMMON_FRONT_CAM_ROTATE_HINT:Ljava/lang/String; = "pref_front_camera_first_use_hint_shown_key"

.field private static final DATA_COMMON_OPEN_TIME:Ljava/lang/String; = "pref_camera_open_time"

.field public static final DATA_COMMON_PORTRAIT_HINT:Ljava/lang/String; = "pref_camera_first_portrait_use_hint_shown_key"

.field public static final DATA_COMMON_TIME_WATER_MARK:Ljava/lang/String; = "pref_watermark_key"

.field public static final DATA_COMMON_ULTRA_WIDE_HINT:Ljava/lang/String; = "pref_camera_first_ultra_wide_use_hint_shown_key"

.field public static final DATA_COMMON_ULTRA_WIDE_SAT_HINT:Ljava/lang/String; = "pref_camera_first_ultra_wide_sat_use_hint_shown_key"

.field public static final INTENT_TYPE_IMAGE:I = 0x1

.field public static final INTENT_TYPE_NORMAL:I = 0x0

.field public static final INTENT_TYPE_SCAN_QR:I = 0x3

.field public static final INTENT_TYPE_UNSPECIFIED:I = -0x1

.field public static final INTENT_TYPE_VIDEO:I = 0x2

.field public static final INTENT_TYPE_VOICE_CONTROL:I = 0x4

.field public static final KEY:Ljava/lang/String; = "camera_settings_global"

.field private static final TAG:Ljava/lang/String; = "DataItemGlobal"


# instance fields
.field private mDataItemFeature:Lcom/mi/config/a;

.field private mIntentType:I

.field private mIsForceMainBackCamera:Z

.field private mIsTimeOut:Ljava/lang/Boolean;

.field private mLastCameraId:I

.field private mManuallyRaw:Lcom/android/camera/data/data/global/ComponentGlobalRaw;

.field private mModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

.field private mRetriedIfCameraError:Z

.field private mStartFromKeyguard:Z


# direct methods
.method public constructor <init>(Lcom/mi/config/a;)V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/data/data/DataItemBase;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    iput-object p1, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mDataItemFeature:Lcom/mi/config/a;

    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result p1

    iput p1, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mLastCameraId:I

    new-instance p1, Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-direct {p1, p0}, Lcom/android/camera/data/data/global/ComponentModuleList;-><init>(Lcom/android/camera/data/data/global/DataItemGlobal;)V

    iput-object p1, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    return-void
.end method

.method private determineTimeOut()Z
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->isActualTimeOut()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->retainCameraMode()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    :cond_0
    return v0
.end method

.method private getCurrentCameraId(I)I
    .locals 2

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    const-string v0, "pref_camera_id_key"

    invoke-direct {p0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDefaultCameraId(I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1

    :pswitch_1
    const/4 p1, 0x1

    return p1

    :pswitch_2
    iget-object v1, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mDataItemFeature:Lcom/mi/config/a;

    invoke-virtual {v1}, Lcom/mi/config/a;->gB()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v0, "pref_camera_id_key"

    invoke-direct {p0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDefaultCameraId(I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1

    :cond_0
    return v0

    :pswitch_3
    return v0

    :pswitch_data_0
    .packed-switch 0xa6
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_3
        :pswitch_1
    .end packed-switch
.end method

.method private getCurrentMode(I)I
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "pref_camera_mode_key_intent_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDefaultMode(I)I

    move-result p1

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getInt(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method private getCurrentModeForFrontCamera(I)I
    .locals 2

    invoke-direct {p0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode(I)I

    move-result p1

    const/16 v0, 0xa3

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    goto :goto_1

    :pswitch_1
    iget-object v1, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mDataItemFeature:Lcom/mi/config/a;

    invoke-virtual {v1}, Lcom/mi/config/a;->gB()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :pswitch_2
    const/16 p1, 0xa2

    goto :goto_1

    :pswitch_3
    nop

    nop

    :goto_0
    move p1, v0

    :cond_0
    :goto_1
    return p1

    :pswitch_data_0
    .packed-switch 0xa6
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method private getDefaultCameraId(I)I
    .locals 0

    nop

    const/4 p1, 0x0

    return p1
.end method

.method private isActualTimeOut()Z
    .locals 4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-string v2, "pref_camera_open_time"

    invoke-virtual {p0, v2, v0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x7530

    cmp-long v0, v0, v2

    if-gtz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIsTimeOut:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method


# virtual methods
.method public getCTACanCollect()Z
    .locals 2

    const-string v0, "can_connect_network"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public getComponentModuleList()Lcom/android/camera/data/data/global/ComponentModuleList;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    return-object v0
.end method

.method public getCurrentCameraId()I
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId(I)I

    move-result v0

    return v0
.end method

.method public getCurrentMode()I
    .locals 1

    iget v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    invoke-direct {p0, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode(I)I

    move-result v0

    return v0
.end method

.method public getDataBackUpKey(I)I
    .locals 1

    const/16 v0, 0xa5

    if-ne p1, v0, :cond_0

    invoke-static {p1}, Lcom/android/camera/data/data/global/ComponentModuleList;->getTransferredMode(I)I

    move-result p1

    :cond_0
    iget v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    add-int/lit8 v0, v0, 0x2

    shl-int/lit8 v0, v0, 0x8

    or-int/2addr p1, v0

    iget-boolean v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mStartFromKeyguard:Z

    if-eqz v0, :cond_1

    const/high16 v0, 0x10000

    or-int/2addr p1, v0

    :cond_1
    return p1
.end method

.method public getDefaultMode(I)I
    .locals 1

    const/16 v0, 0xa3

    packed-switch p1, :pswitch_data_0

    return v0

    :pswitch_0
    const/16 p1, 0xa2

    return p1

    :pswitch_1
    return v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getGlobalRaw()Lcom/android/camera/data/data/global/ComponentGlobalRaw;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mManuallyRaw:Lcom/android/camera/data/data/global/ComponentGlobalRaw;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/camera/data/data/global/ComponentGlobalRaw;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/global/ComponentGlobalRaw;-><init>(Lcom/android/camera/data/data/global/DataItemGlobal;)V

    iput-object v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mManuallyRaw:Lcom/android/camera/data/data/global/ComponentGlobalRaw;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mManuallyRaw:Lcom/android/camera/data/data/global/ComponentGlobalRaw;

    return-object v0
.end method

.method public getIntentType()I
    .locals 1

    iget v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    return v0
.end method

.method public getLastCameraId()I
    .locals 1

    iget v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mLastCameraId:I

    return v0
.end method

.method public getStartFromKeyguard()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mStartFromKeyguard:Z

    return v0
.end method

.method public getTempRatioGlobal(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public isFirstShowCTAConCollect()Z
    .locals 1

    const-string v0, "can_connect_network"

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->contains(Ljava/lang/String;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isForceMainBackCamera()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIsForceMainBackCamera:Z

    return v0
.end method

.method public isGlobalSwitchOn(Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method public isIntentAction()Z
    .locals 1

    iget v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isNormalIntent()Z
    .locals 1

    iget v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isRetriedIfCameraError()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mRetriedIfCameraError:Z

    return v0
.end method

.method public isTimeOut()Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIsTimeOut:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIsTimeOut:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isTransient()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public matchCustomWatermarkVersion()Z
    .locals 8

    iget-object v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mDataItemFeature:Lcom/mi/config/a;

    invoke-virtual {v0}, Lcom/mi/config/a;->gF()Ljava/lang/String;

    move-result-object v0

    const-string v1, "pref_custom_watermark_version"

    invoke-virtual {p0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->contains(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mDataItemFeature:Lcom/mi/config/a;

    const-string v1, "c_0x40"

    invoke-virtual {v0, v1}, Lcom/mi/config/a;->K(Ljava/lang/String;)Z

    move-result v0

    xor-int/2addr v0, v2

    return v0

    :cond_0
    const-string v1, "pref_custom_watermark_version"

    invoke-virtual {p0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->arrayMapContainsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "pref_custom_watermark_version"

    invoke-virtual {p0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->arrayMapRemove(Ljava/lang/String;)V

    :cond_1
    const-string v1, "pref_custom_watermark_version"

    const-string v3, ""

    invoke-virtual {p0, v1, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v3, 0x3a

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    const/4 v4, 0x0

    if-lez v3, :cond_2

    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    add-int/2addr v3, v2

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Lcom/mi/config/b;->qn:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/mi/config/b;->getGivenName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    return v2

    :cond_2
    const-string v0, "DataItemGlobal"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mismatch custom watermark version: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v4
.end method

.method public parseIntent(Landroid/content/Intent;Ljava/lang/Boolean;ZZZ)Landroid/support/v4/util/Pair;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            "Ljava/lang/Boolean;",
            "ZZZ)",
            "Landroid/support/v4/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->setForceMainBackCamera(Z)V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->fu()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->isScreenSlideOff(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCameraId(I)V

    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    const-string v1, "<unknown>"

    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, -0x1

    const/4 v6, 0x1

    sparse-switch v2, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v2, "com.android.camera.action.QR_CODE_CAPTURE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    move v2, v4

    goto :goto_1

    :sswitch_1
    const-string v2, "android.media.action.VIDEO_CAMERA"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v2, 0x5

    goto :goto_1

    :sswitch_2
    const-string v2, "android.media.action.VIDEO_CAPTURE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    move v2, v6

    goto :goto_1

    :sswitch_3
    const-string v2, "android.media.action.STILL_IMAGE_CAMERA"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v2, 0x4

    goto :goto_1

    :sswitch_4
    const-string v2, "com.google.zxing.client.android.SCAN"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    move v2, v3

    goto :goto_1

    :sswitch_5
    const-string v2, "android.media.action.VOICE_COMMAND"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v2, 0x6

    goto :goto_1

    :sswitch_6
    const-string v2, "android.media.action.IMAGE_CAPTURE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    move v2, v0

    goto :goto_1

    :cond_2
    :goto_0
    move v2, v5

    :goto_1
    packed-switch v2, :pswitch_data_0

    nop

    :goto_2
    move v3, v0

    goto/16 :goto_5

    :pswitch_0
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-nez p2, :cond_3

    nop

    goto :goto_2

    :cond_3
    :pswitch_1
    nop

    invoke-static {p1}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->getCameraModeId()I

    move-result p2

    const/16 p4, 0xa0

    if-ne p2, p4, :cond_5

    invoke-direct {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->determineTimeOut()Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDefaultMode(I)I

    move-result p2

    goto :goto_3

    :cond_4
    invoke-direct {p0, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode(I)I

    move-result p2

    :cond_5
    :goto_3
    :try_start_0
    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->isUseFrontCamera()Z

    move-result p4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    nop

    move p1, p4

    goto :goto_4

    :catch_0
    move-exception p4

    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->isOnlyForceOpenMainBackCamera()Z

    move-result p1

    if-eqz p1, :cond_6

    nop

    invoke-virtual {p0, v6}, Lcom/android/camera/data/data/global/DataItemGlobal;->setForceMainBackCamera(Z)V

    move p1, v0

    goto :goto_4

    :cond_6
    invoke-direct {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->determineTimeOut()Z

    move-result p1

    if-eqz p1, :cond_7

    invoke-direct {p0, p2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDefaultCameraId(I)I

    move-result p1

    goto :goto_4

    :cond_7
    invoke-direct {p0, p2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId(I)I

    move-result p1

    :goto_4
    const-string p4, "DataItemGlobal"

    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "intent from voice control assist : pendingOpenId = "

    invoke-virtual {p5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ";pendingOpenModule = "

    invoke-virtual {p5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-static {p4, p5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    iput-boolean p3, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mStartFromKeyguard:Z

    iget-object p3, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    iget p4, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    invoke-virtual {p3, p4}, Lcom/android/camera/data/data/global/ComponentModuleList;->setIntentType(I)V

    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result p3

    if-eq p2, p3, :cond_8

    invoke-virtual {p0, p2}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    invoke-static {p2}, Lcom/android/camera/module/ModuleManager;->setActiveModuleIndex(I)V

    :cond_8
    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result p3

    if-eq p1, p3, :cond_9

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCameraId(I)V

    :cond_9
    new-instance p3, Landroid/support/v4/util/Pair;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-direct {p3, p1, p2}, Landroid/support/v4/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p3

    :pswitch_2
    nop

    goto :goto_5

    :pswitch_3
    nop

    nop

    move v3, v4

    goto :goto_5

    :pswitch_4
    nop

    nop

    move v3, v6

    :goto_5
    invoke-static {p1}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->getCameraFacing()I

    move-result p1

    if-eq p1, v5, :cond_a

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCameraIdTransient(I)V

    :cond_a
    if-eqz p5, :cond_b

    invoke-direct {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->determineTimeOut()Z

    move-result p2

    if-eqz p2, :cond_b

    move p2, v6

    goto :goto_6

    :cond_b
    nop

    move p2, v0

    :goto_6
    iget p5, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    if-ne p5, v3, :cond_d

    iget-boolean p5, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mStartFromKeyguard:Z

    if-eq p5, p3, :cond_c

    goto :goto_7

    :cond_c
    goto :goto_8

    :cond_d
    :goto_7
    move v0, v6

    :goto_8
    const/16 p5, 0xa3

    if-eqz v0, :cond_e

    const-string v2, "android.media.action.STILL_IMAGE_CAMERA"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    nop

    invoke-direct {p0, p5}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId(I)I

    move-result p1

    :goto_9
    move v1, p1

    move p1, p5

    goto :goto_d

    :cond_e
    if-eqz v0, :cond_f

    const-string v2, "android.media.action.VIDEO_CAMERA"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    const/16 p5, 0xa2

    invoke-direct {p0, p5}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId(I)I

    move-result p1

    goto :goto_9

    :cond_f
    if-eqz p2, :cond_11

    invoke-virtual {p0, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDefaultMode(I)I

    move-result v1

    if-gez p1, :cond_10

    invoke-direct {p0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDefaultCameraId(I)I

    move-result p1

    goto :goto_a

    :cond_10
    invoke-direct {p0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId(I)I

    move-result p1

    :goto_a
    move v7, v1

    move v1, p1

    move p1, v7

    goto :goto_c

    :cond_11
    if-eq p1, v6, :cond_12

    invoke-direct {p0, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode(I)I

    move-result p1

    goto :goto_b

    :cond_12
    invoke-direct {p0, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentModeForFrontCamera(I)I

    move-result p1

    :goto_b
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId(I)I

    move-result v1

    :goto_c
    invoke-direct {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->isActualTimeOut()Z

    move-result v2

    if-eqz v2, :cond_14

    const/16 v2, 0xa5

    const/4 v4, 0x0

    if-ne p1, v2, :cond_13

    const-string p1, "SQUARE"

    invoke-virtual {p0, p1, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->setTempRatioGlobal(Ljava/lang/String;Ljava/lang/String;)V

    nop

    move p1, p5

    :cond_13
    if-ne p1, p5, :cond_14

    const-string p5, "1x1"

    const-string v2, "SQUARE"

    invoke-virtual {p0, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getTempRatioGlobal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_14

    const-string p5, "SQUARE"

    invoke-virtual {p0, p5, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->setTempRatioGlobal(Ljava/lang/String;Ljava/lang/String;)V

    :cond_14
    :goto_d
    if-nez p4, :cond_17

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIsTimeOut:Ljava/lang/Boolean;

    if-eqz v0, :cond_15

    iput v3, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    iput-boolean p3, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mStartFromKeyguard:Z

    iget-object p2, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    iget p3, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    invoke-virtual {p2, p3}, Lcom/android/camera/data/data/global/ComponentModuleList;->setIntentType(I)V

    :cond_15
    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result p2

    if-eq p1, p2, :cond_16

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    invoke-static {p1}, Lcom/android/camera/module/ModuleManager;->setActiveModuleIndex(I)V

    :cond_16
    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result p2

    if-eq v1, p2, :cond_17

    invoke-virtual {p0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCameraId(I)V

    :cond_17
    new-instance p2, Landroid/support/v4/util/Pair;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-direct {p2, p3, p1}, Landroid/support/v4/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p2

    nop

    :sswitch_data_0
    .sparse-switch
        -0x74de9aed -> :sswitch_6
        -0x5b1e1211 -> :sswitch_5
        -0x566ad1d3 -> :sswitch_4
        0x1ba9c1af -> :sswitch_3
        0x29c9b033 -> :sswitch_2
        0x43680478 -> :sswitch_1
        0x4c4c1b77 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public provideKey()Ljava/lang/String;
    .locals 1

    const-string v0, "camera_settings_global"

    return-object v0
.end method

.method public reInit()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/ComponentModuleList;->reInit()V

    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIsTimeOut:Ljava/lang/Boolean;

    const-string v1, "pref_camera_open_time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    const-string v1, "open_camera_fail_key"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId(I)I

    move-result v1

    iput v1, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mLastCameraId:I

    const-string v2, "pref_camera_id_key"

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    return-void
.end method

.method public resetAll()V
    .locals 3

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIsTimeOut:Ljava/lang/Boolean;

    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->clear()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_version_key"

    const/4 v2, 0x4

    invoke-interface {v0, v1, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    return-void
.end method

.method public resetTimeOut()V
    .locals 4

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIsTimeOut:Ljava/lang/Boolean;

    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_camera_open_time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    return-void
.end method

.method public setCTACanCollect(Z)V
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "can_connect_network"

    invoke-interface {v0, v1, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    return-void
.end method

.method public setCameraId(I)V
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mLastCameraId:I

    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_camera_id_key"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    return-void
.end method

.method public setCameraIdTransient(I)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mLastCameraId:I

    const-string v0, "pref_camera_id_key"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    return-void
.end method

.method public setCurrentMode(I)V
    .locals 3

    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pref_camera_mode_key_intent_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    return-void
.end method

.method public setForceMainBackCamera(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIsForceMainBackCamera:Z

    return-void
.end method

.method public setRetriedIfCameraError(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mRetriedIfCameraError:Z

    return-void
.end method

.method public setStartFromKeyguard(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mStartFromKeyguard:Z

    return-void
.end method

.method public setTempRatioGlobal(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    return-void
.end method

.method public updateCustomWatermarkVersion()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mDataItemFeature:Lcom/mi/config/a;

    invoke-virtual {v0}, Lcom/mi/config/a;->gF()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/mi/config/b;->qn:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/mi/config/b;->getGivenName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    const-string v2, "pref_custom_watermark_version"

    invoke-interface {v1, v2, v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    const-string v1, "DataItemGlobal"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "custom watermark version updated: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
