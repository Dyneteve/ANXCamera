.class public final Lcom/xiaomi/media/imagecodec/ImageCodec;
.super Ljava/lang/Object;
.source "ImageCodec.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final mInputImageFormat:I

.field private final mInputImageHeight:I

.field private final mInputImageWidth:I

.field private final mInputSurface:Landroid/view/Surface;

.field private mIsCodecValid:Z

.field private final mMaxInputImageCount:I

.field private mNativeContext:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/xiaomi/media/imagecodec/ImageCodec;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/media/imagecodec/ImageCodec;->TAG:Ljava/lang/String;

    const-string v0, "jni_imagecodec"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    invoke-static {}, Lcom/xiaomi/media/imagecodec/ImageCodec;->nativeClassInit()V

    return-void
.end method

.method private constructor <init>(IIIILandroid/os/Handler;)V
    .locals 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object p5, Lcom/xiaomi/media/imagecodec/ImageCodec;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ctor(): E "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p5, 0x1

    if-lt p1, p5, :cond_2

    if-lt p2, p5, :cond_2

    if-lt p4, p5, :cond_1

    const/16 v0, 0x23

    if-ne p3, v0, :cond_0

    iput p1, p0, Lcom/xiaomi/media/imagecodec/ImageCodec;->mInputImageWidth:I

    iput p2, p0, Lcom/xiaomi/media/imagecodec/ImageCodec;->mInputImageHeight:I

    iput p3, p0, Lcom/xiaomi/media/imagecodec/ImageCodec;->mInputImageFormat:I

    iput p4, p0, Lcom/xiaomi/media/imagecodec/ImageCodec;->mMaxInputImageCount:I

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    move-object v1, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/xiaomi/media/imagecodec/ImageCodec;->nativeCreate(Ljava/lang/Object;IIII)V

    invoke-direct {p0}, Lcom/xiaomi/media/imagecodec/ImageCodec;->nativeGetInputSurface()Landroid/view/Surface;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/media/imagecodec/ImageCodec;->mInputSurface:Landroid/view/Surface;

    iput-boolean p5, p0, Lcom/xiaomi/media/imagecodec/ImageCodec;->mIsCodecValid:Z

    sget-object p1, Lcom/xiaomi/media/imagecodec/ImageCodec;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "ctor(): X "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Currently only YUV_420_888 is supported"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Maximum input image count must be at least 1"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The image dimensions must be positive"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static create(IIII)Lcom/xiaomi/media/imagecodec/ImageCodec;
    .locals 7

    new-instance v6, Lcom/xiaomi/media/imagecodec/ImageCodec;

    const/4 v5, 0x0

    move-object v0, v6

    move v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/xiaomi/media/imagecodec/ImageCodec;-><init>(IIIILandroid/os/Handler;)V

    return-object v6
.end method

.method private static native nativeClassInit()V
.end method

.method private synchronized native nativeCreate(Ljava/lang/Object;IIII)V
.end method

.method private synchronized native nativeDestroy()V
.end method

.method private synchronized native nativeGetInputSurface()Landroid/view/Surface;
.end method

.method private synchronized native nativeSetCodecQuality(I)V
.end method

.method private synchronized native nativeSetFlipFlag(I)V
.end method

.method private synchronized native nativeSetOutputSurface(Landroid/view/Surface;)V
.end method


# virtual methods
.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/media/imagecodec/ImageCodec;->mInputImageHeight:I

    return v0
.end method

.method public getImageFormat()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/media/imagecodec/ImageCodec;->mInputImageFormat:I

    return v0
.end method

.method public getInputSurface()Landroid/view/Surface;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/media/imagecodec/ImageCodec;->mInputSurface:Landroid/view/Surface;

    return-object v0
.end method

.method public getMaxImages()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/media/imagecodec/ImageCodec;->mMaxInputImageCount:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/media/imagecodec/ImageCodec;->mInputImageWidth:I

    return v0
.end method

.method public release()V
    .locals 3

    sget-object v0, Lcom/xiaomi/media/imagecodec/ImageCodec;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "release(): E "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/media/imagecodec/ImageCodec;->mInputSurface:Landroid/view/Surface;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/media/imagecodec/ImageCodec;->mInputSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    :cond_0
    iget-boolean v0, p0, Lcom/xiaomi/media/imagecodec/ImageCodec;->mIsCodecValid:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/xiaomi/media/imagecodec/ImageCodec;->mIsCodecValid:Z

    invoke-direct {p0}, Lcom/xiaomi/media/imagecodec/ImageCodec;->nativeDestroy()V

    :cond_1
    sget-object v0, Lcom/xiaomi/media/imagecodec/ImageCodec;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "release(): X "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setFlip(Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/media/imagecodec/ImageCodec;->nativeSetFlipFlag(I)V

    return-void
.end method

.method public setOutputSurface(Landroid/view/Surface;)V
    .locals 1
    .param p1    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string v0, "The given surface must not be null"

    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    invoke-direct {p0, p1}, Lcom/xiaomi/media/imagecodec/ImageCodec;->nativeSetOutputSurface(Landroid/view/Surface;)V

    return-void
.end method

.method public setQuality(I)V
    .locals 1

    if-ltz p1, :cond_0

    const/16 v0, 0x64

    if-gt p1, v0, :cond_0

    invoke-direct {p0, p1}, Lcom/xiaomi/media/imagecodec/ImageCodec;->nativeSetCodecQuality(I)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "quality must be 0..100"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
