.class public Lcom/android/camera/effect/framework/graphics/Block;
.super Ljava/lang/Object;
.source "Block.java"


# instance fields
.field public mHeight:I

.field public mOffset:I

.field public mRowStride:I

.field public mWidth:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getOffset(II)[I
    .locals 2

    const/4 p2, 0x2

    new-array p2, p2, [I

    iget v0, p0, Lcom/android/camera/effect/framework/graphics/Block;->mOffset:I

    rem-int/2addr v0, p1

    iget v1, p0, Lcom/android/camera/effect/framework/graphics/Block;->mWidth:I

    div-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/effect/framework/graphics/Block;->mOffset:I

    div-int/2addr v1, p1

    iget p1, p0, Lcom/android/camera/effect/framework/graphics/Block;->mHeight:I

    div-int/2addr v1, p1

    iget p1, p0, Lcom/android/camera/effect/framework/graphics/Block;->mWidth:I

    mul-int/2addr v0, p1

    const/4 p1, 0x0

    aput v0, p2, p1

    iget p1, p0, Lcom/android/camera/effect/framework/graphics/Block;->mHeight:I

    mul-int/2addr v1, p1

    const/4 p1, 0x1

    aput v1, p2, p1

    return-object p2
.end method

.method public getYUVOffset(IIII)[I
    .locals 6

    const/4 p4, 0x2

    new-array p4, p4, [I

    iget v0, p0, Lcom/android/camera/effect/framework/graphics/Block;->mOffset:I

    div-int/2addr v0, p3

    iget v1, p0, Lcom/android/camera/effect/framework/graphics/Block;->mOffset:I

    rem-int/2addr v1, p3

    mul-int/2addr p1, v0

    add-int/2addr p1, v1

    const/4 p3, 0x0

    aput p1, p4, p3

    int-to-double v2, v0

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-int p1, v2

    mul-int/2addr p1, p2

    add-int/2addr p1, v1

    const/4 p2, 0x1

    aput p1, p4, p2

    return-object p4
.end method
