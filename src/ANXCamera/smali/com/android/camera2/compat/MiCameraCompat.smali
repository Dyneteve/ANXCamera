.class public Lcom/android/camera2/compat/MiCameraCompat;
.super Ljava/lang/Object;
.source "MiCameraCompat.java"


# static fields
.field private static final IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    invoke-static {}, Lcom/mi/config/b;->hR()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;

    invoke-direct {v0}, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;-><init>()V

    sput-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/mi/config/b;->isMTKPlatform()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lcom/android/camera2/compat/MiCameraCompatMtkImpl;

    invoke-direct {v0}, Lcom/android/camera2/compat/MiCameraCompatMtkImpl;-><init>()V

    sput-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-direct {v0}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;-><init>()V

    sput-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    :goto_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static applyASDEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyASDEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyASDScene(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyASDScene(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method public static applyAiScenePeriod(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyAiScenePeriod(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method public static applyAutoZoomMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyAutoZoomMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method public static applyAutoZoomScaleOffset(Landroid/hardware/camera2/CaptureRequest$Builder;F)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyAutoZoomScaleOffset(Landroid/hardware/camera2/CaptureRequest$Builder;F)V

    return-void
.end method

.method public static applyBackwardCaptureHint(Landroid/hardware/camera2/CaptureRequest$Builder;B)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyBackwardCaptureHint(Landroid/hardware/camera2/CaptureRequest$Builder;B)V

    return-void
.end method

.method public static applyBeautyParameter(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/util/HashSet;Lcom/android/camera/fragment/beauty/BeautyValues;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/CaptureRequest$Builder;",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/android/camera/fragment/beauty/BeautyValues;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1, p2}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyBeautyParameter(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/util/HashSet;Lcom/android/camera/fragment/beauty/BeautyValues;)V

    return-void
.end method

.method public static applyBurstFps(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyBurstFps(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method public static applyBurstHint(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyBurstHint(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method public static applyCameraAi30Enable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyCameraAi30Enable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method public static applyCustomAWB(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyCustomWB(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method public static applyCustomWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyCustomWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    return-void
.end method

.method public static applyDepurpleEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyDepurpleEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyDeviceOrientation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyDeviceOrientation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method public static applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method public static applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;J)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1, p2}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;J)V

    return-void
.end method

.method public static applyEyeLight(Landroid/hardware/camera2/CaptureRequest$Builder;II)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1, p2}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyEyeLight(Landroid/hardware/camera2/CaptureRequest$Builder;II)V

    return-void
.end method

.method public static applyFNumber(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyFNumber(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    return-void
.end method

.method public static applyFaceAgeAnalyzeEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyFaceAnalyzeAge(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyFaceScoreEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyFaceScore(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyFaceWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyFaceWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    return-void
.end method

.method public static applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyHDRCheckerEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyHDRCheckerEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyHFRDeflicker(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyHFRDeflicker(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyHHT(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyHHT(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyHdrBracketMode(Landroid/hardware/camera2/CaptureRequest$Builder;B)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyHdrBracketMode(Landroid/hardware/camera2/CaptureRequest$Builder;B)V

    return-void
.end method

.method public static applyISO(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyISO(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method public static applyIsHfrPreview(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyIsHfrPreview(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyMacroMode(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyMacroMode(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyMiBokehEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyMiBokeh(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyMultiFrameInputNum(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyMultiFrameInputNum(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method public static applyNormalWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyNormalWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyParallelProcessEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyParallelProcessEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyParallelProcessPath(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyParallelProcessPath(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    return-void
.end method

.method public static applyPortraitLighting(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyPortraitLighting(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method public static applyRearBokehEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyRearBokeh(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method public static applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-void
.end method

.method public static applySnapshotTorch(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applySnapshotTorch(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyStFastZoomIn(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyStFastZoomIn(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applySuperNightScene(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applySuperNightScene(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applySwMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applySwMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyTimeWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyTimeWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    return-void
.end method

.method public static applyUltraWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyUltraWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyVideoStreamState(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyVideoStreamState(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    return-void
.end method

.method public static applyWaterMarkAppliedList(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyWaterMarkAppliedList(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    return-void
.end method

.method public static getDefaultSteamConfigurationsTag()Lcom/android/camera2/vendortag/VendorTag;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/camera2/vendortag/VendorTag<",
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "[",
            "Landroid/hardware/camera2/params/StreamConfiguration;",
            ">;>;"
        }
    .end annotation

    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->getDefaultSteamConfigurationsTag()Lcom/android/camera2/vendortag/VendorTag;

    move-result-object v0

    return-object v0
.end method
