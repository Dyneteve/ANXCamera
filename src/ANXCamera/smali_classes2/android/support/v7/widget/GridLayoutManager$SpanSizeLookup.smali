.class public abstract Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;
.super Ljava/lang/Object;
.source "GridLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/GridLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SpanSizeLookup"
.end annotation


# instance fields
.field private mCacheSpanIndices:Z

.field final mSpanIndexCache:Landroid/util/SparseIntArray;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanIndices:Z

    return-void
.end method


# virtual methods
.method findReferenceIndexFromCache(I)I
    .registers 6

    const/4 v0, 0x0

    iget-object v1, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v1}, Landroid/util/SparseIntArray;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_9
    if-gt v0, v1, :cond_1e

    add-int v2, v0, v1

    ushr-int/lit8 v2, v2, 0x1

    iget-object v3, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v3

    if-ge v3, p1, :cond_1a

    add-int/lit8 v0, v2, 0x1

    goto :goto_1d

    :cond_1a
    add-int/lit8 v2, v2, -0x1

    move v1, v2

    :goto_1d
    goto :goto_9

    :cond_1e
    add-int/lit8 v2, v0, -0x1

    if-ltz v2, :cond_31

    iget-object v3, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v3}, Landroid/util/SparseIntArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_31

    iget-object v3, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v3

    return v3

    :cond_31
    const/4 v3, -0x1

    return v3
.end method

.method getCachedSpanIndex(II)I
    .registers 6

    iget-boolean v0, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanIndices:Z

    if-nez v0, :cond_9

    invoke-virtual {p0, p1, p2}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanIndex(II)I

    move-result v0

    return v0

    :cond_9
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    const/4 v1, -0x1

    invoke-virtual {v0, p1, v1}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    if-eq v0, v1, :cond_13

    return v0

    :cond_13
    invoke-virtual {p0, p1, p2}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanIndex(II)I

    move-result v1

    iget-object v2, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v2, p1, v1}, Landroid/util/SparseIntArray;->put(II)V

    return v1
.end method

.method public getSpanGroupIndex(II)I
    .registers 8

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v2

    const/4 v3, 0x0

    :goto_7
    if-ge v3, p1, :cond_1c

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v4

    add-int/2addr v0, v4

    if-ne v0, p2, :cond_14

    const/4 v0, 0x0

    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    :cond_14
    if-le v0, p2, :cond_19

    move v0, v4

    add-int/lit8 v1, v1, 0x1

    :cond_19
    :goto_19
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    :cond_1c
    add-int v3, v0, v2

    if-le v3, p2, :cond_22

    add-int/lit8 v1, v1, 0x1

    :cond_22
    return v1
.end method

.method public getSpanIndex(II)I
    .registers 10

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v0

    const/4 v1, 0x0

    if-ne v0, p2, :cond_8

    return v1

    :cond_8
    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-boolean v4, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanIndices:Z

    if-eqz v4, :cond_2a

    iget-object v4, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v4}, Landroid/util/SparseIntArray;->size()I

    move-result v4

    if-lez v4, :cond_2a

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->findReferenceIndexFromCache(I)I

    move-result v4

    if-ltz v4, :cond_2a

    iget-object v5, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v5, v4}, Landroid/util/SparseIntArray;->get(I)I

    move-result v5

    invoke-virtual {p0, v4}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v6

    add-int v2, v5, v6

    add-int/lit8 v3, v4, 0x1

    :cond_2a
    move v4, v2

    move v2, v3

    :goto_2c
    if-ge v2, p1, :cond_3d

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v5

    add-int/2addr v4, v5

    if-ne v4, p2, :cond_37

    const/4 v4, 0x0

    goto :goto_3a

    :cond_37
    if-le v4, p2, :cond_3a

    move v4, v5

    :cond_3a
    :goto_3a
    add-int/lit8 v2, v2, 0x1

    goto :goto_2c

    :cond_3d
    add-int v2, v4, v0

    if-gt v2, p2, :cond_42

    return v4

    :cond_42
    return v1
.end method

.method public abstract getSpanSize(I)I
.end method

.method public invalidateSpanIndexCache()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->clear()V

    return-void
.end method

.method public isSpanIndexCacheEnabled()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanIndices:Z

    return v0
.end method

.method public setSpanIndexCacheEnabled(Z)V
    .registers 2

    iput-boolean p1, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanIndices:Z

    return-void
.end method
