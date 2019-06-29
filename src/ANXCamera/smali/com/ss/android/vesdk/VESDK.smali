.class public Lcom/ss/android/vesdk/VESDK;
.super Ljava/lang/Object;
.source "VESDK.java"


# static fields
.field public static MONITOR_ACTION_CANCEL:I

.field public static VESDK_COMPILE_ID:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "139_139_170"

    sput-object v0, Lcom/ss/android/vesdk/VESDK;->VESDK_COMPILE_ID:Ljava/lang/String;

    sget v0, Lcom/ss/android/ttve/monitor/TEMonitor;->MONITOR_ACTION_CANCEL:I

    sput v0, Lcom/ss/android/vesdk/VESDK;->MONITOR_ACTION_CANCEL:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static activate(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/ttve/oauth/TEOAuthResult;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0, p1, p2, p3}, Lcom/ss/android/ttve/oauth/TEOAuth;->activate(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/ttve/oauth/TEOAuthResult;

    move-result-object p0

    return-object p0
.end method

.method public static destroy()V
    .locals 1

    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->destroy()V

    return-void
.end method

.method public static getActivationCode()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/ss/android/ttve/oauth/TEOAuth;->getActivationCode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getEffectSDKVer()Ljava/lang/String;
    .locals 4

    invoke-static {}, Lcom/ss/android/ttve/nativePort/TEEffectUtils;->getEffectVersion()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Steven"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Effect Ver is : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method

.method public static init(Landroid/content/Context;Lcom/ss/android/vesdk/runtime/VEEnv;)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/ss/android/vesdk/runtime/VEEnv;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/ss/android/vesdk/runtime/VERuntime;->init(Landroid/content/Context;Lcom/ss/android/vesdk/runtime/VEEnv;)V

    return-void
.end method

.method public static init(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/ss/android/vesdk/runtime/VERuntime;->init(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public static monitorClear()V
    .locals 0

    invoke-static {}, Lcom/ss/android/ttve/monitor/TEMonitor;->clear()V

    return-void
.end method

.method public static monitorRegister(Lcom/ss/android/vesdk/VEListener$VEMonitorListener;)V
    .locals 1

    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/ss/android/vesdk/runtime/VERuntime;->registerMonitor(Lcom/ss/android/vesdk/VEListener$VEMonitorListener;)V

    return-void
.end method

.method public static monitorReport(I)V
    .locals 0

    invoke-static {p0}, Lcom/ss/android/ttve/monitor/TEMonitor;->report(I)V

    return-void
.end method

.method public static needUpdateEffectModelFiles()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->needUpdateEffectModelFiles()I

    move-result v0

    const/16 v1, -0x6c

    if-eq v0, v1, :cond_1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_1
    new-instance v1, Lcom/ss/android/vesdk/VEException;

    const-string v2, "please set setWorkspace in VESDK init"

    invoke-direct {v1, v0, v2}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw v1
.end method

.method public static setAB(Lcom/ss/android/vesdk/VEAB;)V
    .locals 1
    .param p0    # Lcom/ss/android/vesdk/VEAB;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/ss/android/vesdk/runtime/VERuntime;->setAB(Lcom/ss/android/vesdk/VEAB;)V

    return-void
.end method

.method public static setAppFiled(Lcom/ss/android/vesdk/VEAppField;)V
    .locals 1
    .param p0    # Lcom/ss/android/vesdk/VEAppField;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/ss/android/vesdk/VEAppField;->userId:Ljava/lang/String;

    invoke-static {v0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->setUserId(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEAppField;->deviceId:Ljava/lang/String;

    invoke-static {v0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->setDeviceId(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/ss/android/vesdk/VEAppField;->version:Ljava/lang/String;

    invoke-static {p0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->setAppVersion(Ljava/lang/String;)V

    return-void
.end method

.method public static setCustomEffectModelDir(Ljava/lang/String;)V
    .locals 1

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->updateEffectModelFiles(Ljava/io/File;)V

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Set custom EffectModel dir which is not exist or not a directory. (EffectModel path should point to a directory)"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static setExternalMonitorListener(Lcom/ss/android/vesdk/runtime/VEExternalMonitorListener;)V
    .locals 1
    .param p0    # Lcom/ss/android/vesdk/runtime/VEExternalMonitorListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/ss/android/vesdk/runtime/VERuntime;->setExternalMonitorListener(Lcom/ss/android/vesdk/runtime/VEExternalMonitorListener;)V

    return-void
.end method

.method public static setLogLevel(B)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {v0, p0}, Lcom/ss/android/ttve/common/TELogUtil;->setUp(Ljava/lang/String;B)V

    return-void
.end method

.method public static setSDKMonitorEnable(Z)V
    .locals 0

    invoke-static {p0}, Lcom/ss/android/ttve/monitor/TEMonitor;->setSDKMonitorEnable(Z)V

    return-void
.end method

.method public static updateEffectModelFiles()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    invoke-static {}, Lcom/ss/android/vesdk/VESDK;->needUpdateEffectModelFiles()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->updateEffectModelFiles()I

    move-result v0

    const/16 v1, -0x6c

    if-eq v0, v1, :cond_1

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v1, Lcom/ss/android/vesdk/VEException;

    const-string v2, "fail when updating model files"

    invoke-direct {v1, v0, v2}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw v1

    :cond_1
    new-instance v1, Lcom/ss/android/vesdk/VEException;

    const-string v2, "please set VEEnv or VEEnv#setWorkspace"

    invoke-direct {v1, v0, v2}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw v1

    :cond_2
    :goto_0
    return-void
.end method
