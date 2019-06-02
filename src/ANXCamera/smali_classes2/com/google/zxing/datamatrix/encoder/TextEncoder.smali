.class final Lcom/google/zxing/datamatrix/encoder/TextEncoder;
.super Lcom/google/zxing/datamatrix/encoder/C40Encoder;
.source "TextEncoder.java"


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/zxing/datamatrix/encoder/C40Encoder;-><init>()V

    return-void
.end method


# virtual methods
.method encodeChar(CLjava/lang/StringBuilder;)I
    .registers 6

    const/4 v0, 0x1

    const/16 v1, 0x20

    if-ne p1, v1, :cond_a

    const/4 v1, 0x3

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return v0

    :cond_a
    const/16 v1, 0x30

    if-lt p1, v1, :cond_1b

    const/16 v1, 0x39

    if-gt p1, v1, :cond_1b

    add-int/lit8 v1, p1, -0x30

    add-int/lit8 v1, v1, 0x4

    int-to-char v1, v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return v0

    :cond_1b
    const/16 v1, 0x61

    if-lt p1, v1, :cond_2c

    const/16 v1, 0x7a

    if-gt p1, v1, :cond_2c

    add-int/lit8 v1, p1, -0x61

    add-int/lit8 v1, v1, 0xe

    int-to-char v1, v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return v0

    :cond_2c
    const/4 v1, 0x2

    if-ltz p1, :cond_3b

    const/16 v2, 0x1f

    if-gt p1, v2, :cond_3b

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return v1

    :cond_3b
    const/16 v2, 0x21

    if-lt p1, v2, :cond_4d

    const/16 v2, 0x2f

    if-gt p1, v2, :cond_4d

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, p1, -0x21

    int-to-char v0, v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return v1

    :cond_4d
    const/16 v2, 0x3a

    if-lt p1, v2, :cond_61

    const/16 v2, 0x40

    if-gt p1, v2, :cond_61

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, p1, -0x3a

    add-int/lit8 v0, v0, 0xf

    int-to-char v0, v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return v1

    :cond_61
    const/16 v2, 0x5b

    if-lt p1, v2, :cond_75

    const/16 v2, 0x5f

    if-gt p1, v2, :cond_75

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, p1, -0x5b

    add-int/lit8 v0, v0, 0x16

    int-to-char v0, v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return v1

    :cond_75
    const/16 v2, 0x60

    if-ne p1, v2, :cond_83

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, p1, -0x60

    int-to-char v0, v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return v1

    :cond_83
    const/16 v2, 0x41

    if-lt p1, v2, :cond_96

    const/16 v2, 0x5a

    if-gt p1, v2, :cond_96

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, p1, -0x41

    add-int/2addr v2, v0

    int-to-char v0, v2

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return v1

    :cond_96
    const/16 v0, 0x7b

    if-lt p1, v0, :cond_aa

    const/16 v0, 0x7f

    if-gt p1, v0, :cond_aa

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, p1, -0x7b

    add-int/lit8 v0, v0, 0x1b

    int-to-char v0, v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return v1

    :cond_aa
    const/16 v0, 0x80

    if-lt p1, v0, :cond_bd

    const-string v0, "\u0001\u001e"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v0, 0x2

    add-int/lit8 v1, p1, -0x80

    int-to-char v1, v1

    invoke-virtual {p0, v1, p2}, Lcom/google/zxing/datamatrix/encoder/TextEncoder;->encodeChar(CLjava/lang/StringBuilder;)I

    move-result v1

    add-int/2addr v0, v1

    return v0

    :cond_bd
    invoke-static {p1}, Lcom/google/zxing/datamatrix/encoder/HighLevelEncoder;->illegalCharacter(C)V

    const/4 v0, -0x1

    return v0
.end method

.method public getEncodingMode()I
    .registers 2

    const/4 v0, 0x2

    return v0
.end method
