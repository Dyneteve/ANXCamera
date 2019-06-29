.class public Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;
.super Ljava/lang/Object;
.source "MonitorConfigure.java"


# static fields
.field private static sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;",
            ">;"
        }
    .end annotation
.end field

.field private static sDefCommonConfig:Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/bytedance/frameworks/core/monitor/config/DefaultMonitorConfigure;

    invoke-direct {v0}, Lcom/bytedance/frameworks/core/monitor/config/DefaultMonitorConfigure;-><init>()V

    sput-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sDefCommonConfig:Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    const-string v1, "default"

    sget-object v2, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sDefCommonConfig:Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getLogRemoveSwitch(Ljava/lang/String;)Z
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->getRemoveSwitch()Z

    move-result p0

    return p0

    :cond_0
    sget-object p0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sDefCommonConfig:Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->getRemoveSwitch()Z

    move-result p0

    return p0
.end method

.method public static getMaxMonitorLogSaveCount(Ljava/lang/String;)J
    .locals 2

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->getMonitorLogMaxSaveCount()J

    move-result-wide v0

    return-wide v0

    :cond_0
    sget-object p0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sDefCommonConfig:Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->getMonitorLogMaxSaveCount()J

    move-result-wide v0

    return-wide v0
.end method

.method public static getReportCount(Ljava/lang/String;)I
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->reportCount()I

    move-result p0

    return p0

    :cond_0
    sget-object p0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sDefCommonConfig:Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->reportCount()I

    move-result p0

    return p0
.end method

.method public static getReportFailBaseTime(Ljava/lang/String;)I
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->reportFailRepeatBaseTime()I

    move-result p0

    mul-int/lit16 p0, p0, 0x3e8

    return p0

    :cond_0
    sget-object p0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sDefCommonConfig:Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->reportFailRepeatBaseTime()I

    move-result p0

    mul-int/lit16 p0, p0, 0x3e8

    return p0
.end method

.method public static getReportFailRepeatCount(Ljava/lang/String;)I
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->reportFailRepeatCount()I

    move-result p0

    return p0

    :cond_0
    sget-object p0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sDefCommonConfig:Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->reportFailRepeatCount()I

    move-result p0

    return p0
.end method

.method public static getReportInterval(Ljava/lang/String;)I
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->reportInterval()I

    move-result p0

    return p0

    :cond_0
    sget-object p0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sDefCommonConfig:Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->reportInterval()I

    move-result p0

    return p0
.end method

.method public static getReportJsonHeaderInfo(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->reportJsonHeaderInfo()Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    :cond_0
    sget-object p0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sDefCommonConfig:Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->reportJsonHeaderInfo()Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public static getReportTypeByUploadType(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0, p1}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->getReportTypeByUploadType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    sget-object p0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sDefCommonConfig:Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0, p1}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->getReportTypeByUploadType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getReportTypeList(Ljava/lang/String;)Ljava/util/List;
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

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->getReportTypeList()Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_0
    sget-object p0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sDefCommonConfig:Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->getReportTypeList()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static getReportUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0, p1}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->reportUrl(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_0
    sget-object p0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sDefCommonConfig:Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0, p1}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->reportUrl(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static getStopMoreChannelInterval(Ljava/lang/String;)J
    .locals 2

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->stopMoreChannelInterval()J

    move-result-wide v0

    return-wide v0

    :cond_0
    sget-object p0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sDefCommonConfig:Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->stopMoreChannelInterval()J

    move-result-wide v0

    return-wide v0
.end method

.method public static getUploadTypeByReportType(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0, p1}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->getUploadTypeByReportType(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_0
    sget-object p0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sDefCommonConfig:Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    invoke-interface {p0, p1}, Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;->getUploadTypeByReportType(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static setCommonConfig(Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;)V
    .locals 1

    sput-object p0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sDefCommonConfig:Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;

    const-string v0, "default"

    invoke-static {v0, p0}, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->setCommonConfig(Ljava/lang/String;Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;)V

    return-void
.end method

.method public static setCommonConfig(Ljava/lang/String;Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->sAid2MonitorCogfigMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
