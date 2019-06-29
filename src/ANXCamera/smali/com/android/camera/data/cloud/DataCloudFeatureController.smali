.class public Lcom/android/camera/data/cloud/DataCloudFeatureController;
.super Ljava/lang/Object;
.source "DataCloudFeatureController.java"

# interfaces
.implements Lcom/android/camera/data/cloud/DataCloud$CloudFeature;


# static fields
.field public static final KEY:Ljava/lang/String; = "cloud_feature"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mPreferences:Landroid/content/SharedPreferences;

.field private mReady:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/data/cloud/DataCloudFeatureController;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/data/cloud/DataCloudFeatureController;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getSharedPreferences()Landroid/content/SharedPreferences;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudFeatureController;->mPreferences:Landroid/content/SharedPreferences;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudFeatureController;->initPreferences()V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudFeatureController;->mPreferences:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method private initPreferences()V
    .locals 3

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/data/cloud/DataCloudFeatureController;->provideKey()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/cloud/DataCloudFeatureController;->mPreferences:Landroid/content/SharedPreferences;

    return-void
.end method


# virtual methods
.method public editor()Landroid/content/SharedPreferences$Editor;
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudFeatureController;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    return-object v0
.end method

.method public filterFeature(Lcom/android/camera/data/data/config/SupportedConfigs;)Lcom/android/camera/data/data/config/SupportedConfigs;
    .locals 8

    iget-boolean v0, p0, Lcom/android/camera/data/cloud/DataCloudFeatureController;->mReady:Z

    if-nez v0, :cond_0

    return-object p1

    :cond_0
    new-instance v0, Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-direct {v0}, Lcom/android/camera/data/data/config/SupportedConfigs;-><init>()V

    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudFeatureController;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->getLength()I

    move-result v3

    if-ge v2, v3, :cond_2

    invoke-virtual {p1, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->getConfig(I)I

    move-result v3

    nop

    const/4 v4, 0x1

    :try_start_0
    invoke-static {v3}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigKey(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    move v4, v5

    goto :goto_1

    :catch_0
    move-exception v5

    sget-object v5, Lcom/android/camera/data/cloud/DataCloudFeatureController;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "unknown config "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    if-eqz v4, :cond_1

    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public getAllDisabledFeatures()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudFeatureController;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public provideKey()Ljava/lang/String;
    .locals 1

    const-string v0, "cloud_feature"

    return-object v0
.end method

.method public setReady(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/data/cloud/DataCloudFeatureController;->mReady:Z

    return-void
.end method
