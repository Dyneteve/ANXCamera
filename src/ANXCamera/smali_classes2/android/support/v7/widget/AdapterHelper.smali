.class Landroid/support/v7/widget/AdapterHelper;
.super Ljava/lang/Object;
.source "AdapterHelper.java"

# interfaces
.implements Landroid/support/v7/widget/OpReorderer$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/AdapterHelper$Callback;,
        Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field static final POSITION_TYPE_INVISIBLE:I = 0x0

.field static final POSITION_TYPE_NEW_OR_LAID_OUT:I = 0x1

.field private static final TAG:Ljava/lang/String; = "AHT"


# instance fields
.field final mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

.field final mDisableRecycler:Z

.field mOnItemProcessedCallback:Ljava/lang/Runnable;

.field final mOpReorderer:Landroid/support/v7/widget/OpReorderer;

.field final mPendingUpdates:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ">;"
        }
    .end annotation
.end field

.field final mPostponedList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ">;"
        }
    .end annotation
.end field

.field private mUpdateOpPool:Landroid/support/v4/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/Pools$Pool<",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/support/v7/widget/AdapterHelper$Callback;)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/AdapterHelper;-><init>(Landroid/support/v7/widget/AdapterHelper$Callback;Z)V

    return-void
.end method

.method constructor <init>(Landroid/support/v7/widget/AdapterHelper$Callback;Z)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/support/v4/util/Pools$SimplePool;

    const/16 v1, 0x1e

    invoke-direct {v0, v1}, Landroid/support/v4/util/Pools$SimplePool;-><init>(I)V

    iput-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mUpdateOpPool:Landroid/support/v4/util/Pools$Pool;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    iput-object p1, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iput-boolean p2, p0, Landroid/support/v7/widget/AdapterHelper;->mDisableRecycler:Z

    new-instance v0, Landroid/support/v7/widget/OpReorderer;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/OpReorderer;-><init>(Landroid/support/v7/widget/OpReorderer$Callback;)V

    iput-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mOpReorderer:Landroid/support/v7/widget/OpReorderer;

    return-void
.end method

.method private applyAdd(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 2

    invoke-direct {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    return-void
.end method

.method private applyMove(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 2

    invoke-direct {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    return-void
.end method

.method private applyRemove(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 12

    iget v0, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    const/4 v1, 0x0

    iget v2, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v3, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr v2, v3

    const/4 v3, -0x1

    iget v4, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    :goto_b
    const/4 v5, 0x0

    const/4 v6, 0x1

    if-ge v4, v2, :cond_40

    const/4 v7, 0x0

    iget-object v8, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v8, v4}, Landroid/support/v7/widget/AdapterHelper$Callback;->findViewHolder(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v8

    if-nez v8, :cond_2b

    invoke-direct {p0, v4}, Landroid/support/v7/widget/AdapterHelper;->canFindInPreLayout(I)Z

    move-result v9

    if-eqz v9, :cond_1f

    goto :goto_2b

    :cond_1f
    if-ne v3, v6, :cond_29

    invoke-virtual {p0, v6, v0, v1, v5}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v5

    invoke-direct {p0, v5}, Landroid/support/v7/widget/AdapterHelper;->postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    const/4 v7, 0x1

    :cond_29
    const/4 v3, 0x0

    goto :goto_36

    :cond_2b
    :goto_2b
    if-nez v3, :cond_35

    invoke-virtual {p0, v6, v0, v1, v5}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v5

    invoke-direct {p0, v5}, Landroid/support/v7/widget/AdapterHelper;->dispatchAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    const/4 v7, 0x1

    :cond_35
    const/4 v3, 0x1

    :goto_36
    if-eqz v7, :cond_3c

    sub-int/2addr v4, v1

    sub-int/2addr v2, v1

    const/4 v1, 0x1

    goto :goto_3e

    :cond_3c
    add-int/lit8 v1, v1, 0x1

    :goto_3e
    add-int/2addr v4, v6

    goto :goto_b

    :cond_40
    iget v4, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-eq v1, v4, :cond_4b

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    invoke-virtual {p0, v6, v0, v1, v5}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object p1

    :cond_4b
    if-nez v3, :cond_51

    invoke-direct {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->dispatchAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_54

    :cond_51
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    :goto_54
    return-void
.end method

.method private applyUpdate(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 11

    iget v0, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    const/4 v1, 0x0

    iget v2, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v3, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr v2, v3

    const/4 v3, -0x1

    iget v4, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    :goto_b
    const/4 v5, 0x2

    if-ge v4, v2, :cond_3f

    iget-object v6, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v6, v4}, Landroid/support/v7/widget/AdapterHelper$Callback;->findViewHolder(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v6

    const/4 v7, 0x1

    if-nez v6, :cond_2d

    invoke-direct {p0, v4}, Landroid/support/v7/widget/AdapterHelper;->canFindInPreLayout(I)Z

    move-result v8

    if-eqz v8, :cond_1e

    goto :goto_2d

    :cond_1e
    if-ne v3, v7, :cond_2b

    iget-object v8, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    invoke-virtual {p0, v5, v0, v1, v8}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v5

    invoke-direct {p0, v5}, Landroid/support/v7/widget/AdapterHelper;->postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    const/4 v1, 0x0

    move v0, v4

    :cond_2b
    const/4 v3, 0x0

    goto :goto_3b

    :cond_2d
    :goto_2d
    if-nez v3, :cond_3a

    iget-object v8, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    invoke-virtual {p0, v5, v0, v1, v8}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v5

    invoke-direct {p0, v5}, Landroid/support/v7/widget/AdapterHelper;->dispatchAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    const/4 v1, 0x0

    move v0, v4

    :cond_3a
    const/4 v3, 0x1

    :goto_3b
    add-int/2addr v1, v7

    add-int/lit8 v4, v4, 0x1

    goto :goto_b

    :cond_3f
    iget v4, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-eq v1, v4, :cond_4c

    iget-object v4, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    invoke-virtual {p0, v5, v0, v1, v4}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object p1

    :cond_4c
    if-nez v3, :cond_52

    invoke-direct {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->dispatchAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_55

    :cond_52
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    :goto_55
    return-void
.end method

.method private canFindInPreLayout(I)Z
    .registers 10

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_8
    if-ge v2, v0, :cond_3f

    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    iget v4, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v5, 0x3

    const/4 v6, 0x1

    if-ne v4, v5, :cond_23

    iget v4, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/lit8 v5, v2, 0x1

    invoke-virtual {p0, v4, v5}, Landroid/support/v7/widget/AdapterHelper;->findPositionOffset(II)I

    move-result v4

    if-ne v4, p1, :cond_3c

    return v6

    :cond_23
    iget v4, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-nez v4, :cond_3c

    iget v4, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr v4, v5

    iget v5, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    :goto_2e
    if-ge v5, v4, :cond_3c

    add-int/lit8 v7, v2, 0x1

    invoke-virtual {p0, v5, v7}, Landroid/support/v7/widget/AdapterHelper;->findPositionOffset(II)I

    move-result v7

    if-ne v7, p1, :cond_39

    return v6

    :cond_39
    add-int/lit8 v5, v5, 0x1

    goto :goto_2e

    :cond_3c
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_3f
    return v1
.end method

.method private dispatchAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 14

    iget v0, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-eqz v0, :cond_8e

    iget v0, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_8e

    iget v0, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    invoke-direct {p0, v0, v1}, Landroid/support/v7/widget/AdapterHelper;->updatePositionWithPostponed(II)I

    move-result v0

    const/4 v1, 0x1

    iget v2, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v3, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v3, :pswitch_data_96

    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "op should be remove or update."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :pswitch_30
    const/4 v3, 0x1

    goto :goto_34

    :pswitch_32
    const/4 v3, 0x0

    nop

    :goto_34
    const/4 v4, 0x1

    move v5, v2

    move v2, v0

    move v0, v4

    :goto_38
    iget v6, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-ge v0, v6, :cond_7a

    iget v6, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    mul-int v7, v3, v0

    add-int/2addr v6, v7

    iget v7, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    invoke-direct {p0, v6, v7}, Landroid/support/v7/widget/AdapterHelper;->updatePositionWithPostponed(II)I

    move-result v7

    const/4 v8, 0x0

    iget v9, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v10, 0x0

    packed-switch v9, :pswitch_data_9e

    goto :goto_5c

    :pswitch_4f
    add-int/lit8 v9, v2, 0x1

    if-ne v7, v9, :cond_55

    move v10, v4

    nop

    :cond_55
    move v8, v10

    goto :goto_5c

    :pswitch_57
    if-ne v7, v2, :cond_5b

    move v10, v4

    nop

    :cond_5b
    move v8, v10

    :goto_5c
    if-eqz v8, :cond_61

    add-int/lit8 v1, v1, 0x1

    goto :goto_77

    :cond_61
    iget v9, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    iget-object v10, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    invoke-virtual {p0, v9, v2, v1, v10}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v9

    invoke-virtual {p0, v9, v5}, Landroid/support/v7/widget/AdapterHelper;->dispatchFirstPassAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;I)V

    invoke-virtual {p0, v9}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    iget v10, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v11, 0x2

    if-ne v10, v11, :cond_75

    add-int/2addr v5, v1

    :cond_75
    move v2, v7

    const/4 v1, 0x1

    :goto_77
    add-int/lit8 v0, v0, 0x1

    goto :goto_38

    :cond_7a
    iget-object v0, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    if-lez v1, :cond_8d

    iget v4, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    invoke-virtual {p0, v4, v2, v1, v0}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v4

    invoke-virtual {p0, v4, v5}, Landroid/support/v7/widget/AdapterHelper;->dispatchFirstPassAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;I)V

    invoke-virtual {p0, v4}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    :cond_8d
    return-void

    :cond_8e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "should not dispatch add or move for pre layout"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_data_96
    .packed-switch 0x1
        :pswitch_32
        :pswitch_30
    .end packed-switch

    :pswitch_data_9e
    .packed-switch 0x1
        :pswitch_57
        :pswitch_4f
    .end packed-switch
.end method

.method private postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 6

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget v0, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v0, :pswitch_data_4c

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown update op type for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_21
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v2, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v0, v1, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForMove(II)V

    goto :goto_4b

    :pswitch_2b
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v2, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget-object v3, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    invoke-interface {v0, v1, v2, v3}, Landroid/support/v7/widget/AdapterHelper$Callback;->markViewHoldersUpdated(IILjava/lang/Object;)V

    goto :goto_4b

    :pswitch_37
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v2, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v0, v1, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForRemovingLaidOutOrNewView(II)V

    goto :goto_4b

    :pswitch_41
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v2, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v0, v1, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForAdd(II)V

    nop

    :goto_4b
    return-void

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_41
        :pswitch_37
        :pswitch_2b
        :pswitch_21
    .end packed-switch
.end method

.method private updatePositionWithPostponed(II)I
    .registers 10

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    :goto_8
    const/4 v2, 0x3

    const/4 v3, 0x1

    if-ltz v1, :cond_98

    iget-object v4, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    iget v5, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-ne v5, v2, :cond_71

    iget v2, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-ge v2, v5, :cond_23

    iget v2, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto :goto_27

    :cond_23
    iget v2, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v5, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    :goto_27
    if-lt p1, v2, :cond_53

    if-gt p1, v5, :cond_53

    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ne v2, v6, :cond_41

    if-nez p2, :cond_37

    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr v6, v3

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto :goto_3e

    :cond_37
    if-ne p2, v3, :cond_3e

    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr v6, v3

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    :cond_3e
    :goto_3e
    add-int/lit8 p1, p1, 0x1

    goto :goto_70

    :cond_41
    if-nez p2, :cond_49

    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/2addr v6, v3

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    goto :goto_50

    :cond_49
    if-ne p2, v3, :cond_50

    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    sub-int/2addr v6, v3

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    :cond_50
    :goto_50
    add-int/lit8 p1, p1, -0x1

    goto :goto_70

    :cond_53
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ge p1, v6, :cond_70

    if-nez p2, :cond_64

    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/2addr v6, v3

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr v6, v3

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto :goto_70

    :cond_64
    if-ne p2, v3, :cond_70

    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    sub-int/2addr v6, v3

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr v6, v3

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    :cond_70
    :goto_70
    goto :goto_94

    :cond_71
    iget v2, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-gt v2, p1, :cond_85

    iget v2, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-nez v2, :cond_7d

    iget v2, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr p1, v2

    goto :goto_94

    :cond_7d
    iget v2, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-ne v2, v3, :cond_94

    iget v2, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr p1, v2

    goto :goto_94

    :cond_85
    if-nez p2, :cond_8d

    iget v2, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/2addr v2, v3

    iput v2, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    goto :goto_94

    :cond_8d
    if-ne p2, v3, :cond_94

    iget v2, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    sub-int/2addr v2, v3

    iput v2, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    :cond_94
    :goto_94
    add-int/lit8 v1, v1, -0x1

    goto/16 :goto_8

    :cond_98
    iget-object v1, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v3

    :goto_9f
    if-ltz v1, :cond_cf

    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    iget v4, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-ne v4, v2, :cond_c0

    iget v4, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v5, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-eq v4, v5, :cond_b7

    iget v4, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-gez v4, :cond_cc

    :cond_b7
    iget-object v4, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_cc

    :cond_c0
    iget v4, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-gtz v4, :cond_cc

    iget-object v4, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    :cond_cc
    :goto_cc
    add-int/lit8 v1, v1, -0x1

    goto :goto_9f

    :cond_cf
    return p1
.end method


# virtual methods
.method varargs addUpdateOp([Landroid/support/v7/widget/AdapterHelper$UpdateOp;)Landroid/support/v7/widget/AdapterHelper;
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    return-object p0
.end method

.method public applyPendingUpdatesToPosition(I)I
    .registers 7

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_49

    iget-object v2, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v4, 0x3

    if-eq v3, v4, :cond_33

    packed-switch v3, :pswitch_data_4a

    goto :goto_46

    :pswitch_1a
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-gt v3, p1, :cond_46

    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr v3, v4

    if-le v3, p1, :cond_27

    const/4 v4, -0x1

    return v4

    :cond_27
    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr p1, v4

    goto :goto_46

    :pswitch_2b
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-gt v3, p1, :cond_46

    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr p1, v3

    goto :goto_46

    :cond_33
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ne v3, p1, :cond_3a

    iget p1, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto :goto_46

    :cond_3a
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ge v3, p1, :cond_40

    add-int/lit8 p1, p1, -0x1

    :cond_40
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-gt v3, p1, :cond_46

    add-int/lit8 p1, p1, 0x1

    :cond_46
    :goto_46
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_49
    return p1

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_2b
        :pswitch_1a
    .end packed-switch
.end method

.method consumePostponedUpdates()V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_19

    iget-object v2, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    invoke-interface {v2, v3}, Landroid/support/v7/widget/AdapterHelper$Callback;->onDispatchSecondPass(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_19
    iget-object v1, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOpsAndClearList(Ljava/util/List;)V

    return-void
.end method

.method consumeUpdatesInOnePass()V
    .registers 8

    invoke-virtual {p0}, Landroid/support/v7/widget/AdapterHelper;->consumePostponedUpdates()V

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_a
    if-ge v1, v0, :cond_64

    iget-object v2, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v3, :pswitch_data_6a

    goto :goto_58

    :pswitch_1a
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v3, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->onDispatchSecondPass(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v3, v4, v5}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForMove(II)V

    goto :goto_58

    :pswitch_29
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v3, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->onDispatchSecondPass(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget-object v6, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    invoke-interface {v3, v4, v5, v6}, Landroid/support/v7/widget/AdapterHelper$Callback;->markViewHoldersUpdated(IILjava/lang/Object;)V

    goto :goto_58

    :pswitch_3a
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v3, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->onDispatchSecondPass(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v3, v4, v5}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForRemovingInvisible(II)V

    goto :goto_58

    :pswitch_49
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v3, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->onDispatchSecondPass(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v3, v4, v5}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForAdd(II)V

    nop

    :goto_58
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mOnItemProcessedCallback:Ljava/lang/Runnable;

    if-eqz v3, :cond_61

    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mOnItemProcessedCallback:Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    :cond_61
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_64
    iget-object v1, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOpsAndClearList(Ljava/util/List;)V

    return-void

    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_49
        :pswitch_3a
        :pswitch_29
        :pswitch_1a
    .end packed-switch
.end method

.method dispatchFirstPassAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;I)V
    .registers 6

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v0, p1}, Landroid/support/v7/widget/AdapterHelper$Callback;->onDispatchFirstPass(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    iget v0, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v0, :pswitch_data_26

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "only remove and update ops can be dispatched in first pass"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_12
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget-object v2, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    invoke-interface {v0, p2, v1, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->markViewHoldersUpdated(IILjava/lang/Object;)V

    goto :goto_24

    :pswitch_1c
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v0, p2, v1}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForRemovingInvisible(II)V

    nop

    :goto_24
    return-void

    nop

    :pswitch_data_26
    .packed-switch 0x1
        :pswitch_1c
        :pswitch_12
    .end packed-switch
.end method

.method findPositionOffset(I)I
    .registers 3

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/support/v7/widget/AdapterHelper;->findPositionOffset(II)I

    move-result v0

    return v0
.end method

.method findPositionOffset(II)I
    .registers 8

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v1, p1

    move p1, p2

    :goto_8
    if-ge p1, v0, :cond_4b

    iget-object v2, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_2b

    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ne v3, v1, :cond_1e

    iget v1, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto :goto_48

    :cond_1e
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ge v3, v1, :cond_24

    add-int/lit8 v1, v1, -0x1

    :cond_24
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-gt v3, v1, :cond_48

    add-int/lit8 v1, v1, 0x1

    goto :goto_48

    :cond_2b
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-gt v3, v1, :cond_48

    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_41

    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr v3, v4

    if-ge v1, v3, :cond_3d

    const/4 v3, -0x1

    return v3

    :cond_3d
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr v1, v3

    goto :goto_48

    :cond_41
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-nez v3, :cond_48

    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr v1, v3

    :cond_48
    :goto_48
    add-int/lit8 p1, p1, 0x1

    goto :goto_8

    :cond_4b
    return v1
.end method

.method hasPendingUpdates()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0
.end method

.method public obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .registers 7

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mUpdateOpPool:Landroid/support/v4/util/Pools$Pool;

    invoke-interface {v0}, Landroid/support/v4/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    if-nez v0, :cond_11

    new-instance v1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    invoke-direct {v1, p1, p2, p3, p4}, Landroid/support/v7/widget/AdapterHelper$UpdateOp;-><init>(IIILjava/lang/Object;)V

    move-object v0, v1

    goto :goto_19

    :cond_11
    iput p1, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    iput p2, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iput p3, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iput-object p4, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    :goto_19
    return-object v0
.end method

.method onItemRangeChanged(IILjava/lang/Object;)Z
    .registers 6

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-virtual {p0, v1, p1, p2, p3}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_14

    goto :goto_15

    :cond_14
    const/4 v1, 0x0

    :goto_15
    return v1
.end method

.method onItemRangeInserted(II)Z
    .registers 6

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v1, p1, p2, v2}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_16

    move v1, v2

    nop

    :cond_16
    return v1
.end method

.method onItemRangeMoved(III)Z
    .registers 9

    const/4 v0, 0x0

    if-ne p1, p2, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x1

    if-ne p3, v1, :cond_1d

    iget-object v2, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    const/4 v3, 0x3

    const/4 v4, 0x0

    invoke-virtual {p0, v3, p1, p2, v4}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v2, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ne v2, v1, :cond_1c

    move v0, v1

    nop

    :cond_1c
    return v0

    :cond_1d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Moving more than 1 item is not supported yet"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method onItemRangeRemoved(II)Z
    .registers 6

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, p1, p2, v2}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne v0, v1, :cond_14

    goto :goto_15

    :cond_14
    const/4 v1, 0x0

    :goto_15
    return v1
.end method

.method preProcess()V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mOpReorderer:Landroid/support/v7/widget/OpReorderer;

    iget-object v1, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/OpReorderer;->reorderOps(Ljava/util/List;)V

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_e
    if-ge v1, v0, :cond_3a

    iget-object v2, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v3, :pswitch_data_40

    goto :goto_2e

    :pswitch_1e
    invoke-direct {p0, v2}, Landroid/support/v7/widget/AdapterHelper;->applyMove(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_2e

    :pswitch_22
    invoke-direct {p0, v2}, Landroid/support/v7/widget/AdapterHelper;->applyUpdate(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_2e

    :pswitch_26
    invoke-direct {p0, v2}, Landroid/support/v7/widget/AdapterHelper;->applyRemove(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_2e

    :pswitch_2a
    invoke-direct {p0, v2}, Landroid/support/v7/widget/AdapterHelper;->applyAdd(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    nop

    :goto_2e
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mOnItemProcessedCallback:Ljava/lang/Runnable;

    if-eqz v3, :cond_37

    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mOnItemProcessedCallback:Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    :cond_37
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    :cond_3a
    iget-object v1, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    return-void

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_2a
        :pswitch_26
        :pswitch_22
        :pswitch_1e
    .end packed-switch
.end method

.method public recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 3

    iget-boolean v0, p0, Landroid/support/v7/widget/AdapterHelper;->mDisableRecycler:Z

    if-nez v0, :cond_c

    const/4 v0, 0x0

    iput-object v0, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mUpdateOpPool:Landroid/support/v4/util/Pools$Pool;

    invoke-interface {v0, p1}, Landroid/support/v4/util/Pools$Pool;->release(Ljava/lang/Object;)Z

    :cond_c
    return-void
.end method

.method recycleUpdateOpsAndClearList(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_13

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_13
    invoke-interface {p1}, Ljava/util/List;->clear()V

    return-void
.end method

.method reset()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOpsAndClearList(Ljava/util/List;)V

    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOpsAndClearList(Ljava/util/List;)V

    return-void
.end method
