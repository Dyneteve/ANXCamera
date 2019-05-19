.class public Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;
.super Landroid/widget/BaseAdapter;
.source "ExtraCustomWBListAdapter.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;
    }
.end annotation


# static fields
.field private static final GAP_K_LONG_VALUE:I = 0x1f4

.field private static final GAP_K_SHOT_VALUE:I = 0xc8

.field private static final MAX_K_VALUE:I = 0x1f40

.field private static final MIDDLE_K_VALUE:I = 0x1770

.field private static final MIN_K_VALUE:I = 0x7d0


# instance fields
.field private mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

.field private mManuallyWB:Lcom/android/camera/data/data/config/ComponentManuallyWB;

.field private mOnCreated:Z


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/config/ComponentManuallyWB;Lcom/android/camera/fragment/manually/ManuallyListener;)V
    .locals 1

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mOnCreated:Z

    iput-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mManuallyWB:Lcom/android/camera/data/data/config/ComponentManuallyWB;

    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    return-void
.end method

.method private changeValue(I)V
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->getShotValueCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    const/16 v0, 0x7d0

    mul-int/lit16 p1, p1, 0xc8

    add-int/2addr v0, p1

    goto :goto_0

    :cond_0
    const/16 v1, 0x1770

    sub-int/2addr p1, v0

    mul-int/lit16 p1, p1, 0x1f4

    add-int v0, v1, p1

    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mManuallyWB:Lcom/android/camera/data/data/config/ComponentManuallyWB;

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/ComponentManuallyWB;->getCustomWB()I

    move-result p1

    if-eq v0, p1, :cond_1

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mManuallyWB:Lcom/android/camera/data/data/config/ComponentManuallyWB;

    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/config/ComponentManuallyWB;->setCustomWB(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mManuallyWB:Lcom/android/camera/data/data/config/ComponentManuallyWB;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x1

    invoke-interface {v1, v2, p1, v0, v3}, Lcom/android/camera/fragment/manually/ManuallyListener;->onManuallyDataChanged(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;Ljava/lang/String;Z)V

    :cond_1
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->getShotValueCount()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->getLongValueCount()I

    move-result v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mManuallyWB:Lcom/android/camera/data/data/config/ComponentManuallyWB;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentManuallyWB;->getItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getLongValueCount()I
    .locals 1

    const/4 v0, 0x4

    return v0
.end method

.method public getShotValueCount()I
    .locals 1

    const/16 v0, 0x14

    return v0
.end method

.method public getValuePosition()I
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mManuallyWB:Lcom/android/camera/data/data/config/ComponentManuallyWB;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentManuallyWB;->getCustomWB()I

    move-result v0

    const/16 v1, 0x1770

    if-ge v0, v1, :cond_0

    add-int/lit16 v0, v0, -0x7d0

    div-int/lit16 v0, v0, 0xc8

    return v0

    :cond_0
    sub-int/2addr v0, v1

    div-int/lit16 v0, v0, 0x1f4

    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->getShotValueCount()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    if-nez p2, :cond_0

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const p3, 0x7f04002b

    const/4 v0, 0x0

    invoke-virtual {p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    new-instance p3, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;

    invoke-direct {p3, v0}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;-><init>(Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$1;)V

    const v0, 0x7f0d00a1

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/ColorImageView;

    invoke-static {p3, v0}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;->access$102(Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;Lcom/android/camera/ui/ColorImageView;)Lcom/android/camera/ui/ColorImageView;

    const v0, 0x7f0d00a2

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/ColorActivateTextView;

    invoke-static {p3, v0}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;->access$202(Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;Lcom/android/camera/ui/ColorActivateTextView;)Lcom/android/camera/ui/ColorActivateTextView;

    invoke-static {p3}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;->access$200(Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;)Lcom/android/camera/ui/ColorActivateTextView;

    move-result-object v0

    const v1, -0x4c000001

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ColorActivateTextView;->setNormalCor(I)V

    invoke-static {p3}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;->access$200(Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;)Lcom/android/camera/ui/ColorActivateTextView;

    move-result-object v0

    const v1, -0xff5701

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ColorActivateTextView;->setActivateColor(I)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;

    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->getShotValueCount()I

    move-result v0

    if-ge p1, v0, :cond_1

    const/16 v0, 0x7d0

    mul-int/lit16 p1, p1, 0xc8

    add-int/2addr v0, p1

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_1
    const/16 v1, 0x1770

    sub-int/2addr p1, v0

    mul-int/lit16 p1, p1, 0x1f4

    add-int/2addr v1, p1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    :goto_1
    invoke-static {p3}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;->access$200(Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;)Lcom/android/camera/ui/ColorActivateTextView;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/android/camera/ui/ColorActivateTextView;->setText(Ljava/lang/CharSequence;)V

    return-object p2
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    iget-boolean p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mOnCreated:Z

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mOnCreated:Z

    return-void

    :cond_0
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->setSelection(I)V

    check-cast p1, Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {p1}, Lcom/android/camera/ui/HorizontalListView;->isScrolling()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_1
    invoke-direct {p0, p3}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->changeValue(I)V

    return-void
.end method

.method public onSingleTapDown(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->setSelection(I)V

    invoke-direct {p0, p3}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->changeValue(I)V

    return-void
.end method
