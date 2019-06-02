.class public Lcom/google/zxing/ResultPoint;
.super Ljava/lang/Object;
.source "ResultPoint.java"


# instance fields
.field private final x:F

.field private final y:F


# direct methods
.method public constructor <init>(FF)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/zxing/ResultPoint;->x:F

    iput p2, p0, Lcom/google/zxing/ResultPoint;->y:F

    return-void
.end method

.method private static crossProductZ(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F
    .registers 8

    iget v0, p1, Lcom/google/zxing/ResultPoint;->x:F

    iget v1, p1, Lcom/google/zxing/ResultPoint;->y:F

    iget v2, p2, Lcom/google/zxing/ResultPoint;->x:F

    sub-float/2addr v2, v0

    iget v3, p0, Lcom/google/zxing/ResultPoint;->y:F

    sub-float/2addr v3, v1

    mul-float/2addr v2, v3

    iget v3, p2, Lcom/google/zxing/ResultPoint;->y:F

    sub-float/2addr v3, v1

    iget v4, p0, Lcom/google/zxing/ResultPoint;->x:F

    sub-float/2addr v4, v0

    mul-float/2addr v3, v4

    sub-float/2addr v2, v3

    return v2
.end method

.method public static distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F
    .registers 6

    iget v0, p0, Lcom/google/zxing/ResultPoint;->x:F

    iget v1, p0, Lcom/google/zxing/ResultPoint;->y:F

    iget v2, p1, Lcom/google/zxing/ResultPoint;->x:F

    iget v3, p1, Lcom/google/zxing/ResultPoint;->y:F

    invoke-static {v0, v1, v2, v3}, Lcom/google/zxing/common/detector/MathUtils;->distance(FFFF)F

    move-result v0

    return v0
.end method

.method public static orderBestPatterns([Lcom/google/zxing/ResultPoint;)V
    .registers 12

    const/4 v0, 0x0

    aget-object v1, p0, v0

    const/4 v2, 0x1

    aget-object v3, p0, v2

    invoke-static {v1, v3}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v1

    aget-object v3, p0, v2

    const/4 v4, 0x2

    aget-object v5, p0, v4

    invoke-static {v3, v5}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v3

    aget-object v5, p0, v0

    aget-object v6, p0, v4

    invoke-static {v5, v6}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v5

    cmpl-float v6, v3, v1

    if-ltz v6, :cond_2a

    cmpl-float v6, v3, v5

    if-ltz v6, :cond_2a

    aget-object v6, p0, v0

    aget-object v7, p0, v2

    aget-object v8, p0, v4

    goto :goto_3f

    :cond_2a
    cmpl-float v6, v5, v3

    if-ltz v6, :cond_39

    cmpl-float v6, v5, v1

    if-ltz v6, :cond_39

    aget-object v6, p0, v2

    aget-object v7, p0, v0

    aget-object v8, p0, v4

    goto :goto_3f

    :cond_39
    aget-object v6, p0, v4

    aget-object v7, p0, v0

    aget-object v8, p0, v2

    :goto_3f
    invoke-static {v7, v6, v8}, Lcom/google/zxing/ResultPoint;->crossProductZ(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v9

    const/4 v10, 0x0

    cmpg-float v9, v9, v10

    if-gez v9, :cond_4b

    move-object v9, v7

    move-object v7, v8

    move-object v8, v9

    :cond_4b
    aput-object v7, p0, v0

    aput-object v6, p0, v2

    aput-object v8, p0, v4

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    instance-of v0, p1, Lcom/google/zxing/ResultPoint;

    const/4 v1, 0x0

    if-eqz v0, :cond_1a

    move-object v0, p1

    check-cast v0, Lcom/google/zxing/ResultPoint;

    iget v2, p0, Lcom/google/zxing/ResultPoint;->x:F

    iget v3, v0, Lcom/google/zxing/ResultPoint;->x:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_19

    iget v2, p0, Lcom/google/zxing/ResultPoint;->y:F

    iget v3, v0, Lcom/google/zxing/ResultPoint;->y:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_19

    const/4 v1, 0x1

    :cond_19
    return v1

    :cond_1a
    return v1
.end method

.method public final getX()F
    .registers 2

    iget v0, p0, Lcom/google/zxing/ResultPoint;->x:F

    return v0
.end method

.method public final getY()F
    .registers 2

    iget v0, p0, Lcom/google/zxing/ResultPoint;->y:F

    return v0
.end method

.method public final hashCode()I
    .registers 3

    iget v0, p0, Lcom/google/zxing/ResultPoint;->x:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v1, v0

    iget v0, p0, Lcom/google/zxing/ResultPoint;->y:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    add-int/2addr v1, v0

    return v1
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x19

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/zxing/ResultPoint;->x:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/zxing/ResultPoint;->y:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
