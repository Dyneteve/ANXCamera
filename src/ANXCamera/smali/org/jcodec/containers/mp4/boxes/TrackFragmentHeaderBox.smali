.class public Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "TrackFragmentHeaderBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;
    }
.end annotation


# static fields
.field public static final FLAG_BASE_DATA_OFFSET:I = 0x1

.field public static final FLAG_DEFAILT_SAMPLE_DURATION:I = 0x8

.field public static final FLAG_DEFAILT_SAMPLE_FLAGS:I = 0x20

.field public static final FLAG_DEFAULT_SAMPLE_SIZE:I = 0x10

.field public static final FLAG_SAMPLE_DESCRIPTION_INDEX:I = 0x2


# instance fields
.field private baseDataOffset:J

.field private defaultSampleDuration:I

.field private defaultSampleFlags:I

.field private defaultSampleSize:I

.field private sampleDescriptionIndex:I

.field private trackId:I


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-void
.end method

.method static synthetic access$002(Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;J)J
    .locals 0

    iput-wide p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->baseDataOffset:J

    return-wide p1
.end method

.method static synthetic access$102(Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;I)I
    .locals 0

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->sampleDescriptionIndex:I

    return p1
.end method

.method static synthetic access$202(Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;I)I
    .locals 0

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->defaultSampleDuration:I

    return p1
.end method

.method static synthetic access$302(Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;I)I
    .locals 0

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->defaultSampleSize:I

    return p1
.end method

.method static synthetic access$402(Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;I)I
    .locals 0

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->defaultSampleFlags:I

    return p1
.end method

.method public static copy(Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;)Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;
    .locals 7

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->trackId:I

    iget-wide v1, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->baseDataOffset:J

    iget v3, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->sampleDescriptionIndex:I

    iget v4, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->defaultSampleDuration:I

    iget v5, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->defaultSampleSize:I

    iget v6, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->defaultSampleFlags:I

    invoke-static/range {v0 .. v6}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->tfhd(IJIIII)Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->getFlags()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->setFlags(I)V

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->getVersion()B

    move-result p0

    invoke-virtual {v0, p0}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->setVersion(B)V

    new-instance p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;

    invoke-direct {p0, v0}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;-><init>(Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;)V

    return-object p0
.end method

.method public static create(I)Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;
    .locals 1

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;

    invoke-static {p0}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->createTrackFragmentHeaderBoxWithId(I)Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox$Factory;-><init>(Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;)V

    return-object v0
.end method

.method public static createTrackFragmentHeaderBox()Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;
    .locals 3

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-object v0
.end method

.method public static createTrackFragmentHeaderBoxWithId(I)Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;
    .locals 3

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    iput p0, v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->trackId:I

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    const-string v0, "tfhd"

    return-object v0
.end method

.method public static tfhd(IJIIII)Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;
    .locals 3

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    iput p0, v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->trackId:I

    iput-wide p1, v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->baseDataOffset:J

    iput p3, v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->sampleDescriptionIndex:I

    iput p4, v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->defaultSampleDuration:I

    iput p5, v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->defaultSampleSize:I

    iput p6, v0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->defaultSampleFlags:I

    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 2

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->trackId:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->isBaseDataOffsetAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->baseDataOffset:J

    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    :cond_0
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->isSampleDescriptionIndexAvailable()Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->sampleDescriptionIndex:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    :cond_1
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->isDefaultSampleDurationAvailable()Z

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->defaultSampleDuration:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    :cond_2
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->isDefaultSampleSizeAvailable()Z

    move-result v0

    if-eqz v0, :cond_3

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->defaultSampleSize:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    :cond_3
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->isDefaultSampleFlagsAvailable()Z

    move-result v0

    if-eqz v0, :cond_4

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->defaultSampleFlags:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    :cond_4
    return-void
.end method

.method public estimateSize()I
    .locals 1

    const/16 v0, 0x28

    return v0
.end method

.method public getBaseDataOffset()J
    .locals 2

    iget-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->baseDataOffset:J

    return-wide v0
.end method

.method public getDefaultSampleDuration()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->defaultSampleDuration:I

    return v0
.end method

.method public getDefaultSampleFlags()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->defaultSampleFlags:I

    return v0
.end method

.method public getDefaultSampleSize()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->defaultSampleSize:I

    return v0
.end method

.method public getSampleDescriptionIndex()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->sampleDescriptionIndex:I

    return v0
.end method

.method public getTrackId()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->trackId:I

    return v0
.end method

.method public isBaseDataOffsetAvailable()Z
    .locals 2

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->flags:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isDefaultSampleDurationAvailable()Z
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->flags:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isDefaultSampleFlagsAvailable()Z
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->flags:I

    and-int/lit8 v0, v0, 0x20

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isDefaultSampleSizeAvailable()Z
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->flags:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSampleDescriptionIndexAvailable()Z
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->flags:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 2

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->trackId:I

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->isBaseDataOffsetAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->baseDataOffset:J

    :cond_0
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->isSampleDescriptionIndexAvailable()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->sampleDescriptionIndex:I

    :cond_1
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->isDefaultSampleDurationAvailable()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->defaultSampleDuration:I

    :cond_2
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->isDefaultSampleSizeAvailable()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->defaultSampleSize:I

    :cond_3
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->isDefaultSampleFlagsAvailable()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result p1

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->defaultSampleFlags:I

    :cond_4
    return-void
.end method

.method public setDefaultSampleFlags(I)V
    .locals 0

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->defaultSampleFlags:I

    return-void
.end method

.method public setTrackId(I)V
    .locals 0

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackFragmentHeaderBox;->trackId:I

    return-void
.end method
