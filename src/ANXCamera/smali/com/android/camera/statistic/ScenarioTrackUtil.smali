.class public Lcom/android/camera/statistic/ScenarioTrackUtil;
.super Ljava/lang/Object;
.source "ScenarioTrackUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field public static final sCaptureTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

.field public static final sLaunchTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

.field public static final sStartVideoRecordTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

.field public static final sStopVideoRecordTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

.field private static final sSwitchCameraTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

.field public static final sSwitchModeTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

.field private static final scenarioSettings:Landroid/os/statistics/E2EScenarioSettings;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-class v0, Lcom/android/camera/statistic/ScenarioTrackUtil;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->TAG:Ljava/lang/String;

    new-instance v0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    const-string v1, "CameraLaunchTime"

    invoke-direct {v0, v1}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sLaunchTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    new-instance v0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    const-string v1, "CaptureTime"

    invoke-direct {v0, v1}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sCaptureTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    new-instance v0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    const-string v1, "SwitchCameraTime"

    invoke-direct {v0, v1}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sSwitchCameraTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    new-instance v0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    const-string v1, "SwitchModeTime"

    invoke-direct {v0, v1}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sSwitchModeTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    new-instance v0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    const-string v1, "StartVideoRecordTime"

    invoke-direct {v0, v1}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sStartVideoRecordTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    new-instance v0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    const-string v1, "StopVideoRecordTime"

    invoke-direct {v0, v1}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sStopVideoRecordTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    new-instance v0, Landroid/os/statistics/E2EScenarioSettings;

    invoke-direct {v0}, Landroid/os/statistics/E2EScenarioSettings;-><init>()V

    sput-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->scenarioSettings:Landroid/os/statistics/E2EScenarioSettings;

    sget-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->scenarioSettings:Landroid/os/statistics/E2EScenarioSettings;

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Landroid/os/statistics/E2EScenarioSettings;->setStatisticsMode(I)V

    sget-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->scenarioSettings:Landroid/os/statistics/E2EScenarioSettings;

    const/16 v1, 0xc8

    invoke-virtual {v0, v1}, Landroid/os/statistics/E2EScenarioSettings;->setHistoryLimitPerDay(I)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static abortScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;)V
    .locals 3
    .param p0    # Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->e2eScenario:Landroid/os/statistics/E2EScenario;

    if-nez v0, :cond_0

    sget-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "track "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " event start cancel due to scenario is null!"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->isTrackStarted:Z

    if-eqz v0, :cond_1

    iget-object p0, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->e2eScenario:Landroid/os/statistics/E2EScenario;

    invoke-static {p0}, Landroid/os/statistics/E2EScenarioPerfTracer;->abortScenario(Landroid/os/statistics/E2EScenario;)V

    :cond_1
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private static beginScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;)V
    .locals 1
    .param p0    # Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->beginScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Landroid/os/statistics/E2EScenarioPayload;)V

    return-void
.end method

.method private static beginScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Landroid/os/statistics/E2EScenarioPayload;)V
    .locals 3
    .param p0    # Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/os/statistics/E2EScenarioPayload;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->e2eScenario:Landroid/os/statistics/E2EScenario;

    if-nez v0, :cond_0

    sget-object p1, Lcom/android/camera/statistic/ScenarioTrackUtil;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "track "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " event start cancel due to scenario is null!"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->isTrackStarted:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->e2eScenario:Landroid/os/statistics/E2EScenario;

    invoke-static {v0}, Landroid/os/statistics/E2EScenarioPerfTracer;->abortScenario(Landroid/os/statistics/E2EScenario;)V

    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->e2eScenario:Landroid/os/statistics/E2EScenario;

    sget-object v1, Lcom/android/camera/statistic/ScenarioTrackUtil;->scenarioSettings:Landroid/os/statistics/E2EScenarioSettings;

    invoke-static {v0, v1, p1}, Landroid/os/statistics/E2EScenarioPerfTracer;->asyncBeginScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;Landroid/os/statistics/E2EScenarioPayload;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->isTrackStarted:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "track "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " event start failed: "

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method private static finishScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Landroid/os/statistics/E2EScenarioPayload;)V
    .locals 3
    .param p0    # Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/os/statistics/E2EScenarioPayload;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->e2eScenario:Landroid/os/statistics/E2EScenario;

    if-nez v0, :cond_0

    sget-object p1, Lcom/android/camera/statistic/ScenarioTrackUtil;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "track "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " event end cancel, due to scenario is null!"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->isTrackStarted:Z

    if-nez v0, :cond_1

    sget-object p1, Lcom/android/camera/statistic/ScenarioTrackUtil;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "track "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " event end cancel, due to scenario has not started!"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    if-eqz p1, :cond_2

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->e2eScenario:Landroid/os/statistics/E2EScenario;

    invoke-static {v0, p1}, Landroid/os/statistics/E2EScenarioPerfTracer;->finishScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioPayload;)V

    goto :goto_0

    :catch_0
    move-exception p1

    goto :goto_1

    :cond_2
    iget-object p1, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->e2eScenario:Landroid/os/statistics/E2EScenario;

    invoke-static {p1}, Landroid/os/statistics/E2EScenarioPerfTracer;->finishScenario(Landroid/os/statistics/E2EScenario;)V

    :goto_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->isTrackStarted:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :goto_1
    nop

    sget-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "track "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " event end failed: "

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_2
    return-void
.end method

.method public static trackAppLunchTimeEnd(Ljava/util/Map;Landroid/content/Context;)V
    .locals 8
    .param p0    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v0, "camera_boost"

    invoke-static {p1, v0}, Landroid/provider/MiuiSettings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Landroid/os/statistics/E2EScenarioPayload;

    invoke-direct {v0}, Landroid/os/statistics/E2EScenarioPayload;-><init>()V

    if-eqz p1, :cond_1

    nop

    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    const-string p1, "time"

    invoke-virtual {v3, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x3e8

    cmp-long p1, v4, v6

    if-gez p1, :cond_0

    const/4 p1, 0x1

    move v2, p1

    goto :goto_0

    :cond_0
    nop

    :goto_0
    const-string p1, "time"

    invoke-virtual {v3, p1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    goto :goto_1

    :catch_1
    move-exception p1

    move-object v3, v1

    :goto_1
    sget-object v1, Lcom/android/camera/statistic/ScenarioTrackUtil;->TAG:Ljava/lang/String;

    const-string v4, "Exception"

    invoke-static {v1, v4, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2
    if-eqz v2, :cond_1

    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p1

    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/statistics/E2EScenarioPayload;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_3

    :cond_1
    invoke-virtual {v0, p0}, Landroid/os/statistics/E2EScenarioPayload;->putAll(Ljava/util/Map;)V

    sget-object p0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sLaunchTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {p0, v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->finishScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Landroid/os/statistics/E2EScenarioPayload;)V

    return-void
.end method

.method public static trackAppLunchTimeStart(Z)V
    .locals 2
    .param p0    # Z
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Landroid/os/statistics/E2EScenarioPayload;

    invoke-direct {v0}, Landroid/os/statistics/E2EScenarioPayload;-><init>()V

    const-string v1, "LaunchMode"

    if-eqz p0, :cond_0

    const-string p0, "COLD"

    goto :goto_0

    :cond_0
    const-string p0, "HOT"

    :goto_0
    invoke-virtual {v0, v1, p0}, Landroid/os/statistics/E2EScenarioPayload;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object p0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sLaunchTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {p0, v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->beginScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Landroid/os/statistics/E2EScenarioPayload;)V

    return-void
.end method

.method public static trackCaptureTimeEnd()V
    .locals 2

    sget-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sCaptureTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/statistic/ScenarioTrackUtil;->finishScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Landroid/os/statistics/E2EScenarioPayload;)V

    return-void
.end method

.method public static trackCaptureTimeStart(ZI)V
    .locals 4
    .param p0    # Z
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Landroid/os/statistics/E2EScenarioPayload;

    invoke-direct {v0}, Landroid/os/statistics/E2EScenarioPayload;-><init>()V

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "CameraID"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->cameraIdToName(Z)Ljava/lang/String;

    move-result-object p0

    const/4 v2, 0x1

    aput-object p0, v1, v2

    const-string p0, "Module"

    const/4 v2, 0x2

    aput-object p0, v1, v2

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x3

    aput-object p0, v1, p1

    invoke-virtual {v0, v1}, Landroid/os/statistics/E2EScenarioPayload;->putValues([Ljava/lang/Object;)V

    sget-object p0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sCaptureTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {p0, v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->beginScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Landroid/os/statistics/E2EScenarioPayload;)V

    return-void
.end method

.method public static trackScenarioAbort(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;)V
    .locals 0
    .param p0    # Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->abortScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;)V

    return-void
.end method

.method public static trackStartVideoRecordEnd()V
    .locals 2

    sget-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sStartVideoRecordTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/statistic/ScenarioTrackUtil;->finishScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Landroid/os/statistics/E2EScenarioPayload;)V

    return-void
.end method

.method public static trackStartVideoRecordStart(Ljava/lang/String;Z)V
    .locals 4
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Z
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Landroid/os/statistics/E2EScenarioPayload;

    invoke-direct {v0}, Landroid/os/statistics/E2EScenarioPayload;-><init>()V

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "mode"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p0, v1, v2

    const-string p0, "cameraId"

    const/4 v2, 0x2

    aput-object p0, v1, v2

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->cameraIdToName(Z)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x3

    aput-object p0, v1, p1

    invoke-virtual {v0, v1}, Landroid/os/statistics/E2EScenarioPayload;->putValues([Ljava/lang/Object;)V

    sget-object p0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sStartVideoRecordTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {p0, v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->beginScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Landroid/os/statistics/E2EScenarioPayload;)V

    return-void
.end method

.method public static trackStopVideoRecordEnd()V
    .locals 2

    sget-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sStopVideoRecordTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/statistic/ScenarioTrackUtil;->finishScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Landroid/os/statistics/E2EScenarioPayload;)V

    return-void
.end method

.method public static trackStopVideoRecordStart(Ljava/lang/String;Z)V
    .locals 4
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Z
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Landroid/os/statistics/E2EScenarioPayload;

    invoke-direct {v0}, Landroid/os/statistics/E2EScenarioPayload;-><init>()V

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "mode"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p0, v1, v2

    const-string p0, "cameraId"

    const/4 v2, 0x2

    aput-object p0, v1, v2

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->cameraIdToName(Z)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x3

    aput-object p0, v1, p1

    invoke-virtual {v0, v1}, Landroid/os/statistics/E2EScenarioPayload;->putValues([Ljava/lang/Object;)V

    sget-object p0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sStopVideoRecordTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {p0, v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->beginScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Landroid/os/statistics/E2EScenarioPayload;)V

    return-void
.end method

.method public static trackSwitchCameraEnd()V
    .locals 2

    sget-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sSwitchCameraTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/statistic/ScenarioTrackUtil;->finishScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Landroid/os/statistics/E2EScenarioPayload;)V

    return-void
.end method

.method public static trackSwitchCameraStart(ZZI)V
    .locals 4
    .param p0    # Z
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Z
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Landroid/os/statistics/E2EScenarioPayload;

    invoke-direct {v0}, Landroid/os/statistics/E2EScenarioPayload;-><init>()V

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "from"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->cameraIdToName(Z)Ljava/lang/String;

    move-result-object p0

    const/4 v2, 0x1

    aput-object p0, v1, v2

    const-string p0, "to"

    const/4 v2, 0x2

    aput-object p0, v1, v2

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->cameraIdToName(Z)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x3

    aput-object p0, v1, p1

    const-string p0, "inMode"

    const/4 p1, 0x4

    aput-object p0, v1, p1

    invoke-static {p2}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x5

    aput-object p0, v1, p1

    invoke-virtual {v0, v1}, Landroid/os/statistics/E2EScenarioPayload;->putValues([Ljava/lang/Object;)V

    sget-object p0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sSwitchCameraTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {p0, v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->beginScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Landroid/os/statistics/E2EScenarioPayload;)V

    return-void
.end method

.method public static trackSwitchModeEnd()V
    .locals 2

    sget-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sSwitchModeTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/statistic/ScenarioTrackUtil;->finishScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Landroid/os/statistics/E2EScenarioPayload;)V

    return-void
.end method

.method public static trackSwitchModeStart(IIZ)V
    .locals 4
    .param p0    # I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Z
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Landroid/os/statistics/E2EScenarioPayload;

    invoke-direct {v0}, Landroid/os/statistics/E2EScenarioPayload;-><init>()V

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "from"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object p0

    const/4 v2, 0x1

    aput-object p0, v1, v2

    const-string p0, "to"

    const/4 v2, 0x2

    aput-object p0, v1, v2

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x3

    aput-object p0, v1, p1

    const-string p0, "cameraId"

    const/4 p1, 0x4

    aput-object p0, v1, p1

    invoke-static {p2}, Lcom/android/camera/statistic/CameraStatUtil;->cameraIdToName(Z)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x5

    aput-object p0, v1, p1

    invoke-virtual {v0, v1}, Landroid/os/statistics/E2EScenarioPayload;->putValues([Ljava/lang/Object;)V

    sget-object p0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sSwitchModeTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {p0, v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->beginScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Landroid/os/statistics/E2EScenarioPayload;)V

    return-void
.end method
