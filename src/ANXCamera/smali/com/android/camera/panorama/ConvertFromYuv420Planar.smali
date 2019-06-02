.class public Lcom/android/camera/panorama/ConvertFromYuv420Planar;
.super Ljava/lang/Object;
.source "ConvertFromYuv420Planar.java"

# interfaces
.implements Lcom/android/camera/panorama/IImage2BytesConverter;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public image2bytes(Landroid/media/Image;)[B
    .locals 14

    invoke-virtual {p1}, Landroid/media/Image;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/media/Image;->getHeight()I

    move-result v1

    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v2

    const/4 v3, 0x0

    aget-object v2, v2, v3

    invoke-virtual {v2}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v4

    const/4 v5, 0x1

    aget-object v4, v4, v5

    invoke-virtual {v4}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v6

    const/4 v7, 0x2

    aget-object v6, v6, v7

    invoke-virtual {v6}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v6

    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v8

    aget-object v8, v8, v3

    invoke-virtual {v8}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v8

    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v9

    aget-object v5, v9, v5

    invoke-virtual {v5}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v5

    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object p1

    aget-object p1, p1, v7

    invoke-virtual {p1}, Landroid/media/Image$Plane;->getRowStride()I

    move-result p1

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v9

    mul-int v10, v0, v1

    mul-int/lit8 v11, v10, 0x3

    div-int/2addr v11, v7

    new-array v11, v11, [B

    if-ge v0, v8, :cond_0

    move v9, v3

    :goto_0
    if-ge v9, v1, :cond_1

    mul-int v12, v9, v8

    invoke-virtual {v2, v12}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    mul-int v12, v9, v0

    invoke-virtual {v2, v11, v12, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v2, v11, v3, v9}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    :cond_1
    div-int/2addr v0, v7

    nop

    move v8, v3

    :goto_1
    div-int/lit8 v9, v1, 0x2

    if-ge v8, v9, :cond_5

    if-ge v0, v5, :cond_2

    mul-int v9, v8, v5

    invoke-virtual {v4, v9}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    :cond_2
    if-ge v0, p1, :cond_3

    mul-int v9, v8, p1

    invoke-virtual {v6, v9}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    :cond_3
    move v9, v3

    :goto_2
    if-ge v9, v0, :cond_4

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->get()B

    move-result v12

    aput-byte v12, v11, v10

    add-int/lit8 v12, v10, 0x1

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->get()B

    move-result v13

    aput-byte v13, v11, v12

    add-int/lit8 v10, v10, 0x2

    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    :cond_4
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_5
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    return-object v11
.end method
