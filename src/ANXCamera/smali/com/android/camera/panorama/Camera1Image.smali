.class public Lcom/android/camera/panorama/Camera1Image;
.super Lcom/android/camera/panorama/CaptureImage;
.source "Camera1Image.java"


# instance fields
.field private final mHeight:I

.field private final mWidth:I


# direct methods
.method public constructor <init>([BII)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/panorama/CaptureImage;-><init>([B)V

    iput p2, p0, Lcom/android/camera/panorama/Camera1Image;->mWidth:I

    iput p3, p0, Lcom/android/camera/panorama/Camera1Image;->mHeight:I

    return-void
.end method


# virtual methods
.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/android/camera/panorama/Camera1Image;->mHeight:I

    return v0
.end method

.method public getImageFormat()Ljava/lang/String;
    .locals 1

    const-string v0, "YVU420_SEMIPLANAR"

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/android/camera/panorama/Camera1Image;->mWidth:I

    return v0
.end method
