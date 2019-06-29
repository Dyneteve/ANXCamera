.class public Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;
.super Ljava/lang/Object;
.source "FavoriteRepository.java"

# interfaces
.implements Lcom/ss/android/ugc/effectmanager/common/WeakHandler$IHandler;


# instance fields
.field private TAG:Ljava/lang/String;

.field private mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

.field private mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

.field private mHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "FavoriteRepository"

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->TAG:Ljava/lang/String;

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/WeakHandler;

    invoke-direct {p1, p0}, Lcom/ss/android/ugc/effectmanager/common/WeakHandler;-><init>(Lcom/ss/android/ugc/effectmanager/common/WeakHandler$IHandler;)V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->mHandler:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public fetchFavoriteList(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchFavoriteListTask;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, v1, p1, p2, v2}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchFavoriteListTask;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;)V

    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getTaskManager()Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->commit(Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)V

    return-void
.end method

.method public handleMsg(Landroid/os/Message;)V
    .locals 2

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->TAG:Ljava/lang/String;

    const-string/jumbo v0, "\u672a\u77e5\u9519\u8bef"

    invoke-static {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FetchFavoriteListTaskResult;

    if-eqz v0, :cond_4

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/ss/android/ugc/effectmanager/effect/task/result/FetchFavoriteListTaskResult;

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v0

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/FetchFavoriteListTaskResult;->getTaskID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->getFetchFavoriteListListener(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchFavoriteList;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/FetchFavoriteListTaskResult;->getException()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/FetchFavoriteListTaskResult;->getEffects()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/FetchFavoriteListTaskResult;->getType()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchFavoriteList;->onSuccess(Ljava/util/List;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/FetchFavoriteListTaskResult;->getException()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchFavoriteList;->onFailed(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    :cond_1
    :goto_0
    goto :goto_2

    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FavoriteTaskResult;

    if-eqz v0, :cond_4

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/ss/android/ugc/effectmanager/effect/task/result/FavoriteTaskResult;

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v0

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/FavoriteTaskResult;->getTaskID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->getModFavoriteListListener(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/FavoriteTaskResult;->isSuccess()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/FavoriteTaskResult;->getEffectIds()Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;->onSuccess(Ljava/util/List;)V

    goto :goto_1

    :cond_2
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/FavoriteTaskResult;->getException()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    :cond_3
    :goto_1
    nop

    :cond_4
    :goto_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x28
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public modFavoriteList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 8

    new-instance v7, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->mHandler:Landroid/os/Handler;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    move-object v0, v7

    move-object v2, p1

    move-object v3, p4

    move-object v5, p2

    invoke-direct/range {v0 .. v6}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;Ljava/lang/String;Z)V

    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getTaskManager()Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    move-result-object p1

    invoke-virtual {p1, v7}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->commit(Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)V

    return-void
.end method

.method public modFavoriteList(Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    new-instance v7, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->mHandler:Landroid/os/Handler;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    move-object v0, v7

    move-object v2, p1

    move-object v3, p4

    move-object v5, p2

    invoke-direct/range {v0 .. v6}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;Ljava/util/List;Z)V

    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getTaskManager()Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    move-result-object p1

    invoke-virtual {p1, v7}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->commit(Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)V

    return-void
.end method
