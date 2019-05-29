.class public Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentMimojiEdit.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnTouchListener;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;
.implements Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;


# static fields
.field private static final EDIT_ABANDON:I = 0x4

.field private static final EDIT_ABANDON_CAPTURE:I = 0x3

.field private static final EDIT_BACK:I = 0x1

.field private static final EDIT_CANCEL:I = 0x5

.field private static final EDIT_RECAPTURE:I = 0x2

.field private static final EDIT_STATE_STEP1:I = 0x1

.field private static final EDIT_STATE_STEP2_1:I = 0x2

.field private static final EDIT_STATE_STEP2_2:I = 0x4

.field private static final EDIT_STATE_STEP3:I = 0x3

.field private static final FRAGMENT_INFO:I = 0xfff1

.field private static final FROM_ALL_PROCESS:I = 0x69

.field public static final TAG:Ljava/lang/String;

.field private static final TEMPDATA:Ljava/lang/String;


# instance fields
.field private fromTag:I

.field private mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

.field private mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

.field private mBackTextView:Landroid/widget/TextView;

.field private mConfirmTextView:Landroid/widget/TextView;

.field private mContext:Landroid/content/Context;

.field private mCurrentAlertDialog:Landroid/app/AlertDialog;

.field private mCurrentConfigPath:Ljava/lang/String;

.field private mCurrentTopPannelState:I

.field private mEditLevelListAdapter:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

.field private mEditState:Z

.field private mEditTextView:Landroid/widget/TextView;

.field private mEnterFromMimoji:Z

.field private mHandler:Landroid/os/Handler;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "HandlerLeak"
        }
    .end annotation
.end field

.field private mIsChangeCamera:Z

.field private mIsStartEdit:Z

.field private mLevelRecyleView:Landroid/support/v7/widget/RecyclerView;

.field private mMimojiConfigAdjustLayout:Landroid/view/View;

.field private mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

.field private mMimojiEditViewLayout:Landroid/view/View;

.field private mMimojiEditViewStub:Landroid/view/ViewStub;

.field private mMimojiTypeAdapter:Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;

.field private mMimojiTypeSelectView:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

.field private mOperateSelectLayout:Landroid/view/View;

.field private mPopSaveDeletePath:Ljava/lang/String;

.field private mReCaptureTextView:Landroid/widget/TextView;

.field private mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

.field private mSaveTextView:Landroid/widget/TextView;


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

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditState:Z

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEnterFromMimoji:Z

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mIsChangeCamera:Z

    const-string v0, ""

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mCurrentConfigPath:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mPopSaveDeletePath:Ljava/lang/String;

    new-instance v0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$4;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$4;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)V

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/android/camera/ui/MimojiEditGLSurfaceView;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mIsStartEdit:Z

    return p0
.end method

.method static synthetic access$1200(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEnterFromMimoji:Z

    return p0
.end method

.method static synthetic access$1300(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mCurrentConfigPath:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$202(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditState:Z

    return p1
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->fromTag:I

    return p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/arcsoft/avatar/AvatarEngine;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mCurrentTopPannelState:I

    return p0
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mPopSaveDeletePath:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$700(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;ZZ)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->goBack(ZZ)V

    return-void
.end method

.method static synthetic access$800(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditLevelListAdapter:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    return-object p0
.end method

.method static synthetic access$900(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mContext:Landroid/content/Context;

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

    xor-int/lit8 v1, p1, 0x1

    invoke-interface {v0, p2, v1}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->backToPreview(ZZ)V

    if-eqz p1, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->onMimojiCreate()V

    :cond_0
    if-eqz p2, :cond_1

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 p2, 0xe2

    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MimojiAlert;

    if-eqz p1, :cond_1

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$MimojiAlert;->refreshMimojiList()V

    :cond_1
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEnterFromMimoji:Z

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mIsStartEdit:Z

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    if-eqz p2, :cond_2

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

    new-instance p2, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$7;

    invoke-direct {p2, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$7;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)V

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mRenderThread:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->quit()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    sget-object p2, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    return-void
.end method

.method private initConfigList()V
    .locals 8

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

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeAdapter:Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeAdapter:Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;->getItemCount()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigTypeList()Ljava/util/ArrayList;

    move-result-object v0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->queryAvatar()Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v4

    iget v5, v3, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;->configType:I

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getASAvatarConfigValue()Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;

    move-result-object v6

    iget v6, v6, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->gender:I

    invoke-virtual {v4, v5, v6}, Lcom/arcsoft/avatar/AvatarEngine;->getConfig(II)Ljava/util/ArrayList;

    move-result-object v4

    sget-object v5, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "putConfigList:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, v3, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;->configTypeDesc:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, v3, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;->configType:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v5

    iget v6, v3, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;->configType:I

    invoke-virtual {v5, v6, v4}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->putConfigList(ILjava/util/ArrayList;)V

    iget v4, v3, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;->configType:I

    invoke-static {v4}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->filterTypeTitle(I)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_1

    :cond_1
    new-instance v4, Lcom/android/camera/fragment/mimoji/MimojiTypeBean;

    invoke-direct {v4}, Lcom/android/camera/fragment/mimoji/MimojiTypeBean;-><init>()V

    invoke-virtual {v4, v1}, Lcom/android/camera/fragment/mimoji/MimojiTypeBean;->setAlpha(I)V

    invoke-virtual {v4, v3}, Lcom/android/camera/fragment/mimoji/MimojiTypeBean;->setASAvatarConfigType(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;)V

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeAdapter:Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;

    invoke-virtual {v0, v2}, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;->setDataList(Ljava/util/ArrayList;)V

    goto :goto_3

    :cond_3
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeAdapter:Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;->getLastSelectPosition()I

    move-result v0

    if-gez v0, :cond_4

    nop

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->moveToPosition(I)V

    move v0, v1

    goto :goto_2

    :cond_4
    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeAdapter:Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;

    invoke-virtual {v1, v0}, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;->onSelectedPositionFinish(I)V

    :goto_2
    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeAdapter:Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;->updateDataAlpha(II)V

    :cond_5
    :goto_3
    return-void
.end method

.method private initMimojiEdit(Landroid/view/View;)V
    .locals 5

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

    const v1, 0x7f0d00af

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

    check-cast v1, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-virtual {v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    if-nez v1, :cond_0

    new-instance v1, Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-virtual {v3, v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    const/16 v3, 0xa

    invoke-virtual {v1, v3}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->setItemViewCacheSize(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-virtual {v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->getItemAnimator()Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    move-result-object v1

    const-wide/16 v3, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setChangeDuration(J)V

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    const/4 v3, 0x5

    invoke-virtual {v1, v3}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->setItemPageCount(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->setInitPosition(I)V

    :cond_0
    new-instance v1, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;-><init>(Ljava/util/ArrayList;)V

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeAdapter:Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeAdapter:Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;

    new-instance v2, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$2;

    invoke-direct {v2, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$2;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)V

    invoke-virtual {v1, v2}, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;->setOnSelectListener(Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$OnSelectListener;)V

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeAdapter:Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    const v1, 0x7f0d00b6

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mLevelRecyleView:Landroid/support/v7/widget/RecyclerView;

    new-instance p1, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mContext:Landroid/content/Context;

    const-string v2, "color_level"

    invoke-direct {p1, v1, v2}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->setOrientation(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mLevelRecyleView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    new-instance p1, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$3;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$3;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)V

    invoke-direct {p1, v0, v1}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;-><init>(Landroid/content/Context;Lcom/android/camera/fragment/mimoji/ItfGvOnItemClickListener;)V

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditLevelListAdapter:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mLevelRecyleView:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditLevelListAdapter:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

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

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    sget-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->loadColorValue(Ljava/lang/String;)I

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

    const v1, 0x3f59999a    # 0.85f

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

.method private showAlertDialog(I)V
    .locals 3

    nop

    const/4 v0, -0x1

    packed-switch p1, :pswitch_data_0

    move v1, v0

    goto :goto_0

    :pswitch_0
    const v1, 0x7f09035a

    goto :goto_0

    :pswitch_1
    const v1, 0x7f090358

    goto :goto_0

    :pswitch_2
    const v1, 0x7f090359

    goto :goto_0

    :pswitch_3
    const v1, 0x7f090356

    goto :goto_0

    :pswitch_4
    const v1, 0x7f090357

    nop

    :goto_0
    if-ne v1, v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    const v1, 0x7f090362

    new-instance v2, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;

    invoke-direct {v2, p0, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const p1, 0x7f09035e

    new-instance v1, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$6;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$6;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)V

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mCurrentAlertDialog:Landroid/app/AlertDialog;

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public directlyEnterEditMode(Lcom/android/camera/fragment/mimoji/MimojiInfo;I)V
    .locals 3

    sget-object v0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "configPath = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mCurrentConfigPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mPackPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mPopSaveDeletePath:Ljava/lang/String;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mCurrentConfigPath:Ljava/lang/String;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEnterFromMimoji:Z

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mIsStartEdit:Z

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object v0

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_EIDT:I

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setMode(I)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->forceSwitchFront()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mIsChangeCamera:Z

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->startMimojiEdit()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd9

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;

    if-eqz v0, :cond_1

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->setDisableSingleTapUp(Z)V

    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    const/4 v1, 0x2

    new-array v2, v1, [I

    fill-array-data v2, :array_0

    invoke-interface {v0, p1, v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->disableMenuItem(Z[I)V

    const/16 p1, 0x65

    if-ne p1, p2, :cond_2

    iput p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->fromTag:I

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->updateTitleState(I)V

    goto :goto_0

    :cond_2
    const/16 p1, 0x69

    iput p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->fromTag:I

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->updateTitleState(I)V

    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mOperateSelectLayout:Landroid/view/View;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiConfigAdjustLayout:Landroid/view/View;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setNeedRenderBG(Z)V

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->initConfigList()V

    return-void

    nop

    :array_0
    .array-data 4
        0xe1
        0xc1
    .end array-data
.end method

.method public getFragmentInto()I
    .locals 1

    const v0, 0xfff1

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    const v0, 0x7f04001f

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getActivity()Landroid/support/v4/app/FragmentActivity;

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
    .locals 2

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-boolean p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mIsStartEdit:Z

    if-eqz p1, :cond_1

    const/4 p1, 0x4

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->showAlertDialog(I)V

    return v0

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    const/16 v1, 0x8

    if-eq p1, v1, :cond_2

    const/4 p1, 0x3

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->showAlertDialog(I)V

    return v0

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x2

    sparse-switch p1, :sswitch_data_0

    goto :goto_1

    :sswitch_0
    invoke-direct {p0, v2}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->showAlertDialog(I)V

    goto :goto_1

    :sswitch_1
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    invoke-virtual {p1, v1}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setSaveConfigThum(Z)V

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->resetData()V

    goto :goto_1

    :sswitch_2
    iget p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->fromTag:I

    const/16 v3, 0x65

    if-ne p1, v3, :cond_0

    const/4 p1, 0x5

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->showAlertDialog(I)V

    goto :goto_1

    :cond_0
    iget-boolean p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditState:Z

    if-eqz p1, :cond_2

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditState:Z

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->updateTitleState(I)V

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->resetData()V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEnterFromMimoji:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mCurrentConfigPath:Ljava/lang/String;

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TempOriginalConfigPath:Ljava/lang/String;

    :goto_0
    invoke-virtual {p1, v0}, Lcom/arcsoft/avatar/AvatarEngine;->loadConfig(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->showAlertDialog(I)V

    goto :goto_1

    :sswitch_3
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setNeedRenderBG(Z)V

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->updateTitleState(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mOperateSelectLayout:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiConfigAdjustLayout:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->initConfigList()V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object p1

    sget v0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_EIDT:I

    invoke-virtual {p1, v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setMode(I)V

    iput-boolean v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mIsStartEdit:Z

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

    iget-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mIsStartEdit:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditState:Z

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

    const v1, 0x7f0201f5

    const v2, 0x7f0201f8

    const v3, 0x7f0b0041

    const/4 v4, 0x1

    const v5, 0x7f0b0043

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

    const v0, 0x7f0201f7

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

    const v0, 0x7f0201f6

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

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_1

    const/4 p1, 0x3

    if-ne p3, p1, :cond_1

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

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mCurrentAlertDialog:Landroid/app/AlertDialog;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mCurrentAlertDialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    :cond_0
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

    :cond_1
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

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->requestRender()V

    :cond_0
    return-void
.end method

.method public resetConfig()V
    .locals 3

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->queryAvatar()Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->startMimojiEdit()V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setupAvatar()V

    iget-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mIsChangeCamera:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mIsChangeCamera:Z

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mCurrentConfigPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/arcsoft/avatar/AvatarEngine;->loadConfig(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setStopRender(Z)V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-boolean v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mIsStartEdit:Z

    if-eqz v1, :cond_2

    sget-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TempEditConfigPath:Ljava/lang/String;

    goto :goto_0

    :cond_2
    sget-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TempOriginalConfigPath:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->loadConfig(Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method public startMimojiEdit()V
    .locals 3

    sget-object v0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    const-string v1, "startMimojiEdit"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewStub:Landroid/view/ViewStub;

    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->initMimojiEdit(Landroid/view/View;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->setupAvatar()V

    :goto_0
    const/16 v0, 0x69

    iput v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->fromTag:I

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xa0

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getAnimationComposite()Lcom/android/camera/animation/AnimationComposite;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getFragmentInto()I

    move-result v2

    invoke-virtual {v0, v2, p0}, Lcom/android/camera/animation/AnimationComposite;->put(ILcom/android/camera/animation/AnimationDelegate$AnimationResource;)V

    iget-boolean v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEnterFromMimoji:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setNeedRenderBG(Z)V

    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$1;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

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

    const v0, 0x7f090361

    const v1, 0x7f090364

    const v2, 0x7f0b0041

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    const/4 p1, 0x4

    iput p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mCurrentTopPannelState:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-virtual {p1, v4}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setClickable(Z)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f09035e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setClickable(Z)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_0

    :pswitch_1
    const/4 p1, 0x3

    iput p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mCurrentTopPannelState:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-virtual {p1, v4}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setClickable(Z)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setClickable(Z)V

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

    :pswitch_2
    const/4 p1, 0x2

    iput p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mCurrentTopPannelState:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-virtual {p1, v4}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0b0044

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

    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setClickable(Z)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    :pswitch_3
    iput v3, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mCurrentTopPannelState:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090360

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setClickable(Z)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mIsStartEdit:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->setVisibility(I)V

    :cond_0
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
