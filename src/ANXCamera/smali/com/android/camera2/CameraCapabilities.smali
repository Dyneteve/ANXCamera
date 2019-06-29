.class public Lcom/android/camera2/CameraCapabilities;
.super Ljava/lang/Object;
.source "CameraCapabilities.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera2/CameraCapabilities$OperatingMode;
    }
.end annotation


# static fields
.field public static final CAMERA_ILLEGALSTATE_EXCEPTION:I = 0x100

.field private static final DEFAULT_VIEW_ANGLE:F = 51.5f

.field private static final HAL_PIXEL_FORMAT_BLOB:I = 0x21

.field public static final SESSION_OPERATION_MODE_ALGO_UP_DUAL_BOKEH:I = 0x9000

.field public static final SESSION_OPERATION_MODE_ALGO_UP_HD:I = 0x9004

.field public static final SESSION_OPERATION_MODE_ALGO_UP_NORMAL:I = 0x9005

.field public static final SESSION_OPERATION_MODE_ALGO_UP_QCFA:I = 0x9001

.field public static final SESSION_OPERATION_MODE_ALGO_UP_SAT:I = 0x9002

.field public static final SESSION_OPERATION_MODE_ALGO_UP_SINGLE_BOKEH:I = 0x9003

.field public static final SESSION_OPERATION_MODE_AUTO_ZOOM:I = 0x80f4

.field public static final SESSION_OPERATION_MODE_FOVC:I = 0xf010

.field public static final SESSION_OPERATION_MODE_FRONT_PORTRAIT:I = 0x80f1

.field public static final SESSION_OPERATION_MODE_HFR_120:I = 0x8078

.field public static final SESSION_OPERATION_MODE_HIGH_SPEED:I = 0x1

.field public static final SESSION_OPERATION_MODE_HSR_60:I = 0x803c

.field public static final SESSION_OPERATION_MODE_MANUAL:I = 0x8003

.field public static final SESSION_OPERATION_MODE_MCTF:I = 0x8030

.field public static final SESSION_OPERATION_MODE_MIMOJI:I = 0x800b

.field public static final SESSION_OPERATION_MODE_MIUI_BACK:I = 0x8001

.field public static final SESSION_OPERATION_MODE_MIUI_FRONT:I = 0x8005

.field public static final SESSION_OPERATION_MODE_NORMAL:I = 0x0

.field public static final SESSION_OPERATION_MODE_NORMAL_ULTRA_PIXEL_PHOTOGRAPHY:I = 0x80f3

.field public static final SESSION_OPERATION_MODE_PANORMA:I = 0x8008

.field public static final SESSION_OPERATION_MODE_PORTRAIT:I = 0x8002

.field public static final SESSION_OPERATION_MODE_PROFESSIONAL_ULTRA_PIXEL_PHOTOGRAPHY:I = 0x80f5

.field public static final SESSION_OPERATION_MODE_QCFA:I = 0x8007

.field public static final SESSION_OPERATION_MODE_SUPER_NIGHT:I = 0x800a

.field public static final SESSION_OPERATION_MODE_VIDEO:I = 0x8004

.field public static final SESSION_OPERATION_MODE_VIDEO_BEAUTY:I = 0x8009

.field private static final TAG:Ljava/lang/String;

.field public static final ULTRA_PIXEL_FRONT_32M:I = 0x1ec7b00

.field public static final ULTRA_PIXEL_REAR_48M:I = 0x2dc6c00

.field public static final ULTRA_PIXEL_REAR_64M:I = 0x3d2c300

.field public static final ULTRA_PIXEL_SIZE_LIST:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation
.end field

.field private static final ULTRA_PIXEL_STREAM_CONFIGURATIONS_VENDOR_KEYS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera2/vendortag/VendorTag<",
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "[",
            "Landroid/hardware/camera2/params/StreamConfiguration;",
            ">;>;>;"
        }
    .end annotation
.end field


# instance fields
.field private final mCameraId:I

.field private final mCaptureRequestVendorKeys:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

.field private mOperatingMode:I

.field private mStreamConfigurationMap:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/hardware/camera2/params/StreamConfigurationMap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-class v0, Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    new-instance v0, Lcom/android/camera2/CameraCapabilities$1;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lcom/android/camera2/CameraCapabilities$1;-><init>(I)V

    sput-object v0, Lcom/android/camera2/CameraCapabilities;->ULTRA_PIXEL_STREAM_CONFIGURATIONS_VENDOR_KEYS:Ljava/util/List;

    new-instance v0, Lcom/android/camera2/CameraCapabilities$2;

    invoke-direct {v0}, Lcom/android/camera2/CameraCapabilities$2;-><init>()V

    sput-object v0, Lcom/android/camera2/CameraCapabilities;->ULTRA_PIXEL_SIZE_LIST:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Landroid/hardware/camera2/CameraCharacteristics;I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_2

    iput-object p1, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    iput p2, p0, Lcom/android/camera2/CameraCapabilities;->mCameraId:I

    iget-object p1, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object p2, Landroid/hardware/camera2/CameraCharacteristics;->INFO_SUPPORTED_HARDWARE_LEVEL:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p1, p2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 p2, 0x2

    if-ne p1, p2, :cond_0

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    goto :goto_1

    :cond_0
    iget-object p1, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraCharacteristics;->getNativeCopy()Landroid/hardware/camera2/impl/CameraMetadataNative;

    move-result-object p1

    const-class p2, Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1, p2}, Landroid/hardware/camera2/impl/CameraMetadataNative;->getAllVendorKeys(Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object p1

    new-instance p2, Ljava/util/HashSet;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {p2, v0}, Ljava/util/HashSet;-><init>(I)V

    iput-object p2, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    invoke-virtual {p2}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    :goto_1
    return-void

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Null CameraCharacteristics"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private addStreamConfigurationToList(Ljava/util/List;Lcom/android/camera2/vendortag/VendorTag;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/hardware/camera2/params/StreamConfiguration;",
            ">;",
            "Lcom/android/camera2/vendortag/VendorTag<",
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "[",
            "Landroid/hardware/camera2/params/StreamConfiguration;",
            ">;>;)V"
        }
    .end annotation

    if-nez p2, :cond_0

    sget-object p1, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    const-string p2, "addStreamConfigurationToList: but the key is null!"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    invoke-static {v0, p2}, Lcom/android/camera2/vendortag/VendorTagHelper;->getValueQuietly(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/hardware/camera2/params/StreamConfiguration;

    if-eqz v0, :cond_1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    sget-object p1, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "addStreamConfigurationToList: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ": size = "

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length p2, v0

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    sget-object p1, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "addStreamConfigurationToList: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\'s configurations is null!"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method private convertToPictureSize([Landroid/util/Size;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/util/Size;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p1, :cond_0

    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p1, v2

    new-instance v4, Lcom/android/camera/CameraSize;

    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    move-result v5

    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    move-result v3

    invoke-direct {v4, v5, v3}, Lcom/android/camera/CameraSize;-><init>(II)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private exists(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public static getBurstShootCount()I
    .locals 1

    invoke-static {}, Lcom/mi/config/b;->getBurstShootCount()I

    move-result v0

    return v0
.end method

.method private getExtraHighSpeedVideoConfiguration()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera2/MiHighSpeedVideoConfiguration;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->isSupportExtraHighSpeedVideoConfiguration()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v2, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->EXTRA_HIGH_SPEED_VIDEO_NUMBER:Lcom/android/camera2/vendortag/VendorTag;

    invoke-static {v0, v2}, Lcom/android/camera2/vendortag/VendorTagHelper;->getValue(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-lez v2, :cond_1

    iget-object v2, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v3, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->EXTRA_HIGH_SPEED_VIDEO_CONFIGURATIONS:Lcom/android/camera2/vendortag/VendorTag;

    invoke-static {v2, v3}, Lcom/android/camera2/vendortag/VendorTagHelper;->getValue(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [I

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v2, v0}, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->unmarshal([II)Ljava/util/List;

    move-result-object v1

    nop

    :cond_0
    return-object v1

    :cond_1
    return-object v1
.end method

.method private getStreamConfigurationMap()Landroid/hardware/camera2/params/StreamConfigurationMap;
    .locals 4

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mStreamConfigurationMap:Landroid/util/SparseArray;

    if-nez v0, :cond_0

    new-instance v0, Landroid/util/SparseArray;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mStreamConfigurationMap:Landroid/util/SparseArray;

    :cond_0
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mStreamConfigurationMap:Landroid/util/SparseArray;

    iget v1, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/android/camera2/CameraCapabilities;->getStreamConfigurations()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_1

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mStreamConfigurationMap:Landroid/util/SparseArray;

    iget v1, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    iget-object v2, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/camera2/params/StreamConfigurationMap;

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/android/camera2/CameraCapabilities;->mStreamConfigurationMap:Landroid/util/SparseArray;

    iget v2, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    iget-object v3, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    invoke-static {v0, v3}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->createStreamConfigMap(Ljava/util/List;Landroid/hardware/camera2/CameraCharacteristics;)Landroid/hardware/camera2/params/StreamConfigurationMap;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mStreamConfigurationMap:Landroid/util/SparseArray;

    iget v1, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/params/StreamConfigurationMap;

    return-object v0
.end method

.method private getStreamConfigurations()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/hardware/camera2/params/StreamConfiguration;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sget-object v1, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v1}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v1

    sget-object v2, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->SCALER_AVAILABLE_SR_STREAM_CONFIGURATIONS:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v2}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v2

    sget-object v3, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->QCFA_STREAM_CONFIGURATIONS:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v3}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v3

    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->isSupportedQcfa()Z

    move-result v4

    if-eqz v4, :cond_0

    if-eqz v2, :cond_0

    invoke-direct {p0}, Lcom/android/camera2/CameraCapabilities;->isUltraPixelPhotographyMode()Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object v1, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->SCALER_AVAILABLE_SR_STREAM_CONFIGURATIONS:Lcom/android/camera2/vendortag/VendorTag;

    invoke-direct {p0, v0, v1}, Lcom/android/camera2/CameraCapabilities;->addStreamConfigurationToList(Ljava/util/List;Lcom/android/camera2/vendortag/VendorTag;)V

    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->isSupportedQcfa()Z

    move-result v2

    if-eqz v2, :cond_5

    if-eqz v3, :cond_5

    invoke-direct {p0}, Lcom/android/camera2/CameraCapabilities;->isQcfaMode()Z

    move-result v2

    if-nez v2, :cond_2

    if-nez v1, :cond_1

    invoke-direct {p0}, Lcom/android/camera2/CameraCapabilities;->isSupportedAndroidScalerStream()Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_1
    invoke-direct {p0}, Lcom/android/camera2/CameraCapabilities;->isUltraPixelPhotographyMode()Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget v2, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    const v3, 0x9003

    if-eq v2, v3, :cond_3

    sget-object v2, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->QCFA_STREAM_CONFIGURATIONS:Lcom/android/camera2/vendortag/VendorTag;

    invoke-direct {p0, v0, v2}, Lcom/android/camera2/CameraCapabilities;->addStreamConfigurationToList(Ljava/util/List;Lcom/android/camera2/vendortag/VendorTag;)V

    :cond_3
    if-eqz v1, :cond_4

    sget-object v1, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS:Lcom/android/camera2/vendortag/VendorTag;

    invoke-direct {p0, v0, v1}, Lcom/android/camera2/CameraCapabilities;->addStreamConfigurationToList(Ljava/util/List;Lcom/android/camera2/vendortag/VendorTag;)V

    goto :goto_0

    :cond_4
    sget-object v1, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->SCALER_AVAILABLE_STREAM_CONFIGURATIONS:Lcom/android/camera2/vendortag/VendorTag;

    invoke-direct {p0, v0, v1}, Lcom/android/camera2/CameraCapabilities;->addStreamConfigurationToList(Ljava/util/List;Lcom/android/camera2/vendortag/VendorTag;)V

    :goto_0
    return-object v0

    :cond_5
    if-eqz v1, :cond_6

    sget-object v1, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS:Lcom/android/camera2/vendortag/VendorTag;

    invoke-direct {p0, v0, v1}, Lcom/android/camera2/CameraCapabilities;->addStreamConfigurationToList(Ljava/util/List;Lcom/android/camera2/vendortag/VendorTag;)V

    :cond_6
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_7

    invoke-static {}, Lcom/android/camera2/compat/MiCameraCompat;->getDefaultSteamConfigurationsTag()Lcom/android/camera2/vendortag/VendorTag;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/android/camera2/CameraCapabilities;->addStreamConfigurationToList(Ljava/util/List;Lcom/android/camera2/vendortag/VendorTag;)V

    :cond_7
    return-object v0
.end method

.method private isQcfaMode()Z
    .locals 2

    iget v0, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    const v1, 0x8007

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    const v1, 0x9001

    if-eq v0, v1, :cond_1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mi/config/a;->q(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private isSupportedAndroidScalerStream()Z
    .locals 2

    sget-boolean v0, Lcom/mi/config/b;->sM:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->sO:Z

    if-eqz v0, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->getFacing()I

    move-result v0

    if-ne v0, v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private isUltraPixelPhotographyMode()Z
    .locals 2

    iget v0, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    const v1, 0x80f3

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    const v1, 0x9004

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    const v1, 0x80f5

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method


# virtual methods
.method public getActiveArraySize()Landroid/graphics/Rect;
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->isSupportedQcfa()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->QCFA_ACTIVE_ARRAY_SIZE:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->QCFA_ACTIVE_ARRAY_SIZE:Lcom/android/camera2/vendortag/VendorTag;

    invoke-static {v0, v1}, Lcom/android/camera2/vendortag/VendorTagHelper;->getValue(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    return-object v0
.end method

.method public getBeautyVersion()I
    .locals 2

    nop

    sget-object v0, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->BEAUTY_VERSION:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->BEAUTY_VERSION:Lcom/android/camera2/vendortag/VendorTag;

    invoke-static {v0, v1}, Lcom/android/camera2/vendortag/VendorTagHelper;->getValue(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Byte;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Byte;->byteValue()B

    move-result v0

    goto :goto_1

    :cond_1
    const/4 v0, -0x1

    :goto_1
    return v0
.end method

.method public getCameraCalibrationData()[B
    .locals 2

    sget-object v0, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->CAM_CALIBRATION_DATA:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->CAM_CALIBRATION_DATA:Lcom/android/camera2/vendortag/VendorTag;

    invoke-static {v0, v1}, Lcom/android/camera2/vendortag/VendorTagHelper;->getValue(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getCameraCharacteristics()Landroid/hardware/camera2/CameraCharacteristics;
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    return-object v0
.end method

.method public getCameraId()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraCapabilities;->mCameraId:I

    return v0
.end method

.method public getCaptureRequestVendorKeys()Ljava/util/HashSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    return-object v0
.end method

.method public getExposureCompensationRange()Landroid/util/Range;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_COMPENSATION_RANGE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Range;

    return-object v0
.end method

.method public getExposureCompensationRational()Landroid/util/Rational;
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_COMPENSATION_STEP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Rational;

    return-object v0
.end method

.method public getExposureCompensationStep()F
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_COMPENSATION_STEP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Rational;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/util/Rational;->floatValue()F

    move-result v0

    goto :goto_0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    return v0
.end method

.method public getExposureTimeRange()Landroid/util/Range;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_EXPOSURE_TIME_RANGE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Range;

    return-object v0
.end method

.method public getFacing()I
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0
.end method

.method public getIsoRange()Landroid/util/Range;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_SENSITIVITY_RANGE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Range;

    return-object v0
.end method

.method public getMaxExposureCompensation()I
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->getExposureCompensationRange()Landroid/util/Range;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getMaxFaceCount()I
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->STATISTICS_INFO_MAX_FACE_COUNT:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getMaxIso()I
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->getIsoRange()Landroid/util/Range;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getMaxZoomRatio()F
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_AVAILABLE_MAX_DIGITAL_ZOOM:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    goto :goto_0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    return v0
.end method

.method public getMinimumFocusDistance()F
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->LENS_INFO_MINIMUM_FOCUS_DISTANCE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getOperatingMode()I
    .locals 1

    iget v0, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    return v0
.end method

.method public getScreenLightBrightness()I
    .locals 4

    nop

    sget-object v0, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->SCREEN_LIGHT_BRIGHTNESS:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->SCREEN_LIGHT_BRIGHTNESS:Lcom/android/camera2/vendortag/VendorTag;

    invoke-static {v0, v1}, Lcom/android/camera2/vendortag/VendorTagHelper;->getValue(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sget-object v1, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Screen light brightness: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_1

    :cond_1
    const/4 v0, -0x1

    :goto_1
    return v0
.end method

.method public getSensorOrientation()I
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_ORIENTATION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getSupportedAWBModes()[I
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AWB_AVAILABLE_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public getSupportedAntiBandingModes()[I
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_AVAILABLE_ANTIBANDING_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public getSupportedColorEffects()[I
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AVAILABLE_EFFECTS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public getSupportedCustomFpsRange()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera2/MiCustomFpsRange;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->CUSTOM_HFR_FPS_TABLE:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v2, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->CUSTOM_HFR_FPS_TABLE:Lcom/android/camera2/vendortag/VendorTag;

    invoke-static {v0, v2}, Lcom/android/camera2/vendortag/VendorTagHelper;->getValue(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/android/camera2/MiCustomFpsRange;->unmarshal([I)Ljava/util/List;

    move-result-object v1

    nop

    :cond_0
    return-object v1

    :cond_1
    return-object v1
.end method

.method public getSupportedFlashModes()[I
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_AVAILABLE_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public getSupportedFocusModes()[I
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AF_AVAILABLE_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public getSupportedFpsRange()[Landroid/util/Range;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/util/Range;

    return-object v0
.end method

.method public getSupportedHFRVideoFPSList(Landroid/util/Size;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Size;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0, p1}, Lcom/android/camera2/CameraCapabilities;->getSupportedHighSpeedVideoFPSRange(Landroid/util/Size;)[Landroid/util/Range;

    move-result-object p1

    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    invoke-virtual {v3}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v3}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v3}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v3}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public getSupportedHardwareLevel()I
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->INFO_SUPPORTED_HARDWARE_LEVEL:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getSupportedHighResolutionOutputSize(I)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/android/camera2/CameraCapabilities;->getStreamConfigurationMap()Landroid/hardware/camera2/params/StreamConfigurationMap;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getHighResolutionOutputSizes(I)[Landroid/util/Size;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/camera2/CameraCapabilities;->convertToPictureSize([Landroid/util/Size;)Ljava/util/List;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    return-object p1
.end method

.method public getSupportedHighSpeedVideoFPSRange(Landroid/util/Size;)[Landroid/util/Range;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Size;",
            ")[",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/params/StreamConfigurationMap;

    invoke-virtual {v0, p1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getHighSpeedVideoFpsRangesFor(Landroid/util/Size;)[Landroid/util/Range;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->isSupportExtraHighSpeedVideoConfiguration()Z

    move-result v1

    if-nez v1, :cond_0

    return-object v0

    :cond_0
    invoke-direct {p0}, Lcom/android/camera2/CameraCapabilities;->getExtraHighSpeedVideoConfiguration()Ljava/util/List;

    move-result-object v1

    if-nez v1, :cond_1

    return-object v0

    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera2/MiHighSpeedVideoConfiguration;

    if-eqz p1, :cond_2

    invoke-virtual {v3}, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->getSize()Landroid/util/Size;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/util/Size;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v3}, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->getFpsRange()Landroid/util/Range;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    goto :goto_0

    :cond_3
    if-eqz v0, :cond_4

    array-length p1, v0

    const/4 v1, 0x0

    :goto_1
    if-ge v1, p1, :cond_4

    aget-object v3, v0, v1

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_4
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result p1

    new-array p1, p1, [Landroid/util/Range;

    invoke-interface {v2, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Landroid/util/Range;

    return-object p1
.end method

.method public getSupportedHighSpeedVideoSize()[Landroid/util/Size;
    .locals 7

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/params/StreamConfigurationMap;

    invoke-virtual {v0}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getHighSpeedVideoSizes()[Landroid/util/Size;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->isSupportExtraHighSpeedVideoConfiguration()Z

    move-result v1

    if-nez v1, :cond_0

    return-object v0

    :cond_0
    invoke-direct {p0}, Lcom/android/camera2/CameraCapabilities;->getExtraHighSpeedVideoConfiguration()Ljava/util/List;

    move-result-object v1

    if-nez v1, :cond_1

    return-object v0

    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera2/MiHighSpeedVideoConfiguration;

    invoke-virtual {v3}, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->getSize()Landroid/util/Size;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    if-eqz v0, :cond_5

    array-length v3, v0

    move v4, v1

    :goto_1
    if-ge v4, v3, :cond_5

    aget-object v5, v0, v4

    invoke-interface {v2, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_5
    new-array v0, v1, [Landroid/util/Size;

    invoke-interface {v2, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/util/Size;

    return-object v0
.end method

.method public getSupportedOutputSize(I)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/android/camera2/CameraCapabilities;->getStreamConfigurationMap()Landroid/hardware/camera2/params/StreamConfigurationMap;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(I)[Landroid/util/Size;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/camera2/CameraCapabilities;->convertToPictureSize([Landroid/util/Size;)Ljava/util/List;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    return-object p1
.end method

.method public getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/android/camera2/CameraCapabilities;->getStreamConfigurationMap()Landroid/hardware/camera2/params/StreamConfigurationMap;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(Ljava/lang/Class;)[Landroid/util/Size;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/camera2/CameraCapabilities;->convertToPictureSize([Landroid/util/Size;)Ljava/util/List;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    return-object p1
.end method

.method public getSupportedSceneModes()[I
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AVAILABLE_SCENE_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public getSupportedThumbnailSizes()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->JPEG_AVAILABLE_THUMBNAIL_SIZES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/util/Size;

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->convertToPictureSize([Landroid/util/Size;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getViewAngle(Z)F
    .locals 9

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->LENS_INFO_AVAILABLE_FOCAL_LENGTHS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    array-length v3, v0

    if-lez v3, :cond_2

    aget v0, v0, v2

    iget-object v3, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v4, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_PHYSICAL_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v3, v4}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/SizeF;

    if-eqz v3, :cond_2

    if-eqz p1, :cond_0

    invoke-virtual {v3}, Landroid/util/SizeF;->getHeight()F

    move-result v4

    goto :goto_0

    :cond_0
    invoke-virtual {v3}, Landroid/util/SizeF;->getWidth()F

    move-result v4

    :goto_0
    const/4 v5, 0x0

    cmpl-float v5, v4, v5

    if-lez v5, :cond_2

    const-wide/high16 v5, 0x3fe0000000000000L    # 0.5

    float-to-double v7, v4

    mul-double/2addr v5, v7

    float-to-double v7, v0

    div-double/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->atan(D)D

    move-result-wide v4

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    invoke-static {v4, v5}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v4

    mul-double/2addr v6, v4

    double-to-float v4, v6

    sget-object v5, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "%s view angle: %.2f, size = %s, focalLength = %.4f"

    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    if-eqz p1, :cond_1

    const-string/jumbo p1, "vertical"

    goto :goto_1

    :cond_1
    const-string p1, "horizontal"

    :goto_1
    aput-object p1, v8, v2

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    aput-object p1, v8, v1

    const/4 p1, 0x2

    aput-object v3, v8, p1

    const/4 p1, 0x3

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    aput-object v0, v8, p1

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v5, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v4

    :cond_2
    sget-object v0, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "failed to get %s view angle"

    new-array v1, v1, [Ljava/lang/Object;

    if-eqz p1, :cond_3

    const-string/jumbo p1, "vertical"

    goto :goto_2

    :cond_3
    const-string p1, "horizontal"

    :goto_2
    aput-object p1, v1, v2

    invoke-static {v3, v4, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/high16 p1, 0x424e0000    # 51.5f

    return p1
.end method

.method public isAELockSupported()Z
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_LOCK_AVAILABLE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isAERegionSupported()Z
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_MAX_REGIONS_AE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isAFRegionSupported()Z
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->LENS_INFO_MINIMUM_FOCUS_DISTANCE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isASDSceneSupported()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->AI_SCENE_APPLY:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isAWBLockSupported()Z
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AWB_LOCK_AVAILABLE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isAdaptiveSnapshotSizeInSatModeSupported()Z
    .locals 4

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getSATCameraId()I

    move-result v0

    iget v1, p0, Lcom/android/camera2/CameraCapabilities;->mCameraId:I

    const/4 v2, 0x0

    if-eq v1, v0, :cond_0

    sget-object v0, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    const-string v1, "isAdaptiveSnapshotSizeInSatModeSupported(): false"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_0
    sget-object v0, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->ADAPTIVE_SNAPSHOT_SIZE_IN_SAT_MODE_SUPPORTED:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    const-string v1, "isAdaptiveSnapshotSizeInSatModeSupported(): false"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_1
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->ADAPTIVE_SNAPSHOT_SIZE_IN_SAT_MODE_SUPPORTED:Lcom/android/camera2/vendortag/VendorTag;

    invoke-static {v0, v1}, Lcom/android/camera2/vendortag/VendorTagHelper;->getValue(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v2, 0x1

    nop

    :cond_2
    sget-object v0, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isAdaptiveSnapshotSizeInSatModeSupported(): "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2
.end method

.method public isAutoFocusSupported()Z
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->getSupportedFocusModes()[I

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Lcom/android/camera/Util;->isSupported(I[I)Z

    move-result v0

    return v0
.end method

.method public isBackwardCaptureSupported()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->BACKWARD_CAPTURE_HINT:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isEISPreviewSupported()Z
    .locals 5

    sget-object v0, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->EIS_PREVIEW_SUPPORTED:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v2, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->EIS_PREVIEW_SUPPORTED:Lcom/android/camera2/vendortag/VendorTag;

    invoke-static {v0, v2}, Lcom/android/camera2/vendortag/VendorTagHelper;->getValue(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Byte;

    sget-object v2, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isEISPreviewSupported: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Byte;->byteValue()B

    move-result v0

    if-ne v0, v2, :cond_0

    move v1, v2

    nop

    :cond_0
    return v1

    :cond_1
    return v1
.end method

.method public isFaceDetectionSupported()Z
    .locals 6

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->STATISTICS_INFO_AVAILABLE_FACE_DETECT_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    array-length v2, v0

    move v3, v1

    :goto_0
    if-ge v3, v2, :cond_1

    aget v4, v0, v3

    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    return v5

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public isFixedFocus()Z
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->getMinimumFocusDistance()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFlashSupported()Z
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->FLASH_INFO_AVAILABLE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFovcSupported()Z
    .locals 4

    nop

    sget-object v0, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->FOVC_SUPPORTED:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->FOVC_SUPPORTED:Lcom/android/camera2/vendortag/VendorTag;

    invoke-static {v0, v1}, Lcom/android/camera2/vendortag/VendorTagHelper;->getValue(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Byte;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sget-object v1, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isFovcSupported: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Byte;->byteValue()B

    move-result v0

    if-ne v0, v1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    return v1
.end method

.method public isMFNRBokehSupported()Z
    .locals 4

    nop

    sget-object v0, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->MFNR_BOKEH_SUPPORTED:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->MFNR_BOKEH_SUPPORTED:Lcom/android/camera2/vendortag/VendorTag;

    invoke-static {v0, v1}, Lcom/android/camera2/vendortag/VendorTagHelper;->getValue(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Byte;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sget-object v1, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isMFNRBokehSupported: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Byte;->byteValue()B

    move-result v0

    if-ne v0, v1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    return v1
.end method

.method public isPartialMetadataSupported()Z
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->REQUEST_PARTIAL_RESULT_COUNT:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-le v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isRemosaicDetecedSupported()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureResultVendorTags;->REMOSAIC_DETECTED:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSensorHdrSupported()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureResultVendorTags;->SENSOR_HDR_ENABLE:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportAutoHdr()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->HDR_CHECKER_ENABLE:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportBeauty()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->BEAUTY_LEVEL:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportBeautyMakeup()Z
    .locals 3

    sget-object v0, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->BEAUTY_MAKEUP:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v2, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->BEAUTY_MAKEUP:Lcom/android/camera2/vendortag/VendorTag;

    invoke-static {v0, v2}, Lcom/android/camera2/vendortag/VendorTagHelper;->getValue(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1

    :cond_1
    return v1
.end method

.method public isSupportBeautyType(Ljava/lang/String;)Z
    .locals 1

    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->BEAUTY_TYPE_VENDOR_TAG_MAP:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->BEAUTY_TYPE_VENDOR_TAG_MAP:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {p1}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isSupportBokehAdjust()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->BOKEH_F_NUMBER:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportBurstFps()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->BURST_SHOOT_FPS:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportBurstHint()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->BURST_CAPTURE_HINT:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportCameraAi30()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->CAMERA_AI_30:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportContrast()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->CONTRAST_LEVEL:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportCustomWatermark()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->CUSTOM_WATERMARK_TEXT:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportDepurple()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->DEPURPLE:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportDeviceOrientation()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->DEVICE_ORIENTATION:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportExtraHighSpeedVideoConfiguration()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->EXTRA_HIGH_SPEED_VIDEO_CONFIGURATIONS:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->EXTRA_HIGH_SPEED_VIDEO_NUMBER:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSupportEyeLight()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->EYE_LIGHT_TYPE:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportFaceAgeAnalyze()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->FACE_AGE_ANALYZE_ENABLED:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportFaceScore()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->FACE_SCORE_ENABLED:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportFastZoomIn()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureResultVendorTags;->FAST_ZOOM_RESULT:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportFrontMirror()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->FRONT_MIRROR:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportHFRDeflicker()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->DEFLICKER_ENABLED:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportHHT()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->HHT_ENABLED:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportHdr()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->HDR_ENABLED:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportLensDirtyDetect()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->LENS_DIRTY_DETECT:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportMacroMode()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->MACRO_MODE:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportMfnr()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->MFNR_ENABLED:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportMiBokeh()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->FRONT_SINGLE_CAMERA_BOKEH:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportNormalWideLDC()Z
    .locals 2

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->NORMAL_WIDE_LENS_DISTORTION_CORRECTION_LEVEL:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    const-string v1, "isSupportNormalWideLDC: true"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    return v0

    :cond_0
    sget-object v0, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    const-string v1, "isSupportNormalWideLDC: false"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return v0
.end method

.method public isSupportOIS()Z
    .locals 4

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->LENS_INFO_AVAILABLE_OPTICAL_STABILIZATION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    array-length v2, v0

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    array-length v2, v0

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    aget v0, v0, v1

    if-nez v0, :cond_1

    return v1

    :cond_1
    return v3

    :cond_2
    :goto_0
    return v1
.end method

.method public isSupportParallel()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->PARALLEL_ENABLED:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportPortraitLighting()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->PORTRAIT_LIGHTING:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportRearBokeh()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->REAR_BOKEH_ENABLE:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportSnapShotTorch()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->SNAP_SHOT_TORCH:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportSuperNight()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->SUPER_NIGHT_SCENE_ENABLED:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportSuperResolution()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->SUPER_RESOLUTION_ENABLED:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportSwMfnr()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->SW_MFNR_ENABLED:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportUltraWideLDC()Z
    .locals 2

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->ULTRA_WIDE_LENS_DISTORTION_CORRECTION_LEVEL:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    const-string v1, "isSupportUltraWideLDC: true"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    return v0

    :cond_0
    sget-object v0, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    const-string v1, "isSupportUltraWideLDC: false"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return v0
.end method

.method public isSupportVideoBeauty()Z
    .locals 3

    sget-object v0, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->VIDEO_BEAUTY:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v2, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->VIDEO_BEAUTY:Lcom/android/camera2/vendortag/VendorTag;

    invoke-static {v0, v2}, Lcom/android/camera2/vendortag/VendorTagHelper;->getValue(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1

    :cond_1
    return v1
.end method

.method public isSupportWatermark()Z
    .locals 1

    sget-object v0, Lcom/android/camera2/vendortag/CaptureRequestVendorTags;->WATERMARK_APPLIEDTYPE:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportedQcfa()Z
    .locals 3

    sget-object v0, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->IS_QCFA_SENSOR:Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v0}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v2, Lcom/android/camera2/vendortag/CameraCharacteristicsVendorTags;->IS_QCFA_SENSOR:Lcom/android/camera2/vendortag/VendorTag;

    invoke-static {v0, v2}, Lcom/android/camera2/vendortag/VendorTagHelper;->getValue(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Byte;

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Byte;->byteValue()B

    move-result v0

    if-ne v0, v2, :cond_0

    move v1, v2

    nop

    :cond_0
    return v1

    :cond_1
    return v1
.end method

.method public isUltraPixelPhotographySupported(I)Z
    .locals 8

    sget-object v0, Lcom/android/camera2/CameraCapabilities;->ULTRA_PIXEL_SIZE_LIST:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/util/Size;

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->isSupportedQcfa()Z

    move-result v1

    if-nez v1, :cond_1

    return v0

    :cond_1
    sget-object v1, Lcom/android/camera2/CameraCapabilities;->ULTRA_PIXEL_STREAM_CONFIGURATIONS_VENDOR_KEYS:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera2/vendortag/VendorTag;

    invoke-virtual {v2}, Lcom/android/camera2/vendortag/VendorTag;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/camera2/CameraCapabilities;->exists(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    goto :goto_0

    :cond_3
    iget-object v3, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    invoke-static {v3, v2}, Lcom/android/camera2/vendortag/VendorTagHelper;->getValue(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Landroid/hardware/camera2/params/StreamConfiguration;

    if-eqz v2, :cond_2

    array-length v3, v2

    if-gtz v3, :cond_4

    goto :goto_0

    :cond_4
    array-length v3, v2

    move v4, v0

    :goto_1
    if-ge v4, v3, :cond_6

    aget-object v5, v2, v4

    invoke-virtual {v5}, Landroid/hardware/camera2/params/StreamConfiguration;->getFormat()I

    move-result v6

    const/16 v7, 0x21

    if-ne v6, v7, :cond_5

    invoke-virtual {v5}, Landroid/hardware/camera2/params/StreamConfiguration;->getWidth()I

    move-result v6

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v7

    if-ne v6, v7, :cond_5

    invoke-virtual {v5}, Landroid/hardware/camera2/params/StreamConfiguration;->getHeight()I

    move-result v5

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v6

    if-ne v5, v6, :cond_5

    const/4 p1, 0x1

    return p1

    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_6
    goto :goto_0

    :cond_7
    return v0
.end method

.method public isZoomSupported()Z
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->getMaxZoomRatio()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setOperatingMode(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    return-void
.end method
