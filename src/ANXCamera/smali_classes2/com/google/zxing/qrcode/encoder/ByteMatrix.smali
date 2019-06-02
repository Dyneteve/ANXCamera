.class public final Lcom/google/zxing/qrcode/encoder/ByteMatrix;
.super Ljava/lang/Object;
.source "ByteMatrix.java"


# instance fields
.field private final bytes:[[B

.field private final height:I

.field private final width:I


# direct methods
.method public constructor <init>(II)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    filled-new-array {p2, p1}, [I

    move-result-object v0

    const-class v1, B

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[B

    iput-object v0, p0, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->bytes:[[B

    iput p1, p0, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->width:I

    iput p2, p0, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->height:I

    return-void
.end method


# virtual methods
.method public clear(B)V
    .registers 5

    const/4 v0, 0x0

    :goto_1
    iget v1, p0, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->height:I

    if-lt v0, v1, :cond_6

    return-void

    :cond_6
    const/4 v1, 0x0

    :goto_7
    iget v2, p0, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->width:I

    if-lt v1, v2, :cond_e

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_e
    iget-object v2, p0, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->bytes:[[B

    aget-object v2, v2, v0

    aput-byte p1, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_7
.end method

.method public get(II)B
    .registers 4

    iget-object v0, p0, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->bytes:[[B

    aget-object v0, v0, p2

    aget-byte v0, v0, p1

    return v0
.end method

.method public getArray()[[B
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->bytes:[[B

    return-object v0
.end method

.method public getHeight()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->height:I

    return v0
.end method

.method public getWidth()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->width:I

    return v0
.end method

.method public set(IIB)V
    .registers 5

    iget-object v0, p0, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->bytes:[[B

    aget-object v0, v0, p2

    aput-byte p3, v0, p1

    return-void
.end method

.method public set(III)V
    .registers 6

    iget-object v0, p0, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->bytes:[[B

    aget-object v0, v0, p2

    int-to-byte v1, p3

    aput-byte v1, v0, p1

    return-void
.end method

.method public set(IIZ)V
    .registers 6

    iget-object v0, p0, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->bytes:[[B

    aget-object v0, v0, p2

    int-to-byte v1, p3

    aput-byte v1, v0, p1

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->width:I

    const/4 v2, 0x2

    mul-int/2addr v1, v2

    iget v3, p0, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->height:I

    mul-int/2addr v1, v3

    add-int/2addr v1, v2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v1, 0x0

    :goto_e
    iget v2, p0, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->height:I

    if-lt v1, v2, :cond_17

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    :cond_17
    const/4 v2, 0x0

    :goto_18
    iget v3, p0, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->width:I

    if-lt v2, v3, :cond_24

    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    :cond_24
    iget-object v3, p0, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->bytes:[[B

    aget-object v3, v3, v1

    aget-byte v3, v3, v2

    packed-switch v3, :pswitch_data_42

    const-string v3, "  "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3f

    :pswitch_33
    const-string v3, " 1"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3f

    :pswitch_39
    const-string v3, " 0"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    nop

    :goto_3f
    add-int/lit8 v2, v2, 0x1

    goto :goto_18

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_39
        :pswitch_33
    .end packed-switch
.end method
