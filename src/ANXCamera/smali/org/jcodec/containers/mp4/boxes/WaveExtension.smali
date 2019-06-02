.class public Lorg/jcodec/containers/mp4/boxes/WaveExtension;
.super Lorg/jcodec/containers/mp4/boxes/NodeBox;
.source "WaveExtension.java"


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-void
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    const-string v0, "wave"

    return-object v0
.end method
