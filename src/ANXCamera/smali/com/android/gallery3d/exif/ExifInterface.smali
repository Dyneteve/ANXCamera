.class public Lcom/android/gallery3d/exif/ExifInterface;
.super Ljava/lang/Object;
.source "ExifInterface.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/gallery3d/exif/ExifInterface$GpsDifferential;,
        Lcom/android/gallery3d/exif/ExifInterface$GpsTrackRef;,
        Lcom/android/gallery3d/exif/ExifInterface$GpsSpeedRef;,
        Lcom/android/gallery3d/exif/ExifInterface$GpsMeasureMode;,
        Lcom/android/gallery3d/exif/ExifInterface$GpsStatus;,
        Lcom/android/gallery3d/exif/ExifInterface$GpsAltitudeRef;,
        Lcom/android/gallery3d/exif/ExifInterface$GpsLongitudeRef;,
        Lcom/android/gallery3d/exif/ExifInterface$GpsLatitudeRef;,
        Lcom/android/gallery3d/exif/ExifInterface$SubjectDistance;,
        Lcom/android/gallery3d/exif/ExifInterface$Sharpness;,
        Lcom/android/gallery3d/exif/ExifInterface$Saturation;,
        Lcom/android/gallery3d/exif/ExifInterface$Contrast;,
        Lcom/android/gallery3d/exif/ExifInterface$GainControl;,
        Lcom/android/gallery3d/exif/ExifInterface$SceneType;,
        Lcom/android/gallery3d/exif/ExifInterface$FileSource;,
        Lcom/android/gallery3d/exif/ExifInterface$SensingMethod;,
        Lcom/android/gallery3d/exif/ExifInterface$LightSource;,
        Lcom/android/gallery3d/exif/ExifInterface$ComponentsConfiguration;,
        Lcom/android/gallery3d/exif/ExifInterface$SceneCapture;,
        Lcom/android/gallery3d/exif/ExifInterface$WhiteBalance;,
        Lcom/android/gallery3d/exif/ExifInterface$ExposureMode;,
        Lcom/android/gallery3d/exif/ExifInterface$ColorSpace;,
        Lcom/android/gallery3d/exif/ExifInterface$Flash;,
        Lcom/android/gallery3d/exif/ExifInterface$MeteringMode;,
        Lcom/android/gallery3d/exif/ExifInterface$ExposureProgram;,
        Lcom/android/gallery3d/exif/ExifInterface$PlanarConfiguration;,
        Lcom/android/gallery3d/exif/ExifInterface$PhotometricInterpretation;,
        Lcom/android/gallery3d/exif/ExifInterface$ResolutionUnit;,
        Lcom/android/gallery3d/exif/ExifInterface$Compression;,
        Lcom/android/gallery3d/exif/ExifInterface$YCbCrPositioning;,
        Lcom/android/gallery3d/exif/ExifInterface$ExifOrientationFlag;
    }
.end annotation


# static fields
.field private static final DATETIME_FORMAT_STR:Ljava/lang/String; = "yyyy:MM:dd kk:mm:ss"

.field public static final DEFAULT_BYTE_ORDER:Ljava/nio/ByteOrder;

.field public static final DEFINITION_NULL:I = 0x0

.field private static final GPS_DATE_FORMAT_STR:Ljava/lang/String; = "yyyy:MM:dd"

.field public static final IFD_NULL:I = -0x1

.field private static final NULL_ARGUMENT_STRING:Ljava/lang/String; = "Argument is null"

.field protected static final TAG:Ljava/lang/String;

.field public static final TAG_AI_TYPE:I

.field public static final TAG_ALGORITHM_COMMENT:I

.field public static final TAG_APERTURE_VALUE:I

.field public static final TAG_ARTIST:I

.field public static final TAG_BITS_PER_SAMPLE:I

.field public static final TAG_BRIGHTNESS_VALUE:I

.field public static final TAG_CFA_PATTERN:I

.field public static final TAG_COLOR_SPACE:I

.field public static final TAG_COMPONENTS_CONFIGURATION:I

.field public static final TAG_COMPRESSED_BITS_PER_PIXEL:I

.field public static final TAG_COMPRESSION:I

.field public static final TAG_CONTRAST:I

.field public static final TAG_COPYRIGHT:I

.field public static final TAG_CUSTOM_RENDERED:I

.field public static final TAG_DATE_TIME:I

.field public static final TAG_DATE_TIME_DIGITIZED:I

.field public static final TAG_DATE_TIME_ORIGINAL:I

.field public static final TAG_DEPTH_MAP_BLUR_LEVEL:I

.field public static final TAG_DEPTH_MAP_DULCAMERA_WATER_MARK:I

.field public static final TAG_DEPTH_MAP_FOCUS_POINT:I

.field public static final TAG_DEPTH_MAP_TIME_WATER_MARK:I

.field public static final TAG_DEVICE_SETTING_DESCRIPTION:I

.field public static final TAG_DIGITAL_ZOOM_RATIO:I

.field public static final TAG_EXIF_IFD:I

.field public static final TAG_EXIF_VERSION:I

.field public static final TAG_EXPOSURE_BIAS_VALUE:I

.field public static final TAG_EXPOSURE_INDEX:I

.field public static final TAG_EXPOSURE_MODE:I

.field public static final TAG_EXPOSURE_PROGRAM:I

.field public static final TAG_EXPOSURE_TIME:I

.field public static final TAG_FILE_SOURCE:I

.field public static final TAG_FLASH:I

.field public static final TAG_FLASHPIX_VERSION:I

.field public static final TAG_FLASH_ENERGY:I

.field public static final TAG_FOCAL_LENGTH:I

.field public static final TAG_FOCAL_LENGTH_IN_35_MM_FILE:I

.field public static final TAG_FOCAL_PLANE_RESOLUTION_UNIT:I

.field public static final TAG_FOCAL_PLANE_X_RESOLUTION:I

.field public static final TAG_FOCAL_PLANE_Y_RESOLUTION:I

.field public static final TAG_FRONT_MIRROR:I

.field public static final TAG_F_NUMBER:I

.field public static final TAG_GAIN_CONTROL:I

.field public static final TAG_GPS_ALTITUDE:I

.field public static final TAG_GPS_ALTITUDE_REF:I

.field public static final TAG_GPS_AREA_INFORMATION:I

.field public static final TAG_GPS_DATE_STAMP:I

.field public static final TAG_GPS_DEST_BEARING:I

.field public static final TAG_GPS_DEST_BEARING_REF:I

.field public static final TAG_GPS_DEST_DISTANCE:I

.field public static final TAG_GPS_DEST_DISTANCE_REF:I

.field public static final TAG_GPS_DEST_LATITUDE:I

.field public static final TAG_GPS_DEST_LATITUDE_REF:I

.field public static final TAG_GPS_DEST_LONGITUDE:I

.field public static final TAG_GPS_DEST_LONGITUDE_REF:I

.field public static final TAG_GPS_DIFFERENTIAL:I

.field public static final TAG_GPS_DOP:I

.field public static final TAG_GPS_IFD:I

.field public static final TAG_GPS_IMG_DIRECTION:I

.field public static final TAG_GPS_IMG_DIRECTION_REF:I

.field public static final TAG_GPS_LATITUDE:I

.field public static final TAG_GPS_LATITUDE_REF:I

.field public static final TAG_GPS_LONGITUDE:I

.field public static final TAG_GPS_LONGITUDE_REF:I

.field public static final TAG_GPS_MAP_DATUM:I

.field public static final TAG_GPS_MEASURE_MODE:I

.field public static final TAG_GPS_PROCESSING_METHOD:I

.field public static final TAG_GPS_SATTELLITES:I

.field public static final TAG_GPS_SPEED:I

.field public static final TAG_GPS_SPEED_REF:I

.field public static final TAG_GPS_STATUS:I

.field public static final TAG_GPS_TIME_STAMP:I

.field public static final TAG_GPS_TRACK:I

.field public static final TAG_GPS_TRACK_REF:I

.field public static final TAG_GPS_VERSION_ID:I

.field public static final TAG_IMAGE_DESCRIPTION:I

.field public static final TAG_IMAGE_LENGTH:I

.field public static final TAG_IMAGE_UNIQUE_ID:I

.field public static final TAG_IMAGE_WIDTH:I

.field public static final TAG_INTEROPERABILITY_IFD:I

.field public static final TAG_INTEROPERABILITY_INDEX:I

.field public static final TAG_ISO_SPEED_RATINGS:I

.field public static final TAG_JPEG_INTERCHANGE_FORMAT:I

.field public static final TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

.field public static final TAG_LIGHT_SOURCE:I

.field public static final TAG_MAKE:I

.field public static final TAG_MAKER_NOTE:I

.field public static final TAG_MAX_APERTURE_VALUE:I

.field public static final TAG_METERING_MODE:I

.field public static final TAG_MODEL:I

.field public static final TAG_NULL:I = -0x1

.field public static final TAG_OECF:I

.field public static final TAG_ORIENTATION:I

.field public static final TAG_PARALLEL_PROCESS_COMMENT:I

.field public static final TAG_PHOTOMETRIC_INTERPRETATION:I

.field public static final TAG_PIXEL_X_DIMENSION:I

.field public static final TAG_PIXEL_Y_DIMENSION:I

.field public static final TAG_PLANAR_CONFIGURATION:I

.field public static final TAG_PORTRAIT_LIGHTING_PATTERN:I

.field public static final TAG_PRIMARY_CHROMATICITIES:I

.field public static final TAG_REFERENCE_BLACK_WHITE:I

.field public static final TAG_RELATED_SOUND_FILE:I

.field public static final TAG_RESOLUTION_UNIT:I

.field public static final TAG_ROWS_PER_STRIP:I

.field public static final TAG_SAMPLES_PER_PIXEL:I

.field public static final TAG_SATURATION:I

.field public static final TAG_SCENE_CAPTURE_TYPE:I

.field public static final TAG_SCENE_TYPE:I

.field public static final TAG_SENSING_METHOD:I

.field public static final TAG_SHARPNESS:I

.field public static final TAG_SHUTTER_SPEED_VALUE:I

.field public static final TAG_SOFTWARE:I

.field public static final TAG_SPATIAL_FREQUENCY_RESPONSE:I

.field public static final TAG_SPECTRAL_SENSITIVITY:I

.field public static final TAG_STRIP_BYTE_COUNTS:I

.field public static final TAG_STRIP_OFFSETS:I

.field public static final TAG_SUBJECT_AREA:I

.field public static final TAG_SUBJECT_DISTANCE:I

.field public static final TAG_SUBJECT_DISTANCE_RANGE:I

.field public static final TAG_SUBJECT_LOCATION:I

.field public static final TAG_SUB_SEC_TIME:I

.field public static final TAG_SUB_SEC_TIME_DIGITIZED:I

.field public static final TAG_SUB_SEC_TIME_ORIGINAL:I

.field public static final TAG_TRANSFER_FUNCTION:I

.field public static final TAG_USER_COMMENT:I

.field public static final TAG_WHITE_BALANCE:I

.field public static final TAG_WHITE_POINT:I

.field public static final TAG_XIAOMI_COMMENT:I

.field public static final TAG_XIAOMI_DEPTHMAP_VERSION:I

.field public static final TAG_XIAOMI_LIVESHOT_PHOTO:I

.field public static final TAG_X_RESOLUTION:I

.field public static final TAG_Y_CB_CR_COEFFICIENTS:I

.field public static final TAG_Y_CB_CR_POSITIONING:I

.field public static final TAG_Y_CB_CR_SUB_SAMPLING:I

.field public static final TAG_Y_RESOLUTION:I

.field protected static sBannedDefines:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Short;",
            ">;"
        }
    .end annotation
.end field

.field private static sOffsetTags:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Short;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mData:Lcom/android/gallery3d/exif/ExifData;

.field private final mDateTimeStampFormat:Ljava/text/DateFormat;

.field private final mGPSDateStampFormat:Ljava/text/DateFormat;

.field private final mGPSTimeStampCalendar:Ljava/util/Calendar;

.field private mTagInfo:Landroid/util/SparseIntArray;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-class v0, Lcom/android/gallery3d/exif/ExifInterface;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG:Ljava/lang/String;

    const/4 v0, 0x0

    const/16 v1, 0x100

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_WIDTH:I

    const/16 v1, 0x101

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_LENGTH:I

    const/16 v1, 0x102

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_BITS_PER_SAMPLE:I

    const/16 v1, 0x103

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COMPRESSION:I

    const/16 v1, 0x106

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PHOTOMETRIC_INTERPRETATION:I

    const/16 v1, 0x10e

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_DESCRIPTION:I

    const/16 v1, 0x10f

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_MAKE:I

    const/16 v1, 0x110

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_MODEL:I

    const/16 v1, 0x111

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_OFFSETS:I

    const/16 v1, 0x112

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ORIENTATION:I

    const/16 v1, 0x115

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SAMPLES_PER_PIXEL:I

    const/16 v1, 0x116

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ROWS_PER_STRIP:I

    const/16 v1, 0x117

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_BYTE_COUNTS:I

    const/16 v1, 0x11a

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_X_RESOLUTION:I

    const/16 v1, 0x11b

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_Y_RESOLUTION:I

    const/16 v1, 0x11c

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PLANAR_CONFIGURATION:I

    const/16 v1, 0x128

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_RESOLUTION_UNIT:I

    const/16 v1, 0x12d

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_TRANSFER_FUNCTION:I

    const/16 v1, 0x131

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SOFTWARE:I

    const/16 v1, 0x132

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DATE_TIME:I

    const/16 v1, 0x13b

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ARTIST:I

    const/16 v1, 0x13e

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_WHITE_POINT:I

    const/16 v1, 0x13f

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PRIMARY_CHROMATICITIES:I

    const/16 v1, 0x211

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_Y_CB_CR_COEFFICIENTS:I

    const/16 v1, 0x212

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_Y_CB_CR_SUB_SAMPLING:I

    const/16 v1, 0x213

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_Y_CB_CR_POSITIONING:I

    const/16 v1, 0x214

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_REFERENCE_BLACK_WHITE:I

    const/16 v1, -0x7d68

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COPYRIGHT:I

    const/16 v1, -0x7897

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXIF_IFD:I

    const/16 v1, -0x77db

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_IFD:I

    const/4 v1, 0x1

    const/16 v2, 0x201

    invoke-static {v1, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    const/16 v2, 0x202

    invoke-static {v1, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

    const/4 v2, 0x2

    const/16 v3, -0x7d66

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_TIME:I

    const/16 v3, -0x7d63

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_F_NUMBER:I

    const/16 v3, -0x77de

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_PROGRAM:I

    const/16 v3, -0x77dc

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SPECTRAL_SENSITIVITY:I

    const/16 v3, -0x77d9

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ISO_SPEED_RATINGS:I

    const/16 v3, -0x77d8

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_OECF:I

    const/16 v3, -0x7000

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXIF_VERSION:I

    const/16 v3, -0x6ffd

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DATE_TIME_ORIGINAL:I

    const/16 v3, -0x6ffc

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DATE_TIME_DIGITIZED:I

    const/16 v3, -0x6eff

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COMPONENTS_CONFIGURATION:I

    const/16 v3, -0x6efe

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COMPRESSED_BITS_PER_PIXEL:I

    const/16 v3, -0x6dff

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SHUTTER_SPEED_VALUE:I

    const/16 v3, -0x6dfe

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_APERTURE_VALUE:I

    const/16 v3, -0x6dfd

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_BRIGHTNESS_VALUE:I

    const/16 v3, -0x6dfc

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_BIAS_VALUE:I

    const/16 v3, -0x6dfb

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_MAX_APERTURE_VALUE:I

    const/16 v3, -0x6dfa

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUBJECT_DISTANCE:I

    const/16 v3, -0x6df9

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_METERING_MODE:I

    const/16 v3, -0x6df8

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_LIGHT_SOURCE:I

    const/16 v3, -0x6df7

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FLASH:I

    const/16 v3, -0x6df6

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_LENGTH:I

    const/16 v3, -0x6dec

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUBJECT_AREA:I

    const/16 v3, -0x6d84

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_MAKER_NOTE:I

    const/16 v3, -0x6d7a

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_USER_COMMENT:I

    const/16 v3, -0x6d70

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUB_SEC_TIME:I

    const/16 v3, -0x6d6f

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUB_SEC_TIME_ORIGINAL:I

    const/16 v3, -0x6d6e

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUB_SEC_TIME_DIGITIZED:I

    const/16 v3, -0x6000

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FLASHPIX_VERSION:I

    const/16 v3, -0x5fff

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COLOR_SPACE:I

    const/16 v3, -0x5ffe

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PIXEL_X_DIMENSION:I

    const/16 v3, -0x5ffd

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PIXEL_Y_DIMENSION:I

    const/16 v3, -0x5ffc

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_RELATED_SOUND_FILE:I

    const/16 v3, -0x5ffb

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_INTEROPERABILITY_IFD:I

    const/16 v3, -0x5df5

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FLASH_ENERGY:I

    const/16 v3, -0x5df4

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SPATIAL_FREQUENCY_RESPONSE:I

    const/16 v3, -0x5df2

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_PLANE_X_RESOLUTION:I

    const/16 v3, -0x5df1

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_PLANE_Y_RESOLUTION:I

    const/16 v3, -0x5df0

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_PLANE_RESOLUTION_UNIT:I

    const/16 v3, -0x5dec

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUBJECT_LOCATION:I

    const/16 v3, -0x5deb

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_INDEX:I

    const/16 v3, -0x5de9

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SENSING_METHOD:I

    const/16 v3, -0x5d00

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FILE_SOURCE:I

    const/16 v3, -0x5cff

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SCENE_TYPE:I

    const/16 v3, -0x5cfe

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_CFA_PATTERN:I

    const/16 v3, -0x5bff

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_CUSTOM_RENDERED:I

    const/16 v3, -0x5bfe

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_MODE:I

    const/16 v3, -0x5bfd

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_WHITE_BALANCE:I

    const/16 v3, -0x5bfc

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DIGITAL_ZOOM_RATIO:I

    const/16 v3, -0x5bfb

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_LENGTH_IN_35_MM_FILE:I

    const/16 v3, -0x5bfa

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SCENE_CAPTURE_TYPE:I

    const/16 v3, -0x5bf9

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GAIN_CONTROL:I

    const/16 v3, -0x5bf8

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_CONTRAST:I

    const/16 v3, -0x5bf7

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SATURATION:I

    const/16 v3, -0x5bf6

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SHARPNESS:I

    const/16 v3, -0x5bf5

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEVICE_SETTING_DESCRIPTION:I

    const/16 v3, -0x5bf4

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUBJECT_DISTANCE_RANGE:I

    const/16 v3, -0x5be0

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_UNIQUE_ID:I

    const/16 v3, -0x7778

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PARALLEL_PROCESS_COMMENT:I

    const/16 v3, -0x7777

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ALGORITHM_COMMENT:I

    const/16 v3, -0x7770

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_FOCUS_POINT:I

    const/16 v3, -0x776f

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_BLUR_LEVEL:I

    const/16 v3, -0x776e

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_DULCAMERA_WATER_MARK:I

    const/16 v3, -0x776d

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_TIME_WATER_MARK:I

    const/16 v3, -0x776c

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PORTRAIT_LIGHTING_PATTERN:I

    const/16 v3, -0x776b

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_AI_TYPE:I

    const/16 v3, -0x776a

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FRONT_MIRROR:I

    const/16 v3, -0x7769

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_XIAOMI_LIVESHOT_PHOTO:I

    const/16 v3, -0x7768

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_XIAOMI_DEPTHMAP_VERSION:I

    const/16 v3, -0x6667

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v3

    sput v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_XIAOMI_COMMENT:I

    const/4 v3, 0x4

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_VERSION_ID:I

    invoke-static {v3, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LATITUDE_REF:I

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LATITUDE:I

    const/4 v0, 0x3

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LONGITUDE_REF:I

    invoke-static {v3, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LONGITUDE:I

    const/4 v2, 0x5

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_ALTITUDE_REF:I

    const/4 v2, 0x6

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_ALTITUDE:I

    const/4 v2, 0x7

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_TIME_STAMP:I

    const/16 v2, 0x8

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_SATTELLITES:I

    const/16 v2, 0x9

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_STATUS:I

    const/16 v2, 0xa

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_MEASURE_MODE:I

    const/16 v2, 0xb

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DOP:I

    const/16 v2, 0xc

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_SPEED_REF:I

    const/16 v2, 0xd

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_SPEED:I

    const/16 v2, 0xe

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_TRACK_REF:I

    const/16 v2, 0xf

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_TRACK:I

    const/16 v2, 0x10

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_IMG_DIRECTION_REF:I

    const/16 v2, 0x11

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_IMG_DIRECTION:I

    const/16 v2, 0x12

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_MAP_DATUM:I

    const/16 v2, 0x13

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_LATITUDE_REF:I

    const/16 v2, 0x14

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_LATITUDE:I

    const/16 v2, 0x15

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_LONGITUDE_REF:I

    const/16 v2, 0x16

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_LONGITUDE:I

    const/16 v2, 0x17

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_BEARING_REF:I

    const/16 v2, 0x18

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_BEARING:I

    const/16 v2, 0x19

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_DISTANCE_REF:I

    const/16 v2, 0x1a

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_DISTANCE:I

    const/16 v2, 0x1b

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_PROCESSING_METHOD:I

    const/16 v2, 0x1c

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_AREA_INFORMATION:I

    const/16 v2, 0x1d

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DATE_STAMP:I

    const/16 v2, 0x1e

    invoke-static {v3, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v2

    sput v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DIFFERENTIAL:I

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_INTEROPERABILITY_INDEX:I

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sOffsetTags:Ljava/util/HashSet;

    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sOffsetTags:Ljava/util/HashSet;

    sget v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_IFD:I

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sOffsetTags:Ljava/util/HashSet;

    sget v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXIF_IFD:I

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sOffsetTags:Ljava/util/HashSet;

    sget v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sOffsetTags:Ljava/util/HashSet;

    sget v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_INTEROPERABILITY_IFD:I

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sOffsetTags:Ljava/util/HashSet;

    sget v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_OFFSETS:I

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v0, Ljava/util/HashSet;

    sget-object v1, Lcom/android/gallery3d/exif/ExifInterface;->sOffsetTags:Ljava/util/HashSet;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sBannedDefines:Ljava/util/HashSet;

    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sBannedDefines:Ljava/util/HashSet;

    const/4 v1, -0x1

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sBannedDefines:Ljava/util/HashSet;

    sget v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sBannedDefines:Ljava/util/HashSet;

    sget v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_BYTE_COUNTS:I

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    sput-object v0, Lcom/android/gallery3d/exif/ExifInterface;->DEFAULT_BYTE_ORDER:Ljava/nio/ByteOrder;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/android/gallery3d/exif/ExifData;

    sget-object v1, Lcom/android/gallery3d/exif/ExifInterface;->DEFAULT_BYTE_ORDER:Ljava/nio/ByteOrder;

    invoke-direct {v0, v1}, Lcom/android/gallery3d/exif/ExifData;-><init>(Ljava/nio/ByteOrder;)V

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyy:MM:dd kk:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mDateTimeStampFormat:Ljava/text/DateFormat;

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyy:MM:dd"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mGPSDateStampFormat:Ljava/text/DateFormat;

    const-string v0, "UTC"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mGPSTimeStampCalendar:Ljava/util/Calendar;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mGPSDateStampFormat:Ljava/text/DateFormat;

    const-string v1, "UTC"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    return-void
.end method

.method private addExifTag(ILjava/lang/Object;)Z
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->buildTag(ILjava/lang/Object;)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    const/4 p1, 0x1

    return p1
.end method

.method public static addXiaomiComment([BLjava/lang/String;)[B
    .locals 5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    nop

    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    :try_start_0
    new-instance v3, Lcom/android/gallery3d/exif/ExifInterface;

    invoke-direct {v3}, Lcom/android/gallery3d/exif/ExifInterface;-><init>()V

    invoke-virtual {v3, p0}, Lcom/android/gallery3d/exif/ExifInterface;->readExif([B)V

    invoke-virtual {v3, p1}, Lcom/android/gallery3d/exif/ExifInterface;->addXiaomiComment(Ljava/lang/String;)Z

    invoke-virtual {v3, p0, v2}, Lcom/android/gallery3d/exif/ExifInterface;->writeExif([BLjava/io/OutputStream;)V

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    move-object p0, p1

    goto :goto_0

    :catch_0
    move-exception p1

    const-class v2, Lcom/android/gallery3d/exif/ExifInterface;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    nop

    :goto_0
    sget-object p1, Lcom/android/gallery3d/exif/ExifInterface;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "addXiaomiComment cost="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v0

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-object p0
.end method

.method protected static closeSilently(Ljava/io/Closeable;)V
    .locals 0

    if-eqz p0, :cond_0

    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    :cond_0
    :goto_0
    return-void
.end method

.method public static convertLatOrLongToDouble([Lcom/android/gallery3d/exif/Rational;Ljava/lang/String;)D
    .locals 8

    const/4 v0, 0x0

    :try_start_0
    aget-object v0, p0, v0

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/Rational;->toDouble()D

    move-result-wide v0

    const/4 v2, 0x1

    aget-object v2, p0, v2

    invoke-virtual {v2}, Lcom/android/gallery3d/exif/Rational;->toDouble()D

    move-result-wide v2

    const/4 v4, 0x2

    aget-object p0, p0, v4

    invoke-virtual {p0}, Lcom/android/gallery3d/exif/Rational;->toDouble()D

    move-result-wide v4

    const-wide/high16 v6, 0x404e000000000000L    # 60.0

    div-double/2addr v2, v6

    add-double/2addr v0, v2

    const-wide v2, 0x40ac200000000000L    # 3600.0

    div-double/2addr v4, v2

    add-double/2addr v0, v4

    const-string p0, "S"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    const-string p0, "W"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    return-wide v0

    :cond_1
    :goto_0
    neg-double p0, v0

    return-wide p0

    :catch_0
    move-exception p0

    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0
.end method

.method public static defineTag(IS)I
    .locals 1

    const v0, 0xffff

    and-int/2addr p1, v0

    shl-int/lit8 p0, p0, 0x10

    or-int/2addr p0, p1

    return p0
.end method

.method private doExifStreamIO(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x400

    new-array v1, v0, [B

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    :goto_0
    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    invoke-virtual {p2, v1, v2, v3}, Ljava/io/OutputStream;->write([BII)V

    invoke-virtual {p1, v1, v2, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected static getAllowedIfdFlagsFromInfo(I)I
    .locals 0

    ushr-int/lit8 p0, p0, 0x18

    return p0
.end method

.method protected static getAllowedIfdsFromInfo(I)[I
    .locals 6

    invoke-static {p0}, Lcom/android/gallery3d/exif/ExifInterface;->getAllowedIfdFlagsFromInfo(I)I

    move-result p0

    invoke-static {}, Lcom/android/gallery3d/exif/IfdData;->getIfds()[I

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    const/4 v4, 0x5

    if-ge v3, v4, :cond_1

    shr-int v4, p0, v3

    const/4 v5, 0x1

    and-int/2addr v4, v5

    if-ne v4, v5, :cond_0

    aget v4, v0, v3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-gtz p0, :cond_2

    const/4 p0, 0x0

    return-object p0

    :cond_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p0

    new-array p0, p0, [I

    nop

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v3, v2, 0x1

    aput v1, p0, v2

    nop

    move v2, v3

    goto :goto_1

    :cond_3
    return-object p0
.end method

.method protected static getComponentCountFromInfo(I)I
    .locals 1

    const v0, 0xffff

    and-int/2addr p0, v0

    return p0
.end method

.method public static getExif([B)Lcom/android/gallery3d/exif/ExifInterface;
    .locals 3

    new-instance v0, Lcom/android/gallery3d/exif/ExifInterface;

    invoke-direct {v0}, Lcom/android/gallery3d/exif/ExifInterface;-><init>()V

    :try_start_0
    invoke-virtual {v0, p0}, Lcom/android/gallery3d/exif/ExifInterface;->readExif([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    sget-object v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG:Ljava/lang/String;

    const-string v2, "Failed to read EXIF data"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-object v0
.end method

.method public static getExifOrientationValue(I)S
    .locals 1

    rem-int/lit16 p0, p0, 0x168

    if-gez p0, :cond_0

    add-int/lit16 p0, p0, 0x168

    :cond_0
    const/16 v0, 0x5a

    if-ge p0, v0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/16 v0, 0xb4

    if-ge p0, v0, :cond_2

    const/4 p0, 0x6

    return p0

    :cond_2
    const/16 v0, 0x10e

    if-ge p0, v0, :cond_3

    const/4 p0, 0x3

    return p0

    :cond_3
    const/16 p0, 0x8

    return p0
.end method

.method protected static getFlagsFromAllowedIfds([I)I
    .locals 8

    const/4 v0, 0x0

    if-eqz p0, :cond_4

    array-length v1, p0

    if-nez v1, :cond_0

    goto :goto_3

    :cond_0
    nop

    invoke-static {}, Lcom/android/gallery3d/exif/IfdData;->getIfds()[I

    move-result-object v1

    move v2, v0

    move v3, v2

    :goto_0
    const/4 v4, 0x5

    if-ge v2, v4, :cond_3

    array-length v4, p0

    move v5, v0

    :goto_1
    if-ge v5, v4, :cond_2

    aget v6, p0, v5

    aget v7, v1, v2

    if-ne v7, v6, :cond_1

    const/4 v4, 0x1

    shl-int/2addr v4, v2

    or-int/2addr v3, v4

    goto :goto_2

    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_2
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return v3

    :cond_4
    :goto_3
    return v0
.end method

.method public static getImageHeight(Lcom/android/gallery3d/exif/ExifInterface;)I
    .locals 1

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_LENGTH:I

    invoke-virtual {p0, v0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagIntValue(I)Ljava/lang/Integer;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0
.end method

.method public static getImageWidth(Lcom/android/gallery3d/exif/ExifInterface;)I
    .locals 1

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_WIDTH:I

    invoke-virtual {p0, v0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagIntValue(I)Ljava/lang/Integer;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0
.end method

.method public static getOrientation(Lcom/android/gallery3d/exif/ExifInterface;)I
    .locals 1

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ORIENTATION:I

    invoke-virtual {p0, v0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagIntValue(I)Ljava/lang/Integer;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Integer;->shortValue()S

    move-result p0

    invoke-static {p0}, Lcom/android/gallery3d/exif/ExifInterface;->getRotationForOrientationValue(S)I

    move-result p0

    return p0
.end method

.method public static getRotationForOrientationValue(S)I
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eq p0, v0, :cond_3

    const/4 v0, 0x3

    if-eq p0, v0, :cond_2

    const/4 v0, 0x6

    if-eq p0, v0, :cond_1

    const/16 v0, 0x8

    if-eq p0, v0, :cond_0

    return v1

    :cond_0
    const/16 p0, 0x10e

    return p0

    :cond_1
    const/16 p0, 0x5a

    return p0

    :cond_2
    const/16 p0, 0xb4

    return p0

    :cond_3
    return v1
.end method

.method public static getTrueIfd(I)I
    .locals 0

    ushr-int/lit8 p0, p0, 0x10

    return p0
.end method

.method public static getTrueTagKey(I)S
    .locals 0

    int-to-short p0, p0

    return p0
.end method

.method protected static getTypeFromInfo(I)S
    .locals 0

    shr-int/lit8 p0, p0, 0x10

    and-int/lit16 p0, p0, 0xff

    int-to-short p0, p0

    return p0
.end method

.method private initTagInfo()V
    .locals 19

    move-object/from16 v0, p0

    const/4 v1, 0x2

    new-array v2, v1, [I

    fill-array-data v2, :array_0

    invoke-static {v2}, Lcom/android/gallery3d/exif/ExifInterface;->getFlagsFromAllowedIfds([I)I

    move-result v2

    shl-int/lit8 v2, v2, 0x18

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_MAKE:I

    const/high16 v5, 0x20000

    or-int v6, v2, v5

    or-int/lit8 v7, v6, 0x0

    invoke-virtual {v3, v4, v7}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_WIDTH:I

    const/high16 v8, 0x40000

    or-int v9, v2, v8

    or-int/lit8 v10, v9, 0x1

    invoke-virtual {v3, v4, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_LENGTH:I

    invoke-virtual {v3, v4, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_BITS_PER_SAMPLE:I

    const/high16 v11, 0x30000

    or-int v12, v2, v11

    or-int/lit8 v13, v12, 0x3

    invoke-virtual {v3, v4, v13}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COMPRESSION:I

    or-int/lit8 v13, v12, 0x1

    invoke-virtual {v3, v4, v13}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PHOTOMETRIC_INTERPRETATION:I

    invoke-virtual {v3, v4, v13}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ORIENTATION:I

    invoke-virtual {v3, v4, v13}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SAMPLES_PER_PIXEL:I

    invoke-virtual {v3, v4, v13}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PLANAR_CONFIGURATION:I

    invoke-virtual {v3, v4, v13}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_Y_CB_CR_SUB_SAMPLING:I

    or-int/lit8 v14, v12, 0x2

    invoke-virtual {v3, v4, v14}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_Y_CB_CR_POSITIONING:I

    invoke-virtual {v3, v4, v13}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_X_RESOLUTION:I

    const/high16 v14, 0x50000

    or-int/2addr v2, v14

    or-int/lit8 v15, v2, 0x1

    invoke-virtual {v3, v4, v15}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_Y_RESOLUTION:I

    invoke-virtual {v3, v4, v15}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_RESOLUTION_UNIT:I

    invoke-virtual {v3, v4, v13}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_OFFSETS:I

    const/4 v13, 0x0

    or-int/2addr v9, v13

    invoke-virtual {v3, v4, v9}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ROWS_PER_STRIP:I

    invoke-virtual {v3, v4, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_BYTE_COUNTS:I

    invoke-virtual {v3, v4, v9}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_TRANSFER_FUNCTION:I

    or-int/lit16 v9, v12, 0x300

    invoke-virtual {v3, v4, v9}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_WHITE_POINT:I

    or-int/lit8 v9, v2, 0x2

    invoke-virtual {v3, v4, v9}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PRIMARY_CHROMATICITIES:I

    or-int/lit8 v9, v2, 0x6

    invoke-virtual {v3, v4, v9}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_Y_CB_CR_COEFFICIENTS:I

    const/4 v12, 0x3

    or-int/2addr v2, v12

    invoke-virtual {v3, v4, v2}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v2, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_REFERENCE_BLACK_WHITE:I

    invoke-virtual {v2, v3, v9}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v2, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DATE_TIME:I

    or-int/lit8 v4, v6, 0x14

    invoke-virtual {v2, v3, v4}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v2, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_DESCRIPTION:I

    invoke-virtual {v2, v3, v7}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v2, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_MAKE:I

    invoke-virtual {v2, v3, v7}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v2, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_MODEL:I

    invoke-virtual {v2, v3, v7}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v2, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SOFTWARE:I

    invoke-virtual {v2, v3, v7}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v2, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ARTIST:I

    invoke-virtual {v2, v3, v7}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v2, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COPYRIGHT:I

    invoke-virtual {v2, v3, v7}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v2, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXIF_IFD:I

    invoke-virtual {v2, v3, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v2, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_IFD:I

    invoke-virtual {v2, v3, v10}, Landroid/util/SparseIntArray;->put(II)V

    const/4 v2, 0x1

    new-array v3, v2, [I

    aput v2, v3, v13

    invoke-static {v3}, Lcom/android/gallery3d/exif/ExifInterface;->getFlagsFromAllowedIfds([I)I

    move-result v3

    shl-int/lit8 v3, v3, 0x18

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    or-int/2addr v3, v8

    or-int/2addr v3, v2

    invoke-virtual {v4, v6, v3}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

    invoke-virtual {v4, v6, v3}, Landroid/util/SparseIntArray;->put(II)V

    new-array v3, v2, [I

    aput v1, v3, v13

    invoke-static {v3}, Lcom/android/gallery3d/exif/ExifInterface;->getFlagsFromAllowedIfds([I)I

    move-result v3

    shl-int/lit8 v3, v3, 0x18

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXIF_VERSION:I

    const/high16 v7, 0x70000

    or-int v9, v3, v7

    or-int/lit8 v10, v9, 0x4

    invoke-virtual {v4, v6, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FLASHPIX_VERSION:I

    invoke-virtual {v4, v6, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COLOR_SPACE:I

    or-int v15, v3, v11

    or-int/lit8 v11, v15, 0x1

    invoke-virtual {v4, v6, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COMPONENTS_CONFIGURATION:I

    invoke-virtual {v4, v6, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COMPRESSED_BITS_PER_PIXEL:I

    or-int v10, v3, v14

    or-int/2addr v10, v2

    invoke-virtual {v4, v6, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PIXEL_X_DIMENSION:I

    or-int/2addr v8, v3

    or-int/2addr v8, v2

    invoke-virtual {v4, v6, v8}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PIXEL_Y_DIMENSION:I

    invoke-virtual {v4, v6, v8}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_MAKER_NOTE:I

    or-int/lit8 v7, v9, 0x0

    invoke-virtual {v4, v6, v7}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_USER_COMMENT:I

    invoke-virtual {v4, v6, v7}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_RELATED_SOUND_FILE:I

    or-int v16, v3, v5

    or-int/lit8 v14, v16, 0xd

    invoke-virtual {v4, v6, v14}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DATE_TIME_ORIGINAL:I

    or-int/lit8 v14, v16, 0x14

    invoke-virtual {v4, v6, v14}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DATE_TIME_DIGITIZED:I

    invoke-virtual {v4, v6, v14}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUB_SEC_TIME:I

    or-int/lit8 v14, v16, 0x0

    invoke-virtual {v4, v6, v14}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUB_SEC_TIME_ORIGINAL:I

    invoke-virtual {v4, v6, v14}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUB_SEC_TIME_DIGITIZED:I

    invoke-virtual {v4, v6, v14}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_UNIQUE_ID:I

    or-int/lit8 v12, v16, 0x21

    invoke-virtual {v4, v6, v12}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_TIME:I

    invoke-virtual {v4, v6, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_F_NUMBER:I

    invoke-virtual {v4, v6, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_PROGRAM:I

    invoke-virtual {v4, v6, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SPECTRAL_SENSITIVITY:I

    invoke-virtual {v4, v6, v14}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ISO_SPEED_RATINGS:I

    or-int/lit8 v12, v15, 0x0

    invoke-virtual {v4, v6, v12}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_OECF:I

    invoke-virtual {v4, v6, v7}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SHUTTER_SPEED_VALUE:I

    const/high16 v16, 0xa0000

    or-int v17, v3, v16

    or-int/lit8 v5, v17, 0x1

    invoke-virtual {v4, v6, v5}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_APERTURE_VALUE:I

    invoke-virtual {v4, v6, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_BRIGHTNESS_VALUE:I

    invoke-virtual {v4, v6, v5}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v6, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_BIAS_VALUE:I

    invoke-virtual {v4, v6, v5}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v5, Lcom/android/gallery3d/exif/ExifInterface;->TAG_MAX_APERTURE_VALUE:I

    invoke-virtual {v4, v5, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v5, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUBJECT_DISTANCE:I

    invoke-virtual {v4, v5, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v5, Lcom/android/gallery3d/exif/ExifInterface;->TAG_METERING_MODE:I

    invoke-virtual {v4, v5, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v5, Lcom/android/gallery3d/exif/ExifInterface;->TAG_LIGHT_SOURCE:I

    invoke-virtual {v4, v5, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v5, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FLASH:I

    invoke-virtual {v4, v5, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v5, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_LENGTH:I

    invoke-virtual {v4, v5, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v5, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUBJECT_AREA:I

    invoke-virtual {v4, v5, v12}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v5, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FLASH_ENERGY:I

    invoke-virtual {v4, v5, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v5, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SPATIAL_FREQUENCY_RESPONSE:I

    invoke-virtual {v4, v5, v7}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v5, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_PLANE_X_RESOLUTION:I

    invoke-virtual {v4, v5, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v5, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_PLANE_Y_RESOLUTION:I

    invoke-virtual {v4, v5, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v5, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_PLANE_RESOLUTION_UNIT:I

    invoke-virtual {v4, v5, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v5, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUBJECT_LOCATION:I

    or-int/2addr v1, v15

    invoke-virtual {v4, v5, v1}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_INDEX:I

    invoke-virtual {v1, v4, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SENSING_METHOD:I

    invoke-virtual {v1, v4, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FILE_SOURCE:I

    or-int/lit8 v5, v9, 0x1

    invoke-virtual {v1, v4, v5}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SCENE_TYPE:I

    invoke-virtual {v1, v4, v5}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_CFA_PATTERN:I

    invoke-virtual {v1, v4, v7}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_CUSTOM_RENDERED:I

    invoke-virtual {v1, v4, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_MODE:I

    invoke-virtual {v1, v4, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_WHITE_BALANCE:I

    invoke-virtual {v1, v4, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DIGITAL_ZOOM_RATIO:I

    invoke-virtual {v1, v4, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_LENGTH_IN_35_MM_FILE:I

    invoke-virtual {v1, v4, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SCENE_CAPTURE_TYPE:I

    invoke-virtual {v1, v4, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GAIN_CONTROL:I

    invoke-virtual {v1, v4, v10}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_CONTRAST:I

    invoke-virtual {v1, v4, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SATURATION:I

    invoke-virtual {v1, v4, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SHARPNESS:I

    invoke-virtual {v1, v4, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEVICE_SETTING_DESCRIPTION:I

    invoke-virtual {v1, v4, v7}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUBJECT_DISTANCE_RANGE:I

    invoke-virtual {v1, v4, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_INTEROPERABILITY_IFD:I

    invoke-virtual {v1, v4, v8}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PARALLEL_PROCESS_COMMENT:I

    invoke-virtual {v1, v4, v14}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ALGORITHM_COMMENT:I

    invoke-virtual {v1, v4, v14}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_BLUR_LEVEL:I

    invoke-virtual {v1, v4, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_FOCUS_POINT:I

    invoke-virtual {v1, v4, v14}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_DULCAMERA_WATER_MARK:I

    const/high16 v5, 0x10000

    or-int/2addr v3, v5

    or-int/lit8 v6, v3, 0x0

    invoke-virtual {v1, v4, v6}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_TIME_WATER_MARK:I

    invoke-virtual {v1, v4, v6}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PORTRAIT_LIGHTING_PATTERN:I

    invoke-virtual {v1, v4, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_AI_TYPE:I

    invoke-virtual {v1, v4, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FRONT_MIRROR:I

    invoke-virtual {v1, v4, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_XIAOMI_LIVESHOT_PHOTO:I

    or-int/2addr v3, v2

    invoke-virtual {v1, v4, v3}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_XIAOMI_DEPTHMAP_VERSION:I

    invoke-virtual {v1, v3, v11}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v1, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_XIAOMI_COMMENT:I

    invoke-virtual {v1, v3, v14}, Landroid/util/SparseIntArray;->put(II)V

    new-array v1, v2, [I

    const/4 v3, 0x4

    aput v3, v1, v13

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->getFlagsFromAllowedIfds([I)I

    move-result v1

    shl-int/lit8 v1, v1, 0x18

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_VERSION_ID:I

    or-int/2addr v5, v1

    or-int/lit8 v6, v5, 0x4

    invoke-virtual {v3, v4, v6}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LATITUDE_REF:I

    const/high16 v6, 0x20000

    or-int v7, v1, v6

    or-int/lit8 v6, v7, 0x2

    invoke-virtual {v3, v4, v6}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LONGITUDE_REF:I

    invoke-virtual {v3, v4, v6}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LATITUDE:I

    or-int v8, v1, v16

    const/4 v9, 0x3

    or-int/2addr v8, v9

    invoke-virtual {v3, v4, v8}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LONGITUDE:I

    invoke-virtual {v3, v4, v8}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_ALTITUDE_REF:I

    or-int/2addr v5, v2

    invoke-virtual {v3, v4, v5}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_ALTITUDE:I

    const/high16 v5, 0x50000

    or-int/2addr v5, v1

    or-int/lit8 v8, v5, 0x1

    invoke-virtual {v3, v4, v8}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_TIME_STAMP:I

    const/4 v9, 0x3

    or-int/2addr v5, v9

    invoke-virtual {v3, v4, v5}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_SATTELLITES:I

    or-int/lit8 v5, v7, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_STATUS:I

    invoke-virtual {v3, v4, v6}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_MEASURE_MODE:I

    invoke-virtual {v3, v4, v6}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DOP:I

    invoke-virtual {v3, v4, v8}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_SPEED_REF:I

    invoke-virtual {v3, v4, v6}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_SPEED:I

    invoke-virtual {v3, v4, v8}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_TRACK_REF:I

    invoke-virtual {v3, v4, v6}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_TRACK:I

    invoke-virtual {v3, v4, v8}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_IMG_DIRECTION_REF:I

    invoke-virtual {v3, v4, v6}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_IMG_DIRECTION:I

    invoke-virtual {v3, v4, v8}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_MAP_DATUM:I

    invoke-virtual {v3, v4, v5}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_LATITUDE_REF:I

    invoke-virtual {v3, v4, v6}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_LATITUDE:I

    invoke-virtual {v3, v4, v8}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_BEARING_REF:I

    invoke-virtual {v3, v4, v6}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_BEARING:I

    invoke-virtual {v3, v4, v8}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_DISTANCE_REF:I

    invoke-virtual {v3, v4, v6}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_DISTANCE:I

    invoke-virtual {v3, v4, v8}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_PROCESSING_METHOD:I

    const/high16 v5, 0x70000

    or-int/2addr v5, v1

    or-int/2addr v5, v13

    invoke-virtual {v3, v4, v5}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_AREA_INFORMATION:I

    invoke-virtual {v3, v4, v5}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DATE_STAMP:I

    or-int/lit8 v5, v7, 0xb

    invoke-virtual {v3, v4, v5}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v3, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v4, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DIFFERENTIAL:I

    const/high16 v5, 0x30000

    or-int/2addr v1, v5

    or-int/lit8 v1, v1, 0xb

    invoke-virtual {v3, v4, v1}, Landroid/util/SparseIntArray;->put(II)V

    new-array v1, v2, [I

    const/4 v2, 0x3

    aput v2, v1, v13

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->getFlagsFromAllowedIfds([I)I

    move-result v1

    shl-int/lit8 v1, v1, 0x18

    iget-object v0, v0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_INTEROPERABILITY_INDEX:I

    const/high16 v3, 0x20000

    or-int/2addr v1, v3

    or-int/2addr v1, v13

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseIntArray;->put(II)V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x1
    .end array-data
.end method

.method protected static isIfdAllowed(II)Z
    .locals 5

    invoke-static {}, Lcom/android/gallery3d/exif/IfdData;->getIfds()[I

    move-result-object v0

    invoke-static {p0}, Lcom/android/gallery3d/exif/ExifInterface;->getAllowedIfdFlagsFromInfo(I)I

    move-result p0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_1

    aget v3, v0, v2

    if-ne p1, v3, :cond_0

    shr-int v3, p0, v2

    const/4 v4, 0x1

    and-int/2addr v3, v4

    if-ne v3, v4, :cond_0

    return v4

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method protected static isOffsetTag(S)Z
    .locals 1

    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sOffsetTags:Ljava/util/HashSet;

    invoke-static {p0}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static removeParallelProcessComment([B)[B
    .locals 6

    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG:Ljava/lang/String;

    const-string v1, "algo exif: removeParallel"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    nop

    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    :try_start_0
    new-instance v3, Lcom/android/gallery3d/exif/ExifInterface;

    invoke-direct {v3}, Lcom/android/gallery3d/exif/ExifInterface;-><init>()V

    invoke-virtual {v3, p0}, Lcom/android/gallery3d/exif/ExifInterface;->readExif([B)V

    invoke-virtual {v3}, Lcom/android/gallery3d/exif/ExifInterface;->removeParallelProcessComment()V

    invoke-virtual {v3, p0, v2}, Lcom/android/gallery3d/exif/ExifInterface;->writeExif([BLjava/io/OutputStream;)V

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    move-object p0, v3

    goto :goto_0

    :catch_0
    move-exception v2

    const-class v3, Lcom/android/gallery3d/exif/ExifInterface;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    nop

    :goto_0
    sget-object v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "removeParallelProcessComment cost="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-object p0
.end method

.method private static toExifLatLong(D)[Lcom/android/gallery3d/exif/Rational;
    .locals 7

    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide p0

    double-to-int v0, p0

    int-to-double v1, v0

    sub-double/2addr p0, v1

    const-wide/high16 v1, 0x404e000000000000L    # 60.0

    mul-double/2addr p0, v1

    double-to-int v1, p0

    int-to-double v2, v1

    sub-double/2addr p0, v2

    const-wide v2, 0x40b7700000000000L    # 6000.0

    mul-double/2addr p0, v2

    double-to-int p0, p0

    const/4 p1, 0x3

    new-array p1, p1, [Lcom/android/gallery3d/exif/Rational;

    new-instance v2, Lcom/android/gallery3d/exif/Rational;

    int-to-long v3, v0

    const-wide/16 v5, 0x1

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/android/gallery3d/exif/Rational;-><init>(JJ)V

    const/4 v0, 0x0

    aput-object v2, p1, v0

    new-instance v0, Lcom/android/gallery3d/exif/Rational;

    int-to-long v1, v1

    invoke-direct {v0, v1, v2, v5, v6}, Lcom/android/gallery3d/exif/Rational;-><init>(JJ)V

    const/4 v1, 0x1

    aput-object v0, p1, v1

    new-instance v0, Lcom/android/gallery3d/exif/Rational;

    int-to-long v1, p0

    const-wide/16 v3, 0x64

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/gallery3d/exif/Rational;-><init>(JJ)V

    const/4 p0, 0x2

    aput-object v0, p1, p0

    return-object p1
.end method

.method public static writeToOutStream(Lcom/android/gallery3d/exif/ExifInterface;Landroid/graphics/Bitmap;Ljava/io/FileOutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->writeExif(Landroid/graphics/Bitmap;Ljava/io/OutputStream;)V

    goto :goto_0

    :cond_0
    sget-object p0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v0, 0x64

    invoke-virtual {p1, p0, v0, p2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {p2}, Ljava/io/FileOutputStream;->flush()V

    :goto_0
    return-void
.end method

.method public static writeToOutStream(Lcom/android/gallery3d/exif/ExifInterface;[BLjava/io/FileOutputStream;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->writeExif([BLjava/io/OutputStream;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p2, p1}, Ljava/io/FileOutputStream;->write([B)V

    :goto_0
    return-void
.end method


# virtual methods
.method public addAiType(I)Z
    .locals 1

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_AI_TYPE:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public addAlgorithmComment(Ljava/lang/String;)Z
    .locals 3

    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "addAlgorithmComment: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ALGORITHM_COMMENT:I

    invoke-direct {p0, v0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public addDateTimeStampTag(IJLjava/util/TimeZone;)Z
    .locals 2

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DATE_TIME:I

    const/4 v1, 0x0

    if-eq p1, v0, :cond_1

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DATE_TIME_DIGITIZED:I

    if-eq p1, v0, :cond_1

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DATE_TIME_ORIGINAL:I

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    return v1

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mDateTimeStampFormat:Ljava/text/DateFormat;

    invoke-virtual {v0, p4}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    iget-object p4, p0, Lcom/android/gallery3d/exif/ExifInterface;->mDateTimeStampFormat:Ljava/text/DateFormat;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p4, p2}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->buildTag(ILjava/lang/Object;)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object p1

    if-nez p1, :cond_2

    return v1

    :cond_2
    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    nop

    const/4 p1, 0x1

    return p1
.end method

.method public addDepthMapBlurLevel(I)Z
    .locals 1

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_BLUR_LEVEL:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public addDepthMapFocusPoint(Landroid/graphics/Point;)Z
    .locals 1

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_FOCUS_POINT:I

    invoke-virtual {p1}, Landroid/graphics/Point;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public addDulCameraWaterMark([B)Z
    .locals 1

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_DULCAMERA_WATER_MARK:I

    invoke-direct {p0, v0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public addFileTypeLiveShot(Z)Z
    .locals 1

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_XIAOMI_LIVESHOT_PHOTO:I

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public addFrontMirror(I)Z
    .locals 1

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FRONT_MIRROR:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public addGpsDateTimeStampTag(J)Z
    .locals 8

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DATE_STAMP:I

    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifInterface;->mGPSDateStampFormat:Ljava/text/DateFormat;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->buildTag(ILjava/lang/Object;)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0, v0}, Lcom/android/gallery3d/exif/ExifInterface;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mGPSTimeStampCalendar:Ljava/util/Calendar;

    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    sget p1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_TIME_STAMP:I

    const/4 p2, 0x3

    new-array p2, p2, [Lcom/android/gallery3d/exif/Rational;

    new-instance v0, Lcom/android/gallery3d/exif/Rational;

    iget-object v2, p0, Lcom/android/gallery3d/exif/ExifInterface;->mGPSTimeStampCalendar:Ljava/util/Calendar;

    const/16 v3, 0xb

    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    move-result v2

    int-to-long v2, v2

    const-wide/16 v4, 0x1

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/android/gallery3d/exif/Rational;-><init>(JJ)V

    aput-object v0, p2, v1

    new-instance v0, Lcom/android/gallery3d/exif/Rational;

    iget-object v2, p0, Lcom/android/gallery3d/exif/ExifInterface;->mGPSTimeStampCalendar:Ljava/util/Calendar;

    const/16 v3, 0xc

    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    move-result v2

    int-to-long v2, v2

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/android/gallery3d/exif/Rational;-><init>(JJ)V

    const/4 v2, 0x1

    aput-object v0, p2, v2

    const/4 v0, 0x2

    new-instance v3, Lcom/android/gallery3d/exif/Rational;

    iget-object v6, p0, Lcom/android/gallery3d/exif/ExifInterface;->mGPSTimeStampCalendar:Ljava/util/Calendar;

    const/16 v7, 0xd

    invoke-virtual {v6, v7}, Ljava/util/Calendar;->get(I)I

    move-result v6

    int-to-long v6, v6

    invoke-direct {v3, v6, v7, v4, v5}, Lcom/android/gallery3d/exif/Rational;-><init>(JJ)V

    aput-object v3, p2, v0

    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->buildTag(ILjava/lang/Object;)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object p1

    if-nez p1, :cond_1

    return v1

    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    return v2
.end method

.method public addGpsTags(DD)Z
    .locals 5

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LATITUDE:I

    invoke-static {p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->toExifLatLong(D)[Lcom/android/gallery3d/exif/Rational;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->buildTag(ILjava/lang/Object;)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v0

    sget v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LONGITUDE:I

    invoke-static {p3, p4}, Lcom/android/gallery3d/exif/ExifInterface;->toExifLatLong(D)[Lcom/android/gallery3d/exif/Rational;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/android/gallery3d/exif/ExifInterface;->buildTag(ILjava/lang/Object;)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v1

    sget v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LATITUDE_REF:I

    const-wide/16 v3, 0x0

    cmpl-double p1, p1, v3

    if-ltz p1, :cond_0

    const-string p1, "N"

    goto :goto_0

    :cond_0
    const-string p1, "S"

    :goto_0
    invoke-virtual {p0, v2, p1}, Lcom/android/gallery3d/exif/ExifInterface;->buildTag(ILjava/lang/Object;)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object p1

    sget p2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LONGITUDE_REF:I

    cmpl-double p3, p3, v3

    if-ltz p3, :cond_1

    const-string p3, "E"

    goto :goto_1

    :cond_1
    const-string p3, "W"

    :goto_1
    invoke-virtual {p0, p2, p3}, Lcom/android/gallery3d/exif/ExifInterface;->buildTag(ILjava/lang/Object;)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object p2

    if-eqz v0, :cond_3

    if-eqz v1, :cond_3

    if-eqz p1, :cond_3

    if-nez p2, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {p0, v0}, Lcom/android/gallery3d/exif/ExifInterface;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    invoke-virtual {p0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    invoke-virtual {p0, p2}, Lcom/android/gallery3d/exif/ExifInterface;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    const/4 p1, 0x1

    return p1

    :cond_3
    :goto_2
    const/4 p1, 0x0

    return p1
.end method

.method public addParallelProcessComment(Ljava/lang/String;III)Z
    .locals 3

    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "algo exif: addParallel "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PARALLEL_PROCESS_COMMENT:I

    invoke-direct {p0, v0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    sget p1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ORIENTATION:I

    invoke-static {p2}, Lcom/android/gallery3d/exif/ExifInterface;->getExifOrientationValue(I)S

    move-result p2

    invoke-static {p2}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    sget p1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_WIDTH:I

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    sget p1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_LENGTH:I

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public addPortraitLighting(I)Z
    .locals 1

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PORTRAIT_LIGHTING_PATTERN:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public addTimeWaterMark([B)Z
    .locals 1

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_TIME_WATER_MARK:I

    invoke-direct {p0, v0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public addXiaomiComment(Ljava/lang/String;)Z
    .locals 1

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_XIAOMI_COMMENT:I

    invoke-virtual {p0, v0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->buildTag(ILjava/lang/Object;)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    const/4 p1, 0x1

    return p1
.end method

.method public addXiaomiDepthmapVersion(I)Z
    .locals 1

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_XIAOMI_DEPTHMAP_VERSION:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public buildTag(IILjava/lang/Object;)Lcom/android/gallery3d/exif/ExifTag;
    .locals 8

    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagInfo()Landroid/util/SparseIntArray;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    if-nez p3, :cond_0

    goto :goto_2

    :cond_0
    invoke-static {v0}, Lcom/android/gallery3d/exif/ExifInterface;->getTypeFromInfo(I)S

    move-result v4

    invoke-static {v0}, Lcom/android/gallery3d/exif/ExifInterface;->getComponentCountFromInfo(I)I

    move-result v5

    if-eqz v5, :cond_1

    const/4 v2, 0x1

    :goto_0
    move v7, v2

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    :goto_1
    invoke-static {v0, p2}, Lcom/android/gallery3d/exif/ExifInterface;->isIfdAllowed(II)Z

    move-result v0

    if-nez v0, :cond_2

    return-object v1

    :cond_2
    new-instance v0, Lcom/android/gallery3d/exif/ExifTag;

    invoke-static {p1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v3

    move-object v2, v0

    move v6, p2

    invoke-direct/range {v2 .. v7}, Lcom/android/gallery3d/exif/ExifTag;-><init>(SSIIZ)V

    invoke-virtual {v0, p3}, Lcom/android/gallery3d/exif/ExifTag;->setValue(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    return-object v1

    :cond_3
    return-object v0

    :cond_4
    :goto_2
    return-object v1
.end method

.method public buildTag(ILjava/lang/Object;)Lcom/android/gallery3d/exif/ExifTag;
    .locals 1

    invoke-static {p1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueIfd(I)I

    move-result v0

    invoke-virtual {p0, p1, v0, p2}, Lcom/android/gallery3d/exif/ExifInterface;->buildTag(IILjava/lang/Object;)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object p1

    return-object p1
.end method

.method protected buildUninitializedTag(I)Lcom/android/gallery3d/exif/ExifTag;
    .locals 7

    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagInfo()Landroid/util/SparseIntArray;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-static {v0}, Lcom/android/gallery3d/exif/ExifInterface;->getTypeFromInfo(I)S

    move-result v2

    invoke-static {v0}, Lcom/android/gallery3d/exif/ExifInterface;->getComponentCountFromInfo(I)I

    move-result v3

    if-eqz v3, :cond_1

    const/4 v0, 0x1

    :goto_0
    move v5, v0

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :goto_1
    invoke-static {p1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueIfd(I)I

    move-result v4

    new-instance v6, Lcom/android/gallery3d/exif/ExifTag;

    invoke-static {p1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v1

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/android/gallery3d/exif/ExifTag;-><init>(SSIIZ)V

    return-object v6
.end method

.method public clearExif()V
    .locals 2

    new-instance v0, Lcom/android/gallery3d/exif/ExifData;

    sget-object v1, Lcom/android/gallery3d/exif/ExifInterface;->DEFAULT_BYTE_ORDER:Ljava/nio/ByteOrder;

    invoke-direct {v0, v1}, Lcom/android/gallery3d/exif/ExifData;-><init>(Ljava/nio/ByteOrder;)V

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    return-void
.end method

.method public deleteTag(I)V
    .locals 1

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->getDefinedTagDefaultIfd(I)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->deleteTag(II)V

    return-void
.end method

.method public deleteTag(II)V
    .locals 1

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-static {p1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result p1

    invoke-virtual {v0, p1, p2}, Lcom/android/gallery3d/exif/ExifData;->removeTag(SI)V

    return-void
.end method

.method public forceRewriteExif(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifInterface;->getAllTags()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->forceRewriteExif(Ljava/lang/String;Ljava/util/Collection;)V

    return-void
.end method

.method public forceRewriteExif(Ljava/lang/String;Ljava/util/Collection;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection<",
            "Lcom/android/gallery3d/exif/ExifTag;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->rewriteExif(Ljava/lang/String;Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    new-instance v1, Lcom/android/gallery3d/exif/ExifData;

    sget-object v2, Lcom/android/gallery3d/exif/ExifInterface;->DEFAULT_BYTE_ORDER:Ljava/nio/ByteOrder;

    invoke-direct {v1, v2}, Lcom/android/gallery3d/exif/ExifData;-><init>(Ljava/nio/ByteOrder;)V

    iput-object v1, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    const/4 v1, 0x0

    nop

    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-direct {p0, v2, v1}, Lcom/android/gallery3d/exif/ExifInterface;->doExifStreamIO(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->readExif([B)V

    invoke-virtual {p0, p2}, Lcom/android/gallery3d/exif/ExifInterface;->setTags(Ljava/util/Collection;)V

    invoke-virtual {p0, v1, p1}, Lcom/android/gallery3d/exif/ExifInterface;->writeExif([BLjava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    move-object v1, v2

    goto :goto_0

    :catchall_1
    move-exception p1

    move-object v2, v1

    goto :goto_1

    :catch_1
    move-exception p1

    :goto_0
    :try_start_2
    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->closeSilently(Ljava/io/Closeable;)V

    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :goto_1
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    throw p1

    :cond_0
    :goto_2
    return-void
.end method

.method public getActualTagCount(II)I
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getTag(II)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result p1

    return p1
.end method

.method public getAllTags()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/gallery3d/exif/ExifTag;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifData;->getAllTags()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDefinedTagCount(I)I
    .locals 1

    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagInfo()Landroid/util/SparseIntArray;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-static {p1}, Lcom/android/gallery3d/exif/ExifInterface;->getComponentCountFromInfo(I)I

    move-result p1

    return p1
.end method

.method public getDefinedTagDefaultIfd(I)I
    .locals 1

    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagInfo()Landroid/util/SparseIntArray;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    invoke-static {p1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueIfd(I)I

    move-result p1

    return p1
.end method

.method public getDefinedTagType(I)S
    .locals 1

    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagInfo()Landroid/util/SparseIntArray;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    invoke-static {p1}, Lcom/android/gallery3d/exif/ExifInterface;->getTypeFromInfo(I)S

    move-result p1

    return p1
.end method

.method public getExifWriterStream(Ljava/io/OutputStream;)Ljava/io/OutputStream;
    .locals 1

    if-eqz p1, :cond_0

    new-instance v0, Lcom/android/gallery3d/exif/ExifOutputStream;

    invoke-direct {v0, p1, p0}, Lcom/android/gallery3d/exif/ExifOutputStream;-><init>(Ljava/io/OutputStream;Lcom/android/gallery3d/exif/ExifInterface;)V

    iget-object p1, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0, p1}, Lcom/android/gallery3d/exif/ExifOutputStream;->setExifData(Lcom/android/gallery3d/exif/ExifData;)V

    return-object v0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Argument is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getExifWriterStream(Ljava/lang/String;)Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    invoke-virtual {p0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->getExifWriterStream(Ljava/io/OutputStream;)Ljava/io/OutputStream;

    move-result-object p1

    return-object p1

    :catch_0
    move-exception p1

    invoke-static {v0}, Lcom/android/gallery3d/exif/ExifInterface;->closeSilently(Ljava/io/Closeable;)V

    throw p1

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Argument is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getLatLongAsDoubles()[D
    .locals 6

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LATITUDE:I

    invoke-virtual {p0, v0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagRationalValues(I)[Lcom/android/gallery3d/exif/Rational;

    move-result-object v0

    sget v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LATITUDE_REF:I

    invoke-virtual {p0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->getTagStringValue(I)Ljava/lang/String;

    move-result-object v1

    sget v2, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LONGITUDE:I

    invoke-virtual {p0, v2}, Lcom/android/gallery3d/exif/ExifInterface;->getTagRationalValues(I)[Lcom/android/gallery3d/exif/Rational;

    move-result-object v2

    sget v3, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LONGITUDE_REF:I

    invoke-virtual {p0, v3}, Lcom/android/gallery3d/exif/ExifInterface;->getTagStringValue(I)Ljava/lang/String;

    move-result-object v3

    if-eqz v0, :cond_1

    if-eqz v2, :cond_1

    if-eqz v1, :cond_1

    if-eqz v3, :cond_1

    array-length v4, v0

    const/4 v5, 0x3

    if-lt v4, v5, :cond_1

    array-length v4, v2

    if-ge v4, v5, :cond_0

    goto :goto_0

    :cond_0
    const/4 v4, 0x2

    new-array v4, v4, [D

    const/4 v5, 0x0

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->convertLatOrLongToDouble([Lcom/android/gallery3d/exif/Rational;Ljava/lang/String;)D

    move-result-wide v0

    aput-wide v0, v4, v5

    const/4 v0, 0x1

    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->convertLatOrLongToDouble([Lcom/android/gallery3d/exif/Rational;Ljava/lang/String;)D

    move-result-wide v1

    aput-wide v1, v4, v0

    return-object v4

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTag(I)Lcom/android/gallery3d/exif/ExifTag;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->getDefinedTagDefaultIfd(I)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->getTag(II)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object p1

    return-object p1
.end method

.method public getTag(II)Lcom/android/gallery3d/exif/ExifTag;
    .locals 1

    invoke-static {p2}, Lcom/android/gallery3d/exif/ExifTag;->isValidIfd(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-static {p1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result p1

    invoke-virtual {v0, p1, p2}, Lcom/android/gallery3d/exif/ExifData;->getTag(SI)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object p1

    return-object p1
.end method

.method public getTagByteValue(I)Ljava/lang/Byte;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->getDefinedTagDefaultIfd(I)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagByteValue(II)Ljava/lang/Byte;

    move-result-object p1

    return-object p1
.end method

.method public getTagByteValue(II)Ljava/lang/Byte;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getTagByteValues(II)[B

    move-result-object p1

    if-eqz p1, :cond_1

    array-length p2, p1

    if-gtz p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    aget-byte p1, p1, p2

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getTagByteValues(I)[B
    .locals 1

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->getDefinedTagDefaultIfd(I)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagByteValues(II)[B

    move-result-object p1

    return-object p1
.end method

.method public getTagByteValues(II)[B
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getTag(II)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifTag;->getValueAsBytes()[B

    move-result-object p1

    return-object p1
.end method

.method protected getTagDefinition(SI)I
    .locals 1

    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagInfo()Landroid/util/SparseIntArray;

    move-result-object v0

    invoke-static {p2, p1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result p1

    return p1
.end method

.method protected getTagDefinitionForTag(Lcom/android/gallery3d/exif/ExifTag;)I
    .locals 3

    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifTag;->getDataType()S

    move-result v0

    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result v1

    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifTag;->getIfd()I

    move-result v2

    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifTag;->getTagId()S

    move-result p1

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/android/gallery3d/exif/ExifInterface;->getTagDefinitionForTag(SSII)I

    move-result p1

    return p1
.end method

.method protected getTagDefinitionForTag(SSII)I
    .locals 14

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->getTagDefinitionsForTagId(S)[I

    move-result-object v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagInfo()Landroid/util/SparseIntArray;

    move-result-object v2

    nop

    array-length v3, v0

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v3, :cond_7

    aget v6, v0, v5

    invoke-virtual {v2, v6}, Landroid/util/SparseIntArray;->get(I)I

    move-result v7

    invoke-static {v7}, Lcom/android/gallery3d/exif/ExifInterface;->getTypeFromInfo(I)S

    move-result v8

    invoke-static {v7}, Lcom/android/gallery3d/exif/ExifInterface;->getComponentCountFromInfo(I)I

    move-result v9

    invoke-static {v7}, Lcom/android/gallery3d/exif/ExifInterface;->getAllowedIfdsFromInfo(I)[I

    move-result-object v7

    nop

    array-length v10, v7

    move v11, v4

    :goto_1
    if-ge v11, v10, :cond_2

    aget v12, v7, v11

    move/from16 v13, p4

    if-ne v12, v13, :cond_1

    nop

    nop

    const/4 v7, 0x1

    goto :goto_2

    :cond_1
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    :cond_2
    move/from16 v13, p4

    move v7, v4

    :goto_2
    if-eqz v7, :cond_4

    move/from16 v7, p2

    if-ne v7, v8, :cond_5

    move/from16 v8, p3

    if-eq v8, v9, :cond_3

    if-nez v9, :cond_6

    :cond_3
    nop

    nop

    move v1, v6

    goto :goto_3

    :cond_4
    move/from16 v7, p2

    :cond_5
    move/from16 v8, p3

    :cond_6
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_7
    :goto_3
    return v1
.end method

.method protected getTagDefinitionsForTagId(S)[I
    .locals 9

    invoke-static {}, Lcom/android/gallery3d/exif/IfdData;->getIfds()[I

    move-result-object v0

    array-length v1, v0

    new-array v1, v1, [I

    nop

    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagInfo()Landroid/util/SparseIntArray;

    move-result-object v2

    array-length v3, v0

    const/4 v4, 0x0

    move v5, v4

    move v6, v5

    :goto_0
    if-ge v5, v3, :cond_1

    aget v7, v0, v5

    invoke-static {v7, p1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v7

    invoke-virtual {v2, v7}, Landroid/util/SparseIntArray;->get(I)I

    move-result v8

    if-eqz v8, :cond_0

    add-int/lit8 v8, v6, 0x1

    aput v7, v1, v6

    move v6, v8

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_1
    if-nez v6, :cond_2

    const/4 p1, 0x0

    return-object p1

    :cond_2
    invoke-static {v1, v4, v6}, Ljava/util/Arrays;->copyOfRange([III)[I

    move-result-object p1

    return-object p1
.end method

.method protected getTagInfo()Landroid/util/SparseIntArray;
    .locals 1

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    if-nez v0, :cond_0

    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    invoke-direct {p0}, Lcom/android/gallery3d/exif/ExifInterface;->initTagInfo()V

    :cond_0
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    return-object v0
.end method

.method public getTagIntValue(I)Ljava/lang/Integer;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->getDefinedTagDefaultIfd(I)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagIntValue(II)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getTagIntValue(II)Ljava/lang/Integer;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getTagIntValues(II)[I

    move-result-object p1

    if-eqz p1, :cond_1

    array-length p2, p1

    if-gtz p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    aget p1, p1, p2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getTagIntValues(I)[I
    .locals 1

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->getDefinedTagDefaultIfd(I)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagIntValues(II)[I

    move-result-object p1

    return-object p1
.end method

.method public getTagIntValues(II)[I
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getTag(II)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifTag;->getValueAsInts()[I

    move-result-object p1

    return-object p1
.end method

.method public getTagLongValue(I)Ljava/lang/Long;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->getDefinedTagDefaultIfd(I)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagLongValue(II)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method public getTagLongValue(II)Ljava/lang/Long;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getTagLongValues(II)[J

    move-result-object p1

    if-eqz p1, :cond_1

    array-length p2, p1

    if-gtz p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    aget-wide p1, p1, p2

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getTagLongValues(I)[J
    .locals 1

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->getDefinedTagDefaultIfd(I)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagLongValues(II)[J

    move-result-object p1

    return-object p1
.end method

.method public getTagLongValues(II)[J
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getTag(II)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifTag;->getValueAsLongs()[J

    move-result-object p1

    return-object p1
.end method

.method public getTagRationalValue(I)Lcom/android/gallery3d/exif/Rational;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->getDefinedTagDefaultIfd(I)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagRationalValue(II)Lcom/android/gallery3d/exif/Rational;

    move-result-object p1

    return-object p1
.end method

.method public getTagRationalValue(II)Lcom/android/gallery3d/exif/Rational;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getTagRationalValues(II)[Lcom/android/gallery3d/exif/Rational;

    move-result-object p1

    if-eqz p1, :cond_1

    array-length p2, p1

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    new-instance p2, Lcom/android/gallery3d/exif/Rational;

    const/4 v0, 0x0

    aget-object p1, p1, v0

    invoke-direct {p2, p1}, Lcom/android/gallery3d/exif/Rational;-><init>(Lcom/android/gallery3d/exif/Rational;)V

    return-object p2

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getTagRationalValues(I)[Lcom/android/gallery3d/exif/Rational;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->getDefinedTagDefaultIfd(I)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagRationalValues(II)[Lcom/android/gallery3d/exif/Rational;

    move-result-object p1

    return-object p1
.end method

.method public getTagRationalValues(II)[Lcom/android/gallery3d/exif/Rational;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getTag(II)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifTag;->getValueAsRationals()[Lcom/android/gallery3d/exif/Rational;

    move-result-object p1

    return-object p1
.end method

.method public getTagStringValue(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->getDefinedTagDefaultIfd(I)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagStringValue(II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getTagStringValue(II)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getTag(II)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifTag;->getValueAsString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getTagValue(I)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->getDefinedTagDefaultIfd(I)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagValue(II)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getTagValue(II)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getTag(II)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifTag;->getValue()Ljava/lang/Object;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public getTagsForIfdId(I)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/android/gallery3d/exif/ExifTag;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0, p1}, Lcom/android/gallery3d/exif/ExifData;->getAllTagsForIfd(I)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getTagsForTagId(S)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(S)",
            "Ljava/util/List<",
            "Lcom/android/gallery3d/exif/ExifTag;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0, p1}, Lcom/android/gallery3d/exif/ExifData;->getAllTagsForTagId(S)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getThumbnail()[B
    .locals 1

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifData;->getCompressedThumbnail()[B

    move-result-object v0

    return-object v0
.end method

.method public getThumbnailBitmap()Landroid/graphics/Bitmap;
    .locals 3

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifData;->hasCompressedThumbnail()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifData;->getCompressedThumbnail()[B

    move-result-object v0

    const/4 v1, 0x0

    array-length v2, v0

    invoke-static {v0, v1, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifData;->hasUncompressedStrip()Z

    const/4 v0, 0x0

    return-object v0
.end method

.method public getThumbnailBytes()[B
    .locals 1

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifData;->hasCompressedThumbnail()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifData;->getCompressedThumbnail()[B

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifData;->hasUncompressedStrip()Z

    const/4 v0, 0x0

    return-object v0
.end method

.method public getUserComment()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifData;->getUserComment()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getXiaomiComment()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifData;->getXiaomiComment()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasThumbnail()Z
    .locals 1

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifData;->hasCompressedThumbnail()Z

    move-result v0

    return v0
.end method

.method public isTagCountDefined(I)Z
    .locals 1

    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagInfo()Landroid/util/SparseIntArray;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    invoke-static {p1}, Lcom/android/gallery3d/exif/ExifInterface;->getComponentCountFromInfo(I)I

    move-result p1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    nop

    :cond_1
    return v0
.end method

.method public isThumbnailCompressed()Z
    .locals 1

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifData;->hasCompressedThumbnail()Z

    move-result v0

    return v0
.end method

.method public readExif(Ljava/io/InputStream;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_0

    nop

    :try_start_0
    new-instance v0, Lcom/android/gallery3d/exif/ExifReader;

    invoke-direct {v0, p0}, Lcom/android/gallery3d/exif/ExifReader;-><init>(Lcom/android/gallery3d/exif/ExifInterface;)V

    invoke-virtual {v0, p1}, Lcom/android/gallery3d/exif/ExifReader;->read(Ljava/io/InputStream;)Lcom/android/gallery3d/exif/ExifData;

    move-result-object p1
    :try_end_0
    .catch Lcom/android/gallery3d/exif/ExifInvalidFormatException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    iput-object p1, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    return-void

    :catch_0
    move-exception p1

    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid exif format : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Argument is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public readExif(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-virtual {p0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->readExif(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    nop

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    return-void

    :catch_0
    move-exception p1

    move-object v0, v1

    goto :goto_0

    :catch_1
    move-exception p1

    :goto_0
    invoke-static {v0}, Lcom/android/gallery3d/exif/ExifInterface;->closeSilently(Ljava/io/Closeable;)V

    throw p1

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Argument is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public readExif([B)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {p0, v0}, Lcom/android/gallery3d/exif/ExifInterface;->readExif(Ljava/io/InputStream;)V

    return-void
.end method

.method public removeCompressedThumbnail()V
    .locals 2

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/gallery3d/exif/ExifData;->setCompressedThumbnail([B)V

    return-void
.end method

.method public removeParallelProcessComment()V
    .locals 1

    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PARALLEL_PROCESS_COMMENT:I

    invoke-virtual {p0, v0}, Lcom/android/gallery3d/exif/ExifInterface;->deleteTag(I)V

    return-void
.end method

.method public removeTagDefinition(I)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagInfo()Landroid/util/SparseIntArray;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->delete(I)V

    return-void
.end method

.method public resetTagDefinitions()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    return-void
.end method

.method public rewriteExif(Ljava/lang/String;Ljava/util/Collection;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection<",
            "Lcom/android/gallery3d/exif/ExifTag;",
            ">;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    nop

    nop

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance p1, Ljava/io/BufferedInputStream;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {p1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    nop

    :try_start_1
    invoke-static {p1, p0}, Lcom/android/gallery3d/exif/ExifParser;->parse(Ljava/io/InputStream;Lcom/android/gallery3d/exif/ExifInterface;)Lcom/android/gallery3d/exif/ExifParser;

    move-result-object v2
    :try_end_1
    .catch Lcom/android/gallery3d/exif/ExifInvalidFormatException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    nop

    :try_start_2
    invoke-virtual {v2}, Lcom/android/gallery3d/exif/ExifParser;->getOffsetToExifEndFromSOF()I

    move-result v2

    int-to-long v7, v2

    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    nop

    :try_start_3
    new-instance p1, Ljava/io/RandomAccessFile;

    const-string v2, "rw"

    invoke-direct {p1, v1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-virtual {p1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v1

    cmp-long v1, v1, v7

    if-ltz v1, :cond_0

    invoke-virtual {p1}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v3

    sget-object v4, Ljava/nio/channels/FileChannel$MapMode;->READ_WRITE:Ljava/nio/channels/FileChannel$MapMode;

    const-wide/16 v5, 0x0

    invoke-virtual/range {v3 .. v8}, Ljava/nio/channels/FileChannel;->map(Ljava/nio/channels/FileChannel$MapMode;JJ)Ljava/nio/MappedByteBuffer;

    move-result-object v1

    invoke-virtual {p0, v1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->rewriteExif(Ljava/nio/ByteBuffer;Ljava/util/Collection;)Z

    move-result p2
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    invoke-static {v0}, Lcom/android/gallery3d/exif/ExifInterface;->closeSilently(Ljava/io/Closeable;)V

    nop

    invoke-virtual {p1}, Ljava/io/RandomAccessFile;->close()V

    return p2

    :cond_0
    :try_start_5
    new-instance p2, Ljava/io/IOException;

    const-string v1, "Filesize changed during operation"

    invoke-direct {p2, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :catch_0
    move-exception p2

    move-object v9, v0

    move-object v0, p1

    move-object p1, v9

    goto :goto_0

    :catch_1
    move-exception p2

    goto :goto_0

    :catch_2
    move-exception p2

    :try_start_6
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Invalid exif format : "

    invoke-direct {v1, v2, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_3
    move-exception p2

    move-object p1, v0

    :goto_0
    :try_start_7
    invoke-static {v0}, Lcom/android/gallery3d/exif/ExifInterface;->closeSilently(Ljava/io/Closeable;)V

    throw p2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :catchall_1
    move-exception p2

    move-object v0, p1

    move-object p1, p2

    :goto_1
    invoke-static {v0}, Lcom/android/gallery3d/exif/ExifInterface;->closeSilently(Ljava/io/Closeable;)V

    throw p1
.end method

.method public rewriteExif(Ljava/nio/ByteBuffer;Ljava/util/Collection;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            "Ljava/util/Collection<",
            "Lcom/android/gallery3d/exif/ExifTag;",
            ">;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    nop

    :try_start_0
    new-instance v0, Lcom/android/gallery3d/exif/ExifModifier;

    invoke-direct {v0, p1, p0}, Lcom/android/gallery3d/exif/ExifModifier;-><init>(Ljava/nio/ByteBuffer;Lcom/android/gallery3d/exif/ExifInterface;)V

    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/gallery3d/exif/ExifTag;

    invoke-virtual {v0, p2}, Lcom/android/gallery3d/exif/ExifModifier;->modifyTag(Lcom/android/gallery3d/exif/ExifTag;)V

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifModifier;->commit()Z

    move-result p1
    :try_end_0
    .catch Lcom/android/gallery3d/exif/ExifInvalidFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    new-instance p2, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid exif format : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public setCompressedThumbnail(Landroid/graphics/Bitmap;)Z
    .locals 3

    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v2, 0x5a

    invoke-virtual {p1, v1, v2, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->setCompressedThumbnail([B)Z

    move-result p1

    return p1
.end method

.method public setCompressedThumbnail([B)Z
    .locals 1

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifData;->clearThumbnailAndStrips()V

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0, p1}, Lcom/android/gallery3d/exif/ExifData;->setCompressedThumbnail([B)V

    const/4 p1, 0x1

    return p1
.end method

.method public setExif(Ljava/util/Collection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/android/gallery3d/exif/ExifTag;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifInterface;->clearExif()V

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->setTags(Ljava/util/Collection;)V

    return-void
.end method

.method public setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;
    .locals 1

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0, p1}, Lcom/android/gallery3d/exif/ExifData;->addTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object p1

    return-object p1
.end method

.method public setTagDefinition(SISS[I)I
    .locals 8

    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sBannedDefines:Ljava/util/HashSet;

    invoke-static {p1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-static {p3}, Lcom/android/gallery3d/exif/ExifTag;->isValidType(S)Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-static {p2}, Lcom/android/gallery3d/exif/ExifTag;->isValidIfd(I)Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-static {p2, p1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    if-ne v0, v1, :cond_1

    return v1

    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->getTagDefinitionsForTagId(S)[I

    move-result-object p1

    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagInfo()Landroid/util/SparseIntArray;

    move-result-object v2

    nop

    array-length v3, p5

    const/4 v4, 0x0

    move v5, v4

    move v6, v5

    :goto_0
    if-ge v5, v3, :cond_4

    aget v7, p5, v5

    if-ne p2, v7, :cond_2

    nop

    const/4 v6, 0x1

    :cond_2
    invoke-static {v7}, Lcom/android/gallery3d/exif/ExifTag;->isValidIfd(I)Z

    move-result v7

    if-nez v7, :cond_3

    return v1

    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_4
    if-nez v6, :cond_5

    return v1

    :cond_5
    invoke-static {p5}, Lcom/android/gallery3d/exif/ExifInterface;->getFlagsFromAllowedIfds([I)I

    move-result p2

    if-eqz p1, :cond_7

    array-length p5, p1

    :goto_1
    if-ge v4, p5, :cond_7

    aget v3, p1, v4

    invoke-virtual {v2, v3}, Landroid/util/SparseIntArray;->get(I)I

    move-result v3

    invoke-static {v3}, Lcom/android/gallery3d/exif/ExifInterface;->getAllowedIfdFlagsFromInfo(I)I

    move-result v3

    and-int/2addr v3, p2

    if-eqz v3, :cond_6

    return v1

    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_7
    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagInfo()Landroid/util/SparseIntArray;

    move-result-object p1

    shl-int/lit8 p2, p2, 0x18

    shl-int/lit8 p3, p3, 0x10

    or-int/2addr p2, p3

    or-int/2addr p2, p4

    invoke-virtual {p1, v0, p2}, Landroid/util/SparseIntArray;->put(II)V

    return v0

    :cond_8
    return v1
.end method

.method public setTagValue(IILjava/lang/Object;)Z
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getTag(II)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p1, p3}, Lcom/android/gallery3d/exif/ExifTag;->setValue(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public setTagValue(ILjava/lang/Object;)Z
    .locals 1

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->getDefinedTagDefaultIfd(I)I

    move-result v0

    invoke-virtual {p0, p1, v0, p2}, Lcom/android/gallery3d/exif/ExifInterface;->setTagValue(IILjava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public setTags(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/android/gallery3d/exif/ExifTag;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/gallery3d/exif/ExifTag;

    invoke-virtual {p0, v0}, Lcom/android/gallery3d/exif/ExifInterface;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public writeExif(Landroid/graphics/Bitmap;Ljava/io/OutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {p0, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getExifWriterStream(Ljava/io/OutputStream;)Ljava/io/OutputStream;

    move-result-object p2

    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v1, 0x5a

    invoke-virtual {p1, v0, v1, p2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Argument is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeExif(Landroid/graphics/Bitmap;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getExifWriterStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object p2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v1, 0x5a

    invoke-virtual {p1, v0, v1, p2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    nop

    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    return-void

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    move-object p2, v0

    :goto_0
    invoke-static {p2}, Lcom/android/gallery3d/exif/ExifInterface;->closeSilently(Ljava/io/Closeable;)V

    throw p1

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Argument is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeExif(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {p0, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getExifWriterStream(Ljava/io/OutputStream;)Ljava/io/OutputStream;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->doExifStreamIO(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Argument is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeExif(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getExifWriterStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object p2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-direct {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->doExifStreamIO(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    nop

    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    return-void

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    move-object p2, v0

    :goto_0
    invoke-static {p2}, Lcom/android/gallery3d/exif/ExifInterface;->closeSilently(Ljava/io/Closeable;)V

    throw p1

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Argument is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeExif(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-virtual {p0, v1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->writeExif(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    nop

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    return-void

    :catch_0
    move-exception p1

    move-object v0, v1

    goto :goto_0

    :catch_1
    move-exception p1

    :goto_0
    invoke-static {v0}, Lcom/android/gallery3d/exif/ExifInterface;->closeSilently(Ljava/io/Closeable;)V

    throw p1

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Argument is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeExif([BLjava/io/OutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {p0, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getExifWriterStream(Ljava/io/OutputStream;)Ljava/io/OutputStream;

    move-result-object p2

    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p2, p1, v0, v1}, Ljava/io/OutputStream;->write([BII)V

    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Argument is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeExif([BLjava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getExifWriterStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object p2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v0, 0x0

    :try_start_1
    array-length v1, p1

    invoke-virtual {p2, p1, v0, v1}, Ljava/io/OutputStream;->write([BII)V

    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    nop

    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    return-void

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    move-object p2, v0

    :goto_0
    invoke-static {p2}, Lcom/android/gallery3d/exif/ExifInterface;->closeSilently(Ljava/io/Closeable;)V

    throw p1

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Argument is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
