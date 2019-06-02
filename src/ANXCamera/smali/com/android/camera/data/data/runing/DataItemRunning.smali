.class public Lcom/android/camera/data/data/runing/DataItemRunning;
.super Lcom/android/camera/data/data/DataItemBase;
.source "DataItemRunning.java"


# static fields
.field public static final DATA_RUNING_HAND_GESTURE:Ljava/lang/String; = "pref_hand_gesture"

.field public static final DATA_RUNING_HAND_GESTURE_STATUS:Ljava/lang/String; = "pref_hand_gesture_status"

.field public static final DATA_RUNNING_AUTO_ZOOM:Ljava/lang/String; = "pref_camera_auto_zoom"

.field public static final DATA_RUNNING_EYE_LIGHT_TYPE:Ljava/lang/String; = "pref_eye_light_type_key"

.field public static final DATA_RUNNING_FILTER_INDEX:Ljava/lang/String; = "pref_camera_shader_coloreffect_key"

.field public static final DATA_RUNNING_FOCUS_PEAK:Ljava/lang/String; = "pref_camera_peak_key"

.field public static final DATA_RUNNING_GENDER_AGE:Ljava/lang/String; = "pref_camera_show_gender_age_key"

.field public static final DATA_RUNNING_GRADIENTER:Ljava/lang/String; = "pref_camera_gradienter_key"

.field public static final DATA_RUNNING_GROUP_SELFIES:Ljava/lang/String; = "pref_camera_groupshot_mode_key"

.field public static final DATA_RUNNING_HHT:Ljava/lang/String; = "pref_camera_hand_night_key"

.field public static final DATA_RUNNING_LIVE_CONFIG_IS_NEED_RESTORE:Ljava/lang/String; = "pref_live_config_is_need_restore"

.field public static final DATA_RUNNING_LIVE_MUSIC_FIRST_REQUEST_TIME:Ljava/lang/String; = "pref_key_live_music_first_request_time"

.field public static final DATA_RUNNING_LIVE_SHOT:Ljava/lang/String; = "pref_live_shot_enabled"

.field public static final DATA_RUNNING_MAGIC_FOCUS:Ljava/lang/String; = "pref_camera_ubifocus_key"

.field public static final DATA_RUNNING_MAGIC_MIRROR:Ljava/lang/String; = "pref_camera_magic_mirror_key"

.field public static final DATA_RUNNING_MANUALLY:Ljava/lang/String; = "pref_camera_manual_mode_key"

.field public static final DATA_RUNNING_PANORAMA_MOVE_DIRECTION:Ljava/lang/String; = "pref_panorana_move_direction_key"

.field public static final DATA_RUNNING_PORTRAIT_LIGHTING:Ljava/lang/String; = "pref_portrait_lighting"

.field public static final DATA_RUNNING_PORTRAIT_MODE:Ljava/lang/String; = "pref_camera_portrait_mode_key"

.field public static final DATA_RUNNING_SCENE:Ljava/lang/String; = "pref_camera_scenemode_setting_key"

.field public static final DATA_RUNNING_SCENE_VALUE:Ljava/lang/String; = "pref_camera_scenemode_key"

.field public static final DATA_RUNNING_SQUARE_MODE:Ljava/lang/String; = "pref_camera_square_mode_key"

.field public static final DATA_RUNNING_STEREO_MODE:Ljava/lang/String; = "pref_camera_stereo_mode_key"

.field public static final DATA_RUNNING_SUPER_RESOLUTION:Ljava/lang/String; = "pref_camera_super_resolution_key"

.field public static final DATA_RUNNING_TILT:Ljava/lang/String; = "pref_camera_tilt_shift_mode"

.field public static final DATA_RUNNING_TILT_VALUE:Ljava/lang/String; = "pref_camera_tilt_shift_key"

.field public static final DATA_RUNNING_TIMER:Ljava/lang/String; = "pref_delay_capture_mode"

.field public static final DATA_RUNNING_ULTRA_PIXEL:Ljava/lang/String; = "pref_ultra_pixel"

.field public static final DATA_RUNNING_ULTRA_WIDE_BOKEH:Ljava/lang/String; = "pref_ultra_wide_bokeh_enabled"

.field public static final DATA_RUNNING_VIDEO_FAST:Ljava/lang/String; = "pref_video_speed_fast_key"

.field public static final DATA_RUNNING_VIDEO_HFR:Ljava/lang/String; = "pref_video_speed_hfr_key"

.field public static final DATA_RUNNING_VIDEO_SLOW:Ljava/lang/String; = "pref_video_speed_slow_key"

.field private static final KEY:Ljava/lang/String; = "camera_running"


# instance fields
.field private componentRunningTiltValue:Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;

.field private mComponentConfigFilter:Lcom/android/camera/data/data/config/ComponentConfigFilter;

.field private mComponentRunningAutoZoom:Lcom/android/camera/data/data/runing/ComponentRunningAutoZoom;

.field private mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

.field private mComponentRunningLiveShot:Lcom/android/camera/data/data/runing/ComponentRunningLiveShot;

.field private mComponentRunningMacroMode:Lcom/android/camera/data/data/config/ComponentRunningMacroMode;

.field private mComponentRunningSceneValue:Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;

.field private mComponentRunningShine:Lcom/android/camera/data/data/runing/ComponentRunningShine;

.field private mComponentRunningTimer:Lcom/android/camera/data/data/runing/ComponentRunningTimer;

.field private mComponentUltraPixel:Lcom/android/camera/data/data/config/ComponentRunningUltraPixel;

.field private mLastUiStyle:I

.field private mRecordingClosedElements:[I

.field private mSupportHandGesture:Z

.field private mSupportMacroMode:Z

.field private mUiStyle:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/data/data/DataItemBase;-><init>()V

    new-instance v0, Lcom/android/camera/data/data/config/ComponentRunningUltraPixel;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/config/ComponentRunningUltraPixel;-><init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V

    iput-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentUltraPixel:Lcom/android/camera/data/data/config/ComponentRunningUltraPixel;

    new-instance v0, Lcom/android/camera/data/data/runing/ComponentRunningShine;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/runing/ComponentRunningShine;-><init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V

    iput-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningShine:Lcom/android/camera/data/data/runing/ComponentRunningShine;

    return-void
.end method


# virtual methods
.method public getComponentConfigFilter()Lcom/android/camera/data/data/config/ComponentConfigFilter;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentConfigFilter:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/camera/data/data/config/ComponentConfigFilter;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/config/ComponentConfigFilter;-><init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V

    iput-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentConfigFilter:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentConfigFilter:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    return-object v0
.end method

.method public getComponentRunningAutoZoom()Lcom/android/camera/data/data/runing/ComponentRunningAutoZoom;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningAutoZoom:Lcom/android/camera/data/data/runing/ComponentRunningAutoZoom;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/camera/data/data/runing/ComponentRunningAutoZoom;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/runing/ComponentRunningAutoZoom;-><init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V

    iput-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningAutoZoom:Lcom/android/camera/data/data/runing/ComponentRunningAutoZoom;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningAutoZoom:Lcom/android/camera/data/data/runing/ComponentRunningAutoZoom;

    return-object v0
.end method

.method public getComponentRunningLighting()Lcom/android/camera/data/data/runing/ComponentRunningLighting;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;-><init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V

    iput-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    return-object v0
.end method

.method public getComponentRunningLiveShot()Lcom/android/camera/data/data/runing/ComponentRunningLiveShot;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningLiveShot:Lcom/android/camera/data/data/runing/ComponentRunningLiveShot;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/camera/data/data/runing/ComponentRunningLiveShot;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/runing/ComponentRunningLiveShot;-><init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V

    iput-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningLiveShot:Lcom/android/camera/data/data/runing/ComponentRunningLiveShot;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningLiveShot:Lcom/android/camera/data/data/runing/ComponentRunningLiveShot;

    return-object v0
.end method

.method public getComponentRunningMacroMode()Lcom/android/camera/data/data/config/ComponentRunningMacroMode;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningMacroMode:Lcom/android/camera/data/data/config/ComponentRunningMacroMode;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/camera/data/data/config/ComponentRunningMacroMode;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/config/ComponentRunningMacroMode;-><init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V

    iput-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningMacroMode:Lcom/android/camera/data/data/config/ComponentRunningMacroMode;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningMacroMode:Lcom/android/camera/data/data/config/ComponentRunningMacroMode;

    return-object v0
.end method

.method public getComponentRunningSceneValue()Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningSceneValue:Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;-><init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V

    iput-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningSceneValue:Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningSceneValue:Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;

    return-object v0
.end method

.method public getComponentRunningShine()Lcom/android/camera/data/data/runing/ComponentRunningShine;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningShine:Lcom/android/camera/data/data/runing/ComponentRunningShine;

    return-object v0
.end method

.method public getComponentRunningTiltValue()Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->componentRunningTiltValue:Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;-><init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V

    iput-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->componentRunningTiltValue:Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->componentRunningTiltValue:Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;

    return-object v0
.end method

.method public getComponentRunningTimer()Lcom/android/camera/data/data/runing/ComponentRunningTimer;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningTimer:Lcom/android/camera/data/data/runing/ComponentRunningTimer;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/camera/data/data/runing/ComponentRunningTimer;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/runing/ComponentRunningTimer;-><init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V

    iput-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningTimer:Lcom/android/camera/data/data/runing/ComponentRunningTimer;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningTimer:Lcom/android/camera/data/data/runing/ComponentRunningTimer;

    return-object v0
.end method

.method public getComponentUltraPixel()Lcom/android/camera/data/data/config/ComponentRunningUltraPixel;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentUltraPixel:Lcom/android/camera/data/data/config/ComponentRunningUltraPixel;

    return-object v0
.end method

.method public getHandGestureRunning()Z
    .locals 2

    const-string v0, "pref_hand_gesture_status"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public getLastUiStyle()I
    .locals 1

    iget v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mLastUiStyle:I

    return v0
.end method

.method public getLiveConfigIsNeedRestore()Z
    .locals 2

    const-string v0, "pref_live_config_is_need_restore"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public getLiveMusicFirstRequestTime()J
    .locals 3

    const-string v0, "pref_key_live_music_first_request_time"

    const-wide/16 v1, -0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getRecordingClosedElements()[I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mRecordingClosedElements:[I

    return-object v0
.end method

.method public getUiStyle()I
    .locals 1

    iget v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mUiStyle:I

    return v0
.end method

.method public getVideoSpeed()Ljava/lang/String;
    .locals 1

    const-string v0, "pref_video_speed_fast_key"

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "fast"

    return-object v0

    :cond_0
    const-string v0, "pref_video_speed_slow_key"

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "slow"

    return-object v0

    :cond_1
    const-string v0, "pref_video_speed_hfr_key"

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "hfr"

    return-object v0

    :cond_2
    const-string v0, "normal"

    return-object v0
.end method

.method public isSwitchOn(Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method public isTransient()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public provideKey()Ljava/lang/String;
    .locals 1

    const-string v0, "camera_running"

    return-object v0
.end method

.method public reInitComponent(IILcom/android/camera2/CameraCapabilities;)V
    .locals 1

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/camera/data/data/runing/DataItemRunning;->reInitSupport(IILcom/android/camera2/CameraCapabilities;)V

    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentUltraPixel:Lcom/android/camera/data/data/config/ComponentRunningUltraPixel;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/camera/data/data/config/ComponentRunningUltraPixel;->reInit(IILcom/android/camera2/CameraCapabilities;)V

    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningShine:Lcom/android/camera/data/data/runing/ComponentRunningShine;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->reInit(IILcom/android/camera2/CameraCapabilities;)V

    invoke-virtual {p0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningMacroMode()Lcom/android/camera/data/data/config/ComponentRunningMacroMode;

    move-result-object p1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/data/data/global/DataItemGlobal;->isNormalIntent()Z

    move-result p3

    invoke-virtual {p1, p2, p3}, Lcom/android/camera/data/data/config/ComponentRunningMacroMode;->reInit(IZ)V

    invoke-virtual {p0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningAutoZoom()Lcom/android/camera/data/data/runing/ComponentRunningAutoZoom;

    move-result-object p1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/data/data/global/DataItemGlobal;->isNormalIntent()Z

    move-result p3

    invoke-virtual {p1, p2, p3}, Lcom/android/camera/data/data/runing/ComponentRunningAutoZoom;->reInit(IZ)V

    return-void
.end method

.method public reInitSupport(IILcom/android/camera2/CameraCapabilities;)V
    .locals 2

    const/4 p3, 0x0

    iput-boolean p3, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mSupportHandGesture:Z

    iput-boolean p3, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mSupportMacroMode:Z

    const/16 p3, 0xa5

    const/16 v0, 0xa3

    const/4 v1, 0x1

    if-ne p2, v1, :cond_1

    if-eq p1, v0, :cond_0

    if-eq p1, p3, :cond_0

    const/16 p2, 0xab

    if-ne p1, p2, :cond_1

    :cond_0
    invoke-static {}, Lcom/mi/config/b;->gg()Z

    move-result p2

    if-eqz p2, :cond_1

    iput-boolean v1, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mSupportHandGesture:Z

    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p2

    invoke-virtual {p2}, Lcom/mi/config/a;->isSupportMacroMode()Z

    move-result p2

    if-eqz p2, :cond_3

    if-eq v0, p1, :cond_2

    if-eq p3, p1, :cond_2

    const/16 p2, 0xa2

    if-eq p2, p1, :cond_2

    const/16 p2, 0xa9

    if-ne p2, p1, :cond_3

    :cond_2
    iput-boolean v1, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mSupportMacroMode:Z

    :cond_3
    return-void
.end method

.method public setHandGestureRunning(Z)V
    .locals 1

    const-string v0, "pref_hand_gesture_status"

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    return-void
.end method

.method public setLiveConfigIsNeedRestore(Z)V
    .locals 1

    const-string v0, "pref_live_config_is_need_restore"

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    return-void
.end method

.method public setLiveMusicFirstRequestTime(J)V
    .locals 1

    const-string v0, "pref_key_live_music_first_request_time"

    invoke-virtual {p0, v0, p1, p2}, Lcom/android/camera/data/data/runing/DataItemRunning;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    return-void
.end method

.method public setRecordingClosedElements([I)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mRecordingClosedElements:[I

    return-void
.end method

.method public setUiStyle(I)V
    .locals 3

    const-string v0, "DataItemRunning"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setUiStyle: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mUiStyle:I

    iput v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mLastUiStyle:I

    iput p1, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mUiStyle:I

    return-void
.end method

.method public supportHandGesture()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mSupportHandGesture:Z

    return v0
.end method

.method public supportMacroMode()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mSupportMacroMode:Z

    return v0
.end method

.method public supportPopShineEntry()Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningShine:Lcom/android/camera/data/data/runing/ComponentRunningShine;

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->supportPopUpEntry()Z

    move-result v0

    return v0
.end method

.method public supportTopShineEntry()Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentRunningShine:Lcom/android/camera/data/data/runing/ComponentRunningShine;

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->supportTopConfigEntry()Z

    move-result v0

    return v0
.end method

.method public supportUltraPixel()Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/runing/DataItemRunning;->mComponentUltraPixel:Lcom/android/camera/data/data/config/ComponentRunningUltraPixel;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentRunningUltraPixel;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public switchOff(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    return-void
.end method

.method public switchOn(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    return-void
.end method

.method public triggerSwitchAndGet(Ljava/lang/String;)Z
    .locals 1

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOn(Ljava/lang/String;)V

    const/4 p1, 0x1

    return p1
.end method
