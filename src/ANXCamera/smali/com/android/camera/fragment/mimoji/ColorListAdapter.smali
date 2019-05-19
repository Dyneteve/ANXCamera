.class public Lcom/android/camera/fragment/mimoji/ColorListAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "ColorListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mAvatarConfigItemClick:Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;

.field private mContext:Landroid/content/Context;

.field private mDatas:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;)V
    .locals 0

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mContext:Landroid/content/Context;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mDatas:Ljava/util/List;

    iput-object p2, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mAvatarConfigItemClick:Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/mimoji/ColorListAdapter;)Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mAvatarConfigItemClick:Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;

    return-object p0
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mDatas:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getSelectItem(I)F
    .locals 1

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInnerConfigSelectIndex(I)F

    move-result p1

    return p1
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0
    .param p1    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    check-cast p1, Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->onBindViewHolder(Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;I)V
    .locals 5
    .param p1    # Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mDatas:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;->ivColor:Lcom/android/camera/fragment/mimoji/CircleImageView;

    iget v0, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->getSelectItem(I)F

    move-result v0

    new-instance v1, Landroid/animation/ArgbEvaluator;

    invoke-direct {v1}, Landroid/animation/ArgbEvaluator;-><init>()V

    iget v2, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->continuousValue:F

    iget v3, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->startColorValue:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget v4, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->endColorValue:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sget-object v2, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "colorValue:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget v2, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configID:I

    int-to-float v2, v2

    cmpl-float v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/fragment/mimoji/CircleImageView;->updateView(ZI)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/fragment/mimoji/CircleImageView;->updateView(ZI)V

    :goto_0
    new-instance v0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;

    invoke-direct {v0, p0, p2}, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;-><init>(Lcom/android/camera/fragment/mimoji/ColorListAdapter;Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)V

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/mimoji/CircleImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;
    .locals 1
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mContext:Landroid/content/Context;

    const p2, 0x7f040043

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;

    invoke-direct {p2, p0, p1}, Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;-><init>(Lcom/android/camera/fragment/mimoji/ColorListAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public updateData(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mDatas:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mDatas:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method
