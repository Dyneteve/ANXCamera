.class public Lcom/android/camera/panorama/ConvertFromYuv420SemiPlanar;
.super Ljava/lang/Object;
.source "ConvertFromYuv420SemiPlanar.java"

# interfaces
.implements Lcom/android/camera/panorama/IImage2BytesConverter;


# static fields
.field private static final PIXEL_STRIDE:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public image2bytes(Landroid/media/Image;)[B
    .locals 13

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

    move-result-object p1

    aget-object p1, p1, v5

    invoke-virtual {p1}, Landroid/media/Image$Plane;->getRowStride()I

    move-result p1

    mul-int v9, v0, v1

    mul-int/lit8 v10, v9, 0x3

    div-int/2addr v10, v7

    new-array v10, v10, [B

    if-ge v0, v8, :cond_0

    move v11, v3

    :goto_0
    if-ge v11, v1, :cond_1

    mul-int v12, v11, v8

    invoke-virtual {v2, v12}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    mul-int v12, v11, v0

    invoke-virtual {v2, v10, v12, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v2, v10, v3, v9}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    :cond_1
    nop

    if-ge v0, p1, :cond_3

    :goto_1
    div-int/lit8 v8, v1, 0x2

    sub-int/2addr v8, v5

    if-ge v3, v8, :cond_2

    mul-int v8, v3, p1

    invoke-virtual {v4, v8}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {v4, v10, v9, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    add-int/2addr v9, v0

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_2
    sub-int/2addr v0, v5

    invoke-virtual {v4, v10, v9, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    add-int/2addr v9, v0

    goto :goto_2

    :cond_3
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p1

    invoke-virtual {v4, v10, v9, p1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    add-int/2addr v9, p1

    :goto_2
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p1

    sub-int/2addr p1, v5

    invoke-virtual {v6, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {v6, v10, v9, v5}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    return-object v10
.end method
