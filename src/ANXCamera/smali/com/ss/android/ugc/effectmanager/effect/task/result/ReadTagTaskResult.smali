.class public Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;
.super Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;
.source "ReadTagTaskResult.java"


# instance fields
.field private exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

.field private mId:Ljava/lang/String;

.field private mTagsCachedMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mUpdateTime:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;-><init>()V

    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;->mTagsCachedMap:Ljava/util/HashMap;

    iput-object p4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;->exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;->mId:Ljava/lang/String;

    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;->mUpdateTime:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getException()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;->exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;->mId:Ljava/lang/String;

    return-object v0
.end method

.method public getTagsCachedMap()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;->mTagsCachedMap:Ljava/util/HashMap;

    return-object v0
.end method

.method public getUpdateTime()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;->mUpdateTime:Ljava/lang/String;

    return-object v0
.end method

.method public setException(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;->exception:Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;->mId:Ljava/lang/String;

    return-void
.end method

.method public setTagsCachedMap(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;->mTagsCachedMap:Ljava/util/HashMap;

    return-void
.end method

.method public setUpdateTime(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/result/ReadTagTaskResult;->mUpdateTime:Ljava/lang/String;

    return-void
.end method
