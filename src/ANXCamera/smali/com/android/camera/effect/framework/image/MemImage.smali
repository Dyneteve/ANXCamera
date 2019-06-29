.class public Lcom/android/camera/effect/framework/image/MemImage;
.super Ljava/lang/Object;
.source "MemImage.java"


# instance fields
.field public mChannels:I

.field public mHeight:I

.field public mWidth:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/android/camera/effect/framework/image/MemImage;->mWidth:I

    iput p2, p0, Lcom/android/camera/effect/framework/image/MemImage;->mHeight:I

    iput p3, p0, Lcom/android/camera/effect/framework/image/MemImage;->mChannels:I

    return-void
.end method


# virtual methods
.method public encodeJpeg(III)[B
    .locals 2

    new-instance v0, Lcom/android/camera/effect/framework/utils/CounterUtil;

    invoke-direct {v0}, Lcom/android/camera/effect/framework/utils/CounterUtil;-><init>()V

    const-string v1, "jpeg compress"

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/framework/utils/CounterUtil;->reset(Ljava/lang/String;)V

    invoke-static {p2, p3, p1}, Lcom/android/camera/effect/ShaderNativeUtil;->compressPicture(III)[B

    move-result-object p1

    const-string p2, "jpeg compress done"

    invoke-virtual {v0, p2}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    return-object p1
.end method

.method public getPixelsFromJpg([B)V
    .locals 3

    new-instance v0, Lcom/android/camera/effect/framework/utils/CounterUtil;

    invoke-direct {v0}, Lcom/android/camera/effect/framework/utils/CounterUtil;-><init>()V

    const-string v1, "jpeg decompress"

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/framework/utils/CounterUtil;->reset(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-static {p1, v1}, Lcom/android/camera/effect/ShaderNativeUtil;->decompressPicture([BI)[I

    move-result-object p1

    const/4 v2, 0x0

    aget v2, p1, v2

    iput v2, p0, Lcom/android/camera/effect/framework/image/MemImage;->mWidth:I

    aget p1, p1, v1

    iput p1, p0, Lcom/android/camera/effect/framework/image/MemImage;->mHeight:I

    const-string p1, "jpeg decompress done"

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    const/4 p1, 0x3

    iput p1, p0, Lcom/android/camera/effect/framework/image/MemImage;->mChannels:I

    return-void
.end method

.method public readPixelsAndMerge(III)V
    .locals 0

    invoke-static {p1, p2, p3}, Lcom/android/camera/effect/ShaderNativeUtil;->readPixelsAndMerge(III)V

    return-void
.end method

.method public release()V
    .locals 0

    return-void
.end method

.method public textureWithStride(IIIII)V
    .locals 2

    new-instance v0, Lcom/android/camera/effect/framework/utils/CounterUtil;

    invoke-direct {v0}, Lcom/android/camera/effect/framework/utils/CounterUtil;-><init>()V

    const-string/jumbo v1, "uploadTexture"

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/framework/utils/CounterUtil;->reset(Ljava/lang/String;)V

    invoke-static {p1, p2, p3, p4, p5}, Lcom/android/camera/effect/ShaderNativeUtil;->updateTextureWidthStride(IIIII)V

    const-string/jumbo p1, "uploadTexture done"

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    return-void
.end method
