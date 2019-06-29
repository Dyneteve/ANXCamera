.class public Lcom/android/camera2/PreviewImageProp;
.super Lcom/android/camera/panorama/CaptureImage;
.source "PreviewImageProp.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mData:[B

.field private mImage:Landroid/media/Image;

.field private mNoStrideData:[B

.field private mReady:Z

.field private mUVStride:I

.field private mYLength:I

.field private mYStride:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera2/PreviewImageProp;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/PreviewImageProp;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/media/Image;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/panorama/CaptureImage;-><init>(Landroid/media/Image;)V

    iput-object p1, p0, Lcom/android/camera2/PreviewImageProp;->mImage:Landroid/media/Image;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera2/PreviewImageProp;->mReady:Z

    return-void
.end method

.method private convert()V
    .locals 10

    iget-object v0, p0, Lcom/android/camera2/PreviewImageProp;->mImage:Landroid/media/Image;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/PreviewImageProp;->mImage:Landroid/media/Image;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/media/Image;->getFormat()I

    move-result v1

    const/16 v2, 0x23

    if-ne v1, v2, :cond_0

    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v1}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v3

    const/4 v4, 0x2

    aget-object v3, v3, v4

    invoke-virtual {v3}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v5

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->limit()I

    move-result v6

    sget-object v7, Lcom/android/camera2/PreviewImageProp;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "convertYUV420888ToNV21: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/media/Image;->getWidth()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo v9, "x"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/media/Image;->getHeight()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v9

    aget-object v9, v9, v4

    invoke-virtual {v9}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    add-int v7, v5, v6

    new-array v7, v7, [B

    iput-object v7, p0, Lcom/android/camera2/PreviewImageProp;->mData:[B

    iget-object v7, p0, Lcom/android/camera2/PreviewImageProp;->mData:[B

    invoke-virtual {v1, v7, v2, v5}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/android/camera2/PreviewImageProp;->mData:[B

    invoke-virtual {v3, v1, v5, v6}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    iput v5, p0, Lcom/android/camera2/PreviewImageProp;->mYLength:I

    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v1

    aget-object v1, v1, v2

    invoke-virtual {v1}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v1

    iput v1, p0, Lcom/android/camera2/PreviewImageProp;->mYStride:I

    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v1

    aget-object v1, v1, v4

    invoke-virtual {v1}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v1

    iput v1, p0, Lcom/android/camera2/PreviewImageProp;->mUVStride:I

    const-string v1, "convert:"

    const-string/jumbo v2, "yes"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-virtual {v0}, Landroid/media/Image;->close()V

    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera2/PreviewImageProp;->mImage:Landroid/media/Image;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera2/PreviewImageProp;->mReady:Z

    return-void
.end method

.method public static removePadding(Lcom/android/camera2/PreviewImageProp;II)[B
    .locals 7

    invoke-virtual {p0}, Lcom/android/camera2/PreviewImageProp;->getData()[B

    move-result-object v0

    array-length v1, v0

    int-to-double v1, v1

    mul-int v3, p1, p2

    int-to-double v3, v3

    const-wide/high16 v5, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v3, v5

    cmpg-double v1, v1, v3

    if-gtz v1, :cond_0

    sget-object p0, Lcom/android/camera2/PreviewImageProp;->TAG:Ljava/lang/String;

    const-string p1, "removePadding: no padding found in data"

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    :cond_0
    double-to-int v1, v3

    nop

    nop

    new-array v1, v1, [B

    const/4 v2, 0x0

    move v3, v2

    move v4, v3

    move v5, v4

    :goto_0
    if-ge v3, p2, :cond_2

    invoke-static {v0, v4, v1, v5, p1}, Ljava/lang/System;->arraycopy([BI[BII)V

    add-int/lit8 v6, p2, -0x1

    if-ne v3, v6, :cond_1

    add-int/2addr v4, p1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera2/PreviewImageProp;->getYStride()I

    move-result v6

    add-int/2addr v4, v6

    :goto_1
    add-int/2addr v5, p1

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    :goto_2
    div-int/lit8 v3, p2, 0x2

    if-ge v2, v3, :cond_4

    add-int/lit8 v3, v3, -0x1

    if-ne v2, v3, :cond_3

    add-int/lit8 v3, p1, -0x1

    invoke-static {v0, v4, v1, v5, v3}, Ljava/lang/System;->arraycopy([BI[BII)V

    goto :goto_3

    :cond_3
    invoke-static {v0, v4, v1, v5, p1}, Ljava/lang/System;->arraycopy([BI[BII)V

    :goto_3
    invoke-virtual {p0}, Lcom/android/camera2/PreviewImageProp;->getUVStride()I

    move-result v3

    add-int/2addr v4, v3

    add-int/2addr v5, p1

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_4
    return-object v1
.end method


# virtual methods
.method public close()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/PreviewImageProp;->mImage:Landroid/media/Image;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/PreviewImageProp;->mImage:Landroid/media/Image;

    invoke-virtual {v0}, Landroid/media/Image;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera2/PreviewImageProp;->mImage:Landroid/media/Image;

    :cond_0
    return-void
.end method

.method public getData()[B
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/PreviewImageProp;->mReady:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera2/PreviewImageProp;->convert()V

    :cond_0
    iget-object v0, p0, Lcom/android/camera2/PreviewImageProp;->mData:[B

    return-object v0
.end method

.method public getHeight()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/PreviewImageProp;->mImage:Landroid/media/Image;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/PreviewImageProp;->mImage:Landroid/media/Image;

    invoke-virtual {v0}, Landroid/media/Image;->getHeight()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getImageFormat()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getUVStride()I
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/PreviewImageProp;->mReady:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera2/PreviewImageProp;->convert()V

    :cond_0
    iget v0, p0, Lcom/android/camera2/PreviewImageProp;->mUVStride:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/PreviewImageProp;->mImage:Landroid/media/Image;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/PreviewImageProp;->mImage:Landroid/media/Image;

    invoke-virtual {v0}, Landroid/media/Image;->getWidth()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getYLength()I
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/PreviewImageProp;->mReady:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera2/PreviewImageProp;->convert()V

    :cond_0
    iget v0, p0, Lcom/android/camera2/PreviewImageProp;->mYLength:I

    return v0
.end method

.method public getYStride()I
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera2/PreviewImageProp;->mReady:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera2/PreviewImageProp;->convert()V

    :cond_0
    iget v0, p0, Lcom/android/camera2/PreviewImageProp;->mYStride:I

    return v0
.end method
