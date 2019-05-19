.class public Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "MovieHeaderBox.java"


# instance fields
.field private created:J

.field private duration:J

.field private matrix:[I

.field private modified:J

.field private nextTrackId:I

.field private rate:F

.field private timescale:I

.field private volume:F


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-void
.end method

.method public static createMovieHeaderBox(IJFFJJ[II)Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;
    .locals 3

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    iput p0, v0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->timescale:I

    iput-wide p1, v0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->duration:J

    iput p3, v0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->rate:F

    iput p4, v0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->volume:F

    iput-wide p5, v0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->created:J

    iput-wide p7, v0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->modified:J

    iput-object p9, v0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->matrix:[I

    iput p10, v0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->nextTrackId:I

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    const-string v0, "mvhd"

    return-object v0
.end method

.method private readMatrix(Ljava/nio/ByteBuffer;)[I
    .locals 4

    const/16 v0, 0x9

    new-array v1, v0, [I

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method private readRate(Ljava/nio/ByteBuffer;)F
    .locals 1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result p1

    int-to-float p1, p1

    const/high16 v0, 0x47800000    # 65536.0f

    div-float/2addr p1, v0

    return p1
.end method

.method private readVolume(Ljava/nio/ByteBuffer;)F
    .locals 1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result p1

    int-to-float p1, p1

    const/high16 v0, 0x43800000    # 256.0f

    div-float/2addr p1, v0

    return p1
.end method

.method private writeFixed1616(Ljava/nio/ByteBuffer;F)V
    .locals 4

    float-to-double v0, p2

    const-wide/high16 v2, 0x40f0000000000000L    # 65536.0

    mul-double/2addr v0, v2

    double-to-int p2, v0

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    return-void
.end method

.method private writeFixed88(Ljava/nio/ByteBuffer;F)V
    .locals 4

    float-to-double v0, p2

    const-wide/high16 v2, 0x4070000000000000L    # 256.0

    mul-double/2addr v0, v2

    double-to-int p2, v0

    int-to-short p2, p2

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    return-void
.end method

.method private writeMatrix(Ljava/nio/ByteBuffer;)V
    .locals 4

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v2, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->matrix:[I

    array-length v2, v2

    const/16 v3, 0x9

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    if-ge v1, v2, :cond_0

    iget-object v2, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->matrix:[I

    aget v2, v2, v1

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->matrix:[I

    array-length v1, v1

    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    :goto_1
    if-ge v1, v3, :cond_1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method


# virtual methods
.method public doWrite(Ljava/nio/ByteBuffer;)V
    .locals 2

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    iget-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->created:J

    invoke-static {v0, v1}, Lorg/jcodec/containers/mp4/TimeUtil;->toMovTime(J)I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->modified:J

    invoke-static {v0, v1}, Lorg/jcodec/containers/mp4/TimeUtil;->toMovTime(J)I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->timescale:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->duration:J

    long-to-int v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->rate:F

    invoke-direct {p0, p1, v0}, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->writeFixed1616(Ljava/nio/ByteBuffer;F)V

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->volume:F

    invoke-direct {p0, p1, v0}, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->writeFixed88(Ljava/nio/ByteBuffer;F)V

    const/16 v0, 0xa

    new-array v0, v0, [B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->writeMatrix(Ljava/nio/ByteBuffer;)V

    const/16 v0, 0x18

    new-array v0, v0, [B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->nextTrackId:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public estimateSize()I
    .locals 1

    const/16 v0, 0x90

    return v0
.end method

.method public getCreated()J
    .locals 2

    iget-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->created:J

    return-wide v0
.end method

.method public getDuration()J
    .locals 2

    iget-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->duration:J

    return-wide v0
.end method

.method public getMatrix()[I
    .locals 1

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->matrix:[I

    return-object v0
.end method

.method public getModified()J
    .locals 2

    iget-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->modified:J

    return-wide v0
.end method

.method public getNextTrackId()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->nextTrackId:I

    return v0
.end method

.method public getRate()F
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->rate:F

    return v0
.end method

.method public getTimescale()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->timescale:I

    return v0
.end method

.method public getVolume()F
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->volume:F

    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 2

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    iget-byte v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->version:B

    if-nez v0, :cond_0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    invoke-static {v0}, Lorg/jcodec/containers/mp4/TimeUtil;->fromMovTime(I)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->created:J

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    invoke-static {v0}, Lorg/jcodec/containers/mp4/TimeUtil;->fromMovTime(I)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->modified:J

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->timescale:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->duration:J

    goto :goto_0

    :cond_0
    iget-byte v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->version:B

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    long-to-int v0, v0

    invoke-static {v0}, Lorg/jcodec/containers/mp4/TimeUtil;->fromMovTime(I)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->created:J

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    long-to-int v0, v0

    invoke-static {v0}, Lorg/jcodec/containers/mp4/TimeUtil;->fromMovTime(I)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->modified:J

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->timescale:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->duration:J

    :goto_0
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->readRate(Ljava/nio/ByteBuffer;)F

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->rate:F

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->readVolume(Ljava/nio/ByteBuffer;)F

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->volume:F

    const/16 v0, 0xa

    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->skip(Ljava/nio/ByteBuffer;I)I

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->readMatrix(Ljava/nio/ByteBuffer;)[I

    move-result-object v0

    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->matrix:[I

    const/16 v0, 0x18

    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->skip(Ljava/nio/ByteBuffer;I)I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result p1

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->nextTrackId:I

    return-void

    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Unsupported version"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setDuration(J)V
    .locals 0

    iput-wide p1, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->duration:J

    return-void
.end method

.method public setNextTrackId(I)V
    .locals 0

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->nextTrackId:I

    return-void
.end method

.method public setTimescale(I)V
    .locals 0

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/MovieHeaderBox;->timescale:I

    return-void
.end method
