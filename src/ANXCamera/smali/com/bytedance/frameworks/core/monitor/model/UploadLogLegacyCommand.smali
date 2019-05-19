.class public Lcom/bytedance/frameworks/core/monitor/model/UploadLogLegacyCommand;
.super Ljava/lang/Object;
.source "UploadLogLegacyCommand.java"


# instance fields
.field public endTime:J

.field public startTime:J

.field private uploadTypeList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(JJLjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/bytedance/frameworks/core/monitor/model/UploadLogLegacyCommand;->startTime:J

    iput-wide p3, p0, Lcom/bytedance/frameworks/core/monitor/model/UploadLogLegacyCommand;->endTime:J

    iput-object p5, p0, Lcom/bytedance/frameworks/core/monitor/model/UploadLogLegacyCommand;->uploadTypeList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getUploadTypeList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/model/UploadLogLegacyCommand;->uploadTypeList:Ljava/util/List;

    return-object v0
.end method
