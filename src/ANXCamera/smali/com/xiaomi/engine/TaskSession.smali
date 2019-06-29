.class public Lcom/xiaomi/engine/TaskSession;
.super Ljava/lang/Object;
.source "TaskSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/engine/TaskSession$FrameCallback;,
        Lcom/xiaomi/engine/TaskSession$SessionStatusCallback;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mHasDestroyed:Z

.field private mHasFlushed:Z

.field private final mSessionHandle:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/xiaomi/engine/TaskSession;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/engine/TaskSession;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/xiaomi/engine/TaskSession;->mSessionHandle:J

    return-void
.end method

.method private destroy()V
    .locals 2

    iget-boolean v0, p0, Lcom/xiaomi/engine/TaskSession;->mHasDestroyed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-wide v0, p0, Lcom/xiaomi/engine/TaskSession;->mSessionHandle:J

    invoke-static {v0, v1}, Lcom/xiaomi/engine/MiCamAlgoInterfaceJNI;->destroySession(J)I

    move-result v0

    invoke-static {v0}, Lcom/xiaomi/engine/Util;->assertOrNot(I)V

    if-nez v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/engine/TaskSession;->mHasDestroyed:Z

    :cond_1
    return-void
.end method

.method private flush()V
    .locals 2

    iget-boolean v0, p0, Lcom/xiaomi/engine/TaskSession;->mHasFlushed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-wide v0, p0, Lcom/xiaomi/engine/TaskSession;->mSessionHandle:J

    invoke-static {v0, v1}, Lcom/xiaomi/engine/MiCamAlgoInterfaceJNI;->flush(J)I

    move-result v0

    invoke-static {v0}, Lcom/xiaomi/engine/Util;->assertOrNot(I)V

    if-nez v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/engine/TaskSession;->mHasFlushed:Z

    :cond_1
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    invoke-direct {p0}, Lcom/xiaomi/engine/TaskSession;->flush()V

    invoke-direct {p0}, Lcom/xiaomi/engine/TaskSession;->destroy()V

    sget-object v0, Lcom/xiaomi/engine/TaskSession;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "close: session has closed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/xiaomi/engine/TaskSession;->close()V

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method public processFrame(Lcom/xiaomi/engine/FrameData;Lcom/xiaomi/engine/TaskSession$FrameCallback;)V
    .locals 3
    .param p1    # Lcom/xiaomi/engine/FrameData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lcom/xiaomi/engine/TaskSession;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processFrame: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/engine/FrameData;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-wide v0, p0, Lcom/xiaomi/engine/TaskSession;->mSessionHandle:J

    invoke-static {v0, v1, p1, p2}, Lcom/xiaomi/engine/MiCamAlgoInterfaceJNI;->processFrame(JLcom/xiaomi/engine/FrameData;Lcom/xiaomi/engine/TaskSession$FrameCallback;)I

    move-result p1

    if-nez p1, :cond_0

    const-string v0, "onProcessStarted"

    const/4 v1, 0x0

    invoke-interface {p2, p1, v0, v1}, Lcom/xiaomi/engine/TaskSession$FrameCallback;->onFrameProcessed(ILjava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/xiaomi/engine/Util;->assertOrNot(I)V

    :goto_0
    return-void
.end method
