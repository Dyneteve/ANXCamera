.class public Lorg/jcodec/containers/mp4/VideoBoxes;
.super Lorg/jcodec/containers/mp4/Boxes;
.source "VideoBoxes.java"


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Lorg/jcodec/containers/mp4/Boxes;-><init>()V

    iget-object v0, p0, Lorg/jcodec/containers/mp4/VideoBoxes;->mappings:Ljava/util/Map;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/PixelAspectExt;->fourcc()Ljava/lang/String;

    move-result-object v1

    const-class v2, Lorg/jcodec/containers/mp4/boxes/PixelAspectExt;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lorg/jcodec/containers/mp4/VideoBoxes;->mappings:Ljava/util/Map;

    invoke-static {}, Lorg/jcodec/codecs/h264/mp4/AvcCBox;->fourcc()Ljava/lang/String;

    move-result-object v1

    const-class v2, Lorg/jcodec/codecs/h264/mp4/AvcCBox;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lorg/jcodec/containers/mp4/VideoBoxes;->mappings:Ljava/util/Map;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->fourcc()Ljava/lang/String;

    move-result-object v1

    const-class v2, Lorg/jcodec/containers/mp4/boxes/ColorExtension;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lorg/jcodec/containers/mp4/VideoBoxes;->mappings:Ljava/util/Map;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/GamaExtension;->fourcc()Ljava/lang/String;

    move-result-object v1

    const-class v2, Lorg/jcodec/containers/mp4/boxes/GamaExtension;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lorg/jcodec/containers/mp4/VideoBoxes;->mappings:Ljava/util/Map;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->fourcc()Ljava/lang/String;

    move-result-object v1

    const-class v2, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lorg/jcodec/containers/mp4/VideoBoxes;->mappings:Ljava/util/Map;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/FielExtension;->fourcc()Ljava/lang/String;

    move-result-object v1

    const-class v2, Lorg/jcodec/containers/mp4/boxes/FielExtension;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
