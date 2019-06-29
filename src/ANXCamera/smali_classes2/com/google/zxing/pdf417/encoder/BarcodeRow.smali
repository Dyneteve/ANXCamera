.class final Lcom/google/zxing/pdf417/encoder/BarcodeRow;
.super Ljava/lang/Object;
.source "BarcodeRow.java"


# instance fields
.field private currentLocation:I

.field private final row:[B


# direct methods
.method constructor <init>(I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array v0, p1, [B

    iput-object v0, p0, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->row:[B

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->currentLocation:I

    return-void
.end method


# virtual methods
.method addBar(ZI)V
    .registers 6

    const/4 v0, 0x0

    :goto_1
    if-lt v0, p2, :cond_4

    return-void

    :cond_4
    iget v1, p0, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->currentLocation:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->currentLocation:I

    invoke-virtual {p0, v1, p1}, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->set(IZ)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method getScaledRow(I)[B
    .registers 6

    iget-object v0, p0, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->row:[B

    array-length v0, v0

    mul-int/2addr v0, p1

    new-array v0, v0, [B

    const/4 v1, 0x0

    :goto_7
    array-length v2, v0

    if-lt v1, v2, :cond_b

    return-object v0

    :cond_b
    iget-object v2, p0, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->row:[B

    div-int v3, v1, p1

    aget-byte v2, v2, v3

    aput-byte v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_7
.end method

.method set(IB)V
    .registers 4

    iget-object v0, p0, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->row:[B

    aput-byte p2, v0, p1

    return-void
.end method

.method set(IZ)V
    .registers 5

    iget-object v0, p0, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->row:[B

    int-to-byte v1, p2

    aput-byte v1, v0, p1

    return-void
.end method
