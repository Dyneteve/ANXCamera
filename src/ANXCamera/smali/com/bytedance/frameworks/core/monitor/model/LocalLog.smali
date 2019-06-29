.class public Lcom/bytedance/frameworks/core/monitor/model/LocalLog;
.super Ljava/lang/Object;
.source "LocalLog.java"


# instance fields
.field public createTime:J

.field public data:Ljava/lang/String;

.field public id:J

.field public isSampled:Z

.field public type:Ljava/lang/String;

.field public type2:Ljava/lang/String;

.field public versionId:J


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(JLjava/lang/String;JLjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->id:J

    iput-object p3, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->type:Ljava/lang/String;

    iput-object p6, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->data:Ljava/lang/String;

    iput-wide p4, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->versionId:J

    return-void
.end method


# virtual methods
.method public setData(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;
    .locals 0

    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->data:Ljava/lang/String;

    return-object p0
.end method

.method public setId(J)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;
    .locals 0

    iput-wide p1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->id:J

    return-object p0
.end method

.method public setIsSampled(Z)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;
    .locals 0

    iput-boolean p1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->isSampled:Z

    return-object p0
.end method

.method public setTimestamp(J)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;
    .locals 0

    iput-wide p1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->createTime:J

    return-object p0
.end method

.method public setType(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;
    .locals 0

    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->type:Ljava/lang/String;

    return-object p0
.end method

.method public setType2(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;
    .locals 0

    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->type2:Ljava/lang/String;

    return-object p0
.end method

.method public setVersionId(J)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;
    .locals 0

    iput-wide p1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->versionId:J

    return-object p0
.end method
