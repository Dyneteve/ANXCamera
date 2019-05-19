.class Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;
.super Landroid/os/AsyncTask;
.source "WideSelfieModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/WideSelfieModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SaveOutputImageTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field private mActivityRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera/Camera;",
            ">;"
        }
    .end annotation
.end field

.field private mCallback:Lcom/android/camera/module/WideSelfieModule$SaveStateCallback;

.field private final mFileName:Ljava/lang/String;

.field private mHeight:I

.field private mNv21Data:[B

.field private mOrientation:I

.field private mStopMode:Ljava/lang/String;

.field private mTriggerMode:I

.field private mWidth:I


# direct methods
.method public constructor <init>(Lcom/android/camera/Camera;Ljava/lang/String;[BIIIILjava/lang/String;Lcom/android/camera/module/WideSelfieModule$SaveStateCallback;)V
    .locals 0
    .param p1    # Lcom/android/camera/Camera;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p2, p0, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mFileName:Ljava/lang/String;

    iput-object p3, p0, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mNv21Data:[B

    iput p4, p0, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mWidth:I

    iput p5, p0, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mHeight:I

    iput p6, p0, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mOrientation:I

    iput p7, p0, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mTriggerMode:I

    iput-object p8, p0, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mStopMode:Ljava/lang/String;

    iput-object p9, p0, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mCallback:Lcom/android/camera/module/WideSelfieModule$SaveStateCallback;

    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mActivityRef:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private addImageAsApplication(Ljava/lang/String;Ljava/lang/String;III)V
    .locals 8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v5

    invoke-static {p1, p5, v5, v3, v4}, Lcom/android/camera/ExifHelper;->writeExifByFilePath(Ljava/lang/String;ILandroid/location/Location;J)V

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    move-object v1, p1

    move v2, p5

    move v6, p3

    move v7, p4

    invoke-static/range {v0 .. v7}, Lcom/android/camera/storage/Storage;->addImageForGroupOrPanorama(Landroid/content/Context;Ljava/lang/String;IJLandroid/location/Location;II)Landroid/net/Uri;

    move-result-object p3

    if-nez p3, :cond_0

    const-string p3, "WideSelfieModule"

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "insert MediaProvider failed, attempt to find uri by path, "

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p3, p4}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object p3

    invoke-static {p3, p1}, Lcom/android/camera/storage/MediaProviderUtil;->getContentUriFromPath(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p3

    :cond_0
    const-string p4, "WideSelfieModule"

    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "addImageAsApplication uri = "

    invoke-virtual {p5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", path = "

    invoke-virtual {p5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p4, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mActivityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/Camera;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object p4

    invoke-virtual {p4}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    if-eqz p3, :cond_1

    invoke-virtual {p1, p3, p2}, Lcom/android/camera/Camera;->onNewUriArrived(Landroid/net/Uri;Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    const/4 p4, 0x0

    invoke-static {p2, p3, p4}, Lcom/android/camera/Thumbnail;->createThumbnailFromUri(Landroid/content/ContentResolver;Landroid/net/Uri;Z)Lcom/android/camera/Thumbnail;

    move-result-object p2

    const-string p5, "WideSelfieModule"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "addImageAsApplication Thumbnail = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p5, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1, p3}, Lcom/android/camera/Util;->broadcastNewPicture(Landroid/content/Context;Landroid/net/Uri;)V

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object p1

    const/4 p3, 0x1

    invoke-virtual {p1, p2, p3, p4}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    :cond_1
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;
    .locals 22

    move-object/from16 v6, p0

    nop

    nop

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningShine()Lcom/android/camera/data/data/runing/ComponentRunningShine;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->supportBeautyLevel()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->getBeautyShowLevel()I

    move-result v0

    move v13, v2

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->supportSmoothLevel()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "pref_beautify_skin_smooth_ratio_key"

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;)I

    move-result v0

    move v13, v0

    move v0, v2

    goto :goto_0

    :cond_1
    move v0, v2

    move v13, v0

    :goto_0
    const/4 v14, 0x1

    if-gtz v0, :cond_3

    if-lez v13, :cond_2

    goto :goto_2

    :cond_2
    :goto_1
    move v7, v0

    goto/16 :goto_6

    :cond_3
    :goto_2
    nop

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->eY()Z

    move-result v1

    if-eqz v1, :cond_4

    const/4 v2, 0x2

    :goto_3
    move/from16 v20, v2

    goto :goto_4

    :cond_4
    invoke-static {}, Lcom/android/camera/Util;->isGlobalVersion()Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_3

    :cond_5
    move/from16 v20, v14

    :goto_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    new-instance v3, Lcom/android/camera/beautyshot/BeautyShot;

    invoke-direct {v3}, Lcom/android/camera/beautyshot/BeautyShot;-><init>()V

    invoke-virtual {v3}, Lcom/android/camera/beautyshot/BeautyShot;->init()V

    const-string v4, "WideSelfieModule"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "beautyShot start  mWidth "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, v6, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mWidth:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ", mHeight = "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, v6, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mHeight:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-lez v0, :cond_6

    add-int/lit8 v0, v0, -0x1

    const-string v4, "WideSelfieModule"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "beautyLevel "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v4, v6, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mNv21Data:[B

    iget v5, v6, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mWidth:I

    iget v7, v6, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mHeight:I

    const/16 v19, 0x10e

    move-object v15, v3

    move-object/from16 v16, v4

    move/from16 v17, v5

    move/from16 v18, v7

    move/from16 v21, v0

    invoke-virtual/range {v15 .. v21}, Lcom/android/camera/beautyshot/BeautyShot;->processByBeautyLevel([BIIIII)I

    goto :goto_5

    :cond_6
    if-lez v13, :cond_7

    const-string v4, "WideSelfieModule"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "beautyLevel smooth "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v8, v6, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mNv21Data:[B

    iget v9, v6, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mWidth:I

    iget v10, v6, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mHeight:I

    const/16 v11, 0x10e

    move-object v7, v3

    move/from16 v12, v20

    invoke-virtual/range {v7 .. v13}, Lcom/android/camera/beautyshot/BeautyShot;->processBySmoothLevel([BIIIII)I

    :cond_7
    :goto_5
    invoke-virtual {v3}, Lcom/android/camera/beautyshot/BeautyShot;->uninit()V

    const-string v3, "WideSelfieModule"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "beautyShot end, time = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long/2addr v7, v1

    invoke-virtual {v4, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    :goto_6
    iget-object v0, v6, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mNv21Data:[B

    iget v1, v6, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mWidth:I

    iget v2, v6, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mHeight:I

    invoke-static {v0, v1, v2}, Lcom/arcsoft/camera/utils/d;->b([BII)[B

    move-result-object v0

    iget-object v1, v6, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mFileName:Ljava/lang/String;

    invoke-static {v1}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/arcsoft/camera/utils/d;->b(Ljava/lang/String;[B)I

    iget-object v2, v6, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mFileName:Ljava/lang/String;

    iget v3, v6, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mWidth:I

    iget v4, v6, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mHeight:I

    iget v5, v6, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mOrientation:I

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->addImageAsApplication(Ljava/lang/String;Ljava/lang/String;III)V

    const/4 v15, 0x1

    const/16 v16, 0x0

    const/16 v17, 0xb0

    iget v0, v6, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mTriggerMode:I

    const/16 v19, 0x1

    const/16 v20, 0x0

    const-string v21, "auto-off"

    move/from16 v18, v0

    invoke-static/range {v15 .. v21}, Lcom/android/camera/statistic/CameraStatUtil;->trackGeneralInfo(IZIIZLcom/android/camera/MutexModeManager;Ljava/lang/String;)V

    iget-object v0, v6, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mStopMode:Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v14, v0, v1}, Lcom/android/camera/statistic/CameraStatUtil;->trackPictureTakenInWideSelfie(ILjava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Ljava/lang/Integer;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mCallback:Lcom/android/camera/module/WideSelfieModule$SaveStateCallback;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->mCallback:Lcom/android/camera/module/WideSelfieModule$SaveStateCallback;

    invoke-interface {p1}, Lcom/android/camera/module/WideSelfieModule$SaveStateCallback;->onSaveCompleted()V

    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->onPostExecute(Ljava/lang/Integer;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    const-string v0, "WideSelfieModule"

    const-string v1, "onPreExecute"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    if-nez v0, :cond_0

    const-string v0, "WideSelfieModule"

    const-string v1, "onPreExecute recordState is null"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPostSavingStart()V

    return-void
.end method
