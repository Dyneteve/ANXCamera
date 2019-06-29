.class Landroid/support/v4/media/SessionPlaylistAgentImplBase;
.super Landroid/support/v4/media/MediaPlaylistAgent;
.source "SessionPlaylistAgentImplBase.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x13
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;,
        Landroid/support/v4/media/SessionPlaylistAgentImplBase$MyPlayerEventCallback;
    }
.end annotation


# static fields
.field static final END_OF_PLAYLIST:I = -0x1
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field

.field static final NO_VALID_ITEMS:I = -0x2
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field


# instance fields
.field private mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mDsmHelper:Landroid/support/v4/media/MediaSession2$OnDataSourceMissingHelper;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mEopPlayItem:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

.field private mItemDsdMap:Ljava/util/Map;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/support/v4/media/MediaItem2;",
            "Landroid/support/v4/media/DataSourceDesc;",
            ">;"
        }
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;

.field private mMetadata:Landroid/support/v4/media/MediaMetadata2;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mPlayer:Landroid/support/v4/media/BaseMediaPlayer;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mPlayerCallback:Landroid/support/v4/media/SessionPlaylistAgentImplBase$MyPlayerEventCallback;

.field private mPlaylist:Ljava/util/ArrayList;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/media/MediaItem2;",
            ">;"
        }
    .end annotation
.end field

.field private mRepeatMode:I
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mSession:Landroid/support/v4/media/MediaSession2ImplBase;

.field private mShuffleMode:I
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mShuffledList:Ljava/util/ArrayList;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/media/MediaItem2;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/support/v4/media/MediaSession2ImplBase;Landroid/support/v4/media/BaseMediaPlayer;)V
    .locals 3
    .param p1    # Landroid/support/v4/media/MediaSession2ImplBase;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/BaseMediaPlayer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Landroid/support/v4/media/MediaPlaylistAgent;-><init>()V

    new-instance v0, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    const/4 v1, 0x0

    const/4 v2, -0x1

    invoke-direct {v0, p0, v2, v1}, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;-><init>(Landroid/support/v4/media/SessionPlaylistAgentImplBase;ILandroid/support/v4/media/DataSourceDesc;)V

    iput-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mEopPlayItem:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlaylist:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffledList:Ljava/util/ArrayList;

    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mItemDsdMap:Ljava/util/Map;

    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    iput-object p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mSession:Landroid/support/v4/media/MediaSession2ImplBase;

    iput-object p2, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlayer:Landroid/support/v4/media/BaseMediaPlayer;

    new-instance p1, Landroid/support/v4/media/SessionPlaylistAgentImplBase$MyPlayerEventCallback;

    invoke-direct {p1, p0, v1}, Landroid/support/v4/media/SessionPlaylistAgentImplBase$MyPlayerEventCallback;-><init>(Landroid/support/v4/media/SessionPlaylistAgentImplBase;Landroid/support/v4/media/SessionPlaylistAgentImplBase$1;)V

    iput-object p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlayerCallback:Landroid/support/v4/media/SessionPlaylistAgentImplBase$MyPlayerEventCallback;

    iget-object p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlayer:Landroid/support/v4/media/BaseMediaPlayer;

    iget-object p2, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mSession:Landroid/support/v4/media/MediaSession2ImplBase;

    invoke-virtual {p2}, Landroid/support/v4/media/MediaSession2ImplBase;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object p2

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlayerCallback:Landroid/support/v4/media/SessionPlaylistAgentImplBase$MyPlayerEventCallback;

    invoke-virtual {p1, p2, v0}, Landroid/support/v4/media/BaseMediaPlayer;->registerPlayerEventCallback(Ljava/util/concurrent/Executor;Landroid/support/v4/media/BaseMediaPlayer$PlayerEventCallback;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "player shouldn\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "sessionImpl shouldn\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$000(Landroid/support/v4/media/SessionPlaylistAgentImplBase;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$100(Landroid/support/v4/media/SessionPlaylistAgentImplBase;)Landroid/support/v4/media/BaseMediaPlayer;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlayer:Landroid/support/v4/media/BaseMediaPlayer;

    return-object p0
.end method

.method static synthetic access$200(Landroid/support/v4/media/SessionPlaylistAgentImplBase;)Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    return-object p0
.end method

.method static synthetic access$202(Landroid/support/v4/media/SessionPlaylistAgentImplBase;Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;)Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    return-object p1
.end method

.method static synthetic access$300(Landroid/support/v4/media/SessionPlaylistAgentImplBase;II)Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->getNextValidPlayItemLocked(II)Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Landroid/support/v4/media/SessionPlaylistAgentImplBase;)V
    .locals 0

    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->updateCurrentIfNeededLocked()V

    return-void
.end method

.method static synthetic access$500(Landroid/support/v4/media/SessionPlaylistAgentImplBase;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffledList:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$600(Landroid/support/v4/media/SessionPlaylistAgentImplBase;Landroid/support/v4/media/MediaItem2;)Landroid/support/v4/media/DataSourceDesc;
    .locals 0

    invoke-direct {p0, p1}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->retrieveDataSourceDescLocked(Landroid/support/v4/media/MediaItem2;)Landroid/support/v4/media/DataSourceDesc;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700(Landroid/support/v4/media/SessionPlaylistAgentImplBase;)Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mEopPlayItem:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    return-object p0
.end method

.method private applyShuffleModeLocked()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffledList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffledList:Ljava/util/ArrayList;

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlaylist:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffleMode:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    iget v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffleMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffledList:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    :cond_1
    return-void
.end method

.method private static clamp(II)I
    .locals 0

    if-gez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    if-le p0, p1, :cond_1

    move p0, p1

    :cond_1
    return p0
.end method

.method private getNextValidPlayItemLocked(II)Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;
    .locals 5

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlaylist:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, -0x1

    if-ne p1, v1, :cond_1

    if-lez p2, :cond_0

    move p1, v1

    goto :goto_0

    :cond_0
    move p1, v0

    :cond_1
    :goto_0
    const/4 v1, 0x0

    move v2, p1

    move p1, v1

    :goto_1
    const/4 v3, 0x0

    if-ge p1, v0, :cond_8

    add-int/2addr v2, p2

    if-ltz v2, :cond_2

    iget-object v4, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlaylist:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v2, v4, :cond_6

    :cond_2
    iget v4, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mRepeatMode:I

    if-nez v4, :cond_4

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_3

    goto :goto_2

    :cond_3
    iget-object v3, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mEopPlayItem:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    :goto_2
    return-object v3

    :cond_4
    if-gez v2, :cond_5

    iget-object v2, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlaylist:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    goto :goto_3

    :cond_5
    move v2, v1

    :cond_6
    :goto_3
    iget-object v3, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffledList:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v4/media/MediaItem2;

    invoke-direct {p0, v3}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->retrieveDataSourceDescLocked(Landroid/support/v4/media/MediaItem2;)Landroid/support/v4/media/DataSourceDesc;

    move-result-object v3

    if-eqz v3, :cond_7

    new-instance p1, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    invoke-direct {p1, p0, v2, v3}, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;-><init>(Landroid/support/v4/media/SessionPlaylistAgentImplBase;ILandroid/support/v4/media/DataSourceDesc;)V

    return-object p1

    :cond_7
    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    :cond_8
    return-object v3
.end method

.method private hasValidItem()Z
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private retrieveDataSourceDescLocked(Landroid/support/v4/media/MediaItem2;)Landroid/support/v4/media/DataSourceDesc;
    .locals 2

    invoke-virtual {p1}, Landroid/support/v4/media/MediaItem2;->getDataSourceDesc()Landroid/support/v4/media/DataSourceDesc;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mItemDsdMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mItemDsdMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/media/DataSourceDesc;

    if-eqz v0, :cond_1

    return-object v0

    :cond_1
    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mDsmHelper:Landroid/support/v4/media/MediaSession2$OnDataSourceMissingHelper;

    if-eqz v1, :cond_2

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mSession:Landroid/support/v4/media/MediaSession2ImplBase;

    invoke-virtual {v0}, Landroid/support/v4/media/MediaSession2ImplBase;->getInstance()Landroid/support/v4/media/MediaSession2;

    move-result-object v0

    invoke-interface {v1, v0, p1}, Landroid/support/v4/media/MediaSession2$OnDataSourceMissingHelper;->onDataSourceMissing(Landroid/support/v4/media/MediaSession2;Landroid/support/v4/media/MediaItem2;)Landroid/support/v4/media/DataSourceDesc;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mItemDsdMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    return-object v0
.end method

.method private updateCurrentIfNeededLocked()V
    .locals 4

    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->hasValidItem()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    invoke-virtual {v0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;->isValid()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffledList:Ljava/util/ArrayList;

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    iget-object v1, v1, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;->mediaItem:Landroid/support/v4/media/MediaItem2;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_1

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    iput v0, v1, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;->shuffledIdx:I

    return-void

    :cond_1
    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    iget v0, v0, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;->shuffledIdx:I

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffledList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-lt v0, v1, :cond_2

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffledList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v2

    invoke-direct {p0, v0, v2}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->getNextValidPlayItemLocked(II)Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    goto :goto_0

    :cond_2
    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffledList:Ljava/util/ArrayList;

    iget-object v3, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    iget v3, v3, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;->shuffledIdx:I

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/media/MediaItem2;

    iput-object v1, v0, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;->mediaItem:Landroid/support/v4/media/MediaItem2;

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    iget-object v0, v0, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;->mediaItem:Landroid/support/v4/media/MediaItem2;

    invoke-direct {p0, v0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->retrieveDataSourceDescLocked(Landroid/support/v4/media/MediaItem2;)Landroid/support/v4/media/DataSourceDesc;

    move-result-object v0

    if-nez v0, :cond_3

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    iget v0, v0, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;->shuffledIdx:I

    invoke-direct {p0, v0, v2}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->getNextValidPlayItemLocked(II)Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    :cond_3
    :goto_0
    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->updatePlayerDataSourceLocked()V

    return-void

    :cond_4
    :goto_1
    return-void
.end method

.method private updatePlayerDataSourceLocked()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mEopPlayItem:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    if-ne v0, v1, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlayer:Landroid/support/v4/media/BaseMediaPlayer;

    invoke-virtual {v0}, Landroid/support/v4/media/BaseMediaPlayer;->getCurrentDataSource()Landroid/support/v4/media/DataSourceDesc;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    iget-object v1, v1, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;->dsd:Landroid/support/v4/media/DataSourceDesc;

    if-eq v0, v1, :cond_2

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlayer:Landroid/support/v4/media/BaseMediaPlayer;

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    iget-object v1, v1, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;->dsd:Landroid/support/v4/media/DataSourceDesc;

    invoke-virtual {v0, v1}, Landroid/support/v4/media/BaseMediaPlayer;->setDataSource(Landroid/support/v4/media/DataSourceDesc;)V

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlayer:Landroid/support/v4/media/BaseMediaPlayer;

    iget v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mRepeatMode:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v0, v2}, Landroid/support/v4/media/BaseMediaPlayer;->loopCurrent(Z)V

    :cond_2
    return-void

    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public addPlaylistItem(ILandroid/support/v4/media/MediaItem2;)V
    .locals 7
    .param p2    # Landroid/support/v4/media/MediaItem2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    if-eqz p2, :cond_2

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlaylist:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {p1, v1}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->clamp(II)I

    move-result p1

    nop

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlaylist:Ljava/util/ArrayList;

    invoke-virtual {v1, p1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iget v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffleMode:I

    const/4 v2, 0x1

    if-nez v1, :cond_0

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffledList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v3

    iget-object p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffledList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    add-int/2addr p1, v2

    int-to-double v5, p1

    mul-double/2addr v3, v5

    double-to-int p1, v3

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffledList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :goto_0
    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->hasValidItem()Z

    move-result p1

    if-nez p1, :cond_1

    const/4 p1, -0x1

    invoke-direct {p0, p1, v2}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->getNextValidPlayItemLocked(II)Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->updatePlayerDataSourceLocked()V

    goto :goto_1

    :cond_1
    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->updateCurrentIfNeededLocked()V

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->notifyPlaylistChanged()V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "item shouldn\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public clearOnDataSourceMissingHelper()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    iput-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mDsmHelper:Landroid/support/v4/media/MediaSession2$OnDataSourceMissingHelper;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method getCurShuffledIndex()I
    .locals 2
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->hasValidItem()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    iget v1, v1, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;->shuffledIdx:I

    goto :goto_0

    :cond_0
    const/4 v1, -0x2

    :goto_0
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getCurrentMediaItem()Landroid/support/v4/media/MediaItem2;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    iget-object v1, v1, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;->mediaItem:Landroid/support/v4/media/MediaItem2;

    :goto_0
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getMediaItem(Landroid/support/v4/media/DataSourceDesc;)Landroid/support/v4/media/MediaItem2;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getPlaylist()Ljava/util/List;
    .locals 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaItem2;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlaylist:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getPlaylistMetadata()Landroid/support/v4/media/MediaMetadata2;
    .locals 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mMetadata:Landroid/support/v4/media/MediaMetadata2;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getRepeatMode()I
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mRepeatMode:I

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getShuffleMode()I
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffleMode:I

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public removePlaylistItem(Landroid/support/v4/media/MediaItem2;)V
    .locals 2
    .param p1    # Landroid/support/v4/media/MediaItem2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    if-eqz p1, :cond_1

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlaylist:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffledList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mItemDsdMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->updateCurrentIfNeededLocked()V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->notifyPlaylistChanged()V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "item shouldn\'t be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public replacePlaylistItem(ILandroid/support/v4/media/MediaItem2;)V
    .locals 5
    .param p2    # Landroid/support/v4/media/MediaItem2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    if-eqz p2, :cond_2

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlaylist:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-gtz v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlaylist:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-static {p1, v1}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->clamp(II)I

    move-result p1

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffledList:Ljava/util/ArrayList;

    iget-object v3, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlaylist:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    iget-object v3, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mItemDsdMap:Ljava/util/Map;

    iget-object v4, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffledList:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v3, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffledList:Ljava/util/ArrayList;

    invoke-virtual {v3, v1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlaylist:Ljava/util/ArrayList;

    invoke-virtual {v1, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->hasValidItem()Z

    move-result p1

    if-nez p1, :cond_1

    const/4 p1, -0x1

    invoke-direct {p0, p1, v2}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->getNextValidPlayItemLocked(II)Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->updatePlayerDataSourceLocked()V

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->updateCurrentIfNeededLocked()V

    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->notifyPlaylistChanged()V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "item shouldn\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setOnDataSourceMissingHelper(Landroid/support/v4/media/MediaSession2$OnDataSourceMissingHelper;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mDsmHelper:Landroid/support/v4/media/MediaSession2$OnDataSourceMissingHelper;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setPlayer(Landroid/support/v4/media/BaseMediaPlayer;)V
    .locals 3
    .param p1    # Landroid/support/v4/media/BaseMediaPlayer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    if-eqz p1, :cond_1

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlayer:Landroid/support/v4/media/BaseMediaPlayer;

    if-ne p1, v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlayer:Landroid/support/v4/media/BaseMediaPlayer;

    iget-object v2, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlayerCallback:Landroid/support/v4/media/SessionPlaylistAgentImplBase$MyPlayerEventCallback;

    invoke-virtual {v1, v2}, Landroid/support/v4/media/BaseMediaPlayer;->unregisterPlayerEventCallback(Landroid/support/v4/media/BaseMediaPlayer$PlayerEventCallback;)V

    iput-object p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlayer:Landroid/support/v4/media/BaseMediaPlayer;

    iget-object p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlayer:Landroid/support/v4/media/BaseMediaPlayer;

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mSession:Landroid/support/v4/media/MediaSession2ImplBase;

    invoke-virtual {v1}, Landroid/support/v4/media/MediaSession2ImplBase;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlayerCallback:Landroid/support/v4/media/SessionPlaylistAgentImplBase$MyPlayerEventCallback;

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/media/BaseMediaPlayer;->registerPlayerEventCallback(Ljava/util/concurrent/Executor;Landroid/support/v4/media/BaseMediaPlayer$PlayerEventCallback;)V

    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->updatePlayerDataSourceLocked()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "player shouldn\'t be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setPlaylist(Ljava/util/List;Landroid/support/v4/media/MediaMetadata2;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/MediaMetadata2;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaItem2;",
            ">;",
            "Landroid/support/v4/media/MediaMetadata2;",
            ")V"
        }
    .end annotation

    if-eqz p1, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mItemDsdMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlaylist:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlaylist:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->applyShuffleModeLocked()V

    iput-object p2, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mMetadata:Landroid/support/v4/media/MediaMetadata2;

    const/4 p1, -0x1

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->getNextValidPlayItemLocked(II)Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->updatePlayerDataSourceLocked()V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->notifyPlaylistChanged()V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "list shouldn\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setRepeatMode(I)V
    .locals 3

    if-ltz p1, :cond_4

    const/4 v0, 0x3

    if-le p1, v0, :cond_0

    goto :goto_2

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mRepeatMode:I

    if-ne v1, p1, :cond_1

    monitor-exit v0

    return-void

    :cond_1
    iput p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mRepeatMode:I

    const/4 v1, 0x1

    packed-switch p1, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    iget-object p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    iget-object v2, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mEopPlayItem:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    if-ne p1, v2, :cond_2

    const/4 p1, -0x1

    invoke-direct {p0, p1, v1}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->getNextValidPlayItemLocked(II)Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->updatePlayerDataSourceLocked()V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    if-eqz p1, :cond_3

    iget-object p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    iget-object v2, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mEopPlayItem:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    if-eq p1, v2, :cond_3

    iget-object p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlayer:Landroid/support/v4/media/BaseMediaPlayer;

    invoke-virtual {p1, v1}, Landroid/support/v4/media/BaseMediaPlayer;->loopCurrent(Z)V

    goto :goto_1

    :cond_2
    :goto_0
    :pswitch_2
    iget-object p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mPlayer:Landroid/support/v4/media/BaseMediaPlayer;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/support/v4/media/BaseMediaPlayer;->loopCurrent(Z)V

    :cond_3
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->notifyRepeatModeChanged()V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_4
    :goto_2
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public setShuffleMode(I)V
    .locals 2

    if-ltz p1, :cond_2

    const/4 v0, 0x2

    if-le p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffleMode:I

    if-ne v1, p1, :cond_1

    monitor-exit v0

    return-void

    :cond_1
    iput p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffleMode:I

    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->applyShuffleModeLocked()V

    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->updateCurrentIfNeededLocked()V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->notifyShuffleModeChanged()V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_2
    :goto_0
    return-void
.end method

.method public skipToNextItem()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->hasValidItem()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    iget-object v2, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mEopPlayItem:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    iget v1, v1, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;->shuffledIdx:I

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->getNextValidPlayItemLocked(II)Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mEopPlayItem:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    if-eq v1, v2, :cond_1

    iput-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    :cond_1
    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->updateCurrentIfNeededLocked()V

    monitor-exit v0

    return-void

    :cond_2
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public skipToPlaylistItem(Landroid/support/v4/media/MediaItem2;)V
    .locals 2
    .param p1    # Landroid/support/v4/media/MediaItem2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    if-eqz p1, :cond_3

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->hasValidItem()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    iget-object v1, v1, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;->mediaItem:Landroid/support/v4/media/MediaItem2;

    invoke-virtual {p1, v1}, Landroid/support/v4/media/MediaItem2;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mShuffledList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    if-gez p1, :cond_1

    monitor-exit v0

    return-void

    :cond_1
    new-instance v1, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    invoke-direct {v1, p0, p1}, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;-><init>(Landroid/support/v4/media/SessionPlaylistAgentImplBase;I)V

    iput-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->updateCurrentIfNeededLocked()V

    monitor-exit v0

    return-void

    :cond_2
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "item shouldn\'t be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public skipToPreviousItem()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->hasValidItem()Z

    move-result v1

    if-nez v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    iget v1, v1, Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;->shuffledIdx:I

    const/4 v2, -0x1

    invoke-direct {p0, v1, v2}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->getNextValidPlayItemLocked(II)Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mEopPlayItem:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    if-eq v1, v2, :cond_1

    iput-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mCurrent:Landroid/support/v4/media/SessionPlaylistAgentImplBase$PlayItem;

    :cond_1
    invoke-direct {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->updateCurrentIfNeededLocked()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public updatePlaylistMetadata(Landroid/support/v4/media/MediaMetadata2;)V
    .locals 2
    .param p1    # Landroid/support/v4/media/MediaMetadata2;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mMetadata:Landroid/support/v4/media/MediaMetadata2;

    if-ne p1, v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    iput-object p1, p0, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->mMetadata:Landroid/support/v4/media/MediaMetadata2;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0}, Landroid/support/v4/media/SessionPlaylistAgentImplBase;->notifyPlaylistMetadataChanged()V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
