.class public Lcom/ss/android/vesdk/VEVideoEncodeSettings;
.super Ljava/lang/Object;
.source "VEVideoEncodeSettings.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;,
        Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;,
        Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;,
        Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;,
        Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;,
        Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/ss/android/vesdk/VEVideoEncodeSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static final USAGE_COMPILE:I = 0x2

.field public static final USAGE_IMPORT:I = 0x3

.field public static final USAGE_RECORD:I = 0x1


# instance fields
.field private bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

.field private bps:I

.field public compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

.field private encodeProfile:I

.field private encodeStandard:I

.field private fps:I

.field private gopSize:I

.field private hasBFrame:Z

.field private mWatermarkParam:Lcom/ss/android/vesdk/VEWatermarkParam;

.field private outputSize:Lcom/ss/android/vesdk/VESize;

.field private resizeMode:I

.field private resizeX:F

.field private resizeY:F

.field private rotate:I

.field private speed:F

.field private swCRF:I

.field private swMaxrate:I

.field private swPreset:I

.field private swQP:I

.field private useHWEncoder:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$1;

    invoke-direct {v0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$1;-><init>()V

    sput-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>()V
    .locals 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    const/4 v1, 0x2

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    const/4 v2, 0x0

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->speed:F

    new-instance v2, Lcom/ss/android/vesdk/VESize;

    const/16 v3, 0x400

    const/16 v4, 0x240

    invoke-direct {v2, v4, v3}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    sget-object v2, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    const/high16 v2, 0x400000

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    const/16 v5, 0xf

    iput v5, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    const/16 v1, 0x1e

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    const/16 v5, 0x3c

    iput v5, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    sget-object v5, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;->ENCODE_LEVEL_ULTRAFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;

    invoke-virtual {v5}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;->ordinal()I

    move-result v5

    iput v5, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swPreset:I

    sget-object v5, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ENCODE_STANDARD_H264:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;

    invoke-virtual {v5}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ordinal()I

    move-result v5

    iput v5, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeStandard:I

    sget-object v5, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_BASELINE:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    invoke-virtual {v5}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ordinal()I

    move-result v5

    iput v5, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    const v5, 0x4c4b40

    iput v5, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swMaxrate:I

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->hasBFrame:Z

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    iput v4, v0, Lcom/ss/android/vesdk/VESize;->width:I

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    iput v3, v0, Lcom/ss/android/vesdk/VESize;->height:I

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;->COMPILE_TYPE_MP4:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    const/4 v1, 0x2

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    const/4 v2, 0x0

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->speed:F

    new-instance v2, Lcom/ss/android/vesdk/VESize;

    const/16 v3, 0x240

    const/16 v4, 0x400

    invoke-direct {v2, v3, v4}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    sget-object v2, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    const/high16 v2, 0x400000

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    const/16 v2, 0xf

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    const/16 v1, 0x1e

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    const/16 v1, 0x3c

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;->ENCODE_LEVEL_ULTRAFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swPreset:I

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ENCODE_STANDARD_H264:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeStandard:I

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_BASELINE:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    const v1, 0x4c4b40

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swMaxrate:I

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->hasBFrame:Z

    const-class v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    iput-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->speed:F

    const-class v1, Lcom/ss/android/vesdk/VESize;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/ss/android/vesdk/VESize;

    iput-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    const-class v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swPreset:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeStandard:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    iput-boolean v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_1

    move v0, v2

    nop

    :cond_1
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->hasBFrame:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swMaxrate:I

    const-class v0, Lcom/ss/android/vesdk/VEWatermarkParam;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/ss/android/vesdk/VEWatermarkParam;

    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->mWatermarkParam:Lcom/ss/android/vesdk/VEWatermarkParam;

    return-void
.end method

.method public constructor <init>(Lcom/ss/android/vesdk/VESize;Z)V
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    const/4 v1, 0x2

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    const/4 v2, 0x0

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->speed:F

    new-instance v2, Lcom/ss/android/vesdk/VESize;

    const/16 v3, 0x240

    const/16 v4, 0x400

    invoke-direct {v2, v3, v4}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    sget-object v2, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    const/high16 v2, 0x400000

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    const/16 v2, 0xf

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    const/16 v1, 0x1e

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    const/16 v1, 0x3c

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;->ENCODE_LEVEL_ULTRAFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swPreset:I

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ENCODE_STANDARD_H264:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeStandard:I

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_BASELINE:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    const v1, 0x4c4b40

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swMaxrate:I

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->hasBFrame:Z

    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    iput-boolean p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    sget-object p1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;->COMPILE_TYPE_MP4:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    return-void
.end method

.method public constructor <init>(Lcom/ss/android/vesdk/VESize;ZII)V
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    const/4 v1, 0x2

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    const/4 v2, 0x0

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->speed:F

    new-instance v2, Lcom/ss/android/vesdk/VESize;

    const/16 v3, 0x240

    const/16 v4, 0x400

    invoke-direct {v2, v3, v4}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    sget-object v2, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    const/high16 v2, 0x400000

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    const/16 v2, 0xf

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    const/16 v1, 0x1e

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    const/16 v1, 0x3c

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;->ENCODE_LEVEL_ULTRAFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swPreset:I

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ENCODE_STANDARD_H264:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeStandard:I

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_BASELINE:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    const v1, 0x4c4b40

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swMaxrate:I

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->hasBFrame:Z

    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    iput-boolean p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    iput p3, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    iput p4, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    sget-object p1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;->COMPILE_TYPE_MP4:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    return-void
.end method

.method public constructor <init>(Lcom/ss/android/vesdk/VESize;ZIIIIZ)V
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    const/4 v1, 0x2

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    const/4 v2, 0x0

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->speed:F

    new-instance v2, Lcom/ss/android/vesdk/VESize;

    const/16 v3, 0x240

    const/16 v4, 0x400

    invoke-direct {v2, v3, v4}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    sget-object v2, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    const/high16 v2, 0x400000

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    const/16 v2, 0xf

    iput v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    const/16 v1, 0x1e

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    const/16 v1, 0x3c

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;->ENCODE_LEVEL_ULTRAFAST:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swPreset:I

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ENCODE_STANDARD_H264:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeStandard:I

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_BASELINE:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ordinal()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    const v1, 0x4c4b40

    iput v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swMaxrate:I

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->hasBFrame:Z

    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    iput-boolean p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    iput p3, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    iput p4, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    iput p5, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    iput p6, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swPreset:I

    iput-boolean p7, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->hasBFrame:Z

    sget-object p1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;->COMPILE_TYPE_MP4:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    return-void
.end method

.method synthetic constructor <init>(Lcom/ss/android/vesdk/VEVideoEncodeSettings$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;-><init>()V

    return-void
.end method

.method static synthetic access$1002(Lcom/ss/android/vesdk/VEVideoEncodeSettings;F)F
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    return p1
.end method

.method static synthetic access$102(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    return p1
.end method

.method static synthetic access$1102(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    return p1
.end method

.method static synthetic access$1200(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I
    .locals 0

    iget p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    return p0
.end method

.method static synthetic access$1202(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    return p1
.end method

.method static synthetic access$1302(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swPreset:I

    return p1
.end method

.method static synthetic access$1400(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I
    .locals 0

    iget p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    return p0
.end method

.method static synthetic access$1402(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    return p1
.end method

.method static synthetic access$1500(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I
    .locals 0

    iget p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swMaxrate:I

    return p0
.end method

.method static synthetic access$1502(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swMaxrate:I

    return p1
.end method

.method static synthetic access$1602(Lcom/ss/android/vesdk/VEVideoEncodeSettings;F)F
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->speed:F

    return p1
.end method

.method static synthetic access$1702(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeStandard:I

    return p1
.end method

.method static synthetic access$1802(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->hasBFrame:Z

    return p1
.end method

.method static synthetic access$1902(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VEWatermarkParam;)Lcom/ss/android/vesdk/VEWatermarkParam;
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->mWatermarkParam:Lcom/ss/android/vesdk/VEWatermarkParam;

    return-object p1
.end method

.method static synthetic access$202(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    return-object p1
.end method

.method static synthetic access$300(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I
    .locals 0

    iget p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    return p0
.end method

.method static synthetic access$302(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    return p1
.end method

.method static synthetic access$402(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    return p1
.end method

.method static synthetic access$500(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I
    .locals 0

    iget p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    return p0
.end method

.method static synthetic access$502(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    return p1
.end method

.method static synthetic access$600(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)Lcom/ss/android/vesdk/VESize;
    .locals 0

    iget-object p0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    return-object p0
.end method

.method static synthetic access$602(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VESize;)Lcom/ss/android/vesdk/VESize;
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    return-object p1
.end method

.method static synthetic access$702(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    return p1
.end method

.method static synthetic access$802(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    return p1
.end method

.method static synthetic access$902(Lcom/ss/android/vesdk/VEVideoEncodeSettings;F)F
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    return p1
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getBitrateMode()Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    return-object v0
.end method

.method public getBitrateValue()I
    .locals 2

    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$2;->$SwitchMap$com$ss$android$vesdk$VEVideoEncodeSettings$ENCODE_BITRATE_MODE:[I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "CompileTime BUG by SDK. Unhandled ENCODE_BITRATE_MODE enum value."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getBps()I

    move-result v0

    return v0

    :pswitch_1
    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getSwQP()I

    move-result v0

    return v0

    :pswitch_2
    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getSwCRF()I

    move-result v0

    return v0

    :pswitch_3
    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getBps()I

    move-result v0

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getBps()I
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    return v0
.end method

.method public getCompileType()Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    return-object v0
.end method

.method public getEncodeProfile()I
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    return v0
.end method

.method public getFps()I
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    return v0
.end method

.method public getGopSize()I
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    return v0
.end method

.method public getResizeMode()I
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    return v0
.end method

.method public getResizeX()F
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    return v0
.end method

.method public getResizeY()F
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    return v0
.end method

.method public getRotate()I
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    return v0
.end method

.method public getSpeed()F
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->speed:F

    return v0
.end method

.method public getSwCRF()I
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    return v0
.end method

.method public getSwMaxRate()I
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swMaxrate:I

    return v0
.end method

.method public getSwPreset()I
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swPreset:I

    return v0
.end method

.method public getSwQP()I
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    return v0
.end method

.method public getVideoRes()Lcom/ss/android/vesdk/VESize;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    return-object v0
.end method

.method public getWatermarkParam()Lcom/ss/android/vesdk/VEWatermarkParam;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->mWatermarkParam:Lcom/ss/android/vesdk/VEWatermarkParam;

    return-object v0
.end method

.method public isHwEnc()Z
    .locals 1

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    return v0
.end method

.method public setBps(I)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_VBR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    return-void
.end method

.method public setCompileType(Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    return-void
.end method

.method public setEncodeProfile(Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;)V
    .locals 0

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ordinal()I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    return-void
.end method

.method public setFps(I)V
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    return-void
.end method

.method public setGopSize(I)V
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    return-void
.end method

.method public setHwEnc(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    return-void
.end method

.method public setQP(I)V
    .locals 1

    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_QP:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    return-void
.end method

.method public setResizeMode(I)V
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    return-void
.end method

.method public setResizeX(F)V
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    return-void
.end method

.method public setResizeY(F)V
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    return-void
.end method

.method public setRotate(I)V
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    return-void
.end method

.method public setSWCRF(I)V
    .locals 1

    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_CRF:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    return-void
.end method

.method public setSpeed(F)V
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->speed:F

    return-void
.end method

.method public setSwPreset(Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;)V
    .locals 0

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;->ordinal()I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swPreset:I

    return-void
.end method

.method public setVideoBitrate(Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;I)V
    .locals 1

    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    sget-object p1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$2;->$SwitchMap$com$ss$android$vesdk$VEVideoEncodeSettings$ENCODE_BITRATE_MODE:[I

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ordinal()I

    move-result v0

    aget p1, p1, v0

    packed-switch p1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "CompileTime BUG by sdk. Unhandled bitrateMode"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    iput p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    goto :goto_0

    :pswitch_1
    iput p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    goto :goto_0

    :pswitch_2
    iput p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    goto :goto_0

    :pswitch_3
    iput p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    nop

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setVideoRes(II)V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    iput p1, v0, Lcom/ss/android/vesdk/VESize;->width:I

    iget-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    iput p2, p1, Lcom/ss/android/vesdk/VESize;->height:I

    return-void
.end method

.method public setWatermark(Lcom/ss/android/vesdk/VEWatermarkParam;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->mWatermarkParam:Lcom/ss/android/vesdk/VEWatermarkParam;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->rotate:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeMode:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeX:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->resizeY:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->speed:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->outputSize:Lcom/ss/android/vesdk/VESize;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bitrateMode:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->bps:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->fps:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swCRF:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swQP:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->gopSize:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swPreset:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeStandard:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->encodeProfile:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->useHWEncoder:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->hasBFrame:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->swMaxrate:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->mWatermarkParam:Lcom/ss/android/vesdk/VEWatermarkParam;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    return-void
.end method
