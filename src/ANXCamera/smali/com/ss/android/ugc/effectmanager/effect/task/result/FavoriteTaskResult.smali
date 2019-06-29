.class public Lcom/ss/android/ugc/effectmanager/effect/task/result/FavoriteTaskResult;
.super Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;
.source "FavoriteTaskResult.java"


# instance fields
.field private mEffectIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mException:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

.field private mIsSuccess:Z


# direct methods
.method public constructor <init>(ZLjava/util/List;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FavoriteTaskResult;->mEffectIds:Ljava/util/List;

    iput-boolean p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FavoriteTaskResult;->mIsSuccess:Z

    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FavoriteTaskResult;->mEffectIds:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FavoriteTaskResult;->mEffectIds:Ljava/util/List;

    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FavoriteTaskResult;->mException:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    return-void
.end method


# virtual methods
.method public getEffectIds()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FavoriteTaskResult;->mEffectIds:Ljava/util/List;

    return-object v0
.end method

.method public getException()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FavoriteTaskResult;->mException:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    return-object v0
.end method

.method public isSuccess()Z
    .locals 1

    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/FavoriteTaskResult;->mIsSuccess:Z

    return v0
.end method
