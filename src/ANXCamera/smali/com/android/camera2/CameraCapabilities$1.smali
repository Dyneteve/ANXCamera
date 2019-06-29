.class Lcom/android/camera2/CameraCapabilities$1;
.super Ljava/util/ArrayList;
.source "CameraCapabilities.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera2/CameraCapabilities;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList<",
        "Lcom/android/camera2/vendortag/VendorTag<",
        "Landroid/hardware/camera2/CameraCharacteristics$Key<",
        "[",
        "Landroid/hardware/camera2/params/StreamConfiguration;",
        ">;>;>;"
    }
.end annotation


# direct methods
.method constructor <init>(I)V
    .locals 0

    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(I)V

    sget-object p1, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->QCFA_STREAM_CONFIGURATIONS:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {p0, p1}, Lcom/android/camera2/CameraCapabilities$1;->add(Ljava/lang/Object;)Z

    sget-object p1, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {p0, p1}, Lcom/android/camera2/CameraCapabilities$1;->add(Ljava/lang/Object;)Z

    sget-object p1, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->SCALER_AVAILABLE_SR_STREAM_CONFIGURATIONS:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {p0, p1}, Lcom/android/camera2/CameraCapabilities$1;->add(Ljava/lang/Object;)Z

    return-void
.end method
