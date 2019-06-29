.class public Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;
.super Ljava/lang/Object;
.source "InitialLogInfo.java"


# instance fields
.field public isSampled:Z

.field public key:Ljava/lang/String;

.field public type:Ljava/lang/String;

.field public type2:Ljava/lang/String;

.field public value:F


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->type:Ljava/lang/String;

    iput-object p2, p0, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->type2:Ljava/lang/String;

    iput-object p3, p0, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->key:Ljava/lang/String;

    iput p4, p0, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->value:F

    iput-boolean p5, p0, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->isSampled:Z

    return-void
.end method
