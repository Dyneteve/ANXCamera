.class public Lcom/android/camera/preferences/SettingsOverrider;
.super Ljava/lang/Object;
.source "SettingsOverrider.java"


# instance fields
.field private mRestoredMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/camera/preferences/SettingsOverrider;->mRestoredMap:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public varargs overrideSettings([Ljava/lang/String;)V
    .locals 8

    invoke-static {}, Lcom/android/camera/preferences/CameraSettingPreferences;->instance()Lcom/android/camera/preferences/CameraSettingPreferences;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/preferences/CameraSettingPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/preferences/SettingsOverrider;->mRestoredMap:Ljava/util/HashMap;

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Lcom/android/camera/preferences/SettingsOverrider;->mRestoredMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->clear()V

    const/4 v3, 0x0

    :goto_0
    array-length v4, p1

    if-ge v3, v4, :cond_1

    aget-object v4, p1, v3

    add-int/lit8 v5, v3, 0x1

    aget-object v5, p1, v5

    const/4 v6, 0x0

    invoke-virtual {v0, v4, v6}, Lcom/android/camera/preferences/CameraSettingPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/android/camera/preferences/SettingsOverrider;->mRestoredMap:Ljava/util/HashMap;

    invoke-virtual {v7, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-nez v5, :cond_0

    invoke-interface {v1, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_1

    :cond_0
    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :goto_1
    add-int/lit8 v3, v3, 0x2

    goto :goto_0

    :cond_1
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    monitor-exit v2

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public removeSavedSetting(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/preferences/SettingsOverrider;->mRestoredMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public restoreSettings()Z
    .locals 9

    invoke-static {}, Lcom/android/camera/preferences/CameraSettingPreferences;->instance()Lcom/android/camera/preferences/CameraSettingPreferences;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/preferences/CameraSettingPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    nop

    iget-object v2, p0, Lcom/android/camera/preferences/SettingsOverrider;->mRestoredMap:Ljava/util/HashMap;

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Lcom/android/camera/preferences/SettingsOverrider;->mRestoredMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v4, 0x0

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6}, Lcom/android/camera/preferences/CameraSettingPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/android/camera/preferences/SettingsOverrider;->mRestoredMap:Ljava/util/HashMap;

    invoke-virtual {v7, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    const/4 v8, 0x1

    if-nez v7, :cond_0

    invoke-interface {v1, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    if-eqz v6, :cond_1

    nop

    :goto_1
    move v4, v8

    goto :goto_2

    :cond_0
    invoke-interface {v1, v5, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    goto :goto_1

    :cond_1
    :goto_2
    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/android/camera/preferences/SettingsOverrider;->mRestoredMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return v4

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
