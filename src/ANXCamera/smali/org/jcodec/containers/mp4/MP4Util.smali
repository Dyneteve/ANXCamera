.class public Lorg/jcodec/containers/mp4/MP4Util;
.super Ljava/lang/Object;
.source "MP4Util.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jcodec/containers/mp4/MP4Util$Atom;,
        Lorg/jcodec/containers/mp4/MP4Util$Movie;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static atom(Lorg/jcodec/common/io/SeekableByteChannel;)Lorg/jcodec/containers/mp4/MP4Util$Atom;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-interface {p0}, Lorg/jcodec/common/io/SeekableByteChannel;->position()J

    move-result-wide v0

    const/16 v2, 0x10

    invoke-static {p0, v2}, Lorg/jcodec/common/io/NIOUtils;->fetchFromChannel(Ljava/nio/channels/ReadableByteChannel;I)Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-static {p0}, Lorg/jcodec/containers/mp4/boxes/Header;->read(Ljava/nio/ByteBuffer;)Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    new-instance v2, Lorg/jcodec/containers/mp4/MP4Util$Atom;

    invoke-direct {v2, p0, v0, v1}, Lorg/jcodec/containers/mp4/MP4Util$Atom;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;J)V

    move-object p0, v2

    :goto_0
    return-object p0
.end method

.method public static createRefFullMovie(Lorg/jcodec/common/io/SeekableByteChannel;Ljava/lang/String;)Lorg/jcodec/containers/mp4/MP4Util$Movie;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-static {p0}, Lorg/jcodec/containers/mp4/MP4Util;->parseFullMovieChannel(Lorg/jcodec/common/io/SeekableByteChannel;)Lorg/jcodec/containers/mp4/MP4Util$Movie;

    move-result-object p0

    invoke-static {p0}, Lorg/jcodec/containers/mp4/MP4Util$Movie;->access$000(Lorg/jcodec/containers/mp4/MP4Util$Movie;)Lorg/jcodec/containers/mp4/boxes/MovieBox;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/MovieBox;->getTracks()[Lorg/jcodec/containers/mp4/boxes/TrakBox;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    aget-object v2, v0, v1

    invoke-virtual {v2, p1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->setDataRef(Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public static createRefFullMovieFromFile(Ljava/io/File;)Lorg/jcodec/containers/mp4/MP4Util$Movie;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    nop

    :try_start_0
    invoke-static {p0}, Lorg/jcodec/common/io/NIOUtils;->readableChannel(Ljava/io/File;)Lorg/jcodec/common/io/FileChannelWrapper;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "file://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lorg/jcodec/containers/mp4/MP4Util;->createRefFullMovie(Lorg/jcodec/common/io/SeekableByteChannel;Ljava/lang/String;)Lorg/jcodec/containers/mp4/MP4Util$Movie;

    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lorg/jcodec/common/io/SeekableByteChannel;->close()V

    :cond_0
    return-object p0

    :catchall_0
    move-exception p0

    goto :goto_0

    :catchall_1
    move-exception p0

    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lorg/jcodec/common/io/SeekableByteChannel;->close()V

    :cond_1
    throw p0
.end method

.method public static createRefMovie(Lorg/jcodec/common/io/SeekableByteChannel;Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/MovieBox;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-static {p0}, Lorg/jcodec/containers/mp4/MP4Util;->parseMovieChannel(Lorg/jcodec/common/io/SeekableByteChannel;)Lorg/jcodec/containers/mp4/boxes/MovieBox;

    move-result-object p0

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/MovieBox;->getTracks()[Lorg/jcodec/containers/mp4/boxes/TrakBox;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    aget-object v2, v0, v1

    invoke-virtual {v2, p1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->setDataRef(Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public static createRefMovieFromFile(Ljava/io/File;)Lorg/jcodec/containers/mp4/boxes/MovieBox;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    nop

    :try_start_0
    invoke-static {p0}, Lorg/jcodec/common/io/NIOUtils;->readableChannel(Ljava/io/File;)Lorg/jcodec/common/io/FileChannelWrapper;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "file://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lorg/jcodec/containers/mp4/MP4Util;->createRefMovie(Lorg/jcodec/common/io/SeekableByteChannel;Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/MovieBox;

    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lorg/jcodec/common/io/SeekableByteChannel;->close()V

    :cond_0
    return-object p0

    :catchall_0
    move-exception p0

    goto :goto_0

    :catchall_1
    move-exception p0

    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lorg/jcodec/common/io/SeekableByteChannel;->close()V

    :cond_1
    throw p0
.end method

.method public static doWriteFullMovieToChannel(Lorg/jcodec/common/io/SeekableByteChannel;Lorg/jcodec/containers/mp4/MP4Util$Movie;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/MP4Util$Movie;->getMoov()Lorg/jcodec/containers/mp4/boxes/MovieBox;

    move-result-object v0

    invoke-static {v0}, Lorg/jcodec/containers/mp4/MP4Util;->estimateMoovBoxSize(Lorg/jcodec/containers/mp4/boxes/MovieBox;)I

    move-result v0

    add-int/2addr v0, p2

    add-int/lit16 v0, v0, 0x80

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object p2

    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/MP4Util$Movie;->getFtyp()Lorg/jcodec/containers/mp4/boxes/FileTypeBox;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/jcodec/containers/mp4/boxes/FileTypeBox;->write(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/MP4Util$Movie;->getMoov()Lorg/jcodec/containers/mp4/boxes/MovieBox;

    move-result-object p1

    invoke-virtual {p1, p2}, Lorg/jcodec/containers/mp4/boxes/MovieBox;->write(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    invoke-interface {p0, p2}, Lorg/jcodec/common/io/SeekableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    return-void
.end method

.method public static doWriteMovieToChannel(Lorg/jcodec/common/io/SeekableByteChannel;Lorg/jcodec/containers/mp4/boxes/MovieBox;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-static {p1}, Lorg/jcodec/containers/mp4/MP4Util;->estimateMoovBoxSize(Lorg/jcodec/containers/mp4/boxes/MovieBox;)I

    move-result v0

    add-int/2addr v0, p2

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object p2

    invoke-virtual {p1, p2}, Lorg/jcodec/containers/mp4/boxes/MovieBox;->write(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    invoke-interface {p0, p2}, Lorg/jcodec/common/io/SeekableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    return-void
.end method

.method public static estimateMoovBoxSize(Lorg/jcodec/containers/mp4/boxes/MovieBox;)I
    .locals 0

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/MovieBox;->estimateSize()I

    move-result p0

    add-int/lit16 p0, p0, 0x1000

    return p0
.end method

.method public static findFirstAtom(Ljava/lang/String;Lorg/jcodec/common/io/SeekableByteChannel;)Lorg/jcodec/containers/mp4/MP4Util$Atom;
    .locals 2
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

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/MP4Util$Atom;->getHeader()Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/Header;->getFourcc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getRootAtoms(Lorg/jcodec/common/io/SeekableByteChannel;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jcodec/common/io/SeekableByteChannel;",
            ")",
            "Ljava/util/List<",
            "Lorg/jcodec/containers/mp4/MP4Util$Atom;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    invoke-interface {p0, v0, v1}, Lorg/jcodec/common/io/SeekableByteChannel;->setPosition(J)Lorg/jcodec/common/io/SeekableByteChannel;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    nop

    :goto_0
    invoke-interface {p0}, Lorg/jcodec/common/io/SeekableByteChannel;->size()J

    move-result-wide v3

    cmp-long v3, v0, v3

    if-gez v3, :cond_1

    invoke-interface {p0, v0, v1}, Lorg/jcodec/common/io/SeekableByteChannel;->setPosition(J)Lorg/jcodec/common/io/SeekableByteChannel;

    const/16 v3, 0x10

    invoke-static {p0, v3}, Lorg/jcodec/common/io/NIOUtils;->fetchFromChannel(Ljava/nio/channels/ReadableByteChannel;I)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-static {v3}, Lorg/jcodec/containers/mp4/boxes/Header;->read(Ljava/nio/ByteBuffer;)Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object v3

    if-nez v3, :cond_0

    goto :goto_1

    :cond_0
    new-instance v4, Lorg/jcodec/containers/mp4/MP4Util$Atom;

    invoke-direct {v4, v3, v0, v1}, Lorg/jcodec/containers/mp4/MP4Util$Atom;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;J)V

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v3}, Lorg/jcodec/containers/mp4/boxes/Header;->getSize()J

    move-result-wide v3

    add-long/2addr v0, v3

    goto :goto_0

    :cond_1
    :goto_1
    return-object v2
.end method

.method public static parseFullMovie(Ljava/io/File;)Lorg/jcodec/containers/mp4/MP4Util$Movie;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    nop

    :try_start_0
    invoke-static {p0}, Lorg/jcodec/common/io/NIOUtils;->readableChannel(Ljava/io/File;)Lorg/jcodec/common/io/FileChannelWrapper;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-static {p0}, Lorg/jcodec/containers/mp4/MP4Util;->parseFullMovieChannel(Lorg/jcodec/common/io/SeekableByteChannel;)Lorg/jcodec/containers/mp4/MP4Util$Movie;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p0, :cond_0

    invoke-interface {p0}, Lorg/jcodec/common/io/SeekableByteChannel;->close()V

    :cond_0
    return-object v0

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    const/4 p0, 0x0

    :goto_0
    if-eqz p0, :cond_1

    invoke-interface {p0}, Lorg/jcodec/common/io/SeekableByteChannel;->close()V

    :cond_1
    throw v0
.end method

.method public static parseFullMovieChannel(Lorg/jcodec/common/io/SeekableByteChannel;)Lorg/jcodec/containers/mp4/MP4Util$Movie;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    nop

    invoke-static {p0}, Lorg/jcodec/containers/mp4/MP4Util;->getRootAtoms(Lorg/jcodec/common/io/SeekableByteChannel;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    move-object v2, v1

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jcodec/containers/mp4/MP4Util$Atom;

    const-string v4, "ftyp"

    invoke-virtual {v3}, Lorg/jcodec/containers/mp4/MP4Util$Atom;->getHeader()Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jcodec/containers/mp4/boxes/Header;->getFourcc()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v3, p0}, Lorg/jcodec/containers/mp4/MP4Util$Atom;->parseBox(Lorg/jcodec/common/io/SeekableByteChannel;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v2

    check-cast v2, Lorg/jcodec/containers/mp4/boxes/FileTypeBox;

    goto :goto_1

    :cond_0
    const-string v4, "moov"

    invoke-virtual {v3}, Lorg/jcodec/containers/mp4/MP4Util$Atom;->getHeader()Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jcodec/containers/mp4/boxes/Header;->getFourcc()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    new-instance v0, Lorg/jcodec/containers/mp4/MP4Util$Movie;

    invoke-virtual {v3, p0}, Lorg/jcodec/containers/mp4/MP4Util$Atom;->parseBox(Lorg/jcodec/common/io/SeekableByteChannel;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object p0

    check-cast p0, Lorg/jcodec/containers/mp4/boxes/MovieBox;

    invoke-direct {v0, v2, p0}, Lorg/jcodec/containers/mp4/MP4Util$Movie;-><init>(Lorg/jcodec/containers/mp4/boxes/FileTypeBox;Lorg/jcodec/containers/mp4/boxes/MovieBox;)V

    return-object v0

    :cond_1
    :goto_1
    goto :goto_0

    :cond_2
    return-object v1
.end method

.method public static parseMovie(Ljava/io/File;)Lorg/jcodec/containers/mp4/boxes/MovieBox;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    nop

    :try_start_0
    invoke-static {p0}, Lorg/jcodec/common/io/NIOUtils;->readableChannel(Ljava/io/File;)Lorg/jcodec/common/io/FileChannelWrapper;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-static {p0}, Lorg/jcodec/containers/mp4/MP4Util;->parseMovieChannel(Lorg/jcodec/common/io/SeekableByteChannel;)Lorg/jcodec/containers/mp4/boxes/MovieBox;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p0, :cond_0

    invoke-interface {p0}, Lorg/jcodec/common/io/SeekableByteChannel;->close()V

    :cond_0
    return-object v0

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    const/4 p0, 0x0

    :goto_0
    if-eqz p0, :cond_1

    invoke-interface {p0}, Lorg/jcodec/common/io/SeekableByteChannel;->close()V

    :cond_1
    throw v0
.end method

.method public static parseMovieChannel(Lorg/jcodec/common/io/SeekableByteChannel;)Lorg/jcodec/containers/mp4/boxes/MovieBox;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-static {p0}, Lorg/jcodec/containers/mp4/MP4Util;->getRootAtoms(Lorg/jcodec/common/io/SeekableByteChannel;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jcodec/containers/mp4/MP4Util$Atom;

    const-string v2, "moov"

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/MP4Util$Atom;->getHeader()Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jcodec/containers/mp4/boxes/Header;->getFourcc()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1, p0}, Lorg/jcodec/containers/mp4/MP4Util$Atom;->parseBox(Lorg/jcodec/common/io/SeekableByteChannel;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object p0

    check-cast p0, Lorg/jcodec/containers/mp4/boxes/MovieBox;

    return-object p0

    :cond_0
    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static parseMovieFragments(Lorg/jcodec/common/io/SeekableByteChannel;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jcodec/common/io/SeekableByteChannel;",
            ")",
            "Ljava/util/List<",
            "Lorg/jcodec/containers/mp4/boxes/MovieFragmentBox;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    nop

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    invoke-static {p0}, Lorg/jcodec/containers/mp4/MP4Util;->getRootAtoms(Lorg/jcodec/common/io/SeekableByteChannel;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jcodec/containers/mp4/MP4Util$Atom;

    const-string v4, "moov"

    invoke-virtual {v3}, Lorg/jcodec/containers/mp4/MP4Util$Atom;->getHeader()Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jcodec/containers/mp4/boxes/Header;->getFourcc()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v3, p0}, Lorg/jcodec/containers/mp4/MP4Util$Atom;->parseBox(Lorg/jcodec/common/io/SeekableByteChannel;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v2

    check-cast v2, Lorg/jcodec/containers/mp4/boxes/MovieBox;

    goto :goto_1

    :cond_0
    const-string v4, "moof"

    invoke-virtual {v3}, Lorg/jcodec/containers/mp4/MP4Util$Atom;->getHeader()Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jcodec/containers/mp4/boxes/Header;->getFourcc()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v3, p0}, Lorg/jcodec/containers/mp4/MP4Util$Atom;->parseBox(Lorg/jcodec/common/io/SeekableByteChannel;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v3

    check-cast v3, Lorg/jcodec/containers/mp4/boxes/MovieFragmentBox;

    invoke-virtual {v0, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    :cond_1
    :goto_1
    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jcodec/containers/mp4/boxes/MovieFragmentBox;

    invoke-virtual {v1, v2}, Lorg/jcodec/containers/mp4/boxes/MovieFragmentBox;->setMovie(Lorg/jcodec/containers/mp4/boxes/MovieBox;)V

    goto :goto_2

    :cond_3
    return-object v0
.end method

.method public static writeBox(Lorg/jcodec/containers/mp4/boxes/Box;I)Ljava/nio/ByteBuffer;
    .locals 0

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/jcodec/containers/mp4/boxes/Box;->write(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    return-object p1
.end method

.method public static writeFullMovie(Lorg/jcodec/common/io/SeekableByteChannel;Lorg/jcodec/containers/mp4/MP4Util$Movie;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/jcodec/containers/mp4/MP4Util;->doWriteFullMovieToChannel(Lorg/jcodec/common/io/SeekableByteChannel;Lorg/jcodec/containers/mp4/MP4Util$Movie;I)V

    return-void
.end method

.method public static writeFullMovieToFile(Ljava/io/File;Lorg/jcodec/containers/mp4/MP4Util$Movie;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    nop

    :try_start_0
    invoke-static {p0}, Lorg/jcodec/common/io/NIOUtils;->writableChannel(Ljava/io/File;)Lorg/jcodec/common/io/FileChannelWrapper;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-static {p0, p1}, Lorg/jcodec/containers/mp4/MP4Util;->writeFullMovie(Lorg/jcodec/common/io/SeekableByteChannel;Lorg/jcodec/containers/mp4/MP4Util$Movie;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {p0}, Lorg/jcodec/common/io/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    nop

    return-void

    :catchall_0
    move-exception p1

    goto :goto_0

    :catchall_1
    move-exception p1

    const/4 p0, 0x0

    :goto_0
    invoke-static {p0}, Lorg/jcodec/common/io/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw p1
.end method

.method public static writeMovie(Lorg/jcodec/common/io/SeekableByteChannel;Lorg/jcodec/containers/mp4/boxes/MovieBox;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/jcodec/containers/mp4/MP4Util;->doWriteMovieToChannel(Lorg/jcodec/common/io/SeekableByteChannel;Lorg/jcodec/containers/mp4/boxes/MovieBox;I)V

    return-void
.end method

.method public static writeMovieToFile(Ljava/io/File;Lorg/jcodec/containers/mp4/boxes/MovieBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    nop

    :try_start_0
    invoke-static {p0}, Lorg/jcodec/common/io/NIOUtils;->writableChannel(Ljava/io/File;)Lorg/jcodec/common/io/FileChannelWrapper;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-static {p0, p1}, Lorg/jcodec/containers/mp4/MP4Util;->writeMovie(Lorg/jcodec/common/io/SeekableByteChannel;Lorg/jcodec/containers/mp4/boxes/MovieBox;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {p0}, Lorg/jcodec/common/io/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    nop

    return-void

    :catchall_0
    move-exception p1

    goto :goto_0

    :catchall_1
    move-exception p1

    const/4 p0, 0x0

    :goto_0
    invoke-static {p0}, Lorg/jcodec/common/io/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw p1
.end method
