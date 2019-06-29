.class public Lcom/android/camera/effect/framework/utils/CounterUtil;
.super Ljava/lang/Object;
.source "CounterUtil.java"


# static fields
.field private static TAG:Ljava/lang/String;


# instance fields
.field private mTs:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/effect/framework/utils/CounterUtil;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/framework/utils/CounterUtil;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public reset()V
    .locals 2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/effect/framework/utils/CounterUtil;->mTs:J

    return-void
.end method

.method public reset(Ljava/lang/String;)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/effect/framework/utils/CounterUtil;->reset()V

    sget-object v0, Lcom/android/camera/effect/framework/utils/CounterUtil;->TAG:Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public tick(Ljava/lang/String;)V
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-object v2, Lcom/android/camera/effect/framework/utils/CounterUtil;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ":"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v4, p0, Lcom/android/camera/effect/framework/utils/CounterUtil;->mTs:J

    sub-long v4, v0, v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iput-wide v0, p0, Lcom/android/camera/effect/framework/utils/CounterUtil;->mTs:J

    return-void
.end method
