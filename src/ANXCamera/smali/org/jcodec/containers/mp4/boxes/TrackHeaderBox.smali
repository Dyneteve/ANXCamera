.class public Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "TrackHeaderBox.java"


# instance fields
.field private altGroup:J

.field private created:J

.field private duration:J

.field private height:F

.field private layer:S

.field private matrix:[I

.field private modified:J

.field private trackId:I

.field private volume:F

.field private width:F


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-void
.end method

.method public static createTrackHeaderBox(IJFFJJFSJ[I)Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;
    .locals 3

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    move v1, p0

    iput v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->trackId:I

    move-wide v1, p1

    iput-wide v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->duration:J

    move v1, p3

    iput v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->width:F

    move v1, p4

    iput v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->height:F

    move-wide v1, p5

    iput-wide v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->created:J

    move-wide v1, p7

    iput-wide v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->modified:J

    move v1, p9

    iput v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->volume:F

    move v1, p10

    iput-short v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->layer:S

    move-wide v1, p11

    iput-wide v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->altGroup:J

    move-object/from16 v1, p13

    iput-object v1, v0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->matrix:[I

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    const-string v0, "tkhd"

    return-object v0
.end method

.method private readMatrix(Ljava/nio/ByteBuffer;)V
    .locals 5

    const/16 v0, 0x9

    new-array v1, v0, [I

    iput-object v1, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->matrix:[I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    iget-object v2, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->matrix:[I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    const/high16 v4, 0x10000

    div-int/2addr v3, v4

    aput v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private readVolume(Ljava/nio/ByteBuffer;)F
    .locals 4

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result p1

    int-to-double v0, p1

    const-wide/high16 v2, 0x4070000000000000L    # 256.0

    div-double/2addr v0, v2

    double-to-float p1, v0

    return p1
.end method

.method private writeMatrix(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0x9

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->matrix:[I

    aget v1, v1, v0

    const/high16 v2, 0x10000

    mul-int/2addr v1, v2

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private writeVolume(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->volume:F

    float-to-double v0, v0

    const-wide/high16 v2, 0x4070000000000000L    # 256.0

    mul-double/2addr v0, v2

    double-to-int v0, v0

    int-to-short v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    return-void
.end method


# virtual methods
.method public doWrite(Ljava/nio/ByteBuffer;)V
    .locals 3

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    iget-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->created:J

    invoke-static {v0, v1}, Lorg/jcodec/containers/mp4/TimeUtil;->toMovTime(J)I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->modified:J

    invoke-static {v0, v1}, Lorg/jcodec/containers/mp4/TimeUtil;->toMovTime(J)I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->trackId:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget-wide v1, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->duration:J

    long-to-int v1, v1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget-short v1, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->layer:S

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    iget-wide v1, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->altGroup:J

    long-to-int v1, v1

    int-to-short v1, v1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->writeVolume(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->writeMatrix(Ljava/nio/ByteBuffer;)V

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->width:F

    const/high16 v1, 0x47800000    # 65536.0f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->height:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public estimateSize()I
    .locals 1

    const/16 v0, 0x5c

    return v0
.end method

.method public getAltGroup()J
    .locals 2

    iget-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->altGroup:J

    return-wide v0
.end method

.method public getCreated()J
    .locals 2

    iget-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->created:J

    return-wide v0
.end method

.method public getDuration()J
    .locals 2

    iget-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->duration:J

    return-wide v0
.end method

.method public getHeight()F
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->height:F

    return v0
.end method

.method public getLayer()S
    .locals 1

    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->layer:S

    return v0
.end method

.method public getMatrix()[I
    .locals 1

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->matrix:[I

    return-object v0
.end method

.method public getModified()J
    .locals 2

    iget-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->modified:J

    return-wide v0
.end method

.method public getNo()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->trackId:I

    return v0
.end method

.method public getTrackId()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->trackId:I

    return v0
.end method

.method public getVolume()F
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->volume:F

    return v0
.end method

.method public getWidth()F
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->width:F

    return v0
.end method

.method public isOrientation0()Z
    .locals 4

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->matrix:[I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->matrix:[I

    aget v0, v0, v1

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->matrix:[I

    const/4 v3, 0x4

    aget v0, v0, v3

    if-ne v0, v2, :cond_0

    move v1, v2

    nop

    :cond_0
    return v1
.end method

.method public isOrientation180()Z
    .locals 4

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->matrix:[I

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->matrix:[I

    aget v0, v0, v1

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->matrix:[I

    const/4 v3, 0x4

    aget v0, v0, v3

    if-ne v0, v2, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1
.end method

.method public isOrientation270()Z
    .locals 3

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->matrix:[I

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->matrix:[I

    aget v0, v0, v1

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->matrix:[I

    const/4 v2, 0x3

    aget v0, v0, v2

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isOrientation90()Z
    .locals 3

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->matrix:[I

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->matrix:[I

    aget v0, v0, v1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->matrix:[I

    const/4 v2, 0x3

    aget v0, v0, v2

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 2

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    iget-byte v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->version:B

    if-nez v0, :cond_0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    invoke-static {v0}, Lorg/jcodec/containers/mp4/TimeUtil;->fromMovTime(I)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->created:J

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    invoke-static {v0}, Lorg/jcodec/containers/mp4/TimeUtil;->fromMovTime(I)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->modified:J

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    long-to-int v0, v0

    invoke-static {v0}, Lorg/jcodec/containers/mp4/TimeUtil;->fromMovTime(I)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->created:J

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    long-to-int v0, v0

    invoke-static {v0}, Lorg/jcodec/containers/mp4/TimeUtil;->fromMovTime(I)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->modified:J

    :goto_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->trackId:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    iget-byte v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->version:B

    if-nez v0, :cond_1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->duration:J

    goto :goto_1

    :cond_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->duration:J

    :goto_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->layer:S

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->altGroup:J

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->readVolume(Ljava/nio/ByteBuffer;)F

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->volume:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->readMatrix(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x47800000    # 65536.0f

    div-float/2addr v0, v1

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->width:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p1, v1

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->height:F

    return-void
.end method

.method public setDuration(J)V
    .locals 0

    iput-wide p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->duration:J

    return-void
.end method

.method public setHeight(F)V
    .locals 0

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->height:F

    return-void
.end method

.method public setNo(I)V
    .locals 0

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->trackId:I

    return-void
.end method

.method public setWidth(F)V
    .locals 0

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->width:F

    return-void
.end method
