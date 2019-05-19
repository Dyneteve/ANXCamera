.class public Lcom/android/camera/fragment/mimoji/FragmentMimoji;
.super Lcom/android/camera/fragment/live/FragmentLiveBase;
.source "FragmentMimoji.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;
    }
.end annotation


# static fields
.field public static final ADD_STATE:Ljava/lang/String; = "add_state"

.field public static final CLOSE_STATE:Ljava/lang/String; = "close_state"

.field private static final FRAGMENT_INFO:I = 0xfff

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private bubbleEditMimojiPresenter:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

.field private mAddItemView:Landroid/view/View;

.field private mContext:Landroid/content/Context;

.field private mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

.field private mMimojiInfoList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/mimoji/MimojiInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mMimojiInfoSelect:Lcom/android/camera/fragment/mimoji/MimojiInfo;

.field private mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

.field private mMimojiRecylerView:Landroid/support/v7/widget/RecyclerView;

.field private mNoneItemView:Landroid/view/View;

.field private mNoneSelectItemView:Landroid/view/View;

.field private mSelectState:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/live/FragmentLiveBase;-><init>()V

    const-string v0, "close_state"

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mSelectState:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->bubbleEditMimojiPresenter:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mNoneSelectItemView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    return-object p0
.end method

.method private scrollIfNeed(I)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_3

    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    add-int/lit8 p1, p1, 0x1

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {v1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->getItemCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPosition(I)V

    goto :goto_1

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    const/4 v1, 0x0

    add-int/lit8 p1, p1, -0x1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPosition(I)V

    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public filelistToMinojiInfo()V
    .locals 12

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Ljava/io/File;

    sget-object v3, Lcom/android/camera/fragment/mimoji/MimojiHelper;->CUSTOM_DIR:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    array-length v3, v2

    move v4, v1

    :goto_0
    if-ge v4, v3, :cond_2

    aget-object v5, v2, v4

    new-instance v6, Lcom/android/camera/fragment/mimoji/MimojiInfo;

    invoke-direct {v6}, Lcom/android/camera/fragment/mimoji/MimojiInfo;-><init>()V

    sget-object v7, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    iput-object v7, v6, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mAvatarTemplatePath:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "config.dat"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "pic.png"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v11, Lcom/android/camera/fragment/mimoji/MimojiHelper;->CUSTOM_DIR:Ljava/lang/String;

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "/"

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v11, Lcom/android/camera/fragment/mimoji/MimojiHelper;->CUSTOM_DIR:Ljava/lang/String;

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "/"

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5}, Lcom/android/camera/module/impl/component/FileUtils;->checkFileConsist(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-static {v7}, Lcom/android/camera/module/impl/component/FileUtils;->checkFileConsist(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    iput-object v5, v6, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    iput-object v7, v6, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mThumbnailUrl:Ljava/lang/String;

    iput-object v8, v6, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mPackPath:Ljava/lang/String;

    iget-object v5, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_0
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_1
    goto :goto_2

    :cond_1
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    :cond_2
    goto :goto_3

    :catch_0
    move-exception v2

    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    :goto_3
    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->setMimojiInfoList(Ljava/util/List;)V

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {v2}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->notifyDataSetChanged()V

    :goto_4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/FileUtils;->deleteFile(Ljava/lang/String;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_3
    return-void
.end method

.method public getFragmentInto()I
    .locals 1

    const/16 v0, 0xfff

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    const v0, 0x7f04002d

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mContext:Landroid/content/Context;

    const v0, 0x7f0d00a7

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mNoneItemView:Landroid/view/View;

    const v0, 0x7f0d00aa

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiRecylerView:Landroid/support/v7/widget/RecyclerView;

    const v0, 0x7f0d00a6

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    new-instance v1, Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-direct {v1}, Lcom/android/camera/fragment/DefaultItemAnimator;-><init>()V

    const-wide/16 v2, 0x96

    invoke-virtual {v1, v2, v3}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setChangeDuration(J)V

    invoke-virtual {v1, v2, v3}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setMoveDuration(J)V

    invoke-virtual {v1, v2, v3}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setAddDuration(J)V

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiRecylerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    const v1, 0x7f0d00a8

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mNoneSelectItemView:Landroid/view/View;

    new-instance v1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, p0, v0}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;-><init>(Landroid/content/Context;Landroid/view/View$OnClickListener;Landroid/widget/RelativeLayout;)V

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->bubbleEditMimojiPresenter:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiRecylerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/android/camera/fragment/mimoji/FragmentMimoji$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$1;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mNoneItemView:Landroid/view/View;

    new-instance v1, Lcom/android/camera/fragment/mimoji/FragmentMimoji$2;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$2;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0d00a9

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mAddItemView:Landroid/view/View;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mAddItemView:Landroid/view/View;

    new-instance v0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$3;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$3;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mSelectState:Ljava/lang/String;

    invoke-direct {p1, p0, v0, v1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;Landroid/content/Context;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->filelistToMinojiInfo()V

    new-instance p1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiRecylerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiRecylerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentMimojiState()Ljava/lang/String;

    move-result-object p1

    const-string v1, "close_state"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mNoneSelectItemView:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->setSelectState(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->notifyDataSetChanged()V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->getMimojiInfoSelected()Lcom/android/camera/fragment/mimoji/MimojiInfo;

    move-result-object p1

    if-eqz p1, :cond_1

    const/4 v0, -0x1

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->onItemSelected(Lcom/android/camera/fragment/mimoji/MimojiInfo;ILandroid/view/View;Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected onAddItemSelected(Landroid/view/View;)V
    .locals 1

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mIsNeedShowWhenExit:Z

    const-string p1, "add_state"

    invoke-static {p1}, Lcom/android/camera/CameraSettings;->setCurrentMimojiState(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xd9

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->onMimojiCreate()V

    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v0, -0x2

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoSelect:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoSelect:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mPackPath:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoSelect:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mPackPath:Ljava/lang/String;

    invoke-static {p1}, Lcom/android/camera/module/impl/component/FileUtils;->deleteFile(Ljava/lang/String;)Z

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->bubbleEditMimojiPresenter:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    invoke-virtual {p1, v0, v0}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->processBubbleAni(II)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    const-string v0, "close_state"

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->setSelectState(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->notifyDataSetChanged()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0902d1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->filelistToMinojiInfo()V

    goto :goto_0

    :pswitch_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v1, 0xd9

    invoke-virtual {p1, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->releaseRender()V

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v1, 0xe0

    invoke-virtual {p1, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    if-eqz p1, :cond_1

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoSelect:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    iget-object v1, v1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    invoke-interface {p1, v1}, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;->directlyEnterEditMode(Ljava/lang/String;)V

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->bubbleEditMimojiPresenter:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    invoke-virtual {p1, v0, v0}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->processBubbleAni(II)V

    nop

    :cond_2
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onItemSelected(Lcom/android/camera/fragment/mimoji/MimojiInfo;ILandroid/view/View;Z)V
    .locals 5

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentMimojiState()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->setCurrentMimojiState(Ljava/lang/String;)V

    sget-object v2, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u70b9\u51fbcurrentState:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " lastState:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->bubbleEditMimojiPresenter:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    const/4 v3, -0x2

    invoke-virtual {v2, v3, v3}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->processBubbleAni(II)V

    if-nez p4, :cond_1

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->scrollIfNeed(I)V

    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    const-string p2, "add_state"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    const-string p2, "close_state"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    if-nez p4, :cond_2

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoSelect:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    move-result p1

    const/4 p2, 0x2

    new-array p4, p2, [I

    invoke-virtual {p3, p4}, Landroid/view/View;->getLocationOnScreen([I)V

    const/4 v0, 0x0

    aget p4, p4, v0

    const/16 v0, 0x46

    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result p3

    add-int/2addr v0, p3

    div-int/2addr p1, p2

    add-int/2addr p4, p1

    add-int/lit8 p4, p4, -0x28

    nop

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->bubbleEditMimojiPresenter:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    invoke-virtual {p1, p4, v0}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->processBubbleAni(II)V

    return-void

    :cond_2
    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mNoneSelectItemView:Landroid/view/View;

    const/16 p3, 0x8

    invoke-virtual {p2, p3}, Landroid/view/View;->setVisibility(I)V

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    iget-object p3, p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    invoke-virtual {p2, p3}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->setSelectState(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {p2}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->notifyDataSetChanged()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    const/16 p3, 0xd9

    invoke-virtual {p2, p3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;

    if-eqz p2, :cond_3

    invoke-interface {p2, p1}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->onMimojiSelect(Lcom/android/camera/fragment/mimoji/MimojiInfo;)V

    :cond_3
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveBase;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->bubbleEditMimojiPresenter:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    const/4 v0, -0x2

    invoke-virtual {p1, v0, v0}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->processBubbleAni(II)V

    return-void
.end method
