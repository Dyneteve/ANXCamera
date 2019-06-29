.class public Lorg/jcodec/containers/mp4/boxes/SyncSamplesBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "SyncSamplesBox.java"


# static fields
.field public static final STSS:Ljava/lang/String; = "stss"


# instance fields
.field protected syncSamples:[I


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-void
.end method

.method public static createSyncSamplesBox([I)Lorg/jcodec/containers/mp4/boxes/SyncSamplesBox;
    .locals 3

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/SyncSamplesBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    const-string v2, "stss"

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/SyncSamplesBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    iput-object p0, v0, Lorg/jcodec/containers/mp4/boxes/SyncSamplesBox;->syncSamples:[I

    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 2

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/SyncSamplesBox;->syncSamples:[I

    array-length v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/SyncSamplesBox;->syncSamples:[I

    array-length v1, v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/SyncSamplesBox;->syncSamples:[I

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public estimateSize()I
    .locals 2

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/SyncSamplesBox;->syncSamples:[I

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x4

    const/16 v1, 0x10

    add-int/2addr v1, v0

    return v1
.end method

.method public getSyncSamples()[I
    .locals 1

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/SyncSamplesBox;->syncSamples:[I

    return-object v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 4

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    new-array v1, v0, [I

    iput-object v1, p0, Lorg/jcodec/containers/mp4/boxes/SyncSamplesBox;->syncSamples:[I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    iget-object v2, p0, Lorg/jcodec/containers/mp4/boxes/SyncSamplesBox;->syncSamples:[I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    aput v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
