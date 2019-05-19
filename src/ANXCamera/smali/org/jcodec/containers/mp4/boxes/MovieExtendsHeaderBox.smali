.class public Lorg/jcodec/containers/mp4/boxes/MovieExtendsHeaderBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "MovieExtendsHeaderBox.java"


# instance fields
.field private fragmentDuration:I


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-void
.end method

.method public static createMovieExtendsHeaderBox()Lorg/jcodec/containers/mp4/boxes/MovieExtendsHeaderBox;
    .locals 3

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/MovieExtendsHeaderBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/MovieExtendsHeaderBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/MovieExtendsHeaderBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    const-string v0, "mehd"

    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 1

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieExtendsHeaderBox;->fragmentDuration:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public estimateSize()I
    .locals 1

    const/16 v0, 0x10

    return v0
.end method

.method public getFragmentDuration()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/MovieExtendsHeaderBox;->fragmentDuration:I

    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 0

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result p1

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/MovieExtendsHeaderBox;->fragmentDuration:I

    return-void
.end method

.method public setFragmentDuration(I)V
    .locals 0

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/MovieExtendsHeaderBox;->fragmentDuration:I

    return-void
.end method
