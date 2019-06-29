.class public Lcom/android/camera/storage/VideoSaveRequest;
.super Ljava/lang/Object;
.source "VideoSaveRequest.java"

# interfaces
.implements Lcom/android/camera/storage/SaveRequest;


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoSaveRequest"


# instance fields
.field private context:Landroid/content/Context;

.field private mContentValues:Landroid/content/ContentValues;

.field private mIsFinal:Z

.field public mUri:Landroid/net/Uri;

.field private mVideoPath:Ljava/lang/String;

.field private saverCallback:Lcom/android/camera/storage/SaverCallback;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/ContentValues;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera/storage/VideoSaveRequest;->mVideoPath:Ljava/lang/String;

    iput-object p2, p0, Lcom/android/camera/storage/VideoSaveRequest;->mContentValues:Landroid/content/ContentValues;

    iput-boolean p3, p0, Lcom/android/camera/storage/VideoSaveRequest;->mIsFinal:Z

    return-void
.end method

.method private addVideoToMediaStore(Ljava/lang/String;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 6

    nop

    invoke-static {}, Lcom/android/camera/storage/Storage;->isUseDocumentMode()Z

    move-result v0

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    if-nez v0, :cond_0

    invoke-static {p1}, Lcom/android/camera/Util;->getDuration(Ljava/lang/String;)J

    move-result-wide v4

    cmp-long v0, v1, v4

    if-nez v0, :cond_1

    new-instance p2, Ljava/io/File;

    invoke-direct {p2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    move-result p2

    const-string v0, "VideoSaveRequest"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "delete invalid video: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", deleted : "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v3

    :cond_0
    nop

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p1, v0}, Lcom/android/camera/FileCompat;->getParcelFileDescriptor(Ljava/lang/String;Z)Landroid/os/ParcelFileDescriptor;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v4

    invoke-static {v4}, Lcom/android/camera/Util;->getDuration(Ljava/io/FileDescriptor;)J

    move-result-wide v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {v0}, Lcom/android/camera/Util;->closeSafely(Ljava/io/Closeable;)V

    invoke-static {p1}, Lcom/android/camera/FileCompat;->removeDocumentFileForPath(Ljava/lang/String;)V

    goto :goto_2

    :catchall_0
    move-exception p2

    goto :goto_0

    :catch_0
    move-exception v4

    goto :goto_1

    :catchall_1
    move-exception p2

    move-object v0, v3

    :goto_0
    invoke-static {v0}, Lcom/android/camera/Util;->closeSafely(Ljava/io/Closeable;)V

    invoke-static {p1}, Lcom/android/camera/FileCompat;->removeDocumentFileForPath(Ljava/lang/String;)V

    throw p2

    :catch_1
    move-exception v0

    move-object v0, v3

    :goto_1
    invoke-static {v0}, Lcom/android/camera/Util;->closeSafely(Ljava/io/Closeable;)V

    invoke-static {p1}, Lcom/android/camera/FileCompat;->removeDocumentFileForPath(Ljava/lang/String;)V

    nop

    move-wide v4, v1

    :goto_2
    cmp-long v0, v1, v4

    if-nez v0, :cond_1

    const-string p2, "VideoSaveRequest"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "delete invalid video: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1}, Lcom/android/camera/FileCompat;->deleteFile(Ljava/lang/String;)Z

    return-object v3

    :cond_1
    nop

    const-string v0, "_size"

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p2, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p1, "duration"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p2, p1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    :try_start_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object p1, p0, Lcom/android/camera/storage/VideoSaveRequest;->context:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v2, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p1, v2, p2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    :try_start_3
    const-string p2, "VideoSaveRequest"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "addVideoToMediaStore: insert video cost: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v0

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "ms"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    const-string p2, "VideoSaveRequest"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Current video URI: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    :catchall_2
    move-exception p2

    goto :goto_5

    :catch_2
    move-exception p2

    move-object v3, p1

    goto :goto_3

    :catchall_3
    move-exception p2

    move-object p1, v3

    goto :goto_5

    :catch_3
    move-exception p2

    :goto_3
    :try_start_4
    const-string p1, "VideoSaveRequest"

    const-string v0, "failed to add video to media store"

    invoke-static {p1, v0, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    const-string p1, "VideoSaveRequest"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Current video URI: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    nop

    move-object p1, v3

    :goto_4
    return-object p1

    :goto_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Current video URI: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "VideoSaveRequest"

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    throw p2
.end method

.method private checkExternalStorageThumbnailInterupt(Ljava/lang/String;)Z
    .locals 1

    invoke-static {p1}, Lcom/android/camera/storage/Storage;->isSecondPhoneStorage(Ljava/lang/String;)Z

    move-result p1

    invoke-static {}, Lcom/android/camera/storage/Storage;->isUsePhoneStorage()Z

    move-result v0

    if-eqz p1, :cond_0

    if-eqz v0, :cond_0

    const-string p1, "VideoSaveRequest"

    const-string v0, "save video: sd card was ejected"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method


# virtual methods
.method public getSize()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isFinal()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/storage/VideoSaveRequest;->mIsFinal:Z

    return v0
.end method

.method public onFinish()V
    .locals 2

    const-string v0, "VideoSaveRequest"

    const-string v1, "onFinish: runnable process finished"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/storage/VideoSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    invoke-virtual {p0}, Lcom/android/camera/storage/VideoSaveRequest;->getSize()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/camera/storage/SaverCallback;->onSaveFinish(I)V

    return-void
.end method

.method public run()V
    .locals 0

    invoke-virtual {p0}, Lcom/android/camera/storage/VideoSaveRequest;->save()V

    invoke-virtual {p0}, Lcom/android/camera/storage/VideoSaveRequest;->onFinish()V

    return-void
.end method

.method public save()V
    .locals 8

    const-string v0, "VideoSaveRequest"

    const-string v1, "save video: start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/storage/VideoSaveRequest;->mContentValues:Landroid/content/ContentValues;

    const-string v1, "_data"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/storage/VideoSaveRequest;->mVideoPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/android/camera/storage/VideoSaveRequest;->mVideoPath:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_0

    iput-object v0, p0, Lcom/android/camera/storage/VideoSaveRequest;->mVideoPath:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/storage/VideoSaveRequest;->mContentValues:Landroid/content/ContentValues;

    const-string v1, "_data"

    iget-object v2, p0, Lcom/android/camera/storage/VideoSaveRequest;->mVideoPath:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/camera/storage/VideoSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    invoke-virtual {p0}, Lcom/android/camera/storage/VideoSaveRequest;->isFinal()Z

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/camera/storage/SaverCallback;->needThumbnail(Z)Z

    move-result v0

    iget-object v1, p0, Lcom/android/camera/storage/VideoSaveRequest;->mVideoPath:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/camera/storage/VideoSaveRequest;->mContentValues:Landroid/content/ContentValues;

    invoke-direct {p0, v1, v2}, Lcom/android/camera/storage/VideoSaveRequest;->addVideoToMediaStore(Ljava/lang/String;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/storage/VideoSaveRequest;->mUri:Landroid/net/Uri;

    iget-object v1, p0, Lcom/android/camera/storage/VideoSaveRequest;->mUri:Landroid/net/Uri;

    if-nez v1, :cond_2

    const-string v1, "VideoSaveRequest"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "insert MediaProvider failed, attempt to find uri by path, "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/storage/VideoSaveRequest;->mVideoPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/camera/storage/VideoSaveRequest;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/camera/storage/VideoSaveRequest;->mVideoPath:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/android/camera/storage/MediaProviderUtil;->getContentUriFromPath(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/storage/VideoSaveRequest;->mUri:Landroid/net/Uri;

    :cond_2
    const-string v1, "VideoSaveRequest"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "save video: media has been stored, Uri: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/storage/VideoSaveRequest;->mUri:Landroid/net/Uri;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ", has thumbnail: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/camera/storage/VideoSaveRequest;->mUri:Landroid/net/Uri;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/android/camera/storage/VideoSaveRequest;->mVideoPath:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/android/camera/storage/VideoSaveRequest;->checkExternalStorageThumbnailInterupt(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/storage/VideoSaveRequest;->mVideoPath:Ljava/lang/String;

    const/16 v3, 0x200

    invoke-static {v0, v3}, Lcom/android/camera/Thumbnail;->createVideoThumbnailBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v3, p0, Lcom/android/camera/storage/VideoSaveRequest;->mUri:Landroid/net/Uri;

    invoke-static {v3, v0, v2, v2}, Lcom/android/camera/Thumbnail;->createThumbnail(Landroid/net/Uri;Landroid/graphics/Bitmap;IZ)Lcom/android/camera/Thumbnail;

    move-result-object v0

    iget-object v3, p0, Lcom/android/camera/storage/VideoSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    invoke-interface {v3, v0, v1}, Lcom/android/camera/storage/SaverCallback;->postUpdateThumbnail(Lcom/android/camera/Thumbnail;Z)V

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/android/camera/storage/VideoSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    invoke-interface {v0}, Lcom/android/camera/storage/SaverCallback;->postHideThumbnailProgressing()V

    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/android/camera/storage/VideoSaveRequest;->mContentValues:Landroid/content/ContentValues;

    const-string v3, "title"

    invoke-virtual {v0, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v3, p0, Lcom/android/camera/storage/VideoSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    iget-object v4, p0, Lcom/android/camera/storage/VideoSaveRequest;->mUri:Landroid/net/Uri;

    invoke-interface {v3, v4, v0, v1}, Lcom/android/camera/storage/SaverCallback;->notifyNewMediaData(Landroid/net/Uri;Ljava/lang/String;I)V

    iget-object v0, p0, Lcom/android/camera/storage/VideoSaveRequest;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/camera/storage/VideoSaveRequest;->mVideoPath:Ljava/lang/String;

    const-wide/16 v4, -0x1

    iget-object v6, p0, Lcom/android/camera/storage/VideoSaveRequest;->mContentValues:Landroid/content/ContentValues;

    const-string v7, "latitude"

    invoke-virtual {v6, v7}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_5

    iget-object v6, p0, Lcom/android/camera/storage/VideoSaveRequest;->mContentValues:Landroid/content/ContentValues;

    const-string v7, "longitude"

    invoke-virtual {v6, v7}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_5

    goto :goto_2

    :cond_5
    move v1, v2

    :goto_2
    invoke-static {v0, v3, v4, v5, v1}, Lcom/android/camera/storage/Storage;->saveToCloudAlbum(Landroid/content/Context;Ljava/lang/String;JZ)V

    goto :goto_3

    :cond_6
    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/android/camera/storage/VideoSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    invoke-interface {v0}, Lcom/android/camera/storage/SaverCallback;->postHideThumbnailProgressing()V

    :cond_7
    :goto_3
    const-string v0, "VideoSaveRequest"

    const-string v1, "save video: end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setContextAndCallback(Landroid/content/Context;Lcom/android/camera/storage/SaverCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/storage/VideoSaveRequest;->context:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/camera/storage/VideoSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    return-void
.end method
