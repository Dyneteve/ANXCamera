.class public Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;
.super Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;
.source "EffectCheckUpdateResult.java"


# instance fields
.field private exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

.field private isUpdate:Z

.field private panel:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;ZLcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 1

    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->panel:Ljava/lang/String;

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->panel:Ljava/lang/String;

    iput-boolean p2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->isUpdate:Z

    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    return-void
.end method


# virtual methods
.method public getException()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    return-object v0
.end method

.method public getPanel()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->panel:Ljava/lang/String;

    return-object v0
.end method

.method public isUpdate()Z
    .locals 1

    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->isUpdate:Z

    return v0
.end method

.method public setException(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    return-void
.end method

.method public setUpdate(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->isUpdate:Z

    return-void
.end method
