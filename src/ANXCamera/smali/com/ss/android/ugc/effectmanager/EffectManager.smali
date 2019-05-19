.class public Lcom/ss/android/ugc/effectmanager/EffectManager;
.super Ljava/lang/Object;
.source "EffectManager.java"


# static fields
.field private static final SDK_TAG:Ljava/lang/String; = "EffectManager"


# instance fields
.field mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

.field mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

.field mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

.field mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

.field mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

.field mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

.field mInited:Z

.field mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

.field mUpdateTagRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mInited:Z

    return-void
.end method

.method static synthetic access$000(Lcom/ss/android/ugc/effectmanager/EffectManager;Ljava/util/List;)Ljava/util/List;
    .locals 0

    invoke-direct {p0, p1}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getNeedDownloadEffectList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/ss/android/ugc/effectmanager/EffectManager;Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;Ljava/util/List;)Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/ss/android/ugc/effectmanager/EffectManager;->divideEffectList(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;Ljava/util/List;)Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/ss/android/ugc/effectmanager/EffectManager;Ljava/util/List;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/ss/android/ugc/effectmanager/EffectManager;->downloadEffectList(Ljava/util/List;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    return-void
.end method

.method private checkConfiguration(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)Z
    .locals 1

    nop

    if-nez p1, :cond_0

    const-string p1, "EffectManager"

    const-string v0, "Not set configuration"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    :cond_0
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getLinkSelectorConfiguration()Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->getOriginHosts()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_7

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getLinkSelectorConfiguration()Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->getOriginHosts()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getLinkSelectorConfiguration()Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->getContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_2

    const-string p1, "EffectManager"

    const-string v0, "Not set net context"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_2
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getJsonConverter()Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    move-result-object v0

    if-nez v0, :cond_3

    const-string p1, "EffectManager"

    const-string v0, "Not set json convert"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_3
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getEffectNetWorker()Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;

    move-result-object v0

    if-nez v0, :cond_4

    const-string p1, "EffectManager"

    const-string v0, "Not set net worker"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_4
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getEffectDir()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getEffectDir()Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_5

    goto :goto_0

    :cond_5
    const/4 p1, 0x1

    goto :goto_3

    :cond_6
    :goto_0
    const-string p1, "EffectManager"

    const-string v0, "Cache directory error"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_7
    :goto_1
    const-string p1, "EffectManager"

    const-string v0, "Not set host !!!"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    nop

    :goto_2
    const/4 p1, 0x0

    :goto_3
    return p1
.end method

.method private divideEffectList(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;Ljava/util/List;)Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;"
        }
    .end annotation

    invoke-virtual {p1, p2}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->setAllCategoryEffects(Ljava/util/List;)V

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->getCategoryResponseList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->getTotalEffects()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    invoke-interface {p2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    goto :goto_1

    :cond_1
    invoke-virtual {v1, v2}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->setTotalEffects(Ljava/util/List;)V

    goto :goto_0

    :cond_2
    return-object p1
.end method

.method private downloadEffectList(Ljava/util/List;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;",
            "Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectListListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    invoke-virtual {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->fetchEffectList(Ljava/util/List;Ljava/lang/String;)V

    return-void

    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    :cond_2
    return-void
.end method

.method private getNeedDownloadEffectList(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->getCurrentDownloadingEffectList()Ljava/util/List;

    move-result-object v1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private initCache()V
    .locals 2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getCache()Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/ss/android/ugc/effectmanager/common/cache/FileCache;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/cache/FileCache;-><init>(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->setCache(Lcom/ss/android/ugc/effectmanager/common/listener/ICache;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getCache()Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    :goto_0
    return-void
.end method

.method private initRepository()V
    .locals 2

    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;-><init>(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    new-instance v1, Lcom/ss/android/ugc/effectmanager/EffectManager$1;

    invoke-direct {v1, p0}, Lcom/ss/android/ugc/effectmanager/EffectManager$1;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;)V

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->setOnEffectListListener(Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository$EffectListListener;)V

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    new-instance v1, Lcom/ss/android/ugc/effectmanager/EffectManager$2;

    invoke-direct {v1, p0}, Lcom/ss/android/ugc/effectmanager/EffectManager$2;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;)V

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->setListener(Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;)V

    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mUpdateTagRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

    return-void
.end method

.method private initTaskManager()V
    .locals 5

    new-instance v0, Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    invoke-direct {v0}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;-><init>()V

    new-instance v1, Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;

    invoke-direct {v1}, Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;-><init>()V

    new-instance v2, Lcom/ss/android/ugc/effectmanager/common/SimpleThreadFactory;

    const-string v3, "EffectManager"

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4}, Lcom/ss/android/ugc/effectmanager/common/SimpleThreadFactory;-><init>(Ljava/lang/String;Z)V

    invoke-static {v2}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;->setExecutor(Ljava/util/concurrent/ExecutorService;)Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;

    move-result-object v1

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1, v2}, Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;->setEffectContext(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->init(Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;)V

    new-instance v1, Lcom/ss/android/ugc/effectmanager/network/interceptor/LinkSelectorInterceptor;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-direct {v1, v2}, Lcom/ss/android/ugc/effectmanager/network/interceptor/LinkSelectorInterceptor;-><init>(Lcom/ss/android/ugc/effectmanager/link/LinkSelector;)V

    invoke-virtual {v1, v4}, Lcom/ss/android/ugc/effectmanager/network/interceptor/LinkSelectorInterceptor;->enable(Z)V

    const-string v2, "LINK_SELECTOR"

    invoke-virtual {v0, v2, v1}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->addInterception(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/network/interceptor/BaseInterceptor;)V

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->setTaskManager(Lcom/ss/android/ugc/effectmanager/common/TaskManager;)V

    return-void
.end method

.method private linkSelectorStart()V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->startOptHosts()V

    return-void
.end method

.method private needLinkSelector(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getLinkSelectorConfiguration()Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    move-result-object p1

    const/4 v1, 0x1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->getOriginHosts()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-le v2, v1, :cond_1

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->isNetworkChangeMonitor()Z

    move-result p1

    if-eqz p1, :cond_1

    move v0, v1

    goto :goto_0

    :cond_1
    nop

    :goto_0
    return v0
.end method


# virtual methods
.method public checkedEffectListUpdate(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/ICheckChannelListener;)V
    .locals 2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setCheckChannelListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/ICheckChannelListener;)V

    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    invoke-virtual {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->checkUpdate(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/ICheckChannelListener;->checkChannelFailed(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    :cond_2
    return-void
.end method

.method public clearCache(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "effectchannel"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->remove(Ljava/lang/String;)Z

    return-void
.end method

.method public clearEffects()V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    invoke-interface {v0}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->clear()V

    return-void
.end method

.method public deleteEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->remove(Ljava/lang/String;)Z

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".zip"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->remove(Ljava/lang/String;)Z

    return-void
.end method

.method public destroy()V
    .locals 1

    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mInited:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getTaskManager()Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->destroy()V

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->destroy()V

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->destroy()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mInited:Z

    :cond_1
    return-void
.end method

.method public fetchEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;)V
    .locals 3

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;)V

    invoke-virtual {p0, p1}, Lcom/ss/android/ugc/effectmanager/EffectManager;->isEffectDownloading(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    invoke-virtual {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->fetchEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Ljava/lang/String;)V

    :cond_1
    return-void

    :cond_2
    :goto_0
    if-eqz p2, :cond_3

    new-instance v0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;->onFail(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    :cond_3
    return-void
.end method

.method public fetchEffect(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;)V
    .locals 3

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-nez v0, :cond_1

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    new-instance v0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;->onFail(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    :cond_0
    return-void

    :cond_1
    new-instance v0, Lcom/ss/android/ugc/effectmanager/EffectManager$4;

    invoke-direct {v0, p0, p2}, Lcom/ss/android/ugc/effectmanager/EffectManager$4;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;)V

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p2, v0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->fetchEffectList(Ljava/util/List;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    return-void
.end method

.method public fetchEffectList(Ljava/lang/String;ZLcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    new-instance v0, Lcom/ss/android/ugc/effectmanager/EffectManager$3;

    invoke-direct {v0, p0, p2, p3}, Lcom/ss/android/ugc/effectmanager/EffectManager$3;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;ZLcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V

    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object p2

    iget-object p3, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p3}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p3

    invoke-virtual {p3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object p3

    invoke-virtual {p3, p2, v0}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectChannelListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    const/4 v0, 0x0

    if-nez p3, :cond_1

    iget-object p3, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    invoke-virtual {p3, p1, p2, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->fetchList(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    const-string p3, "default"

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->fetchList(Ljava/lang/String;Ljava/lang/String;Z)V

    :goto_0
    return-void

    :cond_2
    :goto_1
    if-eqz p3, :cond_3

    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance p2, Ljava/lang/IllegalStateException;

    const-string v0, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {p2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, p2}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p3, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    :cond_3
    return-void
.end method

.method public fetchEffectList(Ljava/util/List;ILcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I",
            "Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/ss/android/ugc/effectmanager/EffectManager$7;

    invoke-direct {v0, p0, p3}, Lcom/ss/android/ugc/effectmanager/EffectManager$7;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object p3

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, p3, v0}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectListListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    invoke-virtual {v0, p1, p3, p2}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->fetchEffectListById(Ljava/util/List;Ljava/lang/String;I)V

    return-void

    :cond_1
    :goto_0
    if-eqz p3, :cond_2

    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance p2, Ljava/lang/IllegalStateException;

    const-string v0, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {p2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, p2}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p3, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    :cond_2
    return-void
.end method

.method public fetchEffectList(Ljava/util/List;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/ss/android/ugc/effectmanager/EffectManager$5;

    invoke-direct {v0, p0, p2}, Lcom/ss/android/ugc/effectmanager/EffectManager$5;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object p2

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, p2, v0}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectListListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->fetchEffectListById(Ljava/util/List;Ljava/lang/String;)V

    return-void

    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    :cond_2
    return-void
.end method

.method public fetchEffectList(Ljava/util/List;ZLcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z",
            "Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/ss/android/ugc/effectmanager/EffectManager$6;

    invoke-direct {v0, p0, p2, p3}, Lcom/ss/android/ugc/effectmanager/EffectManager$6;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;ZLcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object p2

    iget-object p3, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p3}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p3

    invoke-virtual {p3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object p3

    invoke-virtual {p3, p2, v0}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectListListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    iget-object p3, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    invoke-virtual {p3, p1, p2}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->fetchEffectListById(Ljava/util/List;Ljava/lang/String;)V

    return-void

    :cond_1
    :goto_0
    if-eqz p3, :cond_2

    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance p2, Ljava/lang/IllegalStateException;

    const-string v0, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {p2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, p2}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p3, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    :cond_2
    return-void
.end method

.method public fetchEffectListFromCache(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V
    .locals 2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectChannelListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    const/4 v1, 0x1

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    invoke-virtual {p2, p1, v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->fetchList(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    const-string p2, "default"

    invoke-virtual {p1, p2, v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->fetchList(Ljava/lang/String;Ljava/lang/String;Z)V

    :goto_0
    return-void

    :cond_2
    :goto_1
    if-eqz p2, :cond_3

    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    :cond_3
    return-void
.end method

.method public fetchExistEffectList(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V
    .locals 2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectChannelListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    invoke-virtual {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->fetchExistEffectList(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    const-string p2, "default"

    invoke-virtual {p1, p2, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->fetchExistEffectList(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_2
    :goto_1
    if-eqz p2, :cond_3

    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    :cond_3
    return-void
.end method

.method public fetchFavoriteList(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchFavoriteList;)V
    .locals 2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchFavoriteListListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchFavoriteList;)V

    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    invoke-virtual {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->fetchFavoriteList(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchFavoriteList;->onFailed(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    :cond_2
    return-void
.end method

.method public getCurrentEffectChannel()Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->getCurrentEffectChannel()Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    move-result-object v0

    return-object v0
.end method

.method getCurrentTaskID()Ljava/lang/String;
    .locals 1

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public init(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)Z
    .locals 1

    invoke-direct {p0, p1}, Lcom/ss/android/ugc/effectmanager/EffectManager;->needLinkSelector(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/ss/android/ugc/effectmanager/common/Preconditions;->checkUiThread()V

    :cond_0
    invoke-direct {p0, p1}, Lcom/ss/android/ugc/effectmanager/EffectManager;->checkConfiguration(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 p1, 0x0

    return p1

    :cond_1
    new-instance v0, Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-direct {v0, p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;-><init>(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getLinkSelector()Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->initTaskManager()V

    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->initRepository()V

    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->initCache()V

    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getEffectNetWorker()Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;

    move-result-object p1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {p1, v0}, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;->setLinkSelector(Lcom/ss/android/ugc/effectmanager/link/LinkSelector;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mInited:Z

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->isLazy()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->linkSelectorStart()V

    :cond_2
    return p1
.end method

.method public isEffectDownloaded(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/common/utils/EffectUtils;->isEffectValid(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    invoke-virtual {v0, p1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->isDownloaded(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isEffectDownloading(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/common/utils/EffectUtils;->isEffectValid(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    invoke-virtual {v0, p1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->isDownloading(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isTagUpdated(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IIsTagNeedUpdatedListener;)V
    .locals 2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mUpdateTagRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

    if-nez v0, :cond_0

    invoke-interface {p3}, Lcom/ss/android/ugc/effectmanager/effect/listener/IIsTagNeedUpdatedListener;->onTagNeedNotUpdate()V

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mUpdateTagRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

    invoke-virtual {v1, v0, p1, p2, p3}, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->isTagUpdated(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IIsTagNeedUpdatedListener;)V

    return-void
.end method

.method public modifyFavoriteList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;)V
    .locals 2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p4}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setModFavoriteListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;)V

    iget-object p4, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    invoke-virtual {p4, p1, p2, p3, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->modFavoriteList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    :cond_1
    :goto_0
    if-eqz p4, :cond_2

    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance p2, Ljava/lang/IllegalStateException;

    const-string p3, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {p2, p3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, p2}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p4, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    :cond_2
    return-void
.end method

.method public modifyFavoriteList(Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Boolean;",
            "Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p4}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setModFavoriteListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;)V

    iget-object p4, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    invoke-virtual {p4, p1, p2, p3, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->modFavoriteList(Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void

    :cond_1
    :goto_0
    if-eqz p4, :cond_2

    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance p2, Ljava/lang/IllegalStateException;

    const-string p3, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {p2, p3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, p2}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p4, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    :cond_2
    return-void
.end method

.method public removeListener()V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->destroy()V

    return-void
.end method

.method public updateDeviceId(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->setDeviceId(Ljava/lang/String;)V

    return-void
.end method

.method public updateHosts(Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/link/model/host/Host;",
            ">;Z)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->updateHosts(Ljava/util/List;Z)V

    :cond_0
    return-void
.end method

.method public updateTag(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;)V
    .locals 2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mUpdateTagRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

    if-nez v0, :cond_1

    if-eqz p3, :cond_0

    invoke-interface {p3}, Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;->onFinally()V

    :cond_0
    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mUpdateTagRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

    invoke-virtual {v1, v0, p1, p2, p3}, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->updateTag(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;)V

    return-void
.end method
