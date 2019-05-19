.class public Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "EditLevelListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAvatarConfigItemClick:Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;

.field private mContext:Landroid/content/Context;

.field private mItfGvOnItemClickListener:Lcom/android/camera/fragment/mimoji/ItfGvOnItemClickListener;

.field private volatile mLevelDatas:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/mimoji/MimojiLevelBean;",
            ">;"
        }
    .end annotation
.end field

.field private mMimojiLevelBean:Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

.field private mMimojiThumbnailAdapters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;",
            ">;"
        }
    .end annotation
.end field

.field private mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/android/camera/fragment/mimoji/ItfGvOnItemClickListener;)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    new-instance v0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$2;-><init>(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;)V

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mAvatarConfigItemClick:Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mContext:Landroid/content/Context;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiThumbnailAdapters:Ljava/util/List;

    iput-object p2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mItfGvOnItemClickListener:Lcom/android/camera/fragment/mimoji/ItfGvOnItemClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->onGvItemClick(II)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;)Lcom/android/camera/fragment/mimoji/ItfGvOnItemClickListener;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mItfGvOnItemClickListener:Lcom/android/camera/fragment/mimoji/ItfGvOnItemClickListener;

    return-object p0
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;)Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method private onGvItemClick(II)V
    .locals 3

    sget-object v0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "outerPosition = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " Select index = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iget-object v0, p1, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p2, v0, :cond_0

    iget-object v0, p1, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v1

    iget p1, p1, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    int-to-float p2, p2

    invoke-virtual {v1, p1, p2}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setInnerConfigSelectIndex(IF)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mAvatarConfigItemClick:Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;

    const/4 p2, 0x0

    invoke-interface {p1, v0, p2}, Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;->onConfigItemClick(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;Z)V

    :cond_0
    return-void
.end method

.method private showColor(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;Lcom/android/camera/fragment/mimoji/MimojiLevelBean;)V
    .locals 7

    iget-object v0, p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;->mColorRecycleView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mAvatarConfigItemClick:Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;

    invoke-direct {v1, v2, v3}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;-><init>(Landroid/content/Context;Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;->mTvSubTitle:Landroid/widget/TextView;

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    iget v2, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    invoke-static {v2}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->showConfigTypeName(I)Z

    move-result v2

    const/4 v3, 0x0

    const/16 v4, 0x8

    if-eqz v2, :cond_0

    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    sget-object v2, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u5c0f\u6807\u9898:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "----"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, "----"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    iget v6, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    invoke-static {v6}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->showConfigTypeName(I)Z

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiLevelBean:Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iget-object v2, v2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object p1

    iget v2, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    invoke-virtual {p1, v2}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getColorType(I)I

    move-result p1

    if-gez p1, :cond_1

    invoke-virtual {v0, v4}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    return-void

    :cond_1
    invoke-virtual {v0, v3}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    invoke-virtual {p2}, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->getColorConfigInfos()Ljava/util/ArrayList;

    move-result-object p1

    if-nez p1, :cond_2

    invoke-virtual {v0, v4}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    return-void

    :cond_2
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {v0, v4}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    goto :goto_1

    :cond_3
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_4

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    invoke-virtual {v1, p1}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->updateData(Ljava/util/List;)V

    sget-object v0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u989c\u8272show:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\u5217\u8868\u5927\u5c0f:"

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    :goto_1
    return-void
.end method

.method private showDivider(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;Lcom/android/camera/fragment/mimoji/MimojiLevelBean;I)V
    .locals 2

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;->mDividerView:Landroid/view/View;

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    if-nez p2, :cond_0

    return-void

    :cond_0
    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    const/4 v0, 0x1

    const/16 v1, 0x8

    if-le p2, v0, :cond_2

    if-nez p3, :cond_1

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_2
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public notifyThumbnailUpdate(III)V
    .locals 2

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getSelectType()I

    move-result v0

    if-eq p1, v0, :cond_0

    sget-object p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    const-string p2, "update wrong !!!!"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    sget-object p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "notifyThumbnailUpdate.... index = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", position = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-nez p1, :cond_1

    sget-object p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    const-string p2, "mLevelDatas Exception !!!!"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiLevelBean:Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiLevelBean:Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiThumbnailAdapters:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;

    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    invoke-virtual {p2, p1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->addData(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)V

    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0
    .param p1    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    check-cast p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->onBindViewHolder(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;I)V
    .locals 4
    .param p1    # Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiLevelBean:Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iget-object v0, p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;->mThumbnailGV:Landroid/widget/GridView;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiThumbnailAdapters:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiLevelBean:Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iget-object v2, v2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiLevelBean:Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    invoke-direct {p0, p1, v3}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->showColor(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;Lcom/android/camera/fragment/mimoji/MimojiLevelBean;)V

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiLevelBean:Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    invoke-direct {p0, p1, v3, p2}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->showDivider(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;Lcom/android/camera/fragment/mimoji/MimojiLevelBean;I)V

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mContext:Landroid/content/Context;

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    :goto_0
    invoke-static {p1, v0, v2}, Lcom/android/camera/fragment/mimoji/MeatureViewHeightWeight;->setGridViewHeightBasedOnChildren(Landroid/content/Context;Landroid/widget/GridView;I)V

    new-instance p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;

    invoke-direct {p1, p0, p2, v1}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;-><init>(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;ILcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;)V

    invoke-virtual {v0, p1}, Landroid/widget/GridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

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

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;
    .locals 1
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mContext:Landroid/content/Context;

    const p2, 0x7f040048

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;

    invoke-direct {p2, p0, p1}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;-><init>(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public refreshData(Ljava/util/List;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/mimoji/MimojiLevelBean;",
            ">;Z)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiThumbnailAdapters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    new-instance v1, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mContext:Landroid/content/Context;

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iget v3, v3, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    invoke-direct {v1, v2, v3}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;-><init>(Landroid/content/Context;I)V

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiThumbnailAdapters:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    if-eqz p2, :cond_0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iget-object v2, v2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->refreshData(Ljava/util/List;)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public setRenderThread(Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    return-void
.end method

.method public updateSelectView(Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;II)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    sget-object v0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u70b9\u51fb\u7684\u5b50Thumbnail configType:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiLevelBean:Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iget v2, v2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configName:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiLevelBean:Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iget-object v2, v2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "configId :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v2, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget v2, v2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    iget-object p2, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget p2, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configID:I

    invoke-virtual {p1, v0, p2}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->setSelectItem(II)V

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->notifyDataSetChanged()V

    return-void
.end method
