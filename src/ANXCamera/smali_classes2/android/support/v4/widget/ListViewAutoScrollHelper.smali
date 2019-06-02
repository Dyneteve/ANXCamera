.class public Landroid/support/v4/widget/ListViewAutoScrollHelper;
.super Landroid/support/v4/widget/AutoScrollHelper;
.source "ListViewAutoScrollHelper.java"


# instance fields
.field private final mTarget:Landroid/widget/ListView;


# direct methods
.method public constructor <init>(Landroid/widget/ListView;)V
    .registers 2

    invoke-direct {p0, p1}, Landroid/support/v4/widget/AutoScrollHelper;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Landroid/support/v4/widget/ListViewAutoScrollHelper;->mTarget:Landroid/widget/ListView;

    return-void
.end method


# virtual methods
.method public canTargetScrollHorizontally(I)Z
    .registers 3

    const/4 v0, 0x0

    return v0
.end method

.method public canTargetScrollVertically(I)Z
    .registers 11

    iget-object v0, p0, Landroid/support/v4/widget/ListViewAutoScrollHelper;->mTarget:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getCount()I

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    invoke-virtual {v0}, Landroid/widget/ListView;->getChildCount()I

    move-result v3

    invoke-virtual {v0}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v4

    add-int v5, v4, v3

    if-lez p1, :cond_2a

    if-lt v5, v1, :cond_3a

    add-int/lit8 v6, v3, -0x1

    invoke-virtual {v0, v6}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getBottom()I

    move-result v7

    invoke-virtual {v0}, Landroid/widget/ListView;->getHeight()I

    move-result v8

    if-gt v7, v8, :cond_29

    return v2

    :cond_29
    goto :goto_3a

    :cond_2a
    if-gez p1, :cond_3c

    if-gtz v4, :cond_3a

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v7

    if-ltz v7, :cond_39

    return v2

    :cond_39
    nop

    :cond_3a
    :goto_3a
    const/4 v2, 0x1

    return v2

    :cond_3c
    return v2
.end method

.method public scrollTargetBy(II)V
    .registers 7

    iget-object v0, p0, Landroid/support/v4/widget/ListViewAutoScrollHelper;->mTarget:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_a

    return-void

    :cond_a
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    if-nez v2, :cond_12

    return-void

    :cond_12
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v3

    sub-int/2addr v3, p2

    invoke-virtual {v0, v1, v3}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    return-void
.end method
