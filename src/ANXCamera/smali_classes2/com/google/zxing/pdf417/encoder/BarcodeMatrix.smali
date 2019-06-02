.class public final Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;
.super Ljava/lang/Object;
.source "BarcodeMatrix.java"


# instance fields
.field private currentRow:I

.field private final height:I

.field private final matrix:[Lcom/google/zxing/pdf417/encoder/BarcodeRow;

.field private final width:I


# direct methods
.method constructor <init>(II)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array v0, p1, [Lcom/google/zxing/pdf417/encoder/BarcodeRow;

    iput-object v0, p0, Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;->matrix:[Lcom/google/zxing/pdf417/encoder/BarcodeRow;

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;->matrix:[Lcom/google/zxing/pdf417/encoder/BarcodeRow;

    array-length v1, v1

    :goto_b
    if-lt v0, v1, :cond_17

    mul-int/lit8 v0, p2, 0x11

    iput v0, p0, Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;->width:I

    iput p1, p0, Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;->height:I

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;->currentRow:I

    return-void

    :cond_17
    iget-object v2, p0, Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;->matrix:[Lcom/google/zxing/pdf417/encoder/BarcodeRow;

    new-instance v3, Lcom/google/zxing/pdf417/encoder/BarcodeRow;

    add-int/lit8 v4, p2, 0x4

    mul-int/lit8 v4, v4, 0x11

    add-int/lit8 v4, v4, 0x1

    invoke-direct {v3, v4}, Lcom/google/zxing/pdf417/encoder/BarcodeRow;-><init>(I)V

    aput-object v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_b
.end method


# virtual methods
.method getCurrentRow()Lcom/google/zxing/pdf417/encoder/BarcodeRow;
    .registers 3

    iget-object v0, p0, Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;->matrix:[Lcom/google/zxing/pdf417/encoder/BarcodeRow;

    iget v1, p0, Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;->currentRow:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getMatrix()[[B
    .registers 2

    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0}, Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;->getScaledMatrix(II)[[B

    move-result-object v0

    return-object v0
.end method

.method public getScaledMatrix(II)[[B
    .registers 9

    iget v0, p0, Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;->height:I

    mul-int/2addr v0, p2

    iget v1, p0, Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;->width:I

    mul-int/2addr v1, p1

    filled-new-array {v0, v1}, [I

    move-result-object v0

    const-class v1, B

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[B

    iget v1, p0, Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;->height:I

    mul-int/2addr v1, p2

    const/4 v2, 0x0

    :goto_16
    if-lt v2, v1, :cond_19

    return-object v0

    :cond_19
    sub-int v3, v1, v2

    add-int/lit8 v3, v3, -0x1

    iget-object v4, p0, Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;->matrix:[Lcom/google/zxing/pdf417/encoder/BarcodeRow;

    div-int v5, v2, p2

    aget-object v4, v4, v5

    invoke-virtual {v4, p1}, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->getScaledRow(I)[B

    move-result-object v4

    aput-object v4, v0, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_16
.end method

.method set(IIB)V
    .registers 5

    iget-object v0, p0, Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;->matrix:[Lcom/google/zxing/pdf417/encoder/BarcodeRow;

    aget-object v0, v0, p2

    invoke-virtual {v0, p1, p3}, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->set(IB)V

    return-void
.end method

.method startRow()V
    .registers 2

    iget v0, p0, Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;->currentRow:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;->currentRow:I

    return-void
.end method
