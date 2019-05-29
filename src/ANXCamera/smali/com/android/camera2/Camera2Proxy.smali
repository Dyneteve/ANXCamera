.class public abstract Lcom/android/camera2/Camera2Proxy;
.super Ljava/lang/Object;
.source "Camera2Proxy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera2/Camera2Proxy$BeautyBodySlimCountCallback;,
        Lcom/android/camera2/Camera2Proxy$UltraWideCheckCallback;,
        Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;,
        Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;,
        Lcom/android/camera2/Camera2Proxy$PreviewCallback;,
        Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;,
        Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;,
        Lcom/android/camera2/Camera2Proxy$HDRCheckerCallback;,
        Lcom/android/camera2/Camera2Proxy$LivePhotoResultCallback;,
        Lcom/android/camera2/Camera2Proxy$PictureCallbackWrapper;,
        Lcom/android/camera2/Camera2Proxy$CaptureCallback;,
        Lcom/android/camera2/Camera2Proxy$PictureCallback;,
        Lcom/android/camera2/Camera2Proxy$FocusCallback;,
        Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;,
        Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;,
        Lcom/android/camera2/Camera2Proxy$CaptureBusyCallback;
    }
.end annotation


# instance fields
.field private final mCallbackLock:Ljava/lang/Object;

.field final mCameraId:I

.field protected mErrorCallback:Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;

.field private mFocusCallback:Lcom/android/camera2/Camera2Proxy$FocusCallback;

.field private mMetadataCallback:Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;

.field private mParallelCallback:Lcom/xiaomi/camera/core/ParallelCallback;

.field private mPictureCallBack:Lcom/android/camera2/Camera2Proxy$PictureCallback;

.field private mPreviewCallback:Lcom/android/camera2/Camera2Proxy$PreviewCallback;

.field private mRawCallBack:Lcom/android/camera2/Camera2Proxy$PictureCallback;

.field private mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mCallbackLock:Ljava/lang/Object;

    iput p1, p0, Lcom/android/camera2/Camera2Proxy;->mCameraId:I

    return-void
.end method


# virtual methods
.method public abstract cancelContinuousShot()V
.end method

.method public abstract cancelFocus(I)V
.end method

.method public abstract cancelSession()V
.end method

.method public abstract captureAbortBurst()V
.end method

.method public abstract captureBurstPictures(ILcom/android/camera2/Camera2Proxy$PictureCallback;Lcom/xiaomi/camera/core/ParallelCallback;)V
    .param p2    # Lcom/android/camera2/Camera2Proxy$PictureCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/xiaomi/camera/core/ParallelCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract captureGroupShotPictures(Lcom/android/camera2/Camera2Proxy$PictureCallback;Lcom/xiaomi/camera/core/ParallelCallback;ILandroid/content/Context;)V
    .param p1    # Lcom/android/camera2/Camera2Proxy$PictureCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/xiaomi/camera/core/ParallelCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract captureVideoSnapshot(Lcom/android/camera2/Camera2Proxy$PictureCallback;)V
.end method

.method public abstract close()V
.end method

.method public abstract forceTurnFlashONAndPausePreview()V
.end method

.method public abstract forceTurnFlashOffAndPausePreview()V
.end method

.method public abstract getAlgorithmPreviewFormat()I
.end method

.method public abstract getAlgorithmPreviewSize()Lcom/android/camera/CameraSize;
.end method

.method protected abstract getCameraConfigs()Lcom/android/camera2/CameraConfigs;
.end method

.method protected abstract getCameraDevice()Landroid/hardware/camera2/CameraDevice;
.end method

.method public abstract getCameraHandler()Landroid/os/Handler;
.end method

.method public abstract getCapabilities()Lcom/android/camera2/CameraCapabilities;
.end method

.method protected abstract getCaptureSession()Landroid/hardware/camera2/CameraCaptureSession;
.end method

.method protected abstract getDepthImageReader()Landroid/media/ImageReader;
.end method

.method public abstract getExposureCompensation()I
.end method

.method public abstract getFlashMode()I
.end method

.method getFocusCallback()Lcom/android/camera2/Camera2Proxy$FocusCallback;
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera2/Camera2Proxy;->mFocusCallback:Lcom/android/camera2/Camera2Proxy$FocusCallback;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public abstract getFocusMode()I
.end method

.method public getId()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/Camera2Proxy;->mCameraId:I

    return v0
.end method

.method getMetadataCallback()Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera2/Camera2Proxy;->mMetadataCallback:Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method getParallelCallback()Lcom/xiaomi/camera/core/ParallelCallback;
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera2/Camera2Proxy;->mParallelCallback:Lcom/xiaomi/camera/core/ParallelCallback;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public abstract getParallelShotSavePath()Ljava/lang/String;
.end method

.method protected abstract getPhotoImageReader()Landroid/media/ImageReader;
.end method

.method getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera2/Camera2Proxy;->mPictureCallBack:Lcom/android/camera2/Camera2Proxy$PictureCallback;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public abstract getPictureFormat()I
.end method

.method public abstract getPictureMaxImages()I
.end method

.method public abstract getPictureSize()Lcom/android/camera/CameraSize;
.end method

.method protected abstract getPortraitRawImageReader()Landroid/media/ImageReader;
.end method

.method getPreviewCallback()Lcom/android/camera2/Camera2Proxy$PreviewCallback;
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera2/Camera2Proxy;->mPreviewCallback:Lcom/android/camera2/Camera2Proxy$PreviewCallback;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public abstract getPreviewMaxImages()I
.end method

.method protected abstract getPreviewRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;
.end method

.method public abstract getPreviewSize()Lcom/android/camera/CameraSize;
.end method

.method protected abstract getPreviewSurface()Landroid/view/Surface;
.end method

.method public getRawCallBack()Lcom/android/camera2/Camera2Proxy$PictureCallback;
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera2/Camera2Proxy;->mRawCallBack:Lcom/android/camera2/Camera2Proxy$PictureCallback;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected abstract getRecordSurface()Landroid/view/Surface;
.end method

.method public abstract getSceneMode()I
.end method

.method getScreenLightCallback()Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera2/Camera2Proxy;->mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected abstract getVideoSnapshotImageReader()Landroid/media/ImageReader;
.end method

.method public abstract getZoomRatio()F
.end method

.method public abstract isBokehEnabled()Z
.end method

.method public abstract isCaptureBusy(Z)Z
.end method

.method public abstract isFacingFront()Z
.end method

.method public abstract isNeedFlashOn()Z
.end method

.method public abstract isNeedPreviewThumbnail()Z
.end method

.method public abstract isPreviewReady()Z
.end method

.method public abstract isQcfaEnable()Z
.end method

.method public abstract isSessionReady()Z
.end method

.method public abstract lockExposure(Z)V
.end method

.method protected notifyOnError(I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mErrorCallback:Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mErrorCallback:Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;

    invoke-interface {v0, p0, p1}, Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;->onCameraError(Lcom/android/camera2/Camera2Proxy;I)V

    :cond_0
    return-void
.end method

.method public abstract notifyVideoStreamEnd()V
.end method

.method public abstract onCapabilityChanged(Lcom/android/camera2/CameraCapabilities;)V
.end method

.method public abstract onMultiSnapEnd(ZLcom/android/camera2/MiCamera2Shot;)V
.end method

.method public abstract onParallelImagePostProcStart()V
.end method

.method public abstract onPreviewComing()V
.end method

.method public abstract onPreviewThumbnailReceived(Lcom/android/camera/Thumbnail;)V
.end method

.method public abstract pausePreview()V
.end method

.method public abstract registerCaptureCallback(Lcom/android/camera2/Camera2Proxy$CaptureCallback;)Z
.end method

.method public abstract releaseCameraPreviewCallback(Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V
    .param p1    # Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract releaseFakeSurfaceIfNeed()V
.end method

.method public abstract releasePictureCallback()V
.end method

.method public abstract releasePreview()V
.end method

.method public abstract resetConfigs()V
.end method

.method public abstract resumePreview()V
.end method

.method public abstract setAELock(Z)V
.end method

.method public abstract setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)V
.end method

.method public abstract setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)V
.end method

.method public abstract setASD(Z)V
.end method

.method public abstract setASDPeriod(I)V
.end method

.method public abstract setASDScene(I)V
.end method

.method public abstract setAWBLock(Z)V
.end method

.method public abstract setAWBMode(I)V
.end method

.method public abstract setAlgorithmPreviewFormat(I)V
.end method

.method public abstract setAlgorithmPreviewSize(Lcom/android/camera/CameraSize;)V
.end method

.method public abstract setAntiBanding(I)V
.end method

.method public abstract setAutoZoomMode(I)V
.end method

.method public abstract setAutoZoomScaleOffset(F)V
.end method

.method public abstract setAutoZoomStartCapture([F)V
.end method

.method public abstract setAutoZoomStopCapture(I)V
.end method

.method public abstract setBeautyValues(Lcom/android/camera/fragment/beauty/BeautyValues;)V
.end method

.method public abstract setBurstShotSpeed(I)V
.end method

.method public abstract setCameraAI30(Z)V
.end method

.method public abstract setCaptureBusyCallback(Lcom/android/camera2/Camera2Proxy$CaptureBusyCallback;)V
.end method

.method public abstract setColorEffect(I)V
.end method

.method public abstract setContrast(I)V
.end method

.method public abstract setCustomAWB(I)V
.end method

.method public abstract setDeviceOrientation(I)V
.end method

.method public abstract setDisplayOrientation(I)V
.end method

.method public abstract setDualCamWaterMarkEnable(Z)V
.end method

.method public abstract setEnableEIS(Z)V
.end method

.method public abstract setEnableOIS(Z)V
.end method

.method public abstract setEnableZsl(Z)V
.end method

.method public setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V
    .locals 0
    .param p1    # Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/android/camera2/Camera2Proxy;->mErrorCallback:Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;

    return-void
.end method

.method public abstract setExposureCompensation(I)V
.end method

.method public abstract setExposureMeteringMode(I)V
.end method

.method public abstract setExposureTime(J)V
.end method

.method public abstract setEyeLight(I)V
.end method

.method public abstract setFNumber(Ljava/lang/String;)V
.end method

.method public abstract setFaceAgeAnalyze(Z)V
.end method

.method public abstract setFaceScore(Z)V
.end method

.method public abstract setFaceWaterMarkEnable(Z)V
.end method

.method public abstract setFaceWaterMarkFormat(Ljava/lang/String;)V
.end method

.method public abstract setFlashMode(I)V
.end method

.method public setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/android/camera2/Camera2Proxy;->mFocusCallback:Lcom/android/camera2/Camera2Proxy$FocusCallback;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public abstract setFocusDistance(F)V
.end method

.method public abstract setFocusMode(I)V
.end method

.method public abstract setFpsRange(Landroid/util/Range;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setFrontMirror(Z)V
.end method

.method public abstract setGpsLocation(Landroid/location/Location;)V
.end method

.method public abstract setHDR(Z)V
.end method

.method public abstract setHDRCheckerEnable(Z)V
.end method

.method public abstract setHFRDeflickerEnable(Z)V
.end method

.method public abstract setHHT(Z)V
.end method

.method public abstract setISO(I)V
.end method

.method public abstract setJpegQuality(I)V
.end method

.method public abstract setJpegRotation(I)V
.end method

.method public abstract setJpegThumbnailSize(Lcom/android/camera/CameraSize;)V
.end method

.method public abstract setLensDirtyDetect(Z)V
.end method

.method public abstract setMacroMode(Z)V
.end method

.method public setMetaDataCallback(Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/android/camera2/Camera2Proxy;->mMetadataCallback:Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public abstract setMfnr(Z)V
.end method

.method public abstract setMiBokeh(Z)V
.end method

.method public abstract setNeedPausePreview(Z)V
.end method

.method public abstract setNormalWideLDC(Z)V
.end method

.method public abstract setOpticalZoomToTele(Z)V
.end method

.method public abstract setOptimizedFlash(Z)V
.end method

.method setParallelCallback(Lcom/xiaomi/camera/core/ParallelCallback;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/android/camera2/Camera2Proxy;->mParallelCallback:Lcom/xiaomi/camera/core/ParallelCallback;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method setPictureCallback(Lcom/android/camera2/Camera2Proxy$PictureCallback;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/android/camera2/Camera2Proxy;->mPictureCallBack:Lcom/android/camera2/Camera2Proxy$PictureCallback;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public abstract setPictureFormat(I)V
.end method

.method public abstract setPictureMaxImages(I)V
.end method

.method public abstract setPictureSize(Lcom/android/camera/CameraSize;)V
.end method

.method public abstract setPortraitLighting(I)V
.end method

.method setPreviewCallback(Lcom/android/camera2/Camera2Proxy$PreviewCallback;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/android/camera2/Camera2Proxy;->mPreviewCallback:Lcom/android/camera2/Camera2Proxy$PreviewCallback;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public abstract setPreviewMaxImages(I)V
.end method

.method public abstract setPreviewSize(Lcom/android/camera/CameraSize;)V
.end method

.method public abstract setQcfaEnable(Z)V
.end method

.method public abstract setQuickShotAnimation(Z)V
.end method

.method public setRawCallBack(Lcom/android/camera2/Camera2Proxy$PictureCallback;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/android/camera2/Camera2Proxy;->mRawCallBack:Lcom/android/camera2/Camera2Proxy$PictureCallback;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public abstract setRearBokehEnable(Z)V
.end method

.method public abstract setSaturation(I)V
.end method

.method public abstract setSceneMode(I)V
.end method

.method public setScreenLightCallback(Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/android/camera2/Camera2Proxy;->mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public abstract setSharpness(I)V
.end method

.method public abstract setShotSavePath(Ljava/lang/String;Z)V
.end method

.method public abstract setShotType(I)V
.end method

.method public abstract setSubPictureSize(Lcom/android/camera/CameraSize;)V
.end method

.method public abstract setSuperResolution(Z)V
.end method

.method public abstract setSwMfnr(Z)V
.end method

.method public abstract setTimeWaterMarkEnable(Z)V
.end method

.method public abstract setTimeWatermarkValue(Ljava/lang/String;)V
.end method

.method public abstract setUltraWideLDC(Z)V
.end method

.method public abstract setVendorSetting(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CaptureRequest$Key<",
            "TT;>;TT;)V"
        }
    .end annotation
.end method

.method public abstract setVideoFpsRange(Landroid/util/Range;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setVideoSnapshotSize(Lcom/android/camera/CameraSize;)V
.end method

.method public abstract setZoomRatio(F)V
.end method

.method public abstract startFaceDetection()V
.end method

.method public abstract startFocus(Lcom/android/camera/module/loader/camera2/FocusTask;I)V
.end method

.method public abstract startHighSpeedRecordPreview()V
.end method

.method public abstract startHighSpeedRecordSession(Landroid/view/Surface;Landroid/view/Surface;Landroid/util/Range;Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V
    .param p1    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/Surface;",
            "Landroid/view/Surface;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;",
            ")V"
        }
    .end annotation
.end method

.method public abstract startHighSpeedRecording()V
.end method

.method public abstract startObjectTrack(Landroid/graphics/RectF;)V
.end method

.method public abstract startPreviewCallback(Lcom/android/camera2/Camera2Proxy$PreviewCallback;)V
    .param p1    # Lcom/android/camera2/Camera2Proxy$PreviewCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract startPreviewSession(Landroid/view/Surface;ZZIZLcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V
.end method

.method public abstract startPreviewSession(Landroid/view/Surface;ZZIZLcom/android/camera2/Camera2Proxy$CameraPreviewCallback;Landroid/os/Handler;)V
    .param p1    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract startRecordPreview()V
.end method

.method public abstract startRecordSession(Landroid/view/Surface;Landroid/view/Surface;ZILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V
    .param p1    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract startRecording()V
.end method

.method public abstract stopFaceDetection()V
.end method

.method public abstract stopObjectTrack()V
.end method

.method public abstract stopPreviewCallback(Z)V
.end method

.method public abstract stopRecording(Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;)V
.end method

.method public abstract takePicture(Lcom/android/camera2/Camera2Proxy$PictureCallback;Lcom/xiaomi/camera/core/ParallelCallback;)V
    .param p1    # Lcom/android/camera2/Camera2Proxy$PictureCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/xiaomi/camera/core/ParallelCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " - cameraId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera2/Camera2Proxy;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public abstract unRegisterCaptureCallback()V
.end method

.method public abstract unlockExposure()V
.end method

.method public abstract updateDeferPreviewSession(Landroid/view/Surface;)Z
.end method
