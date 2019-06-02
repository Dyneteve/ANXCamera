.class public abstract Lcom/android/camera/panorama/AttachRunnable;
.super Ljava/lang/Object;
.source "AttachRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field protected final byteBuffer:[Ljava/nio/ByteBuffer;

.field private isNativeBuffer:Z

.field protected final pixelStride:[I

.field protected final rowStride:[I

.field protected srcImage:Lcom/android/camera/panorama/CaptureImage;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x3

    new-array v1, v0, [Ljava/nio/ByteBuffer;

    iput-object v1, p0, Lcom/android/camera/panorama/AttachRunnable;->byteBuffer:[Ljava/nio/ByteBuffer;

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/android/camera/panorama/AttachRunnable;->rowStride:[I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/android/camera/panorama/AttachRunnable;->pixelStride:[I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/panorama/AttachRunnable;->isNativeBuffer:Z

    return-void
.end method

.method private static createBuffer([BII)Ljava/nio/ByteBuffer;
    .locals 1

    invoke-static {p2}, Lcom/android/camera/panorama/NativeMemoryAllocator;->allocateBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    return-object v0
.end method

.method private setPlane(Landroid/media/Image$Plane;I)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/panorama/AttachRunnable;->byteBuffer:[Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    aput-object v1, v0, p2

    iget-object v0, p0, Lcom/android/camera/panorama/AttachRunnable;->rowStride:[I

    invoke-virtual {p1}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v1

    aput v1, v0, p2

    iget-object v0, p0, Lcom/android/camera/panorama/AttachRunnable;->pixelStride:[I

    invoke-virtual {p1}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result p1

    aput p1, v0, p2

    return-void
.end method


# virtual methods
.method protected closeSrc()V
    .locals 5

    iget-object v0, p0, Lcom/android/camera/panorama/AttachRunnable;->srcImage:Lcom/android/camera/panorama/CaptureImage;

    invoke-virtual {v0}, Lcom/android/camera/panorama/CaptureImage;->close()V

    iget-boolean v0, p0, Lcom/android/camera/panorama/AttachRunnable;->isNativeBuffer:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/panorama/AttachRunnable;->byteBuffer:[Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-static {v0}, Lcom/android/camera/panorama/NativeMemoryAllocator;->freeBuffer(Ljava/nio/ByteBuffer;)V

    iget-object v0, p0, Lcom/android/camera/panorama/AttachRunnable;->byteBuffer:[Ljava/nio/ByteBuffer;

    const/4 v2, 0x1

    aget-object v0, v0, v2

    invoke-static {v0}, Lcom/android/camera/panorama/NativeMemoryAllocator;->freeBuffer(Ljava/nio/ByteBuffer;)V

    iget-object v0, p0, Lcom/android/camera/panorama/AttachRunnable;->byteBuffer:[Ljava/nio/ByteBuffer;

    const/4 v3, 0x2

    aget-object v0, v0, v3

    invoke-static {v0}, Lcom/android/camera/panorama/NativeMemoryAllocator;->freeBuffer(Ljava/nio/ByteBuffer;)V

    iget-object v0, p0, Lcom/android/camera/panorama/AttachRunnable;->byteBuffer:[Ljava/nio/ByteBuffer;

    const/4 v4, 0x0

    aput-object v4, v0, v1

    iget-object v0, p0, Lcom/android/camera/panorama/AttachRunnable;->byteBuffer:[Ljava/nio/ByteBuffer;

    aput-object v4, v0, v2

    iget-object v0, p0, Lcom/android/camera/panorama/AttachRunnable;->byteBuffer:[Ljava/nio/ByteBuffer;

    aput-object v4, v0, v3

    iput-boolean v1, p0, Lcom/android/camera/panorama/AttachRunnable;->isNativeBuffer:Z

    :cond_0
    return-void
.end method

.method protected setImage(Lcom/android/camera/panorama/CaptureImage;)V
    .locals 10

    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->image()Landroid/media/Image;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    aget-object v4, v0, v1

    invoke-direct {p0, v4, v1}, Lcom/android/camera/panorama/AttachRunnable;->setPlane(Landroid/media/Image$Plane;I)V

    aget-object v1, v0, v3

    invoke-direct {p0, v1, v3}, Lcom/android/camera/panorama/AttachRunnable;->setPlane(Landroid/media/Image$Plane;I)V

    aget-object v0, v0, v2

    invoke-direct {p0, v0, v2}, Lcom/android/camera/panorama/AttachRunnable;->setPlane(Landroid/media/Image$Plane;I)V

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->getHeight()I

    move-result v4

    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->raw()[B

    move-result-object v5

    iget-object v6, p0, Lcom/android/camera/panorama/AttachRunnable;->byteBuffer:[Ljava/nio/ByteBuffer;

    mul-int/2addr v4, v0

    invoke-static {v5, v1, v4}, Lcom/android/camera/panorama/AttachRunnable;->createBuffer([BII)Ljava/nio/ByteBuffer;

    move-result-object v7

    aput-object v7, v6, v1

    iget-object v6, p0, Lcom/android/camera/panorama/AttachRunnable;->byteBuffer:[Ljava/nio/ByteBuffer;

    add-int/lit8 v7, v4, 0x1

    div-int/lit8 v8, v4, 0x2

    add-int/lit8 v9, v8, -0x1

    invoke-static {v5, v7, v9}, Lcom/android/camera/panorama/AttachRunnable;->createBuffer([BII)Ljava/nio/ByteBuffer;

    move-result-object v7

    aput-object v7, v6, v3

    iget-object v6, p0, Lcom/android/camera/panorama/AttachRunnable;->byteBuffer:[Ljava/nio/ByteBuffer;

    invoke-static {v5, v4, v8}, Lcom/android/camera/panorama/AttachRunnable;->createBuffer([BII)Ljava/nio/ByteBuffer;

    move-result-object v4

    aput-object v4, v6, v2

    iget-object v4, p0, Lcom/android/camera/panorama/AttachRunnable;->rowStride:[I

    aput v0, v4, v1

    iget-object v4, p0, Lcom/android/camera/panorama/AttachRunnable;->rowStride:[I

    aput v0, v4, v3

    iget-object v4, p0, Lcom/android/camera/panorama/AttachRunnable;->rowStride:[I

    aput v0, v4, v2

    iget-object v0, p0, Lcom/android/camera/panorama/AttachRunnable;->pixelStride:[I

    aput v3, v0, v1

    iget-object v0, p0, Lcom/android/camera/panorama/AttachRunnable;->pixelStride:[I

    aput v2, v0, v3

    iget-object v0, p0, Lcom/android/camera/panorama/AttachRunnable;->pixelStride:[I

    aput v2, v0, v2

    iput-boolean v3, p0, Lcom/android/camera/panorama/AttachRunnable;->isNativeBuffer:Z

    :goto_0
    iput-object p1, p0, Lcom/android/camera/panorama/AttachRunnable;->srcImage:Lcom/android/camera/panorama/CaptureImage;

    return-void
.end method
