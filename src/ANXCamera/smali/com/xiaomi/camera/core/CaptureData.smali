.class public Lcom/xiaomi/camera/core/CaptureData;
.super Ljava/lang/Object;
.source "CaptureData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAlgoType:I

.field private mAlreadyDataNum:I

.field private mBurstNum:I

.field private mCaptureDataBeanList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;",
            ">;"
        }
    .end annotation
.end field

.field private mCaptureDataListener:Lcom/xiaomi/camera/core/CaptureDataListener;

.field private mCaptureTimestamp:J

.field private mCapturedByFrontCamera:Z

.field private mDataListener:Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;

.field private mIsAbandoned:Z

.field private mMultiFrameProcessResult:Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

.field private mSaveInputImage:Z

.field private mStreamNum:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/xiaomi/camera/core/CaptureData;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/core/CaptureData;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(IIIJZ)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mCaptureDataBeanList:Ljava/util/List;

    const/4 v0, 0x0

    iput v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mAlreadyDataNum:I

    iput p1, p0, Lcom/xiaomi/camera/core/CaptureData;->mAlgoType:I

    iput p2, p0, Lcom/xiaomi/camera/core/CaptureData;->mStreamNum:I

    iput p3, p0, Lcom/xiaomi/camera/core/CaptureData;->mBurstNum:I

    iput-wide p4, p0, Lcom/xiaomi/camera/core/CaptureData;->mCaptureTimestamp:J

    iput-boolean p6, p0, Lcom/xiaomi/camera/core/CaptureData;->mIsAbandoned:Z

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/xiaomi/camera/core/CaptureData;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public getAlgoType()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mAlgoType:I

    return v0
.end method

.method public getBurstNum()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mBurstNum:I

    return v0
.end method

.method public getCaptureDataBeanList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mCaptureDataBeanList:Ljava/util/List;

    return-object v0
.end method

.method public getCaptureDataListener()Lcom/xiaomi/camera/core/CaptureDataListener;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mCaptureDataListener:Lcom/xiaomi/camera/core/CaptureDataListener;

    return-object v0
.end method

.method public getCaptureTimestamp()J
    .locals 2

    iget-wide v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mCaptureTimestamp:J

    return-wide v0
.end method

.method public getDataListener()Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mDataListener:Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;

    return-object v0
.end method

.method public getMultiFrameProcessResult()Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mMultiFrameProcessResult:Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    return-object v0
.end method

.method public getStreamNum()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mStreamNum:I

    return v0
.end method

.method public isAbandoned()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mIsAbandoned:Z

    return v0
.end method

.method public isCapturedByFrontCamera()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mCapturedByFrontCamera:Z

    return v0
.end method

.method public isDataReady()Z
    .locals 2

    iget v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mAlreadyDataNum:I

    iget v1, p0, Lcom/xiaomi/camera/core/CaptureData;->mBurstNum:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSaveInputImage()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mSaveInputImage:Z

    return v0
.end method

.method public putCaptureDataBean(Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mCaptureDataBeanList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget p1, p0, Lcom/xiaomi/camera/core/CaptureData;->mAlreadyDataNum:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/xiaomi/camera/core/CaptureData;->mAlreadyDataNum:I

    return-void
.end method

.method public setCapturedByFrontCamera(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/xiaomi/camera/core/CaptureData;->mCapturedByFrontCamera:Z

    return-void
.end method

.method public setDataListener(Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/core/CaptureData;->mDataListener:Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;

    return-void
.end method

.method public setMultiFrameProcessListener(Lcom/xiaomi/camera/core/CaptureDataListener;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/core/CaptureData;->mCaptureDataListener:Lcom/xiaomi/camera/core/CaptureDataListener;

    return-void
.end method

.method public setMultiFrameProcessResult(Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/core/CaptureData;->mMultiFrameProcessResult:Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    return-void
.end method

.method public setSaveInputImage(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/xiaomi/camera/core/CaptureData;->mSaveInputImage:Z

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v1, "CaptureData{mAlgoType=%d, mStreamNum=%d, mBurstNum=%d, mCaptureTimestamp=%d, mIsAbandoned=%b}"

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p0, Lcom/xiaomi/camera/core/CaptureData;->mAlgoType:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget v3, p0, Lcom/xiaomi/camera/core/CaptureData;->mStreamNum:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    iget v3, p0, Lcom/xiaomi/camera/core/CaptureData;->mBurstNum:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    iget-wide v3, p0, Lcom/xiaomi/camera/core/CaptureData;->mCaptureTimestamp:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x3

    aput-object v3, v2, v4

    iget-boolean v3, p0, Lcom/xiaomi/camera/core/CaptureData;->mIsAbandoned:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const/4 v4, 0x4

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
