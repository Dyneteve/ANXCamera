.class public Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;
.super Lcom/android/camera/effect/draw_mode/DrawAttribute;
.source "DrawYuvAttribute.java"


# instance fields
.field public mApplyWaterMark:Z

.field public mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

.field public mCoordinatesOfTheRegionUnderWatermarks:[I

.field public mDataOfTheRegionUnderWatermarks:[B

.field public mDate:J

.field public mEffectIndex:I

.field public mImage:Landroid/media/Image;

.field public mIsGradienterOn:Z

.field public mJpegQuality:I

.field public mJpegRotation:I

.field public mMirror:Z

.field public mOrientation:I

.field public mOriginalSize:Landroid/util/Size;

.field public mOutputSize:Landroid/util/Size;

.field public mPictureSize:Landroid/util/Size;

.field public mPreviewSize:Landroid/util/Size;

.field public mShootRotation:F

.field public mTiltShiftMode:Ljava/lang/String;

.field public mTimeWatermark:Ljava/lang/String;

.field public mWaterInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;"
        }
    .end annotation
.end field

.field public mYuvImage:Lcom/android/camera/effect/MiYuvImage;


# direct methods
.method public constructor <init>(Landroid/media/Image;Landroid/util/Size;Landroid/util/Size;IIIFJZZZLjava/lang/String;Ljava/lang/String;Lcom/android/camera/effect/EffectController$EffectRectAttribute;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/media/Image;",
            "Landroid/util/Size;",
            "Landroid/util/Size;",
            "IIIFJZZZ",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/android/camera/effect/EffectController$EffectRectAttribute;",
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;)V"
        }
    .end annotation

    move-object v0, p0

    invoke-direct {v0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    move-object v1, p1

    iput-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mImage:Landroid/media/Image;

    move-object v1, p2

    iput-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPreviewSize:Landroid/util/Size;

    move-object v1, p3

    iput-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    move v1, p4

    iput v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mEffectIndex:I

    move v1, p5

    iput v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOrientation:I

    move v1, p6

    iput v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mJpegRotation:I

    move v1, p7

    iput v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mShootRotation:F

    move-wide v1, p8

    iput-wide v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mDate:J

    move v1, p10

    iput-boolean v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mMirror:Z

    move v1, p11

    iput-boolean v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mApplyWaterMark:Z

    move v1, p12

    iput-boolean v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mIsGradienterOn:Z

    move-object/from16 v1, p13

    iput-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTiltShiftMode:Ljava/lang/String;

    move-object/from16 v1, p14

    iput-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTimeWatermark:Ljava/lang/String;

    move-object/from16 v1, p15

    iput-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    const/16 v1, 0xb

    iput v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTarget:I

    move-object/from16 v1, p16

    iput-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mWaterInfos:Ljava/util/List;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mDataOfTheRegionUnderWatermarks:[B

    iput-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mCoordinatesOfTheRegionUnderWatermarks:[I

    const/16 v1, 0x61

    iput v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mJpegQuality:I

    return-void
.end method
