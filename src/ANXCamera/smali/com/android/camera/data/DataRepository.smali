.class public Lcom/android/camera/data/DataRepository;
.super Ljava/lang/Object;
.source "DataRepository.java"

# interfaces
.implements Lcom/android/camera/data/DataProtocol;


# static fields
.field private static sInstance:Lcom/android/camera/data/DataRepository;


# instance fields
.field private mDataBackUp:Lcom/android/camera/data/backup/DataBackUpMgr;

.field private mDataCloudMgr:Lcom/android/camera/data/cloud/DataCloud$CloudManager;

.field private mDataProvider:Lcom/android/camera/data/provider/DataProviderMgr;

.field private mDataRestore:Lcom/android/camera/data/restore/DataRestoreMgr;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/android/camera/data/cloud/DataCloudMgr;

    invoke-direct {v0}, Lcom/android/camera/data/cloud/DataCloudMgr;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/DataRepository;->mDataCloudMgr:Lcom/android/camera/data/cloud/DataCloud$CloudManager;

    new-instance v0, Lcom/android/camera/data/backup/DataBackUpMgr;

    invoke-direct {v0}, Lcom/android/camera/data/backup/DataBackUpMgr;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/DataRepository;->mDataBackUp:Lcom/android/camera/data/backup/DataBackUpMgr;

    new-instance v0, Lcom/android/camera/data/restore/DataRestoreMgr;

    invoke-direct {v0}, Lcom/android/camera/data/restore/DataRestoreMgr;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/DataRepository;->mDataRestore:Lcom/android/camera/data/restore/DataRestoreMgr;

    new-instance v0, Lcom/android/camera/data/provider/DataProviderMgr;

    iget-object v1, p0, Lcom/android/camera/data/DataRepository;->mDataCloudMgr:Lcom/android/camera/data/cloud/DataCloud$CloudManager;

    invoke-direct {v0, v1}, Lcom/android/camera/data/provider/DataProviderMgr;-><init>(Lcom/android/camera/data/cloud/DataCloud$CloudManager;)V

    iput-object v0, p0, Lcom/android/camera/data/DataRepository;->mDataProvider:Lcom/android/camera/data/provider/DataProviderMgr;

    return-void
.end method

.method public static dataCloudMgr()Lcom/android/camera/data/cloud/DataCloud$CloudManager;
    .locals 1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object v0

    iget-object v0, v0, Lcom/android/camera/data/DataRepository;->mDataCloudMgr:Lcom/android/camera/data/cloud/DataCloud$CloudManager;

    return-object v0
.end method

.method public static dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;
    .locals 1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataConfig()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/config/DataItemConfig;

    return-object v0
.end method

.method public static dataItemFeature()Lcom/mi/config/a;
    .locals 1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataFeature()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/mi/config/a;

    return-object v0
.end method

.method public static dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;
    .locals 1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    return-object v0
.end method

.method public static dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;
    .locals 1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataLive()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/extra/DataItemLive;

    return-object v0
.end method

.method public static dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;
    .locals 1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataRunning()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/runing/DataItemRunning;

    return-object v0
.end method

.method public static dataNormalItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;
    .locals 1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataNormalConfig()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/config/DataItemConfig;

    return-object v0
.end method

.method public static getInstance()Lcom/android/camera/data/DataRepository;
    .locals 2

    sget-object v0, Lcom/android/camera/data/DataRepository;->sInstance:Lcom/android/camera/data/DataRepository;

    if-nez v0, :cond_1

    const-class v0, Lcom/android/camera/data/DataRepository;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/android/camera/data/DataRepository;->sInstance:Lcom/android/camera/data/DataRepository;

    if-nez v1, :cond_0

    new-instance v1, Lcom/android/camera/data/DataRepository;

    invoke-direct {v1}, Lcom/android/camera/data/DataRepository;-><init>()V

    sput-object v1, Lcom/android/camera/data/DataRepository;->sInstance:Lcom/android/camera/data/DataRepository;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    sget-object v0, Lcom/android/camera/data/DataRepository;->sInstance:Lcom/android/camera/data/DataRepository;

    return-object v0
.end method

.method public static provider()Lcom/android/camera/data/provider/DataProvider;
    .locals 1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object v0

    iget-object v0, v0, Lcom/android/camera/data/DataRepository;->mDataProvider:Lcom/android/camera/data/provider/DataProviderMgr;

    invoke-virtual {v0}, Lcom/android/camera/data/provider/DataProviderMgr;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public backUp()Lcom/android/camera/data/backup/DataBackUp;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/DataRepository;->mDataBackUp:Lcom/android/camera/data/backup/DataBackUpMgr;

    invoke-virtual {v0}, Lcom/android/camera/data/backup/DataBackUpMgr;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object v0

    return-object v0
.end method

.method public backUpAll(I)V
    .locals 0

    return-void
.end method

.method public restore()Lcom/android/camera/data/restore/DataRestore;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/DataRepository;->mDataRestore:Lcom/android/camera/data/restore/DataRestoreMgr;

    invoke-virtual {v0}, Lcom/android/camera/data/restore/DataRestoreMgr;->restore()Lcom/android/camera/data/restore/DataRestore;

    move-result-object v0

    return-object v0
.end method

.method public restoreAll(Landroid/content/Context;I)V
    .locals 0

    return-void
.end method
