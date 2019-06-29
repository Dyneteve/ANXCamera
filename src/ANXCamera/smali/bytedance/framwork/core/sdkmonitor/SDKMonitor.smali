.class public Lbytedance/framwork/core/sdkmonitor/SDKMonitor;
.super Ljava/lang/Object;
.source "SDKMonitor.java"

# interfaces
.implements Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;
.implements Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;
.implements Lcom/bytedance/frameworks/core/monitor/net/ISendLog;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;
    }
.end annotation


# static fields
.field private static final SDK_VERSION:I = 0x190


# instance fields
.field private mAid:Ljava/lang/String;

.field private volatile mAllowService:Lorg/json/JSONObject;

.field private mCacheData:Lbytedance/framwork/core/sdkmonitor/CacheData;

.field private mCommonParams:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mConfigExit:Z

.field private mConfigUrls:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private volatile mFetchSettingInterval:J

.field private mGetCommonParams:Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;

.field private volatile mHasInit:Z

.field private mHeaderInfo:Lorg/json/JSONObject;

.field private volatile mIsEncrypt:Z

.field private volatile mLastFetchSettingTime:J

.field private volatile mLogRemoveNet:Z

.field private volatile mLogRemoveSwitch:Z

.field private volatile mLogSendSwitch:I

.field private mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

.field private volatile mMonitorMaxRowCount:J

.field private volatile mReportCount:I

.field private volatile mReportFailBaseTime:I

.field private volatile mReportFailRepeatCount:I

.field private volatile mReportInterval:I

.field private mReportTypeList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mReportUrlList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mStopCollectInterval:J

.field private volatile mStopCollectLogTime:J

.field private volatile mStopIntervalTimes:I

.field private volatile mStopMoreChannelInterval:J

.field private mUploadTypeListInDefaultReportType:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;)V
    .locals 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLastFetchSettingTime:J

    const/4 v2, 0x1

    iput v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogSendSwitch:I

    new-instance v3, Ljava/util/ArrayList;

    const-string v4, "http://mon.snssdk.com/monitor/appmonitor/v2/settings"

    const-string v5, "http://monsetting.toutiao.com/monitor/appmonitor/v2/settings"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v3, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigUrls:Ljava/util/List;

    iput-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopCollectLogTime:J

    iput-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopCollectInterval:J

    const/4 v0, 0x0

    iput v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopIntervalTimes:I

    iput-boolean v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mIsEncrypt:Z

    iput-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAid:Ljava/lang/String;

    iput-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigExit:Z

    new-instance p2, Lbytedance/framwork/core/sdkmonitor/CacheData;

    invoke-direct {p2}, Lbytedance/framwork/core/sdkmonitor/CacheData;-><init>()V

    iput-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCacheData:Lbytedance/framwork/core/sdkmonitor/CacheData;

    invoke-virtual {p0, p1, p3, p4}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->init(Landroid/content/Context;Lorg/json/JSONObject;Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;)Z

    return-void
.end method

.method static synthetic access$000(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;
    .locals 0

    iget-object p0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mGetCommonParams:Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;

    return-object p0
.end method

.method static synthetic access$100(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigUrls:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$200(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->addParamsToURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)Z
    .locals 0

    iget-boolean p0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mIsEncrypt:Z

    return p0
.end method

.method static synthetic access$400(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;Lorg/json/JSONObject;)V
    .locals 0

    invoke-direct {p0, p1}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->updateToSP(Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic access$500(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)Z
    .locals 0

    iget-boolean p0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigExit:Z

    return p0
.end method

.method static synthetic access$502(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;Z)Z
    .locals 0

    iput-boolean p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigExit:Z

    return p1
.end method

.method static synthetic access$600(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)Lbytedance/framwork/core/sdkmonitor/CacheData;
    .locals 0

    iget-object p0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCacheData:Lbytedance/framwork/core/sdkmonitor/CacheData;

    return-object p0
.end method

.method private addParamsToURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    invoke-static {p1}, Landroid/text/TextUtils;->isDigitsOnly(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    if-nez v0, :cond_0

    goto/16 :goto_3

    :cond_0
    const-string v0, "?"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-gez v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "?"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_1
    const-string v0, "?"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    const/16 v1, 0x190

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "sdk_version"

    const-string v2, "UTF-8"

    invoke-static {p1, v2}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    const-string v1, "UTF-8"

    invoke-static {p1, v1}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "&"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "sdk_version"

    const-string v2, "UTF-8"

    invoke-static {p1, v2}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    const-string v1, "UTF-8"

    invoke-static {p1, v1}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_0
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    if-eqz v0, :cond_5

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v1

    if-lez v1, :cond_5

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_4

    const-string v3, "?"

    invoke-virtual {p1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v4, "UTF-8"

    invoke-static {p1, v4}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "="

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v2, "UTF-8"

    invoke-static {p1, v2}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "&"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v4, "UTF-8"

    invoke-static {p1, v4}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "="

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v2, "UTF-8"

    invoke-static {p1, v2}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_4
    :goto_2
    goto/16 :goto_1

    :cond_5
    return-object p1

    :cond_6
    :goto_3
    return-object p1
.end method

.method private static encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    const-string p1, "UTF-8"

    :goto_0
    invoke-static {p0, p1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method private getSessionId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mGetCommonParams:Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mGetCommonParams:Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;

    invoke-interface {v0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;->getSessionId()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private handleResponseResult(Lorg/json/JSONObject;)V
    .locals 0

    return-void
.end method

.method private initConfig()V
    .locals 6

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mContext:Landroid/content/Context;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "monitor_config"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAid:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "monitor_net_config"

    const/4 v3, 0x0

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "monitor_configure_refresh_time"

    const-wide/16 v4, 0x0

    invoke-interface {v0, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    iput-wide v3, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLastFetchSettingTime:J

    if-eqz v1, :cond_0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigExit:Z

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->updateConfig(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v0, "monitor_config"

    const-string/jumbo v1, "\u914d\u7f6e\u4fe1\u606f\u8bfb\u53d6\u5931\u8d25"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    invoke-virtual {p0, v2}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->updateConfigFromNet(Z)V

    return-void
.end method

.method private initLocalMonitorLog()V
    .locals 6

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    new-instance v0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;

    iget-object v1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string/jumbo v2, "version_code"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string/jumbo v3, "version_name"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v4, "manifest_version_code"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string/jumbo v5, "update_version_code"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    invoke-virtual {v1, v0}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->setCurrentVersionInfo(Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :goto_0
    return-void
.end method

.method private initLogLib()V
    .locals 1

    new-instance v0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$3;

    invoke-direct {v0, p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$3;-><init>(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)V

    invoke-static {v0}, Lcom/bytedance/frameworks/baselib/log/LogLib;->init(Lcom/bytedance/frameworks/baselib/log/LogLib$ILogDelegate;)V

    return-void
.end method

.method private initMonitor(Landroid/content/Context;Lorg/json/JSONObject;Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;)V
    .locals 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHasInit:Z

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "package_name"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_0

    :try_start_0
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "package_name"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    :cond_0
    :goto_0
    :try_start_1
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "aid"

    iget-object v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAid:Ljava/lang/String;

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "os"

    const-string v2, "Android"

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "device_platform"

    const-string v2, "android"

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "os_version"

    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "os_api"

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "device_model"

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "device_brand"

    sget-object v2, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "device_manufacturer"

    sget-object v2, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const/4 p2, 0x0

    iget-object v1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string/jumbo v2, "version_name"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mContext:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p2

    iget-object v1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p2

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string/jumbo v1, "version_name"

    iget-object v2, p2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string/jumbo v1, "version_code"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string/jumbo v1, "version_code"

    iget p2, p2, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    :cond_2
    iput-object p3, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mGetCommonParams:Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;

    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mGetCommonParams:Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;

    if-nez p2, :cond_3

    new-instance p2, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$1;

    invoke-direct {p2, p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$1;-><init>(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)V

    iput-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mGetCommonParams:Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;

    :cond_3
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    if-nez p2, :cond_4

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    :cond_4
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    const-string p3, "aid"

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAid:Ljava/lang/String;

    invoke-virtual {p2, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    const-string p3, "device_id"

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "device_id"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    const-string p3, "device_platform"

    const-string v0, "android"

    invoke-virtual {p2, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    const-string p3, "package_name"

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "package_name"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    const-string p3, "channel"

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "channel"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    const-string p3, "app_version"

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "app_version"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAid:Ljava/lang/String;

    invoke-static {p2, p0}, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->setCommonConfig(Ljava/lang/String;Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;)V

    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAid:Ljava/lang/String;

    invoke-static {p2, p0}, Lcom/bytedance/frameworks/core/monitor/net/MonitorLogSender;->setISendLog(Ljava/lang/String;Lcom/bytedance/frameworks/core/monitor/net/ISendLog;)V

    invoke-direct {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->initLogLib()V

    new-instance p2, Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iget-object p3, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAid:Ljava/lang/String;

    invoke-direct {p2, p1, p0, p3}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;-><init>(Landroid/content/Context;Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;Ljava/lang/String;)V

    iput-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    invoke-direct {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->initConfig()V

    invoke-direct {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->initLocalMonitorLog()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    :goto_1
    return-void
.end method

.method private monitorService(Ljava/lang/String;ILorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 2

    if-nez p4, :cond_0

    :try_start_0
    new-instance p4, Lorg/json/JSONObject;

    invoke-direct {p4}, Lorg/json/JSONObject;-><init>()V

    goto :goto_0

    :catch_0
    move-exception p1

    goto :goto_1

    :cond_0
    :goto_0
    const-string v0, "log_type"

    const-string v1, "service_monitor"

    invoke-virtual {p4, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "service"

    invoke-virtual {p4, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "status"

    invoke-virtual {p4, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string p2, "network_type"

    invoke-virtual {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->getNetWorkType()I

    move-result v0

    invoke-virtual {p4, p2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string/jumbo p2, "value"

    invoke-virtual {p4, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p2, "timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p4, p2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    invoke-direct {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->getSessionId()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_1

    const-string p2, "session_id"

    invoke-direct {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->getSessionId()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p4, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1
    invoke-virtual {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->getMonitorManager()Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    move-result-object p2

    if-eqz p2, :cond_2

    invoke-virtual {p0, p1}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->getServiceSwitch(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->getMonitorManager()Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    move-result-object p1

    const-string p2, "service_monitor"

    invoke-virtual {p4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p3

    const/4 p4, 0x1

    invoke-virtual {p1, p2, p3, p4}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->logSend(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    goto :goto_2

    :goto_1
    nop

    :goto_2
    return-void
.end method

.method private needUpdateConfigFromNet()Z
    .locals 4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLastFetchSettingTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iget-wide v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mFetchSettingInterval:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private updateToSP(Lorg/json/JSONObject;)V
    .locals 4

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lorg/json/JSONObject;->length()I

    move-result v0

    if-lez v0, :cond_1

    :try_start_0
    const-string v0, "data"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {p0, v0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->updateConfig(Lorg/json/JSONObject;)V

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mContext:Landroid/content/Context;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "monitor_config"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAid:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const-string v3, "monitor_configure_refresh_time"

    invoke-interface {v0, v3, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    const-string v1, "monitor_net_config"

    const-string v2, "data"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-boolean p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigExit:Z

    if-nez p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigExit:Z

    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCacheData:Lbytedance/framwork/core/sdkmonitor/CacheData;

    invoke-virtual {p1, p0}, Lbytedance/framwork/core/sdkmonitor/CacheData;->handleCacheData(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    goto :goto_0

    :catch_0
    move-exception p1

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method getLogSendSwitch()Z
    .locals 2

    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogSendSwitch:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public getMonitorLogMaxSaveCount()J
    .locals 2

    iget-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorMaxRowCount:J

    return-wide v0
.end method

.method public getMonitorManager()Lcom/bytedance/frameworks/core/monitor/MonitorManager;
    .locals 1

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    return-object v0
.end method

.method public getNetWorkType()I
    .locals 1

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->getNetworkType(Landroid/content/Context;)Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    move-result-object v0

    invoke-virtual {v0}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->getValue()I

    move-result v0

    return v0
.end method

.method public getRemoveSwitch()Z
    .locals 1

    iget-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogRemoveNet:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogRemoveNet:Z

    goto :goto_0

    :cond_0
    iget-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogRemoveSwitch:Z

    :goto_0
    return v0
.end method

.method public getReportTypeByUploadType(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const-string p1, "monitor"

    return-object p1
.end method

.method public getReportTypeList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportTypeList:Ljava/util/List;

    if-nez v0, :cond_0

    const-string v0, "monitor"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportTypeList:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportTypeList:Ljava/util/List;

    return-object v0
.end method

.method getServiceSwitch(Ljava/lang/String;)Z
    .locals 2

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAllowService:Lorg/json/JSONObject;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAllowService:Lorg/json/JSONObject;

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    nop

    :cond_1
    return v1

    :cond_2
    :goto_0
    return v1
.end method

.method public getUploadTypeByReportType(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "monitor"

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return-object p1

    :cond_1
    :goto_0
    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mUploadTypeListInDefaultReportType:Ljava/util/List;

    if-nez p1, :cond_2

    const-string p1, "service_monitor"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mUploadTypeListInDefaultReportType:Ljava/util/List;

    :cond_2
    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mUploadTypeListInDefaultReportType:Ljava/util/List;

    return-object p1
.end method

.method public handleEvent()V
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopCollectLogTime:J

    sub-long/2addr v0, v2

    iget-wide v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopCollectInterval:J

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    if-lez v0, :cond_0

    iput-boolean v1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogRemoveNet:Z

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    invoke-virtual {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->getLogSendSwitch()Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->setReportLogSwitch(Z)V

    :cond_0
    iget-wide v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mFetchSettingInterval:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-gtz v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0, v1}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->updateConfigFromNet(Z)V

    return-void
.end method

.method public init(Landroid/content/Context;Lorg/json/JSONObject;Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;)Z
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Lorg/json/JSONObject;->length()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->initMonitor(Landroid/content/Context;Lorg/json/JSONObject;Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;)V

    iget-boolean p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigExit:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCacheData:Lbytedance/framwork/core/sdkmonitor/CacheData;

    invoke-virtual {p1, p0}, Lbytedance/framwork/core/sdkmonitor/CacheData;->handleCacheData(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)V

    :cond_1
    const/4 p1, 0x1

    return p1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public isLogSendSwitch()Z
    .locals 2

    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogSendSwitch:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public monitorDuration(Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2, p3}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->monitorStatusAndDuration(Ljava/lang/String;ILorg/json/JSONObject;Lorg/json/JSONObject;)V

    return-void
.end method

.method public monitorStatusAndDuration(Ljava/lang/String;ILorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 2

    :try_start_0
    iget-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigExit:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCacheData:Lbytedance/framwork/core/sdkmonitor/CacheData;

    new-instance v1, Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;

    invoke-direct {v1, p1, p2, p3, p4}, Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;-><init>(Ljava/lang/String;ILorg/json/JSONObject;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Lbytedance/framwork/core/sdkmonitor/CacheData;->insertServiceMonitorData(Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->monitorService(Ljava/lang/String;ILorg/json/JSONObject;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    goto :goto_1

    :catch_0
    move-exception p1

    :goto_1
    return-void
.end method

.method public monitorStatusRate(Ljava/lang/String;ILorg/json/JSONObject;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->monitorStatusAndDuration(Ljava/lang/String;ILorg/json/JSONObject;Lorg/json/JSONObject;)V

    return-void
.end method

.method public reportCount()I
    .locals 1

    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportCount:I

    if-gtz v0, :cond_0

    const/16 v0, 0x64

    return v0

    :cond_0
    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportCount:I

    return v0
.end method

.method public reportFailRepeatBaseTime()I
    .locals 1

    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportFailBaseTime:I

    if-gtz v0, :cond_0

    const/16 v0, 0xf

    return v0

    :cond_0
    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportFailBaseTime:I

    return v0
.end method

.method public reportFailRepeatCount()I
    .locals 1

    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportFailRepeatCount:I

    if-gtz v0, :cond_0

    const/4 v0, 0x4

    return v0

    :cond_0
    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportFailRepeatCount:I

    return v0
.end method

.method public reportInterval()I
    .locals 1

    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportInterval:I

    if-gtz v0, :cond_0

    const/16 v0, 0x78

    return v0

    :cond_0
    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportInterval:I

    return v0
.end method

.method public reportJsonHeaderInfo()Lorg/json/JSONObject;
    .locals 1

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    return-object v0
.end method

.method public reportUrl(Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "monitor"

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportUrlList:Ljava/util/List;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportUrlList:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3

    :cond_2
    const-string p1, "http://mon.snssdk.com/monitor/collect/"

    const-string v0, "http://mon.toutiao.com/monitor/collect/"

    const-string v1, "http://mon.toutiaocloud.com/monitor/collect/"

    const-string v2, "http://mon.toutiaocloud.net/monitor/collect/"

    filled-new-array {p1, v0, v1, v2}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportUrlList:Ljava/util/List;

    :cond_3
    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportUrlList:Ljava/util/List;

    return-object p1
.end method

.method public sendLog(JLjava/lang/String;[BILjava/lang/String;)Lcom/bytedance/frameworks/core/monitor/net/NetResponse;
    .locals 12

    move-object v1, p0

    new-instance v2, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;

    invoke-direct {v2}, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x1

    move-object v0, p3

    :try_start_0
    invoke-direct {v1, v0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->addParamsToURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    move/from16 v0, p5

    if-ne v0, v4, :cond_0

    sget-object v9, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;->GZIP:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    iget-boolean v11, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mIsEncrypt:Z

    move-wide v5, p1

    move-object/from16 v8, p4

    move-object/from16 v10, p6

    invoke-static/range {v5 .. v11}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->excutePost(JLjava/lang/String;[BLbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;Ljava/lang/String;Z)[B

    move-result-object v0

    goto :goto_0

    :cond_0
    sget-object v9, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;->NONE:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    iget-boolean v11, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mIsEncrypt:Z

    move-wide v5, p1

    move-object/from16 v8, p4

    move-object/from16 v10, p6

    invoke-static/range {v5 .. v11}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->excutePost(JLjava/lang/String;[BLbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;Ljava/lang/String;Z)[B

    move-result-object v0

    :goto_0
    iput v3, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopIntervalTimes:I

    const-wide/16 v5, 0x0

    iput-wide v5, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopCollectInterval:J

    const/16 v5, 0xc8

    iput v5, v2, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->stateCode:I

    new-instance v5, Lorg/json/JSONObject;

    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v0}, Ljava/lang/String;-><init>([B)V

    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-direct {v1, v5}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->handleResponseResult(Lorg/json/JSONObject;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    move-object v6, v0

    :try_start_2
    invoke-virtual {v6}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_1
    iput-object v5, v2, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->responseMsg:Lorg/json/JSONObject;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    return-object v2

    :catch_1
    move-exception v0

    instance-of v5, v0, Lbytedance/framwork/core/sdkmonitor/HttpResponseException;

    if-eqz v5, :cond_1

    check-cast v0, Lbytedance/framwork/core/sdkmonitor/HttpResponseException;

    invoke-virtual {v0}, Lbytedance/framwork/core/sdkmonitor/HttpResponseException;->getStatusCode()I

    move-result v0

    iput v0, v2, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->stateCode:I

    goto :goto_2

    :cond_1
    const/4 v0, -0x1

    iput v0, v2, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->stateCode:I

    :goto_2
    iget v0, v2, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->stateCode:I

    const/16 v5, 0x1f7

    if-eq v0, v5, :cond_2

    iget v0, v2, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->stateCode:I

    const/16 v5, 0x1fd

    if-ne v0, v5, :cond_6

    :cond_2
    const-string v0, "monitor_response_code"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "response code "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v2, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->stateCode:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v4, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogRemoveNet:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iput-wide v5, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopCollectLogTime:J

    iget-object v0, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    if-eqz v0, :cond_3

    iget-object v0, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    invoke-virtual {v0, v3}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->setReportLogSwitch(Z)V

    :cond_3
    iget v0, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopIntervalTimes:I

    if-nez v0, :cond_4

    const-wide/32 v5, 0x493e0

    iput-wide v5, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopCollectInterval:J

    goto :goto_3

    :cond_4
    iget v0, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopIntervalTimes:I

    if-ne v0, v4, :cond_5

    const-wide/32 v5, 0xdbba0

    iput-wide v5, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopCollectInterval:J

    goto :goto_3

    :cond_5
    const-wide/32 v5, 0x1b7740

    iput-wide v5, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopCollectInterval:J

    :goto_3
    iget v0, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopIntervalTimes:I

    add-int/2addr v0, v4

    iput v0, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopIntervalTimes:I

    :cond_6
    return-object v2
.end method

.method public setConfigUrl(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    :try_start_0
    iget-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHasInit:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigUrls:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigUrls:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public stopMoreChannelInterval()J
    .locals 4

    iget-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopMoreChannelInterval:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const-wide/32 v0, 0x1b7740

    return-wide v0

    :cond_0
    iget-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopMoreChannelInterval:J

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method declared-synchronized updateConfig(Lorg/json/JSONObject;)V
    .locals 8

    monitor-enter p0

    const/4 v0, 0x0

    if-eqz p1, :cond_5

    :try_start_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->length()I

    move-result v1

    if-gtz v1, :cond_0

    goto/16 :goto_3

    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v2, 0x0

    :try_start_1
    const-string v3, "report_host_new"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lez v4, :cond_2

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    move v5, v2

    :goto_0
    if-ge v5, v4, :cond_2

    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1

    const/16 v7, 0x2e

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-lez v7, :cond_1

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_2
    goto :goto_1

    :catch_0
    move-exception v3

    :goto_1
    :try_start_2
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    iput-object v1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportUrlList:Ljava/util/List;

    goto :goto_2

    :cond_3
    iput-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportUrlList:Ljava/util/List;

    :goto_2
    const-string v0, "fetch_setting_interval"

    const-wide/16 v3, 0x4b0

    invoke-virtual {p1, v0, v3, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mFetchSettingInterval:J

    const-string v0, "polling_interval"

    const/16 v1, 0x78

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportInterval:I

    const-string v0, "once_max_count"

    const/16 v1, 0x64

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportCount:I

    const-string v0, "max_retry_count"

    const/4 v1, 0x4

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportFailRepeatCount:I

    const-string v0, "report_fail_base_time"

    const/16 v1, 0xf

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportFailBaseTime:I

    const-string v0, "log_send_switch"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogSendSwitch:I

    const-string v0, "more_channel_stop_interval"

    const-wide/16 v3, 0x708

    invoke-virtual {p1, v0, v3, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v3

    iput-wide v3, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopMoreChannelInterval:J

    const-string v0, "log_remvove_switch"

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogRemoveSwitch:Z

    const-string v0, "allow_service_name"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    iput-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAllowService:Lorg/json/JSONObject;

    const-string v0, "monitor_encrypt_switch"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mIsEncrypt:Z

    const-string v0, "monitor_log_max_save_count"

    const-wide/32 v1, 0x9c40

    invoke-virtual {p1, v0, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorMaxRowCount:J

    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    invoke-virtual {p1}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->updateConfig()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_4
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    goto :goto_4

    :cond_5
    :goto_3
    :try_start_3
    iput-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportUrlList:Ljava/util/List;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-void

    :goto_4
    monitor-exit p0

    throw p1
.end method

.method updateConfigFromNet(Z)V
    .locals 4
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    iget-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mFetchSettingInterval:J

    const-wide/16 v2, 0x258

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    iput-wide v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mFetchSettingInterval:J

    :cond_0
    if-nez p1, :cond_1

    invoke-direct {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->needUpdateConfigFromNet()Z

    move-result p1

    if-eqz p1, :cond_2

    :cond_1
    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_2

    const-class p1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;

    monitor-enter p1

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLastFetchSettingTime:J

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-static {}, Lcom/bytedance/frameworks/core/thread/TTExecutor;->getTTExecutor()Lcom/bytedance/frameworks/core/thread/TTExecutor;

    move-result-object p1

    new-instance v0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$2;

    invoke-direct {v0, p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$2;-><init>(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)V

    invoke-virtual {p1, v0}, Lcom/bytedance/frameworks/core/thread/TTExecutor;->executeApiTask(Lcom/bytedance/frameworks/core/thread/TTRunnable;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :cond_2
    :goto_0
    return-void
.end method
