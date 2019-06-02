.class public final Landroid/support/v4/os/CancellationSignal;
.super Ljava/lang/Object;
.source "CancellationSignal.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/os/CancellationSignal$OnCancelListener;
    }
.end annotation


# instance fields
.field private mCancelInProgress:Z

.field private mCancellationSignalObj:Ljava/lang/Object;

.field private mIsCanceled:Z

.field private mOnCancelListener:Landroid/support/v4/os/CancellationSignal$OnCancelListener;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private waitForCancelFinishedLocked()V
    .registers 2

    :goto_0
    iget-boolean v0, p0, Landroid/support/v4/os/CancellationSignal;->mCancelInProgress:Z

    if-eqz v0, :cond_a

    :try_start_4
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_7} :catch_8

    :goto_7
    goto :goto_0

    :catch_8
    move-exception v0

    goto :goto_7

    :cond_a
    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 6

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    iget-boolean v1, p0, Landroid/support/v4/os/CancellationSignal;->mIsCanceled:Z

    if-eqz v1, :cond_8

    monitor-exit p0

    return-void

    :cond_8
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/support/v4/os/CancellationSignal;->mIsCanceled:Z

    iput-boolean v1, p0, Landroid/support/v4/os/CancellationSignal;->mCancelInProgress:Z

    iget-object v1, p0, Landroid/support/v4/os/CancellationSignal;->mOnCancelListener:Landroid/support/v4/os/CancellationSignal$OnCancelListener;
    :try_end_f
    .catchall {:try_start_2 .. :try_end_f} :catchall_3f

    :try_start_f
    iget-object v2, p0, Landroid/support/v4/os/CancellationSignal;->mCancellationSignalObj:Ljava/lang/Object;

    move-object v0, v2

    monitor-exit p0
    :try_end_13
    .catchall {:try_start_f .. :try_end_13} :catchall_39

    const/4 v2, 0x0

    if-eqz v1, :cond_1c

    :try_start_16
    invoke-interface {v1}, Landroid/support/v4/os/CancellationSignal$OnCancelListener;->onCancel()V

    goto :goto_1c

    :catchall_1a
    move-exception v3

    goto :goto_22

    :cond_1c
    :goto_1c
    if-eqz v0, :cond_2d

    invoke-static {v0}, Landroid/support/v4/os/CancellationSignalCompatJellybean;->cancel(Ljava/lang/Object;)V
    :try_end_21
    .catchall {:try_start_16 .. :try_end_21} :catchall_1a

    goto :goto_2d

    :goto_22
    monitor-enter p0

    :try_start_23
    iput-boolean v2, p0, Landroid/support/v4/os/CancellationSignal;->mCancelInProgress:Z

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit p0
    :try_end_29
    .catchall {:try_start_23 .. :try_end_29} :catchall_2a

    throw v3

    :catchall_2a
    move-exception v2

    :try_start_2b
    monitor-exit p0
    :try_end_2c
    .catchall {:try_start_2b .. :try_end_2c} :catchall_2a

    throw v2

    :cond_2d
    :goto_2d
    monitor-enter p0

    :try_start_2e
    iput-boolean v2, p0, Landroid/support/v4/os/CancellationSignal;->mCancelInProgress:Z

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit p0

    nop

    return-void

    :catchall_36
    move-exception v2

    monitor-exit p0
    :try_end_38
    .catchall {:try_start_2e .. :try_end_38} :catchall_36

    throw v2

    :catchall_39
    move-exception v2

    move-object v4, v2

    move-object v2, v0

    move-object v0, v1

    move-object v1, v4

    goto :goto_41

    :catchall_3f
    move-exception v1

    move-object v2, v0

    :goto_41
    :try_start_41
    monitor-exit p0
    :try_end_42
    .catchall {:try_start_41 .. :try_end_42} :catchall_43

    throw v1

    :catchall_43
    move-exception v1

    goto :goto_41
.end method

.method public getCancellationSignalObject()Ljava/lang/Object;
    .registers 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_8

    const/4 v0, 0x0

    return-object v0

    :cond_8
    monitor-enter p0

    :try_start_9
    iget-object v0, p0, Landroid/support/v4/os/CancellationSignal;->mCancellationSignalObj:Ljava/lang/Object;

    if-nez v0, :cond_1c

    invoke-static {}, Landroid/support/v4/os/CancellationSignalCompatJellybean;->create()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/os/CancellationSignal;->mCancellationSignalObj:Ljava/lang/Object;

    iget-boolean v0, p0, Landroid/support/v4/os/CancellationSignal;->mIsCanceled:Z

    if-eqz v0, :cond_1c

    iget-object v0, p0, Landroid/support/v4/os/CancellationSignal;->mCancellationSignalObj:Ljava/lang/Object;

    invoke-static {v0}, Landroid/support/v4/os/CancellationSignalCompatJellybean;->cancel(Ljava/lang/Object;)V

    :cond_1c
    iget-object v0, p0, Landroid/support/v4/os/CancellationSignal;->mCancellationSignalObj:Ljava/lang/Object;

    monitor-exit p0

    return-object v0

    :catchall_20
    move-exception v0

    monitor-exit p0
    :try_end_22
    .catchall {:try_start_9 .. :try_end_22} :catchall_20

    throw v0
.end method

.method public isCanceled()Z
    .registers 2

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Landroid/support/v4/os/CancellationSignal;->mIsCanceled:Z

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_5

    throw v0
.end method

.method public setOnCancelListener(Landroid/support/v4/os/CancellationSignal$OnCancelListener;)V
    .registers 3

    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Landroid/support/v4/os/CancellationSignal;->waitForCancelFinishedLocked()V

    iget-object v0, p0, Landroid/support/v4/os/CancellationSignal;->mOnCancelListener:Landroid/support/v4/os/CancellationSignal$OnCancelListener;

    if-ne v0, p1, :cond_a

    monitor-exit p0

    return-void

    :cond_a
    iput-object p1, p0, Landroid/support/v4/os/CancellationSignal;->mOnCancelListener:Landroid/support/v4/os/CancellationSignal$OnCancelListener;

    iget-boolean v0, p0, Landroid/support/v4/os/CancellationSignal;->mIsCanceled:Z

    if-eqz v0, :cond_18

    if-nez p1, :cond_13

    goto :goto_18

    :cond_13
    monitor-exit p0
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_1a

    invoke-interface {p1}, Landroid/support/v4/os/CancellationSignal$OnCancelListener;->onCancel()V

    return-void

    :cond_18
    :goto_18
    :try_start_18
    monitor-exit p0

    return-void

    :catchall_1a
    move-exception v0

    monitor-exit p0
    :try_end_1c
    .catchall {:try_start_18 .. :try_end_1c} :catchall_1a

    throw v0
.end method

.method public throwIfCanceled()V
    .registers 2

    invoke-virtual {p0}, Landroid/support/v4/os/CancellationSignal;->isCanceled()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    new-instance v0, Landroid/support/v4/os/OperationCanceledException;

    invoke-direct {v0}, Landroid/support/v4/os/OperationCanceledException;-><init>()V

    throw v0
.end method
