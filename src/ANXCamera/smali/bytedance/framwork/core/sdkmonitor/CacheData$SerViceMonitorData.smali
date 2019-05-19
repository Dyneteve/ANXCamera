.class Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;
.super Ljava/lang/Object;
.source "CacheData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lbytedance/framwork/core/sdkmonitor/CacheData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SerViceMonitorData"
.end annotation


# instance fields
.field extrJson:Lorg/json/JSONObject;

.field serviceName:Ljava/lang/String;

.field status:I

.field value:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;->serviceName:Ljava/lang/String;

    iput p2, p0, Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;->status:I

    iput-object p3, p0, Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;->value:Lorg/json/JSONObject;

    iput-object p4, p0, Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;->extrJson:Lorg/json/JSONObject;

    return-void
.end method
