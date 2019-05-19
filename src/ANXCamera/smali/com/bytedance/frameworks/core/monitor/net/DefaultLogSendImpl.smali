.class public Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;
.super Ljava/lang/Object;
.source "DefaultLogSendImpl.java"

# interfaces
.implements Lcom/bytedance/frameworks/core/monitor/net/ILogSendImpl;


# instance fields
.field mAid:Ljava/lang/String;

.field mContext:Landroid/content/Context;

.field mLogHandler:Lcom/bytedance/frameworks/baselib/log/LogHandler;

.field mLogType:Ljava/lang/String;

.field mMoreChannelSwitch:Z

.field mNetFailCount:I

.field mStatusCode:I

.field volatile mStopInterval:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mAid:Ljava/lang/String;

    new-instance v3, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$1;

    invoke-direct {v3, p0, p2, p3}, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$1;-><init>(Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v4, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$2;

    invoke-direct {v4, p0, p2}, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$2;-><init>(Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;Ljava/lang/String;)V

    new-instance p3, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    move-object v0, p3

    move-object v1, p0

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;-><init>(Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;Landroid/content/Context;Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;Lcom/bytedance/frameworks/baselib/log/LogHandler$IResponseConfig;Ljava/lang/String;)V

    iput-object p3, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mLogHandler:Lcom/bytedance/frameworks/baselib/log/LogHandler;

    return-void
.end method


# virtual methods
.method public logStopCollectSwitch()Z
    .locals 4

    iget-wide v0, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mStopInterval:J

    const-wide/32 v2, 0x1b7740

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public send(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mLogHandler:Lcom/bytedance/frameworks/baselib/log/LogHandler;

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/baselib/log/LogHandler;->enqueue(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method
