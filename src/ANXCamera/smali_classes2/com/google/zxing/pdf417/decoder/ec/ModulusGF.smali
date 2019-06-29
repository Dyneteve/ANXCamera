.class public final Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;
.super Ljava/lang/Object;
.source "ModulusGF.java"


# static fields
.field public static final PDF417_GF:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;


# instance fields
.field private final expTable:[I

.field private final logTable:[I

.field private final modulus:I

.field private final one:Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

.field private final zero:Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    const/16 v1, 0x3a1

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;-><init>(II)V

    sput-object v0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->PDF417_GF:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    return-void
.end method

.method private constructor <init>(II)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->modulus:I

    new-array v0, p1, [I

    iput-object v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->expTable:[I

    new-array v0, p1, [I

    iput-object v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->logTable:[I

    const/4 v0, 0x1

    const/4 v1, 0x0

    :goto_f
    if-lt v1, p1, :cond_38

    const/4 v1, 0x0

    :goto_12
    add-int/lit8 v2, p1, -0x1

    if-lt v1, v2, :cond_2d

    new-instance v1, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    const/4 v2, 0x1

    new-array v3, v2, [I

    invoke-direct {v1, p0, v3}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;-><init>(Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;[I)V

    iput-object v1, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->zero:Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    new-instance v1, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    new-array v3, v2, [I

    const/4 v4, 0x0

    aput v2, v3, v4

    invoke-direct {v1, p0, v3}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;-><init>(Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;[I)V

    iput-object v1, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->one:Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    return-void

    :cond_2d
    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->logTable:[I

    iget-object v3, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->expTable:[I

    aget v3, v3, v1

    aput v1, v2, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    :cond_38
    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->expTable:[I

    aput v0, v2, v1

    mul-int v2, v0, p2

    rem-int v0, v2, p1

    add-int/lit8 v1, v1, 0x1

    goto :goto_f
.end method


# virtual methods
.method add(II)I
    .registers 5

    add-int v0, p1, p2

    iget v1, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->modulus:I

    rem-int/2addr v0, v1

    return v0
.end method

.method buildMonomial(II)Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .registers 5

    if-ltz p1, :cond_14

    if-nez p2, :cond_7

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->zero:Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    return-object v0

    :cond_7
    add-int/lit8 v0, p1, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    aput p2, v0, v1

    new-instance v1, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    invoke-direct {v1, p0, v0}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;-><init>(Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;[I)V

    return-object v1

    :cond_14
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method exp(I)I
    .registers 3

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->expTable:[I

    aget v0, v0, p1

    return v0
.end method

.method getOne()Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->one:Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    return-object v0
.end method

.method getSize()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->modulus:I

    return v0
.end method

.method getZero()Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->zero:Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    return-object v0
.end method

.method inverse(I)I
    .registers 5

    if-eqz p1, :cond_10

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->expTable:[I

    iget v1, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->modulus:I

    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->logTable:[I

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

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->logTable:[I

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
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->expTable:[I

    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->logTable:[I

    aget v1, v1, p1

    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->logTable:[I

    aget v2, v2, p2

    add-int/2addr v1, v2

    iget v2, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->modulus:I

    add-int/lit8 v2, v2, -0x1

    rem-int/2addr v1, v2

    aget v0, v0, v1

    return v0

    :cond_18
    :goto_18
    const/4 v0, 0x0

    return v0
.end method

.method subtract(II)I
    .registers 5

    iget v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->modulus:I

    add-int/2addr v0, p1

    sub-int/2addr v0, p2

    iget v1, p0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->modulus:I

    rem-int/2addr v0, v1

    return v0
.end method
