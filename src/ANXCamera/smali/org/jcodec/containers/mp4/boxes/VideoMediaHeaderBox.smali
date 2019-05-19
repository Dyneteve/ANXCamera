.class public Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "VideoMediaHeaderBox.java"


# instance fields
.field bOpColor:I

.field gOpColor:I

.field graphicsMode:I

.field rOpColor:I


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-void
.end method

.method public static createVideoMediaHeaderBox(IIII)Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;
    .locals 3

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    iput p0, v0, Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;->graphicsMode:I

    iput p1, v0, Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;->rOpColor:I

    iput p2, v0, Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;->gOpColor:I

    iput p3, v0, Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;->bOpColor:I

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    const-string v0, "vmhd"

    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 1

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;->graphicsMode:I

    int-to-short v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;->rOpColor:I

    int-to-short v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;->gOpColor:I

    int-to-short v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;->bOpColor:I

    int-to-short v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public estimateSize()I
    .locals 1

    const/16 v0, 0x14

    return v0
.end method

.method public getGraphicsMode()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;->graphicsMode:I

    return v0
.end method

.method public getbOpColor()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;->bOpColor:I

    return v0
.end method

.method public getgOpColor()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;->gOpColor:I

    return v0
.end method

.method public getrOpColor()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;->rOpColor:I

    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 1

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;->graphicsMode:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;->rOpColor:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;->gOpColor:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result p1

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/VideoMediaHeaderBox;->bOpColor:I

    return-void
.end method
