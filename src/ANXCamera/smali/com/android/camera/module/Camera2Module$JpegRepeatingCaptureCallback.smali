.class final Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;
.super Lcom/android/camera2/Camera2Proxy$PictureCallbackWrapper;
.source "Camera2Module.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/Camera2Module;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "JpegRepeatingCaptureCallback"
.end annotation


# instance fields
.field mBurstShotTitle:Ljava/lang/String;

.field private mDropped:Z

.field private mModule:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera/module/Camera2Module;",
            ">;"
        }
    .end annotation
.end field

.field mParallelParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

.field mPressDownTitle:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;


# direct methods
.method public constructor <init>(Lcom/android/camera/module/Camera2Module;Lcom/android/camera/module/Camera2Module;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-direct {p0}, Lcom/android/camera2/Camera2Proxy$PictureCallbackWrapper;-><init>()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mParallelParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mModule:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private getBurstShotTitle()Ljava/lang/String;
    .locals 6

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$700(Lcom/android/camera/module/Camera2Module;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mBurstShotTitle:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result v0

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mBurstShotTitle:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mPressDownTitle:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mBurstShotTitle:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mBurstShotTitle:Ljava/lang/String;

    if-nez v0, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mBurstShotTitle:Ljava/lang/String;

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mBurstShotTitle:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v4, 0x13

    if-eq v0, v4, :cond_1

    const-wide/16 v4, 0x3e8

    add-long/2addr v2, v4

    invoke-static {v2, v3}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mBurstShotTitle:Ljava/lang/String;

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mBurstShotTitle:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v2

    if-eqz v2, :cond_2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_UBIFOCUS_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result v3

    sub-int/2addr v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "_BURST"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private tryCheckNeedStop()Z
    .locals 11

    invoke-static {}, Lcom/android/camera/storage/Storage;->isLowStorageAtLastPoint()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$1100(Lcom/android/camera/module/Camera2Module;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result v3

    invoke-virtual {v0, v3, v2}, Lcom/android/camera/module/Camera2Module;->trackGeneralInfo(IZ)V

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result v5

    const/4 v6, 0x1

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$2100(Lcom/android/camera/module/Camera2Module;)Landroid/location/Location;

    move-result-object v0

    if-eqz v0, :cond_0

    move v7, v2

    goto :goto_0

    :cond_0
    move v7, v1

    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$2800(Lcom/android/camera/module/Camera2Module;)Ljava/lang/String;

    move-result-object v8

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$2900(Lcom/android/camera/module/Camera2Module;)Z

    move-result v9

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$3000(Lcom/android/camera/module/Camera2Module;)Z

    move-result v10

    invoke-virtual/range {v4 .. v10}, Lcom/android/camera/module/Camera2Module;->trackPictureTaken(IZZLjava/lang/String;ZZ)V

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$2700(Lcom/android/camera/module/Camera2Module;)V

    :cond_1
    return v2

    :cond_2
    return v1
.end method


# virtual methods
.method public onCaptureStart(Lcom/xiaomi/camera/core/ParallelTaskData;Lcom/android/camera/CameraSize;Z)Lcom/xiaomi/camera/core/ParallelTaskData;
    .locals 6

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$900(Lcom/android/camera/module/Camera2Module;)Z

    move-result p3

    const/4 v0, 0x1

    if-eqz p3, :cond_12

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-boolean p3, p3, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez p3, :cond_12

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result p3

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v1}, Lcom/android/camera/module/Camera2Module;->access$1000(Lcom/android/camera/module/Camera2Module;)I

    move-result v1

    if-ge p3, v1, :cond_12

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$1100(Lcom/android/camera/module/Camera2Module;)Z

    move-result p3

    if-nez p3, :cond_0

    goto/16 :goto_9

    :cond_0
    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result p3

    if-ne p3, v0, :cond_2

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$1200(Lcom/android/camera/module/Camera2Module;)Z

    move-result p3

    if-nez p3, :cond_2

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$1300(Lcom/android/camera/module/Camera2Module;)Z

    move-result p3

    if-nez p3, :cond_1

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$1400(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/loader/camera2/FocusManager2;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onShutter()V

    :cond_1
    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p3, p3, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {p3}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result p3

    if-nez p3, :cond_2

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p3, p3, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p3}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object p3

    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->getBurstShotTitle()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mPressDownTitle:Ljava/lang/String;

    invoke-virtual {p3, v1, v2}, Lcom/android/camera/storage/ImageSaver;->updateImage(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->tryCheckNeedStop()Z

    move-result p3

    const/4 v1, 0x0

    if-eqz p3, :cond_3

    invoke-static {}, Lcom/android/camera/module/Camera2Module;->access$300()Ljava/lang/String;

    move-result-object p1

    const-string p2, "onCaptureStart: need stop multi capture, return null"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_3
    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mParallelParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    const/4 v2, 0x0

    if-nez p3, :cond_a

    nop

    invoke-static {}, Lcom/android/camera/CameraSettings;->isAgeGenderAndMagicMirrorWaterOpen()Z

    move-result p3

    if-eqz p3, :cond_4

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p3

    const/16 v3, 0xa6

    invoke-virtual {p3, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p3

    check-cast p3, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {p3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getFaceWaterMarkInfos()Ljava/util/List;

    move-result-object p3

    if-eqz p3, :cond_4

    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_0

    :cond_4
    move-object v3, v1

    :goto_0
    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p3, p3, Lcom/android/camera/module/Camera2Module;->mOutPutSize:Lcom/android/camera/CameraSize;

    if-nez p3, :cond_5

    invoke-virtual {p2}, Lcom/android/camera/CameraSize;->toSizeObject()Landroid/util/Size;

    move-result-object p3

    goto :goto_1

    :cond_5
    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p3, p3, Lcom/android/camera/module/Camera2Module;->mOutPutSize:Lcom/android/camera/CameraSize;

    invoke-virtual {p3}, Lcom/android/camera/CameraSize;->toSizeObject()Landroid/util/Size;

    move-result-object p3

    :goto_1
    new-instance v4, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    iget-object v5, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v5, v5, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v5}, Lcom/android/camera/CameraSize;->toSizeObject()Landroid/util/Size;

    move-result-object v5

    invoke-virtual {p2}, Lcom/android/camera/CameraSize;->toSizeObject()Landroid/util/Size;

    move-result-object p2

    invoke-direct {v4, v5, p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;-><init>(Landroid/util/Size;Landroid/util/Size;Landroid/util/Size;)V

    nop

    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraWaterMarkOpen()Z

    move-result p2

    invoke-virtual {v4, p2}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setHasDualWaterMark(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$2500(Lcom/android/camera/module/Camera2Module;)Z

    move-result p3

    invoke-virtual {p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setMirror(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    invoke-static {}, Lcom/android/camera/CameraSettings;->getPortraitLightingPattern()I

    move-result p3

    invoke-virtual {p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setLightingPattern(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object p3

    invoke-virtual {p3, v2}, Lcom/android/camera/effect/EffectController;->getEffectForSaving(Z)I

    move-result p3

    invoke-virtual {p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setFilterId(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    const/4 p3, -0x1

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v4, v4, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    if-ne p3, v4, :cond_6

    move p3, v2

    goto :goto_2

    :cond_6
    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget p3, p3, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    :goto_2
    invoke-virtual {p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setOrientation(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$2400(Lcom/android/camera/module/Camera2Module;)I

    move-result p3

    invoke-virtual {p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setJpegRotation(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result p3

    if-eqz p3, :cond_7

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$2300(Lcom/android/camera/module/Camera2Module;)F

    move-result p3

    const/high16 v4, -0x40800000    # -1.0f

    cmpl-float p3, p3, v4

    if-nez p3, :cond_7

    const/4 p3, 0x0

    goto :goto_3

    :cond_7
    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$2300(Lcom/android/camera/module/Camera2Module;)F

    move-result p3

    :goto_3
    invoke-virtual {p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setShootRotation(F)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$2200(Lcom/android/camera/module/Camera2Module;)I

    move-result p3

    invoke-virtual {p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setShootOrientation(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$2100(Lcom/android/camera/module/Camera2Module;)Landroid/location/Location;

    move-result-object p3

    if-eqz p3, :cond_8

    new-instance p3, Landroid/location/Location;

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v4}, Lcom/android/camera/module/Camera2Module;->access$2100(Lcom/android/camera/module/Camera2Module;)Landroid/location/Location;

    move-result-object v4

    invoke-direct {p3, v4}, Landroid/location/Location;-><init>(Landroid/location/Location;)V

    goto :goto_4

    :cond_8
    move-object p3, v1

    :goto_4
    invoke-virtual {p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setLocation(Landroid/location/Location;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isTimeWaterMarkOpen()Z

    move-result p3

    if-eqz p3, :cond_9

    invoke-static {}, Lcom/android/camera/Util;->getTimeWatermark()Ljava/lang/String;

    move-result-object p3

    goto :goto_5

    :cond_9
    move-object p3, v1

    :goto_5
    invoke-virtual {p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setTimeWaterMarkString(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    invoke-virtual {p2, v3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setFaceWaterMarkList(Ljava/util/List;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isAgeGenderAndMagicMirrorWaterOpen()Z

    move-result p3

    invoke-virtual {p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setAgeGenderAndMagicMirrorWater(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {p3}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result p3

    invoke-virtual {p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setFrontCamera(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {p3}, Lcom/android/camera/module/Camera2Module;->isBokehFrontCamera()Z

    move-result p3

    invoke-virtual {p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setBokehFrontCamera(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$2000(Lcom/android/camera/module/Camera2Module;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setAlgorithmName(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$1900(Lcom/android/camera/module/Camera2Module;)Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setPictureInfo(Lcom/xiaomi/camera/core/PictureInfo;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$1800(Lcom/android/camera/module/Camera2Module;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setSuffix(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$1700(Lcom/android/camera/module/Camera2Module;)Z

    move-result p3

    invoke-virtual {p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setGradienterOn(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    invoke-static {}, Lcom/android/camera/module/Camera2Module;->access$1600()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setTiltShiftMode(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    invoke-virtual {p2, v2}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setSaveGroupshotPrimitive(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$1500(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/effect/renders/DeviceWatermarkParam;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setDeviceWatermarkParam(Lcom/android/camera/effect/renders/DeviceWatermarkParam;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    invoke-static {v0}, Lcom/android/camera/module/BaseModule;->getJpegQuality(Z)I

    move-result p3

    invoke-virtual {p2, p3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setJpegQuality(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    invoke-virtual {p2}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->build()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mParallelParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    :cond_a
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mParallelParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-virtual {p1, p2}, Lcom/xiaomi/camera/core/ParallelTaskData;->fillParameter(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;)V

    nop

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p2, p2, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p2}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/storage/ImageSaver;->isSaveQueueFull()Z

    move-result p2

    if-nez p2, :cond_e

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2}, Lcom/android/camera/module/Camera2Module;->access$804(Lcom/android/camera/module/Camera2Module;)I

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p2, p2, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {p2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result p2

    if-nez p2, :cond_b

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    const/4 p3, 0x4

    invoke-virtual {p2, p3}, Lcom/android/camera/module/Camera2Module;->playCameraSound(I)V

    :cond_b
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->access$300()Ljava/lang/String;

    move-result-object p2

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onCaptureStart: revNum = "

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result v3

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2}, Lcom/android/camera/module/Camera2Module;->access$000(Lcom/android/camera/module/Camera2Module;)Lio/reactivex/ObservableEmitter;

    move-result-object p2

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-interface {p2, p3}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p2, p2, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {p2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result p2

    if-nez p2, :cond_f

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result p2

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$1000(Lcom/android/camera/module/Camera2Module;)I

    move-result p3

    if-gt p2, p3, :cond_f

    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->getBurstShotTitle()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {}, Lcom/android/camera/module/Camera2Module;->access$300()Ljava/lang/String;

    move-result-object p3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onCaptureStart: savePath = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p3, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1, p2}, Lcom/xiaomi/camera/core/ParallelTaskData;->setSavePath(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result p2

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$1000(Lcom/android/camera/module/Camera2Module;)I

    move-result p3

    if-eq p2, p3, :cond_d

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2}, Lcom/android/camera/module/Camera2Module;->access$1200(Lcom/android/camera/module/Camera2Module;)Z

    move-result p2

    if-nez p2, :cond_d

    iget-boolean p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mDropped:Z

    if-eqz p2, :cond_c

    goto :goto_6

    :cond_c
    move v0, v2

    goto :goto_7

    :cond_d
    :goto_6
    nop

    :goto_7
    invoke-virtual {p1, v0}, Lcom/xiaomi/camera/core/ParallelTaskData;->setNeedThumbnail(Z)V

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2, p1, v2}, Lcom/android/camera/module/Camera2Module;->access$2600(Lcom/android/camera/module/Camera2Module;Lcom/xiaomi/camera/core/ParallelTaskData;Z)V

    nop

    iput-boolean v2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mDropped:Z

    goto :goto_8

    :cond_e
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->access$300()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "onCaptureStart: queue full and drop "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mDropped:Z

    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p1}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result p1

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2}, Lcom/android/camera/module/Camera2Module;->access$1000(Lcom/android/camera/module/Camera2Module;)I

    move-result p2

    if-lt p1, p2, :cond_f

    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p1, p1, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ThumbnailUpdater;->getLastThumbnailUncached()V

    :cond_f
    move-object p1, v1

    :goto_8
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result p2

    iget-object p3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p3}, Lcom/android/camera/module/Camera2Module;->access$1000(Lcom/android/camera/module/Camera2Module;)I

    move-result p3

    if-ge p2, p3, :cond_10

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2}, Lcom/android/camera/module/Camera2Module;->access$1200(Lcom/android/camera/module/Camera2Module;)Z

    move-result p2

    if-nez p2, :cond_10

    iget-boolean p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mDropped:Z

    if-eqz p2, :cond_11

    :cond_10
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2}, Lcom/android/camera/module/Camera2Module;->access$2700(Lcom/android/camera/module/Camera2Module;)V

    :cond_11
    return-object p1

    :cond_12
    :goto_9
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->access$300()Ljava/lang/String;

    move-result-object p2

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onCaptureStart: revNum = "

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v1}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result v1

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " paused = "

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-boolean v1, v1, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " status = "

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v1}, Lcom/android/camera/module/Camera2Module;->access$1100(Lcom/android/camera/module/Camera2Module;)Z

    move-result v1

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1, v0}, Lcom/xiaomi/camera/core/ParallelTaskData;->setAbandoned(Z)V

    return-object p1
.end method

.method public onPictureTakenFinished(Z)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mModule:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mModule:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/Camera2Module;

    invoke-static {v0, p1}, Lcom/android/camera/module/Camera2Module;->access$3100(Lcom/android/camera/module/Camera2Module;Z)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->access$300()Ljava/lang/String;

    move-result-object p1

    const-string v0, "callback onShotFinished null"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method
