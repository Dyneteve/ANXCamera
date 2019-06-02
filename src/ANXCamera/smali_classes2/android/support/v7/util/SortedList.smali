.class public Landroid/support/v7/util/SortedList;
.super Ljava/lang/Object;
.source "SortedList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/util/SortedList$BatchedCallback;,
        Landroid/support/v7/util/SortedList$Callback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final CAPACITY_GROWTH:I = 0xa

.field private static final DELETION:I = 0x2

.field private static final INSERTION:I = 0x1

.field public static final INVALID_POSITION:I = -0x1

.field private static final LOOKUP:I = 0x4

.field private static final MIN_CAPACITY:I = 0xa


# instance fields
.field private mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

.field private mCallback:Landroid/support/v7/util/SortedList$Callback;

.field mData:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field

.field private mMergedSize:I

.field private mOldData:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field

.field private mOldDataSize:I

.field private mOldDataStart:I

.field private mSize:I

.field private final mTClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;Landroid/support/v7/util/SortedList$Callback;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Landroid/support/v7/util/SortedList$Callback<",
            "TT;>;)V"
        }
    .end annotation

    const/16 v0, 0xa

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/util/SortedList;-><init>(Ljava/lang/Class;Landroid/support/v7/util/SortedList$Callback;I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Landroid/support/v7/util/SortedList$Callback;I)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Landroid/support/v7/util/SortedList$Callback<",
            "TT;>;I)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/v7/util/SortedList;->mTClass:Ljava/lang/Class;

    invoke-static {p1, p3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iput-object p2, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    return-void
.end method

.method private add(Ljava/lang/Object;Z)I
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)I"
        }
    .end annotation

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v4, p0, Landroid/support/v7/util/SortedList;->mSize:I

    const/4 v3, 0x0

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/util/SortedList;->findIndexOf(Ljava/lang/Object;[Ljava/lang/Object;III)I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, -0x1

    if-ne v0, v2, :cond_12

    const/4 v0, 0x0

    goto :goto_39

    :cond_12
    iget v2, p0, Landroid/support/v7/util/SortedList;->mSize:I

    if-ge v0, v2, :cond_39

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aget-object v2, v2, v0

    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v2, p1}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_39

    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v2, p1}, Landroid/support/v7/util/SortedList$Callback;->areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2f

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aput-object p1, v1, v0

    return v0

    :cond_2f
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aput-object p1, v3, v0

    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v0, v1}, Landroid/support/v7/util/SortedList$Callback;->onChanged(II)V

    return v0

    :cond_39
    :goto_39
    invoke-direct {p0, v0, p1}, Landroid/support/v7/util/SortedList;->addToData(ILjava/lang/Object;)V

    if-eqz p2, :cond_43

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v2, v0, v1}, Landroid/support/v7/util/SortedList$Callback;->onInserted(II)V

    :cond_43
    return v0
.end method

.method private addAllInternal([Ljava/lang/Object;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    instance-of v0, v0, Landroid/support/v7/util/SortedList$BatchedCallback;

    const/4 v1, 0x0

    if-nez v0, :cond_9

    const/4 v0, 0x1

    goto :goto_a

    :cond_9
    move v0, v1

    :goto_a
    if-eqz v0, :cond_f

    invoke-virtual {p0}, Landroid/support/v7/util/SortedList;->beginBatchedUpdates()V

    :cond_f
    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iput-object v2, p0, Landroid/support/v7/util/SortedList;->mOldData:[Ljava/lang/Object;

    iput v1, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    iget v2, p0, Landroid/support/v7/util/SortedList;->mSize:I

    iput v2, p0, Landroid/support/v7/util/SortedList;->mOldDataSize:I

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-static {p1, v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    invoke-direct {p0, p1}, Landroid/support/v7/util/SortedList;->deduplicate([Ljava/lang/Object;)I

    move-result v2

    iget v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    if-nez v3, :cond_32

    iput-object p1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iput v2, p0, Landroid/support/v7/util/SortedList;->mSize:I

    iput v2, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v1, v2}, Landroid/support/v7/util/SortedList$Callback;->onInserted(II)V

    goto :goto_35

    :cond_32
    invoke-direct {p0, p1, v2}, Landroid/support/v7/util/SortedList;->merge([Ljava/lang/Object;I)V

    :goto_35
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/v7/util/SortedList;->mOldData:[Ljava/lang/Object;

    if-eqz v0, :cond_3d

    invoke-virtual {p0}, Landroid/support/v7/util/SortedList;->endBatchedUpdates()V

    :cond_3d
    return-void
.end method

.method private addToData(ILjava/lang/Object;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    if-gt p1, v0, :cond_44

    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    array-length v1, v1

    if-ne v0, v1, :cond_2d

    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mTClass:Ljava/lang/Class;

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    array-length v1, v1

    add-int/lit8 v1, v1, 0xa

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {v1, v2, v0, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    aput-object p2, v0, p1

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    add-int/lit8 v2, p1, 0x1

    iget v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    sub-int/2addr v3, p1

    invoke-static {v1, p1, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    goto :goto_3d

    :cond_2d
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    add-int/lit8 v2, p1, 0x1

    iget v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    sub-int/2addr v3, p1

    invoke-static {v0, p1, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aput-object p2, v0, p1

    :goto_3d
    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    return-void

    :cond_44
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cannot add item to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " because size is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Landroid/support/v7/util/SortedList;->mSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private deduplicate([Ljava/lang/Object;)I
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)I"
        }
    .end annotation

    array-length v0, p1

    if-eqz v0, :cond_3c

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x1

    :goto_6
    array-length v3, p1

    if-ge v2, v3, :cond_3b

    aget-object v3, p1, v2

    iget-object v4, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    aget-object v5, p1, v0

    invoke-virtual {v4, v5, v3}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v4

    if-gtz v4, :cond_33

    if-nez v4, :cond_28

    invoke-direct {p0, v3, p1, v0, v1}, Landroid/support/v7/util/SortedList;->findSameItem(Ljava/lang/Object;[Ljava/lang/Object;II)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_21

    aput-object v3, p1, v5

    goto :goto_27

    :cond_21
    if-eq v1, v2, :cond_25

    aput-object v3, p1, v1

    :cond_25
    add-int/lit8 v1, v1, 0x1

    :goto_27
    goto :goto_30

    :cond_28
    if-eq v1, v2, :cond_2c

    aput-object v3, p1, v1

    :cond_2c
    add-int/lit8 v5, v1, 0x1

    move v0, v1

    move v1, v5

    :goto_30
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_33
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Input must be sorted in ascending order."

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_3b
    return v1

    :cond_3c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Input array must be non-empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private findIndexOf(Ljava/lang/Object;[Ljava/lang/Object;III)I
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[TT;III)I"
        }
    .end annotation

    :goto_0
    const/4 v0, -0x1

    const/4 v1, 0x1

    if-ge p3, p4, :cond_2f

    add-int v2, p3, p4

    div-int/lit8 v2, v2, 0x2

    aget-object v3, p2, v2

    iget-object v4, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v4, v3, p1}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v4

    if-gez v4, :cond_15

    add-int/lit8 p3, v2, 0x1

    goto :goto_2e

    :cond_15
    if-nez v4, :cond_2d

    iget-object v5, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v5, v3, p1}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_20

    return v2

    :cond_20
    invoke-direct {p0, p1, v2, p3, p4}, Landroid/support/v7/util/SortedList;->linearEqualitySearch(Ljava/lang/Object;III)I

    move-result v5

    if-ne p5, v1, :cond_2c

    if-ne v5, v0, :cond_2a

    move v0, v2

    goto :goto_2b

    :cond_2a
    move v0, v5

    :goto_2b
    return v0

    :cond_2c
    return v5

    :cond_2d
    move p4, v2

    :goto_2e
    goto :goto_0

    :cond_2f
    if-ne p5, v1, :cond_33

    move v0, p3

    nop

    :cond_33
    return v0
.end method

.method private findSameItem(Ljava/lang/Object;[Ljava/lang/Object;II)I
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[TT;II)I"
        }
    .end annotation

    move v0, p3

    :goto_1
    if-ge v0, p4, :cond_11

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    aget-object v2, p2, v0

    invoke-virtual {v1, v2, p1}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e

    return v0

    :cond_e
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_11
    const/4 v0, -0x1

    return v0
.end method

.method private linearEqualitySearch(Ljava/lang/Object;III)I
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;III)I"
        }
    .end annotation

    add-int/lit8 v0, p2, -0x1

    :goto_2
    if-lt v0, p3, :cond_1d

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aget-object v1, v1, v0

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v2, v1, p1}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-eqz v2, :cond_11

    goto :goto_1d

    :cond_11
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v1, p1}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    return v0

    :cond_1a
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    :cond_1d
    :goto_1d
    add-int/lit8 v0, p2, 0x1

    :goto_1f
    if-ge v0, p4, :cond_3a

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aget-object v1, v1, v0

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v2, v1, p1}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-eqz v2, :cond_2e

    goto :goto_3a

    :cond_2e
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v1, p1}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_37

    return v0

    :cond_37
    add-int/lit8 v0, v0, 0x1

    goto :goto_1f

    :cond_3a
    :goto_3a
    const/4 v0, -0x1

    return v0
.end method

.method private merge([Ljava/lang/Object;I)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;I)V"
        }
    .end annotation

    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    add-int/2addr v0, p2

    add-int/lit8 v0, v0, 0xa

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mTClass:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    iput-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    const/4 v1, 0x0

    iput v1, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    nop

    :goto_13
    iget v2, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    iget v3, p0, Landroid/support/v7/util/SortedList;->mOldDataSize:I

    if-lt v2, v3, :cond_1b

    if-ge v1, p2, :cond_55

    :cond_1b
    iget v2, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    iget v3, p0, Landroid/support/v7/util/SortedList;->mOldDataSize:I

    if-ne v2, v3, :cond_3d

    sub-int v2, p2, v1

    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v4, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    invoke-static {p1, v1, v3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v3, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    add-int/2addr v3, v2

    iput v3, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    iget v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    add-int/2addr v3, v2

    iput v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    iget v4, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    sub-int/2addr v4, v2

    invoke-virtual {v3, v4, v2}, Landroid/support/v7/util/SortedList$Callback;->onInserted(II)V

    goto :goto_55

    :cond_3d
    if-ne v1, p2, :cond_56

    iget v2, p0, Landroid/support/v7/util/SortedList;->mOldDataSize:I

    iget v3, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    sub-int/2addr v2, v3

    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mOldData:[Ljava/lang/Object;

    iget v4, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    iget-object v5, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v6, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    invoke-static {v3, v4, v5, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v3, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    add-int/2addr v3, v2

    iput v3, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    nop

    :cond_55
    :goto_55
    return-void

    :cond_56
    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mOldData:[Ljava/lang/Object;

    iget v3, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    aget-object v2, v2, v3

    aget-object v3, p1, v1

    iget-object v4, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v4, v2, v3}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v4

    const/4 v5, 0x1

    if-lez v4, :cond_81

    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v7, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    aput-object v3, v6, v7

    iget v6, p0, Landroid/support/v7/util/SortedList;->mSize:I

    add-int/2addr v6, v5

    iput v6, p0, Landroid/support/v7/util/SortedList;->mSize:I

    add-int/lit8 v1, v1, 0x1

    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    iget v7, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    sub-int/2addr v7, v5

    invoke-virtual {v6, v7, v5}, Landroid/support/v7/util/SortedList$Callback;->onInserted(II)V

    goto :goto_bc

    :cond_81
    if-nez v4, :cond_ad

    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v6, v2, v3}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_ad

    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v7, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    aput-object v3, v6, v7

    add-int/lit8 v1, v1, 0x1

    iget v6, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    add-int/2addr v6, v5

    iput v6, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v6, v2, v3}, Landroid/support/v7/util/SortedList$Callback;->areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_bc

    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    iget v7, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    sub-int/2addr v7, v5

    invoke-virtual {v6, v7, v5}, Landroid/support/v7/util/SortedList$Callback;->onChanged(II)V

    goto :goto_bc

    :cond_ad
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v7, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    aput-object v2, v6, v7

    iget v6, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    add-int/2addr v6, v5

    iput v6, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    :cond_bc
    :goto_bc
    goto/16 :goto_13
.end method

.method private remove(Ljava/lang/Object;Z)Z
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)Z"
        }
    .end annotation

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v4, p0, Landroid/support/v7/util/SortedList;->mSize:I

    const/4 v3, 0x0

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/util/SortedList;->findIndexOf(Ljava/lang/Object;[Ljava/lang/Object;III)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_11

    const/4 v1, 0x0

    return v1

    :cond_11
    invoke-direct {p0, v0, p2}, Landroid/support/v7/util/SortedList;->removeItemAtIndex(IZ)V

    const/4 v1, 0x1

    return v1
.end method

.method private removeItemAtIndex(IZ)V
    .registers 8

    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    add-int/lit8 v1, p1, 0x1

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    sub-int/2addr v3, p1

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    invoke-static {v0, v1, v2, p1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    sub-int/2addr v0, v4

    iput v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v1, p0, Landroid/support/v7/util/SortedList;->mSize:I

    const/4 v2, 0x0

    aput-object v2, v0, v1

    if-eqz p2, :cond_21

    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v0, p1, v4}, Landroid/support/v7/util/SortedList$Callback;->onRemoved(II)V

    :cond_21
    return-void
.end method

.method private throwIfMerging()V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mOldData:[Ljava/lang/Object;

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot call this method from within addAll"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public add(Ljava/lang/Object;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    invoke-direct {p0}, Landroid/support/v7/util/SortedList;->throwIfMerging()V

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Landroid/support/v7/util/SortedList;->add(Ljava/lang/Object;Z)I

    move-result v0

    return v0
.end method

.method public addAll(Ljava/util/Collection;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "TT;>;)V"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mTClass:Ljava/lang/Class;

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    invoke-interface {p1, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Landroid/support/v7/util/SortedList;->addAll([Ljava/lang/Object;Z)V

    return-void
.end method

.method public varargs addAll([Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/support/v7/util/SortedList;->addAll([Ljava/lang/Object;Z)V

    return-void
.end method

.method public addAll([Ljava/lang/Object;Z)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;Z)V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/support/v7/util/SortedList;->throwIfMerging()V

    array-length v0, p1

    if-nez v0, :cond_7

    return-void

    :cond_7
    if-eqz p2, :cond_d

    invoke-direct {p0, p1}, Landroid/support/v7/util/SortedList;->addAllInternal([Ljava/lang/Object;)V

    goto :goto_1e

    :cond_d
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mTClass:Ljava/lang/Class;

    array-length v1, p1

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    array-length v1, p1

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-direct {p0, v0}, Landroid/support/v7/util/SortedList;->addAllInternal([Ljava/lang/Object;)V

    :goto_1e
    return-void
.end method

.method public beginBatchedUpdates()V
    .registers 3

    invoke-direct {p0}, Landroid/support/v7/util/SortedList;->throwIfMerging()V

    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    instance-of v0, v0, Landroid/support/v7/util/SortedList$BatchedCallback;

    if-eqz v0, :cond_a

    return-void

    :cond_a
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    if-nez v0, :cond_17

    new-instance v0, Landroid/support/v7/util/SortedList$BatchedCallback;

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-direct {v0, v1}, Landroid/support/v7/util/SortedList$BatchedCallback;-><init>(Landroid/support/v7/util/SortedList$Callback;)V

    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    :cond_17
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    return-void
.end method

.method public clear()V
    .registers 5

    invoke-direct {p0}, Landroid/support/v7/util/SortedList;->throwIfMerging()V

    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    if-nez v0, :cond_8

    return-void

    :cond_8
    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v2}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    iput v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v1, v3, v0}, Landroid/support/v7/util/SortedList$Callback;->onRemoved(II)V

    return-void
.end method

.method public endBatchedUpdates()V
    .registers 3

    invoke-direct {p0}, Landroid/support/v7/util/SortedList;->throwIfMerging()V

    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    instance-of v0, v0, Landroid/support/v7/util/SortedList$BatchedCallback;

    if-eqz v0, :cond_10

    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    check-cast v0, Landroid/support/v7/util/SortedList$BatchedCallback;

    invoke-virtual {v0}, Landroid/support/v7/util/SortedList$BatchedCallback;->dispatchLastEvent()V

    :cond_10
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    if-ne v0, v1, :cond_1e

    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    # getter for: Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;
    invoke-static {v0}, Landroid/support/v7/util/SortedList$BatchedCallback;->access$000(Landroid/support/v7/util/SortedList$BatchedCallback;)Landroid/support/v7/util/SortedList$Callback;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    :cond_1e
    return-void
.end method

.method public get(I)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IndexOutOfBoundsException;
        }
    .end annotation

    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    if-ge p1, v0, :cond_1f

    if-ltz p1, :cond_1f

    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mOldData:[Ljava/lang/Object;

    if-eqz v0, :cond_1a

    iget v0, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    if-lt p1, v0, :cond_1a

    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mOldData:[Ljava/lang/Object;

    iget v1, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    sub-int v1, p1, v1

    iget v2, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    add-int/2addr v1, v2

    aget-object v0, v0, v1

    return-object v0

    :cond_1a
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aget-object v0, v0, p1

    return-object v0

    :cond_1f
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Asked to get item at "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " but size is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Landroid/support/v7/util/SortedList;->mSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mOldData:[Ljava/lang/Object;

    if-eqz v0, :cond_2c

    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    const/4 v6, 0x4

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, Landroid/support/v7/util/SortedList;->findIndexOf(Ljava/lang/Object;[Ljava/lang/Object;III)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_14

    return v0

    :cond_14
    iget-object v4, p0, Landroid/support/v7/util/SortedList;->mOldData:[Ljava/lang/Object;

    iget v5, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    iget v6, p0, Landroid/support/v7/util/SortedList;->mOldDataSize:I

    const/4 v7, 0x4

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v2 .. v7}, Landroid/support/v7/util/SortedList;->findIndexOf(Ljava/lang/Object;[Ljava/lang/Object;III)I

    move-result v0

    if-eq v0, v1, :cond_2b

    iget v1, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    sub-int v1, v0, v1

    iget v2, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    add-int/2addr v1, v2

    return v1

    :cond_2b
    return v1

    :cond_2c
    iget-object v4, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    const/4 v5, 0x0

    iget v6, p0, Landroid/support/v7/util/SortedList;->mSize:I

    const/4 v7, 0x4

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v2 .. v7}, Landroid/support/v7/util/SortedList;->findIndexOf(Ljava/lang/Object;[Ljava/lang/Object;III)I

    move-result v0

    return v0
.end method

.method public recalculatePositionOfItemAt(I)V
    .registers 5

    invoke-direct {p0}, Landroid/support/v7/util/SortedList;->throwIfMerging()V

    invoke-virtual {p0, p1}, Landroid/support/v7/util/SortedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1}, Landroid/support/v7/util/SortedList;->removeItemAtIndex(IZ)V

    invoke-direct {p0, v0, v1}, Landroid/support/v7/util/SortedList;->add(Ljava/lang/Object;Z)I

    move-result v1

    if-eq p1, v1, :cond_16

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v2, p1, v1}, Landroid/support/v7/util/SortedList$Callback;->onMoved(II)V

    :cond_16
    return-void
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    invoke-direct {p0}, Landroid/support/v7/util/SortedList;->throwIfMerging()V

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Landroid/support/v7/util/SortedList;->remove(Ljava/lang/Object;Z)Z

    move-result v0

    return v0
.end method

.method public removeItemAt(I)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    invoke-direct {p0}, Landroid/support/v7/util/SortedList;->throwIfMerging()V

    invoke-virtual {p0, p1}, Landroid/support/v7/util/SortedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v1}, Landroid/support/v7/util/SortedList;->removeItemAtIndex(IZ)V

    return-object v0
.end method

.method public size()I
    .registers 2

    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    return v0
.end method

.method public updateItemAt(ILjava/lang/Object;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/support/v7/util/SortedList;->throwIfMerging()V

    invoke-virtual {p0, p1}, Landroid/support/v7/util/SortedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq v0, p2, :cond_16

    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v0, p2}, Landroid/support/v7/util/SortedList$Callback;->areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_14

    goto :goto_16

    :cond_14
    move v3, v2

    goto :goto_17

    :cond_16
    :goto_16
    move v3, v1

    :goto_17
    if-eq v0, p2, :cond_2d

    iget-object v4, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v4, v0, p2}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v4

    if-nez v4, :cond_2d

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aput-object p2, v2, p1

    if-eqz v3, :cond_2c

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v2, p1, v1}, Landroid/support/v7/util/SortedList$Callback;->onChanged(II)V

    :cond_2c
    return-void

    :cond_2d
    if-eqz v3, :cond_34

    iget-object v4, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v4, p1, v1}, Landroid/support/v7/util/SortedList$Callback;->onChanged(II)V

    :cond_34
    invoke-direct {p0, p1, v2}, Landroid/support/v7/util/SortedList;->removeItemAtIndex(IZ)V

    invoke-direct {p0, p2, v2}, Landroid/support/v7/util/SortedList;->add(Ljava/lang/Object;Z)I

    move-result v1

    if-eq p1, v1, :cond_42

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v2, p1, v1}, Landroid/support/v7/util/SortedList$Callback;->onMoved(II)V

    :cond_42
    return-void
.end method
