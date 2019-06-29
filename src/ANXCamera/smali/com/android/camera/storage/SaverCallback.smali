.class public interface abstract Lcom/android/camera/storage/SaverCallback;
.super Ljava/lang/Object;
.source "SaverCallback.java"


# static fields
.field public static final FILE_TYPE_IMAGE:I = 0x2

.field public static final FILE_TYPE_VIDEO:I = 0x1


# virtual methods
.method public abstract needThumbnail(Z)Z
.end method

.method public abstract notifyNewMediaData(Landroid/net/Uri;Ljava/lang/String;I)V
.end method

.method public abstract onSaveFinish(I)V
.end method

.method public abstract postHideThumbnailProgressing()V
.end method

.method public abstract postUpdateThumbnail(Lcom/android/camera/Thumbnail;Z)V
.end method

.method public abstract updatePreviewThumbnailUri(ILandroid/net/Uri;)V
.end method
