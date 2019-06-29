.class public final Lcom/google/zxing/aztec/AztecWriter;
.super Ljava/lang/Object;
.source "AztecWriter.java"

# interfaces
.implements Lcom/google/zxing/Writer;


# static fields
.field private static final DEFAULT_CHARSET:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "ISO-8859-1"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/aztec/AztecWriter;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/nio/charset/Charset;II)Lcom/google/zxing/common/BitMatrix;
    .registers 10

    sget-object v0, Lcom/google/zxing/BarcodeFormat;->AZTEC:Lcom/google/zxing/BarcodeFormat;

    if-ne p1, v0, :cond_11

    invoke-virtual {p0, p4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-static {v0, p5, p6}, Lcom/google/zxing/aztec/encoder/Encoder;->encode([BII)Lcom/google/zxing/aztec/encoder/AztecCode;

    move-result-object v0

    invoke-static {v0, p2, p3}, Lcom/google/zxing/aztec/AztecWriter;->renderResult(Lcom/google/zxing/aztec/encoder/AztecCode;II)Lcom/google/zxing/common/BitMatrix;

    move-result-object v1

    return-object v1

    :cond_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Can only encode AZTEC, but got "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static renderResult(Lcom/google/zxing/aztec/encoder/AztecCode;II)Lcom/google/zxing/common/BitMatrix;
    .registers 19

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/aztec/encoder/AztecCode;->getMatrix()Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    if-eqz v0, :cond_4d

    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v2

    move/from16 v3, p1

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v4

    move/from16 v5, p2

    invoke-static {v5, v2}, Ljava/lang/Math;->max(II)I

    move-result v6

    div-int v7, v4, v1

    div-int v8, v6, v2

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    mul-int v8, v1, v7

    sub-int v8, v4, v8

    div-int/lit8 v8, v8, 0x2

    mul-int v9, v2, v7

    sub-int v9, v6, v9

    div-int/lit8 v9, v9, 0x2

    new-instance v10, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v10, v4, v6}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    const/4 v11, 0x0

    move v12, v9

    :goto_35
    if-lt v11, v2, :cond_38

    return-object v10

    :cond_38
    const/4 v13, 0x0

    move v14, v8

    :goto_3a
    if-lt v13, v1, :cond_40

    add-int/lit8 v11, v11, 0x1

    add-int/2addr v12, v7

    goto :goto_35

    :cond_40
    invoke-virtual {v0, v13, v11}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v15

    if-eqz v15, :cond_49

    invoke-virtual {v10, v14, v12, v7, v7}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    :cond_49
    add-int/lit8 v13, v13, 0x1

    add-int/2addr v14, v7

    goto :goto_3a

    :cond_4d
    move/from16 v3, p1

    move/from16 v5, p2

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1
.end method


# virtual methods
.method public encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    .registers 11

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/google/zxing/aztec/AztecWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    .registers 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/zxing/BarcodeFormat;",
            "II",
            "Ljava/util/Map<",
            "Lcom/google/zxing/EncodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/BitMatrix;"
        }
    .end annotation

    move-object/from16 v0, p5

    const/4 v1, 0x0

    if-nez v0, :cond_7

    move-object v2, v1

    goto :goto_f

    :cond_7
    sget-object v2, Lcom/google/zxing/EncodeHintType;->CHARACTER_SET:Lcom/google/zxing/EncodeHintType;

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    :goto_f
    if-nez v0, :cond_13

    move-object v3, v1

    goto :goto_1b

    :cond_13
    sget-object v3, Lcom/google/zxing/EncodeHintType;->ERROR_CORRECTION:Lcom/google/zxing/EncodeHintType;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    :goto_1b
    if-nez v0, :cond_1e

    goto :goto_26

    :cond_1e
    sget-object v1, Lcom/google/zxing/EncodeHintType;->AZTEC_LAYERS:Lcom/google/zxing/EncodeHintType;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    :goto_26
    nop

    nop

    nop

    nop

    if-nez v2, :cond_30

    sget-object v4, Lcom/google/zxing/aztec/AztecWriter;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    :goto_2e
    move-object v9, v4

    goto :goto_35

    :cond_30
    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v4

    goto :goto_2e

    :goto_35
    if-nez v3, :cond_3b

    const/16 v4, 0x21

    :goto_39
    move v10, v4

    goto :goto_40

    :cond_3b
    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v4

    goto :goto_39

    :goto_40
    if-nez v1, :cond_45

    const/4 v4, 0x0

    :goto_43
    move v11, v4

    goto :goto_4a

    :cond_45
    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v4

    goto :goto_43

    :goto_4a
    move-object v5, p1

    move-object v6, p2

    move v7, p3

    move/from16 v8, p4

    invoke-static/range {v5 .. v11}, Lcom/google/zxing/aztec/AztecWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/nio/charset/Charset;II)Lcom/google/zxing/common/BitMatrix;

    move-result-object v4

    return-object v4
.end method
