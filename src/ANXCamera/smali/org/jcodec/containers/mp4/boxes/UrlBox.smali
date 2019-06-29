.class public Lorg/jcodec/containers/mp4/boxes/UrlBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "UrlBox.java"


# instance fields
.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-void
.end method

.method public static createUrlBox(Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/UrlBox;
    .locals 3

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/UrlBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/UrlBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/UrlBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    iput-object p0, v0, Lorg/jcodec/containers/mp4/boxes/UrlBox;->url:Ljava/lang/String;

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "url "

    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 2

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/UrlBox;->url:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/UrlBox;->url:Ljava/lang/String;

    const-string v1, "UTF-8"

    invoke-static {v0, v1}, Lorg/jcodec/platform/Platform;->getBytesForCharset(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->write(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    :cond_0
    return-void
.end method

.method public estimateSize()I
    .locals 3

    nop

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/UrlBox;->url:Ljava/lang/String;

    const/16 v1, 0xd

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/UrlBox;->url:Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-static {v0, v2}, Lorg/jcodec/platform/Platform;->getBytesForCharset(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    array-length v0, v0

    add-int/2addr v1, v0

    :cond_0
    return v1
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/UrlBox;->url:Ljava/lang/String;

    return-object v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 1

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/UrlBox;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const-string v0, "UTF-8"

    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->readNullTermStringCharset(Ljava/nio/ByteBuffer;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/UrlBox;->url:Ljava/lang/String;

    return-void
.end method
