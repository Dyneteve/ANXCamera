.class Landroid/support/v7/util/MessageThreadUtil$MessageQueue;
.super Ljava/lang/Object;
.source "MessageThreadUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/util/MessageThreadUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MessageQueue"
.end annotation


# instance fields
.field private mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method declared-synchronized next()Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    .registers 3

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_14

    if-nez v0, :cond_8

    const/4 v0, 0x0

    monitor-exit p0

    return-object v0

    :cond_8
    :try_start_8
    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    iget-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    # getter for: Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    invoke-static {v1}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$200(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :try_end_12
    .catchall {:try_start_8 .. :try_end_12} :catchall_14

    monitor-exit p0

    return-object v0

    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized removeMessages(I)V
    .registers 6

    monitor-enter p0

    :goto_1
    :try_start_1
    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    if-eqz v0, :cond_19

    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    iget v0, v0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->what:I

    if-ne v0, p1, :cond_19

    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    iget-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    # getter for: Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    invoke-static {v1}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$200(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    invoke-virtual {v0}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->recycle()V

    goto :goto_1

    :cond_19
    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    if-eqz v0, :cond_37

    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    # getter for: Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    invoke-static {v0}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$200(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v1

    :goto_23
    if-eqz v1, :cond_37

    # getter for: Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    invoke-static {v1}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$200(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v2

    iget v3, v1, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->what:I

    if-ne v3, p1, :cond_34

    # setter for: Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    invoke-static {v0, v2}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$202(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    invoke-virtual {v1}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->recycle()V
    :try_end_33
    .catchall {:try_start_1 .. :try_end_33} :catchall_39

    goto :goto_35

    :cond_34
    move-object v0, v1

    :goto_35
    move-object v1, v2

    goto :goto_23

    :cond_37
    monitor-exit p0

    return-void

    :catchall_39
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized sendMessage(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)V
    .registers 4

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    if-nez v0, :cond_9

    iput-object p1, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_1c

    monitor-exit p0

    return-void

    :cond_9
    :try_start_9
    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    :goto_b
    # getter for: Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    invoke-static {v0}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$200(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v1

    if-eqz v1, :cond_17

    # getter for: Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    invoke-static {v0}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$200(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v1

    move-object v0, v1

    goto :goto_b

    :cond_17
    # setter for: Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    invoke-static {v0, p1}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$202(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :try_end_1a
    .catchall {:try_start_9 .. :try_end_1a} :catchall_1c

    monitor-exit p0

    return-void

    :catchall_1c
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized sendMessageAtFrontOfQueue(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)V
    .registers 3

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    # setter for: Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    invoke-static {p1, v0}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$202(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    iput-object p1, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    monitor-exit p0

    return-void

    :catchall_a
    move-exception p1

    monitor-exit p0

    throw p1
.end method
