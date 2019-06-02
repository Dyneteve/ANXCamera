.class public Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "SampleSizesBox.java"


# instance fields
.field private count:I

.field private defaultSize:I

.field private sizes:[I


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-void
.end method

.method public static createSampleSizesBox(II)Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;
    .locals 3

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    iput p0, v0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->defaultSize:I

    iput p1, v0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    return-object v0
.end method

.method public static createSampleSizesBox2([I)Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;
    .locals 3

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    iput-object p0, v0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->sizes:[I

    array-length p0, p0

    iput p0, v0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    const-string v0, "stsz"

    return-object v0
.end method


# virtual methods
.method public doWrite(Ljava/nio/ByteBuffer;)V
    .locals 3

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->defaultSize:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->defaultSize:I

    if-nez v0, :cond_0

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->sizes:[I

    array-length v1, v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->sizes:[I

    aget v1, v1, v0

    int-to-long v1, v1

    long-to-int v1, v1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    :cond_1
    return-void
.end method

.method public estimateSize()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->defaultSize:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->sizes:[I

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    add-int/lit8 v0, v0, 0x14

    return v0
.end method

.method public getCount()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    return v0
.end method

.method public getDefaultSize()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->defaultSize:I

    return v0
.end method

.method public getSizes()[I
    .locals 1

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->sizes:[I

    return-object v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 3

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->defaultSize:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->defaultSize:I

    if-nez v0, :cond_0

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->sizes:[I

    const/4 v0, 0x0

    :goto_0
    iget v1, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->sizes:[I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setCount(I)V
    .locals 0

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    return-void
.end method

.method public setSizes([I)V
    .locals 0

    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->sizes:[I

    array-length p1, p1

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    return-void
.end method
