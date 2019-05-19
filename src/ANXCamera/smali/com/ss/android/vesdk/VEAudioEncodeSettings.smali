.class public Lcom/ss/android/vesdk/VEAudioEncodeSettings;
.super Ljava/lang/Object;
.source "VEAudioEncodeSettings.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/vesdk/VEAudioEncodeSettings$Builder;,
        Lcom/ss/android/vesdk/VEAudioEncodeSettings$ENCODE_STANDARD;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/ss/android/vesdk/VEAudioEncodeSettings;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mBps:I

.field private mChannelCount:I

.field private mCodec:Lcom/ss/android/vesdk/VEAudioEncodeSettings$ENCODE_STANDARD;

.field private mHwEnc:Z

.field private mSampleRate:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/ss/android/vesdk/VEAudioEncodeSettings$1;

    invoke-direct {v0}, Lcom/ss/android/vesdk/VEAudioEncodeSettings$1;-><init>()V

    sput-object v0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0xac44

    iput v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mSampleRate:I

    const/high16 v1, 0x20000

    iput v1, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mBps:I

    const/4 v2, 0x2

    iput v2, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mChannelCount:I

    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mHwEnc:Z

    iput v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mSampleRate:I

    iput v1, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mBps:I

    iput v2, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mChannelCount:I

    iput-boolean v3, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mHwEnc:Z

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0xac44

    iput v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mSampleRate:I

    const/high16 v0, 0x20000

    iput v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mBps:I

    const/4 v0, 0x2

    iput v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mChannelCount:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mHwEnc:Z

    const-class v1, Lcom/ss/android/vesdk/VEAudioEncodeSettings$ENCODE_STANDARD;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/ss/android/vesdk/VEAudioEncodeSettings$ENCODE_STANDARD;

    iput-object v1, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mCodec:Lcom/ss/android/vesdk/VEAudioEncodeSettings$ENCODE_STANDARD;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mSampleRate:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mBps:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mChannelCount:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result p1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    nop

    :cond_0
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mHwEnc:Z

    return-void
.end method

.method private constructor <init>(Lcom/ss/android/vesdk/VEAudioEncodeSettings$Builder;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0xac44

    iput v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mSampleRate:I

    const/high16 v0, 0x20000

    iput v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mBps:I

    const/4 v0, 0x2

    iput v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mChannelCount:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mHwEnc:Z

    invoke-static {p1}, Lcom/ss/android/vesdk/VEAudioEncodeSettings$Builder;->access$000(Lcom/ss/android/vesdk/VEAudioEncodeSettings$Builder;)Lcom/ss/android/vesdk/VEAudioEncodeSettings$ENCODE_STANDARD;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mCodec:Lcom/ss/android/vesdk/VEAudioEncodeSettings$ENCODE_STANDARD;

    invoke-static {p1}, Lcom/ss/android/vesdk/VEAudioEncodeSettings$Builder;->access$100(Lcom/ss/android/vesdk/VEAudioEncodeSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mSampleRate:I

    invoke-static {p1}, Lcom/ss/android/vesdk/VEAudioEncodeSettings$Builder;->access$200(Lcom/ss/android/vesdk/VEAudioEncodeSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mBps:I

    invoke-static {p1}, Lcom/ss/android/vesdk/VEAudioEncodeSettings$Builder;->access$300(Lcom/ss/android/vesdk/VEAudioEncodeSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mChannelCount:I

    invoke-static {p1}, Lcom/ss/android/vesdk/VEAudioEncodeSettings$Builder;->access$400(Lcom/ss/android/vesdk/VEAudioEncodeSettings$Builder;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mHwEnc:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/ss/android/vesdk/VEAudioEncodeSettings$Builder;Lcom/ss/android/vesdk/VEAudioEncodeSettings$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/VEAudioEncodeSettings;-><init>(Lcom/ss/android/vesdk/VEAudioEncodeSettings$Builder;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getBps()I
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mBps:I

    return v0
.end method

.method public getChannelCount()I
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mChannelCount:I

    return v0
.end method

.method public getCodec()Lcom/ss/android/vesdk/VEAudioEncodeSettings$ENCODE_STANDARD;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mCodec:Lcom/ss/android/vesdk/VEAudioEncodeSettings$ENCODE_STANDARD;

    return-object v0
.end method

.method public getSampleRate()I
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mSampleRate:I

    return v0
.end method

.method public isHwEnc()Z
    .locals 1

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mHwEnc:Z

    return v0
.end method

.method public setBps(I)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iput p1, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mBps:I

    return-void
.end method

.method public setChannelCount(I)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iput p1, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mChannelCount:I

    return-void
.end method

.method public setCodec(Lcom/ss/android/vesdk/VEAudioEncodeSettings$ENCODE_STANDARD;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iput-object p1, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mCodec:Lcom/ss/android/vesdk/VEAudioEncodeSettings$ENCODE_STANDARD;

    return-void
.end method

.method public setHwEnc(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mHwEnc:Z

    return-void
.end method

.method public setSampleRate(I)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iput p1, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mSampleRate:I

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mCodec:Lcom/ss/android/vesdk/VEAudioEncodeSettings$ENCODE_STANDARD;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget p2, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mSampleRate:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mBps:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mChannelCount:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-boolean p2, p0, Lcom/ss/android/vesdk/VEAudioEncodeSettings;->mHwEnc:Z

    int-to-byte p2, p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    return-void
.end method
