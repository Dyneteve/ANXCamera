.class public Lcom/arcsoft/supernight/SuperNightProcess;
.super Ljava/lang/Object;
.source "SuperNightProcess.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;,
        Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;,
        Lcom/arcsoft/supernight/SuperNightProcess$Param;,
        Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;
    }
.end annotation


# static fields
.field public static final ARC_INPUT_IMAGE_COUNT:I = 0x8

.field public static final ARC_SN_CAMERA_MODE_UNKNOWN:I = -0x1

.field public static final ARC_SN_CAMERA_MODE_XIAOMI_G80_GW1:I = 0x701

.field public static final ARC_SN_CAMERA_MODE_XIAOMI_G90_GW1:I = 0x701

.field public static final ARC_SN_CAMERA_MODE_XIAOMI_SDM855_12MB_IMX586:I = 0x700

.field public static final ARC_SN_CAMERA_STATE_HAND:I = 0x2

.field public static final ARC_SN_CAMERA_STATE_UNKNOWN:I = 0x0

.field public static final ARC_SN_MAX_INPUT_IMAGE_NUM:I = 0x14

.field public static final ARC_SN_SCENEMODE_INDOOR:I = 0x1

.field public static final ARC_SN_SCENEMODE_LOWLIGHT:I = 0x3

.field public static final ARC_SN_SCENEMODE_OUTDOOR:I = 0x2

.field public static final ARC_SN_SCENEMODE_PORTRAIT:I = 0x4

.field public static final ARC_SN_SCENEMODE_UNKNOW:I = 0x0

.field public static final ASVL_PAF_NV12:I = 0x801

.field public static final ASVL_PAF_NV21:I = 0x802

.field public static final ASVL_PAF_RAW10_BGGR_10B:I = 0xd04

.field public static final ASVL_PAF_RAW10_BGGR_16B:I = 0xd0c

.field public static final ASVL_PAF_RAW10_GBRG_10B:I = 0xd03

.field public static final ASVL_PAF_RAW10_GBRG_16B:I = 0xd0b

.field public static final ASVL_PAF_RAW10_GRAY_10B:I = 0xe01

.field public static final ASVL_PAF_RAW10_GRAY_16B:I = 0xe81

.field public static final ASVL_PAF_RAW10_GRBG_10B:I = 0xd02

.field public static final ASVL_PAF_RAW10_GRBG_16B:I = 0xd0a

.field public static final ASVL_PAF_RAW10_RGGB_10B:I = 0xd01

.field public static final ASVL_PAF_RAW10_RGGB_16B:I = 0xd09

.field public static final ASVL_PAF_RAW12_BGGR_12B:I = 0xd08

.field public static final ASVL_PAF_RAW12_BGGR_16B:I = 0xd14

.field public static final ASVL_PAF_RAW12_GBRG_12B:I = 0xd07

.field public static final ASVL_PAF_RAW12_GBRG_16B:I = 0xd13

.field public static final ASVL_PAF_RAW12_GRAY_12B:I = 0xe11

.field public static final ASVL_PAF_RAW12_GRAY_16B:I = 0xe91

.field public static final ASVL_PAF_RAW12_GRBG_12B:I = 0xd06

.field public static final ASVL_PAF_RAW12_GRBG_16B:I = 0xd12

.field public static final ASVL_PAF_RAW12_RGGB_12B:I = 0xd05

.field public static final ASVL_PAF_RAW12_RGGB_16B:I = 0xd11

.field public static final ASVL_PAF_RAW14_BGGR_14B:I = 0xd38

.field public static final ASVL_PAF_RAW14_BGGR_16B:I = 0xd44

.field public static final ASVL_PAF_RAW14_GBRG_14B:I = 0xd37

.field public static final ASVL_PAF_RAW14_GBRG_16B:I = 0xd43

.field public static final ASVL_PAF_RAW14_GRAY_14B:I = 0xe21

.field public static final ASVL_PAF_RAW14_GRAY_16B:I = 0xea1

.field public static final ASVL_PAF_RAW14_GRBG_14B:I = 0xd36

.field public static final ASVL_PAF_RAW14_GRBG_16B:I = 0xd42

.field public static final ASVL_PAF_RAW14_RGGB_14B:I = 0xd35

.field public static final ASVL_PAF_RAW14_RGGB_16B:I = 0xd41

.field public static final ASVL_PAF_RAW16_BGGR_16B:I = 0xd24

.field public static final ASVL_PAF_RAW16_GBRG_16B:I = 0xd23

.field public static final ASVL_PAF_RAW16_GRAY_16B:I = 0xe31

.field public static final ASVL_PAF_RAW16_GRBG_16B:I = 0xd22

.field public static final ASVL_PAF_RAW16_RGGB_16B:I = 0xd21

.field private static final TAG:Ljava/lang/String; = "SuperNightProcess"


# instance fields
.field private mMetdata:Landroid/hardware/camera2/TotalCaptureResult;

.field private mResultInputInfo:Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;

.field private mSuperNightJni:Lcom/arcsoft/supernight/SuperNightJni;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/arcsoft/supernight/SuperNightJni;

    invoke-direct {v0}, Lcom/arcsoft/supernight/SuperNightJni;-><init>()V

    iput-object v0, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mSuperNightJni:Lcom/arcsoft/supernight/SuperNightJni;

    return-void
.end method


# virtual methods
.method public addAllInputInfo(Ljava/util/ArrayList;Ljava/util/ArrayList;I)I
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/media/Image;",
            ">;",
            "Ljava/util/ArrayList<",
            "Landroid/hardware/camera2/TotalCaptureResult;",
            ">;I)I"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    const/4 v3, -0x1

    if-eqz v1, :cond_a

    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_a

    if-eqz v2, :cond_a

    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_a

    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ne v4, v5, :cond_a

    iget-object v4, v0, Lcom/arcsoft/supernight/SuperNightProcess;->mSuperNightJni:Lcom/arcsoft/supernight/SuperNightJni;

    if-nez v4, :cond_0

    goto/16 :goto_5

    :cond_0
    new-instance v4, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;

    invoke-direct {v4, v0}, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;-><init>(Lcom/arcsoft/supernight/SuperNightProcess;)V

    const/4 v5, 0x0

    move-object v6, v4

    move v4, v5

    :goto_0
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v7

    const/4 v8, 0x0

    if-ge v4, v7, :cond_7

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/media/Image;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/hardware/camera2/TotalCaptureResult;

    if-eqz v7, :cond_6

    if-nez v9, :cond_1

    goto/16 :goto_2

    :cond_1
    new-instance v10, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;

    invoke-direct {v10, v0}, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;-><init>(Lcom/arcsoft/supernight/SuperNightProcess;)V

    iput v4, v10, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;->curIndex:I

    const/16 v11, 0x8

    iput v11, v10, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;->imgNum:I

    const/4 v11, 0x2

    iput v11, v10, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;->cameraState:I

    new-instance v12, Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;

    invoke-direct {v12, v0}, Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;-><init>(Lcom/arcsoft/supernight/SuperNightProcess;)V

    iput v5, v12, Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;->rawType:I

    iget-object v13, v12, Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;->blackLevel:[I

    const/16 v14, 0x40

    aput v14, v13, v5

    sget-object v13, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_EXPOSURE_COMPENSATION:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v9, v13}, Landroid/hardware/camera2/TotalCaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    if-eqz v9, :cond_2

    iget-object v13, v12, Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;->evList:[I

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v15

    aput v15, v13, v5

    iget-object v13, v10, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;->inputImagesEV:[F

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    int-to-float v9, v9

    aput v9, v13, v5

    :cond_2
    iget-object v9, v12, Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;->blackLevel:[I

    aput v14, v9, v5

    new-instance v9, Lcom/arcsoft/supernight/RawImage;

    invoke-direct {v9}, Lcom/arcsoft/supernight/RawImage;-><init>()V

    invoke-virtual {v7}, Landroid/media/Image;->getFormat()I

    move-result v13

    invoke-virtual {v7}, Landroid/media/Image;->getWidth()I

    move-result v14

    iput v14, v9, Lcom/arcsoft/supernight/RawImage;->mWidth:I

    invoke-virtual {v7}, Landroid/media/Image;->getHeight()I

    move-result v14

    iput v14, v9, Lcom/arcsoft/supernight/RawImage;->mHeight:I

    invoke-virtual {v7}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v7

    aget-object v14, v7, v5

    invoke-virtual {v14}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    iput v5, v9, Lcom/arcsoft/supernight/RawImage;->mPitch1:I

    iput-object v8, v9, Lcom/arcsoft/supernight/RawImage;->mPlane1:Ljava/nio/ByteBuffer;

    const/16 v15, 0x23

    if-ne v13, v15, :cond_4

    const/16 v13, 0x802

    iput v13, v9, Lcom/arcsoft/supernight/RawImage;->mPixelArrayFormat:I

    aget-object v13, v7, v11

    invoke-virtual {v13}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    aget-object v11, v7, v11

    invoke-virtual {v11}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v11

    iput v11, v9, Lcom/arcsoft/supernight/RawImage;->mPitch1:I

    iput-object v13, v9, Lcom/arcsoft/supernight/RawImage;->mPlane1:Ljava/nio/ByteBuffer;

    nop

    :cond_3
    move/from16 v11, p3

    goto :goto_1

    :cond_4
    const/16 v11, 0x20

    if-ne v13, v11, :cond_3

    move/from16 v11, p3

    iput v11, v9, Lcom/arcsoft/supernight/RawImage;->mPixelArrayFormat:I

    :goto_1
    aget-object v7, v7, v5

    invoke-virtual {v7}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v7

    iput v7, v9, Lcom/arcsoft/supernight/RawImage;->mPitch0:I

    iput v5, v9, Lcom/arcsoft/supernight/RawImage;->mPitch2:I

    iput v5, v9, Lcom/arcsoft/supernight/RawImage;->mPitch3:I

    iput-object v14, v9, Lcom/arcsoft/supernight/RawImage;->mPlane0:Ljava/nio/ByteBuffer;

    iput-object v8, v9, Lcom/arcsoft/supernight/RawImage;->mPlane2:Ljava/nio/ByteBuffer;

    iput-object v8, v9, Lcom/arcsoft/supernight/RawImage;->mPlane3:Ljava/nio/ByteBuffer;

    iget-object v7, v10, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;->inputImages:[Lcom/arcsoft/supernight/RawImage;

    aput-object v9, v7, v5

    iget-object v7, v0, Lcom/arcsoft/supernight/SuperNightProcess;->mSuperNightJni:Lcom/arcsoft/supernight/SuperNightJni;

    invoke-virtual {v7, v12, v10}, Lcom/arcsoft/supernight/SuperNightJni;->AddOneInputInfo(Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;)I

    if-nez v4, :cond_5

    nop

    move-object v6, v10

    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    :cond_6
    :goto_2
    const-string v0, "SuperNightProcess"

    const-string v1, "TotalCaptureResult - > error invalid param"

    invoke-static {v0, v1}, Lcom/arcsoft/supernight/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v3

    :cond_7
    nop

    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/camera2/TotalCaptureResult;

    sget-object v3, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_EXPOSURE_COMPENSATION:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/TotalCaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    if-eqz v3, :cond_8

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-nez v3, :cond_8

    sget-object v1, Landroid/hardware/camera2/CaptureResult;->STATISTICS_FACES:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v2, v1}, Landroid/hardware/camera2/TotalCaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/hardware/camera2/params/Face;

    array-length v2, v1

    if-lez v2, :cond_9

    new-instance v8, Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;

    invoke-direct {v8, v0}, Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;-><init>(Lcom/arcsoft/supernight/SuperNightProcess;)V

    array-length v2, v1

    new-array v2, v2, [Landroid/graphics/Rect;

    iput-object v2, v8, Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;->faceRects:[Landroid/graphics/Rect;

    array-length v2, v1

    iput v2, v8, Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;->faceNum:I

    const/16 v2, 0x5a

    iput v2, v8, Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;->faceOrientation:I

    :goto_4
    array-length v2, v1

    if-ge v5, v2, :cond_9

    iget-object v2, v8, Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;->faceRects:[Landroid/graphics/Rect;

    new-instance v3, Landroid/graphics/Rect;

    aget-object v4, v1, v5

    invoke-virtual {v4}, Landroid/hardware/camera2/params/Face;->getBounds()Landroid/graphics/Rect;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    aput-object v3, v2, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    :cond_8
    goto :goto_3

    :cond_9
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iget-object v0, v0, Lcom/arcsoft/supernight/SuperNightProcess;->mSuperNightJni:Lcom/arcsoft/supernight/SuperNightJni;

    const/4 v2, 0x3

    invoke-virtual {v0, v8, v6, v2, v1}, Lcom/arcsoft/supernight/SuperNightJni;->process(Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;ILandroid/graphics/Rect;)I

    move-result v0

    return v0

    :cond_a
    :goto_5
    const-string v0, "SuperNightProcess"

    const-string v1, "addAllInputInfo - > error invalid param"

    invoke-static {v0, v1}, Lcom/arcsoft/supernight/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v3
.end method

.method public addOneInputInfo(Landroid/media/Image;Landroid/hardware/camera2/TotalCaptureResult;II)I
    .locals 9

    if-eqz p1, :cond_5

    if-eqz p2, :cond_5

    iget-object v0, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mSuperNightJni:Lcom/arcsoft/supernight/SuperNightJni;

    if-nez v0, :cond_0

    goto/16 :goto_1

    :cond_0
    new-instance v0, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;

    invoke-direct {v0, p0}, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;-><init>(Lcom/arcsoft/supernight/SuperNightProcess;)V

    iput p3, v0, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;->curIndex:I

    const/16 p3, 0x8

    iput p3, v0, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;->imgNum:I

    const/4 p3, 0x2

    iput p3, v0, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;->cameraState:I

    new-instance v1, Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;

    invoke-direct {v1, p0}, Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;-><init>(Lcom/arcsoft/supernight/SuperNightProcess;)V

    const/4 v2, 0x0

    iput v2, v1, Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;->rawType:I

    sget-object v3, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_EXPOSURE_COMPENSATION:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p2, v3}, Landroid/hardware/camera2/TotalCaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    if-eqz v3, :cond_1

    iget-object v4, v1, Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;->evList:[I

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    aput v5, v4, v2

    iget-object v4, v0, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;->inputImagesEV:[F

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-float v5, v5

    aput v5, v4, v2

    :cond_1
    new-instance v4, Lcom/arcsoft/supernight/RawImage;

    invoke-direct {v4}, Lcom/arcsoft/supernight/RawImage;-><init>()V

    invoke-virtual {p1}, Landroid/media/Image;->getFormat()I

    move-result v5

    invoke-virtual {p1}, Landroid/media/Image;->getWidth()I

    move-result v6

    iput v6, v4, Lcom/arcsoft/supernight/RawImage;->mWidth:I

    invoke-virtual {p1}, Landroid/media/Image;->getHeight()I

    move-result v6

    iput v6, v4, Lcom/arcsoft/supernight/RawImage;->mHeight:I

    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object p1

    aget-object v6, p1, v2

    invoke-virtual {v6}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    iput v2, v4, Lcom/arcsoft/supernight/RawImage;->mPitch1:I

    const/4 v7, 0x0

    iput-object v7, v4, Lcom/arcsoft/supernight/RawImage;->mPlane1:Ljava/nio/ByteBuffer;

    const/16 v8, 0x23

    if-ne v5, v8, :cond_2

    const/16 p4, 0x802

    iput p4, v4, Lcom/arcsoft/supernight/RawImage;->mPixelArrayFormat:I

    aget-object p4, p1, p3

    invoke-virtual {p4}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object p4

    invoke-virtual {p4}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    aget-object p3, p1, p3

    invoke-virtual {p3}, Landroid/media/Image$Plane;->getRowStride()I

    move-result p3

    iput p3, v4, Lcom/arcsoft/supernight/RawImage;->mPitch1:I

    iput-object p4, v4, Lcom/arcsoft/supernight/RawImage;->mPlane1:Ljava/nio/ByteBuffer;

    goto :goto_0

    :cond_2
    const/16 p3, 0x20

    if-ne v5, p3, :cond_3

    iput p4, v4, Lcom/arcsoft/supernight/RawImage;->mPixelArrayFormat:I

    :cond_3
    :goto_0
    aget-object p1, p1, v2

    invoke-virtual {p1}, Landroid/media/Image$Plane;->getRowStride()I

    move-result p1

    iput p1, v4, Lcom/arcsoft/supernight/RawImage;->mPitch0:I

    iput v2, v4, Lcom/arcsoft/supernight/RawImage;->mPitch2:I

    iput v2, v4, Lcom/arcsoft/supernight/RawImage;->mPitch3:I

    iput-object v6, v4, Lcom/arcsoft/supernight/RawImage;->mPlane0:Ljava/nio/ByteBuffer;

    iput-object v7, v4, Lcom/arcsoft/supernight/RawImage;->mPlane2:Ljava/nio/ByteBuffer;

    iput-object v7, v4, Lcom/arcsoft/supernight/RawImage;->mPlane3:Ljava/nio/ByteBuffer;

    iget-object p1, v0, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;->inputImages:[Lcom/arcsoft/supernight/RawImage;

    aput-object v4, p1, v2

    iget-object p1, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mSuperNightJni:Lcom/arcsoft/supernight/SuperNightJni;

    invoke-virtual {p1, v1, v0}, Lcom/arcsoft/supernight/SuperNightJni;->AddOneInputInfo(Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;)I

    move-result p1

    if-eqz v3, :cond_4

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    if-nez p3, :cond_4

    iget-object p3, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mMetdata:Landroid/hardware/camera2/TotalCaptureResult;

    if-nez p3, :cond_4

    iput-object p2, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mMetdata:Landroid/hardware/camera2/TotalCaptureResult;

    iput-object v0, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mResultInputInfo:Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;

    :cond_4
    return p1

    :cond_5
    :goto_1
    const-string p1, "SuperNightProcess"

    const-string p2, "addOneInputInfo - > error invalid param"

    invoke-static {p1, p2}, Lcom/arcsoft/supernight/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x1

    return p1
.end method

.method public addOneInputInfoEx(Landroid/media/Image;Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;I)I
    .locals 7

    if-eqz p1, :cond_4

    if-eqz p2, :cond_4

    iget-object v0, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mSuperNightJni:Lcom/arcsoft/supernight/SuperNightJni;

    if-nez v0, :cond_0

    goto/16 :goto_1

    :cond_0
    new-instance v0, Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;

    invoke-direct {v0, p0}, Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;-><init>(Lcom/arcsoft/supernight/SuperNightProcess;)V

    const/4 v1, 0x0

    iput v1, v0, Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;->rawType:I

    iget-object v2, v0, Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;->evList:[I

    iget-object v3, p2, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;->inputImagesEV:[F

    aget v3, v3, v1

    float-to-int v3, v3

    aput v3, v2, v1

    new-instance v2, Lcom/arcsoft/supernight/RawImage;

    invoke-direct {v2}, Lcom/arcsoft/supernight/RawImage;-><init>()V

    invoke-virtual {p1}, Landroid/media/Image;->getFormat()I

    move-result v3

    invoke-virtual {p1}, Landroid/media/Image;->getWidth()I

    move-result v4

    iput v4, v2, Lcom/arcsoft/supernight/RawImage;->mWidth:I

    invoke-virtual {p1}, Landroid/media/Image;->getHeight()I

    move-result v4

    iput v4, v2, Lcom/arcsoft/supernight/RawImage;->mHeight:I

    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object p1

    aget-object v4, p1, v1

    invoke-virtual {v4}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    iput v1, v2, Lcom/arcsoft/supernight/RawImage;->mPitch1:I

    const/4 v5, 0x0

    iput-object v5, v2, Lcom/arcsoft/supernight/RawImage;->mPlane1:Ljava/nio/ByteBuffer;

    const/16 v6, 0x23

    if-ne v3, v6, :cond_1

    const/16 p3, 0x802

    iput p3, v2, Lcom/arcsoft/supernight/RawImage;->mPixelArrayFormat:I

    const/4 p3, 0x2

    aget-object v3, p1, p3

    invoke-virtual {v3}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    aget-object p3, p1, p3

    invoke-virtual {p3}, Landroid/media/Image$Plane;->getRowStride()I

    move-result p3

    iput p3, v2, Lcom/arcsoft/supernight/RawImage;->mPitch1:I

    iput-object v3, v2, Lcom/arcsoft/supernight/RawImage;->mPlane1:Ljava/nio/ByteBuffer;

    goto :goto_0

    :cond_1
    const/16 v6, 0x20

    if-ne v3, v6, :cond_2

    iput p3, v2, Lcom/arcsoft/supernight/RawImage;->mPixelArrayFormat:I

    :cond_2
    :goto_0
    aget-object p1, p1, v1

    invoke-virtual {p1}, Landroid/media/Image$Plane;->getRowStride()I

    move-result p1

    iput p1, v2, Lcom/arcsoft/supernight/RawImage;->mPitch0:I

    iput v1, v2, Lcom/arcsoft/supernight/RawImage;->mPitch2:I

    iput v1, v2, Lcom/arcsoft/supernight/RawImage;->mPitch3:I

    iput-object v4, v2, Lcom/arcsoft/supernight/RawImage;->mPlane0:Ljava/nio/ByteBuffer;

    iput-object v5, v2, Lcom/arcsoft/supernight/RawImage;->mPlane2:Ljava/nio/ByteBuffer;

    iput-object v5, v2, Lcom/arcsoft/supernight/RawImage;->mPlane3:Ljava/nio/ByteBuffer;

    iget-object p1, p2, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;->inputImages:[Lcom/arcsoft/supernight/RawImage;

    aput-object v2, p1, v1

    iget-object p1, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mSuperNightJni:Lcom/arcsoft/supernight/SuperNightJni;

    invoke-virtual {p1, v0, p2}, Lcom/arcsoft/supernight/SuperNightJni;->AddOneInputInfo(Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;)I

    move-result p1

    iget-object p3, v0, Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;->evList:[I

    aget p3, p3, v1

    if-nez p3, :cond_3

    iget-object p3, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mMetdata:Landroid/hardware/camera2/TotalCaptureResult;

    if-nez p3, :cond_3

    iput-object p2, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mResultInputInfo:Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;

    :cond_3
    return p1

    :cond_4
    :goto_1
    const-string p1, "SuperNightProcess"

    const-string p2, "addOneInputInfoEx - > error invalid param"

    invoke-static {p1, p2}, Lcom/arcsoft/supernight/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x1

    return p1
.end method

.method public init(IIII)I
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mSuperNightJni:Lcom/arcsoft/supernight/SuperNightJni;

    if-nez v0, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mSuperNightJni:Lcom/arcsoft/supernight/SuperNightJni;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/arcsoft/supernight/SuperNightJni;->init(IIII)V

    iget-object p1, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mSuperNightJni:Lcom/arcsoft/supernight/SuperNightJni;

    invoke-virtual {p1}, Lcom/arcsoft/supernight/SuperNightJni;->preProcess()I

    move-result p1

    const-string p2, "SuperNightProcess"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "preprocess = "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/arcsoft/supernight/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    return p1
.end method

.method public process()I
    .locals 6

    iget-object v0, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mMetdata:Landroid/hardware/camera2/TotalCaptureResult;

    sget-object v1, Landroid/hardware/camera2/CaptureResult;->STATISTICS_FACES:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/TotalCaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/hardware/camera2/params/Face;

    nop

    array-length v1, v0

    if-lez v1, :cond_0

    new-instance v1, Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;

    invoke-direct {v1, p0}, Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;-><init>(Lcom/arcsoft/supernight/SuperNightProcess;)V

    array-length v2, v0

    new-array v2, v2, [Landroid/graphics/Rect;

    iput-object v2, v1, Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;->faceRects:[Landroid/graphics/Rect;

    array-length v2, v0

    iput v2, v1, Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;->faceNum:I

    const/16 v2, 0x5a

    iput v2, v1, Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;->faceOrientation:I

    const/4 v2, 0x0

    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_1

    iget-object v3, v1, Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;->faceRects:[Landroid/graphics/Rect;

    new-instance v4, Landroid/graphics/Rect;

    aget-object v5, v0, v2

    invoke-virtual {v5}, Landroid/hardware/camera2/params/Face;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    aput-object v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iget-object v2, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mSuperNightJni:Lcom/arcsoft/supernight/SuperNightJni;

    iget-object v3, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mResultInputInfo:Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;

    const/4 v4, 0x3

    invoke-virtual {v2, v1, v3, v4, v0}, Lcom/arcsoft/supernight/SuperNightJni;->process(Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;ILandroid/graphics/Rect;)I

    move-result v0

    const-string v1, "SuperNightProcess"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "process = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/arcsoft/supernight/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method

.method public processEx(Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;)I
    .locals 4

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iget-object v1, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mSuperNightJni:Lcom/arcsoft/supernight/SuperNightJni;

    iget-object v2, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mResultInputInfo:Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;

    const/4 v3, 0x3

    invoke-virtual {v1, p1, v2, v3, v0}, Lcom/arcsoft/supernight/SuperNightJni;->process(Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;ILandroid/graphics/Rect;)I

    move-result p1

    const-string v0, "SuperNightProcess"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processEx = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arcsoft/supernight/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    return p1
.end method

.method public unInit()I
    .locals 4

    iget-object v0, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mSuperNightJni:Lcom/arcsoft/supernight/SuperNightJni;

    if-nez v0, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mSuperNightJni:Lcom/arcsoft/supernight/SuperNightJni;

    invoke-virtual {v0}, Lcom/arcsoft/supernight/SuperNightJni;->postProcess()I

    move-result v0

    const-string v1, "SuperNightProcess"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "postProcess = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/arcsoft/supernight/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mSuperNightJni:Lcom/arcsoft/supernight/SuperNightJni;

    invoke-virtual {v0}, Lcom/arcsoft/supernight/SuperNightJni;->unInit()I

    move-result v0

    const-string v1, "SuperNightProcess"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "unInit = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/arcsoft/supernight/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mMetdata:Landroid/hardware/camera2/TotalCaptureResult;

    iput-object v1, p0, Lcom/arcsoft/supernight/SuperNightProcess;->mResultInputInfo:Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;

    return v0
.end method
