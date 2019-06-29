.class public Lorg/jcodec/containers/mp4/boxes/TrunBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "TrunBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jcodec/containers/mp4/boxes/TrunBox$Factory;
    }
.end annotation


# static fields
.field private static final DATA_OFFSET_AVAILABLE:I = 0x1

.field private static final FIRST_SAMPLE_FLAGS_AVAILABLE:I = 0x4

.field private static final SAMPLE_COMPOSITION_OFFSET_AVAILABLE:I = 0x800

.field private static final SAMPLE_DURATION_AVAILABLE:I = 0x100

.field private static final SAMPLE_FLAGS_AVAILABLE:I = 0x400

.field private static final SAMPLE_SIZE_AVAILABLE:I = 0x200


# instance fields
.field private dataOffset:I

.field private firstSampleFlags:I

.field private sampleCompositionOffset:[I

.field private sampleCount:I

.field private sampleDuration:[I

.field private sampleFlags:[I

.field private sampleSize:[I


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-void
.end method

.method static synthetic access$002(Lorg/jcodec/containers/mp4/boxes/TrunBox;I)I
    .locals 0

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->dataOffset:I

    return p1
.end method

.method static synthetic access$102(Lorg/jcodec/containers/mp4/boxes/TrunBox;I)I
    .locals 0

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->firstSampleFlags:I

    return p1
.end method

.method static synthetic access$200(Lorg/jcodec/containers/mp4/boxes/TrunBox;)I
    .locals 0

    iget p0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    return p0
.end method

.method static synthetic access$302(Lorg/jcodec/containers/mp4/boxes/TrunBox;[I)[I
    .locals 0

    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleDuration:[I

    return-object p1
.end method

.method static synthetic access$402(Lorg/jcodec/containers/mp4/boxes/TrunBox;[I)[I
    .locals 0

    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleSize:[I

    return-object p1
.end method

.method static synthetic access$502(Lorg/jcodec/containers/mp4/boxes/TrunBox;[I)[I
    .locals 0

    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleFlags:[I

    return-object p1
.end method

.method static synthetic access$602(Lorg/jcodec/containers/mp4/boxes/TrunBox;[I)[I
    .locals 0

    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCompositionOffset:[I

    return-object p1
.end method

.method public static copy(Lorg/jcodec/containers/mp4/boxes/TrunBox;)Lorg/jcodec/containers/mp4/boxes/TrunBox$Factory;
    .locals 7

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    iget v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->dataOffset:I

    iget v2, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->firstSampleFlags:I

    iget-object v3, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleDuration:[I

    iget-object v4, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleSize:[I

    iget-object v5, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleFlags:[I

    iget-object v6, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCompositionOffset:[I

    invoke-static/range {v0 .. v6}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->createTrunBox2(III[I[I[I[I)Lorg/jcodec/containers/mp4/boxes/TrunBox;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->getFlags()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->setFlags(I)V

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->getVersion()B

    move-result p0

    invoke-virtual {v0, p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->setVersion(B)V

    new-instance p0, Lorg/jcodec/containers/mp4/boxes/TrunBox$Factory;

    invoke-direct {p0, v0}, Lorg/jcodec/containers/mp4/boxes/TrunBox$Factory;-><init>(Lorg/jcodec/containers/mp4/boxes/TrunBox;)V

    return-object p0
.end method

.method public static create(I)Lorg/jcodec/containers/mp4/boxes/TrunBox$Factory;
    .locals 1

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/TrunBox$Factory;

    invoke-static {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->createTrunBox1(I)Lorg/jcodec/containers/mp4/boxes/TrunBox;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox$Factory;-><init>(Lorg/jcodec/containers/mp4/boxes/TrunBox;)V

    return-object v0
.end method

.method public static createTrunBox()Lorg/jcodec/containers/mp4/boxes/TrunBox;
    .locals 3

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/TrunBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-object v0
.end method

.method public static createTrunBox1(I)Lorg/jcodec/containers/mp4/boxes/TrunBox;
    .locals 3

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/TrunBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    iput p0, v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    return-object v0
.end method

.method public static createTrunBox2(III[I[I[I[I)Lorg/jcodec/containers/mp4/boxes/TrunBox;
    .locals 3

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/TrunBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    iput p0, v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    iput p1, v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->dataOffset:I

    iput p2, v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->firstSampleFlags:I

    iput-object p3, v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleDuration:[I

    iput-object p4, v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleSize:[I

    iput-object p5, v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleFlags:[I

    iput-object p6, v0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCompositionOffset:[I

    return-object v0
.end method

.method public static flagsGetSampleDegradationPriority(I)I
    .locals 1

    shr-int/lit8 p0, p0, 0x10

    const v0, 0xffff

    and-int/2addr p0, v0

    return p0
.end method

.method public static flagsGetSampleDependsOn(I)I
    .locals 0

    shr-int/lit8 p0, p0, 0x6

    and-int/lit8 p0, p0, 0x3

    return p0
.end method

.method public static flagsGetSampleHasRedundancy(I)I
    .locals 0

    shr-int/lit8 p0, p0, 0xa

    and-int/lit8 p0, p0, 0x3

    return p0
.end method

.method public static flagsGetSampleIsDependedOn(I)I
    .locals 0

    shr-int/lit8 p0, p0, 0x8

    and-int/lit8 p0, p0, 0x3

    return p0
.end method

.method public static flagsGetSampleIsDifferentSample(I)I
    .locals 0

    shr-int/lit8 p0, p0, 0xf

    and-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public static flagsGetSamplePaddingValue(I)I
    .locals 0

    shr-int/lit8 p0, p0, 0xc

    and-int/lit8 p0, p0, 0x7

    return p0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "trun"

    return-object v0
.end method


# virtual methods
.method public doWrite(Ljava/nio/ByteBuffer;)V
    .locals 2

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isDataOffsetAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->dataOffset:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    :cond_0
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isFirstSampleFlagsAvailable()Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->firstSampleFlags:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iget v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    if-ge v0, v1, :cond_6

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleDurationAvailable()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleDuration:[I

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    :cond_2
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleSizeAvailable()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleSize:[I

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    :cond_3
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleFlagsAvailable()Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleFlags:[I

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    :cond_4
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleCompositionOffsetAvailable()Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCompositionOffset:[I

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_6
    return-void
.end method

.method public estimateSize()I
    .locals 2

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    mul-int/lit8 v0, v0, 0x10

    const/16 v1, 0x18

    add-int/2addr v1, v0

    return v1
.end method

.method public getDataOffset()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->dataOffset:I

    return v0
.end method

.method public getFirstSampleFlags()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->firstSampleFlags:I

    return v0
.end method

.method public getSampleCompositionOffset(I)J
    .locals 2

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCompositionOffset:[I

    aget p1, v0, p1

    invoke-static {p1}, Lorg/jcodec/platform/Platform;->unsignedInt(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getSampleCompositionOffsets()[I
    .locals 1

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCompositionOffset:[I

    return-object v0
.end method

.method public getSampleCount()J
    .locals 2

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    invoke-static {v0}, Lorg/jcodec/platform/Platform;->unsignedInt(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getSampleDuration(I)J
    .locals 2

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleDuration:[I

    aget p1, v0, p1

    invoke-static {p1}, Lorg/jcodec/platform/Platform;->unsignedInt(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getSampleDurations()[I
    .locals 1

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleDuration:[I

    return-object v0
.end method

.method public getSampleFlags(I)I
    .locals 1

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleFlags:[I

    aget p1, v0, p1

    return p1
.end method

.method public getSampleSize(I)J
    .locals 2

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleSize:[I

    aget p1, v0, p1

    invoke-static {p1}, Lorg/jcodec/platform/Platform;->unsignedInt(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getSampleSizes()[I
    .locals 1

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleSize:[I

    return-object v0
.end method

.method public getSamplesFlags()[I
    .locals 1

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleFlags:[I

    return-object v0
.end method

.method public isDataOffsetAvailable()Z
    .locals 2

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->flags:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isFirstSampleFlagsAvailable()Z
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->flags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSampleCompositionOffsetAvailable()Z
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->flags:I

    and-int/lit16 v0, v0, 0x800

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSampleDurationAvailable()Z
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->flags:I

    and-int/lit16 v0, v0, 0x100

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSampleFlagsAvailable()Z
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->flags:I

    and-int/lit16 v0, v0, 0x400

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSampleSizeAvailable()Z
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->flags:I

    and-int/lit16 v0, v0, 0x200

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 3

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleFlagsAvailable()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isFirstSampleFlagsAvailable()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Broken stream"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isDataOffsetAvailable()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->dataOffset:I

    :cond_2
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isFirstSampleFlagsAvailable()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->firstSampleFlags:I

    :cond_3
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleDurationAvailable()Z

    move-result v0

    if-eqz v0, :cond_4

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleDuration:[I

    :cond_4
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleSizeAvailable()Z

    move-result v0

    if-eqz v0, :cond_5

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleSize:[I

    :cond_5
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleFlagsAvailable()Z

    move-result v0

    if-eqz v0, :cond_6

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleFlags:[I

    :cond_6
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleCompositionOffsetAvailable()Z

    move-result v0

    if-eqz v0, :cond_7

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCompositionOffset:[I

    :cond_7
    const/4 v0, 0x0

    :goto_1
    iget v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCount:I

    if-ge v0, v1, :cond_c

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleDurationAvailable()Z

    move-result v1

    if-eqz v1, :cond_8

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleDuration:[I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    aput v2, v1, v0

    :cond_8
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleSizeAvailable()Z

    move-result v1

    if-eqz v1, :cond_9

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleSize:[I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    aput v2, v1, v0

    :cond_9
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleFlagsAvailable()Z

    move-result v1

    if-eqz v1, :cond_a

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleFlags:[I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    aput v2, v1, v0

    :cond_a
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrunBox;->isSampleCompositionOffsetAvailable()Z

    move-result v1

    if-eqz v1, :cond_b

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->sampleCompositionOffset:[I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    aput v2, v1, v0

    :cond_b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_c
    return-void
.end method

.method public setDataOffset(I)V
    .locals 0

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrunBox;->dataOffset:I

    return-void
.end method
