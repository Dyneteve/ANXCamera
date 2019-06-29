.class public abstract Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;
.super Ljava/lang/Object;
.source "NormalTask.java"

# interfaces
.implements Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;


# instance fields
.field protected mHandler:Landroid/os/Handler;

.field private mIsCanceled:Z

.field private mType:Ljava/lang/String;

.field protected taskId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/os/Handler;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;->mHandler:Landroid/os/Handler;

    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;->taskId:Ljava/lang/String;

    const-string p1, "NORMAL"

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;->mType:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;->mHandler:Landroid/os/Handler;

    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;->taskId:Ljava/lang/String;

    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;->mType:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;->mIsCanceled:Z

    return-void
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;->mType:Ljava/lang/String;

    return-object v0
.end method

.method public isCanceled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;->mIsCanceled:Z

    return v0
.end method

.method protected sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;->taskId:Ljava/lang/String;

    invoke-virtual {p2, v0}, Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;->setTaskID(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    iput-object p2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method
