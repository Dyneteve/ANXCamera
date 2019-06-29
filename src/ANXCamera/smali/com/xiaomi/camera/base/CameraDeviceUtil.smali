.class public final Lcom/xiaomi/camera/base/CameraDeviceUtil;
.super Ljava/lang/Object;
.source "CameraDeviceUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/xiaomi/camera/base/CameraDeviceUtil;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/base/CameraDeviceUtil;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCameraCombinationMode(I)I
    .locals 1

    const/16 v0, 0x28

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    packed-switch p0, :pswitch_data_1

    packed-switch p0, :pswitch_data_2

    packed-switch p0, :pswitch_data_3

    const/4 p0, 0x0

    return p0

    :pswitch_0
    const/16 p0, 0x303

    return p0

    :pswitch_1
    const/16 p0, 0x203

    return p0

    :pswitch_2
    const/16 p0, 0x302

    return p0

    :pswitch_3
    const/16 p0, 0x202

    return p0

    :pswitch_4
    const/4 p0, 0x3

    return p0

    :pswitch_5
    const/16 p0, 0x301

    return p0

    :pswitch_6
    const/16 p0, 0x201

    return p0

    :pswitch_7
    const/4 p0, 0x2

    return p0

    :pswitch_8
    const/16 p0, 0x11

    return p0

    :pswitch_9
    const/4 p0, 0x1

    return p0

    :cond_0
    const/16 p0, 0x12

    return p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x14
        :pswitch_7
        :pswitch_4
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x3c
        :pswitch_6
        :pswitch_5
        :pswitch_3
        :pswitch_2
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x50
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getCustomCaptureResult(Landroid/hardware/camera2/CaptureResult;)Lcom/xiaomi/protocol/ICustomCaptureResult;
    .locals 4

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "getNativeCopy"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Parcelable;

    sget-object v1, Lcom/xiaomi/camera/base/CameraDeviceUtil;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getCustomCaptureResult: cameraMetadataNative ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Lcom/xiaomi/protocol/ICustomCaptureResult;

    invoke-direct {v1}, Lcom/xiaomi/protocol/ICustomCaptureResult;-><init>()V

    invoke-virtual {p0}, Landroid/hardware/camera2/CaptureResult;->getFrameNumber()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/xiaomi/protocol/ICustomCaptureResult;->setFrameNumber(J)V

    invoke-virtual {p0}, Landroid/hardware/camera2/CaptureResult;->getRequest()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/xiaomi/protocol/ICustomCaptureResult;->setRequest(Landroid/hardware/camera2/CaptureRequest;)V

    invoke-virtual {p0}, Landroid/hardware/camera2/CaptureResult;->getSequenceId()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/xiaomi/protocol/ICustomCaptureResult;->setSequenceId(I)V

    invoke-virtual {v1, v0}, Lcom/xiaomi/protocol/ICustomCaptureResult;->setResults(Landroid/os/Parcelable;)V

    sget-object v0, Landroid/hardware/camera2/CaptureResult;->SENSOR_TIMESTAMP:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/xiaomi/protocol/ICustomCaptureResult;->setTimeStamp(J)V

    :cond_0
    sget-object p0, Lcom/xiaomi/camera/base/CameraDeviceUtil;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getCustomCaptureResult: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception p0

    sget-object v0, Lcom/xiaomi/camera/base/CameraDeviceUtil;->TAG:Ljava/lang/String;

    const-string v1, "getCustomCaptureResult: getCustomCaptureResult"

    invoke-static {v0, v1, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method public static prepareCalibrationDataForAlgo(Landroid/content/Context;Ljava/lang/String;)V
    .locals 7

    const-string v0, "camera"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/CameraManager;

    :try_start_0
    invoke-virtual {v0, p1}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object p1
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1

    nop

    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    move v0, v2

    goto :goto_0

    :cond_1
    nop

    move v0, v1

    :goto_0
    :try_start_1
    const-string v3, "android.hardware.camera2.CameraCharacteristics$Key"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    aput-object v6, v5, v1

    const-class v6, Ljava/lang/Class;

    aput-object v6, v5, v2

    new-array v4, v4, [Ljava/lang/Object;

    const-string v6, "com.xiaomi.camera.algoup.dualCalibrationData"

    aput-object v6, v4, v1

    const-class v1, [B

    aput-object v1, v4, v2

    invoke-virtual {v3, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p1, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_0

    nop

    if-eqz p1, :cond_2

    invoke-static {p0, p1, v0}, Lcom/xiaomi/camera/base/CommonUtil;->saveCameraCalibrationToFile(Landroid/content/Context;[BZ)Z

    :cond_2
    return-void

    :catch_0
    move-exception p0

    sget-object p1, Lcom/xiaomi/camera/base/CameraDeviceUtil;->TAG:Ljava/lang/String;

    const-string v0, "prepareCalibrationDataForAlgo: call reflect method failed!"

    invoke-static {p1, v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance p0, Ljava/lang/RuntimeException;

    const-string p1, "getCameraCharacteristics\'s dualCalibrationData failed"

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    :catch_1
    move-exception p0

    sget-object p1, Lcom/xiaomi/camera/base/CameraDeviceUtil;->TAG:Ljava/lang/String;

    const-string v0, "prepareCalibrationDataForAlgo: get getCameraCharacteristics failed!"

    invoke-static {p1, v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method
