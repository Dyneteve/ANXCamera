.class public Lcom/ss/android/vesdk/VECameraSettings;
.super Ljava/lang/Object;
.source "VECameraSettings.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/vesdk/VECameraSettings$Builder;,
        Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;,
        Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FLASH_MODE;,
        Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;,
        Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;,
        Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/ss/android/vesdk/VECameraSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPTION_FLAG_DEFAULT:B = 0x1t

.field public static final OPTION_FLAG_FPS_RANGE:B = 0x2t

.field public static final OPTION_FLAG_PICTURE_SIZE:B = 0x1t

.field public static final SCENE_MODE_ACTION:Ljava/lang/String; = "action"

.field public static final SCENE_MODE_AUTO:Ljava/lang/String; = "auto"

.field public static final SCENE_MODE_BARCODE:Ljava/lang/String; = "barcode"

.field public static final SCENE_MODE_BEACH:Ljava/lang/String; = "beach"

.field public static final SCENE_MODE_CANDLELIGHT:Ljava/lang/String; = "candlelight"

.field public static final SCENE_MODE_FIREWORKS:Ljava/lang/String; = "fireworks"

.field public static final SCENE_MODE_HDR:Ljava/lang/String; = "hdr"

.field public static final SCENE_MODE_LANDSCAPE:Ljava/lang/String; = "landscape"

.field public static final SCENE_MODE_NIGHT:Ljava/lang/String; = "night"

.field public static final SCENE_MODE_NIGHT_PORTRAIT:Ljava/lang/String; = "night-portrait"

.field public static final SCENE_MODE_PARTY:Ljava/lang/String; = "party"

.field public static final SCENE_MODE_PORTRAIT:Ljava/lang/String; = "portrait"

.field public static final SCENE_MODE_SNOW:Ljava/lang/String; = "snow"

.field public static final SCENE_MODE_SPORTS:Ljava/lang/String; = "sports"

.field public static final SCENE_MODE_STEADYPHOTO:Ljava/lang/String; = "steadyphoto"

.field public static final SCENE_MODE_SUNSET:Ljava/lang/String; = "sunset"

.field public static final SCENE_MODE_THEATRE:Ljava/lang/String; = "theatre"

.field public static final TAG:Ljava/lang/String;

.field public static final sCameraSceneMode:[Ljava/lang/String;


# instance fields
.field CameraHWLevelAndroid2TE:[I

.field CameraHWLevelTE2Android:[I

.field private mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

.field private mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

.field private mCaptureSize:Lcom/ss/android/vesdk/VESize;

.field private mFps:I

.field private mFpsRange:[I

.field private mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

.field private mOptionFlags:B

.field private mOutputMode:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;

.field private mPreviewSize:Lcom/ss/android/vesdk/VESize;

.field private mSceneMode:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 18

    const-class v0, Lcom/ss/android/vesdk/VECameraSettings;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/ss/android/vesdk/VECameraSettings;->TAG:Ljava/lang/String;

    const-string v1, "auto"

    const-string v2, "action"

    const-string v3, "barcode"

    const-string v4, "beach"

    const-string v5, "candlelight"

    const-string v6, "fireworks"

    const-string v7, "hdr"

    const-string v8, "landscape"

    const-string v9, "night"

    const-string v10, "night-portrait"

    const-string v11, "party"

    const-string v12, "portrait"

    const-string v13, "snow"

    const-string v14, "sports"

    const-string v15, "steadyphoto"

    const-string v16, "sunset"

    const-string v17, "theatre"

    filled-new-array/range {v1 .. v17}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/ss/android/vesdk/VECameraSettings;->sCameraSceneMode:[Ljava/lang/String;

    new-instance v0, Lcom/ss/android/vesdk/VECameraSettings$1;

    invoke-direct {v0}, Lcom/ss/android/vesdk/VECameraSettings$1;-><init>()V

    sput-object v0, Lcom/ss/android/vesdk/VECameraSettings;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>()V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    new-array v1, v0, [I

    fill-array-data v1, :array_0

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->CameraHWLevelTE2Android:[I

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->CameraHWLevelAndroid2TE:[I

    const/16 v0, 0x1e

    iput v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFps:I

    new-instance v1, Lcom/ss/android/vesdk/VESize;

    const/16 v2, 0x500

    const/16 v3, 0x2d0

    invoke-direct {v1, v3, v2}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    const/4 v1, 0x2

    new-array v1, v1, [I

    fill-array-data v1, :array_2

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFpsRange:[I

    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->CAMERA_HW_LEVEL_LEGACY:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;->TYPE1:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;->FACING_FRONT:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    const-string v1, "auto"

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mSceneMode:Ljava/lang/String;

    const/4 v1, 0x1

    iput-byte v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOptionFlags:B

    new-instance v1, Lcom/ss/android/vesdk/VESize;

    const/4 v4, -0x1

    invoke-direct {v1, v4, v4}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCaptureSize:Lcom/ss/android/vesdk/VESize;

    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;->SURFACE:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOutputMode:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;

    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;->TYPE1:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;->FACING_FRONT:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    iput v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFps:I

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    iput v3, v0, Lcom/ss/android/vesdk/VESize;->width:I

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    iput v2, v0, Lcom/ss/android/vesdk/VESize;->height:I

    return-void

    nop

    :array_0
    .array-data 4
        0x2
        0x0
        0x1
        0x3
    .end array-data

    :array_1
    .array-data 4
        0x1
        0x2
        0x0
        0x3
    .end array-data

    :array_2
    .array-data 4
        0x1e
        0x1e
    .end array-data
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    new-array v1, v0, [I

    fill-array-data v1, :array_0

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->CameraHWLevelTE2Android:[I

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->CameraHWLevelAndroid2TE:[I

    const/16 v0, 0x1e

    iput v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFps:I

    new-instance v0, Lcom/ss/android/vesdk/VESize;

    const/16 v1, 0x2d0

    const/16 v2, 0x500

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_2

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFpsRange:[I

    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->CAMERA_HW_LEVEL_LEGACY:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;->TYPE1:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;->FACING_FRONT:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    const-string v0, "auto"

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mSceneMode:Ljava/lang/String;

    const/4 v0, 0x1

    iput-byte v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOptionFlags:B

    new-instance v0, Lcom/ss/android/vesdk/VESize;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCaptureSize:Lcom/ss/android/vesdk/VESize;

    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;->SURFACE:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOutputMode:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;

    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->CameraHWLevelTE2Android:[I

    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->CameraHWLevelAndroid2TE:[I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFps:I

    const-class v0, Lcom/ss/android/vesdk/VESize;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/ss/android/vesdk/VESize;

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFpsRange:[I

    const-class v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    const-class v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    const-class v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mSceneMode:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    iput-byte v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOptionFlags:B

    const-class v0, Lcom/ss/android/vesdk/VESize;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/ss/android/vesdk/VESize;

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCaptureSize:Lcom/ss/android/vesdk/VESize;

    const-class v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;

    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOutputMode:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;

    return-void

    nop

    :array_0
    .array-data 4
        0x2
        0x0
        0x1
        0x3
    .end array-data

    :array_1
    .array-data 4
        0x1
        0x2
        0x0
        0x3
    .end array-data

    :array_2
    .array-data 4
        0x1e
        0x1e
    .end array-data
.end method

.method synthetic constructor <init>(Lcom/ss/android/vesdk/VECameraSettings$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/ss/android/vesdk/VECameraSettings;-><init>()V

    return-void
.end method

.method static synthetic access$1002(Lcom/ss/android/vesdk/VECameraSettings;Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOutputMode:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;

    return-object p1
.end method

.method static synthetic access$102(Lcom/ss/android/vesdk/VECameraSettings;Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    return-object p1
.end method

.method static synthetic access$200(Lcom/ss/android/vesdk/VECameraSettings;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;
    .locals 0

    iget-object p0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    return-object p0
.end method

.method static synthetic access$202(Lcom/ss/android/vesdk/VECameraSettings;Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    return-object p1
.end method

.method static synthetic access$302(Lcom/ss/android/vesdk/VECameraSettings;Lcom/ss/android/vesdk/VESize;)Lcom/ss/android/vesdk/VESize;
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    return-object p1
.end method

.method static synthetic access$402(Lcom/ss/android/vesdk/VECameraSettings;I)I
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFps:I

    return p1
.end method

.method static synthetic access$500(Lcom/ss/android/vesdk/VECameraSettings;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;
    .locals 0

    iget-object p0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    return-object p0
.end method

.method static synthetic access$502(Lcom/ss/android/vesdk/VECameraSettings;Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    return-object p1
.end method

.method static synthetic access$602(Lcom/ss/android/vesdk/VECameraSettings;[I)[I
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFpsRange:[I

    return-object p1
.end method

.method static synthetic access$702(Lcom/ss/android/vesdk/VECameraSettings;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mSceneMode:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$802(Lcom/ss/android/vesdk/VECameraSettings;B)B
    .locals 0

    iput-byte p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOptionFlags:B

    return p1
.end method

.method static synthetic access$902(Lcom/ss/android/vesdk/VECameraSettings;Lcom/ss/android/vesdk/VESize;)Lcom/ss/android/vesdk/VESize;
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCaptureSize:Lcom/ss/android/vesdk/VESize;

    return-object p1
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getCameraFacing()Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    return-object v0
.end method

.method public getCameraType()Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    return-object v0
.end method

.method public getCaptureSize()Lcom/ss/android/vesdk/VESize;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCaptureSize:Lcom/ss/android/vesdk/VESize;

    return-object v0
.end method

.method public getFps()I
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFps:I

    return v0
.end method

.method public getFpsRange()[I
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFpsRange:[I

    return-object v0
.end method

.method public getHwLevel()Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    return-object v0
.end method

.method public getOptionFlag()B
    .locals 1

    iget-byte v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOptionFlags:B

    return v0
.end method

.method public getOutputMode()Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOutputMode:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;

    return-object v0
.end method

.method getPreviewSize()Lcom/ss/android/vesdk/VESize;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    return-object v0
.end method

.method public getSceneMode()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mSceneMode:Ljava/lang/String;

    return-object v0
.end method

.method public setCameraFacing(Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    return-void
.end method

.method public setCameraType(Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    return-void
.end method

.method public setFps(I)V
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFps:I

    return-void
.end method

.method public setFpsRange([I)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFpsRange:[I

    return-void
.end method

.method public setHwLevel(Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    return-void
.end method

.method public setOptionFlag(B)V
    .locals 0

    iput-byte p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOptionFlags:B

    return-void
.end method

.method public setPreviewSize(II)V
    .locals 1

    new-instance v0, Lcom/ss/android/vesdk/VESize;

    invoke-direct {v0, p1, p2}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    return-void
.end method

.method public setSceneMode(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mSceneMode:Ljava/lang/String;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->CameraHWLevelTE2Android:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->CameraHWLevelAndroid2TE:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    iget v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFps:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFpsRange:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mSceneMode:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-byte v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOptionFlags:B

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCaptureSize:Lcom/ss/android/vesdk/VESize;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOutputMode:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    return-void
.end method
