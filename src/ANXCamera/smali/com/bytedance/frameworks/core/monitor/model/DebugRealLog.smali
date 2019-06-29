.class public Lcom/bytedance/frameworks/core/monitor/model/DebugRealLog;
.super Ljava/lang/Object;
.source "DebugRealLog.java"


# instance fields
.field public traceCode:Ljava/lang/String;

.field public value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/model/DebugRealLog;->value:Ljava/lang/String;

    iput-object p2, p0, Lcom/bytedance/frameworks/core/monitor/model/DebugRealLog;->traceCode:Ljava/lang/String;

    return-void
.end method
