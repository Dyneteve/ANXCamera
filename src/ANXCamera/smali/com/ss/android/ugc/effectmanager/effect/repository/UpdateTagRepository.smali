.class public Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;
.super Ljava/lang/Object;
.source "UpdateTagRepository.java"

# interfaces
.implements Lcom/ss/android/ugc/effectmanager/common/WeakHandler$IHandler;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

.field private mHandler:Landroid/os/Handler;

.field private mTagsCachedMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "UpdateTagRepository"

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->TAG:Ljava/lang/String;

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/WeakHandler;

    invoke-direct {p1, p0}, Lcom/ss/android/ugc/effectmanager/common/WeakHandler;-><init>(Lcom/ss/android/ugc/effectmanager/common/WeakHandler$IHandler;)V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->requestWriteTask(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;)V

    return-void
.end method

.method static synthetic access$100(Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IIsTagNeedUpdatedListener;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->checkedTagInHashMap(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IIsTagNeedUpdatedListener;)V

    return-void
.end method

.method private checkedTagInHashMap(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IIsTagNeedUpdatedListener;)V
    .locals 4

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mTagsCachedMap:Ljava/util/HashMap;

    if-nez v0, :cond_0

    invoke-interface {p3}, Lcom/ss/android/ugc/effectmanager/effect/listener/IIsTagNeedUpdatedListener;->onTagNeedUpdate()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mTagsCachedMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-wide/16 v0, -0x1

    invoke-static {p2, v0, v1}, Lcom/ss/android/ugc/effectmanager/common/utils/ValueConvertUtil;->ConvertStringToLong(Ljava/lang/String;J)J

    move-result-wide v2

    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mTagsCachedMap:Ljava/util/HashMap;

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1, v0, v1}, Lcom/ss/android/ugc/effectmanager/common/utils/ValueConvertUtil;->ConvertStringToLong(Ljava/lang/String;J)J

    move-result-wide p1

    cmp-long p1, v2, p1

    if-lez p1, :cond_1

    invoke-interface {p3}, Lcom/ss/android/ugc/effectmanager/effect/listener/IIsTagNeedUpdatedListener;->onTagNeedUpdate()V

    goto :goto_0

    :cond_1
    invoke-interface {p3}, Lcom/ss/android/ugc/effectmanager/effect/listener/IIsTagNeedUpdatedListener;->onTagNeedNotUpdate()V

    goto :goto_0

    :cond_2
    invoke-interface {p3}, Lcom/ss/android/ugc/effectmanager/effect/listener/IIsTagNeedUpdatedListener;->onTagNeedUpdate()V

    :goto_0
    return-void
.end method

.method private requestWriteTask(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;)V
    .locals 2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-nez v0, :cond_1

    if-eqz p4, :cond_0

    invoke-interface {p4}, Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;->onFinally()V

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mTagsCachedMap:Ljava/util/HashMap;

    if-nez v0, :cond_2

    invoke-interface {p4}, Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;->onFinally()V

    :cond_2
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mTagsCachedMap:Ljava/util/HashMap;

    invoke-virtual {v0, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p2}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p2

    invoke-virtual {p2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object p2

    new-instance p3, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository$1;

    invoke-direct {p3, p0, p4}, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository$1;-><init>(Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;)V

    invoke-virtual {p2, p1, p3}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setWriteUpdateTagListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IWriteUpdateTagListener;)V

    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p2}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p2

    invoke-virtual {p2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getTaskManager()Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    move-result-object p2

    new-instance p3, Lcom/ss/android/ugc/effectmanager/effect/task/task/WriteUpdateTagTask;

    iget-object p4, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mTagsCachedMap:Ljava/util/HashMap;

    invoke-direct {p3, p4, v0, p1, v1}, Lcom/ss/android/ugc/effectmanager/effect/task/task/WriteUpdateTagTask;-><init>(Landroid/os/Handler;Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/lang/String;Ljava/util/HashMap;)V

    invoke-virtual {p2, p3}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->commit(Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)V

    return-void
.end method


# virtual methods
.method public handleMsg(Landroid/os/Message;)V
    .locals 2

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    const-string p1, "UpdateTagRepository"

    const-string v0, "\u672a\u77e5\u9519\u8bef"

    invoke-static {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;

    if-eqz v0, :cond_7

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v0

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;->getTaskID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->getReadUpdateTagListener(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/listener/IReadUpdateTagListener;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mTagsCachedMap:Ljava/util/HashMap;

    if-nez v1, :cond_1

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mTagsCachedMap:Ljava/util/HashMap;

    :cond_1
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;->getException()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    move-result-object v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mTagsCachedMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;->getTagsCachedMap()Ljava/util/HashMap;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lcom/ss/android/ugc/effectmanager/effect/listener/IReadUpdateTagListener;->onSuccess()V

    goto :goto_0

    :cond_2
    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;->getException()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IReadUpdateTagListener;->onFailed(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    :cond_3
    :goto_0
    if-eqz v0, :cond_4

    invoke-interface {v0}, Lcom/ss/android/ugc/effectmanager/effect/listener/IReadUpdateTagListener;->onFinally()V

    :cond_4
    goto :goto_1

    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/WriteTagTaskResult;

    if-eqz v0, :cond_7

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/ss/android/ugc/effectmanager/effect/task/result/WriteTagTaskResult;

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v0

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/WriteTagTaskResult;->getTaskID()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->getWriteUpdateTagListener(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/listener/IWriteUpdateTagListener;

    move-result-object p1

    if-eqz p1, :cond_6

    invoke-interface {p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IWriteUpdateTagListener;->onFinally()V

    :cond_6
    nop

    :cond_7
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x33
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public isTagUpdated(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IIsTagNeedUpdatedListener;)V
    .locals 7

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mTagsCachedMap:Ljava/util/HashMap;

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-nez v0, :cond_1

    if-eqz p4, :cond_0

    invoke-interface {p4}, Lcom/ss/android/ugc/effectmanager/effect/listener/IIsTagNeedUpdatedListener;->onTagNeedNotUpdate()V

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v0

    new-instance v1, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository$3;

    invoke-direct {v1, p0, p2, p3, p4}, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository$3;-><init>(Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IIsTagNeedUpdatedListener;)V

    invoke-virtual {v0, p1, v1}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setReadUpdateTagListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IReadUpdateTagListener;)V

    iget-object p4, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p4}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p4

    invoke-virtual {p4}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getTaskManager()Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    move-result-object p4

    new-instance v6, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    move-object v0, v6

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;-><init>(Landroid/os/Handler;Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p4, v6}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->commit(Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)V

    goto :goto_0

    :cond_2
    invoke-direct {p0, p2, p3, p4}, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->checkedTagInHashMap(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IIsTagNeedUpdatedListener;)V

    :goto_0
    return-void
.end method

.method public updateTag(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;)V
    .locals 8

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mTagsCachedMap:Ljava/util/HashMap;

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-nez v0, :cond_1

    if-eqz p4, :cond_0

    invoke-interface {p4}, Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;->onFinally()V

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v0

    new-instance v7, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository$2;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository$2;-><init>(Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;)V

    invoke-virtual {v0, p1, v7}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setReadUpdateTagListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IReadUpdateTagListener;)V

    iget-object p4, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p4}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p4

    invoke-virtual {p4}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getTaskManager()Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    move-result-object p4

    new-instance v6, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ugc/effectmanager/effect/task/task/ReadUpdateTagTask;-><init>(Landroid/os/Handler;Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p4, v6}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->commit(Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)V

    goto :goto_0

    :cond_2
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->requestWriteTask(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;)V

    :goto_0
    return-void
.end method
