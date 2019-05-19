.class public Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;
.super Ljava/lang/Object;
.source "EffectNetWorkerWrapper.java"


# instance fields
.field private mIEffectNetWorker:Lcom/ss/android/ugc/effectmanager/common/listener/IEffectNetWorker;

.field private mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;


# direct methods
.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/common/listener/IEffectNetWorker;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;->mIEffectNetWorker:Lcom/ss/android/ugc/effectmanager/common/listener/IEffectNetWorker;

    return-void
.end method


# virtual methods
.method public execute(Lcom/ss/android/ugc/effectmanager/common/EffectRequest;Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;Ljava/lang/Class;)Lcom/ss/android/ugc/effectmanager/common/model/BaseNetResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/ss/android/ugc/effectmanager/common/model/BaseNetResponse;",
            ">(",
            "Lcom/ss/android/ugc/effectmanager/common/EffectRequest;",
            "Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lcom/ss/android/ugc/effectmanager/common/model/BaseNetResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;->mIEffectNetWorker:Lcom/ss/android/ugc/effectmanager/common/listener/IEffectNetWorker;

    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/common/listener/IEffectNetWorker;->execute(Lcom/ss/android/ugc/effectmanager/common/EffectRequest;)Ljava/io/InputStream;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->getUrl()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->onApiError(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->isNetworkAvailable()Z

    move-result p1

    if-nez p1, :cond_0

    new-instance p1, Ljava/lang/Exception;

    const-string p2, "network unavailable"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_0
    new-instance p1, Landroid/accounts/NetworkErrorException;

    const-string p2, "Download error"

    invoke-direct {p1, p2}, Landroid/accounts/NetworkErrorException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    invoke-interface {p2, v0, p3}, Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;->convertJsonToObj(Ljava/io/InputStream;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/ss/android/ugc/effectmanager/common/model/BaseNetResponse;

    if-eqz p2, :cond_3

    invoke-virtual {p2}, Lcom/ss/android/ugc/effectmanager/common/model/BaseNetResponse;->getStatus_code()I

    move-result p3

    if-nez p3, :cond_2

    return-object p2

    :cond_2
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->getUrl()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->onApiError(Ljava/lang/String;)V

    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/exception/StatusCodeException;

    invoke-virtual {p2}, Lcom/ss/android/ugc/effectmanager/common/model/BaseNetResponse;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p3, p2}, Lcom/ss/android/ugc/effectmanager/common/exception/StatusCodeException;-><init>(ILjava/lang/String;)V

    throw p1

    :cond_3
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->getUrl()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->onApiError(Ljava/lang/String;)V

    new-instance p1, Lorg/json/JSONException;

    const-string p2, "Json convert fail"

    invoke-direct {p1, p2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public execute(Lcom/ss/android/ugc/effectmanager/common/EffectRequest;)Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;->mIEffectNetWorker:Lcom/ss/android/ugc/effectmanager/common/listener/IEffectNetWorker;

    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/common/listener/IEffectNetWorker;->execute(Lcom/ss/android/ugc/effectmanager/common/EffectRequest;)Ljava/io/InputStream;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->getUrl()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->onApiError(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->isNetworkAvailable()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "network unavailable"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    return-object v0
.end method

.method public setIEffectNetWorker(Lcom/ss/android/ugc/effectmanager/common/listener/IEffectNetWorker;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;->mIEffectNetWorker:Lcom/ss/android/ugc/effectmanager/common/listener/IEffectNetWorker;

    return-void
.end method

.method public setLinkSelector(Lcom/ss/android/ugc/effectmanager/link/LinkSelector;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    return-void
.end method
