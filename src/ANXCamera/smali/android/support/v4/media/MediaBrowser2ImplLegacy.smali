.class Landroid/support/v4/media/MediaBrowser2ImplLegacy;
.super Landroid/support/v4/media/MediaController2ImplLegacy;
.source "MediaBrowser2ImplLegacy.java"

# interfaces
.implements Landroid/support/v4/media/MediaBrowser2$SupportLibraryImpl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/MediaBrowser2ImplLegacy$GetChildrenCallback;,
        Landroid/support/v4/media/MediaBrowser2ImplLegacy$SubscribeCallback;,
        Landroid/support/v4/media/MediaBrowser2ImplLegacy$GetLibraryRootCallback;
    }
.end annotation


# static fields
.field public static final EXTRA_ITEM_COUNT:Ljava/lang/String; = "android.media.browse.extra.ITEM_COUNT"


# instance fields
.field private final mBrowserCompats:Ljava/util/HashMap;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Landroid/os/Bundle;",
            "Landroid/support/v4/media/MediaBrowserCompat;",
            ">;"
        }
    .end annotation
.end field

.field private final mSubscribeCallbacks:Ljava/util/HashMap;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaBrowser2ImplLegacy$SubscribeCallback;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/support/v4/media/MediaBrowser2;Landroid/support/v4/media/SessionToken2;Ljava/util/concurrent/Executor;Landroid/support/v4/media/MediaBrowser2$BrowserCallback;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/support/v4/media/SessionToken2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/util/concurrent/Executor;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Landroid/support/v4/media/MediaBrowser2$BrowserCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct/range {p0 .. p5}, Landroid/support/v4/media/MediaController2ImplLegacy;-><init>(Landroid/content/Context;Landroid/support/v4/media/MediaController2;Landroid/support/v4/media/SessionToken2;Ljava/util/concurrent/Executor;Landroid/support/v4/media/MediaController2$ControllerCallback;)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->mBrowserCompats:Ljava/util/HashMap;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->mSubscribeCallbacks:Ljava/util/HashMap;

    return-void
.end method

.method static synthetic access$000(Landroid/support/v4/media/MediaBrowser2ImplLegacy;)Ljava/util/HashMap;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->mBrowserCompats:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic access$300(Landroid/support/v4/media/MediaBrowser2ImplLegacy;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 0

    invoke-direct {p0, p1}, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->getExtrasWithoutPagination(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method

.method private getBrowserCompat(Landroid/os/Bundle;)Landroid/support/v4/media/MediaBrowserCompat;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->mBrowserCompats:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v4/media/MediaBrowserCompat;

    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private getExtrasWithoutPagination(Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-virtual {p0}, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    :try_start_0
    const-string v0, "android.media.browse.extra.PAGE"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    const-string v0, "android.media.browse.extra.PAGE_SIZE"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/BadParcelableException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :goto_0
    return-object p1
.end method


# virtual methods
.method public close()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->mBrowserCompats:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/media/MediaBrowserCompat;

    invoke-virtual {v2}, Landroid/support/v4/media/MediaBrowserCompat;->disconnect()V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->mBrowserCompats:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    invoke-super {p0}, Landroid/support/v4/media/MediaController2ImplLegacy;->close()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getCallback()Landroid/support/v4/media/MediaBrowser2$BrowserCallback;
    .locals 1

    invoke-super {p0}, Landroid/support/v4/media/MediaController2ImplLegacy;->getCallback()Landroid/support/v4/media/MediaController2$ControllerCallback;

    move-result-object v0

    check-cast v0, Landroid/support/v4/media/MediaBrowser2$BrowserCallback;

    return-object v0
.end method

.method public bridge synthetic getCallback()Landroid/support/v4/media/MediaController2$ControllerCallback;
    .locals 1

    invoke-virtual {p0}, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->getCallback()Landroid/support/v4/media/MediaBrowser2$BrowserCallback;

    move-result-object v0

    return-object v0
.end method

.method public getChildren(Ljava/lang/String;IILandroid/os/Bundle;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p1, :cond_2

    const/4 v0, 0x1

    if-lt p2, v0, :cond_1

    if-lt p3, v0, :cond_1

    invoke-virtual {p0}, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p4}, Landroid/support/v4/media/MediaUtils2;->createBundle(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object p4

    const-string v1, "android.media.browse.extra.PAGE"

    invoke-virtual {p4, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "android.media.browse.extra.PAGE_SIZE"

    invoke-virtual {p4, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    new-instance v1, Landroid/support/v4/media/MediaBrowser2ImplLegacy$GetChildrenCallback;

    invoke-direct {v1, p0, p1, p2, p3}, Landroid/support/v4/media/MediaBrowser2ImplLegacy$GetChildrenCallback;-><init>(Landroid/support/v4/media/MediaBrowser2ImplLegacy;Ljava/lang/String;II)V

    invoke-virtual {v0, p1, p4, v1}, Landroid/support/v4/media/MediaBrowserCompat;->subscribe(Ljava/lang/String;Landroid/os/Bundle;Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;)V

    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Neither page nor pageSize should be less than 1"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "parentId shouldn\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getInstance()Landroid/support/v4/media/MediaBrowser2;
    .locals 1

    invoke-super {p0}, Landroid/support/v4/media/MediaController2ImplLegacy;->getInstance()Landroid/support/v4/media/MediaController2;

    move-result-object v0

    check-cast v0, Landroid/support/v4/media/MediaBrowser2;

    return-object v0
.end method

.method public bridge synthetic getInstance()Landroid/support/v4/media/MediaController2;
    .locals 1

    invoke-virtual {p0}, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->getInstance()Landroid/support/v4/media/MediaBrowser2;

    move-result-object v0

    return-object v0
.end method

.method public getItem(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v1, Landroid/support/v4/media/MediaBrowser2ImplLegacy$3;

    invoke-direct {v1, p0, p1}, Landroid/support/v4/media/MediaBrowser2ImplLegacy$3;-><init>(Landroid/support/v4/media/MediaBrowser2ImplLegacy;Ljava/lang/String;)V

    invoke-virtual {v0, p1, v1}, Landroid/support/v4/media/MediaBrowserCompat;->getItem(Ljava/lang/String;Landroid/support/v4/media/MediaBrowserCompat$ItemCallback;)V

    return-void
.end method

.method public getLibraryRoot(Landroid/os/Bundle;)V
    .locals 3
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->getBrowserCompat(Landroid/os/Bundle;)Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroid/support/v4/media/MediaBrowser2ImplLegacy$1;

    invoke-direct {v2, p0, p1, v0}, Landroid/support/v4/media/MediaBrowser2ImplLegacy$1;-><init>(Landroid/support/v4/media/MediaBrowser2ImplLegacy;Landroid/os/Bundle;Landroid/support/v4/media/MediaBrowserCompat;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroid/support/v4/media/MediaBrowser2ImplLegacy$2;

    invoke-direct {v1, p0, p1}, Landroid/support/v4/media/MediaBrowser2ImplLegacy$2;-><init>(Landroid/support/v4/media/MediaBrowser2ImplLegacy;Landroid/os/Bundle;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method

.method public getSearchResult(Ljava/lang/String;IILandroid/os/Bundle;)V
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p4}, Landroid/support/v4/media/MediaUtils2;->createBundle(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "android.media.browse.extra.PAGE"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "android.media.browse.extra.PAGE_SIZE"

    invoke-virtual {v1, v2, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    new-instance v2, Landroid/support/v4/media/MediaBrowser2ImplLegacy$5;

    invoke-direct {v2, p0, p2, p3, p4}, Landroid/support/v4/media/MediaBrowser2ImplLegacy$5;-><init>(Landroid/support/v4/media/MediaBrowser2ImplLegacy;IILandroid/os/Bundle;)V

    invoke-virtual {v0, p1, v1, v2}, Landroid/support/v4/media/MediaBrowserCompat;->search(Ljava/lang/String;Landroid/os/Bundle;Landroid/support/v4/media/MediaBrowserCompat$SearchCallback;)V

    return-void
.end method

.method public search(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v1, Landroid/support/v4/media/MediaBrowser2ImplLegacy$4;

    invoke-direct {v1, p0}, Landroid/support/v4/media/MediaBrowser2ImplLegacy$4;-><init>(Landroid/support/v4/media/MediaBrowser2ImplLegacy;)V

    invoke-virtual {v0, p1, p2, v1}, Landroid/support/v4/media/MediaBrowserCompat;->search(Ljava/lang/String;Landroid/os/Bundle;Landroid/support/v4/media/MediaBrowserCompat$SearchCallback;)V

    return-void
.end method

.method public subscribe(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 5
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v1, Landroid/support/v4/media/MediaBrowser2ImplLegacy$SubscribeCallback;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Landroid/support/v4/media/MediaBrowser2ImplLegacy$SubscribeCallback;-><init>(Landroid/support/v4/media/MediaBrowser2ImplLegacy;Landroid/support/v4/media/MediaBrowser2ImplLegacy$1;)V

    iget-object v2, p0, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->mLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->mSubscribeCallbacks:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-nez v3, :cond_1

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iget-object v4, p0, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->mSubscribeCallbacks:Ljava/util/HashMap;

    invoke-virtual {v4, p1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    const-string v3, "android.support.v4.media.argument.EXTRAS"

    invoke-virtual {v2, v3, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    invoke-virtual {v0, p1, v2, v1}, Landroid/support/v4/media/MediaBrowserCompat;->subscribe(Ljava/lang/String;Landroid/os/Bundle;Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "parentId shouldn\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public unsubscribe(Ljava/lang/String;)V
    .locals 5
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Landroid/support/v4/media/MediaBrowser2ImplLegacy;->mSubscribeCallbacks:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-nez v2, :cond_1

    monitor-exit v1

    return-void

    :cond_1
    const/4 v3, 0x0

    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_2

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;

    invoke-virtual {v0, p1, v4}, Landroid/support/v4/media/MediaBrowserCompat;->unsubscribe(Ljava/lang/String;Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    monitor-exit v1

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "parentId shouldn\'t be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
