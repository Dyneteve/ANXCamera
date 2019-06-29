.class Lcom/bytedance/frameworks/baselib/log/LogItem;
.super Ljava/lang/Object;
.source "LogItem.java"


# instance fields
.field public id:J

.field public retry_count:I

.field public retry_time:J

.field public timestamp:J

.field public type:Ljava/lang/String;

.field public value:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bytedance/frameworks/baselib/log/LogItem;->type:Ljava/lang/String;

    iput-object p2, p0, Lcom/bytedance/frameworks/baselib/log/LogItem;->value:[B

    return-void
.end method
