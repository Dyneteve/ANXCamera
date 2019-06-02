.class public Lcom/ss/android/ttve/monitor/TEMonitor;
.super Ljava/lang/Object;
.source "TEMonitor.java"


# static fields
.field public static MONITOR_ACTION_CANCEL:I = 0x0

.field public static MONITOR_ACTION_COMPILE:I = 0x0

.field private static final TAG:Ljava/lang/String; = "TEMonitor"

.field private static sMonitor:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/ss/android/ttve/monitor/IMonitor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput v0, Lcom/ss/android/ttve/monitor/TEMonitor;->MONITOR_ACTION_CANCEL:I

    const/4 v0, 0x1

    sput v0, Lcom/ss/android/ttve/monitor/TEMonitor;->MONITOR_ACTION_COMPILE:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lorg/json/JSONObject;)V
    .locals 0

    invoke-static {p0}, Lcom/ss/android/ttve/monitor/TEMonitor;->monitorVELog(Lorg/json/JSONObject;)V

    return-void
.end method

.method public static clear()V
    .locals 0

    invoke-static {}, Lcom/ss/android/ttve/monitor/TEMonitorInvoker;->nativeReset()V

    invoke-static {}, Lcom/ss/android/medialib/log/VEMonitor;->clear()V

    return-void
.end method

.method public static getAppVersion()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/ss/android/ttve/monitor/MonitorUtils;->getAppVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getDeviceId()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/ss/android/ttve/monitor/MonitorUtils;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getIsComplete(Lorg/json/JSONObject;)I
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    const-string v1, "completed"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "completed"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, p0

    goto :goto_0

    :cond_0
    nop

    :goto_0
    goto :goto_1

    :catch_0
    move-exception p0

    const-string v1, "TEMonitor"

    const-string v2, "get complete filed error!"

    invoke-static {v1, v2}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    nop

    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    :goto_1
    return v0
.end method

.method public static getUserId()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/ss/android/ttve/monitor/MonitorUtils;->getUserId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static init()V
    .locals 2

    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1, v1, v1}, Lcom/ss/android/ttve/monitor/MonitorUtils;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/ss/android/ttve/monitor/TEMonitorInvoker;->nativeInit()V

    new-instance v0, Lcom/ss/android/ttve/monitor/TEMonitor$1;

    invoke-direct {v0}, Lcom/ss/android/ttve/monitor/TEMonitor$1;-><init>()V

    invoke-static {v0}, Lcom/ss/android/medialib/log/VEMonitor;->register(Lcom/ss/android/medialib/log/IMonitor;)V

    return-void
.end method

.method public static monitorTELog(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0, p1, v0}, Lcom/ss/android/ttve/monitor/TEMonitor;->monitorTELog(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    move-result p0

    return p0
.end method

.method public static monitorTELog(Ljava/lang/String;Ljava/lang/String;J)Z
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0, p1, v0}, Lcom/ss/android/ttve/monitor/TEMonitor;->monitorTELog(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    move-result p0

    return p0
.end method

.method public static monitorTELog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0, p1, v0}, Lcom/ss/android/ttve/monitor/TEMonitor;->monitorTELog(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    move-result p0

    return p0
.end method

.method public static monitorTELog(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z
    .locals 1

    sget-object v0, Lcom/ss/android/ttve/monitor/TEMonitor;->sMonitor:Ljava/lang/ref/WeakReference;

    invoke-static {v0, p0, p1, p2}, Lcom/ss/android/ttve/monitor/TEMonitor;->monitorTELog(Ljava/lang/ref/WeakReference;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    move-result p0

    return p0
.end method

.method private static monitorTELog(Ljava/lang/ref/WeakReference;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/ss/android/ttve/monitor/IMonitor;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map;",
            ")Z"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_0

    const-string p0, "TEMonitor"

    const-string p1, "No monitor callback, return"

    invoke-static {p0, p1}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_0
    invoke-static {}, Lcom/ss/android/medialib/log/VEMonitor;->getMap()Ljava/util/Map;

    move-result-object v1

    invoke-interface {p3, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    invoke-static {p3, v1}, Lcom/ss/android/ttve/monitor/TEMonitor;->putAll(Ljava/util/Map;Lorg/json/JSONObject;)V

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_1

    const-string p3, "service"

    invoke-virtual {v1, p3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    nop

    invoke-static {p0, p1, v1}, Lcom/ss/android/ttve/monitor/TEMonitor;->reportMonitor(Ljava/lang/ref/WeakReference;Ljava/lang/String;Lorg/json/JSONObject;)V

    const/4 p0, 0x1

    return p0

    :catch_0
    move-exception p0

    const-string p0, "TEMonitor"

    const-string p1, "No monitor callback, skip"

    invoke-static {p0, p1}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method

.method private static monitorVELog(Lorg/json/JSONObject;)V
    .locals 3

    invoke-static {}, Lcom/ss/android/ttve/monitor/TEMonitorInvoker;->nativeGetMap()Ljava/util/Map;

    move-result-object v0

    :try_start_0
    invoke-static {v0, p0}, Lcom/ss/android/ttve/monitor/TEMonitor;->putAll(Ljava/util/Map;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "TEMonitor"

    const-string v2, "merge monitor logs error"

    invoke-static {v1, v2}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    :goto_0
    invoke-static {p0}, Lcom/ss/android/ttve/monitor/TEMonitor;->getIsComplete(Lorg/json/JSONObject;)I

    sget-object v0, Lcom/ss/android/ttve/monitor/TEMonitor;->sMonitor:Ljava/lang/ref/WeakReference;

    const-string v1, "sdk_video_edit_compose"

    invoke-static {v0, v1, p0}, Lcom/ss/android/ttve/monitor/TEMonitor;->reportMonitor(Ljava/lang/ref/WeakReference;Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method

.method public static perfDouble(Ljava/lang/String;D)V
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "TEMonitor"

    const-string p1, "perfDouble: key is null"

    invoke-static {p0, p1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/monitor/TEMonitorInvoker;->nativePerfDouble(Ljava/lang/String;D)V

    return-void
.end method

.method public static perfLong(Ljava/lang/String;J)V
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "TEMonitor"

    const-string p1, "perfLong: key is null"

    invoke-static {p0, p1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/monitor/TEMonitorInvoker;->nativePerfLong(Ljava/lang/String;J)V

    return-void
.end method

.method public static perfRational(Ljava/lang/String;FF)V
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "TEMonitor"

    const-string p1, "perfLong: key is null"

    invoke-static {p0, p1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/monitor/TEMonitorInvoker;->nativePerfRational(Ljava/lang/String;FF)V

    return-void
.end method

.method public static perfString(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "TEMonitor"

    const-string p1, "perfString: key is null"

    invoke-static {p0, p1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    if-nez p1, :cond_1

    const-string p1, ""

    :cond_1
    invoke-static {p0, p1}, Lcom/ss/android/ttve/monitor/TEMonitorInvoker;->nativePerfString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static putAll(Ljava/util/Map;Lorg/json/JSONObject;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "iesve_"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {v1}, Lcom/ss/android/medialib/log/VEMonitorKeys;->getType(Ljava/lang/String;)I

    move-result v2

    goto :goto_1

    :cond_0
    invoke-static {v1}, Lcom/ss/android/ttve/monitor/TEMonitorKeys;->getType(Ljava/lang/String;)I

    move-result v2

    :goto_1
    sget v3, Lcom/ss/android/ttve/monitor/TEMonitorKeys;->TYPE_INT:I

    if-ne v2, v3, :cond_1

    :try_start_0
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v2

    const-string v2, "TEMonitor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Parse int error:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2
    goto :goto_4

    :cond_1
    sget v3, Lcom/ss/android/ttve/monitor/TEMonitorKeys;->TYPE_DOUBLE:I

    if-ne v2, v3, :cond_2

    :try_start_1
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    float-to-double v2, v2

    invoke-virtual {p1, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    :catch_1
    move-exception v1

    const-string v1, "TEMonitor"

    const-string v2, "Parse float error"

    invoke-static {v1, v2}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_3
    goto :goto_4

    :cond_2
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :goto_4
    goto :goto_0

    :cond_3
    return-void
.end method

.method public static register(Lcom/ss/android/ttve/monitor/IMonitor;)V
    .locals 1

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/ss/android/ttve/monitor/TEMonitor;->sMonitor:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public static report(I)V
    .locals 0

    invoke-static {p0}, Lcom/ss/android/ttve/monitor/TEMonitorInvoker;->nativeMonitorPerf(I)V

    return-void
.end method

.method private static reportMonitor(Ljava/lang/ref/WeakReference;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/ss/android/ttve/monitor/IMonitor;",
            ">;",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    nop

    const-string v0, "sdk_video_edit_compose"

    if-eqz p2, :cond_1

    invoke-static {p2}, Lcom/ss/android/ttve/monitor/TEMonitor;->getIsComplete(Lorg/json/JSONObject;)I

    move-result v1

    :try_start_0
    const-string v2, "service"

    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "service"

    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v2

    :cond_0
    goto :goto_0

    :catch_0
    move-exception v2

    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    invoke-static {v0, v1, p2}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatusRate(Ljava/lang/String;ILorg/json/JSONObject;)V

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2

    :try_start_1
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/ss/android/ttve/monitor/IMonitor;

    invoke-interface {p0, p1, p2}, Lcom/ss/android/ttve/monitor/IMonitor;->monitorLog(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    const-string p1, "TEMonitor"

    const-string p2, "Something happened when monitor log"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    :goto_1
    return-void
.end method

.method public static setAppVersion(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->setAppVersion(Ljava/lang/String;)V

    return-void
.end method

.method public static setDeviceId(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->setDeviceId(Ljava/lang/String;)V

    return-void
.end method

.method public static setSDKMonitorEnable(Z)V
    .locals 0

    invoke-static {p0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->setEnable(Z)V

    return-void
.end method

.method public static setUserId(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->setUserId(Ljava/lang/String;)V

    return-void
.end method
