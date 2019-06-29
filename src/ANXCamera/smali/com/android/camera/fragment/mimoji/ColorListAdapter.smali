.class public Lcom/android/camera/fragment/mimoji/ColorListAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "ColorListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/mimoji/ColorListAdapter$OnItemClickListener;,
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


# static fields
.field public static final TAG:Ljava/lang/String;


# instance fields
.field private clickCheck:Lcom/android/camera/fragment/mimoji/ClickCheck;

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

.field public mLastPosion:I

.field private mLinearLayoutManagerWrapper:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

.field private onItemClickListener:Lcom/android/camera/fragment/mimoji/ColorListAdapter$OnItemClickListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mLastPosion:I

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mContext:Landroid/content/Context;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mDatas:Ljava/util/List;

    iput-object p2, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mAvatarConfigItemClick:Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;

    iput-object p3, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mLinearLayoutManagerWrapper:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/mimoji/ColorListAdapter;)Lcom/android/camera/fragment/mimoji/ClickCheck;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->clickCheck:Lcom/android/camera/fragment/mimoji/ClickCheck;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/mimoji/ColorListAdapter;)Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mAvatarConfigItemClick:Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/mimoji/ColorListAdapter;)Lcom/android/camera/fragment/mimoji/ColorListAdapter$OnItemClickListener;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->onItemClickListener:Lcom/android/camera/fragment/mimoji/ColorListAdapter$OnItemClickListener;

    return-object p0
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mDatas:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mDatas:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
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

.method public getmLinearLayoutManagerWrapper()Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mLinearLayoutManagerWrapper:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    return-object v0
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
    .locals 9
    .param p1    # Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mDatas:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget-object v6, p1, Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;->ivColor:Lcom/android/camera/fragment/mimoji/CircleImageView;

    iget v0, v5, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->getSelectItem(I)F

    move-result v0

    new-instance v4, Landroid/animation/ArgbEvaluator;

    invoke-direct {v4}, Landroid/animation/ArgbEvaluator;-><init>()V

    iget v1, v5, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->continuousValue:F

    iget v2, v5, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->startColorValue:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, v5, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->endColorValue:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v1, v2, v3}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget v2, v5, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configID:I

    int-to-float v2, v2

    cmpl-float v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {v6, v0, v1}, Lcom/android/camera/fragment/mimoji/CircleImageView;->updateView(ZI)V

    iput p2, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mLastPosion:I

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {v6, v0, v1}, Lcom/android/camera/fragment/mimoji/CircleImageView;->updateView(ZI)V

    :goto_0
    iget-object v0, p1, Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;->itemView:Landroid/view/View;

    new-instance v8, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;

    move-object v1, v8

    move-object v2, p0

    move v3, p2

    move-object v7, p1

    invoke-direct/range {v1 .. v7}, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;-><init>(Lcom/android/camera/fragment/mimoji/ColorListAdapter;ILandroid/animation/ArgbEvaluator;Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;Lcom/android/camera/fragment/mimoji/CircleImageView;Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;)V

    invoke-virtual {v0, v8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

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
    .locals 2
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f040044

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;

    invoke-direct {p2, p0, p1}, Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;-><init>(Lcom/android/camera/fragment/mimoji/ColorListAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public setClickCheck(Lcom/android/camera/fragment/mimoji/ClickCheck;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->clickCheck:Lcom/android/camera/fragment/mimoji/ClickCheck;

    return-void
.end method

.method public setData(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mDatas:Ljava/util/List;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public setOnItemClickListener(Lcom/android/camera/fragment/mimoji/ColorListAdapter$OnItemClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->onItemClickListener:Lcom/android/camera/fragment/mimoji/ColorListAdapter$OnItemClickListener;

    return-void
.end method
