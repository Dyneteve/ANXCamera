.class public Landroid/support/v4/media/subtitle/SubtitleController;
.super Ljava/lang/Object;
.source "SubtitleController.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0x1c
.end annotation

.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/subtitle/SubtitleController$Listener;,
        Landroid/support/v4/media/subtitle/SubtitleController$Anchor;,
        Landroid/support/v4/media/subtitle/SubtitleController$Renderer;,
        Landroid/support/v4/media/subtitle/SubtitleController$MediaFormatUtil;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final WHAT_HIDE:I = 0x2

.field private static final WHAT_SELECT_DEFAULT_TRACK:I = 0x4

.field private static final WHAT_SELECT_TRACK:I = 0x3

.field private static final WHAT_SHOW:I = 0x1


# instance fields
.field private mAnchor:Landroid/support/v4/media/subtitle/SubtitleController$Anchor;

.field private final mCallback:Landroid/os/Handler$Callback;

.field private mCaptioningChangeListener:Landroid/view/accessibility/CaptioningManager$CaptioningChangeListener;

.field private mCaptioningManager:Landroid/view/accessibility/CaptioningManager;

.field private mHandler:Landroid/os/Handler;

.field private mListener:Landroid/support/v4/media/subtitle/SubtitleController$Listener;

.field private mRenderers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/media/subtitle/SubtitleController$Renderer;",
            ">;"
        }
    .end annotation
.end field

.field private final mRenderersLock:Ljava/lang/Object;

.field private mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

.field private mShowing:Z

.field private mTimeProvider:Landroid/support/v4/media/subtitle/MediaTimeProvider;

.field private mTrackIsExplicit:Z

.field private mTracks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/media/subtitle/SubtitleTrack;",
            ">;"
        }
    .end annotation
.end field

.field private final mTracksLock:Ljava/lang/Object;

.field private mVisibilityIsExplicit:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v0}, Landroid/support/v4/media/subtitle/SubtitleController;-><init>(Landroid/content/Context;Landroid/support/v4/media/subtitle/MediaTimeProvider;Landroid/support/v4/media/subtitle/SubtitleController$Listener;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/support/v4/media/subtitle/MediaTimeProvider;Landroid/support/v4/media/subtitle/SubtitleController$Listener;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mRenderersLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mTracksLock:Ljava/lang/Object;

    new-instance v0, Landroid/support/v4/media/subtitle/SubtitleController$1;

    invoke-direct {v0, p0}, Landroid/support/v4/media/subtitle/SubtitleController$1;-><init>(Landroid/support/v4/media/subtitle/SubtitleController;)V

    iput-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mCallback:Landroid/os/Handler$Callback;

    new-instance v0, Landroid/support/v4/media/subtitle/SubtitleController$2;

    invoke-direct {v0, p0}, Landroid/support/v4/media/subtitle/SubtitleController$2;-><init>(Landroid/support/v4/media/subtitle/SubtitleController;)V

    iput-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mCaptioningChangeListener:Landroid/view/accessibility/CaptioningManager$CaptioningChangeListener;

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mTrackIsExplicit:Z

    iput-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mVisibilityIsExplicit:Z

    iput-object p2, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mTimeProvider:Landroid/support/v4/media/subtitle/MediaTimeProvider;

    iput-object p3, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mListener:Landroid/support/v4/media/subtitle/SubtitleController$Listener;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mRenderers:Ljava/util/ArrayList;

    iput-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mShowing:Z

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mTracks:Ljava/util/ArrayList;

    const-string p2, "captioning"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/accessibility/CaptioningManager;

    iput-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mCaptioningManager:Landroid/view/accessibility/CaptioningManager;

    return-void
.end method

.method static synthetic access$000(Landroid/support/v4/media/subtitle/SubtitleController;)V
    .locals 0

    invoke-direct {p0}, Landroid/support/v4/media/subtitle/SubtitleController;->doShow()V

    return-void
.end method

.method static synthetic access$100(Landroid/support/v4/media/subtitle/SubtitleController;)V
    .locals 0

    invoke-direct {p0}, Landroid/support/v4/media/subtitle/SubtitleController;->doHide()V

    return-void
.end method

.method static synthetic access$200(Landroid/support/v4/media/subtitle/SubtitleController;Landroid/support/v4/media/subtitle/SubtitleTrack;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/SubtitleController;->doSelectTrack(Landroid/support/v4/media/subtitle/SubtitleTrack;)V

    return-void
.end method

.method static synthetic access$300(Landroid/support/v4/media/subtitle/SubtitleController;)V
    .locals 0

    invoke-direct {p0}, Landroid/support/v4/media/subtitle/SubtitleController;->doSelectDefaultTrack()V

    return-void
.end method

.method private checkAnchorLooper()V
    .locals 0

    nop

    nop

    return-void
.end method

.method private doHide()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mVisibilityIsExplicit:Z

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

    invoke-virtual {v0}, Landroid/support/v4/media/subtitle/SubtitleTrack;->hide()V

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mShowing:Z

    return-void
.end method

.method private doSelectDefaultTrack()V
    .locals 3

    iget-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mTrackIsExplicit:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mVisibilityIsExplicit:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mCaptioningManager:Landroid/view/accessibility/CaptioningManager;

    invoke-virtual {v0}, Landroid/view/accessibility/CaptioningManager;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

    invoke-virtual {v0}, Landroid/support/v4/media/subtitle/SubtitleTrack;->getFormat()Landroid/media/MediaFormat;

    move-result-object v0

    const-string v2, "is-forced-subtitle"

    invoke-static {v0, v2, v1}, Landroid/support/v4/media/subtitle/SubtitleController$MediaFormatUtil;->getInteger(Landroid/media/MediaFormat;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

    invoke-virtual {v0}, Landroid/support/v4/media/subtitle/SubtitleTrack;->getTrackType()I

    move-result v0

    const/4 v2, 0x4

    if-ne v0, v2, :cond_3

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleController;->hide()V

    goto :goto_1

    :cond_2
    :goto_0
    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleController;->show()V

    :cond_3
    :goto_1
    iput-boolean v1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mVisibilityIsExplicit:Z

    :cond_4
    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleController;->getDefaultTrack()Landroid/support/v4/media/subtitle/SubtitleTrack;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {p0, v0}, Landroid/support/v4/media/subtitle/SubtitleController;->selectTrack(Landroid/support/v4/media/subtitle/SubtitleTrack;)Z

    iput-boolean v1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mTrackIsExplicit:Z

    iget-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mVisibilityIsExplicit:Z

    if-nez v0, :cond_5

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleController;->show()V

    iput-boolean v1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mVisibilityIsExplicit:Z

    :cond_5
    return-void
.end method

.method private doSelectTrack(Landroid/support/v4/media/subtitle/SubtitleTrack;)V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mTrackIsExplicit:Z

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

    invoke-virtual {v0}, Landroid/support/v4/media/subtitle/SubtitleTrack;->hide()V

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/media/subtitle/SubtitleTrack;->setTimeProvider(Landroid/support/v4/media/subtitle/MediaTimeProvider;)V

    :cond_1
    iput-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mAnchor:Landroid/support/v4/media/subtitle/SubtitleController$Anchor;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mAnchor:Landroid/support/v4/media/subtitle/SubtitleController$Anchor;

    invoke-direct {p0}, Landroid/support/v4/media/subtitle/SubtitleController;->getRenderingWidget()Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/support/v4/media/subtitle/SubtitleController$Anchor;->setSubtitleWidget(Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget;)V

    :cond_2
    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

    iget-object v1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mTimeProvider:Landroid/support/v4/media/subtitle/MediaTimeProvider;

    invoke-virtual {v0, v1}, Landroid/support/v4/media/subtitle/SubtitleTrack;->setTimeProvider(Landroid/support/v4/media/subtitle/MediaTimeProvider;)V

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

    invoke-virtual {v0}, Landroid/support/v4/media/subtitle/SubtitleTrack;->show()V

    :cond_3
    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mListener:Landroid/support/v4/media/subtitle/SubtitleController$Listener;

    if-eqz v0, :cond_4

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mListener:Landroid/support/v4/media/subtitle/SubtitleController$Listener;

    invoke-interface {v0, p1}, Landroid/support/v4/media/subtitle/SubtitleController$Listener;->onSubtitleTrackSelected(Landroid/support/v4/media/subtitle/SubtitleTrack;)V

    :cond_4
    return-void
.end method

.method private doShow()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mShowing:Z

    iput-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mVisibilityIsExplicit:Z

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

    invoke-virtual {v0}, Landroid/support/v4/media/subtitle/SubtitleTrack;->show()V

    :cond_0
    return-void
.end method

.method private getRenderingWidget()Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

    invoke-virtual {v0}, Landroid/support/v4/media/subtitle/SubtitleTrack;->getRenderingWidget()Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget;

    move-result-object v0

    return-object v0
.end method

.method private processOnAnchor(Landroid/os/Message;)V
    .locals 2

    nop

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->dispatchMessage(Landroid/os/Message;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :goto_0
    return-void
.end method


# virtual methods
.method public addTrack(Landroid/media/MediaFormat;)Landroid/support/v4/media/subtitle/SubtitleTrack;
    .locals 4

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mRenderersLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mRenderers:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/media/subtitle/SubtitleController$Renderer;

    invoke-virtual {v2, p1}, Landroid/support/v4/media/subtitle/SubtitleController$Renderer;->supports(Landroid/media/MediaFormat;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2, p1}, Landroid/support/v4/media/subtitle/SubtitleController$Renderer;->createTrack(Landroid/media/MediaFormat;)Landroid/support/v4/media/subtitle/SubtitleTrack;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mTracksLock:Ljava/lang/Object;

    monitor-enter p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mTracks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mCaptioningManager:Landroid/view/accessibility/CaptioningManager;

    iget-object v3, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mCaptioningChangeListener:Landroid/view/accessibility/CaptioningManager$CaptioningChangeListener;

    invoke-virtual {v1, v3}, Landroid/view/accessibility/CaptioningManager;->addCaptioningChangeListener(Landroid/view/accessibility/CaptioningManager$CaptioningChangeListener;)V

    :cond_0
    iget-object v1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mTracks:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    return-object v2

    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v1

    :cond_1
    goto :goto_0

    :cond_2
    monitor-exit v0

    const/4 p1, 0x0

    return-object p1

    :catchall_1
    move-exception p1

    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw p1
.end method

.method protected finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mCaptioningManager:Landroid/view/accessibility/CaptioningManager;

    iget-object v1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mCaptioningChangeListener:Landroid/view/accessibility/CaptioningManager$CaptioningChangeListener;

    invoke-virtual {v0, v1}, Landroid/view/accessibility/CaptioningManager;->removeCaptioningChangeListener(Landroid/view/accessibility/CaptioningManager$CaptioningChangeListener;)V

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method public getDefaultTrack()Landroid/support/v4/media/subtitle/SubtitleTrack;
    .locals 16

    move-object/from16 v0, p0

    nop

    iget-object v1, v0, Landroid/support/v4/media/subtitle/SubtitleController;->mCaptioningManager:Landroid/view/accessibility/CaptioningManager;

    invoke-virtual {v1}, Landroid/view/accessibility/CaptioningManager;->getLocale()Ljava/util/Locale;

    move-result-object v1

    nop

    if-nez v1, :cond_0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    goto :goto_0

    :cond_0
    move-object v2, v1

    :goto_0
    iget-object v3, v0, Landroid/support/v4/media/subtitle/SubtitleController;->mCaptioningManager:Landroid/view/accessibility/CaptioningManager;

    invoke-virtual {v3}, Landroid/view/accessibility/CaptioningManager;->isEnabled()Z

    move-result v3

    const/4 v4, 0x1

    xor-int/2addr v3, v4

    iget-object v5, v0, Landroid/support/v4/media/subtitle/SubtitleController;->mTracksLock:Ljava/lang/Object;

    monitor-enter v5

    :try_start_0
    iget-object v0, v0, Landroid/support/v4/media/subtitle/SubtitleController;->mTracks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v6, 0x0

    const/4 v7, -0x1

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/support/v4/media/subtitle/SubtitleTrack;

    invoke-virtual {v8}, Landroid/support/v4/media/subtitle/SubtitleTrack;->getFormat()Landroid/media/MediaFormat;

    move-result-object v9

    const-string v10, "language"

    invoke-virtual {v9, v10}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "is-forced-subtitle"

    const/4 v12, 0x0

    invoke-static {v9, v11, v12}, Landroid/support/v4/media/subtitle/SubtitleController$MediaFormatUtil;->getInteger(Landroid/media/MediaFormat;Ljava/lang/String;I)I

    move-result v11

    if-eqz v11, :cond_1

    move v11, v4

    goto :goto_2

    :cond_1
    nop

    move v11, v12

    :goto_2
    const-string v13, "is-autoselect"

    invoke-static {v9, v13, v4}, Landroid/support/v4/media/subtitle/SubtitleController$MediaFormatUtil;->getInteger(Landroid/media/MediaFormat;Ljava/lang/String;I)I

    move-result v13

    if-eqz v13, :cond_2

    move v13, v4

    goto :goto_3

    :cond_2
    nop

    move v13, v12

    :goto_3
    const-string v14, "is-default"

    invoke-static {v9, v14, v12}, Landroid/support/v4/media/subtitle/SubtitleController$MediaFormatUtil;->getInteger(Landroid/media/MediaFormat;Ljava/lang/String;I)I

    move-result v9

    if-eqz v9, :cond_3

    move v9, v4

    goto :goto_4

    :cond_3
    nop

    move v9, v12

    :goto_4
    if-eqz v2, :cond_5

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v14

    const-string v15, ""

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_5

    invoke-virtual {v2}, Ljava/util/Locale;->getISO3Language()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_5

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    goto :goto_5

    :cond_4
    move v10, v12

    goto :goto_6

    :cond_5
    :goto_5
    nop

    move v10, v4

    :goto_6
    if-eqz v11, :cond_6

    move v14, v12

    goto :goto_7

    :cond_6
    const/16 v14, 0x8

    :goto_7
    if-nez v1, :cond_7

    if-eqz v9, :cond_7

    const/4 v15, 0x4

    goto :goto_8

    :cond_7
    move v15, v12

    :goto_8
    add-int/2addr v14, v15

    if-eqz v13, :cond_8

    goto :goto_9

    :cond_8
    const/4 v12, 0x2

    :goto_9
    add-int/2addr v14, v12

    add-int/2addr v14, v10

    if-eqz v3, :cond_9

    if-nez v11, :cond_9

    goto :goto_1

    :cond_9
    if-nez v1, :cond_a

    if-nez v9, :cond_b

    :cond_a
    if-eqz v10, :cond_c

    if-nez v13, :cond_b

    if-nez v11, :cond_b

    if-eqz v1, :cond_c

    :cond_b
    if-le v14, v7, :cond_c

    nop

    nop

    move-object v6, v8

    move v7, v14

    :cond_c
    goto/16 :goto_1

    :cond_d
    monitor-exit v5

    return-object v6

    :catchall_0
    move-exception v0

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getSelectedTrack()Landroid/support/v4/media/subtitle/SubtitleTrack;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mSelectedTrack:Landroid/support/v4/media/subtitle/SubtitleTrack;

    return-object v0
.end method

.method public getTracks()[Landroid/support/v4/media/subtitle/SubtitleTrack;
    .locals 3

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mTracksLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mTracks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Landroid/support/v4/media/subtitle/SubtitleTrack;

    iget-object v2, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mTracks:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public hasRendererFor(Landroid/media/MediaFormat;)Z
    .locals 3

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mRenderersLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mRenderers:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/media/subtitle/SubtitleController$Renderer;

    invoke-virtual {v2, p1}, Landroid/support/v4/media/subtitle/SubtitleController$Renderer;->supports(Landroid/media/MediaFormat;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 p1, 0x1

    monitor-exit v0

    return p1

    :cond_0
    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public hide()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/support/v4/media/subtitle/SubtitleController;->processOnAnchor(Landroid/os/Message;)V

    return-void
.end method

.method public registerRenderer(Landroid/support/v4/media/subtitle/SubtitleController$Renderer;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mRenderersLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mRenderers:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mRenderers:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public reset()V
    .locals 2

    invoke-direct {p0}, Landroid/support/v4/media/subtitle/SubtitleController;->checkAnchorLooper()V

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleController;->hide()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v4/media/subtitle/SubtitleController;->selectTrack(Landroid/support/v4/media/subtitle/SubtitleTrack;)Z

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mTracks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mTrackIsExplicit:Z

    iput-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mVisibilityIsExplicit:Z

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mCaptioningManager:Landroid/view/accessibility/CaptioningManager;

    iget-object v1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mCaptioningChangeListener:Landroid/view/accessibility/CaptioningManager$CaptioningChangeListener;

    invoke-virtual {v0, v1}, Landroid/view/accessibility/CaptioningManager;->removeCaptioningChangeListener(Landroid/view/accessibility/CaptioningManager$CaptioningChangeListener;)V

    return-void
.end method

.method public selectDefaultTrack()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/support/v4/media/subtitle/SubtitleController;->processOnAnchor(Landroid/os/Message;)V

    return-void
.end method

.method public selectTrack(Landroid/support/v4/media/subtitle/SubtitleTrack;)Z
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mTracks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/SubtitleController;->processOnAnchor(Landroid/os/Message;)V

    const/4 p1, 0x1

    return p1
.end method

.method public setAnchor(Landroid/support/v4/media/subtitle/SubtitleController$Anchor;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mAnchor:Landroid/support/v4/media/subtitle/SubtitleController$Anchor;

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mAnchor:Landroid/support/v4/media/subtitle/SubtitleController$Anchor;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Landroid/support/v4/media/subtitle/SubtitleController;->checkAnchorLooper()V

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mAnchor:Landroid/support/v4/media/subtitle/SubtitleController$Anchor;

    invoke-interface {v0, v1}, Landroid/support/v4/media/subtitle/SubtitleController$Anchor;->setSubtitleWidget(Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget;)V

    :cond_1
    iput-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mAnchor:Landroid/support/v4/media/subtitle/SubtitleController$Anchor;

    iput-object v1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mHandler:Landroid/os/Handler;

    iget-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mAnchor:Landroid/support/v4/media/subtitle/SubtitleController$Anchor;

    if-eqz p1, :cond_2

    new-instance p1, Landroid/os/Handler;

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mAnchor:Landroid/support/v4/media/subtitle/SubtitleController$Anchor;

    invoke-interface {v0}, Landroid/support/v4/media/subtitle/SubtitleController$Anchor;->getSubtitleLooper()Landroid/os/Looper;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mCallback:Landroid/os/Handler$Callback;

    invoke-direct {p1, v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mHandler:Landroid/os/Handler;

    invoke-direct {p0}, Landroid/support/v4/media/subtitle/SubtitleController;->checkAnchorLooper()V

    iget-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mAnchor:Landroid/support/v4/media/subtitle/SubtitleController$Anchor;

    invoke-direct {p0}, Landroid/support/v4/media/subtitle/SubtitleController;->getRenderingWidget()Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/support/v4/media/subtitle/SubtitleController$Anchor;->setSubtitleWidget(Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget;)V

    :cond_2
    return-void
.end method

.method public show()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleController;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/support/v4/media/subtitle/SubtitleController;->processOnAnchor(Landroid/os/Message;)V

    return-void
.end method
