.class public Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;
.super Ljava/lang/Object;
.source "CaptureData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/core/CaptureData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CaptureDataBean"
.end annotation


# instance fields
.field private mIsFirstResult:Z

.field private mMainImage:Landroid/media/Image;

.field private mResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

.field private mStreamNum:I

.field private mSubImage:Landroid/media/Image;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mStreamNum:I

    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mMainImage:Landroid/media/Image;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mMainImage:Landroid/media/Image;

    invoke-virtual {v0}, Landroid/media/Image;->close()V

    iput-object v1, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mMainImage:Landroid/media/Image;

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mSubImage:Landroid/media/Image;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mSubImage:Landroid/media/Image;

    invoke-virtual {v0}, Landroid/media/Image;->close()V

    iput-object v1, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mSubImage:Landroid/media/Image;

    :cond_1
    return-void
.end method

.method public getMainImage()Landroid/media/Image;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mMainImage:Landroid/media/Image;

    return-object v0
.end method

.method public getResult()Lcom/xiaomi/protocol/ICustomCaptureResult;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

    return-object v0
.end method

.method public getStreamNum()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mStreamNum:I

    return v0
.end method

.method public getSubImage()Landroid/media/Image;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mSubImage:Landroid/media/Image;

    return-object v0
.end method

.method public isDataReady()Z
    .locals 4

    iget v0, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mStreamNum:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-ne v3, v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mMainImage:Landroid/media/Image;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mSubImage:Landroid/media/Image;

    if-eqz v0, :cond_0

    move v1, v2

    nop

    :cond_0
    return v1

    :cond_1
    iget v0, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mStreamNum:I

    if-ne v2, v0, :cond_3

    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mMainImage:Landroid/media/Image;

    if-eqz v0, :cond_2

    move v1, v2

    nop

    :cond_2
    return v1

    :cond_3
    return v1
.end method

.method public isFirstResult()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mIsFirstResult:Z

    return v0
.end method

.method public setCaptureResult(Lcom/xiaomi/protocol/ICustomCaptureResult;Z)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

    iput-boolean p2, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mIsFirstResult:Z

    return-void
.end method

.method public setImage(Landroid/media/Image;I)V
    .locals 2

    if-nez p2, :cond_0

    iput-object p1, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mMainImage:Landroid/media/Image;

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    if-ne p2, v0, :cond_1

    iput-object p1, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mSubImage:Landroid/media/Image;

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/xiaomi/camera/core/CaptureData;->access$000()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setImage: unknown imageFlag: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public setMainImage(Landroid/media/Image;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mMainImage:Landroid/media/Image;

    return-void
.end method

.method public setStreamNum(I)V
    .locals 0

    iput p1, p0, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->mStreamNum:I

    return-void
.end method
