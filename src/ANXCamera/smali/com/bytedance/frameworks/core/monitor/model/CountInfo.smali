.class public Lcom/bytedance/frameworks/core/monitor/model/CountInfo;
.super Ljava/lang/Object;
.source "CountInfo.java"


# instance fields
.field public count:F

.field public firstTime:J

.field public isSampled:Z

.field public key:Ljava/lang/String;

.field public type:Ljava/lang/String;

.field public type2:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;FJ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;->key:Ljava/lang/String;

    iput-object p2, p0, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;->type:Ljava/lang/String;

    iput p3, p0, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;->count:F

    iput-wide p4, p0, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;->firstTime:J

    return-void
.end method


# virtual methods
.method public setType2(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/model/CountInfo;
    .locals 0

    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;->type2:Ljava/lang/String;

    return-object p0
.end method
