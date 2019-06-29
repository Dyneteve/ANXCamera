.class final Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;
.super Lcom/android/camera2/Camera2Proxy$PictureCallbackWrapper;
.source "Camera2Module.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/Camera2Module;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "JpegQuickPictureCallback"
.end annotation


# instance fields
.field mBurstShotTitle:Ljava/lang/String;

.field mDropped:Z

.field mLocation:Landroid/location/Location;

.field mPressDownTitle:Ljava/lang/String;

.field mSavedJpegCallbackNum:I

.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;


# direct methods
.method public constructor <init>(Lcom/android/camera/module/Camera2Module;Landroid/location/Location;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-direct {p0}, Lcom/android/camera2/Camera2Proxy$PictureCallbackWrapper;-><init>()V

    iput-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mLocation:Landroid/location/Location;

    return-void
.end method

.method private getBurstShotTitle()Ljava/lang/String;
    .locals 6

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$700(Lcom/android/camera/module/Camera2Module;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mBurstShotTitle:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mSavedJpegCallbackNum:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mBurstShotTitle:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mPressDownTitle:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mBurstShotTitle:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mBurstShotTitle:Ljava/lang/String;

    if-nez v0, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mBurstShotTitle:Ljava/lang/String;

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mBurstShotTitle:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v4, 0x13

    if-eq v0, v4, :cond_1

    const-wide/16 v4, 0x3e8

    add-long/2addr v2, v4

    invoke-static {v2, v3}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mBurstShotTitle:Ljava/lang/String;

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mBurstShotTitle:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v2

    if-eqz v2, :cond_2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_UBIFOCUS_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mSavedJpegCallbackNum:I

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

    iget v2, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mSavedJpegCallbackNum:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public onPictureTaken([B)V
    .locals 24

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-boolean v1, v1, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez v1, :cond_13

    if-eqz p1, :cond_13

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    iget-object v3, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->access$1000(Lcom/android/camera/module/Camera2Module;)I

    move-result v3

    if-ge v2, v3, :cond_13

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->access$1100(Lcom/android/camera/module/Camera2Module;)Z

    move-result v2

    if-nez v2, :cond_0

    goto/16 :goto_a

    :cond_0
    iget v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mSavedJpegCallbackNum:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->access$1200(Lcom/android/camera/module/Camera2Module;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v2

    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->getBurstShotTitle()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mPressDownTitle:Ljava/lang/String;

    invoke-virtual {v2, v4, v5}, Lcom/android/camera/storage/ImageSaver;->updateImage(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    invoke-static {}, Lcom/android/camera/storage/Storage;->isLowStorageAtLastPoint()Z

    move-result v2

    const/4 v15, 0x0

    if-eqz v2, :cond_4

    iget-object v1, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v1, v1, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v1}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v1}, Lcom/android/camera/module/Camera2Module;->access$1100(Lcom/android/camera/module/Camera2Module;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mSavedJpegCallbackNum:I

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/module/Camera2Module;->trackGeneralInfo(IZ)V

    iget-object v4, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v5, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mSavedJpegCallbackNum:I

    const/4 v6, 0x1

    iget-object v1, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mLocation:Landroid/location/Location;

    if-eqz v1, :cond_2

    move v7, v3

    goto :goto_0

    :cond_2
    move v7, v15

    :goto_0
    iget-object v1, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v1}, Lcom/android/camera/module/Camera2Module;->access$2800(Lcom/android/camera/module/Camera2Module;)Ljava/lang/String;

    move-result-object v8

    iget-object v1, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v1}, Lcom/android/camera/module/Camera2Module;->access$2900(Lcom/android/camera/module/Camera2Module;)Z

    move-result v9

    iget-object v1, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v1}, Lcom/android/camera/module/Camera2Module;->access$3000(Lcom/android/camera/module/Camera2Module;)Z

    move-result v10

    invoke-virtual/range {v4 .. v10}, Lcom/android/camera/module/Camera2Module;->trackPictureTaken(IZZLjava/lang/String;ZZ)V

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$2700(Lcom/android/camera/module/Camera2Module;)V

    :cond_3
    return-void

    :cond_4
    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->access$804(Lcom/android/camera/module/Camera2Module;)I

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/storage/ImageSaver;->isSaveQueueFull()Z

    move-result v2

    if-nez v2, :cond_f

    iget v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mSavedJpegCallbackNum:I

    add-int/2addr v2, v3

    iput v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mSavedJpegCallbackNum:I

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v2

    if-nez v2, :cond_5

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    const/4 v4, 0x4

    invoke-virtual {v2, v4}, Lcom/android/camera/module/Camera2Module;->playCameraSound(I)V

    :cond_5
    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->access$000(Lcom/android/camera/module/Camera2Module;)Lio/reactivex/ObservableEmitter;

    move-result-object v2

    iget v4, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mSavedJpegCallbackNum:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v4}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v2

    if-eqz v2, :cond_6

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    iget-object v4, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v4}, Lcom/android/camera/module/Camera2Module;->access$1000(Lcom/android/camera/module/Camera2Module;)I

    move-result v4

    if-gt v2, v4, :cond_6

    move/from16 v16, v3

    goto :goto_1

    :cond_6
    nop

    move/from16 v16, v15

    :goto_1
    if-eqz v16, :cond_7

    move v14, v15

    goto :goto_2

    :cond_7
    invoke-static/range {p1 .. p1}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v2

    move v14, v2

    :goto_2
    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->access$2400(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    add-int/2addr v2, v14

    rem-int/lit16 v2, v2, 0xb4

    if-nez v2, :cond_8

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v2

    iget-object v4, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v4, v4, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v4}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v4

    :goto_3
    move v11, v2

    move v12, v4

    goto :goto_4

    :cond_8
    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v2

    iget-object v4, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v4, v4, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v4}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v4

    goto :goto_3

    :goto_4
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->getBurstShotTitle()Ljava/lang/String;

    move-result-object v5

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v2

    if-eqz v2, :cond_9

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    iget-object v4, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v4}, Lcom/android/camera/module/Camera2Module;->access$1000(Lcom/android/camera/module/Camera2Module;)I

    move-result v4

    sub-int/2addr v4, v3

    if-ne v2, v4, :cond_9

    move/from16 v17, v3

    goto :goto_5

    :cond_9
    nop

    move/from16 v17, v15

    :goto_5
    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v2

    if-eqz v2, :cond_a

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    iget-object v4, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v4}, Lcom/android/camera/module/Camera2Module;->access$1000(Lcom/android/camera/module/Camera2Module;)I

    move-result v4

    if-eq v2, v4, :cond_e

    :cond_a
    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    if-ne v2, v3, :cond_b

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->access$1200(Lcom/android/camera/module/Camera2Module;)Z

    move-result v2

    if-nez v2, :cond_b

    nop

    :goto_6
    move v4, v15

    goto :goto_8

    :cond_b
    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    iget-object v4, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v4}, Lcom/android/camera/module/Camera2Module;->access$1000(Lcom/android/camera/module/Camera2Module;)I

    move-result v4

    if-eq v2, v4, :cond_d

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->access$1200(Lcom/android/camera/module/Camera2Module;)Z

    move-result v2

    if-nez v2, :cond_d

    iget-boolean v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mDropped:Z

    if-eqz v2, :cond_c

    goto :goto_7

    :cond_c
    goto :goto_6

    :cond_d
    :goto_7
    nop

    move v4, v3

    :goto_8
    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v2

    const/4 v6, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    const/4 v9, 0x0

    iget-object v10, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mLocation:Landroid/location/Location;

    const/4 v13, 0x0

    const/16 v18, 0x1

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    iget-object v3, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->access$1900(Lcom/android/camera/module/Camera2Module;)Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v22

    const/16 v23, -0x1

    move-object/from16 v3, p1

    move v1, v15

    move/from16 v15, v16

    move/from16 v16, v17

    move/from16 v17, v18

    move/from16 v18, v19

    move/from16 v19, v20

    move-object/from16 v20, v21

    move-object/from16 v21, v22

    move/from16 v22, v23

    invoke-virtual/range {v2 .. v22}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;I)V

    iput-boolean v1, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mDropped:Z

    :cond_e
    goto :goto_9

    :cond_f
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->access$300()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CaptureBurst queue full and drop "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v4}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v3, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mDropped:Z

    iget-object v1, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v1}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result v1

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->access$1000(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    if-lt v1, v2, :cond_10

    iget-object v1, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v1, v1, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ThumbnailUpdater;->getLastThumbnailUncached()V

    :cond_10
    :goto_9
    iget-object v1, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v1}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)I

    move-result v1

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->access$1000(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    if-ge v1, v2, :cond_11

    iget-object v1, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v1}, Lcom/android/camera/module/Camera2Module;->access$1200(Lcom/android/camera/module/Camera2Module;)Z

    move-result v1

    if-nez v1, :cond_11

    iget-boolean v1, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mDropped:Z

    if-eqz v1, :cond_12

    :cond_11
    iget-object v0, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$2700(Lcom/android/camera/module/Camera2Module;)V

    :cond_12
    return-void

    :cond_13
    :goto_a
    return-void
.end method

.method public onPictureTakenFinished(Z)V
    .locals 0

    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p1}, Lcom/android/camera/module/Camera2Module;->access$2700(Lcom/android/camera/module/Camera2Module;)V

    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p1}, Lcom/android/camera/module/Camera2Module;->access$000(Lcom/android/camera/module/Camera2Module;)Lio/reactivex/ObservableEmitter;

    move-result-object p1

    invoke-interface {p1}, Lio/reactivex/ObservableEmitter;->onComplete()V

    return-void
.end method
