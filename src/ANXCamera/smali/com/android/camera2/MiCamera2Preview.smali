.class public abstract Lcom/android/camera2/MiCamera2Preview;
.super Ljava/lang/Object;
.source "MiCamera2Preview.java"


# instance fields
.field protected mBogusCameraId:I

.field protected mCurrentModule:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/android/camera2/MiCamera2Preview;->mCurrentModule:I

    iput p2, p0, Lcom/android/camera2/MiCamera2Preview;->mBogusCameraId:I

    return-void
.end method


# virtual methods
.method public needForCapture()Z
    .locals 2

    iget v0, p0, Lcom/android/camera2/MiCamera2Preview;->mCurrentModule:I

    const/16 v1, 0xa3

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera2/MiCamera2Preview;->mCurrentModule:I

    const/16 v1, 0xa5

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera2/MiCamera2Preview;->mCurrentModule:I

    const/16 v1, 0xa7

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera2/MiCamera2Preview;->mCurrentModule:I

    const/16 v1, 0xad

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera2/MiCamera2Preview;->mCurrentModule:I

    const/16 v1, 0xaf

    if-ne v0, v1, :cond_0

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

.method public needForFrontCamera()Z
    .locals 2

    iget v0, p0, Lcom/android/camera2/MiCamera2Preview;->mBogusCameraId:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public needForManually()Z
    .locals 2

    iget v0, p0, Lcom/android/camera2/MiCamera2Preview;->mCurrentModule:I

    const/16 v1, 0xa7

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public needForPortrait()Z
    .locals 2

    iget v0, p0, Lcom/android/camera2/MiCamera2Preview;->mCurrentModule:I

    const/16 v1, 0xab

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public needForSuperNight()Z
    .locals 2

    iget v0, p0, Lcom/android/camera2/MiCamera2Preview;->mCurrentModule:I

    const/16 v1, 0xad

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public needForVideo()Z
    .locals 2

    iget v0, p0, Lcom/android/camera2/MiCamera2Preview;->mCurrentModule:I

    const/16 v1, 0xa2

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera2/MiCamera2Preview;->mCurrentModule:I

    const/16 v1, 0xa9

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera2/MiCamera2Preview;->mCurrentModule:I

    const/16 v1, 0xa8

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera2/MiCamera2Preview;->mCurrentModule:I

    const/16 v1, 0xa1

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera2/MiCamera2Preview;->mCurrentModule:I

    const/16 v1, 0xae

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera2/MiCamera2Preview;->mCurrentModule:I

    const/16 v1, 0xac

    if-ne v0, v1, :cond_0

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

.method public needResumePreviewAfterCapture(Lcom/android/camera2/CameraConfigs;)Z
    .locals 0

    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->isNeedFlash()Z

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2Preview;->needForSuperNight()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method
