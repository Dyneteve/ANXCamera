.class public Lbytedance/framwork/core/sdkmonitor/MonitorSetting;
.super Ljava/lang/Object;
.source "MonitorSetting.java"


# instance fields
.field public mAllowLogType:Lorg/json/JSONObject;

.field public mAllowService:Lorg/json/JSONObject;

.field public mFetchSettingInterval:J

.field public mIsEncrypt:Z

.field public mLastFetchSettingTime:J

.field public mLogRemoveSwitch:Z

.field public mLogSendSwitch:I

.field public mMetricType:Lorg/json/JSONObject;

.field public mMonitorMaxRowCount:I

.field public mReportCount:I

.field public mReportFailBaseTime:I

.field public mReportFailRepeatCount:I

.field public mReportInterval:I

.field public mReportUrlList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public mStopMoreChannelInterval:J


# direct methods
.method public constructor <init>(JJIIIILorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/List;IJZZI)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJIIII",
            "Lorg/json/JSONObject;",
            "Lorg/json/JSONObject;",
            "Lorg/json/JSONObject;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;IJZZI)V"
        }
    .end annotation

    move-object v0, p0

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v1, 0x0

    iput-wide v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mLastFetchSettingTime:J

    move-wide v1, p1

    iput-wide v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mLastFetchSettingTime:J

    move-wide v1, p3

    iput-wide v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mFetchSettingInterval:J

    move v1, p5

    iput v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mReportInterval:I

    move v1, p6

    iput v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mReportCount:I

    move v1, p7

    iput v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mReportFailRepeatCount:I

    move v1, p8

    iput v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mReportFailBaseTime:I

    move-object v1, p9

    iput-object v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mAllowLogType:Lorg/json/JSONObject;

    move-object v1, p10

    iput-object v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mMetricType:Lorg/json/JSONObject;

    move-object v1, p11

    iput-object v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mAllowService:Lorg/json/JSONObject;

    move-object v1, p12

    iput-object v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mReportUrlList:Ljava/util/List;

    move/from16 v1, p13

    iput v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mLogSendSwitch:I

    move-wide/from16 v1, p14

    iput-wide v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mStopMoreChannelInterval:J

    move/from16 v1, p16

    iput-boolean v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mLogRemoveSwitch:Z

    move/from16 v1, p17

    iput-boolean v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mIsEncrypt:Z

    move/from16 v1, p18

    iput v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mMonitorMaxRowCount:I

    return-void
.end method
