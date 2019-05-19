.class public Lcom/xiaomi/camera/liveshot/LivePhotoResult;
.super Ljava/lang/Object;
.source "LivePhotoResult.java"


# instance fields
.field isGyroscopeStable:Z

.field mAEState:I

.field mAWBState:I

.field mFilterId:I

.field mTimpSnap:J


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAEState()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->mAEState:I

    return v0
.end method

.method public getAWBState()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->mAWBState:I

    return v0
.end method

.method public getFilterId()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->mFilterId:I

    return v0
.end method

.method public getTimeStamp()J
    .locals 2

    iget-wide v0, p0, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->mTimpSnap:J

    return-wide v0
.end method

.method public isGyroScopeStable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->isGyroscopeStable:Z

    return v0
.end method

.method public setAEState(I)V
    .locals 0

    iput p1, p0, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->mAEState:I

    return-void
.end method

.method public setAWBState(I)V
    .locals 0

    iput p1, p0, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->mAWBState:I

    return-void
.end method

.method public setFilterId(I)V
    .locals 0

    iput p1, p0, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->mFilterId:I

    return-void
.end method

.method public setGyroscropStable(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->isGyroscopeStable:Z

    return-void
.end method

.method public setTimeStamp(J)V
    .locals 0

    iput-wide p1, p0, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->mTimpSnap:J

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "LivePhoto AEState is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->mAEState:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " time stamp is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->mTimpSnap:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " gryo is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->isGyroscopeStable:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " filterid is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->mFilterId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " awb is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->mAWBState:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
