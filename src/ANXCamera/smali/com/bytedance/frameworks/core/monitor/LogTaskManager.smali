.class public Lcom/bytedance/frameworks/core/monitor/LogTaskManager;
.super Ljava/lang/Object;
.source "LogTaskManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/frameworks/core/monitor/LogTaskManager$IInactiveMonitor;
    }
.end annotation


# static fields
.field private static final WAIT_INTERVAL:I = 0x3a98

.field private static sHandlerThread:Landroid/os/HandlerThread;


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mTimerRunnable:Ljava/lang/Runnable;

.field private sAllInactiveMonitor:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bytedance/frameworks/core/monitor/LogTaskManager$IInactiveMonitor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->sAllInactiveMonitor:Ljava/util/List;

    new-instance v0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager$1;

    invoke-direct {v0, p0}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager$1;-><init>(Lcom/bytedance/frameworks/core/monitor/LogTaskManager;)V

    iput-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->mTimerRunnable:Ljava/lang/Runnable;

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->sHandlerThread:Landroid/os/HandlerThread;

    if-nez v0, :cond_0

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "monitorlib"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->sHandlerThread:Landroid/os/HandlerThread;

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->sHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    :cond_0
    new-instance v0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;

    sget-object v1, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->sHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;-><init>(Landroid/os/Looper;Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->mHandler:Landroid/os/Handler;

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->mHandler:Landroid/os/Handler;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->mHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->mTimerRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic access$000(Lcom/bytedance/frameworks/core/monitor/LogTaskManager;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$100(Lcom/bytedance/frameworks/core/monitor/LogTaskManager;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->sAllInactiveMonitor:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public cleanExpiredLog(J)V
    .locals 2

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/16 v1, 0x10

    iput v1, v0, Landroid/os/Message;->what:I

    long-to-int p1, p1

    iput p1, v0, Landroid/os/Message;->arg1:I

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public flushBuffer2DB()V
    .locals 2

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/16 v1, 0xc

    iput v1, v0, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public handleCount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V
    .locals 8

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x3

    iput v1, v0, Landroid/os/Message;->what:I

    new-instance v1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;

    move-object v2, v1

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move v6, p4

    move v7, p5

    invoke-direct/range {v2 .. v7}, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public handleDebug(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x5

    iput v1, v0, Landroid/os/Message;->what:I

    new-instance v1, Lcom/bytedance/frameworks/core/monitor/model/DebugRealLog;

    invoke-direct {v1, p1, p2}, Lcom/bytedance/frameworks/core/monitor/model/DebugRealLog;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public handleDirectCount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V
    .locals 8

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x7

    iput v1, v0, Landroid/os/Message;->what:I

    new-instance v1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;

    move-object v2, v1

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move v6, p4

    move v7, p5

    invoke-direct/range {v2 .. v7}, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public handleDirectTimer(Ljava/lang/String;Ljava/lang/String;FZ)V
    .locals 8

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x6

    iput v1, v0, Landroid/os/Message;->what:I

    new-instance v1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;

    const-string v4, ""

    move-object v2, v1

    move-object v3, p1

    move-object v5, p2

    move v6, p3

    move v7, p4

    invoke-direct/range {v2 .. v7}, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public handleTimer(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V
    .locals 8

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x4

    iput v1, v0, Landroid/os/Message;->what:I

    new-instance v1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;

    move-object v2, v1

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move v6, p4

    move v7, p5

    invoke-direct/range {v2 .. v7}, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public handleUpdateConfig()V
    .locals 2

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/16 v1, 0x8

    iput v1, v0, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public initCurrentVersionInfo(Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;)V
    .locals 2

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x2

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public logSend(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 2

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/16 v1, 0xa

    iput v1, v0, Landroid/os/Message;->what:I

    iput p5, v0, Landroid/os/Message;->arg1:I

    new-instance p5, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    invoke-direct {p5}, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;-><init>()V

    invoke-virtual {p5, p1}, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->setType(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->setType2(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->setData(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    move-result-object p1

    invoke-virtual {p1, p4}, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->setIsSampled(Z)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    move-result-object p1

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public quit()V
    .locals 0

    return-void
.end method

.method public registerInactiveMonitor(Lcom/bytedance/frameworks/core/monitor/LogTaskManager$IInactiveMonitor;)V
    .locals 1

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->sAllInactiveMonitor:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->sAllInactiveMonitor:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public reportLogCountDaily(Z)V
    .locals 2

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/16 v1, 0xf

    iput v1, v0, Landroid/os/Message;->what:I

    iput p1, v0, Landroid/os/Message;->arg1:I

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public setReportLogSwitch(Z)V
    .locals 2

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/16 v1, 0x9

    iput v1, v0, Landroid/os/Message;->what:I

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public unregisterInavtiveMonitor(Lcom/bytedance/frameworks/core/monitor/LogTaskManager$IInactiveMonitor;)V
    .locals 1

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->sAllInactiveMonitor:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->sAllInactiveMonitor:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public uploadLogLegacy(Lcom/bytedance/frameworks/core/monitor/model/UploadLogLegacyCommand;)V
    .locals 2

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/16 v1, 0xb

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
