.class public Lcom/xiaomi/camera/imagecodec/MiImage$Plane;
.super Ljava/lang/Object;
.source "MiImage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/imagecodec/MiImage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Plane"
.end annotation


# instance fields
.field private mBuffer:Ljava/nio/ByteBuffer;

.field private final mPixelStride:I

.field private final mRowStride:I

.field final synthetic this$0:Lcom/xiaomi/camera/imagecodec/MiImage;


# direct methods
.method public constructor <init>(Lcom/xiaomi/camera/imagecodec/MiImage;IILjava/nio/ByteBuffer;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->this$0:Lcom/xiaomi/camera/imagecodec/MiImage;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->mRowStride:I

    iput p3, p0, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->mPixelStride:I

    iput-object p4, p0, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->mBuffer:Ljava/nio/ByteBuffer;

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    return-void
.end method

.method static synthetic access$000(Lcom/xiaomi/camera/imagecodec/MiImage$Plane;)V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->clearBuffer()V

    return-void
.end method

.method private clearBuffer()V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->mBuffer:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->mBuffer:Ljava/nio/ByteBuffer;

    return-void
.end method


# virtual methods
.method public getBuffer()Ljava/nio/ByteBuffer;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->mBuffer:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method public getPixelStride()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->mPixelStride:I

    return v0
.end method

.method public getRowStride()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->mRowStride:I

    return v0
.end method
