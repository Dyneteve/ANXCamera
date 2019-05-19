.class public Lcom/bytedance/frameworks/core/monitor/MonitorManager;
.super Ljava/lang/Object;
.source "MonitorManager.java"

# interfaces
.implements Lcom/bytedance/frameworks/core/monitor/LogTaskManager$IInactiveMonitor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MonitorManager"


# instance fields
.field private mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

.field private sIHandleOnTimeEvent:Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;)V
    .locals 1

    const-string v0, "default"

    invoke-direct {p0, p1, p2, v0}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;-><init>(Landroid/content/Context;Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p3, :cond_0

    const-string p3, "default"

    :cond_0
    new-instance v0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-direct {v0, p1, p3}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    iput-object p2, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->sIHandleOnTimeEvent:Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->sIHandleOnTimeEvent:Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {p1, p0}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->registerInactiveMonitor(Lcom/bytedance/frameworks/core/monitor/LogTaskManager$IInactiveMonitor;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public cleanExpiredLog(J)V
    .locals 1

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0, p1, p2}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->cleanExpiredLog(J)V

    return-void
.end method

.method public directOnCount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V
    .locals 7

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->handleDirectCount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public directOnTimer(Ljava/lang/String;Ljava/lang/String;FZ)V
    .locals 1

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->handleDirectTimer(Ljava/lang/String;Ljava/lang/String;FZ)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public flushBuffer2DB()V
    .locals 1

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->flushBuffer2DB()V

    return-void
.end method

.method public handleEvent()V
    .locals 1

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->sIHandleOnTimeEvent:Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->sIHandleOnTimeEvent:Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;

    invoke-interface {v0}, Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;->handleEvent()V

    return-void
.end method

.method public logSend(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->logSend(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-void
.end method

.method public logSend(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 7

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->logSend(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public logSend(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    invoke-virtual {p0, p1, p1, p2, p3}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->logSend(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public onCount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V
    .locals 7

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->handleCount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public onCount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 6

    const/high16 v4, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->onCount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V

    return-void
.end method

.method public onDebug(Ljava/lang/String;)V
    .locals 1

    const-string v0, ""

    invoke-virtual {p0, p1, v0}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->onDebug(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onDebug(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0, p1, p2}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->handleDebug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public onTimer(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V
    .locals 7

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->handleTimer(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public reportLogCountDaily(Z)V
    .locals 1

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->reportLogCountDaily(Z)V

    return-void
.end method

.method public setCurrentVersionInfo(Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;)V
    .locals 1

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->initCurrentVersionInfo(Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;)V

    return-void
.end method

.method public setReportLogSwitch(Z)V
    .locals 1

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->setReportLogSwitch(Z)V

    return-void
.end method

.method public stopMonitor()V
    .locals 1

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->quit()V

    return-void
.end method

.method public updateConfig()V
    .locals 1

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->handleUpdateConfig()V

    return-void
.end method

.method public uploadLegacyLog(Lcom/bytedance/frameworks/core/monitor/model/UploadLogLegacyCommand;)V
    .locals 1

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->uploadLogLegacy(Lcom/bytedance/frameworks/core/monitor/model/UploadLogLegacyCommand;)V

    return-void
.end method
