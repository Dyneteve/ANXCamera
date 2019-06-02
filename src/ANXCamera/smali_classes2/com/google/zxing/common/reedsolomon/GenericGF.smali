.class public final Lcom/google/zxing/common/reedsolomon/GenericGF;
.super Ljava/lang/Object;
.source "GenericGF.java"


# static fields
.field public static final AZTEC_DATA_10:Lcom/google/zxing/common/reedsolomon/GenericGF;

.field public static final AZTEC_DATA_12:Lcom/google/zxing/common/reedsolomon/GenericGF;

.field public static final AZTEC_DATA_6:Lcom/google/zxing/common/reedsolomon/GenericGF;

.field public static final AZTEC_DATA_8:Lcom/google/zxing/common/reedsolomon/GenericGF;

.field public static final AZTEC_PARAM:Lcom/google/zxing/common/reedsolomon/GenericGF;

.field public static final DATA_MATRIX_FIELD_256:Lcom/google/zxing/common/reedsolomon/GenericGF;

.field public static final MAXICODE_FIELD_64:Lcom/google/zxing/common/reedsolomon/GenericGF;

.field public static final QR_CODE_FIELD_256:Lcom/google/zxing/common/reedsolomon/GenericGF;


# instance fields
.field private final expTable:[I

.field private final generatorBase:I

.field private final logTable:[I

.field private final one:Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

.field private final primitive:I

.field private final size:I

.field private final zero:Lcom/google/zxing/common/reedsolomon/GenericGFPoly;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lcom/google/zxing/common/reedsolomon/GenericGF;

    const/4 v1, 0x1

    const/16 v2, 0x1069

    const/16 v3, 0x1000

    invoke-direct {v0, v2, v3, v1}, Lcom/google/zxing/common/reedsolomon/GenericGF;-><init>(III)V

    sput-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_12:Lcom/google/zxing/common/reedsolomon/GenericGF;

    new-instance v0, Lcom/google/zxing/common/reedsolomon/GenericGF;

    const/16 v2, 0x409

    const/16 v3, 0x400

    invoke-direct {v0, v2, v3, v1}, Lcom/google/zxing/common/reedsolomon/GenericGF;-><init>(III)V

    sput-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_10:Lcom/google/zxing/common/reedsolomon/GenericGF;

    new-instance v0, Lcom/google/zxing/common/reedsolomon/GenericGF;

    const/16 v2, 0x43

    const/16 v3, 0x40

    invoke-direct {v0, v2, v3, v1}, Lcom/google/zxing/common/reedsolomon/GenericGF;-><init>(III)V

    sput-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_6:Lcom/google/zxing/common/reedsolomon/GenericGF;

    new-instance v0, Lcom/google/zxing/common/reedsolomon/GenericGF;

    const/16 v2, 0x13

    const/16 v3, 0x10

    invoke-direct {v0, v2, v3, v1}, Lcom/google/zxing/common/reedsolomon/GenericGF;-><init>(III)V

    sput-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_PARAM:Lcom/google/zxing/common/reedsolomon/GenericGF;

    new-instance v0, Lcom/google/zxing/common/reedsolomon/GenericGF;

    const/16 v2, 0x100

    const/16 v3, 0x11d

    const/4 v4, 0x0

    invoke-direct {v0, v3, v2, v4}, Lcom/google/zxing/common/reedsolomon/GenericGF;-><init>(III)V

    sput-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->QR_CODE_FIELD_256:Lcom/google/zxing/common/reedsolomon/GenericGF;

    new-instance v0, Lcom/google/zxing/common/reedsolomon/GenericGF;

    const/16 v3, 0x12d

    invoke-direct {v0, v3, v2, v1}, Lcom/google/zxing/common/reedsolomon/GenericGF;-><init>(III)V

    sput-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->DATA_MATRIX_FIELD_256:Lcom/google/zxing/common/reedsolomon/GenericGF;

    sget-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->DATA_MATRIX_FIELD_256:Lcom/google/zxing/common/reedsolomon/GenericGF;

    sput-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_8:Lcom/google/zxing/common/reedsolomon/GenericGF;

    sget-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_6:Lcom/google/zxing/common/reedsolomon/GenericGF;

    sput-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->MAXICODE_FIELD_64:Lcom/google/zxing/common/reedsolomon/GenericGF;

    return-void
.end method

.method public constructor <init>(III)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->primitive:I

    iput p2, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->size:I

    iput p3, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->generatorBase:I

    new-array v0, p2, [I

    iput-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->expTable:[I

    new-array v0, p2, [I

    iput-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->logTable:[I

    const/4 v0, 0x1

    const/4 v1, 0x0

    :goto_13
    if-lt v1, p2, :cond_3c

    const/4 v1, 0x0

    :goto_16
    add-int/lit8 v2, p2, -0x1

    if-lt v1, v2, :cond_31

    new-instance v1, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    const/4 v2, 0x1

    new-array v3, v2, [I

    invoke-direct {v1, p0, v3}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;[I)V

    iput-object v1, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->zero:Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    new-instance v1, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    new-array v3, v2, [I

    const/4 v4, 0x0

    aput v2, v3, v4

    invoke-direct {v1, p0, v3}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;[I)V

    iput-object v1, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->one:Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    return-void

    :cond_31
    iget-object v2, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->logTable:[I

    iget-object v3, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->expTable:[I

    aget v3, v3, v1

    aput v1, v2, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    :cond_3c
    iget-object v2, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->expTable:[I

    aput v0, v2, v1

    mul-int/lit8 v0, v0, 0x2

    if-lt v0, p2, :cond_48

    xor-int/2addr v0, p1

    add-int/lit8 v2, p2, -0x1

    and-int/2addr v0, v2

    :cond_48
    add-int/lit8 v1, v1, 0x1

    goto :goto_13
.end method

.method static addOrSubtract(II)I
    .registers 3

    xor-int v0, p0, p1

    return v0
.end method


# virtual methods
.method buildMonomial(II)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .registers 5

    if-ltz p1, :cond_14

    if-nez p2, :cond_7

    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->zero:Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    return-object v0

    :cond_7
    add-int/lit8 v0, p1, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    aput p2, v0, v1

    new-instance v1, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    invoke-direct {v1, p0, v0}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;[I)V

    return-object v1

    :cond_14
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method exp(I)I
    .registers 3

    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->expTable:[I

    aget v0, v0, p1

    return v0
.end method

.method public getGeneratorBase()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->generatorBase:I

    return v0
.end method

.method getOne()Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->one:Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    return-object v0
.end method

.method public getSize()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->size:I

    return v0
.end method

.method getZero()Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->zero:Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    return-object v0
.end method

.method inverse(I)I
    .registers 5

    if-eqz p1, :cond_10

    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->expTable:[I

    iget v1, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->size:I

    iget-object v2, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->logTable:[I

    aget v2, v2, p1

    sub-int/2addr v1, v2

    add-int/lit8 v1, v1, -0x1

    aget v0, v0, v1

    return v0

    :cond_10
    new-instance v0, Ljava/lang/ArithmeticException;

    invoke-direct {v0}, Ljava/lang/ArithmeticException;-><init>()V

    throw v0
.end method

.method log(I)I
    .registers 3

    if-eqz p1, :cond_7

    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->logTable:[I

    aget v0, v0, p1

    return v0

    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method multiply(II)I
    .registers 6

    if-eqz p1, :cond_18

    if-nez p2, :cond_5

    goto :goto_18

    :cond_5
    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->expTable:[I

    iget-object v1, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->logTable:[I

    aget v1, v1, p1

    iget-object v2, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->logTable:[I

    aget v2, v2, p2

    add-int/2addr v1, v2

    iget v2, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->size:I

    add-int/lit8 v2, v2, -0x1

    rem-int/2addr v1, v2

    aget v0, v0, v1

    return v0

    :cond_18
    :goto_18
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "GF(0x"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->primitive:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/zxing/common/reedsolomon/GenericGF;->size:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
