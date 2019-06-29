.class public Lcom/xiaomi/camera/imagecodec/MiImage;
.super Ljava/lang/Object;
.source "MiImage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/imagecodec/MiImage$Plane;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mCropRect:Landroid/graphics/Rect;

.field private mFormat:I

.field private mHeight:I

.field private mPlanes:[Lcom/xiaomi/camera/imagecodec/MiImage$Plane;

.field private mTimeStamp:J

.field private mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/xiaomi/camera/imagecodec/MiImage;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/imagecodec/MiImage;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/media/Image;)V
    .locals 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/xiaomi/camera/imagecodec/MiImage;->mWidth:I

    iput v0, p0, Lcom/xiaomi/camera/imagecodec/MiImage;->mHeight:I

    iput v0, p0, Lcom/xiaomi/camera/imagecodec/MiImage;->mFormat:I

    invoke-virtual {p1}, Landroid/media/Image;->getFormat()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/camera/imagecodec/MiImage;->mFormat:I

    invoke-virtual {p1}, Landroid/media/Image;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/camera/imagecodec/MiImage;->mWidth:I

    invoke-virtual {p1}, Landroid/media/Image;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/camera/imagecodec/MiImage;->mHeight:I

    invoke-virtual {p1}, Landroid/media/Image;->getCropRect()Landroid/graphics/Rect;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/MiImage;->mCropRect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/camera/imagecodec/MiImage;->mTimeStamp:J

    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    array-length v1, v0

    new-array v2, v1, [Lcom/xiaomi/camera/imagecodec/MiImage$Plane;

    iput-object v2, p0, Lcom/xiaomi/camera/imagecodec/MiImage;->mPlanes:[Lcom/xiaomi/camera/imagecodec/MiImage$Plane;

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    invoke-direct {p0, v2}, Lcom/xiaomi/camera/imagecodec/MiImage;->getEffectivePlaneSizeForImage(I)Landroid/util/Size;

    move-result-object v3

    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    move-result v3

    aget-object v4, v0, v2

    invoke-virtual {v4}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v4

    mul-int/2addr v3, v4

    aget-object v4, v0, v2

    invoke-virtual {v4}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    iget-object v5, p0, Lcom/xiaomi/camera/imagecodec/MiImage;->mPlanes:[Lcom/xiaomi/camera/imagecodec/MiImage$Plane;

    new-instance v6, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;

    aget-object v7, v0, v2

    invoke-virtual {v7}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v7

    invoke-direct {v6, p0, v3, v7, v4}, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;-><init>(Lcom/xiaomi/camera/imagecodec/MiImage;IILjava/nio/ByteBuffer;)V

    aput-object v6, v5, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/xiaomi/camera/imagecodec/MiImage;->fromImage(Landroid/media/Image;)V

    return-void
.end method

.method private fromImage(Landroid/media/Image;)V
    .locals 25

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual/range {p1 .. p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v2

    invoke-virtual/range {p0 .. p0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getPlanes()[Lcom/xiaomi/camera/imagecodec/MiImage$Plane;

    move-result-object v3

    nop

    nop

    const/4 v5, 0x0

    :goto_0
    array-length v6, v3

    if-ge v5, v6, :cond_6

    aget-object v6, v2, v5

    invoke-virtual {v6}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v6

    aget-object v7, v3, v5

    invoke-virtual {v7}, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->getRowStride()I

    move-result v7

    aget-object v8, v2, v5

    invoke-virtual {v8}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v8

    aget-object v9, v3, v5

    invoke-virtual {v9}, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v9

    aget-object v10, v2, v5

    invoke-virtual {v10}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v10

    aget-object v11, v3, v5

    invoke-virtual {v11}, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->getPixelStride()I

    move-result v11

    if-ne v10, v11, :cond_5

    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->position()I

    move-result v10

    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    if-ne v6, v7, :cond_1

    invoke-virtual {v9, v8}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-wide/from16 v17, v0

    :cond_0
    move-object/from16 v22, v2

    move-object/from16 v21, v3

    move/from16 v24, v5

    const/4 v5, 0x0

    goto/16 :goto_5

    :cond_1
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->position()I

    move-result v11

    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->position()I

    move-result v12

    move-object/from16 v13, p0

    invoke-direct {v13, v5}, Lcom/xiaomi/camera/imagecodec/MiImage;->getEffectivePlaneSizeForImage(I)Landroid/util/Size;

    move-result-object v14

    invoke-virtual {v14}, Landroid/util/Size;->getWidth()I

    move-result v15

    aget-object v4, v2, v5

    invoke-virtual {v4}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v4

    mul-int/2addr v15, v4

    new-array v4, v15, [B

    move v13, v15

    move v15, v12

    move v12, v11

    const/4 v11, 0x0

    :goto_1
    move-wide/from16 v17, v0

    invoke-virtual {v14}, Landroid/util/Size;->getHeight()I

    move-result v0

    if-ge v11, v0, :cond_0

    invoke-virtual {v8, v12}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {v9, v15}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {v14}, Landroid/util/Size;->getHeight()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    if-ne v11, v0, :cond_4

    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    const/4 v1, 0x2

    if-le v13, v0, :cond_2

    nop

    sget-object v13, Lcom/xiaomi/camera/imagecodec/MiImage;->TAG:Ljava/lang/String;

    move-object/from16 v20, v14

    sget-object v14, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    move-object/from16 v21, v3

    const-string v3, "srcPlane[%d].remain=%d"

    move-object/from16 v22, v2

    new-array v2, v1, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    const/16 v16, 0x0

    aput-object v23, v2, v16

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    const/16 v19, 0x1

    aput-object v23, v2, v19

    invoke-static {v14, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v13, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v13, v0

    goto :goto_2

    :cond_2
    move-object/from16 v22, v2

    move-object/from16 v21, v3

    move-object/from16 v20, v14

    :goto_2
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-le v13, v0, :cond_3

    nop

    sget-object v2, Lcom/xiaomi/camera/imagecodec/MiImage;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v13, "dstPlane[%d].remain=%d"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    move/from16 v24, v5

    const/4 v5, 0x0

    aput-object v14, v1, v5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const/16 v16, 0x1

    aput-object v14, v1, v16

    invoke-static {v3, v13, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v13, v0

    goto :goto_4

    :cond_3
    move/from16 v24, v5

    goto :goto_3

    :cond_4
    move-object/from16 v22, v2

    move-object/from16 v21, v3

    move/from16 v24, v5

    move-object/from16 v20, v14

    :goto_3
    const/4 v5, 0x0

    :goto_4
    invoke-virtual {v8, v4, v5, v13}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    invoke-virtual {v9, v4, v5, v13}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    add-int/2addr v12, v6

    add-int/2addr v15, v7

    add-int/lit8 v11, v11, 0x1

    move-wide/from16 v0, v17

    move-object/from16 v14, v20

    move-object/from16 v3, v21

    move-object/from16 v2, v22

    move/from16 v5, v24

    goto/16 :goto_1

    :goto_5
    invoke-virtual {v8, v10}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    add-int/lit8 v0, v24, 0x1

    move v5, v0

    move-wide/from16 v0, v17

    move-object/from16 v3, v21

    move-object/from16 v2, v22

    goto/16 :goto_0

    :cond_5
    move-object/from16 v22, v2

    move-object/from16 v21, v3

    move/from16 v24, v5

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "source plane image pixel stride "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v2, v22, v24

    invoke-virtual {v2}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " must be same as destination image pixel stride "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v2, v21, v24

    invoke-virtual {v2}, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->getPixelStride()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    move-wide/from16 v17, v0

    sget-object v0, Lcom/xiaomi/camera/imagecodec/MiImage;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fromImage: cost="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v2, v2, v17

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private getEffectivePlaneSizeForImage(I)Landroid/util/Size;
    .locals 3

    invoke-virtual {p0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getFormat()I

    move-result v0

    const/4 v1, 0x0

    sparse-switch v0, :sswitch_data_0

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getFormat()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const-string v1, "Invalid image format %d"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    :sswitch_0
    new-instance p1, Landroid/util/Size;

    invoke-direct {p1, v1, v1}, Landroid/util/Size;-><init>(II)V

    return-object p1

    :sswitch_1
    if-nez p1, :cond_0

    new-instance p1, Landroid/util/Size;

    invoke-virtual {p0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getHeight()I

    move-result v1

    invoke-direct {p1, v0, v1}, Landroid/util/Size;-><init>(II)V

    return-object p1

    :cond_0
    new-instance p1, Landroid/util/Size;

    invoke-virtual {p0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    invoke-virtual {p0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    invoke-direct {p1, v0, v1}, Landroid/util/Size;-><init>(II)V

    return-object p1

    :sswitch_2
    if-nez p1, :cond_1

    new-instance p1, Landroid/util/Size;

    invoke-virtual {p0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getHeight()I

    move-result v1

    invoke-direct {p1, v0, v1}, Landroid/util/Size;-><init>(II)V

    return-object p1

    :cond_1
    new-instance p1, Landroid/util/Size;

    invoke-virtual {p0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    invoke-direct {p1, v0, v1}, Landroid/util/Size;-><init>(II)V

    return-object p1

    :sswitch_3
    new-instance p1, Landroid/util/Size;

    invoke-virtual {p0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getHeight()I

    move-result v1

    invoke-direct {p1, v0, v1}, Landroid/util/Size;-><init>(II)V

    return-object p1

    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_3
        0x2 -> :sswitch_3
        0x3 -> :sswitch_3
        0x4 -> :sswitch_3
        0x10 -> :sswitch_2
        0x11 -> :sswitch_1
        0x14 -> :sswitch_3
        0x20 -> :sswitch_3
        0x22 -> :sswitch_0
        0x23 -> :sswitch_1
        0x25 -> :sswitch_3
        0x26 -> :sswitch_3
        0x100 -> :sswitch_3
        0x32315659 -> :sswitch_1
    .end sparse-switch
.end method


# virtual methods
.method public close()V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/MiImage;->mPlanes:[Lcom/xiaomi/camera/imagecodec/MiImage$Plane;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/MiImage;->mPlanes:[Lcom/xiaomi/camera/imagecodec/MiImage$Plane;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/MiImage;->mPlanes:[Lcom/xiaomi/camera/imagecodec/MiImage$Plane;

    aget-object v1, v1, v0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/MiImage;->mPlanes:[Lcom/xiaomi/camera/imagecodec/MiImage$Plane;

    aget-object v1, v1, v0

    invoke-static {v1}, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->access$000(Lcom/xiaomi/camera/imagecodec/MiImage$Plane;)V

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/MiImage;->mPlanes:[Lcom/xiaomi/camera/imagecodec/MiImage$Plane;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public getFormat()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/camera/imagecodec/MiImage;->mFormat:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/camera/imagecodec/MiImage;->mHeight:I

    return v0
.end method

.method public getPlanes()[Lcom/xiaomi/camera/imagecodec/MiImage$Plane;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/MiImage;->mPlanes:[Lcom/xiaomi/camera/imagecodec/MiImage$Plane;

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/camera/imagecodec/MiImage;->mWidth:I

    return v0
.end method

.method public toImage(Landroid/media/Image;)V
    .locals 25

    invoke-virtual/range {p0 .. p0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getFormat()I

    move-result v0

    invoke-virtual/range {p1 .. p1}, Landroid/media/Image;->getFormat()I

    move-result v1

    if-ne v0, v1, :cond_8

    new-instance v0, Landroid/util/Size;

    invoke-virtual/range {p0 .. p0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getWidth()I

    move-result v1

    invoke-virtual/range {p0 .. p0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    new-instance v1, Landroid/util/Size;

    invoke-virtual/range {p1 .. p1}, Landroid/media/Image;->getWidth()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Landroid/media/Image;->getHeight()I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/util/Size;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/util/Size;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual/range {p0 .. p0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getPlanes()[Lcom/xiaomi/camera/imagecodec/MiImage$Plane;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v3

    nop

    nop

    array-length v4, v2

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    :goto_0
    if-ltz v4, :cond_6

    aget-object v6, v2, v4

    invoke-virtual {v6}, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->getRowStride()I

    move-result v6

    aget-object v7, v3, v4

    invoke-virtual {v7}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v7

    aget-object v8, v2, v4

    invoke-virtual {v8}, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v8

    aget-object v9, v3, v4

    invoke-virtual {v9}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v9

    aget-object v10, v2, v4

    invoke-virtual {v10}, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->getPixelStride()I

    move-result v10

    aget-object v11, v3, v4

    invoke-virtual {v11}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v11

    if-ne v10, v11, :cond_5

    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->position()I

    move-result v10

    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    if-ne v6, v7, :cond_0

    invoke-virtual {v9, v8}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-wide/from16 v19, v0

    move-object/from16 v23, v2

    move-object/from16 v22, v3

    move/from16 v24, v4

    move/from16 v16, v5

    goto/16 :goto_5

    :cond_0
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->position()I

    move-result v11

    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->position()I

    move-result v12

    move-object/from16 v13, p0

    invoke-direct {v13, v4}, Lcom/xiaomi/camera/imagecodec/MiImage;->getEffectivePlaneSizeForImage(I)Landroid/util/Size;

    move-result-object v14

    invoke-virtual {v14}, Landroid/util/Size;->getWidth()I

    move-result v15

    aget-object v5, v2, v4

    invoke-virtual {v5}, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->getPixelStride()I

    move-result v5

    mul-int/2addr v15, v5

    new-array v5, v15, [B

    move/from16 v17, v11

    move v11, v12

    move v13, v15

    move/from16 v15, v17

    const/4 v12, 0x0

    :goto_1
    move-wide/from16 v19, v0

    invoke-virtual {v14}, Landroid/util/Size;->getHeight()I

    move-result v0

    if-ge v12, v0, :cond_4

    invoke-virtual {v8, v15}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {v9, v11}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {v14}, Landroid/util/Size;->getHeight()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    if-ne v12, v0, :cond_3

    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    const/4 v1, 0x2

    if-le v13, v0, :cond_1

    nop

    sget-object v13, Lcom/xiaomi/camera/imagecodec/MiImage;->TAG:Ljava/lang/String;

    move-object/from16 v21, v14

    sget-object v14, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    move-object/from16 v22, v3

    const-string v3, "srcPlane[%d].remain=%d"

    move-object/from16 v23, v2

    new-array v2, v1, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    const/16 v18, 0x0

    aput-object v17, v2, v18

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    const/16 v16, 0x1

    aput-object v17, v2, v16

    invoke-static {v14, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v13, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v13, v0

    goto :goto_2

    :cond_1
    move-object/from16 v23, v2

    move-object/from16 v22, v3

    move-object/from16 v21, v14

    :goto_2
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-le v13, v0, :cond_2

    nop

    sget-object v2, Lcom/xiaomi/camera/imagecodec/MiImage;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v13, "dstPlane[%d].remain=%d"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    move/from16 v24, v4

    const/4 v4, 0x0

    aput-object v14, v1, v4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const/16 v16, 0x1

    aput-object v14, v1, v16

    invoke-static {v3, v13, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v13, v0

    goto :goto_4

    :cond_2
    move/from16 v24, v4

    goto :goto_3

    :cond_3
    move-object/from16 v23, v2

    move-object/from16 v22, v3

    move/from16 v24, v4

    move-object/from16 v21, v14

    :goto_3
    const/4 v4, 0x0

    const/16 v16, 0x1

    :goto_4
    invoke-virtual {v8, v5, v4, v13}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    invoke-virtual {v9, v5, v4, v13}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    add-int/2addr v15, v6

    add-int/2addr v11, v7

    add-int/lit8 v12, v12, 0x1

    move-wide/from16 v0, v19

    move-object/from16 v14, v21

    move-object/from16 v3, v22

    move-object/from16 v2, v23

    move/from16 v4, v24

    goto/16 :goto_1

    :cond_4
    move-object/from16 v23, v2

    move-object/from16 v22, v3

    move/from16 v24, v4

    const/16 v16, 0x1

    :goto_5
    invoke-virtual {v8, v10}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    add-int/lit8 v4, v24, -0x1

    move/from16 v5, v16

    move-wide/from16 v0, v19

    move-object/from16 v3, v22

    move-object/from16 v2, v23

    goto/16 :goto_0

    :cond_5
    move-object/from16 v23, v2

    move-object/from16 v22, v3

    move/from16 v24, v4

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "source plane image pixel stride "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v2, v23, v24

    invoke-virtual {v2}, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->getPixelStride()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " must be same as destination image pixel stride "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v2, v22, v24

    invoke-virtual {v2}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    move-wide/from16 v19, v0

    sget-object v0, Lcom/xiaomi/camera/imagecodec/MiImage;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "toImage: cost="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v2, v2, v19

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_7
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "source image size "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " is different with destination image size "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "src and dst images should have the same format"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
