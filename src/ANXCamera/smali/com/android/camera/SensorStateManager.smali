.class public Lcom/android/camera/SensorStateManager;
.super Ljava/lang/Object;
.source "SensorStateManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/SensorStateManager$MainHandler;,
        Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;,
        Lcom/android/camera/SensorStateManager$SensorStateListener;
    }
.end annotation


# static fields
.field private static final ACCELEROMETER:I = 0x8

.field private static final ACCELEROMETER_GAP_TOLERANCE:D = 0.8999999761581421

.field private static final ACCELEROMETER_THRESHOLD:I = 0x10

.field private static final CAPTURE_POSTURE_DEGREE:I

.field private static final EVENT_PROCESS_INTERVAL:J = 0x5f5e100L

.field private static final EVENT_TIME_OUT:J = 0x3b9aca00L

.field private static final GAME_ROTATION:I = 0x40

.field private static final GRAVITY:I = 0x20

.field private static final GYROSCOPE:I = 0x2

.field private static final GYROSCOPE_FOCUS_THRESHOLD:D = 1.0471975511965976

.field private static final GYROSCOPE_IGNORE_THRESHOLD:D = 0.05000000074505806

.field private static final GYROSCOPE_MOVING_THRESHOLD:D

.field private static final GYROSCOPE_STABLE_THRESHOLD:D

.field public static final LEFT_CAPTURE_POSTURE:I = 0x1

.field private static final LINEAR_ACCELEROMETER:I = 0x1

.field private static final LYING_HYSTERESIS:I = 0x5

.field private static final MAX_LYING_BOUND:I = 0x99

.field private static final MIN_LYING_BOUND:I = 0x1a

.field private static final MSG_DEVICE_BECOME_STABLE:I = 0x1

.field private static final MSG_UPDATE:I = 0x2

.field private static final NS2S:F = 1.0E-9f

.field private static final ORIENTATION:I = 0x4

.field public static final ORIENTATION_UNKNOWN:I = -0x1

.field public static final PORTRAIT_CAPTURE_POSTURE:I = 0x0

.field public static final RIGHT_CAPTURE_POSTURE:I = 0x2

.field private static final ROTATION_VECTOR:I = 0x10

.field public static final SENSOR_ALL:I = 0x7f

.field private static final TAG:Ljava/lang/String; = "SensorStateManager"


# instance fields
.field private final mAccelerometerSensor:Landroid/hardware/Sensor;

.field private mAccelerometerSensorEventListenerImpl:Landroid/hardware/SensorEventListener;

.field private mAccelerometerTimeStamp:J

.field private mAngleSpeed:[D

.field private mAngleSpeedIndex:I

.field private mAngleTotal:D

.field private mCapturePosture:I

.field private mEdgeTouchEnabled:Z

.field private mFocusSensorEnabled:Z

.field private final mGameRotationSensor:Landroid/hardware/Sensor;

.field private mGameRotationSensorListener:Landroid/hardware/SensorEventListener;

.field private mGradienterEnabled:Z

.field private final mGravitySensor:Landroid/hardware/Sensor;

.field private mGravitySensorListener:Landroid/hardware/SensorEventListener;

.field private final mGyroscope:Landroid/hardware/Sensor;

.field private mGyroscopeEnabled:Z

.field private mGyroscopeListener:Landroid/hardware/SensorEventListener;

.field private mGyroscopeTimeStamp:J

.field private mHandler:Landroid/os/Handler;

.field private mIsLying:Z

.field private mLinearAccelerationListener:Landroid/hardware/SensorEventListener;

.field private final mLinearAccelerometer:Landroid/hardware/Sensor;

.field private mOrientation:F

.field private final mOrientationSensor:Landroid/hardware/Sensor;

.field private mOrientationSensorEventListener:Landroid/hardware/SensorEventListener;

.field private mRate:I

.field private mRoatationSensorListener:Landroid/hardware/SensorEventListener;

.field private mRotationFlagEnabled:Z

.field private final mRotationVecotrSensor:Landroid/hardware/Sensor;

.field private mRotationVectorFlagEnabled:Z

.field private mSensorListenerThread:Landroid/os/HandlerThread;

.field private final mSensorManager:Landroid/hardware/SensorManager;

.field private mSensorRegister:I

.field private mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

.field private mTTARFlagEnabled:Z

.field private mThreadHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-string v0, "camera_stable_threshold"

    const/16 v1, 0x9

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x41200000    # 10.0f

    div-float/2addr v0, v1

    float-to-double v2, v0

    sput-wide v2, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    const-string v0, "camera_moving_threshold"

    const/16 v2, 0xf

    invoke-static {v0, v2}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v1

    float-to-double v0, v0

    sput-wide v0, Lcom/android/camera/SensorStateManager;->GYROSCOPE_MOVING_THRESHOLD:D

    const-string v0, "capture_degree"

    const/16 v1, 0x2d

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/android/camera/SensorStateManager;->CAPTURE_POSTURE_DEGREE:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mOrientation:F

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mIsLying:Z

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mCapturePosture:I

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/android/camera/SensorStateManager;->mAngleTotal:D

    const/4 v1, 0x5

    new-array v1, v1, [D

    sget-wide v2, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    aput-wide v2, v1, v0

    sget-wide v2, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    const/4 v0, 0x1

    aput-wide v2, v1, v0

    sget-wide v2, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    const/4 v4, 0x2

    aput-wide v2, v1, v4

    sget-wide v2, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    const/4 v4, 0x3

    aput-wide v2, v1, v4

    sget-wide v2, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    const/4 v5, 0x4

    aput-wide v2, v1, v5

    iput-object v1, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeed:[D

    const/4 v1, -0x1

    iput v1, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeedIndex:I

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/android/camera/SensorStateManager;->mAccelerometerTimeStamp:J

    iput-wide v1, p0, Lcom/android/camera/SensorStateManager;->mGyroscopeTimeStamp:J

    new-instance v1, Lcom/android/camera/SensorStateManager$1;

    invoke-direct {v1, p0}, Lcom/android/camera/SensorStateManager$1;-><init>(Lcom/android/camera/SensorStateManager;)V

    iput-object v1, p0, Lcom/android/camera/SensorStateManager;->mGyroscopeListener:Landroid/hardware/SensorEventListener;

    new-instance v1, Lcom/android/camera/SensorStateManager$2;

    invoke-direct {v1, p0}, Lcom/android/camera/SensorStateManager$2;-><init>(Lcom/android/camera/SensorStateManager;)V

    iput-object v1, p0, Lcom/android/camera/SensorStateManager;->mLinearAccelerationListener:Landroid/hardware/SensorEventListener;

    new-instance v1, Lcom/android/camera/SensorStateManager$3;

    invoke-direct {v1, p0}, Lcom/android/camera/SensorStateManager$3;-><init>(Lcom/android/camera/SensorStateManager;)V

    iput-object v1, p0, Lcom/android/camera/SensorStateManager;->mAccelerometerSensorEventListenerImpl:Landroid/hardware/SensorEventListener;

    new-instance v1, Lcom/android/camera/SensorStateManager$4;

    invoke-direct {v1, p0}, Lcom/android/camera/SensorStateManager$4;-><init>(Lcom/android/camera/SensorStateManager;)V

    iput-object v1, p0, Lcom/android/camera/SensorStateManager;->mRoatationSensorListener:Landroid/hardware/SensorEventListener;

    new-instance v1, Lcom/android/camera/SensorStateManager$5;

    invoke-direct {v1, p0}, Lcom/android/camera/SensorStateManager$5;-><init>(Lcom/android/camera/SensorStateManager;)V

    iput-object v1, p0, Lcom/android/camera/SensorStateManager;->mGravitySensorListener:Landroid/hardware/SensorEventListener;

    new-instance v1, Lcom/android/camera/SensorStateManager$6;

    invoke-direct {v1, p0}, Lcom/android/camera/SensorStateManager$6;-><init>(Lcom/android/camera/SensorStateManager;)V

    iput-object v1, p0, Lcom/android/camera/SensorStateManager;->mGameRotationSensorListener:Landroid/hardware/SensorEventListener;

    const-string v1, "sensor"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/SensorManager;

    iput-object p1, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object p1, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    const/16 v1, 0xa

    invoke-virtual {p1, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/SensorStateManager;->mLinearAccelerometer:Landroid/hardware/Sensor;

    iget-object p1, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {p1, v5}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/SensorStateManager;->mGyroscope:Landroid/hardware/Sensor;

    iget-object p1, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {p1, v4}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/SensorStateManager;->mOrientationSensor:Landroid/hardware/Sensor;

    iget-object p1, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {p1, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/SensorStateManager;->mAccelerometerSensor:Landroid/hardware/Sensor;

    iget-object p1, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    const/16 v0, 0xb

    invoke-virtual {p1, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/SensorStateManager;->mRotationVecotrSensor:Landroid/hardware/Sensor;

    iget-object p1, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    const/16 v0, 0x9

    invoke-virtual {p1, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/SensorStateManager;->mGravitySensor:Landroid/hardware/Sensor;

    iget-object p1, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    const/16 v0, 0xf

    invoke-virtual {p1, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/SensorStateManager;->mGameRotationSensor:Landroid/hardware/Sensor;

    new-instance p1, Lcom/android/camera/SensorStateManager$MainHandler;

    invoke-direct {p1, p0, p2}, Lcom/android/camera/SensorStateManager$MainHandler;-><init>(Lcom/android/camera/SensorStateManager;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/android/camera/SensorStateManager;->mHandler:Landroid/os/Handler;

    const/16 p1, 0x7530

    iput p1, p0, Lcom/android/camera/SensorStateManager;->mRate:I

    invoke-virtual {p0}, Lcom/android/camera/SensorStateManager;->canDetectOrientation()Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;

    invoke-direct {p1, p0}, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;-><init>(Lcom/android/camera/SensorStateManager;)V

    iput-object p1, p0, Lcom/android/camera/SensorStateManager;->mOrientationSensorEventListener:Landroid/hardware/SensorEventListener;

    :cond_0
    new-instance p1, Landroid/os/HandlerThread;

    const-string p2, "SensorListenerThread"

    invoke-direct {p1, p2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/android/camera/SensorStateManager;->mSensorListenerThread:Landroid/os/HandlerThread;

    iget-object p1, p0, Lcom/android/camera/SensorStateManager;->mSensorListenerThread:Landroid/os/HandlerThread;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->start()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/SensorStateManager;)Lcom/android/camera/SensorStateManager$SensorStateListener;
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/SensorStateManager;->getSensorStateListener()Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/SensorStateManager;)J
    .locals 2

    iget-wide v0, p0, Lcom/android/camera/SensorStateManager;->mGyroscopeTimeStamp:J

    return-wide v0
.end method

.method static synthetic access$1000()I
    .locals 1

    sget v0, Lcom/android/camera/SensorStateManager;->CAPTURE_POSTURE_DEGREE:I

    return v0
.end method

.method static synthetic access$102(Lcom/android/camera/SensorStateManager;J)J
    .locals 0

    iput-wide p1, p0, Lcom/android/camera/SensorStateManager;->mGyroscopeTimeStamp:J

    return-wide p1
.end method

.method static synthetic access$1100(Lcom/android/camera/SensorStateManager;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/SensorStateManager;->changeCapturePosture(I)V

    return-void
.end method

.method static synthetic access$1200(Lcom/android/camera/SensorStateManager;)F
    .locals 0

    iget p0, p0, Lcom/android/camera/SensorStateManager;->mOrientation:F

    return p0
.end method

.method static synthetic access$1202(Lcom/android/camera/SensorStateManager;F)F
    .locals 0

    iput p1, p0, Lcom/android/camera/SensorStateManager;->mOrientation:F

    return p1
.end method

.method static synthetic access$1300(Lcom/android/camera/SensorStateManager;F)F
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/SensorStateManager;->normalizeDegree(F)F

    move-result p0

    return p0
.end method

.method static synthetic access$1400(Lcom/android/camera/SensorStateManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/SensorStateManager;->deviceBecomeStable()V

    return-void
.end method

.method static synthetic access$1500(Lcom/android/camera/SensorStateManager;IZ)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/SensorStateManager;->update(IZ)V

    return-void
.end method

.method static synthetic access$200()D
    .locals 2

    sget-wide v0, Lcom/android/camera/SensorStateManager;->GYROSCOPE_MOVING_THRESHOLD:D

    return-wide v0
.end method

.method static synthetic access$300(Lcom/android/camera/SensorStateManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/SensorStateManager;->deviceBeginMoving()V

    return-void
.end method

.method static synthetic access$400(Lcom/android/camera/SensorStateManager;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeedIndex:I

    return p0
.end method

.method static synthetic access$402(Lcom/android/camera/SensorStateManager;I)I
    .locals 0

    iput p1, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeedIndex:I

    return p1
.end method

.method static synthetic access$404(Lcom/android/camera/SensorStateManager;)I
    .locals 1

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeedIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeedIndex:I

    return v0
.end method

.method static synthetic access$500(Lcom/android/camera/SensorStateManager;)[D
    .locals 0

    iget-object p0, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeed:[D

    return-object p0
.end method

.method static synthetic access$600(Lcom/android/camera/SensorStateManager;)D
    .locals 2

    iget-wide v0, p0, Lcom/android/camera/SensorStateManager;->mAngleTotal:D

    return-wide v0
.end method

.method static synthetic access$602(Lcom/android/camera/SensorStateManager;D)D
    .locals 0

    iput-wide p1, p0, Lcom/android/camera/SensorStateManager;->mAngleTotal:D

    return-wide p1
.end method

.method static synthetic access$618(Lcom/android/camera/SensorStateManager;D)D
    .locals 2

    iget-wide v0, p0, Lcom/android/camera/SensorStateManager;->mAngleTotal:D

    add-double/2addr v0, p1

    iput-wide v0, p0, Lcom/android/camera/SensorStateManager;->mAngleTotal:D

    return-wide v0
.end method

.method static synthetic access$700(Lcom/android/camera/SensorStateManager;D)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/SensorStateManager;->deviceKeepMoving(D)V

    return-void
.end method

.method static synthetic access$800(Lcom/android/camera/SensorStateManager;)J
    .locals 2

    iget-wide v0, p0, Lcom/android/camera/SensorStateManager;->mAccelerometerTimeStamp:J

    return-wide v0
.end method

.method static synthetic access$802(Lcom/android/camera/SensorStateManager;J)J
    .locals 0

    iput-wide p1, p0, Lcom/android/camera/SensorStateManager;->mAccelerometerTimeStamp:J

    return-wide p1
.end method

.method static synthetic access$900(Lcom/android/camera/SensorStateManager;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/SensorStateManager;->mIsLying:Z

    return p0
.end method

.method static synthetic access$902(Lcom/android/camera/SensorStateManager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/SensorStateManager;->mIsLying:Z

    return p1
.end method

.method private changeCapturePosture(I)V
    .locals 1

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mCapturePosture:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/android/camera/SensorStateManager;->mCapturePosture:I

    invoke-direct {p0}, Lcom/android/camera/SensorStateManager;->getSensorStateListener()Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/android/camera/SensorStateManager$SensorStateListener;->notifyDevicePostureChanged()V

    :cond_0
    return-void
.end method

.method private deviceBecomeStable()V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/SensorStateManager;->getSensorStateListener()Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/SensorStateManager$SensorStateListener;->onDeviceBecomeStable()V

    :cond_0
    return-void
.end method

.method private deviceBeginMoving()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/SensorStateManager;->getSensorStateListener()Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/SensorStateManager$SensorStateListener;->onDeviceBeginMoving()V

    :cond_0
    return-void
.end method

.method private deviceKeepMoving(D)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/SensorStateManager;->getSensorStateListener()Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2}, Lcom/android/camera/SensorStateManager$SensorStateListener;->onDeviceKeepMoving(D)V

    :cond_0
    return-void
.end method

.method private deviceKeepStable()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/SensorStateManager;->getSensorStateListener()Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/SensorStateManager$SensorStateListener;->onDeviceKeepStable()V

    :cond_0
    return-void
.end method

.method private filterUnregisterSensor(I)I
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mEdgeTouchEnabled:Z

    if-eqz v0, :cond_0

    and-int/lit8 p1, p1, -0x3

    and-int/lit8 p1, p1, -0x5

    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mRotationFlagEnabled:Z

    if-eqz v0, :cond_1

    and-int/lit8 p1, p1, -0x5

    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    if-eqz v0, :cond_2

    and-int/lit8 p1, p1, -0x2

    and-int/lit8 p1, p1, -0x3

    :cond_2
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mGradienterEnabled:Z

    if-eqz v0, :cond_3

    and-int/lit8 p1, p1, -0x9

    and-int/lit8 p1, p1, -0x5

    :cond_3
    return p1
.end method

.method private declared-synchronized getSensorStateListener()Lcom/android/camera/SensorStateManager$SensorStateListener;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private isContains(II)Z
    .locals 0

    and-int/2addr p1, p2

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isPartialContains(II)Z
    .locals 0

    and-int/2addr p1, p2

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private normalizeDegree(F)F
    .locals 2

    :goto_0
    const/high16 v0, 0x43b40000    # 360.0f

    cmpl-float v1, p1, v0

    if-ltz v1, :cond_0

    sub-float/2addr p1, v0

    goto :goto_0

    :cond_0
    :goto_1
    const/4 v1, 0x0

    cmpg-float v1, p1, v1

    if-gez v1, :cond_1

    add-float/2addr p1, v0

    goto :goto_1

    :cond_1
    return p1
.end method

.method private update(IZ)V
    .locals 1

    if-nez p2, :cond_0

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v0, p1}, Lcom/android/camera/SensorStateManager;->isPartialContains(II)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/camera/SensorStateManager;->unregister(I)V

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    iget p2, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, p2, p1}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result p2

    if-nez p2, :cond_1

    invoke-virtual {p0, p1}, Lcom/android/camera/SensorStateManager;->register(I)V

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public canDetectOrientation()Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mOrientationSensor:Landroid/hardware/Sensor;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getCapturePosture()I
    .locals 1

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mCapturePosture:I

    return v0
.end method

.method public isDeviceLying()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mIsLying:Z

    return v0
.end method

.method public isStable()Z
    .locals 10

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeedIndex:I

    const/4 v1, 0x1

    if-ltz v0, :cond_2

    const-wide/16 v2, 0x0

    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeed:[D

    array-length v4, v0

    const/4 v5, 0x0

    move-wide v6, v2

    move v2, v5

    :goto_0
    if-ge v2, v4, :cond_0

    aget-wide v8, v0, v2

    add-double/2addr v6, v8

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeed:[D

    array-length v0, v0

    int-to-double v2, v0

    div-double/2addr v6, v2

    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeed:[D

    iget v2, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeedIndex:I

    iget-object v3, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeed:[D

    array-length v3, v3

    sub-int/2addr v3, v1

    invoke-static {v2, v5, v3}, Lcom/android/camera/Util;->clamp(III)I

    move-result v2

    aget-wide v2, v0, v2

    const-string v0, "SensorStateManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "isStable mAngleSpeed="

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v8, " lastSpeed="

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v8, " threshold="

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-wide v8, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    invoke-virtual {v4, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    sget-wide v8, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    cmpg-double v0, v6, v8

    if-gtz v0, :cond_1

    sget-wide v6, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    cmpg-double v0, v2, v6

    if-gtz v0, :cond_1

    goto :goto_1

    :cond_1
    move v1, v5

    :goto_1
    return v1

    :cond_2
    const-string v0, "SensorStateManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isStable return true for mAngleSpeedIndex="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeedIndex:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " threshold="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-wide v3, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return v1
.end method

.method public onDestroy()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorListenerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    return-void
.end method

.method public register()V
    .locals 2

    nop

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-boolean v1, p0, Lcom/android/camera/SensorStateManager;->mEdgeTouchEnabled:Z

    if-eqz v1, :cond_1

    or-int/lit8 v0, v0, 0x2

    or-int/lit8 v0, v0, 0x4

    :cond_1
    iget-boolean v1, p0, Lcom/android/camera/SensorStateManager;->mGradienterEnabled:Z

    if-eqz v1, :cond_2

    or-int/lit8 v0, v0, 0x8

    or-int/lit8 v0, v0, 0x4

    :cond_2
    iget-boolean v1, p0, Lcom/android/camera/SensorStateManager;->mRotationFlagEnabled:Z

    if-eqz v1, :cond_3

    or-int/lit8 v0, v0, 0x4

    :cond_3
    iget-boolean v1, p0, Lcom/android/camera/SensorStateManager;->mRotationVectorFlagEnabled:Z

    if-eqz v1, :cond_4

    or-int/lit8 v0, v0, 0x10

    :cond_4
    iget-boolean v1, p0, Lcom/android/camera/SensorStateManager;->mTTARFlagEnabled:Z

    if-eqz v1, :cond_5

    or-int/lit8 v0, v0, 0x8

    or-int/lit8 v0, v0, 0x2

    or-int/lit8 v0, v0, 0x40

    or-int/lit8 v0, v0, 0x20

    :cond_5
    iget-boolean v1, p0, Lcom/android/camera/SensorStateManager;->mGyroscopeEnabled:Z

    if-eqz v1, :cond_6

    or-int/lit8 v0, v0, 0x2

    :cond_6
    invoke-virtual {p0, v0}, Lcom/android/camera/SensorStateManager;->register(I)V

    return-void
.end method

.method public register(I)V
    .locals 6

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v0, p1}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mThreadHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    const/16 v0, 0xc

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->isPartialContains(II)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mSensorListenerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/SensorStateManager;->mThreadHandler:Landroid/os/Handler;

    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    const/4 v1, 0x2

    if-eqz v0, :cond_1

    or-int/lit8 p1, p1, 0x1

    or-int/2addr p1, v1

    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    :cond_1
    invoke-direct {p0, p1, v1}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v0, v1}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lcom/android/camera/SensorStateManager;->mGyroscopeListener:Landroid/hardware/SensorEventListener;

    iget-object v3, p0, Lcom/android/camera/SensorStateManager;->mGyroscope:Landroid/hardware/Sensor;

    invoke-virtual {v0, v2, v3, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    or-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    :cond_2
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v2

    if-eqz v2, :cond_3

    iget v2, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v2, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v2

    if-nez v2, :cond_3

    iget-object v2, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v3, p0, Lcom/android/camera/SensorStateManager;->mLinearAccelerationListener:Landroid/hardware/SensorEventListener;

    iget-object v4, p0, Lcom/android/camera/SensorStateManager;->mLinearAccelerometer:Landroid/hardware/Sensor;

    invoke-virtual {v2, v3, v4, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    iget v1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    or-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/SensorStateManager;->canDetectOrientation()Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x4

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v1

    if-eqz v1, :cond_4

    iget v1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mSensorListenerThread:Landroid/os/HandlerThread;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mSensorListenerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lcom/android/camera/SensorStateManager;->mOrientationSensorEventListener:Landroid/hardware/SensorEventListener;

    iget-object v3, p0, Lcom/android/camera/SensorStateManager;->mOrientationSensor:Landroid/hardware/Sensor;

    iget v4, p0, Lcom/android/camera/SensorStateManager;->mRate:I

    iget-object v5, p0, Lcom/android/camera/SensorStateManager;->mThreadHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    iget v1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    or-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    :cond_4
    const/16 v0, 0x8

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v1

    if-eqz v1, :cond_5

    iget v1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v1

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mSensorListenerThread:Landroid/os/HandlerThread;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mSensorListenerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lcom/android/camera/SensorStateManager;->mAccelerometerSensorEventListenerImpl:Landroid/hardware/SensorEventListener;

    iget-object v3, p0, Lcom/android/camera/SensorStateManager;->mAccelerometerSensor:Landroid/hardware/Sensor;

    iget v4, p0, Lcom/android/camera/SensorStateManager;->mRate:I

    iget-object v5, p0, Lcom/android/camera/SensorStateManager;->mThreadHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    iget v1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    or-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    :cond_5
    const/16 v0, 0x10

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v1

    if-eqz v1, :cond_6

    iget v1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v1

    if-nez v1, :cond_6

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mSensorListenerThread:Landroid/os/HandlerThread;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mSensorListenerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lcom/android/camera/SensorStateManager;->mRoatationSensorListener:Landroid/hardware/SensorEventListener;

    iget-object v3, p0, Lcom/android/camera/SensorStateManager;->mRotationVecotrSensor:Landroid/hardware/Sensor;

    iget v4, p0, Lcom/android/camera/SensorStateManager;->mRate:I

    iget-object v5, p0, Lcom/android/camera/SensorStateManager;->mThreadHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    iget v1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    or-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    :cond_6
    const/16 v0, 0x20

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v1

    if-eqz v1, :cond_7

    iget v1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v1

    if-nez v1, :cond_7

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mSensorListenerThread:Landroid/os/HandlerThread;

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mSensorListenerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lcom/android/camera/SensorStateManager;->mGravitySensorListener:Landroid/hardware/SensorEventListener;

    iget-object v3, p0, Lcom/android/camera/SensorStateManager;->mGravitySensor:Landroid/hardware/Sensor;

    iget v4, p0, Lcom/android/camera/SensorStateManager;->mRate:I

    iget-object v5, p0, Lcom/android/camera/SensorStateManager;->mThreadHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    iget v1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    or-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    :cond_7
    const/16 v0, 0x40

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result p1

    if-eqz p1, :cond_8

    iget p1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result p1

    if-nez p1, :cond_8

    iget-object p1, p0, Lcom/android/camera/SensorStateManager;->mSensorListenerThread:Landroid/os/HandlerThread;

    if-eqz p1, :cond_8

    iget-object p1, p0, Lcom/android/camera/SensorStateManager;->mSensorListenerThread:Landroid/os/HandlerThread;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->isAlive()Z

    move-result p1

    if-eqz p1, :cond_8

    iget-object p1, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mGameRotationSensorListener:Landroid/hardware/SensorEventListener;

    iget-object v2, p0, Lcom/android/camera/SensorStateManager;->mGameRotationSensor:Landroid/hardware/Sensor;

    iget v3, p0, Lcom/android/camera/SensorStateManager;->mRate:I

    iget-object v4, p0, Lcom/android/camera/SensorStateManager;->mThreadHandler:Landroid/os/Handler;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    iget p1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    or-int/2addr p1, v0

    iput p1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    :cond_8
    return-void
.end method

.method public reset()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/SensorStateManager;->mAngleTotal:D

    return-void
.end method

.method public setEdgeTouchEnabled(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mEdgeTouchEnabled:Z

    if-eq v0, p1, :cond_2

    iput-boolean p1, p0, Lcom/android/camera/SensorStateManager;->mEdgeTouchEnabled:Z

    const/4 p1, 0x6

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mEdgeTouchEnabled:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mGradienterEnabled:Z

    if-eqz v0, :cond_0

    const/4 p1, 0x2

    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    if-eqz v0, :cond_1

    and-int/lit8 p1, p1, -0x3

    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mEdgeTouchEnabled:Z

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->update(IZ)V

    :cond_2
    return-void
.end method

.method public setFocusSensorEnabled(Z)V
    .locals 4

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    if-eq v0, p1, :cond_1

    iput-boolean p1, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    const/4 v0, 0x3

    iget-boolean v2, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    if-nez v2, :cond_0

    invoke-direct {p0, v0}, Lcom/android/camera/SensorStateManager;->filterUnregisterSensor(I)I

    move-result v0

    :cond_0
    iget-object v2, p0, Lcom/android/camera/SensorStateManager;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/android/camera/SensorStateManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v1, v0, p1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    const-wide/16 v0, 0x3e8

    invoke-virtual {v2, p1, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    :cond_1
    return-void
.end method

.method public setGradienterEnabled(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mGradienterEnabled:Z

    if-eq v0, p1, :cond_1

    iput-boolean p1, p0, Lcom/android/camera/SensorStateManager;->mGradienterEnabled:Z

    const/16 p1, 0xc

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mGradienterEnabled:Z

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/android/camera/SensorStateManager;->filterUnregisterSensor(I)I

    move-result p1

    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mGradienterEnabled:Z

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->update(IZ)V

    :cond_1
    return-void
.end method

.method public setGyroscopeEnabled(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mGyroscopeEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera/SensorStateManager;->mGyroscopeEnabled:Z

    const/4 p1, 0x2

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mGyroscopeEnabled:Z

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->update(IZ)V

    :cond_0
    return-void
.end method

.method public setRotationIndicatorEnabled(Z)V
    .locals 1

    invoke-static {}, Lcom/mi/config/b;->hZ()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/SensorStateManager;->canDetectOrientation()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mRotationFlagEnabled:Z

    if-eq v0, p1, :cond_1

    iput-boolean p1, p0, Lcom/android/camera/SensorStateManager;->mRotationFlagEnabled:Z

    const/4 p1, 0x4

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mRotationFlagEnabled:Z

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/android/camera/SensorStateManager;->filterUnregisterSensor(I)I

    move-result p1

    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mRotationFlagEnabled:Z

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->update(IZ)V

    :cond_1
    return-void
.end method

.method public setRotationVectorEnabled(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mRotationVectorFlagEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera/SensorStateManager;->mRotationVectorFlagEnabled:Z

    const/16 p1, 0x10

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mRotationVectorFlagEnabled:Z

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->update(IZ)V

    :cond_0
    return-void
.end method

.method public declared-synchronized setSensorStateListener(Lcom/android/camera/SensorStateManager$SensorStateListener;)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/android/camera/SensorStateManager;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setTTARSensorEnabled(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mTTARFlagEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/camera/SensorStateManager;->mTTARFlagEnabled:Z

    const/16 p1, 0x6a

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mTTARFlagEnabled:Z

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->update(IZ)V

    :cond_0
    return-void
.end method

.method public unregister(I)V
    .locals 2

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    if-eqz v0, :cond_9

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    const/4 v1, 0x2

    if-eqz v0, :cond_0

    const/16 v0, 0x7f

    if-ne p1, v0, :cond_2

    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_1

    or-int/lit8 p1, p1, 0x1

    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mEdgeTouchEnabled:Z

    if-nez v0, :cond_1

    or-int/lit8 p1, p1, 0x2

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/SensorStateManager;->reset()V

    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    :cond_2
    invoke-direct {p0, p1, v1}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v0, v1}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mGyroscopeListener:Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    :cond_3
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v1

    if-eqz v1, :cond_4

    iget v1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mLinearAccelerationListener:Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    :cond_4
    const/4 v0, 0x4

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v1

    if-eqz v1, :cond_5

    iget v1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mOrientationSensorEventListener:Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mIsLying:Z

    invoke-direct {p0, v0}, Lcom/android/camera/SensorStateManager;->changeCapturePosture(I)V

    :cond_5
    const/16 v0, 0x8

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v1

    if-eqz v1, :cond_6

    iget v1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mAccelerometerSensorEventListenerImpl:Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    :cond_6
    const/16 v0, 0x10

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v1

    if-eqz v1, :cond_7

    iget v1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mRoatationSensorListener:Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    :cond_7
    const/16 v0, 0x20

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v1

    if-eqz v1, :cond_8

    iget v1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mGravitySensorListener:Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    and-int/lit8 v0, v0, -0x21

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    :cond_8
    const/16 v0, 0x40

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result p1

    if-eqz p1, :cond_9

    iget p1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result p1

    if-eqz p1, :cond_9

    iget-object p1, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mGameRotationSensorListener:Landroid/hardware/SensorEventListener;

    invoke-virtual {p1, v0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    iget p1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    and-int/lit8 p1, p1, -0x41

    iput p1, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    :cond_9
    return-void
.end method
