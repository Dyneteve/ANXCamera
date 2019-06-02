.class public Landroid/support/v7/util/SortedList$BatchedCallback;
.super Landroid/support/v7/util/SortedList$Callback;
.source "SortedList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/util/SortedList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BatchedCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T2:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/support/v7/util/SortedList$Callback<",
        "TT2;>;"
    }
.end annotation


# static fields
.field static final TYPE_ADD:I = 0x1

.field static final TYPE_CHANGE:I = 0x3

.field static final TYPE_MOVE:I = 0x4

.field static final TYPE_NONE:I = 0x0

.field static final TYPE_REMOVE:I = 0x2


# instance fields
.field mLastEventCount:I

.field mLastEventPosition:I

.field mLastEventType:I

.field private final mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v7/util/SortedList$Callback<",
            "TT2;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/support/v7/util/SortedList$Callback;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/util/SortedList$Callback<",
            "TT2;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/support/v7/util/SortedList$Callback;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iput v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    iput-object p1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    return-void
.end method

.method static synthetic access$000(Landroid/support/v7/util/SortedList$BatchedCallback;)Landroid/support/v7/util/SortedList$Callback;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    return-object v0
.end method


# virtual methods
.method public areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT2;TT2;)Z"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/util/SortedList$Callback;->areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT2;TT2;)Z"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT2;TT2;)I"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public dispatchLastEvent()V
    .registers 4

    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    packed-switch v0, :pswitch_data_2e

    goto :goto_29

    :pswitch_b
    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    iget v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/util/SortedList$Callback;->onChanged(II)V

    goto :goto_29

    :pswitch_15
    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    iget v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/util/SortedList$Callback;->onRemoved(II)V

    goto :goto_29

    :pswitch_1f
    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    iget v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/util/SortedList$Callback;->onInserted(II)V

    nop

    :goto_29
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    return-void

    nop

    :pswitch_data_2e
    .packed-switch 0x1
        :pswitch_1f
        :pswitch_15
        :pswitch_b
    .end packed-switch
.end method

.method public onChanged(II)V
    .registers 6

    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2b

    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    add-int/2addr v0, v2

    if-gt p1, v0, :cond_2b

    add-int v0, p1, p2

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    if-lt v0, v2, :cond_2b

    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iget v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    add-int/2addr v0, v1

    iget v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    add-int v1, p1, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    sub-int/2addr v1, v2

    iput v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    return-void

    :cond_2b
    invoke-virtual {p0}, Landroid/support/v7/util/SortedList$BatchedCallback;->dispatchLastEvent()V

    iput p1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iput p2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    iput v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    return-void
.end method

.method public onInserted(II)V
    .registers 6

    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1e

    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    if-lt p1, v0, :cond_1e

    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    add-int/2addr v0, v2

    if-gt p1, v0, :cond_1e

    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    add-int/2addr v0, p2

    iput v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    return-void

    :cond_1e
    invoke-virtual {p0}, Landroid/support/v7/util/SortedList$BatchedCallback;->dispatchLastEvent()V

    iput p1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iput p2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    iput v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    return-void
.end method

.method public onMoved(II)V
    .registers 4

    invoke-virtual {p0}, Landroid/support/v7/util/SortedList$BatchedCallback;->dispatchLastEvent()V

    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/util/SortedList$Callback;->onMoved(II)V

    return-void
.end method

.method public onRemoved(II)V
    .registers 5

    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_f

    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    if-ne v0, p1, :cond_f

    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    add-int/2addr v0, p2

    iput v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    return-void

    :cond_f
    invoke-virtual {p0}, Landroid/support/v7/util/SortedList$BatchedCallback;->dispatchLastEvent()V

    iput p1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iput p2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    iput v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    return-void
.end method
