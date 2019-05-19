.class Lcom/android/gallery3d/exif/ExifReader;
.super Ljava/lang/Object;
.source "ExifReader.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ExifReader"


# instance fields
.field private final mInterface:Lcom/android/gallery3d/exif/ExifInterface;


# direct methods
.method constructor <init>(Lcom/android/gallery3d/exif/ExifInterface;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/gallery3d/exif/ExifReader;->mInterface:Lcom/android/gallery3d/exif/ExifInterface;

    return-void
.end method


# virtual methods
.method protected read(Ljava/io/InputStream;)Lcom/android/gallery3d/exif/ExifData;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/gallery3d/exif/ExifInvalidFormatException;,
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifReader;->mInterface:Lcom/android/gallery3d/exif/ExifInterface;

    invoke-static {p1, v0}, Lcom/android/gallery3d/exif/ExifParser;->parse(Ljava/io/InputStream;Lcom/android/gallery3d/exif/ExifInterface;)Lcom/android/gallery3d/exif/ExifParser;

    move-result-object p1

    new-instance v0, Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifParser;->getByteOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/gallery3d/exif/ExifData;-><init>(Ljava/nio/ByteOrder;)V

    nop

    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifParser;->next()I

    move-result v1

    :goto_0
    const/4 v2, 0x5

    if-eq v1, v2, :cond_5

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_2

    :pswitch_0
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifParser;->getStripSize()I

    move-result v1

    new-array v1, v1, [B

    array-length v2, v1

    invoke-virtual {p1, v1}, Lcom/android/gallery3d/exif/ExifParser;->read([B)I

    move-result v3

    if-ne v2, v3, :cond_0

    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifParser;->getStripIndex()I

    move-result v2

    invoke-virtual {v0, v2, v1}, Lcom/android/gallery3d/exif/ExifData;->setStripBytes(I[B)V

    goto/16 :goto_2

    :cond_0
    const-string v1, "ExifReader"

    const-string v2, "Failed to read the strip bytes"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    :pswitch_1
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifParser;->getCompressedImageSize()I

    move-result v1

    if-lez v1, :cond_2

    new-array v1, v1, [B

    array-length v2, v1

    invoke-virtual {p1, v1}, Lcom/android/gallery3d/exif/ExifParser;->read([B)I

    move-result v3

    if-ne v2, v3, :cond_1

    invoke-virtual {v0, v1}, Lcom/android/gallery3d/exif/ExifData;->setCompressedThumbnail([B)V

    goto :goto_1

    :cond_1
    const-string v1, "ExifReader"

    const-string v2, "Failed to read the compressed thumbnail"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    goto :goto_2

    :cond_2
    const-string v2, "ExifReader"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "compressedImageSize="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :pswitch_2
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifParser;->getTag()Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/gallery3d/exif/ExifTag;->getDataType()S

    move-result v2

    const/4 v3, 0x7

    if-ne v2, v3, :cond_3

    invoke-virtual {p1, v1}, Lcom/android/gallery3d/exif/ExifParser;->readFullTagValue(Lcom/android/gallery3d/exif/ExifTag;)V

    :cond_3
    invoke-virtual {v1}, Lcom/android/gallery3d/exif/ExifTag;->getIfd()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/android/gallery3d/exif/IfdData;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    goto :goto_2

    :pswitch_3
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifParser;->getTag()Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/gallery3d/exif/ExifTag;->hasValue()Z

    move-result v2

    if-nez v2, :cond_4

    invoke-virtual {p1, v1}, Lcom/android/gallery3d/exif/ExifParser;->registerForTagValue(Lcom/android/gallery3d/exif/ExifTag;)V

    goto :goto_2

    :cond_4
    invoke-virtual {v1}, Lcom/android/gallery3d/exif/ExifTag;->getIfd()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/android/gallery3d/exif/IfdData;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    goto :goto_2

    :pswitch_4
    new-instance v1, Lcom/android/gallery3d/exif/IfdData;

    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifParser;->getCurrentIfd()I

    move-result v2

    invoke-direct {v1, v2}, Lcom/android/gallery3d/exif/IfdData;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/android/gallery3d/exif/ExifData;->addIfdData(Lcom/android/gallery3d/exif/IfdData;)V

    nop

    :goto_2
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifParser;->next()I

    move-result v1

    goto/16 :goto_0

    :cond_5
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
