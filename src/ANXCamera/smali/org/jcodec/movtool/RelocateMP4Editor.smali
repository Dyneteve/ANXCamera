.class public Lorg/jcodec/movtool/RelocateMP4Editor;
.super Ljava/lang/Object;
.source "RelocateMP4Editor.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private fetchBox(Lorg/jcodec/common/io/SeekableByteChannel;Lorg/jcodec/containers/mp4/MP4Util$Atom;)Ljava/nio/ByteBuffer;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p2}, Lorg/jcodec/containers/mp4/MP4Util$Atom;->getOffset()J

    move-result-wide v0

    invoke-interface {p1, v0, v1}, Lorg/jcodec/common/io/SeekableByteChannel;->setPosition(J)Lorg/jcodec/common/io/SeekableByteChannel;

    invoke-virtual {p2}, Lorg/jcodec/containers/mp4/MP4Util$Atom;->getHeader()Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object p2

    invoke-virtual {p2}, Lorg/jcodec/containers/mp4/boxes/Header;->getSize()J

    move-result-wide v0

    long-to-int p2, v0

    invoke-static {p1, p2}, Lorg/jcodec/common/io/NIOUtils;->fetchFromChannel(Ljava/nio/channels/ReadableByteChannel;I)Ljava/nio/ByteBuffer;

    move-result-object p1

    return-object p1
.end method

.method private getMoov(Lorg/jcodec/common/io/SeekableByteChannel;)Lorg/jcodec/containers/mp4/MP4Util$Atom;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-static {p1}, Lorg/jcodec/containers/mp4/MP4Util;->getRootAtoms(Lorg/jcodec/common/io/SeekableByteChannel;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/MP4Util$Atom;

    const-string v1, "moov"

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/MP4Util$Atom;->getHeader()Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jcodec/containers/mp4/boxes/Header;->getFourcc()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private parseBox(Ljava/nio/ByteBuffer;)Lorg/jcodec/containers/mp4/boxes/Box;
    .locals 2

    invoke-static {p1}, Lorg/jcodec/containers/mp4/boxes/Header;->read(Ljava/nio/ByteBuffer;)Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object v0

    invoke-static {}, Lorg/jcodec/containers/mp4/BoxFactory;->getDefault()Lorg/jcodec/containers/mp4/IBoxFactory;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lorg/jcodec/containers/mp4/BoxUtil;->parseBox(Ljava/nio/ByteBuffer;Lorg/jcodec/containers/mp4/boxes/Header;Lorg/jcodec/containers/mp4/IBoxFactory;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public modifyOrRelocate(Ljava/io/File;Lorg/jcodec/movtool/MP4Edit;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lorg/jcodec/movtool/InplaceMP4Editor;

    invoke-direct {v0}, Lorg/jcodec/movtool/InplaceMP4Editor;-><init>()V

    invoke-virtual {v0, p1, p2}, Lorg/jcodec/movtool/InplaceMP4Editor;->modify(Ljava/io/File;Lorg/jcodec/movtool/MP4Edit;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1, p2}, Lorg/jcodec/movtool/RelocateMP4Editor;->relocate(Ljava/io/File;Lorg/jcodec/movtool/MP4Edit;)V

    :cond_0
    return-void
.end method

.method public relocate(Ljava/io/File;Lorg/jcodec/movtool/MP4Edit;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    nop

    :try_start_0
    invoke-static {p1}, Lorg/jcodec/common/io/NIOUtils;->rwChannel(Ljava/io/File;)Lorg/jcodec/common/io/FileChannelWrapper;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-direct {p0, p1}, Lorg/jcodec/movtool/RelocateMP4Editor;->getMoov(Lorg/jcodec/common/io/SeekableByteChannel;)Lorg/jcodec/containers/mp4/MP4Util$Atom;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/jcodec/movtool/RelocateMP4Editor;->fetchBox(Lorg/jcodec/common/io/SeekableByteChannel;Lorg/jcodec/containers/mp4/MP4Util$Atom;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/jcodec/movtool/RelocateMP4Editor;->parseBox(Ljava/nio/ByteBuffer;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v1

    check-cast v1, Lorg/jcodec/containers/mp4/boxes/MovieBox;

    invoke-interface {p2, v1}, Lorg/jcodec/movtool/MP4Edit;->apply(Lorg/jcodec/containers/mp4/boxes/MovieBox;)V

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/MP4Util$Atom;->getOffset()J

    move-result-wide v2

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/MP4Util$Atom;->getHeader()Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object p2

    invoke-virtual {p2}, Lorg/jcodec/containers/mp4/boxes/Header;->getSize()J

    move-result-wide v4

    add-long/2addr v2, v4

    invoke-interface {p1}, Lorg/jcodec/common/io/SeekableByteChannel;->size()J

    move-result-wide v4

    cmp-long p2, v2, v4

    if-gez p2, :cond_0

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/MP4Util$Atom;->getOffset()J

    move-result-wide v2

    const-wide/16 v4, 0x4

    add-long/2addr v2, v4

    invoke-interface {p1, v2, v3}, Lorg/jcodec/common/io/SeekableByteChannel;->setPosition(J)Lorg/jcodec/common/io/SeekableByteChannel;

    sget-object p2, Lorg/jcodec/containers/mp4/boxes/Header;->FOURCC_FREE:[B

    invoke-static {p2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p2

    invoke-interface {p1, p2}, Lorg/jcodec/common/io/SeekableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    invoke-interface {p1}, Lorg/jcodec/common/io/SeekableByteChannel;->size()J

    move-result-wide v2

    invoke-interface {p1, v2, v3}, Lorg/jcodec/common/io/SeekableByteChannel;->setPosition(J)Lorg/jcodec/common/io/SeekableByteChannel;

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/MP4Util$Atom;->getOffset()J

    move-result-wide v2

    invoke-interface {p1, v2, v3}, Lorg/jcodec/common/io/SeekableByteChannel;->setPosition(J)Lorg/jcodec/common/io/SeekableByteChannel;

    :goto_0
    invoke-static {p1, v1}, Lorg/jcodec/containers/mp4/MP4Util;->writeMovie(Lorg/jcodec/common/io/SeekableByteChannel;Lorg/jcodec/containers/mp4/boxes/MovieBox;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {p1}, Lorg/jcodec/common/io/NIOUtils;->closeQuietly(Ljava/io/Closeable;)V

    nop

    return-void

    :catchall_0
    move-exception p2

    goto :goto_1

    :catchall_1
    move-exception p2

    const/4 p1, 0x0

    :goto_1
    invoke-static {p1}, Lorg/jcodec/common/io/NIOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw p2
.end method
