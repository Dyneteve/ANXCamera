.class public Lcom/bytedance/frameworks/core/monitor/LogVersionManager;
.super Ljava/lang/Object;
.source "LogVersionManager.java"


# static fields
.field private static sLogVersionManager:Lcom/bytedance/frameworks/core/monitor/LogVersionManager;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mCurrentVersionId:J

.field private mCurrentVersionInfo:Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;

.field private mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;


# direct methods
.method protected constructor <init>(Landroid/content/Context;Lcom/bytedance/frameworks/core/monitor/LogStoreManager;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "monitorlib"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "LogVersionManager: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->getAid()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " , threadName: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogVersionManager;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/bytedance/frameworks/core/monitor/LogVersionManager;->mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    return-void
.end method


# virtual methods
.method protected checkAndSaveVersion()J
    .locals 2

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogVersionManager;->mCurrentVersionInfo:Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;

    if-nez v0, :cond_0

    const-wide/32 v0, 0x7fffffff

    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogVersionManager;->mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    invoke-virtual {v0}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->getLatestLocalVersion()Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/LogVersionManager;->mCurrentVersionInfo:Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;

    invoke-virtual {v0, v1}, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-wide v0, v0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->id:J

    iput-wide v0, p0, Lcom/bytedance/frameworks/core/monitor/LogVersionManager;->mCurrentVersionId:J

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogVersionManager;->mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/LogVersionManager;->mCurrentVersionInfo:Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;

    invoke-virtual {v0, v1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->saveLocalVersion(Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/bytedance/frameworks/core/monitor/LogVersionManager;->mCurrentVersionId:J

    :goto_0
    iget-wide v0, p0, Lcom/bytedance/frameworks/core/monitor/LogVersionManager;->mCurrentVersionId:J

    return-wide v0
.end method

.method public getCurrentVersionId()J
    .locals 2

    iget-wide v0, p0, Lcom/bytedance/frameworks/core/monitor/LogVersionManager;->mCurrentVersionId:J

    return-wide v0
.end method

.method public setCurrentVersionInfo(Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogVersionManager;->mCurrentVersionInfo:Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;

    invoke-virtual {p0}, Lcom/bytedance/frameworks/core/monitor/LogVersionManager;->checkAndSaveVersion()J

    return-void
.end method
