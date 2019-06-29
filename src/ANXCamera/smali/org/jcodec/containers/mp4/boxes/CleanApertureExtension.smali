.class public Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;
.super Lorg/jcodec/containers/mp4/boxes/Box;
.source "CleanApertureExtension.java"


# instance fields
.field private apertureHeightDenominator:I

.field private apertureHeightNumerator:I

.field private apertureWidthDenominator:I

.field private apertureWidthNumerator:I

.field private horizOffsetDenominator:I

.field private horizOffsetNumerator:I

.field private vertOffsetDenominator:I

.field private vertOffsetNumerator:I


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/Box;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-void
.end method

.method public static createCleanApertureExtension(IIIIIIII)Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;
    .locals 3

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    iput p0, v0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureWidthNumerator:I

    iput p1, v0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureWidthDenominator:I

    iput p2, v0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureHeightNumerator:I

    iput p3, v0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureHeightDenominator:I

    iput p4, v0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->horizOffsetNumerator:I

    iput p5, v0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->horizOffsetDenominator:I

    iput p6, v0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->vertOffsetNumerator:I

    iput p7, v0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->vertOffsetDenominator:I

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    const-string v0, "clap"

    return-object v0
.end method


# virtual methods
.method public doWrite(Ljava/nio/ByteBuffer;)V
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureWidthNumerator:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureWidthDenominator:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureHeightNumerator:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureHeightDenominator:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->horizOffsetNumerator:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->horizOffsetDenominator:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->vertOffsetNumerator:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->vertOffsetDenominator:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public estimateSize()I
    .locals 1

    const/16 v0, 0x28

    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureWidthNumerator:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureWidthDenominator:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureHeightNumerator:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureHeightDenominator:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->horizOffsetNumerator:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->horizOffsetDenominator:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->vertOffsetNumerator:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result p1

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->vertOffsetDenominator:I

    return-void
.end method
