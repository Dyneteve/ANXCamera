.class Lcom/android/camera/effect/renders/ImageWaterMark;
.super Lcom/android/camera/effect/renders/WaterMark;
.source "ImageWaterMark.java"


# instance fields
.field private mCenterX:I

.field private mCenterY:I

.field private mHeight:I

.field private mImageTexture:Lcom/android/gallery3d/ui/BitmapTexture;

.field private mPaddingX:I

.field private mPaddingY:I

.field private mWidth:I


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;IIIFFF)V
    .locals 7

    invoke-direct {p0, p2, p3, p4}, Lcom/android/camera/effect/renders/WaterMark;-><init>(III)V

    nop

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    move v0, p2

    move v1, p3

    move v4, p5

    move v5, p6

    move v6, p7

    invoke-static/range {v0 .. v6}, Lcom/android/camera/Util;->calcDualCameraWatermarkLocation(IIIIFFF)[I

    move-result-object p2

    const/4 p3, 0x0

    aget p4, p2, p3

    iput p4, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mWidth:I

    const/4 p4, 0x1

    aget p4, p2, p4

    iput p4, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mHeight:I

    const/4 p4, 0x2

    aget p4, p2, p4

    iput p4, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingX:I

    const/4 p4, 0x3

    aget p2, p2, p4

    iput p2, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingY:I

    new-instance p2, Lcom/android/gallery3d/ui/BitmapTexture;

    invoke-direct {p2, p1}, Lcom/android/gallery3d/ui/BitmapTexture;-><init>(Landroid/graphics/Bitmap;)V

    iput-object p2, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mImageTexture:Lcom/android/gallery3d/ui/BitmapTexture;

    iget-object p1, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mImageTexture:Lcom/android/gallery3d/ui/BitmapTexture;

    invoke-virtual {p1, p3}, Lcom/android/gallery3d/ui/BitmapTexture;->setOpaque(Z)V

    invoke-direct {p0}, Lcom/android/camera/effect/renders/ImageWaterMark;->calcCenterAxis()V

    return-void
.end method

.method private calcCenterAxis()V
    .locals 2

    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mOrientation:I

    if-eqz v0, :cond_3

    const/16 v1, 0x5a

    if-eq v0, v1, :cond_2

    const/16 v1, 0xb4

    if-eq v0, v1, :cond_1

    const/16 v1, 0x10e

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingY:I

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/ImageWaterMark;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterX:I

    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingX:I

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/ImageWaterMark;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterY:I

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPictureWidth:I

    iget v1, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingX:I

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/ImageWaterMark;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterX:I

    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingY:I

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/ImageWaterMark;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterY:I

    goto :goto_0

    :cond_2
    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPictureWidth:I

    iget v1, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingY:I

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/ImageWaterMark;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterX:I

    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPictureHeight:I

    iget v1, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingX:I

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/ImageWaterMark;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterY:I

    goto :goto_0

    :cond_3
    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingX:I

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/ImageWaterMark;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterX:I

    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPictureHeight:I

    iget v1, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingY:I

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/ImageWaterMark;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterY:I

    nop

    :goto_0
    return-void
.end method


# virtual methods
.method public getCenterX()I
    .locals 1

    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterX:I

    return v0
.end method

.method public getCenterY()I
    .locals 1

    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterY:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mHeight:I

    return v0
.end method

.method public getPaddingX()I
    .locals 1

    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingX:I

    return v0
.end method

.method public getPaddingY()I
    .locals 1

    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingY:I

    return v0
.end method

.method public getTexture()Lcom/android/gallery3d/ui/BasicTexture;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mImageTexture:Lcom/android/gallery3d/ui/BitmapTexture;

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mWidth:I

    return v0
.end method
