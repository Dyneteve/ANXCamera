.class public Lcom/xiaomi/camera/parallelservice/util/ParallelUtil$DEBUG;
.super Ljava/lang/Object;
.source "ParallelUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/parallelservice/util/ParallelUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DEBUG"
.end annotation


# static fields
.field public static final ENABLE:Z = false


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static crash()V
    .locals 1

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/xiaomi/camera/parallelservice/util/ParallelUtil$DEBUG;->doAssert(Z)V

    return-void
.end method

.method public static doAssert(Z)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/xiaomi/camera/parallelservice/util/ParallelUtil$DEBUG;->doAssert(ZLjava/lang/String;)V

    return-void
.end method

.method public static doAssert(ZLjava/lang/String;)V
    .locals 0

    return-void
.end method
