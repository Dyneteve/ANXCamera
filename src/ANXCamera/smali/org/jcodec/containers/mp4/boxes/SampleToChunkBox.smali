.class public Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "SampleToChunkBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;
    }
.end annotation


# instance fields
.field private sampleToChunk:[Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-void
.end method

.method public static createSampleToChunkBox([Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;)Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox;
    .locals 3

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    iput-object p0, v0, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox;->sampleToChunk:[Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    const-string v0, "stsc"

    return-object v0
.end method


# virtual methods
.method public doWrite(Ljava/nio/ByteBuffer;)V
    .locals 4

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox;->sampleToChunk:[Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;

    array-length v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox;->sampleToChunk:[Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox;->sampleToChunk:[Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;->getFirst()J

    move-result-wide v2

    long-to-int v2, v2

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;->getCount()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;->getEntry()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public estimateSize()I
    .locals 2

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox;->sampleToChunk:[Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;

    array-length v0, v0

    mul-int/lit8 v0, v0, 0xc

    const/16 v1, 0x10

    add-int/2addr v1, v0

    return v1
.end method

.method public getSampleToChunk()[Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;
    .locals 1

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox;->sampleToChunk:[Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;

    return-object v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 8

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    new-array v1, v0, [Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;

    iput-object v1, p0, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox;->sampleToChunk:[Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    iget-object v2, p0, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox;->sampleToChunk:[Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;

    new-instance v3, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v6

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v7

    invoke-direct {v3, v4, v5, v6, v7}, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;-><init>(JII)V

    aput-object v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setSampleToChunk([Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;)V
    .locals 0

    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox;->sampleToChunk:[Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;

    return-void
.end method
