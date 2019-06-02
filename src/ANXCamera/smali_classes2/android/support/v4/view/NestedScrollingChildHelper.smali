.class public Landroid/support/v4/view/NestedScrollingChildHelper;
.super Ljava/lang/Object;
.source "NestedScrollingChildHelper.java"


# instance fields
.field private mIsNestedScrollingEnabled:Z

.field private mNestedScrollingParent:Landroid/view/ViewParent;

.field private mTempNestedScrollConsumed:[I

.field private final mView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public dispatchNestedFling(FFZ)Z
    .registers 6

    invoke-virtual {p0}, Landroid/support/v4/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v0

    if-eqz v0, :cond_13

    iget-object v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mNestedScrollingParent:Landroid/view/ViewParent;

    if-eqz v0, :cond_13

    iget-object v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mNestedScrollingParent:Landroid/view/ViewParent;

    iget-object v1, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v1, p1, p2, p3}, Landroid/support/v4/view/ViewParentCompat;->onNestedFling(Landroid/view/ViewParent;Landroid/view/View;FFZ)Z

    move-result v0

    return v0

    :cond_13
    const/4 v0, 0x0

    return v0
.end method

.method public dispatchNestedPreFling(FF)Z
    .registers 5

    invoke-virtual {p0}, Landroid/support/v4/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v0

    if-eqz v0, :cond_13

    iget-object v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mNestedScrollingParent:Landroid/view/ViewParent;

    if-eqz v0, :cond_13

    iget-object v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mNestedScrollingParent:Landroid/view/ViewParent;

    iget-object v1, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v1, p1, p2}, Landroid/support/v4/view/ViewParentCompat;->onNestedPreFling(Landroid/view/ViewParent;Landroid/view/View;FF)Z

    move-result v0

    return v0

    :cond_13
    const/4 v0, 0x0

    return v0
.end method

.method public dispatchNestedPreScroll(II[I[I)Z
    .registers 11

    invoke-virtual {p0}, Landroid/support/v4/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_5a

    iget-object v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mNestedScrollingParent:Landroid/view/ViewParent;

    if-eqz v0, :cond_5a

    const/4 v0, 0x1

    if-nez p1, :cond_18

    if-eqz p2, :cond_11

    goto :goto_18

    :cond_11
    if-eqz p4, :cond_5a

    aput v1, p4, v1

    aput v1, p4, v0

    goto :goto_5a

    :cond_18
    :goto_18
    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz p4, :cond_25

    iget-object v4, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {v4, p4}, Landroid/view/View;->getLocationInWindow([I)V

    aget v2, p4, v1

    aget v3, p4, v0

    :cond_25
    if-nez p3, :cond_32

    iget-object v4, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mTempNestedScrollConsumed:[I

    if-nez v4, :cond_30

    const/4 v4, 0x2

    new-array v4, v4, [I

    iput-object v4, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mTempNestedScrollConsumed:[I

    :cond_30
    iget-object p3, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mTempNestedScrollConsumed:[I

    :cond_32
    aput v1, p3, v1

    aput v1, p3, v0

    iget-object v4, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mNestedScrollingParent:Landroid/view/ViewParent;

    iget-object v5, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v4, v5, p1, p2, p3}, Landroid/support/v4/view/ViewParentCompat;->onNestedPreScroll(Landroid/view/ViewParent;Landroid/view/View;II[I)V

    if-eqz p4, :cond_4e

    iget-object v4, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {v4, p4}, Landroid/view/View;->getLocationInWindow([I)V

    aget v4, p4, v1

    sub-int/2addr v4, v2

    aput v4, p4, v1

    aget v4, p4, v0

    sub-int/2addr v4, v3

    aput v4, p4, v0

    :cond_4e
    aget v4, p3, v1

    if-nez v4, :cond_59

    aget v4, p3, v0

    if-eqz v4, :cond_57

    goto :goto_59

    :cond_57
    move v0, v1

    nop

    :cond_59
    :goto_59
    return v0

    :cond_5a
    :goto_5a
    return v1
.end method

.method public dispatchNestedScroll(IIII[I)Z
    .registers 16

    invoke-virtual {p0}, Landroid/support/v4/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_46

    iget-object v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mNestedScrollingParent:Landroid/view/ViewParent;

    if-eqz v0, :cond_46

    const/4 v0, 0x1

    if-nez p1, :cond_1c

    if-nez p2, :cond_1c

    if-nez p3, :cond_1c

    if-eqz p4, :cond_15

    goto :goto_1c

    :cond_15
    if-eqz p5, :cond_46

    aput v1, p5, v1

    aput v1, p5, v0

    goto :goto_46

    :cond_1c
    :goto_1c
    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz p5, :cond_29

    iget-object v4, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {v4, p5}, Landroid/view/View;->getLocationInWindow([I)V

    aget v2, p5, v1

    aget v3, p5, v0

    :cond_29
    iget-object v4, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mNestedScrollingParent:Landroid/view/ViewParent;

    iget-object v5, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    move v6, p1

    move v7, p2

    move v8, p3

    move v9, p4

    invoke-static/range {v4 .. v9}, Landroid/support/v4/view/ViewParentCompat;->onNestedScroll(Landroid/view/ViewParent;Landroid/view/View;IIII)V

    if-eqz p5, :cond_45

    iget-object v4, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {v4, p5}, Landroid/view/View;->getLocationInWindow([I)V

    aget v4, p5, v1

    sub-int/2addr v4, v2

    aput v4, p5, v1

    aget v1, p5, v0

    sub-int/2addr v1, v3

    aput v1, p5, v0

    :cond_45
    return v0

    :cond_46
    :goto_46
    return v1
.end method

.method public hasNestedScrollingParent()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mNestedScrollingParent:Landroid/view/ViewParent;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public isNestedScrollingEnabled()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mIsNestedScrollingEnabled:Z

    return v0
.end method

.method public onDetachedFromWindow()V
    .registers 2

    iget-object v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->stopNestedScroll(Landroid/view/View;)V

    return-void
.end method

.method public onStopNestedScroll(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->stopNestedScroll(Landroid/view/View;)V

    return-void
.end method

.method public setNestedScrollingEnabled(Z)V
    .registers 3

    iget-boolean v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mIsNestedScrollingEnabled:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->stopNestedScroll(Landroid/view/View;)V

    :cond_9
    iput-boolean p1, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mIsNestedScrollingEnabled:Z

    return-void
.end method

.method public startNestedScroll(I)Z
    .registers 6

    invoke-virtual {p0}, Landroid/support/v4/view/NestedScrollingChildHelper;->hasNestedScrollingParent()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    return v1

    :cond_8
    invoke-virtual {p0}, Landroid/support/v4/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v0

    if-eqz v0, :cond_34

    iget-object v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v2, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    :goto_16
    if-eqz v0, :cond_34

    iget-object v3, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v2, v3, p1}, Landroid/support/v4/view/ViewParentCompat;->onStartNestedScroll(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;I)Z

    move-result v3

    if-eqz v3, :cond_28

    iput-object v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mNestedScrollingParent:Landroid/view/ViewParent;

    iget-object v3, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v2, v3, p1}, Landroid/support/v4/view/ViewParentCompat;->onNestedScrollAccepted(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;I)V

    return v1

    :cond_28
    instance-of v3, v0, Landroid/view/View;

    if-eqz v3, :cond_2f

    move-object v2, v0

    check-cast v2, Landroid/view/View;

    :cond_2f
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_16

    :cond_34
    const/4 v0, 0x0

    return v0
.end method

.method public stopNestedScroll()V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mNestedScrollingParent:Landroid/view/ViewParent;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mNestedScrollingParent:Landroid/view/ViewParent;

    iget-object v1, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewParentCompat;->onStopNestedScroll(Landroid/view/ViewParent;Landroid/view/View;)V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mNestedScrollingParent:Landroid/view/ViewParent;

    :cond_e
    return-void
.end method
