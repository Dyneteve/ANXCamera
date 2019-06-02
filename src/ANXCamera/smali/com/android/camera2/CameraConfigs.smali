.class public Lcom/android/camera2/CameraConfigs;
.super Ljava/lang/Object;
.source "CameraConfigs.java"


# static fields
.field private static final CONFIG_INVALID_INT_VALUE:I = -0x1

.field private static final MAX_JPEG_COMPRESSION_QUALITY:I = 0x64

.field private static final MIN_JPEG_COMPRESSION_QUALITY:I = 0x1

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private isSuperNightEnabled:Z

.field private mAELocked:Z

.field private mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

.field private mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

.field private mASDScene:I

.field private mAWBLocked:Z

.field private mAiSceneDetectEnabled:Z

.field private mAiSceneDetectPeriod:I

.field private mAlgorithmPreviewFormat:I

.field private mAlgorithmPreviewSize:Lcom/android/camera/CameraSize;

.field private mAntiBanding:I

.field private mAutoZoomMode:I

.field private mAutoZoomScaleOffset:F

.field private mAwbCustomValue:I

.field private mAwbMode:I

.field private mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

.field private mCameraAi30Enabled:Z

.field private mColorEffect:I

.field private mContrastLevel:I

.field private mDeviceOrientation:I

.field private mDualCamWaterMarkEnabled:Z

.field private mEISEnabled:Z

.field private mExposureCompensationIndex:I

.field private mExposureMeteringMode:I

.field private mExposureTime:J

.field private mEyeLightType:I

.field private mFNumber:Ljava/lang/String;

.field private mFaceAgeAnalyzeEnabled:Z

.field private mFaceDetectionEnabled:Z

.field private mFaceScoreEnabled:Z

.field private mFaceWaterMarkEnabled:Z

.field private mFaceWaterMarkFormat:Ljava/lang/String;

.field private mFlashMode:I

.field private mFocusDistance:F

.field private mFocusMode:I

.field private mFrontMirror:Z

.field private mGpsLocation:Landroid/location/Location;

.field private mHDRCheckerEnabled:Z

.field private mHDREnabled:Z

.field private mHFRDeflicker:Z

.field private mHHTEnabled:Z

.field private mIsQcfaEnabled:Z

.field private mIso:I

.field private mJpegQuality:I

.field private mJpegRotation:I

.field private mLensDirtyDetectEnabled:Z

.field private mMacroMode:Z

.field private mMfnrEnabled:Z

.field private mMiBokehEnabled:Z

.field private mNeedFlash:Z

.field private mNeedPausePreview:Z

.field private mNormalWideLDCEnabled:Z

.field private mOISEnabled:Z

.field private mOptimizedFlash:Z

.field private mPhotoFormat:I

.field private mPhotoMaxImages:I

.field private mPhotoSize:Lcom/android/camera/CameraSize;

.field private mPortraitLightingPattern:I

.field private mPreviewFpsRange:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mPreviewMaxImages:I

.field private mPreviewSize:Lcom/android/camera/CameraSize;

.field private mQuickShotAnimation:Z

.field private mRearBokehEnabled:Z

.field private mRecordingHintEnabled:Z

.field private mSaturationLevel:I

.field private mSceneMode:I

.field private mSharpnessLevel:I

.field private mShotPath:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mShotPathThumbnail:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mShotType:I

.field private mSubPhotoSize:Lcom/android/camera/CameraSize;

.field private mSuperResolutionEnabled:Z

.field private mSwMfnrEnabled:Z

.field private mThumbnailSize:Lcom/android/camera/CameraSize;

.field private mTimeWaterMarkEnabled:Z

.field private mTimeWatermarkValue:Ljava/lang/String;

.field private mUltraWideLDCEnabled:Z

.field private mVideoFpsRange:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mVideoSize:Lcom/android/camera/CameraSize;

.field private mVideoSnapshotSize:Lcom/android/camera/CameraSize;

.field private mWaterMarkAppliedList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mZoomRatio:F

.field private mZslEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/CameraConfigs;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    const/16 v1, 0x23

    iput v1, p0, Lcom/android/camera2/CameraConfigs;->mAlgorithmPreviewFormat:I

    const/16 v1, 0x100

    iput v1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoFormat:I

    const/4 v1, 0x1

    iput v1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewMaxImages:I

    const/4 v2, 0x2

    iput v2, p0, Lcom/android/camera2/CameraConfigs;->mPhotoMaxImages:I

    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    const/high16 v2, -0x40800000    # -1.0f

    iput v2, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mSceneMode:I

    iput v1, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mColorEffect:I

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mShotType:I

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/util/ArrayDeque;

    iput-object v2, p0, Lcom/android/camera2/CameraConfigs;->mShotPathThumbnail:Ljava/util/ArrayDeque;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    iput-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mDualCamWaterMarkEnabled:Z

    iput-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mTimeWaterMarkEnabled:Z

    iput-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkEnabled:Z

    iput-boolean v1, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    iput-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mIsQcfaEnabled:Z

    const-string v0, "-1"

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mEyeLightType:I

    iput-object v2, p0, Lcom/android/camera2/CameraConfigs;->mTimeWatermarkValue:Ljava/lang/String;

    iput-object v2, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkFormat:Ljava/lang/String;

    const/4 v0, -0x2

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mASDScene:I

    return-void
.end method


# virtual methods
.method public getAERegions()[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    return-object v0
.end method

.method public getAFRegions()[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    return-object v0
.end method

.method public getASDScene()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mASDScene:I

    return v0
.end method

.method public getAWBMode()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    return v0
.end method

.method public getAiSceneDetectPeriod()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectPeriod:I

    return v0
.end method

.method public getAlgorithmPreviewFormat()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAlgorithmPreviewFormat:I

    return v0
.end method

.method public getAlgorithmPreviewSize()Lcom/android/camera/CameraSize;
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAlgorithmPreviewSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getAntiBanding()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    return v0
.end method

.method public getAutoZoomMode()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAutoZoomMode:I

    return v0
.end method

.method public getAutoZoomScaleOffset()F
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAutoZoomScaleOffset:F

    return v0
.end method

.method public getAwbCustomValue()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbCustomValue:I

    return v0
.end method

.method public getBeautyValues()Lcom/android/camera/fragment/beauty/BeautyValues;
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    return-object v0
.end method

.method public getColorEffect()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mColorEffect:I

    return v0
.end method

.method public getContrastLevel()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    return v0
.end method

.method public getDeviceOrientation()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    return v0
.end method

.method public getExposureCompensationIndex()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureCompensationIndex:I

    return v0
.end method

.method public getExposureMeteringMode()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    return v0
.end method

.method public getExposureTime()J
    .locals 2

    iget-wide v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureTime:J

    return-wide v0
.end method

.method public getEyeLightType()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mEyeLightType:I

    return v0
.end method

.method public getFNumber()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mFNumber:Ljava/lang/String;

    return-object v0
.end method

.method public getFaceWaterMarkFormat()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkFormat:Ljava/lang/String;

    return-object v0
.end method

.method public getFlashMode()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    return v0
.end method

.method public getFocusDistance()F
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    return v0
.end method

.method public getFocusMode()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    return v0
.end method

.method public getGpsLocation()Landroid/location/Location;
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mGpsLocation:Landroid/location/Location;

    return-object v0
.end method

.method public getISO()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mIso:I

    return v0
.end method

.method public getJpegQuality()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    return v0
.end method

.method public getJpegRotation()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    return v0
.end method

.method public getNormalWideLDCEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNormalWideLDCEnabled:Z

    return v0
.end method

.method public getPhotoFormat()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoFormat:I

    return v0
.end method

.method public getPhotoMaxImages()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoMaxImages:I

    return v0
.end method

.method public getPhotoSize()Lcom/android/camera/CameraSize;
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getPortraitLightingPattern()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPortraitLightingPattern:I

    return v0
.end method

.method public getPreviewFpsRange()Landroid/util/Range;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFpsRange:Landroid/util/Range;

    return-object v0
.end method

.method public getPreviewMaxImages()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewMaxImages:I

    return v0
.end method

.method public getPreviewSize()Lcom/android/camera/CameraSize;
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getSaturationLevel()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    return v0
.end method

.method public getSceneMode()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSceneMode:I

    return v0
.end method

.method public getSharpnessLevel()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    return v0
.end method

.method public getShotPath()Ljava/lang/String;
    .locals 4

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/util/ArrayDeque;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v1, Lcom/android/camera2/CameraConfigs;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getShotPath: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", size:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method

.method public getShotType()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mShotType:I

    return v0
.end method

.method public getSubPhotoSize()Lcom/android/camera/CameraSize;
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mSubPhotoSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getThumbnailShotPath()Ljava/lang/String;
    .locals 4

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mShotPathThumbnail:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v1, Lcom/android/camera2/CameraConfigs;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getThumbnailShotPath: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", size:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera2/CameraConfigs;->mShotPathThumbnail:Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method

.method public getThumbnailSize()Lcom/android/camera/CameraSize;
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mThumbnailSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getTimeWaterMarkValue()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mTimeWatermarkValue:Ljava/lang/String;

    return-object v0
.end method

.method public getUltraWideLDCEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mUltraWideLDCEnabled:Z

    return v0
.end method

.method public getVideoFpsRange()Landroid/util/Range;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mVideoFpsRange:Landroid/util/Range;

    return-object v0
.end method

.method public getVideoSize()Lcom/android/camera/CameraSize;
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mVideoSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getVideoSnapshotSize()Lcom/android/camera/CameraSize;
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mVideoSnapshotSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getWaterMarkAppliedList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    return-object v0
.end method

.method public getZoomRatio()F
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    return v0
.end method

.method public isAELocked()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAELocked:Z

    return v0
.end method

.method public isAWBLocked()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAWBLocked:Z

    return v0
.end method

.method public isAiSceneDetectEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectEnabled:Z

    return v0
.end method

.method public isCameraAi30Enabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mCameraAi30Enabled:Z

    return v0
.end method

.method public isEISEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mEISEnabled:Z

    return v0
.end method

.method public isFaceAgeAnalyzeEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceAgeAnalyzeEnabled:Z

    return v0
.end method

.method public isFaceDetectionEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceDetectionEnabled:Z

    return v0
.end method

.method public isFaceScoreEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceScoreEnabled:Z

    return v0
.end method

.method public isFrontMirror()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFrontMirror:Z

    return v0
.end method

.method public isHDRCheckerEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDRCheckerEnabled:Z

    return v0
.end method

.method public isHDREnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDREnabled:Z

    return v0
.end method

.method public isHFRDeflicker()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHFRDeflicker:Z

    return v0
.end method

.method public isHHTEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHHTEnabled:Z

    return v0
.end method

.method public isLensDirtyDetectEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mLensDirtyDetectEnabled:Z

    return v0
.end method

.method public isMacroMode()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mMacroMode:Z

    return v0
.end method

.method public isMfnrEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mMfnrEnabled:Z

    return v0
.end method

.method public isMiBokehEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mMiBokehEnabled:Z

    return v0
.end method

.method public isNeedFlash()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedFlash:Z

    return v0
.end method

.method public isNeedPausePreview()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    return v0
.end method

.method public isOISEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mOISEnabled:Z

    return v0
.end method

.method public isOptimizedFlash()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mOptimizedFlash:Z

    return v0
.end method

.method public isQcfaEnable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mIsQcfaEnabled:Z

    return v0
.end method

.method public isQuickShotAnimation()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mQuickShotAnimation:Z

    return v0
.end method

.method public isRearBokehEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mRearBokehEnabled:Z

    return v0
.end method

.method public isRecordingHintEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mRecordingHintEnabled:Z

    return v0
.end method

.method public isSuperNightEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->isSuperNightEnabled:Z

    return v0
.end method

.method public isSuperResolutionEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSuperResolutionEnabled:Z

    return v0
.end method

.method public isSwMfnrEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSwMfnrEnabled:Z

    return v0
.end method

.method public isZslEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mZslEnabled:Z

    return v0
.end method

.method public setAELock(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAELocked:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mAELocked:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setASDScene(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mASDScene:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mASDScene:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAWBLock(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAWBLocked:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mAWBLocked:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAWBMode(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAiSceneDetectEnable(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectEnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAiSceneDetectPeriod(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectPeriod:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectPeriod:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAlgorithmPreviewFormat(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAlgorithmPreviewFormat:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAlgorithmPreviewFormat:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAlgorithmPreviewSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAlgorithmPreviewSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mAlgorithmPreviewSize:Lcom/android/camera/CameraSize;

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAntiBanding(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAutoZoomMode(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAutoZoomMode:I

    return-void
.end method

.method public setAutoZoomScaleOffset(F)V
    .locals 0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAutoZoomScaleOffset:F

    return-void
.end method

.method public setBeautyValues(Lcom/android/camera/fragment/beauty/BeautyValues;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    return-void
.end method

.method public setCameraAi30Enable(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mCameraAi30Enabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mCameraAi30Enabled:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setColorEffect(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mColorEffect:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mColorEffect:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setContrastLevel(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setCustomAWB(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbCustomValue:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAwbCustomValue:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setDeviceOrientation(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setDualCamWaterMarkEnable(Z)Z
    .locals 2

    const-string v0, "device"

    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;Ljava/util/List;)Z

    move-result v0

    if-eqz p1, :cond_0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "device"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "device"

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mDualCamWaterMarkEnabled:Z

    if-eq v0, p1, :cond_2

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mDualCamWaterMarkEnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public setEnableEIS(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mEISEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mEISEnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setEnableOIS(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mOISEnabled:Z

    return-void
.end method

.method public setEnableZsl(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mZslEnabled:Z

    return-void
.end method

.method public setExposureCompensationIndex(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureCompensationIndex:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mExposureCompensationIndex:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setExposureMeteringMode(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setExposureTime(J)Z
    .locals 2

    iget-wide v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureTime:J

    cmp-long v0, v0, p1

    if-eqz v0, :cond_0

    iput-wide p1, p0, Lcom/android/camera2/CameraConfigs;->mExposureTime:J

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setEyeLight(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mEyeLightType:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mEyeLightType:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFNumber(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mFNumber:Ljava/lang/String;

    return-void
.end method

.method public setFaceAgeAnalyzeEnabled(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceAgeAnalyzeEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceAgeAnalyzeEnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceDetectionEnabled(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceDetectionEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceDetectionEnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceScoreEnabled(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceScoreEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceScoreEnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceWaterMarkEnable(Z)Z
    .locals 2

    const-string v0, "beautify"

    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;Ljava/util/List;)Z

    move-result v0

    if-eqz p1, :cond_0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "beautify"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "beautify"

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkEnabled:Z

    if-eq v0, p1, :cond_2

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkEnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceWaterMarkFormat(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkFormat:Ljava/lang/String;

    return-void
.end method

.method public setFlashMode(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFocusDistance(F)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFocusMode(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFrontMirror(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFrontMirror:Z

    return-void
.end method

.method public setGpsLocation(Landroid/location/Location;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mGpsLocation:Landroid/location/Location;

    return-void
.end method

.method public setHDRCheckerEnabled(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDRCheckerEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mHDRCheckerEnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setHDREnabled(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDREnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mHDREnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setHFRDeflickerEnable(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHFRDeflicker:Z

    if-eq p1, v0, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mHFRDeflicker:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setHHTEnabled(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHHTEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mHHTEnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setISO(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mIso:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mIso:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setJpegQuality(I)Z
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-lt p1, v1, :cond_2

    const/16 v2, 0x64

    if-le p1, v2, :cond_0

    goto :goto_0

    :cond_0
    iget v2, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    if-eq v2, p1, :cond_1

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    return v1

    :cond_1
    return v0

    :cond_2
    :goto_0
    sget-object v1, Lcom/android/camera2/CameraConfigs;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setJpegQuality: invalid jpeg quality "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public setJpegRotation(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setLensDirtyDetectEnabled(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mLensDirtyDetectEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mLensDirtyDetectEnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setMacroMode(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mMacroMode:Z

    if-eq p1, v0, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mMacroMode:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setMfnrEnabled(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mMfnrEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mMfnrEnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setMiBokehEnabled(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mMiBokehEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mMiBokehEnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setNeedFlash(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedFlash:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mNeedFlash:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setNormalWideLDCEnabled(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNormalWideLDCEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mNormalWideLDCEnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setOptimizedFlash(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mOptimizedFlash:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mOptimizedFlash:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPausePreview(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPhotoFormat(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoFormat:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoFormat:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPhotoMaxImages(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoMaxImages:I

    return-void
.end method

.method public setPhotoSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoSize:Lcom/android/camera/CameraSize;

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPortraitLightingPattern(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPortraitLightingPattern:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPortraitLightingPattern:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPreviewFpsRange(Landroid/util/Range;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFpsRange:Landroid/util/Range;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFpsRange:Landroid/util/Range;

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPreviewMaxImages(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewMaxImages:I

    return-void
.end method

.method public setPreviewSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewSize:Lcom/android/camera/CameraSize;

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setQcfaEnable(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mIsQcfaEnabled:Z

    return-void
.end method

.method public setQuickShotAnimation(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mQuickShotAnimation:Z

    return-void
.end method

.method public setRearBokehEnable(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mRearBokehEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mRearBokehEnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setRecordingHintEnabled(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mRecordingHintEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mRecordingHintEnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSaturationLevel(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSceneMode(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSceneMode:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mSceneMode:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSharpnessLevel(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setShotPath(Ljava/lang/String;Z)V
    .locals 3

    sget-object v0, Lcom/android/camera2/CameraConfigs;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setShotPath: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/util/ArrayDeque;

    const/4 v1, 0x5

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0, v1}, Ljava/util/ArrayDeque;-><init>(I)V

    iput-object v0, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/util/ArrayDeque;

    :cond_0
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    if-nez p2, :cond_1

    return-void

    :cond_1
    iget-object p2, p0, Lcom/android/camera2/CameraConfigs;->mShotPathThumbnail:Ljava/util/ArrayDeque;

    if-nez p2, :cond_2

    new-instance p2, Ljava/util/ArrayDeque;

    invoke-direct {p2, v1}, Ljava/util/ArrayDeque;-><init>(I)V

    iput-object p2, p0, Lcom/android/camera2/CameraConfigs;->mShotPathThumbnail:Ljava/util/ArrayDeque;

    :cond_2
    iget-object p2, p0, Lcom/android/camera2/CameraConfigs;->mShotPathThumbnail:Ljava/util/ArrayDeque;

    invoke-virtual {p2, p1}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    return-void
.end method

.method public setShotType(I)Z
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mShotType:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mShotType:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSubPhotoSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mSubPhotoSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mSubPhotoSize:Lcom/android/camera/CameraSize;

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSuperNightEnabled(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->isSuperNightEnabled:Z

    return-void
.end method

.method public setSuperResolutionEnabled(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSuperResolutionEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mSuperResolutionEnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSwMfnrEnabled(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSwMfnrEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mSwMfnrEnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setThumbnailSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mThumbnailSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mThumbnailSize:Lcom/android/camera/CameraSize;

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setTimeWaterMarkEnable(Z)Z
    .locals 2

    const-string v0, "watermark"

    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;Ljava/util/List;)Z

    move-result v0

    if-eqz p1, :cond_0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "watermark"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "watermark"

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mTimeWaterMarkEnabled:Z

    if-eq v0, p1, :cond_2

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mTimeWaterMarkEnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public setTimeWaterMarkValue(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mTimeWatermarkValue:Ljava/lang/String;

    return-void
.end method

.method public setUltraWideLDCEnabled(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mUltraWideLDCEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mUltraWideLDCEnabled:Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setVideoFpsRange(Landroid/util/Range;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mVideoFpsRange:Landroid/util/Range;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mVideoFpsRange:Landroid/util/Range;

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setVideoSize(Lcom/android/camera/CameraSize;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mVideoSize:Lcom/android/camera/CameraSize;

    return-void
.end method

.method public setVideoSnapshotSize(Lcom/android/camera/CameraSize;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mVideoSnapshotSize:Lcom/android/camera/CameraSize;

    return-void
.end method

.method public setZoomRatio(F)Z
    .locals 4

    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    sub-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    sget-object v1, Lcom/android/camera2/CameraConfigs;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "zoom ratio diff: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    const/4 p1, 0x1

    return p1
.end method
