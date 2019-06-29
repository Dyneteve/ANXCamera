.class public final Lcom/bytedance/frameworks/baselib/log/LogQueue;
.super Ljava/lang/Object;
.source "LogQueue.java"


# static fields
.field static final DEBUG:Z = false

.field private static final MAX_QUEUE_SIZE:I = 0x7d0

.field static final TAG:Ljava/lang/String; = "LogQueue"

.field private static sLogQueue:Lcom/bytedance/frameworks/baselib/log/LogQueue;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mLogHandlers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/bytedance/frameworks/baselib/log/LogHandler;",
            ">;"
        }
    .end annotation
.end field

.field private final mLogSender:Lcom/bytedance/frameworks/baselib/log/LogSender;

.field private final mPendingQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/bytedance/frameworks/baselib/log/LogItem;",
            ">;"
        }
    .end annotation
.end field

.field private final mStopFlag:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mStopFlag:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mPendingQueue:Ljava/util/LinkedList;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mContext:Landroid/content/Context;

    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p1, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mLogHandlers:Ljava/util/Map;

    new-instance p1, Lcom/bytedance/frameworks/baselib/log/LogSender;

    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mPendingQueue:Ljava/util/LinkedList;

    iget-object v2, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mStopFlag:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p1, v0, p0, v1, v2}, Lcom/bytedance/frameworks/baselib/log/LogSender;-><init>(Landroid/content/Context;Lcom/bytedance/frameworks/baselib/log/LogQueue;Ljava/util/LinkedList;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    iput-object p1, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mLogSender:Lcom/bytedance/frameworks/baselib/log/LogSender;

    iget-object p1, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mLogSender:Lcom/bytedance/frameworks/baselib/log/LogSender;

    invoke-virtual {p1}, Lcom/bytedance/frameworks/baselib/log/LogSender;->start()V

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/bytedance/frameworks/baselib/log/LogQueue;
    .locals 2

    sget-object v0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->sLogQueue:Lcom/bytedance/frameworks/baselib/log/LogQueue;

    if-nez v0, :cond_1

    const-class v0, Lcom/bytedance/frameworks/baselib/log/LogQueue;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/bytedance/frameworks/baselib/log/LogQueue;->sLogQueue:Lcom/bytedance/frameworks/baselib/log/LogQueue;

    if-nez v1, :cond_0

    new-instance v1, Lcom/bytedance/frameworks/baselib/log/LogQueue;

    invoke-direct {v1, p0}, Lcom/bytedance/frameworks/baselib/log/LogQueue;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/bytedance/frameworks/baselib/log/LogQueue;->sLogQueue:Lcom/bytedance/frameworks/baselib/log/LogQueue;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    sget-object p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->sLogQueue:Lcom/bytedance/frameworks/baselib/log/LogQueue;

    return-object p0
.end method

.method static log(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method static log(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public static quit()V
    .locals 2

    const-class v0, Lcom/bytedance/frameworks/baselib/log/LogQueue;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/bytedance/frameworks/baselib/log/LogQueue;->sLogQueue:Lcom/bytedance/frameworks/baselib/log/LogQueue;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/bytedance/frameworks/baselib/log/LogQueue;->sLogQueue:Lcom/bytedance/frameworks/baselib/log/LogQueue;

    invoke-virtual {v1}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->stop()V

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method enqueue(Ljava/lang/String;[B)Z
    .locals 3

    invoke-virtual {p0}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->isStop()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_4

    if-eqz p2, :cond_4

    array-length v0, p2

    if-gtz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->getLogHandler(Ljava/lang/String;)Lcom/bytedance/frameworks/baselib/log/LogHandler;

    move-result-object v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mPendingQueue:Ljava/util/LinkedList;

    monitor-enter v0

    :try_start_0
    iget-object v2, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mStopFlag:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-eqz v2, :cond_2

    monitor-exit v0

    return v1

    :cond_2
    iget-object v1, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mPendingQueue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    const/16 v2, 0x7d0

    if-lt v1, v2, :cond_3

    iget-object v1, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mPendingQueue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    :cond_3
    iget-object v1, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mPendingQueue:Ljava/util/LinkedList;

    new-instance v2, Lcom/bytedance/frameworks/baselib/log/LogItem;

    invoke-direct {v2, p1, p2}, Lcom/bytedance/frameworks/baselib/log/LogItem;-><init>(Ljava/lang/String;[B)V

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    move-result p1

    iget-object p2, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mLogSender:Lcom/bytedance/frameworks/baselib/log/LogSender;

    invoke-virtual {p2}, Lcom/bytedance/frameworks/baselib/log/LogSender;->awaken()V

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_4
    :goto_0
    return v1
.end method

.method getAllLogHandler()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/bytedance/frameworks/baselib/log/LogHandler;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mLogHandlers:Ljava/util/Map;

    return-object v0
.end method

.method getLogHandler(Ljava/lang/String;)Lcom/bytedance/frameworks/baselib/log/LogHandler;
    .locals 1

    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mLogHandlers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bytedance/frameworks/baselib/log/LogHandler;

    return-object p1
.end method

.method isStop()Z
    .locals 1

    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mStopFlag:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public registerLogHandler(Ljava/lang/String;Lcom/bytedance/frameworks/baselib/log/LogHandler;)V
    .locals 1

    invoke-virtual {p0}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->isStop()Z

    move-result v0

    if-nez v0, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mLogHandlers:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method stop()V
    .locals 2

    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mPendingQueue:Ljava/util/LinkedList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mPendingQueue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mStopFlag:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mLogSender:Lcom/bytedance/frameworks/baselib/log/LogSender;

    invoke-virtual {v0}, Lcom/bytedance/frameworks/baselib/log/LogSender;->quit()V

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public unregisterLogHandler(Lcom/bytedance/frameworks/baselib/log/LogHandler;)V
    .locals 1

    invoke-virtual {p0}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->isStop()Z

    move-result v0

    if-nez v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogQueue;->mLogHandlers:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/bytedance/frameworks/baselib/log/LogHandler;->getType()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_1
    :goto_0
    return-void
.end method
