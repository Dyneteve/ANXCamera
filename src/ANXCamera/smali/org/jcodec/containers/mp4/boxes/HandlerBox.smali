.class public Lorg/jcodec/containers/mp4/boxes/HandlerBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "HandlerBox.java"


# instance fields
.field private componentFlags:I

.field private componentFlagsMask:I

.field private componentManufacturer:Ljava/lang/String;

.field private componentName:Ljava/lang/String;

.field private componentSubType:Ljava/lang/String;

.field private componentType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-void
.end method

.method public static createHandlerBox(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)Lorg/jcodec/containers/mp4/boxes/HandlerBox;
    .locals 3

    new-instance v0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/HandlerBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    iput-object p0, v0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentType:Ljava/lang/String;

    iput-object p1, v0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentSubType:Ljava/lang/String;

    iput-object p2, v0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentManufacturer:Ljava/lang/String;

    iput p3, v0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentFlags:I

    iput p4, v0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentFlagsMask:I

    const-string p0, ""

    iput-object p0, v0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentName:Ljava/lang/String;

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    const-string v0, "hdlr"

    return-object v0
.end method


# virtual methods
.method public doWrite(Ljava/nio/ByteBuffer;)V
    .locals 1

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentType:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentSubType:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentManufacturer:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentFlags:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentFlagsMask:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentName:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentName:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    :cond_0
    return-void
.end method

.method public estimateSize()I
    .locals 2

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentType:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    array-length v0, v0

    const/16 v1, 0xc

    add-int/2addr v1, v0

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentSubType:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    array-length v0, v0

    add-int/2addr v1, v0

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentManufacturer:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    array-length v0, v0

    add-int/2addr v1, v0

    add-int/lit8 v1, v1, 0x9

    return v1
.end method

.method public getComponentFlags()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentFlags:I

    return v0
.end method

.method public getComponentFlagsMask()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentFlagsMask:I

    return v0
.end method

.method public getComponentManufacturer()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentManufacturer:Ljava/lang/String;

    return-object v0
.end method

.method public getComponentSubType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentSubType:Ljava/lang/String;

    return-object v0
.end method

.method public getComponentType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentType:Ljava/lang/String;

    return-object v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 2

    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    const/4 v0, 0x4

    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->readString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentType:Ljava/lang/String;

    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->readString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentSubType:Ljava/lang/String;

    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->readString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentManufacturer:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentFlags:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentFlagsMask:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->readString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentName:Ljava/lang/String;

    return-void
.end method
