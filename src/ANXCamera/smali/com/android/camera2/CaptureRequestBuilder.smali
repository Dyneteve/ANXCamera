.class public Lcom/android/camera2/CaptureRequestBuilder;
.super Ljava/lang/Object;
.source "CaptureRequestBuilder.java"


# static fields
.field private static final MAX_REALTIME_EXPOSURE_TIME:J = 0x7735940L

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera2/CaptureRequestBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static applyAELock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 3

    if-nez p0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyAELock: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_LOCK:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    return-void
.end method

.method static applyAERegions(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getAERegions()[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object p1

    if-eqz p1, :cond_1

    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    sget-object v0, Lcom/android/camera2/MiCamera2;->ZERO_WEIGHT_3A_REGION:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-virtual {p0, p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method static applyAFRegions(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getAFRegions()[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object p1

    if-eqz p1, :cond_1

    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    sget-object v0, Lcom/android/camera2/MiCamera2;->ZERO_WEIGHT_3A_REGION:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-virtual {p0, p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static applyASDScene(Lcom/android/camera2/CameraCapabilities;Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 2

    if-eqz p1, :cond_2

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->isASDSceneSupported()Z

    move-result p0

    if-nez p0, :cond_1

    sget-object p0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    const-string p1, "applyASDScene(): unsupported"

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getASDScene()I

    move-result p0

    sget-object p2, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "applyASDScene: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1, p0}, Lcom/android/camera2/compat/MiCameraCompat;->applyASDScene(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method static applyAWBLock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AWB_LOCK:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    return-void
.end method

.method static applyAWBMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AWB_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    return-void
.end method

.method static applyAiSceneDetectEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->isAiSceneDetectEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyASDEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method static applyAiSceneDetectPeriod(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getAiSceneDetectPeriod()I

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyAiScenePeriod(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method static applyAntiBanding(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_ANTIBANDING_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getAntiBanding()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    return-void
.end method

.method static applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 5

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isEISEnabled()Z

    move-result v0

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isOISEnabled()Z

    move-result p2

    if-eqz v0, :cond_2

    if-eqz p2, :cond_2

    invoke-static {}, Lcom/android/camera/Util;->isDebugOsBuild()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    new-instance p0, Ljava/lang/RuntimeException;

    const-string p1, "EIS&OIS are both on"

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    :goto_0
    sget-object v1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "EIS: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v0, :cond_3

    const-string v3, "on"

    goto :goto_1

    :cond_3
    const-string v3, "off"

    :goto_1
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_VIDEO_STABILIZATION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_4

    nop

    move v4, v3

    goto :goto_2

    :cond_4
    nop

    move v4, v2

    :goto_2
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, v1, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportOIS()Z

    move-result p1

    if-eqz p1, :cond_7

    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "OIS: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v0, :cond_5

    if-eqz p2, :cond_5

    const-string v4, "on"

    goto :goto_3

    :cond_5
    const-string v4, "off"

    :goto_3
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->LENS_OPTICAL_STABILIZATION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    if-nez v0, :cond_6

    if-eqz p2, :cond_6

    nop

    move v2, v3

    goto :goto_4

    :cond_6
    nop

    :goto_4
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    :cond_7
    return-void
.end method

.method static applyAutoZoomMode(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getAutoZoomMode()I

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyAutoZoomMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method static applyAutoZoomScaleOffset(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getAutoZoomScaleOffset()F

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyAutoZoomScaleOffset(Landroid/hardware/camera2/CaptureRequest$Builder;F)V

    return-void
.end method

.method public static applyBackwardCaptureHint(Lcom/android/camera2/CameraCapabilities;Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->isBackwardCaptureSupported()Z

    move-result p0

    if-nez p0, :cond_1

    sget-object p0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    const-string p1, "applyBackwardCaptureHint(): unsupported"

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    sget-object p0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "applyBackwardCaptureHint(): "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyBackwardCaptureHint(Landroid/hardware/camera2/CaptureRequest$Builder;B)V

    return-void
.end method

.method static applyBeautyValues(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportBeauty()Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getBeautyValues()Lcom/android/camera/fragment/beauty/BeautyValues;

    move-result-object v0

    if-nez v0, :cond_2

    return-void

    :cond_2
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->getCaptureRequestVendorKeys()Ljava/util/HashSet;

    move-result-object p1

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getBeautyValues()Lcom/android/camera/fragment/beauty/BeautyValues;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyBeautyParameter(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/util/HashSet;Lcom/android/camera/fragment/beauty/BeautyValues;)V

    return-void
.end method

.method static applyCameraAi30Enable(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportCameraAi30()Z

    move-result p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isCameraAi30Enabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyCameraAi30Enable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method static applyColorEffect(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_EFFECT_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getColorEffect()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    return-void
.end method

.method static applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportContrast()Z

    move-result p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getContrastLevel()I

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method static applyCustomAWB(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 0

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyCustomAWB(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method static applyDepurpleEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Z)V
    .locals 3

    if-nez p0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyDepurpleEnable: isSupport = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportDepurple()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", enadled = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportDepurple()Z

    move-result p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    invoke-static {p0, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyDepurpleEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method static applyDeviceOrientation(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 2

    if-eqz p0, :cond_1

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportDeviceOrientation()Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "applyDeviceOrientation: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getDeviceOrientation()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getDeviceOrientation()I

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyDeviceOrientation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method static applyExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 5

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getExposureCompensationIndex()I

    move-result v0

    invoke-static {}, Lcom/mi/config/b;->jr()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getISO()I

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v1

    const-wide/32 v3, 0x7735940

    cmp-long p1, v1, v3

    if-lez p1, :cond_1

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v0

    long-to-double v0, v0

    const-wide v2, 0x419dcd6500000000L    # 1.25E8

    div-double/2addr v0, v2

    double-to-float p1, v0

    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    move-result-wide v2

    div-double/2addr v0, v2

    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyExposureCompensation: EV = "

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p1, p3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->getExposureCompensationRational()Landroid/util/Rational;

    move-result-object p1

    invoke-virtual {p1}, Landroid/util/Rational;->getDenominator()I

    move-result p3

    int-to-double v2, p3

    mul-double/2addr v0, v2

    invoke-virtual {p1}, Landroid/util/Rational;->getNumerator()I

    move-result p1

    int-to-double v2, p1

    div-double/2addr v0, v2

    double-to-int p1, v0

    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->getMaxExposureCompensation()I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    :cond_1
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "applyExposureCompensation: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_EXPOSURE_COMPENSATION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    return-void
.end method

.method static applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getExposureMeteringMode()I

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method static applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraConfigs;)V
    .locals 4

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v0

    invoke-static {}, Lcom/mi/config/b;->jr()Z

    move-result p2

    if-eqz p2, :cond_1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_1

    const-wide/32 v2, 0x7735940

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    :cond_1
    invoke-static {}, Lcom/mi/config/b;->jr()Z

    move-result p2

    if-nez p2, :cond_2

    const/4 p2, 0x3

    if-ne p1, p2, :cond_3

    :cond_2
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyExposureTime: "

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p0, v0, v1}, Lcom/android/camera2/compat/MiCameraCompat;->applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;J)V

    :cond_3
    return-void
.end method

.method static applyEyeLight(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportEyeLight()Z

    move-result p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getEyeLightType()I

    move-result p1

    if-gez p1, :cond_2

    const/4 p1, 0x0

    invoke-static {p0, p1, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyEyeLight(Landroid/hardware/camera2/CaptureRequest$Builder;II)V

    goto :goto_0

    :cond_2
    const/16 p2, 0x64

    invoke-static {p0, p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyEyeLight(Landroid/hardware/camera2/CaptureRequest$Builder;II)V

    :goto_0
    return-void
.end method

.method static applyFNumber(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportBokehAdjust()Z

    move-result p1

    if-nez p1, :cond_1

    sget-object p0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    const-string p1, "set f number on unsupported devices"

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getFNumber()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_2

    return-void

    :cond_2
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getFNumber()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyFNumber(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    return-void
.end method

.method static applyFaceAgeAnalyze(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportFaceAgeAnalyze()Z

    move-result p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isFaceAgeAnalyzeEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyFaceAgeAnalyzeEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method static applyFaceDetection(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->isFaceDetectionEnabled()Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x2

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->STATISTICS_FACE_DETECT_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    return-void
.end method

.method static applyFaceScore(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportFaceScore()Z

    move-result p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isFaceScoreEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyFaceScoreEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method static applyFocusDistance(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getFocusMode()I

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->LENS_FOCUS_DISTANCE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getFocusDistance()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    return-void
.end method

.method static applyFocusMode(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getFocusMode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    invoke-static {p0, p1}, Lcom/android/camera2/CaptureRequestBuilder;->applyAFRegions(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V

    invoke-static {p0, p1}, Lcom/android/camera2/CaptureRequestBuilder;->applyAERegions(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V

    return-void
.end method

.method static applyFpsRange(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 3

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getPreviewFpsRange()Landroid/util/Range;

    move-result-object p1

    sget-object v0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyFpsRange: fpsRange = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez p1, :cond_1

    return-void

    :cond_1
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    return-void
.end method

.method static applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportFrontMirror()Z

    move-result p2

    if-nez p2, :cond_1

    return-void

    :cond_1
    const/4 p2, 0x3

    if-eq p1, p2, :cond_2

    return-void

    :cond_2
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "applyFrontMirror: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isFrontMirror()Z

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isFrontMirror()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method static applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportHdr()Z

    move-result p2

    if-nez p2, :cond_1

    return-void

    :cond_1
    const/4 p2, 0x3

    if-eq p1, p2, :cond_2

    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void

    :cond_2
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isHDREnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method static applyHDRCheckerEnable(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    if-eqz p0, :cond_1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportAutoHdr()Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isHDRCheckerEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyHDRCheckerEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public static applyHFRDeflicker(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    if-nez p3, :cond_1

    return-void

    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportHFRDeflicker()Z

    move-result p1

    if-nez p1, :cond_2

    return-void

    :cond_2
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isHFRDeflicker()Z

    move-result p1

    sget-object p2, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "applyHFRDeflicker: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyHFRDeflicker(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method static applyHHT(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportHHT()Z

    move-result p1

    if-nez p1, :cond_2

    return-void

    :cond_2
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isHHTEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyHHT(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method static applyHwMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportMfnr()Z

    move-result p2

    if-nez p2, :cond_1

    return-void

    :cond_1
    const/4 p2, 0x3

    if-eq p1, p2, :cond_2

    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void

    :cond_2
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "applyMfnrEnable: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isMfnrEnabled()Z

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isMfnrEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method static applyIso(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 5

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getISO()I

    move-result v0

    invoke-static {}, Lcom/mi/config/b;->jr()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    if-lez v0, :cond_1

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v1

    const-wide/32 v3, 0x7735940

    cmp-long p1, v1, v3

    if-lez p1, :cond_1

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v1

    long-to-double v1, v1

    const-wide v3, 0x419dcd6500000000L    # 1.25E8

    div-double/2addr v1, v3

    double-to-float p1, v1

    int-to-float p3, v0

    mul-float/2addr p3, p1

    float-to-int p1, p3

    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->getMaxIso()I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    :cond_1
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "applyIso: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p0, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyISO(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method static applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportLensDirtyDetect()Z

    move-result p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isLensDirtyDetectEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyMacroMode(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    if-eqz p0, :cond_2

    if-nez p3, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportMacroMode()Z

    move-result p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isMacroMode()Z

    move-result p1

    sget-object p2, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "applyMacroMode: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyMacroMode(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method static applyMiBokeh(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 2

    if-eqz p0, :cond_1

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportMiBokeh()Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "applyMiBokeh: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isMiBokehEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isMiBokehEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyMiBokehEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method private applyNoiseReduction(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x2

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->NOISE_REDUCTION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    return-void
.end method

.method static applyNormalWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportNormalWideLDC()Z

    move-result p2

    if-nez p2, :cond_1

    return-void

    :cond_1
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getNormalWideLDCEnabled()Z

    move-result p2

    const/4 p3, 0x4

    if-ne p1, p3, :cond_2

    const/4 p2, 0x0

    :cond_2
    invoke-static {p0, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyNormalWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method static applyPortraitLighting(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->gX()Z

    move-result p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportPortraitLighting()Z

    move-result p1

    if-nez p1, :cond_2

    return-void

    :cond_2
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getPortraitLightingPattern()I

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyPortraitLighting(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method static applyRearBokeh(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    if-eqz p0, :cond_1

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportRearBokeh()Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isRearBokehEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyRearBokehEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method static applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getSaturationLevel()I

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method static applySceneMode(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getSceneMode()I

    move-result p1

    const-string v0, "-1"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_SCENE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method static applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getSharpnessLevel()I

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method static applySuperNightScene(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportSuperNight()Z

    move-result p1

    if-nez p1, :cond_2

    return-void

    :cond_2
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "applySuperNightScene: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isSuperNightEnabled()Z

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isSuperNightEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applySuperNightScene(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method static applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 2

    if-eqz p0, :cond_2

    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportSuperResolution()Z

    move-result p2

    if-nez p2, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isSuperResolutionEnabled()Z

    move-result p2

    if-eqz p2, :cond_1

    const/4 p2, 0x3

    if-ne p1, p2, :cond_1

    const/4 p2, 0x1

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    :goto_0
    sget-object p3, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "applySuperResolution: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", applyType = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p0, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void

    :cond_2
    :goto_1
    return-void
.end method

.method static applySwMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportSwMfnr()Z

    move-result p2

    if-nez p2, :cond_1

    return-void

    :cond_1
    const/4 p2, 0x3

    if-eq p1, p2, :cond_2

    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applySwMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void

    :cond_2
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "applySwMfnrEnable: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isSwMfnrEnabled()Z

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isSwMfnrEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applySwMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method static applyUltraWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportUltraWideLDC()Z

    move-result p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getUltraWideLDCEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyUltraWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method static applyVideoFlash(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x2

    if-ne v1, p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    move p1, v0

    :goto_0
    if-eqz p1, :cond_2

    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_1

    :cond_2
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    :goto_1
    return-void
.end method

.method static applyVideoFpsRange(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 3

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getVideoFpsRange()Landroid/util/Range;

    move-result-object p1

    sget-object v0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyVideoFpsRange: fpsRange = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez p1, :cond_1

    return-void

    :cond_1
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    return-void
.end method

.method static applyWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 3

    if-nez p0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportWatermark()Z

    move-result p1

    if-nez p1, :cond_2

    return-void

    :cond_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->fP()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    const-string p1, ","

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getWaterMarkAppliedList()Ljava/util/List;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/Util;->join(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyWaterMark appliedList:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyWaterMarkAppliedList(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fQ()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportCustomWatermark()Z

    move-result p2

    if-eqz p2, :cond_7

    const-string p2, "device"

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_7

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermark()Ljava/lang/String;

    move-result-object p2

    invoke-static {}, Lcom/android/camera/CameraSettings;->getDefaultWatermarkStr()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5

    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelRearOn()Z

    move-result p2

    if-eqz p2, :cond_5

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p2

    invoke-virtual {p2}, Lcom/mi/config/a;->gI()Z

    move-result p2

    if-nez p2, :cond_5

    new-instance p2, Ljava/io/File;

    sget-object v0, Lcom/android/camera/Util;->WATERMARK_STORAGE_DIRECTORY:Ljava/io/File;

    sget-object v1, Lcom/android/camera/Util;->WATERMARK_ULTRA_PIXEL_FILE_NAME:Ljava/lang/String;

    invoke-direct {p2, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-static {}, Lcom/android/camera/Util;->generateUltraPixelWatermark2File()Landroid/graphics/Bitmap;

    :cond_4
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyCustomWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    new-instance p2, Ljava/io/File;

    sget-object v0, Lcom/android/camera/Util;->WATERMARK_STORAGE_DIRECTORY:Ljava/io/File;

    sget-object v1, Lcom/android/camera/Util;->WATERMARK_FILE_NAME:Ljava/lang/String;

    invoke-direct {p2, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-static {}, Lcom/android/camera/Util;->generateWatermark2File()Landroid/graphics/Bitmap;

    :cond_6
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyCustomWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    :cond_7
    :goto_0
    const-string/jumbo p2, "watermark"

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_8

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getTimeWaterMarkValue()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyTimeWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    :cond_8
    const-string p2, "beautify"

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_9

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getFaceWaterMarkFormat()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyFaceWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    :cond_9
    return-void
.end method

.method static applyZoomRatio(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 4

    if-nez p0, :cond_0

    return-void

    :cond_0
    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getZoomRatio()F

    move-result p2

    goto :goto_0

    :cond_1
    const/high16 p2, 0x3f800000    # 1.0f

    :goto_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/HybridZoomingSystem;->toCropRegion(FLandroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v1

    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p0, v2, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    sget-object p0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "applyZoomRatio(): cameraId = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->getCameraId()I

    move-result p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", zoomRatio = "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ", activeArraySize = "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ", cropRegion = "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method static applyZsl(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->isZslEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setZsl(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method
