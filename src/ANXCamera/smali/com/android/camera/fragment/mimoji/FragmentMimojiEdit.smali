.class public Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentMimojiEdit.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnTouchListener;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;
.implements Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;


# static fields
.field private static final EDIT_STATE_STEP1:I = 0x1

.field private static final EDIT_STATE_STEP2:I = 0x2

.field private static final EDIT_STATE_STEP3:I = 0x3

.field private static final FRAGMENT_INFO:I = 0xfff1

.field public static final TAG:Ljava/lang/String;

.field private static final TEMPDATA:Ljava/lang/String;


# instance fields
.field private editState:Z

.field private mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

.field private mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

.field private mBackTextView:Landroid/widget/TextView;

.field private mConfirmTextView:Landroid/widget/TextView;

.field private mContext:Landroid/content/Context;

.field private mCurrentConfigPath:Ljava/lang/String;

.field private mEditLevelListAdapter:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

.field private mEditTextView:Landroid/widget/TextView;

.field private mEnterFromMimoji:Z

.field private mHandler:Landroid/os/Handler;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "HandlerLeak"
        }
    .end annotation
.end field

.field private mIsGoBack:Z

.field private mIsStartEdit:Z

.field private mLevelRecyleView:Landroid/support/v7/widget/RecyclerView;

.field private mMimojiConfigAdjustLayout:Landroid/view/View;

.field private mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

.field private mMimojiEditViewLayout:Landroid/view/View;

.field private mMimojiEditViewStub:Landroid/view/ViewStub;

.field private mMimojiTypeSelectView:Lcom/android/camera/ui/MimojiTypeSelectView;

.field private mOperateSelectLayout:Landroid/view/View;

.field private mReCaptureTextView:Landroid/widget/TextView;

.field private mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

.field private mSaveTextView:Landroid/widget/TextView;

.field private mTipsTextView:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-class v0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/android/camera/fragment/mimoji/MimojiHelper;->CUSTOM_DIR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "temp.dat"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TEMPDATA:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->editState:Z

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEnterFromMimoji:Z

    const-string v0, ""

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mCurrentConfigPath:Ljava/lang/String;

    new-instance v0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$2;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)V

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->editState:Z

    return p0
.end method

.method static synthetic access$002(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->editState:Z

    return p1
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/arcsoft/avatar/AvatarEngine;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;ZZ)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->goBack(ZZ)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditLevelListAdapter:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    return-object p0
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/android/camera/ui/MimojiEditGLSurfaceView;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    return-object p0
.end method

.method private goBack(ZZ)V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd9

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;

    if-eqz v0, :cond_0

    invoke-interface {v0, p2}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->backToPreview(Z)V

    if-eqz p1, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->onMimojiCreate()V

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEnterFromMimoji:Z

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mIsStartEdit:Z

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    const/16 v0, 0x8

    invoke-virtual {p2, v0}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setVisibility(I)V

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiConfigAdjustLayout:Landroid/view/View;

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mOperateSelectLayout:Landroid/view/View;

    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->updateTitleState(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    new-instance p2, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;

    invoke-direct {p2, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)V

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->quit()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    sget-object p2, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    return-void
.end method

.method private initConfigList()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    iget-boolean v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEnterFromMimoji:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mCurrentConfigPath:Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TempOriginalConfigPath:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->initAvatar(Ljava/lang/String;)V

    new-instance v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;

    invoke-direct {v0}, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;-><init>()V

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {v1, v0}, Lcom/arcsoft/avatar/AvatarEngine;->getConfigValue(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;)V

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v1, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setASAvatarConfigValue(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getASAvatarConfigValue()Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;

    move-result-object v1

    iget v1, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->gender:I

    invoke-virtual {v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->getSupportConfigType(I)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v1, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setConfigTypeList(Ljava/util/ArrayList;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/MimojiTypeSelectView;

    invoke-virtual {v0}, Lcom/android/camera/ui/MimojiTypeSelectView;->init()V

    return-void
.end method

.method private initMimojiEdit(Landroid/view/View;)V
    .locals 4

    const v0, 0x7f0d00ab

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    invoke-virtual {v0, p0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0d00b3

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mReCaptureTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mReCaptureTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mReCaptureTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f0d0017

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f0d00b4

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mSaveTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mSaveTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mSaveTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f0d00ac

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0d00ad

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->updateTitleState(I)V

    const v1, 0x7f0d00ae

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setmHandler(Landroid/os/Handler;)V

    const v1, 0x7f0d00b2

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mOperateSelectLayout:Landroid/view/View;

    const v1, 0x7f0d00b5

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiConfigAdjustLayout:Landroid/view/View;

    const v1, 0x7f0d00b1

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/MimojiTypeSelectView;

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/MimojiTypeSelectView;

    const v1, 0x7f0d00b6

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView;

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mLevelRecyleView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mContext:Landroid/content/Context;

    const-string v3, "color_level"

    invoke-direct {v1, v2, v3}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->setOrientation(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mLevelRecyleView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    new-instance v0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mContext:Landroid/content/Context;

    new-instance v2, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$1;

    invoke-direct {v2, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$1;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)V

    invoke-direct {v0, v1, v2}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;-><init>(Landroid/content/Context;Lcom/android/camera/fragment/mimoji/ItfGvOnItemClickListener;)V

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditLevelListAdapter:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mLevelRecyleView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditLevelListAdapter:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    const v0, 0x7f0d00af

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mTipsTextView:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->setupAvatar()V

    return-void
.end method

.method private resetData()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->reset()V

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->resetData()V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditLevelListAdapter:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method private setupAvatar()V
    .locals 4

    sget-object v0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    const-string v1, "setup avatar"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->queryAvatar()Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEnterFromMimoji:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    sget-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->setTemplatePath(Ljava/lang/String;)V

    :cond_0
    new-instance v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;

    invoke-direct {v0}, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;-><init>()V

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {v1, v0}, Lcom/arcsoft/avatar/AvatarEngine;->getConfigValue(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;)V

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v1, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setASAvatarConfigValue(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;)V

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v1, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setASAvatarConfigValueDefault(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/arcsoft/avatar/AvatarEngine;->setRenderScene(ZF)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setStopRender(Z)V

    new-instance v0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    const-string v1, "MimojiEdit"

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mContext:Landroid/content/Context;

    const/16 v3, 0xc8

    invoke-direct {v0, v1, v3, v3, v2}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;-><init>(Ljava/lang/String;IILandroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->start()V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->waitUntilReady()V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->setUpdateHandler(Landroid/os/Handler;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditLevelListAdapter:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->setRenderThread(Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->initUpdatePara()V

    return-void
.end method

.method private showAlertDialog()V
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0902c6

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    new-instance v1, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$3;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$3;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)V

    const v2, 0x7f0902ca

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    new-instance v1, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$4;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$4;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)V

    const v2, 0x7f0902c7

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private showRecaptureDialog()V
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$6;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$6;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public directlyEnterEditMode(Ljava/lang/String;)V
    .locals 3

    sget-object v0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "configPath = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEnterFromMimoji:Z

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mCurrentConfigPath:Ljava/lang/String;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object p1

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_EIDT:I

    invoke-virtual {p1, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setMode(I)V

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->queryAvatar()Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->startMimojiEdit()V

    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->updateTitleState(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mOperateSelectLayout:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiConfigAdjustLayout:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->initConfigList()V

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mIsStartEdit:Z

    return-void
.end method

.method public getFragmentInto()I
    .locals 1

    const v0, 0xfff1

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    const v0, 0x7f04001e

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mContext:Landroid/content/Context;

    const v0, 0x7f0d0070

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewStub;

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewStub:Landroid/view/ViewStub;

    return-void
.end method

.method public onBackEvent(I)Z
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eq p1, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-boolean p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mIsStartEdit:Z

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->showAlertDialog()V

    return v1

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    const/16 v2, 0x8

    if-eq p1, v2, :cond_2

    invoke-direct {p0, v1, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->goBack(ZZ)V

    return v1

    :cond_2
    :goto_0
    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    sparse-switch p1, :sswitch_data_0

    goto :goto_1

    :sswitch_0
    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->showRecaptureDialog()V

    goto :goto_1

    :sswitch_1
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    invoke-virtual {p1, v2}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setSaveConfigThum(Z)V

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->resetData()V

    goto :goto_1

    :sswitch_2
    iget-boolean p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->editState:Z

    if-eqz p1, :cond_1

    iput-boolean v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->editState:Z

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->updateTitleState(I)V

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->resetData()V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEnterFromMimoji:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mCurrentConfigPath:Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TempOriginalConfigPath:Ljava/lang/String;

    :goto_0
    invoke-virtual {p1, v0}, Lcom/arcsoft/avatar/AvatarEngine;->loadConfig(Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    invoke-direct {p0, v2, v1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->goBack(ZZ)V

    goto :goto_1

    :sswitch_3
    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->updateTitleState(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mOperateSelectLayout:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiConfigAdjustLayout:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->initConfigList()V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object p1

    sget v0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_EIDT:I

    invoke-virtual {p1, v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setMode(I)V

    iput-boolean v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mIsStartEdit:Z

    nop

    :goto_1
    return-void

    :sswitch_data_0
    .sparse-switch
        0x7f0d0017 -> :sswitch_3
        0x7f0d00ac -> :sswitch_2
        0x7f0d00ad -> :sswitch_1
        0x7f0d00b3 -> :sswitch_0
        0x7f0d00b4 -> :sswitch_1
    .end sparse-switch
.end method

.method public onDeviceRotationChange(I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->onDeviceRotationChange(I)V

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 0

    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onResume()V

    return-void
.end method

.method public onStart()V
    .locals 1

    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onStart()V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->editState:Z

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->updateTitleState(I)V

    :cond_0
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 6

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0d0017

    const v1, 0x7f0201ec

    const v2, 0x7f0201ef

    const v3, 0x7f0b0041

    const/4 v4, 0x1

    const v5, 0x7f0b0042

    if-eq p1, v0, :cond_2

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mSaveTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0201ee

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mSaveTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_0

    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    if-ne p1, v4, :cond_4

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mSaveTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0201ed

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mSaveTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_0

    :pswitch_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mReCaptureTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mReCaptureTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    if-ne p1, v4, :cond_4

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mReCaptureTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mReCaptureTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    :cond_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    :cond_3
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    if-ne p1, v4, :cond_4

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_4
    :goto_0
    const/4 p1, 0x0

    return p1

    :pswitch_data_0
    .packed-switch 0x7f0d00b3
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onTypeConfigSelect(I)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setIsColorSelected(Z)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setSelectType(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->getIsRendering()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object p1

    const/4 v0, 0x6

    iput v0, p1, Landroid/os/Message;->what:I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->setStopRender(Z)V

    :goto_0
    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;I)V"
        }
    .end annotation

    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;I)V

    sget-object p1, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "provideAnimateElement, animateInElements"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, "resetType = "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x3

    if-ne p3, p1, :cond_0

    sget-object p1, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    const-string p2, "mimoji edit timeout"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    invoke-direct {p0, p1, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->goBack(ZZ)V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->reset()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 p2, 0xa0

    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getAnimationComposite()Lcom/android/camera/animation/AnimationComposite;

    move-result-object p1

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getFragmentInto()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/android/camera/animation/AnimationComposite;->remove(I)V

    :cond_0
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xe0

    invoke-virtual {p1, v0, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    return-void
.end method

.method public requestRender()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mIsGoBack:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->requestRender()V

    :cond_0
    return-void
.end method

.method public resetConfig()V
    .locals 1

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->queryAvatar()Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setupAvatar()V

    return-void
.end method

.method public showOrHideTips(Z)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mTipsTextView:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mTipsTextView:Landroid/widget/TextView;

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    goto :goto_0

    :cond_1
    const/4 p1, 0x4

    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method public startMimojiEdit()V
    .locals 2

    sget-object v0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    const-string v1, "startMimojiEdit"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewStub:Landroid/view/ViewStub;

    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->initMimojiEdit(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->setupAvatar()V

    :goto_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getAnimationComposite()Lcom/android/camera/animation/AnimationComposite;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getFragmentInto()I

    move-result v1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/animation/AnimationComposite;->put(ILcom/android/camera/animation/AnimationDelegate$AnimationResource;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    sget-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TempOriginalConfigPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->saveConfig(Ljava/lang/String;)I

    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xe0

    invoke-virtual {p1, v0, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    return-void
.end method

.method public updateTitleState(I)V
    .locals 7

    const v0, 0x7f0902c9

    const v1, 0x7f0902cc

    const/4 v2, 0x1

    const v3, 0x7f0b0041

    const/4 v4, 0x0

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/MimojiTypeSelectView;

    invoke-virtual {p1, v4}, Lcom/android/camera/ui/MimojiTypeSelectView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setClickable(Z)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setClickable(Z)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/MimojiTypeSelectView;

    invoke-virtual {p1, v4}, Lcom/android/camera/ui/MimojiTypeSelectView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0b007e

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {p1, v5}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setClickable(Z)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setClickable(Z)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0902c8

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setClickable(Z)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/MimojiTypeSelectView;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/MimojiTypeSelectView;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/MimojiTypeSelectView;->setVisibility(I)V

    :cond_0
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
