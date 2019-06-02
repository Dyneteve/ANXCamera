.class public Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;
.super Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;
.source "FetchEffectChannelTask.java"


# static fields
.field private static final COMPRESSED_FILE_SUFFIX:Ljava/lang/String; = ".zip"

.field private static final TAG:Ljava/lang/String; = "SDK_FETCH_LIST"


# instance fields
.field private mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

.field private mCurCnt:I

.field private mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

.field private mFileCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

.field private mJsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

.field private mRemoteIp:Ljava/lang/String;

.field private mRequestedUrl:Ljava/lang/String;

.field private mSelectedHost:Ljava/lang/String;

.field private panel:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;)V
    .locals 1

    const-string v0, "NETWORK"

    invoke-direct {p0, p4, p3, v0}, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;-><init>(Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->panel:Ljava/lang/String;

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getCache()Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mFileCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getJsonConverter()Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mJsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getRetryCount()I

    move-result p1

    iput p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mCurCnt:I

    return-void
.end method

.method private buildEffectListRequest()Lcom/ss/android/ugc/effectmanager/common/EffectRequest;
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAccessKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "access_key"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAccessKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppVersion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "app_version"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getSdkVersion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "sdk_version"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getSdkVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getChannel()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "channel"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getChannel()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->panel:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "panel"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->panel:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getPlatform()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, "device_platform"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getPlatform()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "device_id"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getDeviceId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getRegion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, "region"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getRegion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getDeviceType()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_8

    const-string v1, "device_type"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getDeviceType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_8
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppID()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_9

    const-string v1, "aid"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_9
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_a

    const-string v1, "app_language"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getSysLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_b

    const-string v1, "language"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getSysLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_b
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getLinkSelector()Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->getBestHostUrl()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mSelectedHost:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mSelectedHost:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getApiAdress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/v3/effects"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/utils/NetworkUtils;->buildRequestUrl(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mRequestedUrl:Ljava/lang/String;

    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mRemoteIp:Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_1

    :catch_1
    move-exception v1

    invoke-virtual {v1}, Ljava/net/UnknownHostException;->printStackTrace()V

    :goto_0
    nop

    :goto_1
    new-instance v1, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;

    const-string v2, "GET"

    invoke-direct {v1, v2, v0}, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method private dealResponse(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;)Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;
    .locals 2

    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    invoke-direct {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;-><init>()V

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->panel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->setPanel(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->setVersion(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getEffects()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->setAllCategoryEffects(Ljava/util/List;)V

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getCollection()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->setCollections(Ljava/util/List;)V

    invoke-direct {p0, p1}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->initCategory(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->setCategoryResponseList(Ljava/util/List;)V

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getPanel()Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->setPanelModel(Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;)V

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getFront_effect_id()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, p1}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->getEffect(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;)Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->setFrontEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getRear_effect_id()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, p1}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->getEffect(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;)Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->setRearEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getEffects()Ljava/util/List;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->fillEffectPath(Ljava/util/List;)V

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getCollection()Ljava/util/List;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->fillEffectPath(Ljava/util/List;)V

    invoke-direct {p0, p1}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->saveEffectList(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;)V

    return-object v0
.end method

.method private deleteEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V
    .locals 2

    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/common/utils/EffectUtils;->isEffectValid(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mFileCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->remove(Ljava/lang/String;)Z

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mFileCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".zip"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->remove(Ljava/lang/String;)Z

    return-void
.end method

.method private fillEffectPath(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_2

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getEffectDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".zip"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->setZipPath(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getEffectDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->setUnzipPath(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    return-void

    :cond_2
    :goto_1
    return-void
.end method

.method private getCategoryAddedEffects(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation

    if-eqz p1, :cond_5

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    nop

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const/4 v1, 0x1

    move v2, v1

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    invoke-virtual {v3, v5}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v2, 0x0

    :cond_1
    goto :goto_1

    :cond_2
    if-eqz v2, :cond_3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    nop

    move v2, v1

    :cond_3
    goto :goto_0

    :cond_4
    return-object v0

    :cond_5
    :goto_2
    return-object p2
.end method

.method private getCategoryAllEffects(Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;Ljava/util/Map;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->getEffects()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    if-eqz v1, :cond_0

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private getCategoryDeletedEffects(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p1, :cond_5

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_2

    :cond_0
    nop

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v1, 0x1

    move v2, v1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    invoke-virtual {v3, v5}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v2, 0x0

    :cond_1
    goto :goto_1

    :cond_2
    if-eqz v2, :cond_3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    nop

    move v2, v1

    :cond_3
    goto :goto_0

    :cond_4
    return-object v0

    :cond_5
    :goto_2
    return-object v0
.end method

.method private getEffect(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;)Lcom/ss/android/ugc/effectmanager/effect/model/Effect;
    .locals 3

    nop

    invoke-virtual {p2}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getEffects()Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const/4 v0, 0x0

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getEffectId()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    nop

    move-object v0, v1

    :cond_0
    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private initCategory(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;",
            ")",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getEffects()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getEffectId()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getCategory()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getCategory()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;

    new-instance v4, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;

    invoke-direct {v4}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;-><init>()V

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->setId(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->setName(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->getIcon()Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    move-result-object v5

    invoke-virtual {v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->getUrl_list()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    const/4 v6, 0x0

    if-nez v5, :cond_1

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->getIcon()Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    move-result-object v5

    invoke-virtual {v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->getUrl_list()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->setIcon_normal_url(Ljava/lang/String;)V

    :cond_1
    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->getIcon_selected()Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    move-result-object v5

    invoke-virtual {v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->getUrl_list()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->getIcon_selected()Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    move-result-object v5

    invoke-virtual {v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->getUrl_list()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->setIcon_selected_url(Ljava/lang/String;)V

    :cond_2
    invoke-direct {p0, v3, v1}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->getCategoryAllEffects(Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;Ljava/util/Map;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->setTotalEffects(Ljava/util/List;)V

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->getTags()Ljava/util/List;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->setTags(Ljava/util/List;)V

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->getTagsUpdated()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->setTagsUpdateTime(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getCollection()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->setCollectionEffect(Ljava/util/List;)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    return-object v0
.end method

.method private saveEffectList(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;)V
    .locals 3

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mFileCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "effectchannel"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->panel:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mJsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    invoke-interface {v2, p1}, Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;->convertObjToJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->save(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public execute()V
    .locals 7

    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->buildEffectListRequest()Lcom/ss/android/ugc/effectmanager/common/EffectRequest;

    move-result-object v0

    :goto_0
    iget v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mCurCnt:I

    add-int/lit8 v2, v1, -0x1

    iput v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mCurCnt:I

    if-eqz v1, :cond_4

    const/16 v1, 0xe

    :try_start_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->isCanceled()Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    const/16 v3, 0x2711

    invoke-direct {v2, v3}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(I)V

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mRequestedUrl:Ljava/lang/String;

    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mSelectedHost:Ljava/lang/String;

    iget-object v5, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mRemoteIp:Ljava/lang/String;

    invoke-virtual {v2, v3, v4, v5}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->setTrackParams(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;

    new-instance v4, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    iget-object v5, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->panel:Ljava/lang/String;

    invoke-direct {v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4, v2}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;-><init>(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v1, v3}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    goto/16 :goto_2

    :cond_0
    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getEffectNetWorker()Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;

    move-result-object v2

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mJsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    const-class v4, Lcom/ss/android/ugc/effectmanager/effect/model/net/EffectNetListResponse;

    invoke-virtual {v2, v0, v3, v4}, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;->execute(Lcom/ss/android/ugc/effectmanager/common/EffectRequest;Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;Ljava/lang/Class;)Lcom/ss/android/ugc/effectmanager/common/model/BaseNetResponse;

    move-result-object v2

    check-cast v2, Lcom/ss/android/ugc/effectmanager/effect/model/net/EffectNetListResponse;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/effect/model/net/EffectNetListResponse;->checkValued()Z

    move-result v3

    if-nez v3, :cond_1

    iget v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mCurCnt:I

    if-nez v2, :cond_2

    new-instance v2, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    const/16 v3, 0x2712

    invoke-direct {v2, v3}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(I)V

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mRequestedUrl:Ljava/lang/String;

    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mSelectedHost:Ljava/lang/String;

    iget-object v5, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mRemoteIp:Ljava/lang/String;

    invoke-virtual {v2, v3, v4, v5}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;->setTrackParams(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;

    new-instance v4, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    iget-object v5, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->panel:Ljava/lang/String;

    invoke-direct {v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4, v2}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;-><init>(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v1, v3}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    goto :goto_2

    :cond_1
    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/effect/model/net/EffectNetListResponse;->getData()Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;

    move-result-object v2

    new-instance v3, Lcom/ss/android/ugc/effectmanager/effect/model/BuildEffectChannelResponse;

    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->panel:Ljava/lang/String;

    iget-object v5, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v5}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v5

    invoke-virtual {v5}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getEffectDir()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-direct {v3, v4, v5, v6}, Lcom/ss/android/ugc/effectmanager/effect/model/BuildEffectChannelResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v3, v2}, Lcom/ss/android/ugc/effectmanager/effect/model/BuildEffectChannelResponse;->buildChannelResponse(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;)Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    move-result-object v3

    invoke-direct {p0, v2}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->saveEffectList(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;)V

    new-instance v2, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;-><init>(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v1, v2}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v2

    iget v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->mCurCnt:I

    if-eqz v3, :cond_3

    instance-of v3, v2, Lcom/ss/android/ugc/effectmanager/common/exception/StatusCodeException;

    if-eqz v3, :cond_2

    goto :goto_1

    :cond_2
    goto/16 :goto_0

    :cond_3
    :goto_1
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;

    new-instance v3, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->panel:Ljava/lang/String;

    invoke-direct {v3, v4}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;-><init>(Ljava/lang/String;)V

    new-instance v4, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    invoke-direct {v4, v2}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-direct {v0, v3, v4}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;-><init>(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v1, v0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    nop

    :cond_4
    :goto_2
    return-void
.end method
