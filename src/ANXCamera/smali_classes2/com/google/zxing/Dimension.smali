.class public final Lcom/google/zxing/Dimension;
.super Ljava/lang/Object;
.source "Dimension.java"


# instance fields
.field private final height:I

.field private final width:I


# direct methods
.method public constructor <init>(II)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-ltz p1, :cond_c

    if-ltz p2, :cond_c

    iput p1, p0, Lcom/google/zxing/Dimension;->width:I

    iput p2, p0, Lcom/google/zxing/Dimension;->height:I

    return-void

    :cond_c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    instance-of v0, p1, Lcom/google/zxing/Dimension;

    const/4 v1, 0x0

    if-eqz v0, :cond_16

    move-object v0, p1

    check-cast v0, Lcom/google/zxing/Dimension;

    iget v2, p0, Lcom/google/zxing/Dimension;->width:I

    iget v3, v0, Lcom/google/zxing/Dimension;->width:I

    if-ne v2, v3, :cond_15

    iget v2, p0, Lcom/google/zxing/Dimension;->height:I

    iget v3, v0, Lcom/google/zxing/Dimension;->height:I

    if-ne v2, v3, :cond_15

    const/4 v1, 0x1

    :cond_15
    return v1

    :cond_16
    return v1
.end method

.method public getHeight()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/Dimension;->height:I

    return v0
.end method

.method public getWidth()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/Dimension;->width:I

    return v0
.end method

.method public hashCode()I
    .registers 3

    iget v0, p0, Lcom/google/zxing/Dimension;->width:I

    mul-int/lit16 v0, v0, 0x7fc9

    iget v1, p0, Lcom/google/zxing/Dimension;->height:I

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/zxing/Dimension;->width:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/zxing/Dimension;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
