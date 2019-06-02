.class public Lcom/android/camera/module/Panorama3Module;
.super Lcom/android/camera/module/BaseModule;
.source "Panorama3Module.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;
.implements Lcom/android/camera/protocol/ModeProtocol$CameraAction;
.implements Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/Panorama3Module$PanoramaPreview;,
        Lcom/android/camera/module/Panorama3Module$DecideDirection;,
        Lcom/android/camera/module/Panorama3Module$PanoramaFirst;,
        Lcom/android/camera/module/Panorama3Module$PanoramaInit;,
        Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;,
        Lcom/android/camera/module/Panorama3Module$MainHandler;
    }
.end annotation


# static fields
.field public static final DUMP_YUV:Z

.field private static final MIN_SHOOTING_TIME:I = 0x258

.field private static final PREVIEW_SKIP_COUNT:I = 0x1

.field private static final TAG:Ljava/lang/String;

.field public static final mEngineLock:Ljava/lang/Object;

.field private static final mPreviewImageLock:Ljava/lang/Object;

.field private static final sAttachExit:Lcom/android/camera/panorama/CaptureImage;


# instance fields
.field private mAccelerometer:Landroid/hardware/Sensor;

.field private final mAttachImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Lcom/android/camera/panorama/CaptureImage;",
            ">;"
        }
    .end annotation
.end field

.field private mAttachPosOffsetX:I

.field private mAttachPosOffsetY:I

.field private mCameraOrientation:I

.field private volatile mCanSavePanorama:Z

.field private mCaptureOrientationDecided:Z

.field private mCurrentSensorInfoManager:Lcom/android/camera/panorama/SensorInfoManager;

.field private final mDeviceLock:Ljava/lang/Object;

.field private mDeviceOrientationAtCapture:I

.field private mDirection:I

.field private mDirectionFunction:Lcom/android/camera/panorama/DirectionFunction;

.field private mDispPreviewImage:Landroid/graphics/Bitmap;

.field private mDispPreviewImageCanvas:Landroid/graphics/Canvas;

.field private mDispPreviewImagePaint:Landroid/graphics/Paint;

.field private final mExecutor:Ljava/util/concurrent/ExecutorService;

.field private mGoalAngle:I

.field private mGravities:[F

.field private mGyroscope:Landroid/hardware/Sensor;

.field private mGyroscopeUncalibrated:Landroid/hardware/Sensor;

.field private mImageFormat:Ljava/lang/String;

.field private mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

.field private volatile mIsRegisterGravitySensor:Z

.field private mIsSensorAverage:Z

.field private volatile mIsShooting:Z

.field private mLocation:Landroid/location/Location;

.field private mLongSideCropRatio:F

.field private mMagnetic:Landroid/hardware/Sensor;

.field private mMaxHeight:I

.field private mMaxWidth:I

.field private mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

.field private mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

.field private mPanoramaShootingStartTime:J

.field private mPanoramaState:Lcom/android/camera/panorama/PanoramaState;

.field private mPictureHeight:I

.field private mPictureWidth:I

.field private mPreviewImage:Landroid/graphics/Bitmap;

.field private mPreviewRefY:I

.field private volatile mRequestStop:Z

.field private mRotationVector:Landroid/hardware/Sensor;

.field private mRoundDetector:Lcom/android/camera/panorama/RoundDetector;

.field private mSaveOutputImageTask:Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;

.field private mSensorCnt:I

.field private mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

.field private mSensorFusionMode:I

.field private mSensorInfoManagerList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/panorama/SensorInfoManager;",
            ">;"
        }
    .end annotation
.end field

.field private mSensorManager:Landroid/hardware/SensorManager;

.field private mSensorThread:Landroid/os/HandlerThread;

.field private mShutterEndTime:Ljava/lang/String;

.field private mShutterStartTime:Ljava/lang/String;

.field private mSmallPreviewHeight:I

.field private mSnapshotFocusMode:I

.field private mTargetFocusMode:I

.field private mTimeTaken:J

.field private mViewAngleH:F

.field private mViewAngleV:F


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-class v0, Lcom/android/camera/module/Panorama3Module;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v0, "camera.debug.panorama"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/module/Panorama3Module;->DUMP_YUV:Z

    new-instance v0, Lcom/android/camera/panorama/Camera1Image;

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1, v1}, Lcom/android/camera/panorama/Camera1Image;-><init>([BII)V

    sput-object v0, Lcom/android/camera/module/Panorama3Module;->sAttachExit:Lcom/android/camera/panorama/CaptureImage;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/camera/module/Panorama3Module;->mEngineLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/camera/module/Panorama3Module;->mPreviewImageLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 11

    invoke-direct {p0}, Lcom/android/camera/module/BaseModule;-><init>()V

    const/16 v0, 0x118

    iput v0, p0, Lcom/android/camera/module/Panorama3Module;->mGoalAngle:I

    const v0, 0x3f6068dc    # 0.8766f

    iput v0, p0, Lcom/android/camera/module/Panorama3Module;->mLongSideCropRatio:F

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mCaptureOrientationDecided:Z

    const/4 v1, 0x4

    iput v1, p0, Lcom/android/camera/module/Panorama3Module;->mTargetFocusMode:I

    const/4 v1, 0x1

    iput v1, p0, Lcom/android/camera/module/Panorama3Module;->mSnapshotFocusMode:I

    new-instance v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    invoke-direct {v1}, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;-><init>()V

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mDeviceLock:Ljava/lang/Object;

    const-string v1, "YVU420_SEMIPLANAR"

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mImageFormat:Ljava/lang/String;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mGyroscope:Landroid/hardware/Sensor;

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mGyroscopeUncalibrated:Landroid/hardware/Sensor;

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mAccelerometer:Landroid/hardware/Sensor;

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mRotationVector:Landroid/hardware/Sensor;

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorThread:Landroid/os/HandlerThread;

    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsRegisterGravitySensor:Z

    const v1, 0x428e7684

    iput v1, p0, Lcom/android/camera/module/Panorama3Module;->mViewAngleH:F

    const v1, 0x4261fa7e

    iput v1, p0, Lcom/android/camera/module/Panorama3Module;->mViewAngleV:F

    iput v0, p0, Lcom/android/camera/module/Panorama3Module;->mCameraOrientation:I

    new-instance v1, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mAttachImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v8, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v8}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    new-instance v9, Lcom/android/camera/module/Panorama3Module$1;

    invoke-direct {v9, p0}, Lcom/android/camera/module/Panorama3Module$1;-><init>(Lcom/android/camera/module/Panorama3Module;)V

    new-instance v10, Lcom/android/camera/module/Panorama3Module$2;

    invoke-direct {v10, p0}, Lcom/android/camera/module/Panorama3Module$2;-><init>(Lcom/android/camera/module/Panorama3Module;)V

    const/4 v3, 0x1

    const/4 v4, 0x1

    const-wide/16 v5, 0x0

    move-object v2, v1

    invoke-direct/range {v2 .. v10}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mExecutor:Ljava/util/concurrent/ExecutorService;

    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mCanSavePanorama:Z

    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mRequestStop:Z

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->registerGravitySensorListener()V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/camera/module/Panorama3Module;I)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/module/Panorama3Module;->calibrateRotation(I)I

    move-result p0

    return p0
.end method

.method static synthetic access$1100(Lcom/android/camera/module/Panorama3Module;Ljava/lang/String;Ljava/lang/String;III)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/android/camera/module/Panorama3Module;->addImageAsApplication(Ljava/lang/String;Ljava/lang/String;III)V

    return-void
.end method

.method static synthetic access$1200(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->finishEngine()V

    return-void
.end method

.method static synthetic access$1302(Lcom/android/camera/module/Panorama3Module;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    return p1
.end method

.method static synthetic access$1400(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mDispPreviewImage:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$1402(Lcom/android/camera/module/Panorama3Module;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mDispPreviewImage:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic access$1500(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->onSaveFinish()V

    return-void
.end method

.method static synthetic access$1600(Lcom/android/camera/module/Panorama3Module;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mImageFormat:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1602(Lcom/android/camera/module/Panorama3Module;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mImageFormat:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1700(Lcom/android/camera/module/Panorama3Module;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/module/Panorama3Module;->mRequestStop:Z

    return p0
.end method

.method static synthetic access$1800(Lcom/android/camera/module/Panorama3Module;)Z
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->createEngine()Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->initPreviewLayout()V

    return-void
.end method

.method static synthetic access$2000(Lcom/android/camera/module/Panorama3Module;)Z
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->configMorphoPanoramaGP3()Z

    move-result p0

    return p0
.end method

.method static synthetic access$2100(Lcom/android/camera/module/Panorama3Module;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mPictureWidth:I

    return p0
.end method

.method static synthetic access$2200(Lcom/android/camera/module/Panorama3Module;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mPictureHeight:I

    return p0
.end method

.method static synthetic access$2400(Lcom/android/camera/module/Panorama3Module;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mMaxHeight:I

    return p0
.end method

.method static synthetic access$2402(Lcom/android/camera/module/Panorama3Module;I)I
    .locals 0

    iput p1, p0, Lcom/android/camera/module/Panorama3Module;->mMaxHeight:I

    return p1
.end method

.method static synthetic access$2500(Lcom/android/camera/module/Panorama3Module;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mSmallPreviewHeight:I

    return p0
.end method

.method static synthetic access$2600(Lcom/android/camera/module/Panorama3Module;)F
    .locals 0

    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mLongSideCropRatio:F

    return p0
.end method

.method static synthetic access$2700(Lcom/android/camera/module/Panorama3Module;)Ljava/util/concurrent/LinkedBlockingQueue;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mAttachImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    return-object p0
.end method

.method static synthetic access$2800()Lcom/android/camera/panorama/CaptureImage;
    .locals 1

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->sAttachExit:Lcom/android/camera/panorama/CaptureImage;

    return-object v0
.end method

.method static synthetic access$2900(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->setInitialRotationByGravity()V

    return-void
.end method

.method static synthetic access$3002(Lcom/android/camera/module/Panorama3Module;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/Panorama3Module;->mIsSensorAverage:Z

    return p1
.end method

.method static synthetic access$3100(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/CaptureImage;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/module/Panorama3Module;->setSensorFusionValue(Lcom/android/camera/panorama/CaptureImage;)V

    return-void
.end method

.method static synthetic access$3200(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/SensorInfoManager;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mCurrentSensorInfoManager:Lcom/android/camera/panorama/SensorInfoManager;

    return-object p0
.end method

.method static synthetic access$3300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    return-object p0
.end method

.method static synthetic access$3400(Lcom/android/camera/module/Panorama3Module;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mMaxWidth:I

    return p0
.end method

.method static synthetic access$3402(Lcom/android/camera/module/Panorama3Module;I)I
    .locals 0

    iput p1, p0, Lcom/android/camera/module/Panorama3Module;->mMaxWidth:I

    return p1
.end method

.method static synthetic access$3500(Lcom/android/camera/module/Panorama3Module;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mDirection:I

    return p0
.end method

.method static synthetic access$3502(Lcom/android/camera/module/Panorama3Module;I)I
    .locals 0

    iput p1, p0, Lcom/android/camera/module/Panorama3Module;->mDirection:I

    return p1
.end method

.method static synthetic access$3600(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/DirectionFunction;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mDirectionFunction:Lcom/android/camera/panorama/DirectionFunction;

    return-object p0
.end method

.method static synthetic access$3602(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/DirectionFunction;)Lcom/android/camera/panorama/DirectionFunction;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mDirectionFunction:Lcom/android/camera/panorama/DirectionFunction;

    return-object p1
.end method

.method static synthetic access$3800(Lcom/android/camera/module/Panorama3Module;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mCameraOrientation:I

    return p0
.end method

.method static synthetic access$3900(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->unregisterGravitySensorListener()V

    return-void
.end method

.method static synthetic access$400(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/PanoramaState;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaState:Lcom/android/camera/panorama/PanoramaState;

    return-object p0
.end method

.method static synthetic access$4000(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/CaptureImage;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/module/Panorama3Module;->addAttachQueue(Lcom/android/camera/panorama/CaptureImage;)V

    return-void
.end method

.method static synthetic access$402(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/PanoramaState;)Lcom/android/camera/panorama/PanoramaState;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaState:Lcom/android/camera/panorama/PanoramaState;

    return-object p1
.end method

.method static synthetic access$4200(Lcom/android/camera/module/Panorama3Module;)Ljava/util/concurrent/ExecutorService;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mExecutor:Ljava/util/concurrent/ExecutorService;

    return-object p0
.end method

.method static synthetic access$4400(Lcom/android/camera/module/Panorama3Module;)F
    .locals 0

    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mViewAngleH:F

    return p0
.end method

.method static synthetic access$4500(Lcom/android/camera/module/Panorama3Module;)F
    .locals 0

    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mViewAngleV:F

    return p0
.end method

.method static synthetic access$4600()Ljava/lang/Object;
    .locals 1

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->mPreviewImageLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$4700(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewImage:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$4702(Lcom/android/camera/module/Panorama3Module;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewImage:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic access$4800(Lcom/android/camera/module/Panorama3Module;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mAttachPosOffsetY:I

    return p0
.end method

.method static synthetic access$4802(Lcom/android/camera/module/Panorama3Module;I)I
    .locals 0

    iput p1, p0, Lcom/android/camera/module/Panorama3Module;->mAttachPosOffsetY:I

    return p1
.end method

.method static synthetic access$4900(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Canvas;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mDispPreviewImageCanvas:Landroid/graphics/Canvas;

    return-object p0
.end method

.method static synthetic access$4902(Lcom/android/camera/module/Panorama3Module;Landroid/graphics/Canvas;)Landroid/graphics/Canvas;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mDispPreviewImageCanvas:Landroid/graphics/Canvas;

    return-object p1
.end method

.method static synthetic access$500(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    return-object p0
.end method

.method static synthetic access$5000(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Paint;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mDispPreviewImagePaint:Landroid/graphics/Paint;

    return-object p0
.end method

.method static synthetic access$5002(Lcom/android/camera/module/Panorama3Module;Landroid/graphics/Paint;)Landroid/graphics/Paint;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mDispPreviewImagePaint:Landroid/graphics/Paint;

    return-object p1
.end method

.method static synthetic access$5200(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->initAttachQueue()V

    return-void
.end method

.method static synthetic access$5300(Lcom/android/camera/module/Panorama3Module;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/module/Panorama3Module;->stopPanoramaShooting(Z)V

    return-void
.end method

.method static synthetic access$5502(Lcom/android/camera/module/Panorama3Module;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/Panorama3Module;->mCanSavePanorama:Z

    return p1
.end method

.method static synthetic access$5700(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->onPreviewMoving()V

    return-void
.end method

.method static synthetic access$5800(Lcom/android/camera/module/Panorama3Module;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/module/Panorama3Module;->mCaptureOrientationDecided:Z

    return p0
.end method

.method static synthetic access$5900(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->onCaptureOrientationDecided()V

    return-void
.end method

.method static synthetic access$600(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/RoundDetector;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mRoundDetector:Lcom/android/camera/panorama/RoundDetector;

    return-object p0
.end method

.method static synthetic access$6200(Lcom/android/camera/module/Panorama3Module;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewRefY:I

    return p0
.end method

.method static synthetic access$6202(Lcom/android/camera/module/Panorama3Module;I)I
    .locals 0

    iput p1, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewRefY:I

    return p1
.end method

.method static synthetic access$700(Lcom/android/camera/module/Panorama3Module;)J
    .locals 2

    iget-wide v0, p0, Lcom/android/camera/module/Panorama3Module;->mTimeTaken:J

    return-wide v0
.end method

.method static synthetic access$800(Lcom/android/camera/module/Panorama3Module;J)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/Panorama3Module;->createNameString(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$900(Lcom/android/camera/module/Panorama3Module;Ljava/lang/String;II)Z
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/module/Panorama3Module;->savePanoramaFile(Ljava/lang/String;II)Z

    move-result p0

    return p0
.end method

.method private addAttachQueue(Lcom/android/camera/panorama/CaptureImage;)V
    .locals 4

    if-nez p1, :cond_0

    sget-object p1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v0, "addAttachQueue failed due to image is null"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x0

    :try_start_0
    iget-boolean v1, p0, Lcom/android/camera/module/Panorama3Module;->mRequestStop:Z

    if-eqz v1, :cond_1

    sget-object v1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v2, "addAttachQueue failed due to request stop"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    nop

    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->close()V

    return-void

    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mAttachImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :goto_0
    :try_start_2
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mAttachImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    move-result v0

    const/4 v2, 0x1

    if-le v0, v2, :cond_3

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mAttachImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/panorama/CaptureImage;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/android/camera/panorama/CaptureImage;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_2
    goto :goto_0

    :cond_3
    if-nez v1, :cond_4

    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->close()V

    :cond_4
    sget-object p1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v0, "addAttachQueue"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :catchall_0
    move-exception v0

    goto :goto_1

    :catchall_1
    move-exception v1

    move-object v3, v1

    move v1, v0

    move-object v0, v3

    :goto_1
    if-nez v1, :cond_5

    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->close()V

    :cond_5
    throw v0
.end method

.method private addImageAsApplication(Ljava/lang/String;Ljava/lang/String;III)V
    .locals 16

    move-object/from16 v7, p0

    move-object/from16 v0, p1

    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v1

    iget-wide v2, v7, Lcom/android/camera/module/Panorama3Module;->mTimeTaken:J

    move/from16 v4, p5

    invoke-static {v0, v4, v1, v2, v3}, Lcom/android/camera/ExifHelper;->writeExifByFilePath(Ljava/lang/String;ILandroid/location/Location;J)V

    const/4 v2, 0x1

    const/4 v6, 0x0

    if-eqz v1, :cond_0

    move v3, v2

    goto :goto_0

    :cond_0
    nop

    move v3, v6

    :goto_0
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v8

    iget-wide v11, v7, Lcom/android/camera/module/Panorama3Module;->mTimeTaken:J

    iget-object v13, v7, Lcom/android/camera/module/Panorama3Module;->mLocation:Landroid/location/Location;

    move-object v9, v0

    move v10, v4

    move/from16 v14, p3

    move/from16 v15, p4

    invoke-static/range {v8 .. v15}, Lcom/android/camera/storage/Storage;->addImageForGroupOrPanorama(Landroid/content/Context;Ljava/lang/String;IJLandroid/location/Location;II)Landroid/net/Uri;

    move-result-object v1

    if-nez v1, :cond_1

    sget-object v1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "insert MediaProvider failed, attempt to find uri by path, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/android/camera/storage/MediaProviderUtil;->getContentUriFromPath(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    :cond_1
    move-object v8, v1

    sget-object v1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "addImageAsApplication uri = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, ", path = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v7, v2, v6}, Lcom/android/camera/module/Panorama3Module;->trackGeneralInfo(IZ)V

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v9, 0x0

    move-object v0, v7

    move v10, v6

    move v6, v9

    invoke-virtual/range {v0 .. v6}, Lcom/android/camera/module/Panorama3Module;->trackPictureTaken(IZZLjava/lang/String;ZZ)V

    iget-object v0, v7, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/Panorama3Module;->isCreated()Z

    move-result v1

    if-eqz v1, :cond_2

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    if-eqz v8, :cond_2

    move-object/from16 v1, p2

    invoke-virtual {v0, v8, v1}, Lcom/android/camera/Camera;->onNewUriArrived(Landroid/net/Uri;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {v1, v8, v10}, Lcom/android/camera/Thumbnail;->createThumbnailFromUri(Landroid/content/ContentResolver;Landroid/net/Uri;Z)Lcom/android/camera/Thumbnail;

    move-result-object v1

    invoke-static {v0, v8}, Lcom/android/camera/Util;->broadcastNewPicture(Landroid/content/Context;Landroid/net/Uri;)V

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    invoke-virtual {v0, v1, v10, v10}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    :cond_2
    return-void
.end method

.method private calibrateRotation(I)I
    .locals 1

    if-eqz p1, :cond_0

    const/16 v0, 0x5a

    if-eq p1, v0, :cond_0

    const/16 v0, 0xb4

    if-eq p1, v0, :cond_0

    const/16 v0, 0x10e

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    :cond_0
    iget v0, p0, Lcom/android/camera/module/Panorama3Module;->mDeviceOrientationAtCapture:I

    add-int/2addr p1, v0

    rem-int/lit16 p1, p1, 0x168

    return p1
.end method

.method private configMorphoPanoramaGP3()Z
    .locals 13

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "configMorphoPanoramaGP3 start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setAttachEnabled(Z)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-virtual {v0}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->disableSaveInputImages()V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v2}, Lcom/android/camera/panorama/PanoramaSetting;->getShrink_ratio()F

    move-result v2

    float-to-double v2, v2

    invoke-virtual {v0, v2, v3}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setShrinkRatio(D)I

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setShrinkRatio error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v3}, Lcom/android/camera/panorama/PanoramaSetting;->getCalcseam_pixnum()I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setCalcseamPixnum(I)I

    move-result v0

    if-eqz v0, :cond_1

    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setCalcseamPixnum error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v3}, Lcom/android/camera/panorama/PanoramaSetting;->isUse_deform()Z

    move-result v3

    invoke-virtual {v0, v3}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setUseDeform(Z)I

    move-result v0

    if-eqz v0, :cond_2

    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setUseDeform error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v3}, Lcom/android/camera/panorama/PanoramaSetting;->isUse_luminance_correction()Z

    move-result v3

    invoke-virtual {v0, v3}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setUseLuminanceCorrection(Z)I

    move-result v0

    if-eqz v0, :cond_3

    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setUseLuminanceCorrection error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v3}, Lcom/android/camera/panorama/PanoramaSetting;->getSeamsearch_ratio()D

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setSeamsearchRatio(D)I

    move-result v0

    if-eqz v0, :cond_4

    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setSeamsearchRatio error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v3}, Lcom/android/camera/panorama/PanoramaSetting;->getZrotation_coeff()D

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setZrotationCoeff(D)I

    move-result v0

    if-eqz v0, :cond_5

    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setZrotationCoeff error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v3}, Lcom/android/camera/panorama/PanoramaSetting;->getDraw_threshold()D

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setDrawThreshold(D)I

    move-result v0

    if-eqz v0, :cond_6

    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setDrawThreshold error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v3}, Lcom/android/camera/panorama/PanoramaSetting;->getAov_gain()D

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setAovGain(D)I

    move-result v0

    if-eqz v0, :cond_7

    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setAovGain error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v0}, Lcom/android/camera/panorama/PanoramaSetting;->getDistortion_k1()D

    move-result-wide v5

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v0}, Lcom/android/camera/panorama/PanoramaSetting;->getDistortion_k2()D

    move-result-wide v7

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v0}, Lcom/android/camera/panorama/PanoramaSetting;->getDistortion_k3()D

    move-result-wide v9

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v0}, Lcom/android/camera/panorama/PanoramaSetting;->getDistortion_k4()D

    move-result-wide v11

    invoke-virtual/range {v4 .. v12}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setDistortionCorrectionParam(DDDD)I

    move-result v0

    if-eqz v0, :cond_8

    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setDistortionCorrectionParam error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_8
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v3}, Lcom/android/camera/panorama/PanoramaSetting;->getRotation_ratio()D

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setRotationRatio(D)I

    move-result v0

    if-eqz v0, :cond_9

    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setRotationRatio error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_9
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-virtual {v0, v2}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setSensorUseMode(I)I

    move-result v0

    if-eqz v0, :cond_a

    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setSensorUseMode error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_a
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-virtual {v0, v2}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setProjectionMode(I)I

    move-result v0

    if-eqz v0, :cond_b

    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setProjectionMode error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_b
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-virtual {v0, v2}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setMotionDetectionMode(I)I

    move-result v0

    if-eqz v0, :cond_c

    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setMotionDetectionMode error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_c
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v2, "configMorphoPanoramaGP3 end"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1
.end method

.method public static createDateStringForAppSeg(J)Ljava/lang/String;
    .locals 1

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    new-instance p0, Ljava/text/SimpleDateFormat;

    const-string p1, "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"

    invoke-direct {p0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    const-string p1, "GMT"

    invoke-static {p1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    invoke-virtual {p0, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private createEngine()Z
    .locals 7

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "finish prior Engine"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->finishEngine()V

    :cond_0
    new-instance v0, Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-direct {v0}, Lcom/android/camera/panorama/MorphoPanoramaGP3;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    const-string v0, "YUV420_PLANAR"

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mImageFormat:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mImageFormat:Ljava/lang/String;

    iput-object v1, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->input_format:Ljava/lang/String;

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    const-string v1, "YUV420_SEMIPLANAR"

    iput-object v1, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_format:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mImageFormat:Ljava/lang/String;

    iput-object v1, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->input_format:Ljava/lang/String;

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mImageFormat:Ljava/lang/String;

    iput-object v1, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_format:Ljava/lang/String;

    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v1, p0, Lcom/android/camera/module/Panorama3Module;->mPictureWidth:I

    iput v1, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->input_width:I

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v1, p0, Lcom/android/camera/module/Panorama3Module;->mPictureHeight:I

    iput v1, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->input_height:I

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v1, p0, Lcom/android/camera/module/Panorama3Module;->mViewAngleH:F

    float-to-double v1, v1

    iput-wide v1, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->aovx:D

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v1, p0, Lcom/android/camera/module/Panorama3Module;->mViewAngleV:F

    float-to-double v1, v1

    iput-wide v1, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->aovy:D

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getPanoramaMoveDirection(Landroid/content/Context;)I

    move-result v1

    iput v1, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->direction:I

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result v0

    iget v1, p0, Lcom/android/camera/module/Panorama3Module;->mOrientation:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_2

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mCameraOrientation:I

    add-int/2addr v2, v0

    add-int/lit16 v2, v2, 0x168

    rem-int/lit16 v2, v2, 0x168

    iput v2, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    goto :goto_1

    :cond_2
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mCameraOrientation:I

    add-int/2addr v2, v0

    iget v0, p0, Lcom/android/camera/module/Panorama3Module;->mOrientation:I

    add-int/2addr v2, v0

    add-int/lit16 v2, v2, 0x168

    rem-int/lit16 v2, v2, 0x168

    iput v2, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    :goto_1
    const/16 v0, 0xa6

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getCameraLensType(I)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "lensType "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "wide"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v1, p0, Lcom/android/camera/module/Panorama3Module;->mGoalAngle:I

    int-to-double v1, v1

    iput-wide v1, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->goal_angle:D

    goto :goto_2

    :cond_3
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    const-string v1, "cepheus"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    const-wide v1, 0x406305c28f5c28f6L    # 152.18

    iput-wide v1, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->goal_angle:D

    goto :goto_2

    :cond_4
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v1, p0, Lcom/android/camera/module/Panorama3Module;->mGoalAngle:I

    int-to-double v1, v1

    const-wide v3, 0x3fe40c49ba5e353fL    # 0.6265

    mul-double/2addr v1, v3

    iput-wide v1, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->goal_angle:D

    :goto_2
    iget v0, p0, Lcom/android/camera/module/Panorama3Module;->mCameraOrientation:I

    const/16 v1, 0x5a

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v0, v1, :cond_7

    const/16 v1, 0xb4

    if-eq v0, v1, :cond_6

    const/16 v1, 0x10e

    if-eq v0, v1, :cond_5

    nop

    nop

    move v0, v2

    goto :goto_3

    :cond_5
    const/4 v0, 0x3

    goto :goto_3

    :cond_6
    const/4 v0, 0x2

    goto :goto_3

    :cond_7
    nop

    nop

    move v0, v3

    :goto_3
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    invoke-virtual {v1, v0}, Lcom/android/camera/panorama/SensorFusion;->setRotation(I)I

    move-result v0

    if-eqz v0, :cond_8

    sget-object v1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "SensorFusion.setRotation error ret:0x%08X"

    new-array v6, v3, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_8
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/module/Panorama3Module;->initializeEngine(Lcom/android/camera/panorama/MorphoPanoramaGP3;Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;)Z

    return v3
.end method

.method private createNameString(J)Ljava/lang/String;
    .locals 1

    const v0, 0x7f0900d0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Panorama3Module;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1, p2}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private doLaterReleaseIfNeed()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->pause()V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v1}, Lcom/android/camera/Camera;->releaseAll(ZZ)V

    return-void

    :cond_1
    return-void
.end method

.method private finishEngine()V
    .locals 6

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "finishEngine start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-virtual {v0}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->deleteNativeOutputInfo()I

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->finish(Z)I

    move-result v0

    if-eqz v0, :cond_1

    sget-object v2, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "finish error ret:0x%08X"

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v1, v5

    invoke-static {v3, v4, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "finishEngine end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    return-void
.end method

.method private initAttachQueue()V
    .locals 2

    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mAttachImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mAttachImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/panorama/CaptureImage;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/camera/panorama/CaptureImage;->close()V

    :cond_0
    goto :goto_0

    :cond_1
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "initAttachQueue"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private initPreviewLayout()V
    .locals 5

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->width:I

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/CameraScreenNail;->setPreviewSize(II)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getHeight()I

    move-result v0

    int-to-float v0, v0

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mLongSideCropRatio:F

    mul-float/2addr v0, v2

    float-to-int v0, v0

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0a001f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    mul-int/2addr v1, v2

    div-int/2addr v1, v0

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v3, 0xb0

    invoke-virtual {v0, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v3, v3, Lcom/android/camera/CameraSize;->width:I

    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v4, v4, Lcom/android/camera/CameraSize;->height:I

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->initPreviewLayout(IIII)V

    return-void
.end method

.method private initializeEngine(Lcom/android/camera/panorama/MorphoPanoramaGP3;Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;)Z
    .locals 7

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "initializeEngine start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->createNativeOutputInfo()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "createNativeOutputInfo error ret:0x%08X"

    new-array v6, v2, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v1

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-virtual {p1, p2}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->initialize(Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;)I

    move-result p1

    if-eqz p1, :cond_1

    sget-object p2, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "initialize error ret:0x%08X"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v1

    invoke-static {v0, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_1
    sget-object p1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string p2, "initializeEngine end"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2
.end method

.method private isProcessingFinishTask()Z
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSaveOutputImageTask:Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSaveOutputImageTask:Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;

    invoke-virtual {v0}, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v0

    sget-object v1, Landroid/os/AsyncTask$Status;->FINISHED:Landroid/os/AsyncTask$Status;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private isShootingTooShort()Z
    .locals 4

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaShootingStartTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x258

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isZslMode()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method private keepScreenOnAwhile()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x11

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_0
    return-void
.end method

.method private onCaptureOrientationDecided()V
    .locals 4

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "onCaptureOrientationDecided"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    iget v1, p0, Lcom/android/camera/module/Panorama3Module;->mDirection:I

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mAttachPosOffsetX:I

    iget v3, p0, Lcom/android/camera/module/Panorama3Module;->mAttachPosOffsetY:I

    invoke-interface {v0, v1, v2, v3}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->onCaptureOrientationDecided(III)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mCaptureOrientationDecided:Z

    return-void
.end method

.method private onPreviewMoving()V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->onPreviewMoving()V

    return-void
.end method

.method private onSaveFinish()V
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Panorama3Module;->enableCameraControls(Z)V

    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mAeLockSupported:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mAwbLockSupported:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setAWBLock(Z)V

    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/Panorama3Module;->mTargetFocusMode:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->startPreview()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPostSavingFinish()V

    :cond_3
    return-void

    :cond_4
    :goto_0
    return-void
.end method

.method private onStopShooting(Z)V
    .locals 3

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    if-nez v0, :cond_0

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onStopShooting recordState is null, succeed = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    if-eqz p1, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPostSavingStart()V

    goto :goto_0

    :cond_1
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFailed()V

    :goto_0
    return-void
.end method

.method private registerGravitySensorListener()V
    .locals 3

    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsRegisterGravitySensor:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "registerGravitySensorListener"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsSensorAverage:Z

    iput v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorCnt:I

    const/4 v1, 0x3

    new-array v1, v1, [F

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    const/16 v2, 0x9

    invoke-virtual {v1, v2}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Sensor;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    const/4 v2, 0x2

    invoke-virtual {v1, p0, v0, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsRegisterGravitySensor:Z

    return-void
.end method

.method private requestStopShoot()V
    .locals 1

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->sAttachExit:Lcom/android/camera/panorama/CaptureImage;

    invoke-direct {p0, v0}, Lcom/android/camera/module/Panorama3Module;->addAttachQueue(Lcom/android/camera/panorama/CaptureImage;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mRequestStop:Z

    return-void
.end method

.method private resetScreenOn()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    return-void
.end method

.method private savePanoramaFile(Ljava/lang/String;II)Z
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v3, p1

    new-instance v13, Lcom/android/camera/panorama/MorphoPanoramaGP3$GalleryInfoData;

    invoke-direct {v13}, Lcom/android/camera/panorama/MorphoPanoramaGP3$GalleryInfoData;-><init>()V

    nop

    invoke-static {}, Lcom/android/camera/storage/Storage;->isUseDocumentMode()Z

    move-result v1

    const/4 v14, 0x1

    if-eqz v1, :cond_3

    const/4 v1, -0x1

    :try_start_0
    invoke-static {v3, v14}, Lcom/android/camera/FileCompat;->getParcelFileDescriptor(Ljava/lang/String;Z)Landroid/os/ParcelFileDescriptor;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    const/4 v15, 0x0

    :try_start_1
    iget-object v4, v0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v7

    iget-object v8, v0, Lcom/android/camera/module/Panorama3Module;->mShutterStartTime:Ljava/lang/String;

    iget-object v9, v0, Lcom/android/camera/module/Panorama3Module;->mShutterEndTime:Ljava/lang/String;

    const/4 v10, 0x0

    const/4 v12, 0x0

    move/from16 v5, p2

    move/from16 v6, p3

    move-object v11, v13

    invoke-virtual/range {v4 .. v12}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->savePanorama360(IILjava/io/FileDescriptor;Ljava/lang/String;Ljava/lang/String;ZLcom/android/camera/panorama/MorphoPanoramaGP3$GalleryInfoData;Z)I

    move-result v4
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_2

    :try_start_2
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    goto :goto_2

    :catchall_0
    move-exception v0

    move-object v4, v0

    goto :goto_0

    :catch_1
    move-exception v0

    move-object v15, v0

    :try_start_3
    throw v15
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_0
    if-eqz v2, :cond_1

    if-eqz v15, :cond_0

    :try_start_4
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_1

    :catch_2
    move-exception v0

    move-object v2, v0

    :try_start_5
    invoke-virtual {v15, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_0
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V

    :cond_1
    :goto_1
    throw v4
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    :catch_3
    move-exception v0

    move v4, v1

    :goto_2
    sget-object v1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "open file failed, filePath "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    :goto_3
    goto :goto_4

    :cond_3
    iget-object v1, v0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v4, v0, Lcom/android/camera/module/Panorama3Module;->mShutterStartTime:Ljava/lang/String;

    iget-object v5, v0, Lcom/android/camera/module/Panorama3Module;->mShutterEndTime:Ljava/lang/String;

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object v0, v1

    move/from16 v1, p2

    move/from16 v2, p3

    move-object v7, v13

    invoke-virtual/range {v0 .. v8}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->savePanorama360(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/android/camera/panorama/MorphoPanoramaGP3$GalleryInfoData;Z)I

    move-result v4

    :goto_4
    if-nez v4, :cond_4

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    invoke-virtual {v13}, Lcom/android/camera/panorama/MorphoPanoramaGP3$GalleryInfoData;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v14

    :cond_4
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "savePanorama360() -> 0x%x"

    new-array v2, v14, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v4
.end method

.method private setInitialRotationByGravity()V
    .locals 14

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorCnt:I

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mSensorCnt:I

    int-to-float v2, v2

    div-float/2addr v0, v2

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    iget v4, p0, Lcom/android/camera/module/Panorama3Module;->mSensorCnt:I

    int-to-float v4, v4

    div-float/2addr v2, v4

    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    const/4 v5, 0x2

    aget v4, v4, v5

    iget v6, p0, Lcom/android/camera/module/Panorama3Module;->mSensorCnt:I

    int-to-float v6, v6

    div-float/2addr v4, v6

    sget-object v6, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "Gravity Sensor Value X=%f Y=%f Z=%f cnt=%d"

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    aput-object v10, v9, v1

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    aput-object v10, v9, v3

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    aput-object v10, v9, v5

    const/4 v5, 0x3

    iget v10, p0, Lcom/android/camera/module/Panorama3Module;->mSensorCnt:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v5

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v7, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    float-to-double v8, v0

    float-to-double v10, v2

    float-to-double v12, v4

    invoke-virtual/range {v7 .. v13}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setInitialRotationByGravity(DDD)I

    move-result v0

    if-eqz v0, :cond_0

    sget-object v2, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "MorphoPanoramaGP3.setInitialRotationByGravity error ret:0x%08X"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v1

    invoke-static {v4, v5, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method private setSensorFusionValue(Lcom/android/camera/panorama/CaptureImage;)V
    .locals 9

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    if-eqz v0, :cond_5

    const/4 v0, 0x4

    new-array v1, v0, [I

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v3, v3, v1}, Lcom/android/camera/panorama/SensorFusion;->getSensorMatrix([D[D[D[I)I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_0

    sget-object v5, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "SensorFusion.getSensorMatrix error ret:0x%08X"

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v8, v3

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    invoke-virtual {v2}, Lcom/android/camera/panorama/SensorFusion;->getStockData()Ljava/util/ArrayList;

    move-result-object v2

    new-instance v5, Lcom/android/camera/panorama/SensorInfoManager;

    invoke-direct {v5, v0}, Lcom/android/camera/panorama/SensorInfoManager;-><init>(I)V

    aget v0, v1, v3

    iput v0, v5, Lcom/android/camera/panorama/SensorInfoManager;->g_ix:I

    const/4 v0, 0x3

    aget v6, v1, v0

    iput v6, v5, Lcom/android/camera/panorama/SensorInfoManager;->r_ix:I

    aget v1, v1, v4

    iput v1, v5, Lcom/android/camera/panorama/SensorInfoManager;->a_ix:I

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-virtual {v1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->getAttachCount()J

    move-result-wide v6

    iput-wide v6, v5, Lcom/android/camera/panorama/SensorInfoManager;->img_ix:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iput-wide v6, v5, Lcom/android/camera/panorama/SensorInfoManager;->timeMillis:J

    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->getTimestamp()J

    move-result-wide v6

    iput-wide v6, v5, Lcom/android/camera/panorama/SensorInfoManager;->imageTimeStamp:J

    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->getSensitivity()I

    move-result v1

    iput v1, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensitivity:I

    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->getExposureTime()J

    move-result-wide v6

    iput-wide v6, v5, Lcom/android/camera/panorama/SensorInfoManager;->exposureTime:J

    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->getRollingShutterSkew()J

    move-result-wide v6

    iput-wide v6, v5, Lcom/android/camera/panorama/SensorInfoManager;->rollingShutterSkew:J

    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->getSensorTimeStamp()J

    move-result-wide v6

    iput-wide v6, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorTimeStamp:J

    iget-object p1, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    aput-object v1, p1, v3

    iget-object p1, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    aput-object v1, p1, v0

    iget-object p1, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    aput-object v1, p1, v4

    iget-object p1, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    aget-object p1, p1, v3

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorInfoManagerList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_1

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorInfoManagerList:Ljava/util/ArrayList;

    sub-int/2addr p1, v4

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/panorama/SensorInfoManager;

    iget v1, p1, Lcom/android/camera/panorama/SensorInfoManager;->g_ix:I

    iput v1, v5, Lcom/android/camera/panorama/SensorInfoManager;->g_ix:I

    iget-object v1, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    iget-object p1, p1, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    aget-object p1, p1, v3

    aput-object p1, v1, v3

    :cond_1
    iget-object p1, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    aget-object p1, p1, v0

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorInfoManagerList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_2

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorInfoManagerList:Ljava/util/ArrayList;

    sub-int/2addr p1, v4

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/panorama/SensorInfoManager;

    iget v1, p1, Lcom/android/camera/panorama/SensorInfoManager;->r_ix:I

    iput v1, v5, Lcom/android/camera/panorama/SensorInfoManager;->r_ix:I

    iget-object v1, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    iget-object p1, p1, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    aget-object p1, p1, v0

    aput-object p1, v1, v0

    :cond_2
    iget-object p1, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    aget-object p1, p1, v4

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorInfoManagerList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_3

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorInfoManagerList:Ljava/util/ArrayList;

    sub-int/2addr p1, v4

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/panorama/SensorInfoManager;

    iget v0, p1, Lcom/android/camera/panorama/SensorInfoManager;->a_ix:I

    iput v0, v5, Lcom/android/camera/panorama/SensorInfoManager;->a_ix:I

    iget-object v0, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    iget-object p1, p1, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    aget-object p1, p1, v4

    aput-object p1, v0, v4

    :cond_3
    iput-object v5, p0, Lcom/android/camera/module/Panorama3Module;->mCurrentSensorInfoManager:Lcom/android/camera/panorama/SensorInfoManager;

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorInfoManagerList:Ljava/util/ArrayList;

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-virtual {p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->getAttachCount()J

    move-result-wide v0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_4

    const-wide/16 v5, 0x0

    cmp-long v0, v0, v5

    if-lez v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    new-array p1, p1, [Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;

    invoke-virtual {v0, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setGyroscopeData([Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;)I

    move-result p1

    if-eqz p1, :cond_4

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "setGyroscopeData error ret:0x%08X"

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, v3

    invoke-static {v1, v2, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    invoke-virtual {p1}, Lcom/android/camera/panorama/SensorFusion;->clearStockData()V

    :cond_5
    return-void
.end method

.method private setupCaptureParams()V
    .locals 5

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_0

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "camera device is not ready"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/Panorama3Module;->mTargetFocusMode:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setZoomRatio(F)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFlashMode(I)V

    invoke-static {}, Lcom/android/camera/CameraSettings;->getAntiBanding()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/camera2/Camera2Proxy;->setAntiBanding(I)V

    sget-object v2, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "antiBanding="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setEnableZsl(Z)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setHHT(Z)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setTimeWaterMarkEnable(Z)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFaceWaterMarkEnable(Z)V

    return-void
.end method

.method private stopPanoramaShooting(Z)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/module/Panorama3Module;->stopPanoramaShooting(ZZ)V

    return-void
.end method

.method private stopPanoramaShooting(ZZ)V
    .locals 4

    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    if-nez v0, :cond_0

    sget-object p1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string p2, "stopPanoramaShooting while not shooting"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "stopPanoramaShooting: saveImage="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", isRelease="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->requestStopShoot()V

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->keepScreenOnAwhile()V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mRoundDetector:Lcom/android/camera/panorama/RoundDetector;

    invoke-virtual {v0}, Lcom/android/camera/panorama/RoundDetector;->stop()V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mDeviceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v1, :cond_3

    if-eqz p2, :cond_2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xb0

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    if-eqz v1, :cond_1

    sget-object v2, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v3, "onPause setDisplayPreviewBitmap null"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->setDisplayPreviewBitmap(Landroid/graphics/Bitmap;)V

    :cond_1
    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->captureAbortBurst()V

    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, p2}, Lcom/android/camera2/Camera2Proxy;->stopPreviewCallback(Z)V

    :cond_3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p2, 0x0

    if-eqz p1, :cond_4

    iget-boolean p1, p0, Lcom/android/camera/module/Panorama3Module;->mCanSavePanorama:Z

    if-eqz p1, :cond_4

    const/4 p1, 0x1

    goto :goto_1

    :cond_4
    move p1, p2

    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/android/camera/module/Panorama3Module;->createDateStringForAppSeg(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mShutterEndTime:Ljava/lang/String;

    new-instance v0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;-><init>(Lcom/android/camera/module/Panorama3Module;Z)V

    iput-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSaveOutputImageTask:Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSaveOutputImageTask:Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;

    new-array p2, p2, [Ljava/lang/Void;

    invoke-virtual {v0, p2}, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    invoke-direct {p0, p1}, Lcom/android/camera/module/Panorama3Module;->onStopShooting(Z)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private unregisterGravitySensorListener()V
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsRegisterGravitySensor:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "unregisterGravitySensorListener"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsRegisterGravitySensor:Z

    return-void
.end method

.method private updatePictureAndPreviewSize()V
    .locals 6

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const/16 v1, 0x100

    invoke-virtual {v0, v1}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(I)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Panorama3Module;->getBestPanoPictureSize(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const-class v2, Landroid/graphics/SurfaceTexture;

    invoke-virtual {v1, v2}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mModuleIndex:I

    iget v3, p0, Lcom/android/camera/module/Panorama3Module;->mBogusCameraId:I

    iget v4, v0, Lcom/android/camera/CameraSize;->width:I

    iget v5, v0, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v4, v5}, Lcom/android/camera/CameraSettings;->getPreviewAspectRatio(II)F

    move-result v4

    float-to-double v4, v4

    invoke-static {v2, v3, v1, v4, v5}, Lcom/android/camera/Util;->getOptimalPreviewSize(IILjava/util/List;D)Lcom/android/camera/CameraSize;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iput-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mPictureSize:Lcom/android/camera/CameraSize;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mPictureSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->width:I

    iput v1, p0, Lcom/android/camera/module/Panorama3Module;->mPictureWidth:I

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mPictureSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->height:I

    iput v1, p0, Lcom/android/camera/module/Panorama3Module;->mPictureHeight:I

    sget-object v1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "pictureSize= "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/android/camera/CameraSize;->width:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "X"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v0, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " previewSize="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v0, v0, Lcom/android/camera/CameraSize;->width:I

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "X"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v0, v0, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v0, v0, Lcom/android/camera/CameraSize;->width:I

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/Panorama3Module;->updateCameraScreenNailSize(II)V

    return-void
.end method


# virtual methods
.method public closeCamera()V
    .locals 4

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "closeCamera: start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mDeviceLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0, v1}, Lcom/android/camera/module/Panorama3Module;->setCameraState(I)V

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lcom/android/camera2/Camera2Proxy;->stopPreviewCallback(Z)V

    iput-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "closeCamera: end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public varargs consumePreference([I)V
    .locals 6
    .param p1    # [I
        .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
        .end annotation
    .end param

    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_5

    aget v2, p1, v1

    const/4 v3, 0x1

    if-eq v2, v3, :cond_4

    const/16 v3, 0x18

    if-eq v2, v3, :cond_3

    const/16 v3, 0x20

    if-eq v2, v3, :cond_2

    const/16 v3, 0x37

    if-eq v2, v3, :cond_1

    packed-switch v2, :pswitch_data_0

    sget-boolean v3, Lcom/android/camera/module/Panorama3Module;->DEBUG:Z

    if-nez v3, :cond_0

    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "no consumer for this updateType: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "no consumer for this updateType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->updateModuleRelated()V

    goto :goto_1

    :cond_2
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->setupCaptureParams()V

    goto :goto_1

    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->applyZoomRatio()V

    goto :goto_1

    :cond_4
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->updatePictureAndPreviewSize()V

    nop

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_5
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2e
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected getBestPanoPictureSize(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    iget v0, p0, Lcom/android/camera/module/Panorama3Module;->mModuleIndex:I

    iget v1, p0, Lcom/android/camera/module/Panorama3Module;->mBogusCameraId:I

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v1}, Lcom/android/camera/PictureSizeManager;->initialize(Ljava/util/List;III)V

    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getBestPanoPictureSize()Lcom/android/camera/CameraSize;

    move-result-object p1

    return-object p1
.end method

.method protected getOperatingMode()I
    .locals 1

    const v0, 0x8008

    return v0
.end method

.method public isDoingAction()Z
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->isProcessingFinishTask()Z

    move-result v0

    return v0
.end method

.method public isRecording()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    return v0
.end method

.method public isUnInterruptable()Z
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mUnInterruptableReason:Ljava/lang/String;

    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    if-eqz v0, :cond_0

    const-string v0, "shooting"

    iput-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mUnInterruptableReason:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mUnInterruptableReason:Ljava/lang/String;

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isZoomEnabled()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected keepScreenOn()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    return-void
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onBackPressed()Z
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->isProcessingFinishTask()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Panorama3Module;->playCameraSound(I)V

    invoke-direct {p0, v1}, Lcom/android/camera/module/Panorama3Module;->stopPanoramaShooting(Z)V

    :cond_0
    return v1

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method protected onCameraOpened()V
    .locals 2

    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onCameraOpened()V

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->checkDisplayOrientation()V

    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->PANORAMA_TYPES_INIT:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Panorama3Module;->updatePreferenceTrampoline([I)V

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->startSession()V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "SetupCameraThread done"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/CameraCapabilities;->getViewAngle(Z)F

    move-result v0

    iput v0, p0, Lcom/android/camera/module/Panorama3Module;->mViewAngleH:F

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera2/CameraCapabilities;->getViewAngle(Z)F

    move-result v0

    iput v0, p0, Lcom/android/camera/module/Panorama3Module;->mViewAngleV:F

    sget-object v0, Lcom/mi/config/b;->qp:Ljava/lang/String;

    const-string v1, "lavender"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/module/Panorama3Module;->mViewAngleH:F

    const/high16 v1, 0x42480000    # 50.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/16 v0, 0x123

    iput v0, p0, Lcom/android/camera/module/Panorama3Module;->mGoalAngle:I

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getSensorOrientation()I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/Panorama3Module;->mCameraOrientation:I

    return-void
.end method

.method public onCreate(II)V
    .locals 5

    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onCreate(II)V

    new-instance p1, Lcom/android/camera/module/Panorama3Module$MainHandler;

    iget-object p2, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p2}, Lcom/android/camera/Camera;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p0, p2}, Lcom/android/camera/module/Panorama3Module$MainHandler;-><init>(Lcom/android/camera/module/Panorama3Module;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mHandler:Landroid/os/Handler;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->fM()I

    move-result p1

    iput p1, p0, Lcom/android/camera/module/Panorama3Module;->mGoalAngle:I

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->fN()F

    move-result p1

    iput p1, p0, Lcom/android/camera/module/Panorama3Module;->mLongSideCropRatio:F

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0a001f

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lcom/android/camera/module/Panorama3Module;->mSmallPreviewHeight:I

    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object p1

    sget p2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-virtual {p1, p2}, Lcom/android/camera/effect/EffectController;->setEffect(I)V

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->onCameraOpened()V

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object p1

    const-string p2, "sensor"

    invoke-virtual {p1, p2}, Lcom/android/camera/Camera;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/SensorManager;

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    const/4 v0, 0x1

    if-eqz p2, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/hardware/Sensor;

    invoke-virtual {p2}, Landroid/hardware/Sensor;->getType()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v1, v2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mGyroscope:Landroid/hardware/Sensor;

    :cond_0
    invoke-virtual {p2}, Landroid/hardware/Sensor;->getType()I

    move-result v1

    const/16 v2, 0x10

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v1, v2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mGyroscopeUncalibrated:Landroid/hardware/Sensor;

    :cond_1
    invoke-virtual {p2}, Landroid/hardware/Sensor;->getType()I

    move-result v1

    if-ne v1, v0, :cond_2

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v1, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mAccelerometer:Landroid/hardware/Sensor;

    :cond_2
    invoke-virtual {p2}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_3

    iput-object p2, p0, Lcom/android/camera/module/Panorama3Module;->mMagnetic:Landroid/hardware/Sensor;

    :cond_3
    invoke-virtual {p2}, Landroid/hardware/Sensor;->getType()I

    move-result p2

    const/16 v0, 0xf

    if-ne p2, v0, :cond_4

    iget-object p2, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {p2, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/module/Panorama3Module;->mRotationVector:Landroid/hardware/Sensor;

    :cond_4
    goto :goto_0

    :cond_5
    new-instance p1, Lcom/android/camera/panorama/RoundDetector;

    invoke-direct {p1}, Lcom/android/camera/panorama/RoundDetector;-><init>()V

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mRoundDetector:Lcom/android/camera/panorama/RoundDetector;

    new-instance p1, Lcom/android/camera/panorama/PanoramaSetting;

    iget-object p2, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p2}, Lcom/android/camera/Camera;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/android/camera/panorama/PanoramaSetting;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    new-instance p1, Lcom/android/camera/panorama/SensorFusion;

    invoke-direct {p1, v0}, Lcom/android/camera/panorama/SensorFusion;-><init>(Z)V

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    iput v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusionMode:I

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    iget p2, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusionMode:I

    invoke-virtual {p1, p2}, Lcom/android/camera/panorama/SensorFusion;->setMode(I)I

    move-result p1

    const/4 p2, 0x0

    if-eqz p1, :cond_6

    sget-object v1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "SensorFusion.setMode error ret:0x%08X"

    new-array v4, v0, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, p2

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    invoke-virtual {p1, p2}, Lcom/android/camera/panorama/SensorFusion;->setOffsetMode(I)I

    move-result p1

    if-eqz p1, :cond_7

    sget-object v1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "SensorFusion.setOffsetMode error ret:0x%08X"

    new-array v4, v0, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, p2

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    invoke-virtual {p1, v0}, Lcom/android/camera/panorama/SensorFusion;->setAppState(I)I

    move-result p1

    if-eqz p1, :cond_8

    sget-object v1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "SensorFusion.setAppState error ret:0x%08X"

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v0, p2

    invoke-static {v2, v3, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_8
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorInfoManagerList:Ljava/util/ArrayList;

    return-void
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onDestroy()V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    return-void
.end method

.method public onHostStopAndNotifyActionStop()V
    .locals 5

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Panorama3Module;->playCameraSound(I)V

    const/4 v0, 0x1

    invoke-direct {p0, v0, v0}, Lcom/android/camera/module/Panorama3Module;->stopPanoramaShooting(ZZ)V

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->mPreviewImageLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewImage:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewImage:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    iput-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewImage:Landroid/graphics/Bitmap;

    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mDispPreviewImage:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_1

    sget-object v1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onPause recycle bitmap "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mDispPreviewImage:Landroid/graphics/Bitmap;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mDispPreviewImage:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    iput-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mDispPreviewImage:Landroid/graphics/Bitmap;

    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->doLaterReleaseIfNeed()V

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 4

    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mPaused:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->isFrameAvailable()Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_1

    return v2

    :cond_1
    const/16 v0, 0x1b

    if-eq p1, v0, :cond_5

    const/16 v0, 0x42

    if-eq p1, v0, :cond_5

    const/16 v0, 0x2bc

    if-eq p1, v0, :cond_4

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    goto :goto_3

    :pswitch_0
    const/16 v0, 0x18

    if-eq p1, v0, :cond_3

    const/16 v0, 0x58

    if-ne p1, v0, :cond_2

    goto :goto_0

    :cond_2
    goto :goto_1

    :cond_3
    :goto_0
    move v2, v1

    :goto_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getDevice()Landroid/view/InputDevice;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/InputDevice;->isExternal()Z

    move-result v3

    invoke-virtual {p0, v2, v1, v0, v3}, Lcom/android/camera/module/Panorama3Module;->handleVolumeKeyEvent(ZZIZ)Z

    move-result v0

    if-eqz v0, :cond_8

    return v1

    :pswitch_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_8

    const/16 p1, 0x32

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module;->onShutterButtonClick(I)V

    return v1

    :cond_4
    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    if-eqz v0, :cond_8

    invoke-direct {p0, v1}, Lcom/android/camera/module/Panorama3Module;->stopPanoramaShooting(Z)V

    goto :goto_3

    :cond_5
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_8

    invoke-static {p2}, Lcom/android/camera/Util;->isFingerPrintKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFingerprintCaptureEnable()Z

    move-result p1

    if-eqz p1, :cond_7

    const/16 p1, 0x1e

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module;->onShutterButtonClick(I)V

    goto :goto_2

    :cond_6
    const/16 p1, 0x28

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module;->onShutterButtonClick(I)V

    :cond_7
    :goto_2
    return v1

    :cond_8
    :goto_3
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :pswitch_data_0
    .packed-switch 0x17
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x57
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 3

    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mPaused:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x4

    if-eq p1, v0, :cond_2

    const/16 v0, 0x1b

    if-eq p1, v0, :cond_1

    const/16 v0, 0x42

    if-eq p1, v0, :cond_1

    goto :goto_0

    :cond_1
    return v1

    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xab

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromKeyBack()Z

    move-result v0

    if-eqz v0, :cond_3

    return v1

    :cond_3
    :goto_0
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onPause()V
    .locals 2

    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onPause()V

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->unregisterGravitySensorListener()V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mRoundDetector:Lcom/android/camera/panorama/RoundDetector;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorThread:Landroid/os/HandlerThread;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorThread:Landroid/os/HandlerThread;

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->closeCamera()V

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->resetScreenOn()V

    return-void
.end method

.method public onPreviewLayoutChanged(Landroid/graphics/Rect;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onLayoutChange(Landroid/graphics/Rect;)V

    return-void
.end method

.method public onPreviewSessionClosed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 0

    return-void
.end method

.method public onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->isTextureExpired()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mHandler:Landroid/os/Handler;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module;->retryOnceIfCameraError(Landroid/os/Handler;)Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v0, "sessionFailed due to surfaceTexture expired, retry"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mHandler:Landroid/os/Handler;

    const/16 v0, 0x33

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method public onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 0

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->isAlive()Z

    move-result p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module;->setCameraState(I)V

    sget-object p1, Lcom/android/camera/constant/UpdateConstant;->PANORAMA_ON_PREVIEW_SUCCESS:[I

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module;->updatePreferenceInWorkThread([I)V

    return-void
.end method

.method public onPreviewSizeChanged(II)V
    .locals 0

    return-void
.end method

.method public onResume()V
    .locals 5

    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onResume()V

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->keepScreenOnAwhile()V

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->registerGravitySensorListener()V

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "SensorThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorThread:Landroid/os/HandlerThread;

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/android/camera/panorama/GyroscopeRoundDetector;

    invoke-direct {v1}, Lcom/android/camera/panorama/GyroscopeRoundDetector;-><init>()V

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mRoundDetector:Lcom/android/camera/panorama/RoundDetector;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mGyroscope:Landroid/hardware/Sensor;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mGyroscope:Landroid/hardware/Sensor;

    invoke-virtual {v1, v3, v4, v2, v0}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mGyroscopeUncalibrated:Landroid/hardware/Sensor;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mGyroscopeUncalibrated:Landroid/hardware/Sensor;

    invoke-virtual {v1, v3, v4, v2, v0}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mRotationVector:Landroid/hardware/Sensor;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mRotationVector:Landroid/hardware/Sensor;

    invoke-virtual {v1, v3, v4, v2, v0}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    :cond_2
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mAccelerometer:Landroid/hardware/Sensor;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mAccelerometer:Landroid/hardware/Sensor;

    invoke-virtual {v1, v3, v4, v2, v0}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    :cond_3
    return-void
.end method

.method public onReviewCancelClicked()V
    .locals 0

    return-void
.end method

.method public onReviewDoneClicked()V
    .locals 0

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 6

    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsSensorAverage:Z

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    aget v4, v0, v2

    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v5, v5, v2

    add-float/2addr v4, v5

    aput v4, v0, v2

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    aget v2, v0, v3

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v4, v3

    add-float/2addr v2, v4

    aput v2, v0, v3

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    aget v2, v0, v1

    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget p1, p1, v1

    add-float/2addr v2, p1

    aput v2, v0, v1

    iget p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorCnt:I

    add-int/2addr p1, v3

    iput p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorCnt:I

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v4, v2

    aput v4, v0, v2

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v3

    aput v2, v0, v3

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget p1, p1, v1

    aput p1, v0, v1

    iput v3, p0, Lcom/android/camera/module/Panorama3Module;->mSensorCnt:I

    :goto_0
    return-void
.end method

.method public onShutterButtonClick(I)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mPaused:Z

    if-nez v0, :cond_6

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->getCameraState()I

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->isIgnoreTouchEvent()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object p1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v0, "onShutterButtonClick return, isDoingAction"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_2
    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module;->setTriggerMode(I)V

    iget-boolean p1, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    if-nez p1, :cond_4

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    invoke-static {}, Lcom/android/camera/storage/Storage;->isLowStorageAtLastPoint()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xd4

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFailed()V

    return-void

    :cond_3
    new-instance p1, Lcom/android/camera/module/Panorama3Module$PanoramaInit;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/android/camera/module/Panorama3Module$PanoramaInit;-><init>(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/module/Panorama3Module$1;)V

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaState:Lcom/android/camera/panorama/PanoramaState;

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->initAttachQueue()V

    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module;->playCameraSound(I)V

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->startPanoramaShooting()V

    goto :goto_0

    :cond_4
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->isShootingTooShort()Z

    move-result p1

    if-eqz p1, :cond_5

    sget-object p1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v0, "panorama shooting is too short, ignore this click"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_5
    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module;->playCameraSound(I)V

    const/4 p1, 0x1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/module/Panorama3Module;->stopPanoramaShooting(ZZ)V

    :goto_0
    return-void

    :cond_6
    :goto_1
    return-void
.end method

.method public onShutterButtonFocus(ZI)V
    .locals 0

    return-void
.end method

.method public onShutterButtonLongClick()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public onShutterButtonLongClickCancel(Z)V
    .locals 1

    const/4 p1, 0x0

    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/module/Panorama3Module;->onShutterButtonFocus(ZI)V

    return-void
.end method

.method public onStop()V
    .locals 0

    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onStop()V

    return-void
.end method

.method public onThumbnailClicked(Landroid/view/View;)V
    .locals 0
    .annotation runtime Lcom/android/camera/OnClickAttr;
    .end annotation

    iget-boolean p1, p0, Lcom/android/camera/module/Panorama3Module;->mPaused:Z

    if-nez p1, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->isProcessingFinishTask()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ThumbnailUpdater;->getThumbnail()Lcom/android/camera/Thumbnail;

    move-result-object p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->gotoGallery()V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public onUserInteraction()V
    .locals 1

    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onUserInteraction()V

    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mPaused:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->keepScreenOnAwhile()V

    :cond_0
    return-void
.end method

.method protected openSettingActivity()V
    .locals 4

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    const-class v2, Lcom/android/camera/CameraPreferenceActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    const-string v1, "from_where"

    const/16 v2, 0xa6

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, ":miui:starting_window_label"

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f090047

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->startFromKeyguard()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "StartActivityWhenLocked"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1, v0}, Lcom/android/camera/Camera;->startActivity(Landroid/content/Intent;)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setJumpFlag(I)V

    iget v0, p0, Lcom/android/camera/module/Panorama3Module;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackGotoSettings(I)V

    return-void
.end method

.method public pausePreview()V
    .locals 2

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "pausePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->pausePreview()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Panorama3Module;->setCameraState(I)V

    return-void
.end method

.method protected performVolumeKeyClicked(Ljava/lang/String;IZ)V
    .locals 0

    if-nez p2, :cond_0

    if-eqz p3, :cond_0

    const/16 p1, 0x14

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module;->onShutterButtonClick(I)V

    :cond_0
    return-void
.end method

.method public registerProtocol()V
    .locals 3

    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->registerProtocol()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    const/4 v2, 0x3

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/impl/ImplFactory;->initAdditional(Lcom/android/camera/ActivityBase;[I)V

    return-void

    :array_0
    .array-data 4
        0xae
        0xa4
        0xd4
    .end array-data
.end method

.method public requestRender()V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->requestRender()V

    :cond_0
    return-void
.end method

.method public resumePreview()V
    .locals 2

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "resumePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Panorama3Module;->setCameraState(I)V

    return-void
.end method

.method protected sendOpenFailMessage()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mHandler:Landroid/os/Handler;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method public setFrameAvailable(Z)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/module/BaseModule;->setFrameAvailable(Z)V

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isCameraSoundOpen()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    if-eqz p1, :cond_0

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    :cond_0
    return-void
.end method

.method public setNullDirectionFunction()V
    .locals 8

    new-instance v7, Lcom/android/camera/panorama/DirectionFunction;

    iget v1, p0, Lcom/android/camera/module/Panorama3Module;->mPictureWidth:I

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mPictureHeight:I

    const/4 v3, 0x1

    const/4 v4, 0x1

    const/4 v5, 0x1

    const/4 v6, 0x0

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/android/camera/panorama/DirectionFunction;-><init>(IIIIII)V

    iput-object v7, p0, Lcom/android/camera/module/Panorama3Module;->mDirectionFunction:Lcom/android/camera/panorama/DirectionFunction;

    return-void
.end method

.method public shouldReleaseLater()Z
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->isRecording()Z

    move-result v0

    return v0
.end method

.method public startPanoramaShooting()V
    .locals 6

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->isProcessingFinishTask()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "previous save task is on going"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPrepare()V

    sget-object v1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v2, "startPanoramaShooting"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/camera/module/Panorama3Module;->mCaptureOrientationDecided:Z

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v2, v2, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->direction:I

    iput v2, p0, Lcom/android/camera/module/Panorama3Module;->mDirection:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/module/Panorama3Module;->mTimeTaken:J

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mOrientationCompensation:I

    iput v2, p0, Lcom/android/camera/module/Panorama3Module;->mDeviceOrientationAtCapture:I

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    iput-boolean v1, p0, Lcom/android/camera/module/Panorama3Module;->mCanSavePanorama:Z

    iput-boolean v1, p0, Lcom/android/camera/module/Panorama3Module;->mRequestStop:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/android/camera/module/Panorama3Module;->createDateStringForAppSeg(J)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mShutterStartTime:Ljava/lang/String;

    const-string v3, ""

    iput-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mShutterEndTime:Ljava/lang/String;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mDeviceLock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    iget-boolean v4, p0, Lcom/android/camera/module/Panorama3Module;->mAeLockSupported:Z

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v4, v2}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    :cond_1
    iget-boolean v4, p0, Lcom/android/camera/module/Panorama3Module;->mAwbLockSupported:Z

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v4, v2}, Lcom/android/camera2/Camera2Proxy;->setAWBLock(Z)V

    :cond_2
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v4

    iput-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mLocation:Landroid/location/Location;

    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v5, p0, Lcom/android/camera/module/Panorama3Module;->mLocation:Landroid/location/Location;

    invoke-virtual {v4, v5}, Lcom/android/camera2/Camera2Proxy;->setGpsLocation(Landroid/location/Location;)V

    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v5, p0, Lcom/android/camera/module/Panorama3Module;->mSnapshotFocusMode:I

    invoke-virtual {v4, v5}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->getJpegQuality(Z)I

    move-result v4

    iget-object v5, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v5, v4}, Lcom/android/camera2/Camera2Proxy;->setJpegQuality(I)V

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->getJpegThumbnailSize()Lcom/android/camera/CameraSize;

    move-result-object v4

    iget-object v5, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v5, v4}, Lcom/android/camera2/Camera2Proxy;->setJpegThumbnailSize(Lcom/android/camera/CameraSize;)V

    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v4, v2}, Lcom/android/camera2/Camera2Proxy;->setEnableZsl(Z)V

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2, v1}, Lcom/android/camera2/Camera2Proxy;->setNeedPausePreview(Z)V

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setShotType(I)V

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/16 v2, 0x64

    new-instance v4, Lcom/android/camera/module/Panorama3Module$3;

    invoke-direct {v4, p0}, Lcom/android/camera/module/Panorama3Module$3;-><init>(Lcom/android/camera/module/Panorama3Module;)V

    const/4 v5, 0x0

    invoke-virtual {v1, v2, v4, v5}, Lcom/android/camera2/Camera2Proxy;->captureBurstPictures(ILcom/android/camera2/Camera2Proxy$PictureCallback;Lcom/xiaomi/camera/core/ParallelCallback;)V

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->keepScreenOnAwhile()V

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onStart()V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaShootingStartTime:J

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->keepScreenOn()V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/AutoLockManager;->removeMessage()V

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public startPreview()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mDeviceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v1, :cond_0

    sget-object v1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v2, "startPreview: camera has been closed"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->checkDisplayOrientation()V

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mCameraDisplayOrientation:I

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setDisplayOrientation(I)V

    iget-boolean v1, p0, Lcom/android/camera/module/Panorama3Module;->mAeLockSupported:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    :cond_1
    iget-boolean v1, p0, Lcom/android/camera/module/Panorama3Module;->mAwbLockSupported:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setAWBLock(Z)V

    :cond_2
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mTargetFocusMode:I

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/camera/module/Panorama3Module;->setCameraState(I)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public startSession()V
    .locals 9

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_0

    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "startPreview: camera has been closed"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDualCamWaterMarkEnable(Z)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPreviewSize(Lcom/android/camera/CameraSize;)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setAlgorithmPreviewSize(Lcom/android/camera/CameraSize;)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureMaxImages(I)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureFormat(I)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceCreatedTimestamp()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/Panorama3Module;->mSurfaceCreatedTimestamp:J

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v3, Landroid/view/Surface;

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-direct {v3, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->getOperatingMode()I

    move-result v6

    const/4 v7, 0x0

    move-object v8, p0

    invoke-virtual/range {v2 .. v8}, Lcom/android/camera2/Camera2Proxy;->startPreviewSession(Landroid/view/Surface;ZZIZLcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    return-void
.end method

.method protected trackModeCustomInfo(I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0, p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackPictureTakenInPanorama(Landroid/content/Context;I)V

    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->unRegisterProtocol()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->detachAdditional()V

    :cond_0
    return-void
.end method
