.class Lcom/android/zxing/GoogleLensDecoder;
.super Lcom/android/zxing/Decoder;
.source "GoogleLensDecoder.java"


# instance fields
.field private mSensorOrientation:I


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/android/zxing/Decoder;-><init>()V

    return-void
.end method


# virtual methods
.method public init(I)V
    .locals 1

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilities(I)Lcom/android/camera2/CameraCapabilities;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->getSensorOrientation()I

    move-result p1

    iput p1, p0, Lcom/android/zxing/GoogleLensDecoder;->mSensorOrientation:I

    return-void
.end method

.method protected isNeedImage()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public needPreviewFrame()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onPreviewFrame(Landroid/media/Image;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/android/zxing/Decoder;->onPreviewFrame(Landroid/media/Image;)V

    invoke-static {}, Lcom/android/lens/LensAgent;->getInstance()Lcom/android/lens/LensAgent;

    move-result-object v0

    iget v1, p0, Lcom/android/zxing/GoogleLensDecoder;->mSensorOrientation:I

    invoke-virtual {v0, p1, v1}, Lcom/android/lens/LensAgent;->onNewImage(Landroid/media/Image;I)V

    return-void
.end method

.method public onPreviewFrame(Lcom/android/zxing/PreviewImage;)V
    .locals 0

    return-void
.end method

.method public reset()V
    .locals 0

    return-void
.end method

.method public startDecode()V
    .locals 0

    return-void
.end method
