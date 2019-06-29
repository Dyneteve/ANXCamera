.class public Lcom/android/camera/lib/compatibility/related/v28/V28Utils;
.super Ljava/lang/Object;
.source "V28Utils.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x1c
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "V28Utils"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static constructCaptureRequestBuilder(Landroid/hardware/camera2/impl/CameraMetadataNative;ZILandroid/hardware/camera2/CaptureRequest;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 7

    new-instance v6, Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {p3}, Landroid/hardware/camera2/CaptureRequest;->getLogicalCameraId()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    move-object v0, v6

    move-object v1, p0

    move v2, p1

    move v3, p2

    invoke-direct/range {v0 .. v5}, Landroid/hardware/camera2/CaptureRequest$Builder;-><init>(Landroid/hardware/camera2/impl/CameraMetadataNative;ZILjava/lang/String;Ljava/util/Set;)V

    return-object v6
.end method

.method public static createCaptureSessionWithSessionConfiguration(Landroid/hardware/camera2/CameraDevice;ILandroid/hardware/camera2/params/InputConfiguration;Ljava/util/List;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/CameraDevice;",
            "I",
            "Landroid/hardware/camera2/params/InputConfiguration;",
            "Ljava/util/List<",
            "Landroid/hardware/camera2/params/OutputConfiguration;",
            ">;",
            "Landroid/hardware/camera2/CaptureRequest;",
            "Landroid/hardware/camera2/CameraCaptureSession$StateCallback;",
            "Landroid/os/Handler;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    new-instance v0, Landroid/hardware/camera2/params/SessionConfiguration;

    if-nez p6, :cond_0

    const/4 p6, 0x0

    goto :goto_0

    :cond_0
    new-instance v1, Lcom/android/camera/lib/compatibility/related/v28/V28Utils$2;

    invoke-direct {v1, p6}, Lcom/android/camera/lib/compatibility/related/v28/V28Utils$2;-><init>(Landroid/os/Handler;)V

    move-object p6, v1

    :goto_0
    invoke-direct {v0, p1, p3, p6, p5}, Landroid/hardware/camera2/params/SessionConfiguration;-><init>(ILjava/util/List;Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;)V

    if-eqz p2, :cond_1

    invoke-virtual {v0, p2}, Landroid/hardware/camera2/params/SessionConfiguration;->setInputConfiguration(Landroid/hardware/camera2/params/InputConfiguration;)V

    :cond_1
    invoke-virtual {v0, p4}, Landroid/hardware/camera2/params/SessionConfiguration;->setSessionParameters(Landroid/hardware/camera2/CaptureRequest;)V

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CameraDevice;->createCaptureSession(Landroid/hardware/camera2/params/SessionConfiguration;)V

    return-void
.end method

.method public static getInstallMethodDescription()Ljava/lang/String;
    .locals 1

    const-string v0, "(Landroid/content/Context;Ljava/lang/String;Landroid/content/pm/IPackageInstallObserver2;I)Z"

    return-object v0
.end method

.method public static getPackageInstallObserver(Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;)Ljava/lang/Object;
    .locals 1

    new-instance v0, Lcom/android/camera/lib/compatibility/related/v28/V28Utils$1;

    invoke-direct {v0, p0}, Lcom/android/camera/lib/compatibility/related/v28/V28Utils$1;-><init>(Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;)V

    return-object v0
.end method

.method public static setCutoutModeShortEdges(Landroid/view/Window;)V
    .locals 2

    invoke-virtual {p0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    const/4 v1, 0x1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    invoke-virtual {p0, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    return-void
.end method

.method public static setPhysicalCameraId(Landroid/hardware/camera2/params/OutputConfiguration;Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/hardware/camera2/params/OutputConfiguration;->setPhysicalCameraId(Ljava/lang/String;)V

    return-void
.end method

.method public static setTemporaryAutoBrightnessAdjustment(Landroid/hardware/display/DisplayManager;F)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/hardware/display/DisplayManager;->setTemporaryAutoBrightnessAdjustment(F)V

    return-void
.end method
