.class public abstract Lcom/android/camera/data/cloud/DataCloudItemBase;
.super Ljava/lang/Object;
.source "DataCloudItemBase.java"

# interfaces
.implements Lcom/android/camera/data/cloud/DataCloud$CloudItem;


# instance fields
.field private mEditor:Landroid/content/SharedPreferences$Editor;

.field private mPreferences:Landroid/content/SharedPreferences;

.field private mReady:Z

.field private mValues:Landroid/support/v4/util/SimpleArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/SimpleArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/support/v4/util/SimpleArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/SimpleArrayMap;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/cloud/DataCloudItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    return-void
.end method

.method private getSharedPreferences()Landroid/content/SharedPreferences;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudItemBase;->mPreferences:Landroid/content/SharedPreferences;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudItemBase;->initPreferences()V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudItemBase;->mPreferences:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method private initPreferences()V
    .locals 3

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/data/cloud/DataCloudItemBase;->provideKey()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/cloud/DataCloudItemBase;->mPreferences:Landroid/content/SharedPreferences;

    return-void
.end method


# virtual methods
.method public editor()Landroid/content/SharedPreferences$Editor;
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudItemBase;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/cloud/DataCloudItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    return-object v0
.end method

.method public getCloudBooleanDefault(Ljava/lang/String;Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/data/cloud/DataCloudItemBase;->mReady:Z

    if-nez v0, :cond_0

    return p2

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudItemBase;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :cond_1
    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    :goto_0
    return p2
.end method

.method public getCloudFloatDefault(Ljava/lang/String;F)F
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/data/cloud/DataCloudItemBase;->mReady:Z

    if-nez v0, :cond_0

    return p2

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudItemBase;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    :cond_1
    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result p2

    :goto_0
    return p2
.end method

.method public getCloudIntDefault(Ljava/lang/String;I)I
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/data/cloud/DataCloudItemBase;->mReady:Z

    if-nez v0, :cond_0

    return p2

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudItemBase;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :cond_1
    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p2

    :goto_0
    return p2
.end method

.method public getCloudLongDefault(Ljava/lang/String;J)J
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/data/cloud/DataCloudItemBase;->mReady:Z

    if-nez v0, :cond_0

    return-wide p2

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudItemBase;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    :cond_1
    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide p2

    :goto_0
    return-wide p2
.end method

.method public getCloudStringDefault(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/data/cloud/DataCloudItemBase;->mReady:Z

    if-nez v0, :cond_0

    return-object p2

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudItemBase;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    move-object p1, v0

    :goto_0
    if-nez p1, :cond_2

    move-object p1, p2

    :cond_2
    return-object p1
.end method

.method public setReady(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/data/cloud/DataCloudItemBase;->mReady:Z

    return-void
.end method
