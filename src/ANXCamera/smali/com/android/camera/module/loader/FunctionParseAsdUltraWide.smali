.class public Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;
.super Ljava/lang/Object;
.source "FunctionParseAsdUltraWide.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Function<",
        "Landroid/hardware/camera2/CaptureResult;",
        "Landroid/hardware/camera2/CaptureResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final ULTRA_WIDE_RECOM:[I

.field public static final ULTRA_WIDE_SIDEFACE_TYPE:I = 0x2

.field public static final ULTRA_WIDE_TOWER_BUILDING_TYPE:I = 0x1


# instance fields
.field private mEnable:Z

.field private mIsOpenUltraWide:Z

.field private mUltrawidecheckcallback:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera2/Camera2Proxy$UltraWideCheckCallback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->ULTRA_WIDE_RECOM:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x2
        0x1
    .end array-data
.end method

.method public constructor <init>(ILcom/android/camera2/Camera2Proxy$UltraWideCheckCallback;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->isSupportUltraWide()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0xa3

    if-ne p1, v0, :cond_0

    invoke-static {p1}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelOn()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->mEnable:Z

    iget-boolean p1, p0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->mEnable:Z

    if-nez p1, :cond_1

    return-void

    :cond_1
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->mUltrawidecheckcallback:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private isOpenUltraWide(I)Z
    .locals 4

    nop

    const/4 v0, 0x0

    move v1, v0

    move v2, v1

    :goto_0
    sget-object v3, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->ULTRA_WIDE_RECOM:[I

    array-length v3, v3

    if-ge v1, v3, :cond_2

    sget-object v2, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->ULTRA_WIDE_RECOM:[I

    aget v2, v2, v1

    if-ne v2, p1, :cond_0

    const/4 v2, 0x1

    goto :goto_1

    :cond_0
    nop

    move v2, v0

    :goto_1
    if-eqz v2, :cond_1

    return v2

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return v2
.end method


# virtual methods
.method public apply(Landroid/hardware/camera2/CaptureResult;)Landroid/hardware/camera2/CaptureResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->mEnable:Z

    if-nez v0, :cond_0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->mUltrawidecheckcallback:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera2/Camera2Proxy$UltraWideCheckCallback;

    if-nez v0, :cond_1

    return-object p1

    :cond_1
    invoke-interface {v0}, Lcom/android/camera2/Camera2Proxy$UltraWideCheckCallback;->isUltraWideDetectStarted()Z

    move-result v1

    if-nez v1, :cond_2

    return-object p1

    :cond_2
    invoke-static {p1}, Lcom/android/camera2/CaptureResultParser;->getUltraWideDetectedResult(Landroid/hardware/camera2/CaptureResult;)I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->isOpenUltraWide(I)Z

    move-result v2

    move-object v3, v0

    check-cast v3, Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v3}, Lcom/android/camera/module/Camera2Module;->isZoomRatioBetweenUltraAndWide()Z

    move-result v3

    if-eqz v3, :cond_3

    const/4 v2, 0x0

    :cond_3
    iget-boolean v3, p0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->mIsOpenUltraWide:Z

    if-ne v3, v2, :cond_4

    return-object p1

    :cond_4
    iput-boolean v2, p0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->mIsOpenUltraWide:Z

    invoke-interface {v0, v2, v1}, Lcom/android/camera2/Camera2Proxy$UltraWideCheckCallback;->onUltraWideChanged(ZI)V

    return-object p1
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    check-cast p1, Landroid/hardware/camera2/CaptureResult;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->apply(Landroid/hardware/camera2/CaptureResult;)Landroid/hardware/camera2/CaptureResult;

    move-result-object p1

    return-object p1
.end method
