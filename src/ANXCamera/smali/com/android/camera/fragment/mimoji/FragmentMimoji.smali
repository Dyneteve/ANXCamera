.class public Lcom/android/camera/fragment/mimoji/FragmentMimoji;
.super Lcom/android/camera/fragment/live/FragmentLiveBase;
.source "FragmentMimoji.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/protocol/ModeProtocol$MimojiAlert;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;
    }
.end annotation


# static fields
.field public static final ADD_STATE:Ljava/lang/String; = "add_state"

.field public static final CLOSE_STATE:Ljava/lang/String; = "close_state"

.field private static final FAKE_ADD_CONFIGPATH:Ljava/lang/String; = "add"

.field private static final FRAGMENT_INFO:I = 0xfff

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private bubbleEditMimojiPresenter:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

.field private mContext:Landroid/content/Context;

.field private mItemWidth:I

.field private mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

.field private mLlProgress:Landroid/widget/LinearLayout;

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

.field private mSelectIndex:I

.field private mSelectState:Ljava/lang/String;

.field private mTotalWidth:I

.field private popContainer:Landroid/widget/RelativeLayout;

.field private popParent:Landroid/widget/RelativeLayout;


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

.method static synthetic access$500(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Lcom/android/camera/fragment/mimoji/MimojiInfo;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoSelect:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    return-object p0
.end method

.method private scrollIfNeed(I)Z
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p1, v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_1

    goto :goto_0

    :cond_1
    return v1

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    add-int/2addr p1, v2

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {v1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->getItemCount()I

    move-result v1

    sub-int/2addr v1, v2

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPosition(I)V

    return v2

    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    sub-int/2addr p1, v2

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPosition(I)V

    return v2
.end method

.method private setItemInCenter(I)V
    .locals 2

    iget v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mTotalWidth:I

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mItemWidth:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v1, p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    return-void
.end method

.method private showAlertDialog()V
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f09035b

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    new-instance v1, Lcom/android/camera/fragment/mimoji/FragmentMimoji$3;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$3;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)V

    const v2, 0x7f09035f

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    new-instance v1, Lcom/android/camera/fragment/mimoji/FragmentMimoji$4;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$4;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)V

    const v2, 0x7f09035e

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public filelistToMinojiInfo()V
    .locals 12

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    new-instance v0, Lcom/android/camera/fragment/mimoji/MimojiInfo;

    invoke-direct {v0}, Lcom/android/camera/fragment/mimoji/MimojiInfo;-><init>()V

    const-string v1, "add"

    iput-object v1, v0, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    const-wide v1, 0x7fffffffffffffffL

    iput-wide v1, v0, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mDirectoryName:J

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Ljava/io/File;

    sget-object v3, Lcom/android/camera/fragment/mimoji/MimojiHelper;->CUSTOM_DIR:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_3

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

    const-string v11, "/"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v5}, Lcom/android/camera/module/impl/component/FileUtils;->checkFileConsist(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-static {v9}, Lcom/android/camera/module/impl/component/FileUtils;->checkFileConsist(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    iput-object v5, v6, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    iput-object v9, v6, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mThumbnailUrl:Ljava/lang/String;

    iput-object v8, v6, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mPackPath:Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    iput-wide v7, v6, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mDirectoryName:J

    iget-object v5, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_0
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_1
    goto :goto_2

    :cond_1
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    :cond_2
    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    invoke-static {v2}, Ljava/util/Collections;->sort(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_3
    goto :goto_3

    :catch_0
    move-exception v2

    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    :goto_3
    new-instance v2, Lcom/android/camera/fragment/mimoji/MimojiInfo;

    invoke-direct {v2}, Lcom/android/camera/fragment/mimoji/MimojiInfo;-><init>()V

    sget-object v3, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PigTemplatePath:Ljava/lang/String;

    iput-object v3, v2, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mAvatarTemplatePath:Ljava/lang/String;

    const-string v3, "pig"

    iput-object v3, v2, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/android/camera/fragment/mimoji/MimojiHelper;->MIMOJI_DIR:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/pig.png"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mThumbnailUrl:Ljava/lang/String;

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v2, Lcom/android/camera/fragment/mimoji/MimojiInfo;

    invoke-direct {v2}, Lcom/android/camera/fragment/mimoji/MimojiInfo;-><init>()V

    sget-object v3, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->RoyanTemplatePath:Ljava/lang/String;

    iput-object v3, v2, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mAvatarTemplatePath:Ljava/lang/String;

    const-string v3, "royan"

    iput-object v3, v2, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/android/camera/fragment/mimoji/MimojiHelper;->MIMOJI_DIR:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/royan.png"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mThumbnailUrl:Ljava/lang/String;

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v2, Lcom/android/camera/fragment/mimoji/MimojiInfo;

    invoke-direct {v2}, Lcom/android/camera/fragment/mimoji/MimojiInfo;-><init>()V

    sget-object v3, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->BearTemplatePath:Ljava/lang/String;

    iput-object v3, v2, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mAvatarTemplatePath:Ljava/lang/String;

    const-string v3, "bear"

    iput-object v3, v2, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/android/camera/fragment/mimoji/MimojiHelper;->MIMOJI_DIR:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/bear.png"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mThumbnailUrl:Ljava/lang/String;

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v2, Lcom/android/camera/fragment/mimoji/MimojiInfo;

    invoke-direct {v2}, Lcom/android/camera/fragment/mimoji/MimojiInfo;-><init>()V

    sget-object v3, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->RabbitTemplatePath:Ljava/lang/String;

    iput-object v3, v2, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mAvatarTemplatePath:Ljava/lang/String;

    const-string v3, "rabbit"

    iput-object v3, v2, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/android/camera/fragment/mimoji/MimojiHelper;->MIMOJI_DIR:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/rabbit.png"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mThumbnailUrl:Ljava/lang/String;

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->setMimojiInfoList(Ljava/util/List;)V

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {v2}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->notifyDataSetChanged()V

    :goto_4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_4

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/FileUtils;->deleteFile(Ljava/lang/String;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_4
    return-void
.end method

.method public firstProgressShow(Z)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLlProgress:Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->initView(Landroid/view/View;)V

    :cond_0
    const/16 v0, 0x8

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLlProgress:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiRecylerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLlProgress:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiRecylerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method public getFragmentInto()I
    .locals 1

    const/16 v0, 0xfff

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    const v0, 0x7f04002e

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 5

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0101

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mItemWidth:I

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mTotalWidth:I

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mContext:Landroid/content/Context;

    const v0, 0x7f0d00a9

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mNoneItemView:Landroid/view/View;

    const v0, 0x7f0d00ab

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiRecylerView:Landroid/support/v7/widget/RecyclerView;

    const v0, 0x7f0d00a8

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->popContainer:Landroid/widget/RelativeLayout;

    const v0, 0x7f0d00a7

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->popParent:Landroid/widget/RelativeLayout;

    const v0, 0x7f0d00ac

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLlProgress:Landroid/widget/LinearLayout;

    new-instance v0, Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-direct {v0}, Lcom/android/camera/fragment/DefaultItemAnimator;-><init>()V

    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setChangeDuration(J)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setMoveDuration(J)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setAddDuration(J)V

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiRecylerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    const v0, 0x7f0d00aa

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mNoneSelectItemView:Landroid/view/View;

    new-instance p1, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->popParent:Landroid/widget/RelativeLayout;

    invoke-direct {p1, v0, p0, v1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;-><init>(Landroid/content/Context;Landroid/view/View$OnClickListener;Landroid/widget/RelativeLayout;)V

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->bubbleEditMimojiPresenter:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiRecylerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$1;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)V

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mNoneItemView:Landroid/view/View;

    new-instance v0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$2;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mSelectState:Ljava/lang/String;

    invoke-direct {p1, p0, v0, v1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;Landroid/content/Context;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsLoading()Z

    move-result p1

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->firstProgressShow(Z)V

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

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f0a0123

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    new-instance v1, Lcom/android/camera/fragment/RecyclerAdapterWrapper;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-direct {v1, v2}, Lcom/android/camera/fragment/RecyclerAdapterWrapper;-><init>(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    new-instance v2, Landroid/widget/Space;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/Space;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, p1}, Landroid/widget/Space;->setMinimumWidth(I)V

    invoke-virtual {v1, v2}, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->addHeader(Landroid/view/View;)V

    invoke-virtual {v1, v2}, Lcom/android/camera/fragment/RecyclerAdapterWrapper;->addFooter(Landroid/view/View;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiRecylerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    const/4 p1, -0x1

    iput p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mSelectIndex:I

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentMimojiState()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    move v3, v2

    :goto_0
    iget-object v4, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_1

    iget-object v4, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/camera/fragment/mimoji/MimojiInfo;

    iget-object v4, v4, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iput v3, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mSelectIndex:I

    goto :goto_1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    iget v3, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mSelectIndex:I

    invoke-direct {p0, v3}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->setItemInCenter(I)V

    const-string v3, "close_state"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mNoneSelectItemView:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2

    :cond_2
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setCurrentMimojiState(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->updateSelect()V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->getMimojiInfoSelected()Lcom/android/camera/fragment/mimoji/MimojiInfo;

    move-result-object v0

    if-eqz v0, :cond_3

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1, v2}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->onItemSelected(Lcom/android/camera/fragment/mimoji/MimojiInfo;ILandroid/view/View;Z)V

    :cond_3
    :goto_2
    invoke-static {v2}, Lcom/android/camera/CameraSettings;->setMimojiPannelState(Z)V

    return-void
.end method

.method protected onAddItemSelected()V
    .locals 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mIsNeedShowWhenExit:Z

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd9

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->onMimojiCreate()V

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->forceSwitchFront()Z

    :cond_1
    return-void
.end method

.method public onBackEvent(I)Z
    .locals 3

    sget-object v0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onBackEvent = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiEdit()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    return v1

    :cond_0
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setMimojiPannelState(Z)V

    invoke-super {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveBase;->onBackEvent(I)Z

    move-result p1

    return p1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->showAlertDialog()V

    goto :goto_0

    :pswitch_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xd9

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->releaseRender()V

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xe0

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoSelect:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    const/16 v1, 0x65

    invoke-interface {p1, v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;->directlyEnterEditMode(Lcom/android/camera/fragment/mimoji/MimojiInfo;I)V

    :cond_1
    const-string p1, "\u840c\u62cd\u7f16\u8f91"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackMimojiClick(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->bubbleEditMimojiPresenter:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    const/4 v0, 0x0

    const/4 v1, -0x2

    invoke-virtual {p1, v1, v1, v0}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->processBubbleAni(IILandroid/view/View;)V

    nop

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onItemSelected(Lcom/android/camera/fragment/mimoji/MimojiInfo;ILandroid/view/View;Z)V
    .locals 7

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v6, p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentMimojiState()Ljava/lang/String;

    move-result-object v3

    const-string v0, "add"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {v6}, Lcom/android/camera/CameraSettings;->setCurrentMimojiState(Ljava/lang/String;)V

    :cond_1
    sget-object v0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "click\u3000currentState:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " lastState:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->bubbleEditMimojiPresenter:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    const/4 v1, 0x0

    const/4 v2, -0x2

    invoke-virtual {v0, v2, v2, v1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->processBubbleAni(IILandroid/view/View;)V

    const-string v0, "add"

    iget-object v1, p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->onAddItemSelected()V

    const-string p1, "\u840c\u62cd\u6dfb\u52a0"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackMimojiClick(Ljava/lang/String;)V

    return-void

    :cond_2
    if-nez p4, :cond_9

    nop

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    if-eq p2, v0, :cond_8

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p2, v0, :cond_3

    goto :goto_2

    :cond_3
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v0

    if-eq p2, v0, :cond_7

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p2, v0, :cond_4

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-eq p2, v0, :cond_6

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne p2, v0, :cond_5

    goto :goto_0

    :cond_5
    move-object v0, p0

    move-object v1, p1

    move-object v2, v6

    move-object v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->processBubble(Lcom/android/camera/fragment/mimoji/MimojiInfo;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;Z)V

    goto :goto_3

    :cond_6
    :goto_0
    iget-object p3, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    add-int/lit8 p2, p2, 0x2

    iget-object p4, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {p4}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->getItemCount()I

    move-result p4

    invoke-static {p2, p4}, Ljava/lang/Math;->min(II)I

    move-result p2

    invoke-virtual {p3, p2}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPosition(I)V

    goto :goto_3

    :cond_7
    :goto_1
    iget-object p3, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    add-int/lit8 p2, p2, 0x1

    iget-object p4, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {p4}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->getItemCount()I

    move-result p4

    add-int/lit8 p4, p4, -0x1

    invoke-static {p2, p4}, Ljava/lang/Math;->min(II)I

    move-result p2

    invoke-virtual {p3, p2}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPosition(I)V

    goto :goto_3

    :cond_8
    :goto_2
    iget-object p3, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    const/4 p4, 0x0

    add-int/lit8 p2, p2, -0x1

    invoke-static {p4, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    invoke-virtual {p3, p2}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPosition(I)V

    :goto_3
    invoke-virtual {p0, v6, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->setAvatarAndSelect(Ljava/lang/String;Lcom/android/camera/fragment/mimoji/MimojiInfo;)V

    goto :goto_4

    :cond_9
    move-object v0, p0

    move-object v1, p1

    move-object v2, v6

    move-object v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->processBubble(Lcom/android/camera/fragment/mimoji/MimojiInfo;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;Z)V

    invoke-virtual {p0, v6, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->setAvatarAndSelect(Ljava/lang/String;Lcom/android/camera/fragment/mimoji/MimojiInfo;)V

    :goto_4
    return-void
.end method

.method public processBubble(Lcom/android/camera/fragment/mimoji/MimojiInfo;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;Z)V
    .locals 2

    iget-object v0, p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->isPrefabModel(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    const-string p2, "add_state"

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_0

    const-string p2, "close_state"

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_0

    if-nez p5, :cond_0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoSelect:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    invoke-virtual {p4}, Landroid/view/View;->getWidth()I

    move-result p1

    const/4 p2, 0x2

    new-array p3, p2, [I

    invoke-virtual {p4, p3}, Landroid/view/View;->getLocationOnScreen([I)V

    const/4 p5, 0x0

    aget p3, p3, p5

    iget-object p5, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->popContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {p5}, Landroid/widget/RelativeLayout;->getHeight()I

    move-result p5

    invoke-virtual {p4}, Landroid/view/View;->getHeight()I

    move-result v0

    div-int/2addr v0, p2

    add-int/2addr p5, v0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0189

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    div-int/2addr p1, p2

    add-int/2addr p3, p1

    div-int/2addr v0, p2

    sub-int/2addr p3, v0

    sub-int/2addr p5, v0

    sget-object p1, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "coordinateY:"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->bubbleEditMimojiPresenter:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    invoke-virtual {p1, p3, p5, p4}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->processBubbleAni(IILandroid/view/View;)V

    return-void

    :cond_0
    return-void
.end method

.method public refreshMimojiList()I
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->TAG:Ljava/lang/String;

    const-string v1, "refreshMimojiList"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->filelistToMinojiInfo()V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->updateSelect()V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x4

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveBase;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xe2

    invoke-virtual {p1, v0, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    return-void
.end method

.method public setAvatarAndSelect(Ljava/lang/String;Lcom/android/camera/fragment/mimoji/MimojiInfo;)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mNoneSelectItemView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-static {p1}, Lcom/android/camera/CameraSettings;->setCurrentMimojiState(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->updateSelect()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xd9

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;

    if-eqz p1, :cond_0

    invoke-interface {p1, p2}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->onMimojiSelect(Lcom/android/camera/fragment/mimoji/MimojiInfo;)V

    :cond_0
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveBase;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->bubbleEditMimojiPresenter:Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    const/4 v0, -0x2

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v0, v1}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->processBubbleAni(IILandroid/view/View;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xe2

    invoke-virtual {p1, v0, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    return-void
.end method
