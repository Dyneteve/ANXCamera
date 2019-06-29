.class public Lcom/android/camera/sticker/StickerInfo;
.super Lcom/android/camera/network/resource/Resource;
.source "StickerInfo.java"


# static fields
.field private static final EXTRA_FILTER_ID:Ljava/lang/String; = "filterId"


# instance fields
.field public downloadState:I

.field public imageId:I

.field public isLocal:Z

.field public srcPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/network/resource/Resource;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/sticker/StickerInfo;->downloadState:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/network/resource/Resource;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/sticker/StickerInfo;->downloadState:I

    iput-object p1, p0, Lcom/android/camera/sticker/StickerInfo;->srcPath:Ljava/lang/String;

    iput p2, p0, Lcom/android/camera/sticker/StickerInfo;->imageId:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/sticker/StickerInfo;->isLocal:Z

    return-void
.end method


# virtual methods
.method public getDownloadState()I
    .locals 2

    iget v0, p0, Lcom/android/camera/sticker/StickerInfo;->downloadState:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/sticker/StickerInfo;->isDownloaded()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    iget v0, p0, Lcom/android/camera/sticker/StickerInfo;->downloadState:I

    return v0
.end method

.method public getFilterId()I
    .locals 2

    iget-object v0, p0, Lcom/android/camera/sticker/StickerInfo;->extra:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/android/camera/sticker/StickerInfo;->extra:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "filterId"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    :cond_0
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    return v0
.end method

.method public getSrcPath()Ljava/lang/String;
    .locals 3

    iget-boolean v0, p0, Lcom/android/camera/sticker/StickerInfo;->isLocal:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/sticker/StickerInfo;->srcPath:Ljava/lang/String;

    return-object v0

    :cond_0
    invoke-static {}, Lcom/android/camera/sticker/StickerHelper;->getInstance()Lcom/android/camera/sticker/StickerHelper;

    move-result-object v0

    iget-wide v1, p0, Lcom/android/camera/sticker/StickerInfo;->id:J

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/sticker/StickerHelper;->getStickerPath(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isDownloaded()Z
    .locals 4

    iget-boolean v0, p0, Lcom/android/camera/sticker/StickerInfo;->isLocal:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-static {}, Lcom/android/camera/sticker/StickerHelper;->getInstance()Lcom/android/camera/sticker/StickerHelper;

    move-result-object v1

    iget-wide v2, p0, Lcom/android/camera/sticker/StickerInfo;->id:J

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/sticker/StickerHelper;->getStickerPath(J)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0
.end method
