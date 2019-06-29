.class public Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;
.super Lorg/jcodec/containers/mp4/boxes/Box;
.source "ClipRegionBox.java"


# instance fields
.field private height:S

.field private rgnSize:S

.field private width:S

.field private x:S

.field private y:S


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/Box;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-void
.end method

.method public static createClipRegionBox(SSSS)Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;
    .locals 3

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    const/16 v1, 0xa

    iput-short v1, v0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->rgnSize:S

    iput-short p0, v0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->x:S

    iput-short p1, v0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->y:S

    iput-short p2, v0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->width:S

    iput-short p3, v0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->height:S

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    const-string v0, "crgn"

    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 1

    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->rgnSize:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->y:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->x:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->height:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->width:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public estimateSize()I
    .locals 1

    const/16 v0, 0x12

    return v0
.end method

.method public getHeight()S
    .locals 1

    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->height:S

    return v0
.end method

.method public getRgnSize()S
    .locals 1

    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->rgnSize:S

    return v0
.end method

.method public getWidth()S
    .locals 1

    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->width:S

    return v0
.end method

.method public getX()S
    .locals 1

    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->x:S

    return v0
.end method

.method public getY()S
    .locals 1

    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->y:S

    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->rgnSize:S

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->y:S

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->x:S

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->height:S

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result p1

    iput-short p1, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->width:S

    return-void
.end method
