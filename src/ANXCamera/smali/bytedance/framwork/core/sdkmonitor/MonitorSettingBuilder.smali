.class public Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;
.super Ljava/lang/Object;
.source "MonitorSettingBuilder.java"


# instance fields
.field private mAllowLogType:Lorg/json/JSONObject;

.field private mAllowService:Lorg/json/JSONObject;

.field private mFetchSettingInterval:J

.field private mIsEncrypt:Z

.field private mLastFetchSettingTime:J

.field private mLogRemoveSwitch:Z

.field private mLogSendSwitch:I

.field private mMetricType:Lorg/json/JSONObject;

.field private mMonitorMaxRowCount:I

.field private mReportCount:I

.field private mReportFailBaseTime:I

.field private mReportFailRepeatCount:I

.field private mReportInterval:I

.field private mReportUrlList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mStopMoreChannelInterval:J


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createMonitorSetting()Lbytedance/framwork/core/sdkmonitor/MonitorSetting;
    .locals 22

    move-object/from16 v0, p0

    new-instance v19, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;

    iget-wide v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mLastFetchSettingTime:J

    iget-wide v3, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mFetchSettingInterval:J

    iget v5, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mReportInterval:I

    iget v6, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mReportCount:I

    iget v7, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mReportFailRepeatCount:I

    iget v8, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mReportFailBaseTime:I

    iget-object v9, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mAllowLogType:Lorg/json/JSONObject;

    iget-object v10, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mMetricType:Lorg/json/JSONObject;

    iget-object v11, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mAllowService:Lorg/json/JSONObject;

    iget-object v12, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mReportUrlList:Ljava/util/List;

    iget v13, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mLogSendSwitch:I

    iget-wide v14, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mStopMoreChannelInterval:J

    move-wide/from16 v20, v14

    iget-boolean v14, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mLogRemoveSwitch:Z

    iget-boolean v15, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mIsEncrypt:Z

    iget v0, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mMonitorMaxRowCount:I

    move/from16 v18, v0

    move-object/from16 v0, v19

    move/from16 v16, v14

    move/from16 v17, v15

    move-wide/from16 v14, v20

    invoke-direct/range {v0 .. v18}, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;-><init>(JJIIIILorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/List;IJZZI)V

    return-object v19
.end method

.method public setAllowLogType(Lorg/json/JSONObject;)Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;
    .locals 0

    iput-object p1, p0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mAllowLogType:Lorg/json/JSONObject;

    return-object p0
.end method

.method public setAllowService(Lorg/json/JSONObject;)Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;
    .locals 0

    iput-object p1, p0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mAllowService:Lorg/json/JSONObject;

    return-object p0
.end method

.method public setFetchSettingInterval(J)Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;
    .locals 0

    iput-wide p1, p0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mFetchSettingInterval:J

    return-object p0
.end method

.method public setIsEncrypt(Z)Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;
    .locals 0

    iput-boolean p1, p0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mIsEncrypt:Z

    return-object p0
.end method

.method public setLastFetchSettingTime(J)Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;
    .locals 0

    iput-wide p1, p0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mLastFetchSettingTime:J

    return-object p0
.end method

.method public setLogRemoveSwitch(Z)Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;
    .locals 0

    iput-boolean p1, p0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mLogRemoveSwitch:Z

    return-object p0
.end method

.method public setLogSendSwitch(I)Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;
    .locals 0

    iput p1, p0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mLogSendSwitch:I

    return-object p0
.end method

.method public setMetricType(Lorg/json/JSONObject;)Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;
    .locals 0

    iput-object p1, p0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mMetricType:Lorg/json/JSONObject;

    return-object p0
.end method

.method public setMonitorMaxRowCount(I)Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;
    .locals 0

    iput p1, p0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mMonitorMaxRowCount:I

    return-object p0
.end method

.method public setReportCount(I)Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;
    .locals 0

    iput p1, p0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mReportCount:I

    return-object p0
.end method

.method public setReportFailBaseTime(I)Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;
    .locals 0

    iput p1, p0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mReportFailBaseTime:I

    return-object p0
.end method

.method public setReportFailRepeatCount(I)Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;
    .locals 0

    iput p1, p0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mReportFailRepeatCount:I

    return-object p0
.end method

.method public setReportInterval(I)Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;
    .locals 0

    iput p1, p0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mReportInterval:I

    return-object p0
.end method

.method public setReportUrlList(Ljava/util/List;)Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;"
        }
    .end annotation

    iput-object p1, p0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mReportUrlList:Ljava/util/List;

    return-object p0
.end method

.method public setStopMoreChannelInterval(J)Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;
    .locals 0

    iput-wide p1, p0, Lbytedance/framwork/core/sdkmonitor/MonitorSettingBuilder;->mStopMoreChannelInterval:J

    return-object p0
.end method
