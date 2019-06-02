.class public Lcom/android/camera/backup/CameraSettingsBackupImpl;
.super Ljava/lang/Object;
.source "CameraSettingsBackupImpl.java"

# interfaces
.implements Lcom/xiaomi/settingsdk/backup/ICloudBackup;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/backup/CameraSettingsBackupImpl$BackupRestoreHandler;
    }
.end annotation


# static fields
.field private static final FRONT_CLOUD_CAMERA_ID:I = 0x1

.field private static final PREF_ENTRIES:[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

.field private static final REAR_CLOUD_CAMERA_ID:I = 0x0

.field private static final TAG:Ljava/lang/String; = "CameraSettingsBackup"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/android/camera/backup/CameraBackupSettings;->PREF_ENTRIES:[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    sput-object v0, Lcom/android/camera/backup/CameraSettingsBackupImpl;->PREF_ENTRIES:[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addPrefixToEntries([Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;Ljava/lang/String;)[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;
    .locals 8

    array-length v0, p0

    new-array v0, v0, [Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    const/4 v1, 0x0

    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_8

    aget-object v2, p0, v1

    invoke-virtual {v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->getValueClass()Ljava/lang/Class;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "::"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->getCloudKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->getLocalKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->getDefaultValue()Ljava/lang/Object;

    move-result-object v2

    const/4 v6, 0x0

    const-class v7, Ljava/lang/Integer;

    invoke-virtual {v3, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    if-nez v2, :cond_0

    invoke-static {v4, v5}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createIntEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v6

    goto :goto_1

    :cond_0
    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v4, v5, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createIntEntry(Ljava/lang/String;Ljava/lang/String;I)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v6

    goto :goto_1

    :cond_1
    const-class v7, Ljava/lang/Boolean;

    invoke-virtual {v3, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    if-nez v2, :cond_2

    invoke-static {v4, v5}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v6

    goto :goto_1

    :cond_2
    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v4, v5, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;Z)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v6

    goto :goto_1

    :cond_3
    const-class v7, Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    if-nez v2, :cond_4

    invoke-static {v4, v5}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v6

    goto :goto_1

    :cond_4
    check-cast v2, Ljava/lang/String;

    invoke-static {v4, v5, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v6

    goto :goto_1

    :cond_5
    const-class v7, Ljava/lang/Long;

    invoke-virtual {v3, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    if-nez v2, :cond_6

    invoke-static {v4, v5}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createLongEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v6

    goto :goto_1

    :cond_6
    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v4, v5, v2, v3}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createLongEntry(Ljava/lang/String;Ljava/lang/String;J)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v6

    :cond_7
    :goto_1
    aput-object v6, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    :cond_8
    return-object v0
.end method

.method private static checkCameraId(I)Z
    .locals 3

    if-gez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 v0, 0x2

    if-ge p0, v0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cameraId is invalid: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static getAvailableCameraIds()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    nop

    nop

    const/4 v1, 0x0

    invoke-static {v1}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->checkCameraId(I)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->checkCameraId(I)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    return-object v0
.end method

.method private static getCloudPrefix(II)Ljava/lang/String;
    .locals 2

    invoke-static {p0}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->checkCameraId(I)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    nop

    nop

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    if-ne p0, v1, :cond_1

    nop

    move p0, v1

    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "camera_settings_simple_mode_local_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0, p1}, Lcom/android/camera/data/data/config/DataItemConfig;->provideLocalId(II)I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getCloudPrefixByCameraIdAndMode(II)Ljava/lang/String;
    .locals 2

    invoke-static {p0}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->checkCameraId(I)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    nop

    nop

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    if-ne p0, v1, :cond_1

    nop

    move p0, v1

    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "camera_settings_simple_mode_local_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0, p1}, Lcom/android/camera/module/BaseModule;->getPreferencesLocalId(II)I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getSharedPreferencesName(II)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "camera_settings_simple_mode_local_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0, p1}, Lcom/android/camera/data/data/config/DataItemConfig;->provideLocalId(II)I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private handleBackupOrRestore(Landroid/content/Context;Lcom/xiaomi/settingsdk/backup/data/DataPackage;Lcom/android/camera/backup/CameraSettingsBackupImpl$BackupRestoreHandler;)V
    .locals 10

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    invoke-static {}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->getAvailableCameraIds()Ljava/util/List;

    move-result-object v1

    array-length v2, v0

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_2

    aget v5, v0, v4

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-static {v7, v5}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->getSharedPreferencesName(II)Ljava/lang/String;

    move-result-object v8

    nop

    invoke-virtual {p1, v8, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v8

    if-eqz v8, :cond_0

    invoke-static {v7, v5}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->getCloudPrefix(II)Ljava/lang/String;

    move-result-object v7

    sget-object v9, Lcom/android/camera/backup/CameraSettingsBackupImpl;->PREF_ENTRIES:[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    invoke-static {v9, v7}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->addPrefixToEntries([Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;Ljava/lang/String;)[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v7

    invoke-interface {p3, v8, p2, v7}, Lcom/android/camera/backup/CameraSettingsBackupImpl$BackupRestoreHandler;->handle(Landroid/content/SharedPreferences;Lcom/xiaomi/settingsdk/backup/data/DataPackage;[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;)V

    :cond_0
    goto :goto_1

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    const-string v0, "camera_settings_global"

    invoke-virtual {p1, v0, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    sget-object v0, Lcom/android/camera/backup/CameraSettingsBackupImpl;->PREF_ENTRIES:[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    const-string v1, "camera_settings_global"

    invoke-static {v0, v1}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->addPrefixToEntries([Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;Ljava/lang/String;)[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v0

    invoke-interface {p3, p1, p2, v0}, Lcom/android/camera/backup/CameraSettingsBackupImpl$BackupRestoreHandler;->handle(Landroid/content/SharedPreferences;Lcom/xiaomi/settingsdk/backup/data/DataPackage;[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;)V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x1
    .end array-data
.end method

.method private restoreFromVersion1(Landroid/content/Context;Lcom/xiaomi/settingsdk/backup/data/DataPackage;)V
    .locals 16

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    const-string v2, "camera_settings_global"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const/4 v4, 0x2

    new-array v5, v4, [I

    fill-array-data v5, :array_0

    invoke-static {}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->getAvailableCameraIds()Ljava/util/List;

    move-result-object v6

    array-length v7, v5

    move v8, v3

    :goto_0
    const/4 v9, 0x1

    if-ge v8, v7, :cond_3

    aget v10, v5, v8

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Integer;

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    invoke-static {v12, v10}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->getSharedPreferencesName(II)Ljava/lang/String;

    move-result-object v13

    nop

    invoke-virtual {v0, v13, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v13

    if-eqz v13, :cond_1

    nop

    if-nez v10, :cond_0

    nop

    move v14, v3

    goto :goto_2

    :cond_0
    nop

    move v14, v4

    :goto_2
    invoke-static {v12, v14}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->getCloudPrefixByCameraIdAndMode(II)Ljava/lang/String;

    move-result-object v14

    sget-object v15, Lcom/android/camera/backup/CameraSettingsBackupImpl;->PREF_ENTRIES:[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    invoke-static {v15, v14}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->addPrefixToEntries([Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;Ljava/lang/String;)[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v14

    invoke-static {v13, v1, v14, v3}, Lcom/android/camera/backup/CameraBackupHelper;->restoreSettings(Landroid/content/SharedPreferences;Lcom/xiaomi/settingsdk/backup/data/DataPackage;[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;Z)V

    if-nez v10, :cond_1

    if-nez v12, :cond_1

    invoke-static {v2, v1, v14, v9}, Lcom/android/camera/backup/CameraBackupHelper;->restoreSettings(Landroid/content/SharedPreferences;Lcom/xiaomi/settingsdk/backup/data/DataPackage;[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;Z)V

    :cond_1
    goto :goto_1

    :cond_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    :cond_3
    sget-object v0, Lcom/android/camera/backup/CameraSettingsBackupImpl;->PREF_ENTRIES:[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    const-string v3, "camera_settings_global"

    invoke-static {v0, v3}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->addPrefixToEntries([Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;Ljava/lang/String;)[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v0

    invoke-static {v2, v1, v0, v9}, Lcom/android/camera/backup/CameraBackupHelper;->restoreSettings(Landroid/content/SharedPreferences;Lcom/xiaomi/settingsdk/backup/data/DataPackage;[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;Z)V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x1
    .end array-data
.end method

.method private restoreFromVersion3(Landroid/content/Context;Lcom/xiaomi/settingsdk/backup/data/DataPackage;)V
    .locals 10

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    invoke-static {}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->getAvailableCameraIds()Ljava/util/List;

    move-result-object v1

    array-length v2, v0

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_2

    aget v5, v0, v4

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-static {v7, v5}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->getSharedPreferencesName(II)Ljava/lang/String;

    move-result-object v8

    nop

    invoke-virtual {p1, v8, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v8

    if-eqz v8, :cond_0

    invoke-static {v7, v5}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->getCloudPrefix(II)Ljava/lang/String;

    move-result-object v7

    sget-object v9, Lcom/android/camera/backup/CameraSettingsBackupImpl;->PREF_ENTRIES:[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    invoke-static {v9, v7}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->addPrefixToEntries([Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;Ljava/lang/String;)[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v7

    invoke-static {v8, p2, v7, v3}, Lcom/android/camera/backup/CameraBackupHelper;->restoreSettings(Landroid/content/SharedPreferences;Lcom/xiaomi/settingsdk/backup/data/DataPackage;[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;Z)V

    :cond_0
    goto :goto_1

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    const-string v0, "camera_settings_global"

    invoke-virtual {p1, v0, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    sget-object v0, Lcom/android/camera/backup/CameraSettingsBackupImpl;->PREF_ENTRIES:[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    const-string v1, "camera_settings_global"

    invoke-static {v0, v1}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->addPrefixToEntries([Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;Ljava/lang/String;)[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p1, p2, v0, v1}, Lcom/android/camera/backup/CameraBackupHelper;->restoreSettings(Landroid/content/SharedPreferences;Lcom/xiaomi/settingsdk/backup/data/DataPackage;[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;Z)V

    return-void

    :array_0
    .array-data 4
        0x0
        0x1
    .end array-data
.end method


# virtual methods
.method public getCurrentVersion(Landroid/content/Context;)I
    .locals 0

    const/4 p1, 0x4

    return p1
.end method

.method public onBackupSettings(Landroid/content/Context;Lcom/xiaomi/settingsdk/backup/data/DataPackage;)V
    .locals 3

    const-string v0, "CameraSettingsBackup"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "backup version "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->getCurrentVersion(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/android/camera/backup/CameraSettingsBackupImpl$1;

    invoke-direct {v0, p0}, Lcom/android/camera/backup/CameraSettingsBackupImpl$1;-><init>(Lcom/android/camera/backup/CameraSettingsBackupImpl;)V

    invoke-direct {p0, p1, p2, v0}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->handleBackupOrRestore(Landroid/content/Context;Lcom/xiaomi/settingsdk/backup/data/DataPackage;Lcom/android/camera/backup/CameraSettingsBackupImpl$BackupRestoreHandler;)V

    return-void
.end method

.method public onRestoreSettings(Landroid/content/Context;Lcom/xiaomi/settingsdk/backup/data/DataPackage;I)V
    .locals 3

    invoke-virtual {p0, p1}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->getCurrentVersion(Landroid/content/Context;)I

    move-result v0

    if-le p3, v0, :cond_0

    const-string p1, "CameraSettingsBackup"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "skip restore due to cloud version "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " is higher than local version "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const-string v0, "CameraSettingsBackup"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "restore version "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x4

    if-gt v0, p3, :cond_1

    new-instance p3, Lcom/android/camera/backup/CameraSettingsBackupImpl$2;

    invoke-direct {p3, p0}, Lcom/android/camera/backup/CameraSettingsBackupImpl$2;-><init>(Lcom/android/camera/backup/CameraSettingsBackupImpl;)V

    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->handleBackupOrRestore(Landroid/content/Context;Lcom/xiaomi/settingsdk/backup/data/DataPackage;Lcom/android/camera/backup/CameraSettingsBackupImpl$BackupRestoreHandler;)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x3

    if-ne v0, p3, :cond_2

    invoke-direct {p0, p1, p2}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->restoreFromVersion3(Landroid/content/Context;Lcom/xiaomi/settingsdk/backup/data/DataPackage;)V

    goto :goto_0

    :cond_2
    const/4 v0, 0x1

    if-ne v0, p3, :cond_3

    invoke-direct {p0, p1, p2}, Lcom/android/camera/backup/CameraSettingsBackupImpl;->restoreFromVersion1(Landroid/content/Context;Lcom/xiaomi/settingsdk/backup/data/DataPackage;)V

    :cond_3
    :goto_0
    return-void
.end method
