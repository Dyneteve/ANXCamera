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
.field private static final LIST_COLUMN_NUM:I = 0x3

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private isColorNeedNotify:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mAvatarConfigItemClick:Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;

.field private mClickCheck:Lcom/android/camera/fragment/mimoji/ClickCheck;

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
            "Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;",
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
    .locals 2

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->isColorNeedNotify:Ljava/util/concurrent/atomic/AtomicBoolean;

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

.method static synthetic access$000(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;)Lcom/android/camera/fragment/mimoji/ClickCheck;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mClickCheck:Lcom/android/camera/fragment/mimoji/ClickCheck;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->onGvItemClick(II)V

    return-void
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;)Lcom/android/camera/fragment/mimoji/ItfGvOnItemClickListener;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mItfGvOnItemClickListener:Lcom/android/camera/fragment/mimoji/ItfGvOnItemClickListener;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;)Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

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

    if-eqz v0, :cond_1

    if-ltz p1, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    if-ltz p2, :cond_0

    iget-object v1, v0, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge p2, v1, :cond_0

    iget-object v1, v0, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v2

    iget v0, v0, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    int-to-float p2, p2

    invoke-virtual {v2, v0, p2}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setInnerConfigSelectIndex(IF)V

    if-eqz v1, :cond_0

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mAvatarConfigItemClick:Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;

    const/4 v0, 0x0

    invoke-interface {p2, v1, v0, p1}, Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;->onConfigItemClick(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;ZI)V

    :cond_0
    goto :goto_0

    :cond_1
    sget-object p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    const-string p2, "gv mLevelDatas error"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method private declared-synchronized showColor(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;Lcom/android/camera/fragment/mimoji/MimojiLevelBean;I)V
    .locals 8

    monitor-enter p0

    :try_start_0
    iget-object v0, p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;->mColorRecycleView:Landroid/support/v7/widget/RecyclerView;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;->mTvSubTitle:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->getItemCount()I

    move-result v1

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    iget v2, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    invoke-static {v2}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->showConfigTypeName(I)Z

    move-result v2

    const/16 v3, 0x8

    const/4 v4, 0x0

    if-eqz v2, :cond_0

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiLevelBean:Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iget-object v2, v2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    invoke-virtual {p2}, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->getColorConfigInfos()Ljava/util/ArrayList;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v2

    iget v5, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    invoke-virtual {v2, v5}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getColorType(I)I

    move-result v2

    if-ltz v2, :cond_2

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v0, v4}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    goto :goto_2

    :cond_2
    :goto_1
    invoke-virtual {v0, v3}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    :goto_2
    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->isColorNeedNotify:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v2

    if-nez v2, :cond_a

    :cond_3
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getVisibility()I

    move-result v2

    if-nez v2, :cond_a

    sget-object v2, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "fmoji topic:"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "----"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "----"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    iget v5, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    invoke-static {v5}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->showConfigTypeName(I)Z

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int/2addr v3, p3

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getColorLayoutManagerMap(I)Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    move-result-object v2

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v3

    if-eqz v3, :cond_4

    if-nez v2, :cond_6

    :cond_4
    if-nez v2, :cond_5

    new-instance v2, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mContext:Landroid/content/Context;

    const-string v5, "color_select"

    invoke-direct {v2, v3, v5}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->setOrientation(I)V

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v5

    add-int/2addr v5, p3

    invoke-virtual {v3, v5, v2}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->putColorLayoutManagerMap(ILcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;)V

    :cond_5
    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    :cond_6
    new-instance v3, Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    iget-object v5, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mAvatarConfigItemClick:Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;

    invoke-direct {v3, v5, v6, v2}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;-><init>(Landroid/content/Context;Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;)V

    iget-object v5, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mClickCheck:Lcom/android/camera/fragment/mimoji/ClickCheck;

    invoke-virtual {v3, v5}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->setClickCheck(Lcom/android/camera/fragment/mimoji/ClickCheck;)V

    new-instance v5, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$3;

    invoke-direct {v5, p0, v3}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$3;-><init>(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;Lcom/android/camera/fragment/mimoji/ColorListAdapter;)V

    invoke-virtual {v3, v5}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->setOnItemClickListener(Lcom/android/camera/fragment/mimoji/ColorListAdapter$OnItemClickListener;)V

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    invoke-virtual {v3, p1}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->setData(Ljava/util/List;)V

    nop

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget v3, v3, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    invoke-virtual {v0, v3}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInnerConfigSelectIndex(I)F

    move-result v0

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    move v5, v4

    move v6, v5

    :goto_3
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v5, v7, :cond_8

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget v7, v7, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configID:I

    int-to-float v7, v7

    cmpl-float v7, v0, v7

    if-nez v7, :cond_7

    nop

    move v6, v5

    :cond_7
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    :cond_8
    sget-object v0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "fmoji show color :"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "color size:"

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " colorSelectPositon : "

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "   curHolderPosition : "

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    div-int/lit8 v3, v3, 0x2

    invoke-virtual {v2, v6, v3}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->scrollToPositionWithOffset(II)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->isColorNeedNotify:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-eqz p1, :cond_9

    add-int/lit8 v1, v1, -0x1

    if-lt p3, v1, :cond_9

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->isColorNeedNotify:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_9
    goto :goto_4

    :cond_a
    sget-object p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "fmoji show color isColorNeedNotify : "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->isColorNeedNotify:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_4
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method


# virtual methods
.method public getIsColorNeedNotify()Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->isColorNeedNotify:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public getItemCount()I
    .locals 3

    sget-object v0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mLevelDatas getItemCount size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
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

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    if-le p2, p1, :cond_1

    goto :goto_2

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiThumbnailAdapters:Ljava/util/List;

    if-eqz p1, :cond_4

    if-ltz p2, :cond_4

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiThumbnailAdapters:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    if-le p2, p1, :cond_2

    goto :goto_1

    :cond_2
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

    check-cast p2, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;

    if-eqz p1, :cond_3

    if-ltz p3, :cond_3

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-ge p3, v0, :cond_3

    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    invoke-virtual {p2, p3, p1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;->updateData(ILjava/lang/Object;)V

    goto :goto_0

    :cond_3
    sget-object p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    const-string p2, "fmoji position message error !!!!"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void

    :cond_4
    :goto_1
    sget-object p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    const-string p2, "mHandler message error !!!!"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_5
    :goto_2
    sget-object p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    const-string p2, "mLevelDatas Exception !!!!"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

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
    .locals 7
    .param p1    # Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiLevelBean:Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iget-object v0, p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;->mThumbnailGV:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiLevelBean:Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    invoke-direct {p0, p1, v1, p2}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->showColor(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;Lcom/android/camera/fragment/mimoji/MimojiLevelBean;I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiThumbnailAdapters:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    const/16 v1, 0x8

    if-ge p2, p1, :cond_4

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiLevelBean:Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    const/4 v2, 0x0

    if-nez p1, :cond_0

    move p1, v2

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiLevelBean:Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    :goto_0
    if-nez p1, :cond_1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    goto :goto_2

    :cond_1
    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiThumbnailAdapters:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getItemAnimator()Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    move-result-object v3

    const-wide/16 v4, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setChangeDuration(J)V

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getItemAnimator()Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    move-result-object v3

    invoke-virtual {v3, v4, v5}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setRemoveDuration(J)V

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getItemAnimator()Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    move-result-object v3

    invoke-virtual {v3, v4, v5}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setMoveDuration(J)V

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v3

    const/4 v4, 0x3

    if-nez v3, :cond_2

    new-instance v3, Lcom/android/camera/ui/baseview/BaseGridLayoutManager;

    iget-object v5, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v3, v5, v4}, Lcom/android/camera/ui/baseview/BaseGridLayoutManager;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    :cond_2
    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    div-int/lit8 v5, p1, 0x3

    rem-int/2addr p1, v4

    const/4 v4, 0x1

    if-nez p1, :cond_3

    goto :goto_1

    :cond_3
    move v2, v4

    :goto_1
    add-int/2addr v5, v2

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v2, 0x7f0a018c

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v6, 0x7f0a018b

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    mul-int/2addr v2, v5

    sub-int/2addr v5, v4

    mul-int/2addr p1, v5

    add-int/2addr v2, p1

    iput v2, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/RecyclerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;

    invoke-direct {p1, p0, p2, v1}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;-><init>(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;ILcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;)V

    invoke-virtual {v1, p1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;->setOnRecyclerItemClickListener(Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener;)V

    :goto_2
    goto :goto_3

    :cond_4
    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    :goto_3
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
    .locals 2
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f04004a

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;

    invoke-direct {p2, p0, p1}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;-><init>(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public declared-synchronized refreshData(Ljava/util/List;ZZ)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/mimoji/MimojiLevelBean;",
            ">;ZZ)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mLevelDatas refreshData list size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "   mLevelDatas size"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "  isColor : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, "   loadThumbnailFromCache : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p1, :cond_8

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_3

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ne v0, v2, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiThumbnailAdapters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiThumbnailAdapters:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;->getItemCount()I

    move-result v0

    if-lez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->getItemCount()I

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    nop

    move p3, v1

    :cond_2
    if-eqz p3, :cond_5

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p3

    if-ge v1, p3, :cond_7

    iget-object p3, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiThumbnailAdapters:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p3

    if-lt v1, p3, :cond_3

    goto :goto_2

    :cond_3
    if-eqz p2, :cond_4

    iget-object p3, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiThumbnailAdapters:Ljava/util/List;

    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {p3, v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;->setDataList(Ljava/util/ArrayList;)V

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_5
    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->clear()V

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiThumbnailAdapters:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    :goto_1
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-ge v1, p1, :cond_6

    new-instance p1, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mContext:Landroid/content/Context;

    iget-object p3, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iget p3, p3, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    invoke-direct {p1, p2, p3}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;-><init>(Landroid/content/Context;I)V

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mMimojiThumbnailAdapters:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_6
    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->notifyDataSetChanged()V

    :cond_7
    :goto_2
    sget-object p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "fmoji refreshData isColorNeedNotify = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->isColorNeedNotify:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_8
    :goto_3
    :try_start_1
    sget-object p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->TAG:Ljava/lang/String;

    const-string p2, "mLevelDatas refreshData list size error"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setIsColorNeedNotify(Z)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->isColorNeedNotify:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method

.method public setRenderThread(Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    return-void
.end method

.method public setmClickCheck(Lcom/android/camera/fragment/mimoji/ClickCheck;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mClickCheck:Lcom/android/camera/fragment/mimoji/ClickCheck;

    return-void
.end method

.method public updateSelectView(Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;II)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->mLevelDatas:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iget-object v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p3, v0, :cond_0

    sget-object v0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "click Thumbnail configType:"

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

    invoke-virtual {p1, v0, p2}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;->setSelectItem(II)V

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method
