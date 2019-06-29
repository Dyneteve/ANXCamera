.class public final Lcom/android/camera/storage/ParallelSaveRequest;
.super Ljava/lang/Object;
.source "ParallelSaveRequest.java"

# interfaces
.implements Lcom/android/camera/storage/SaveRequest;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAlgorithmName:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mData:[B

.field private mImageHeight:I

.field private mImageWidth:I

.field private mInfo:Lcom/xiaomi/camera/core/PictureInfo;

.field private mJpegRotation:I

.field private mLocation:Landroid/location/Location;

.field private mNeedThumbnail:Z

.field private mSavePath:Ljava/lang/String;

.field private mSaverCallback:Lcom/android/camera/storage/SaverCallback;

.field private mSize:I

.field private mStartTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/storage/ParallelSaveRequest;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/storage/ParallelSaveRequest;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>([BJLandroid/location/Location;ILjava/lang/String;IIZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera/storage/ParallelSaveRequest;->mData:[B

    iput-wide p2, p0, Lcom/android/camera/storage/ParallelSaveRequest;->mStartTime:J

    array-length p1, p1

    iput p1, p0, Lcom/android/camera/storage/ParallelSaveRequest;->mSize:I

    if-nez p4, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    new-instance p1, Landroid/location/Location;

    invoke-direct {p1, p4}, Landroid/location/Location;-><init>(Landroid/location/Location;)V

    :goto_0
    iput-object p1, p0, Lcom/android/camera/storage/ParallelSaveRequest;->mLocation:Landroid/location/Location;

    iput p5, p0, Lcom/android/camera/storage/ParallelSaveRequest;->mJpegRotation:I

    iput-object p6, p0, Lcom/android/camera/storage/ParallelSaveRequest;->mSavePath:Ljava/lang/String;

    iput p7, p0, Lcom/android/camera/storage/ParallelSaveRequest;->mImageWidth:I

    iput p8, p0, Lcom/android/camera/storage/ParallelSaveRequest;->mImageHeight:I

    iput-boolean p9, p0, Lcom/android/camera/storage/ParallelSaveRequest;->mNeedThumbnail:Z

    iput-object p10, p0, Lcom/android/camera/storage/ParallelSaveRequest;->mAlgorithmName:Ljava/lang/String;

    iput-object p11, p0, Lcom/android/camera/storage/ParallelSaveRequest;->mInfo:Lcom/xiaomi/camera/core/PictureInfo;

    return-void
.end method


# virtual methods
.method public getSize()I
    .locals 1

    iget v0, p0, Lcom/android/camera/storage/ParallelSaveRequest;->mSize:I

    return v0
.end method

.method public isFinal()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onFinish()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/storage/ParallelSaveRequest;->mData:[B

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackImageSaver(Ljava/lang/Object;I)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/storage/ParallelSaveRequest;->mData:[B

    iget-object v0, p0, Lcom/android/camera/storage/ParallelSaveRequest;->mSaverCallback:Lcom/android/camera/storage/SaverCallback;

    iget v1, p0, Lcom/android/camera/storage/ParallelSaveRequest;->mSize:I

    invoke-interface {v0, v1}, Lcom/android/camera/storage/SaverCallback;->onSaveFinish(I)V

    return-void
.end method

.method public run()V
    .locals 0

    invoke-virtual {p0}, Lcom/android/camera/storage/ParallelSaveRequest;->save()V

    invoke-virtual {p0}, Lcom/android/camera/storage/ParallelSaveRequest;->onFinish()V

    return-void
.end method

.method public save()V
    .locals 26

    move-object/from16 v0, p0

    sget-object v1, Lcom/android/camera/storage/ParallelSaveRequest;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "save: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mSavePath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " | "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v3, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mStartTime:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v1, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mImageWidth:I

    iget v2, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mImageHeight:I

    iget-object v3, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mData:[B

    invoke-static {v3}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v3

    iget v4, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mJpegRotation:I

    add-int/2addr v4, v3

    rem-int/lit16 v4, v4, 0xb4

    if-nez v4, :cond_0

    nop

    goto :goto_0

    :cond_0
    nop

    nop

    move/from16 v25, v2

    move v2, v1

    move/from16 v1, v25

    :goto_0
    invoke-static {}, Lcom/android/camera/db/DbRepository;->dbItemSaveTask()Lcom/android/camera/db/item/DbItemSaveTask;

    move-result-object v4

    iget-object v5, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mSavePath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/android/camera/db/item/DbItemSaveTask;->getItemByPath(Ljava/lang/String;)Lcom/android/camera/db/element/SaveTask;

    move-result-object v15

    const/4 v14, 0x0

    if-eqz v15, :cond_2

    invoke-virtual {v15}, Lcom/android/camera/db/element/SaveTask;->isValid()Z

    move-result v4

    if-nez v4, :cond_1

    goto/16 :goto_1

    :cond_1
    iget-object v4, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mSavePath:Ljava/lang/String;

    invoke-static {v4}, Lcom/android/camera/Util;->getFileTitleFromPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v15}, Lcom/android/camera/db/element/SaveTask;->getMediaStoreId()Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-static {v4, v5}, Lcom/xiaomi/camera/parallelservice/util/ParallelUtil;->getResultUri(J)Landroid/net/Uri;

    move-result-object v4

    sget-object v5, Lcom/android/camera/storage/ParallelSaveRequest;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "algo mark: uri: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " | "

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Lcom/android/camera/db/element/SaveTask;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v4, Lcom/android/camera/storage/ParallelSaveRequest;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "algo mark: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mJpegRotation:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " | "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " | "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " | "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v4, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v15}, Lcom/android/camera/db/element/SaveTask;->getMediaStoreId()Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-static {v4, v5, v6}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v7

    iget-object v4, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mContext:Landroid/content/Context;

    iget-object v5, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mData:[B

    const/4 v6, 0x0

    iget-object v9, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mLocation:Landroid/location/Location;

    const/4 v13, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    iget-object v12, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mAlgorithmName:Ljava/lang/String;

    iget-object v11, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mInfo:Lcom/xiaomi/camera/core/PictureInfo;

    move v10, v3

    move-object v3, v11

    move v11, v1

    move-object v1, v12

    move v12, v2

    move v2, v14

    move/from16 v14, v16

    move-object v2, v15

    move/from16 v15, v17

    move-object/from16 v16, v1

    move-object/from16 v17, v3

    invoke-static/range {v4 .. v17}, Lcom/android/camera/storage/Storage;->updateImageWithExtraExif(Landroid/content/Context;[BLcom/android/gallery3d/exif/ExifInterface;Landroid/net/Uri;Ljava/lang/String;Landroid/location/Location;IIILjava/lang/String;ZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)Z

    iget-object v0, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, v2, v1}, Lcom/xiaomi/camera/parallelservice/util/ParallelUtil;->markTaskFinish(Landroid/content/Context;Lcom/android/camera/db/element/SaveTask;Z)V

    goto/16 :goto_6

    :cond_2
    :goto_1
    move-object/from16 v25, v15

    move v15, v2

    move-object/from16 v2, v25

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-object v4, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mSavePath:Ljava/lang/String;

    if-eqz v4, :cond_3

    iget-object v4, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mSavePath:Ljava/lang/String;

    invoke-static {v4}, Lcom/android/camera/Util;->getFileTitleFromPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_2
    move-object v13, v4

    goto :goto_3

    :cond_3
    invoke-static {v6, v7}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    :goto_3
    iget-object v4, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mContext:Landroid/content/Context;

    iget-object v8, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mLocation:Landroid/location/Location;

    iget-object v10, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mData:[B

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/4 v12, 0x1

    if-eqz v2, :cond_4

    move/from16 v20, v12

    goto :goto_4

    :cond_4
    move/from16 v20, v14

    :goto_4
    iget-object v11, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mAlgorithmName:Ljava/lang/String;

    iget-object v9, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mInfo:Lcom/xiaomi/camera/core/PictureInfo;

    move-object v5, v13

    move-object/from16 v21, v9

    move v9, v3

    move-object/from16 v22, v11

    move v11, v1

    move v12, v15

    move-object/from16 v23, v13

    move/from16 v13, v16

    move/from16 v14, v17

    move/from16 v24, v15

    move/from16 v15, v18

    move/from16 v16, v19

    move/from16 v17, v20

    move-object/from16 v18, v22

    move-object/from16 v19, v21

    invoke-static/range {v4 .. v19}, Lcom/android/camera/storage/Storage;->addImage(Landroid/content/Context;Ljava/lang/String;JLandroid/location/Location;I[BIIZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)Landroid/net/Uri;

    move-result-object v4

    if-eqz v4, :cond_7

    iget-boolean v5, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mNeedThumbnail:Z

    if-eqz v5, :cond_6

    int-to-double v5, v1

    move/from16 v1, v24

    int-to-double v7, v1

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(DD)D

    move-result-wide v5

    const-wide/high16 v7, 0x4080000000000000L    # 512.0

    div-double/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-int v1, v5

    invoke-static {v1}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result v1

    iget-object v5, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mData:[B

    const/4 v6, 0x0

    invoke-static {v5, v3, v1, v4, v6}, Lcom/android/camera/Thumbnail;->createThumbnail([BIILandroid/net/Uri;Z)Lcom/android/camera/Thumbnail;

    move-result-object v1

    if-eqz v1, :cond_5

    iget-object v3, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mSaverCallback:Lcom/android/camera/storage/SaverCallback;

    const/4 v5, 0x1

    invoke-interface {v3, v1, v5}, Lcom/android/camera/storage/SaverCallback;->postUpdateThumbnail(Lcom/android/camera/Thumbnail;Z)V

    goto :goto_5

    :cond_5
    iget-object v1, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mSaverCallback:Lcom/android/camera/storage/SaverCallback;

    invoke-interface {v1}, Lcom/android/camera/storage/SaverCallback;->postHideThumbnailProgressing()V

    goto :goto_5

    :cond_6
    const/4 v6, 0x0

    :goto_5
    iget-object v1, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mSaverCallback:Lcom/android/camera/storage/SaverCallback;

    const/4 v3, 0x2

    move-object/from16 v5, v23

    invoke-interface {v1, v4, v5, v3}, Lcom/android/camera/storage/SaverCallback;->notifyNewMediaData(Landroid/net/Uri;Ljava/lang/String;I)V

    if-eqz v2, :cond_7

    sget-object v1, Lcom/android/camera/storage/ParallelSaveRequest;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "algo mark: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v4}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/android/camera/db/element/SaveTask;->setMediaStoreId(Ljava/lang/Long;)V

    iget-object v0, v0, Lcom/android/camera/storage/ParallelSaveRequest;->mContext:Landroid/content/Context;

    invoke-static {v0, v2, v6}, Lcom/xiaomi/camera/parallelservice/util/ParallelUtil;->markTaskFinish(Landroid/content/Context;Lcom/android/camera/db/element/SaveTask;Z)V

    :cond_7
    nop

    :goto_6
    return-void
.end method

.method public setContextAndCallback(Landroid/content/Context;Lcom/android/camera/storage/SaverCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/storage/ParallelSaveRequest;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/camera/storage/ParallelSaveRequest;->mSaverCallback:Lcom/android/camera/storage/SaverCallback;

    return-void
.end method
