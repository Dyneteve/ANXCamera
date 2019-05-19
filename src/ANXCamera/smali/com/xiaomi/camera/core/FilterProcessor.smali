.class public Lcom/xiaomi/camera/core/FilterProcessor;
.super Ljava/lang/Object;
.source "FilterProcessor.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mRenderSize:Landroid/util/Size;

.field private mYuvSnapshotRender:Lcom/android/camera/effect/renders/SnapshotRender;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/xiaomi/camera/core/FilterProcessor;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/core/FilterProcessor;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/Size;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Landroid/util/Size;-><init>(II)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mRenderSize:Landroid/util/Size;

    return-void
.end method

.method private static getDrawYuvAttribute(Landroid/media/Image;ZLcom/xiaomi/camera/core/ParallelTaskData;)Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;
    .locals 19

    invoke-virtual/range {p2 .. p2}, Lcom/xiaomi/camera/core/ParallelTaskData;->getDataParameter()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object v0

    new-instance v18, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPreviewSize()Landroid/util/Size;

    move-result-object v3

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureSize()Landroid/util/Size;

    move-result-object v4

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getFilterId()I

    move-result v5

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getOrientation()I

    move-result v6

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getJpegRotation()I

    move-result v7

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getShootRotation()F

    move-result v8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->isMirror()Z

    move-result v11

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->isGradienterOn()Z

    move-result v13

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getTiltShiftMode()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getTimeWaterMarkString()Ljava/lang/String;

    move-result-object v15

    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/EffectController;->copyEffectRectAttribute()Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    move-result-object v16

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getFaceWaterMarkList()Ljava/util/List;

    move-result-object v17

    move-object/from16 v1, v18

    move-object/from16 v2, p0

    move/from16 v12, p1

    invoke-direct/range {v1 .. v17}, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;-><init>(Landroid/media/Image;Landroid/util/Size;Landroid/util/Size;IIIFJZZZLjava/lang/String;Ljava/lang/String;Lcom/android/camera/effect/EffectController$EffectRectAttribute;Ljava/util/List;)V

    return-object v18
.end method

.method private isWatermarkEnabled(Lcom/xiaomi/camera/core/ParallelTaskData;)Z
    .locals 1

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getDataParameter()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->isHasDualWaterMark()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getTimeWaterMarkString()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->isAgeGenderAndMagicMirrorWater()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private prepareEffectProcessor(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;)V
    .locals 6

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getFilterId()I

    move-result v0

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureSize()Landroid/util/Size;

    move-result-object v1

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getDualWatermarkParam()Lcom/android/camera/effect/renders/DualWatermarkParam;

    move-result-object p1

    iget-object v2, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mYuvSnapshotRender:Lcom/android/camera/effect/renders/SnapshotRender;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mRenderSize:Landroid/util/Size;

    invoke-virtual {v2, v1}, Landroid/util/Size;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    invoke-virtual {p0, v1}, Lcom/xiaomi/camera/core/FilterProcessor;->init(Landroid/util/Size;)V

    :cond_1
    sget-object v1, Lcom/xiaomi/camera/core/FilterProcessor;->TAG:Ljava/lang/String;

    const-string v2, "prepareEffectProcessor: %x"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mYuvSnapshotRender:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-virtual {v1, p1, v0}, Lcom/android/camera/effect/renders/SnapshotRender;->prepareEffectRender(Lcom/android/camera/effect/renders/DualWatermarkParam;I)V

    return-void
.end method

.method private releaseEffectProcessor()V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mYuvSnapshotRender:Lcom/android/camera/effect/renders/SnapshotRender;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mYuvSnapshotRender:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mYuvSnapshotRender:Lcom/android/camera/effect/renders/SnapshotRender;

    :cond_0
    return-void
.end method

.method private shouldApplyEffect(Lcom/xiaomi/camera/core/ParallelTaskData;)Z
    .locals 3
    .param p1    # Lcom/xiaomi/camera/core/ParallelTaskData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lcom/xiaomi/camera/core/FilterProcessor;->isWatermarkEnabled(Lcom/xiaomi/camera/core/ParallelTaskData;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getDataParameter()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object p1

    if-eqz p1, :cond_2

    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getFilterId()I

    move-result v2

    if-ne v0, v2, :cond_1

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->isGradienterOn()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getTiltShiftMode()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    :cond_1
    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    return v1
.end method


# virtual methods
.method public deInit()V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/camera/core/FilterProcessor;->releaseEffectProcessor()V

    return-void
.end method

.method public doFilterSync(Lcom/xiaomi/camera/core/ParallelTaskData;Landroid/media/Image;I)Landroid/media/Image;
    .locals 2
    .param p1    # Lcom/xiaomi/camera/core/ParallelTaskData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/media/Image;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getDataParameter()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/xiaomi/camera/core/FilterProcessor;->shouldApplyEffect(Lcom/xiaomi/camera/core/ParallelTaskData;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-direct {p0, v0}, Lcom/xiaomi/camera/core/FilterProcessor;->prepareEffectProcessor(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;)V

    if-nez p3, :cond_0

    invoke-direct {p0, p1}, Lcom/xiaomi/camera/core/FilterProcessor;->isWatermarkEnabled(Lcom/xiaomi/camera/core/ParallelTaskData;)Z

    move-result p3

    if-eqz p3, :cond_0

    const/4 p3, 0x1

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    invoke-static {p2, p3, p1}, Lcom/xiaomi/camera/core/FilterProcessor;->getDrawYuvAttribute(Landroid/media/Image;ZLcom/xiaomi/camera/core/ParallelTaskData;)Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;

    move-result-object p3

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getJpegQuality()I

    move-result v1

    iput v1, p3, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mJpegQuality:I

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getOutputSize()Landroid/util/Size;

    move-result-object v0

    iput-object v0, p3, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOutputSize:Landroid/util/Size;

    iget-object v0, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mYuvSnapshotRender:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-virtual {v0, p3}, Lcom/android/camera/effect/renders/SnapshotRender;->processImageSync(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)V

    iget-object v0, p3, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mDataOfTheRegionUnderWatermarks:[B

    invoke-virtual {p1, v0}, Lcom/xiaomi/camera/core/ParallelTaskData;->setDataOfTheRegionUnderWatermarks([B)V

    iget-object p3, p3, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mCoordinatesOfTheRegionUnderWatermarks:[I

    invoke-virtual {p1, p3}, Lcom/xiaomi/camera/core/ParallelTaskData;->setCoordinatesOfTheRegionUnderWatermarks([I)V

    :cond_1
    return-object p2
.end method

.method public init(Landroid/util/Size;)V
    .locals 1

    invoke-direct {p0}, Lcom/xiaomi/camera/core/FilterProcessor;->releaseEffectProcessor()V

    new-instance v0, Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-direct {v0, p1}, Lcom/android/camera/effect/renders/SnapshotRender;-><init>(Landroid/util/Size;)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mYuvSnapshotRender:Lcom/android/camera/effect/renders/SnapshotRender;

    iput-object p1, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mRenderSize:Landroid/util/Size;

    return-void
.end method
