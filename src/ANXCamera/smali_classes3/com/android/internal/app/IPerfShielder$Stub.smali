.class public abstract Lcom/android/internal/app/IPerfShielder$Stub;
.super Landroid/os/Binder;
.source "IPerfShielder.java"

# interfaces
.implements Lcom/android/internal/app/IPerfShielder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/app/IPerfShielder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/app/IPerfShielder$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.android.internal.app.IPerfShielder"

.field static final TRANSACTION_abortMatchingScenario:I = 0x1e

.field static final TRANSACTION_abortSpecificScenario:I = 0x1f

.field static final TRANSACTION_addActivityLaunchTime:I = 0x2

.field static final TRANSACTION_addCallingPkgHookRule:I = 0x1a

.field static final TRANSACTION_addTimeConsumingIntent:I = 0x10

.field static final TRANSACTION_beginScenario:I = 0x1d

.field static final TRANSACTION_clearTimeConsumingIntent:I = 0x12

.field static final TRANSACTION_closeCheckPriority:I = 0xd

.field static final TRANSACTION_deleteFilterInfo:I = 0x25

.field static final TRANSACTION_deletePackageInfo:I = 0x17

.field static final TRANSACTION_deleteRedirectRule:I = 0x15

.field static final TRANSACTION_finishMatchingScenario:I = 0x20

.field static final TRANSACTION_finishSpecificScenario:I = 0x21

.field static final TRANSACTION_getAllRunningProcessMemInfos:I = 0x7

.field static final TRANSACTION_getFreeMemory:I = 0x18

.field static final TRANSACTION_getMemoryTrimLevel:I = 0x13

.field static final TRANSACTION_getPackageNameByPid:I = 0x5

.field static final TRANSACTION_getPerfEventSocketFd:I = 0x1c

.field static final TRANSACTION_insertFilterInfo:I = 0x24

.field static final TRANSACTION_insertPackageInfo:I = 0x16

.field static final TRANSACTION_insertRedirectRule:I = 0x14

.field static final TRANSACTION_killUnusedApp:I = 0x4

.field static final TRANSACTION_removeCallingPkgHookRule:I = 0x1b

.field static final TRANSACTION_removeServicePriority:I = 0xc

.field static final TRANSACTION_removeTimeConsumingIntent:I = 0x11

.field static final TRANSACTION_reportAnr:I = 0x19

.field static final TRANSACTION_reportExcessiveCpuUsageRecords:I = 0x22

.field static final TRANSACTION_reportNotificationClick:I = 0x23

.field static final TRANSACTION_reportPerceptibleJank:I = 0x1

.field static final TRANSACTION_resolveQuickAppInfos:I = 0x26

.field static final TRANSACTION_setForkedProcessGroup:I = 0x6

.field static final TRANSACTION_setHapLinks:I = 0x27

.field static final TRANSACTION_setMiuiBroadcastDispatchEnable:I = 0xf

.field static final TRANSACTION_setMiuiContentProviderControl:I = 0xe

.field static final TRANSACTION_setSchedFgPid:I = 0x3

.field static final TRANSACTION_setServicePriority:I = 0xa

.field static final TRANSACTION_setServicePriorityWithNoProc:I = 0xb

.field static final TRANSACTION_updateProcessFullMemInfoByPids:I = 0x8

.field static final TRANSACTION_updateProcessPartialMemInfoByPids:I = 0x9


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    const-string v0, "com.android.internal.app.IPerfShielder"

    invoke-virtual {p0, p0, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/android/internal/app/IPerfShielder;
    .registers 3

    if-nez p0, :cond_4

    const/4 v0, 0x0

    return-object v0

    :cond_4
    const-string v0, "com.android.internal.app.IPerfShielder"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_14

    instance-of v1, v0, Lcom/android/internal/app/IPerfShielder;

    if-eqz v1, :cond_14

    move-object v1, v0

    check-cast v1, Lcom/android/internal/app/IPerfShielder;

    return-object v1

    :cond_14
    new-instance v1, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;

    invoke-direct {v1, p0}, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v1
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 1

    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .registers 35
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    move-object/from16 v13, p0

    move/from16 v14, p1

    move-object/from16 v15, p2

    move-object/from16 v11, p3

    const-string v12, "com.android.internal.app.IPerfShielder"

    const v0, 0x5f4e5446

    const/4 v10, 0x1

    if-eq v14, v0, :cond_453

    const/4 v9, 0x0

    const/4 v0, 0x0

    packed-switch v14, :pswitch_data_45c

    invoke-super/range {p0 .. p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v0

    return v0

    :pswitch_1a
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v15, v1}, Landroid/os/Parcel;->readHashMap(Ljava/lang/ClassLoader;)Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_38

    sget-object v0, Landroid/content/pm/ActivityInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ActivityInfo;

    goto :goto_39

    :cond_38
    nop

    :goto_39
    invoke-virtual {v13, v2, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->setHapLinks(Ljava/util/Map;Landroid/content/pm/ActivityInfo;)V

    return v10

    :pswitch_3d
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_4f

    sget-object v0, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    goto :goto_50

    :cond_4f
    nop

    :goto_50
    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->resolveQuickAppInfos(Landroid/content/Intent;)Ljava/util/List;

    move-result-object v1

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {v11, v1}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    return v10

    :pswitch_5b
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->deleteFilterInfo(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {v11, v1}, Landroid/os/Parcel;->writeInt(I)V

    return v10

    :pswitch_6d
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_87

    sget-object v0, Landroid/net/Uri;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    goto :goto_88

    :cond_87
    nop

    :goto_88
    sget-object v3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v15, v3}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v13, v1, v2, v0, v3}, Lcom/android/internal/app/IPerfShielder$Stub;->insertFilterInfo(Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/List;)Z

    move-result v4

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {v11, v4}, Landroid/os/Parcel;->writeInt(I)V

    return v10

    :pswitch_99
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_af

    sget-object v0, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    goto :goto_b0

    :cond_af
    nop

    :goto_b0
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    invoke-virtual {v13, v1, v0, v2, v3}, Lcom/android/internal/app/IPerfShielder$Stub;->reportNotificationClick(Ljava/lang/String;Landroid/content/Intent;J)V

    return v10

    :pswitch_b8
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    sget-object v0, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v15, v0}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->reportExcessiveCpuUsageRecords(Ljava/util/List;)V

    return v10

    :pswitch_c5
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_d7

    sget-object v1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Bundle;

    goto :goto_d8

    :cond_d7
    move-object v1, v0

    :goto_d8
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_e8

    sget-object v0, Landroid/os/statistics/E2EScenarioPayload;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/statistics/E2EScenarioPayload;

    :goto_e6
    move-object v2, v0

    goto :goto_e9

    :cond_e8
    goto :goto_e6

    :goto_e9
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v7

    move-object v0, v13

    move v3, v6

    move-wide v4, v7

    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/app/IPerfShielder$Stub;->finishSpecificScenario(Landroid/os/Bundle;Landroid/os/statistics/E2EScenarioPayload;IJ)V

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    return v10

    :pswitch_fb
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_10d

    sget-object v1, Landroid/os/statistics/E2EScenario;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/statistics/E2EScenario;

    goto :goto_10e

    :cond_10d
    move-object v1, v0

    :goto_10e
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_122

    sget-object v0, Landroid/os/statistics/E2EScenarioPayload;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/statistics/E2EScenarioPayload;

    :goto_120
    move-object v3, v0

    goto :goto_123

    :cond_122
    goto :goto_120

    :goto_123
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v8

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v16

    move-object v0, v13

    move-object v2, v7

    move v4, v8

    move-wide/from16 v5, v16

    invoke-virtual/range {v0 .. v6}, Lcom/android/internal/app/IPerfShielder$Stub;->finishMatchingScenario(Landroid/os/statistics/E2EScenario;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;IJ)V

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    return v10

    :pswitch_137
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_149

    sget-object v0, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    goto :goto_14a

    :cond_149
    nop

    :goto_14a
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    invoke-virtual {v13, v0, v1, v2, v3}, Lcom/android/internal/app/IPerfShielder$Stub;->abortSpecificScenario(Landroid/os/Bundle;IJ)V

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    return v10

    :pswitch_159
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_16c

    sget-object v0, Landroid/os/statistics/E2EScenario;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/statistics/E2EScenario;

    :goto_16a
    move-object v1, v0

    goto :goto_16d

    :cond_16c
    goto :goto_16a

    :goto_16d
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v7

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v8

    move-object v0, v13

    move-object v2, v6

    move v3, v7

    move-wide v4, v8

    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/app/IPerfShielder$Stub;->abortMatchingScenario(Landroid/os/statistics/E2EScenario;Ljava/lang/String;IJ)V

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    return v10

    :pswitch_184
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_196

    sget-object v1, Landroid/os/statistics/E2EScenario;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/statistics/E2EScenario;

    goto :goto_197

    :cond_196
    move-object v1, v0

    :goto_197
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_1a6

    sget-object v2, Landroid/os/statistics/E2EScenarioSettings;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v2, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/statistics/E2EScenarioSettings;

    goto :goto_1a7

    :cond_1a6
    move-object v2, v0

    :goto_1a7
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_1bb

    sget-object v0, Landroid/os/statistics/E2EScenarioPayload;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/statistics/E2EScenarioPayload;

    :goto_1b9
    move-object v4, v0

    goto :goto_1bc

    :cond_1bb
    goto :goto_1b9

    :goto_1bc
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v17

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v18

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_1cc

    move v8, v10

    goto :goto_1cd

    :cond_1cc
    move v8, v9

    :goto_1cd
    move-object v0, v13

    move-object/from16 v3, v16

    move/from16 v5, v17

    move-wide/from16 v6, v18

    invoke-virtual/range {v0 .. v8}, Lcom/android/internal/app/IPerfShielder$Stub;->beginScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;IJZ)Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v0, :cond_1e4

    invoke-virtual {v11, v10}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {v0, v11, v10}, Landroid/os/Bundle;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_1e7

    :cond_1e4
    invoke-virtual {v11, v9}, Landroid/os/Parcel;->writeInt(I)V

    :goto_1e7
    return v10

    :pswitch_1e8
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/app/IPerfShielder$Stub;->getPerfEventSocketFd()Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v0, :cond_1fb

    invoke-virtual {v11, v10}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {v0, v11, v10}, Landroid/os/ParcelFileDescriptor;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_1fe

    :cond_1fb
    invoke-virtual {v11, v9}, Landroid/os/Parcel;->writeInt(I)V

    :goto_1fe
    return v10

    :pswitch_1ff
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v13, v0, v1}, Lcom/android/internal/app/IPerfShielder$Stub;->removeCallingPkgHookRule(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {v11, v2}, Landroid/os/Parcel;->writeInt(I)V

    return v10

    :pswitch_215
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v0, v1, v2}, Lcom/android/internal/app/IPerfShielder$Stub;->addCallingPkgHookRule(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {v11, v3}, Landroid/os/Parcel;->writeInt(I)V

    return v10

    :pswitch_22f
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v8

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v16

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v18

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v20

    move-object v0, v13

    move v1, v8

    move-object v2, v9

    move-wide/from16 v3, v16

    move-wide/from16 v5, v18

    move-object/from16 v7, v20

    invoke-virtual/range {v0 .. v7}, Lcom/android/internal/app/IPerfShielder$Stub;->reportAnr(ILjava/lang/String;JJLjava/lang/String;)V

    return v10

    :pswitch_253
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/app/IPerfShielder$Stub;->getFreeMemory()J

    move-result-wide v0

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {v11, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    return v10

    :pswitch_261
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->deletePackageInfo(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {v11, v1}, Landroid/os/Parcel;->writeInt(I)V

    return v10

    :pswitch_273
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_285

    sget-object v0, Landroid/content/pm/PackageInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/PackageInfo;

    goto :goto_286

    :cond_285
    nop

    :goto_286
    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->insertPackageInfo(Landroid/content/pm/PackageInfo;)Z

    move-result v1

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {v11, v1}, Landroid/os/Parcel;->writeInt(I)V

    return v10

    :pswitch_291
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v13, v0, v1}, Lcom/android/internal/app/IPerfShielder$Stub;->deleteRedirectRule(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {v11, v2}, Landroid/os/Parcel;->writeInt(I)V

    return v10

    :pswitch_2a7
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_2c5

    sget-object v0, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    goto :goto_2c6

    :cond_2c5
    nop

    :goto_2c6
    invoke-virtual {v13, v1, v2, v3, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->insertRedirectRule(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Z

    move-result v4

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {v11, v4}, Landroid/os/Parcel;->writeInt(I)V

    return v10

    :pswitch_2d1
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/app/IPerfShielder$Stub;->getMemoryTrimLevel()I

    move-result v0

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {v11, v0}, Landroid/os/Parcel;->writeInt(I)V

    return v10

    :pswitch_2df
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/app/IPerfShielder$Stub;->clearTimeConsumingIntent()V

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    return v10

    :pswitch_2e9
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->removeTimeConsumingIntent([Ljava/lang/String;)V

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    return v10

    :pswitch_2f7
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->addTimeConsumingIntent([Ljava/lang/String;)V

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    return v10

    :pswitch_305
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_310

    move v9, v10

    nop

    :cond_310
    move v0, v9

    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->setMiuiBroadcastDispatchEnable(Z)V

    return v10

    :pswitch_315
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_320

    move v9, v10

    nop

    :cond_320
    move v0, v9

    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->setMiuiContentProviderControl(Z)V

    return v10

    :pswitch_325
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/app/IPerfShielder$Stub;->closeCheckPriority()V

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    return v10

    :pswitch_32f
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_341

    sget-object v0, Lcom/android/internal/app/MiuiServicePriority;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/app/MiuiServicePriority;

    goto :goto_342

    :cond_341
    nop

    :goto_342
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_34a

    move v9, v10

    nop

    :cond_34a
    move v1, v9

    invoke-virtual {v13, v0, v1}, Lcom/android/internal/app/IPerfShielder$Stub;->removeServicePriority(Lcom/android/internal/app/MiuiServicePriority;Z)V

    return v10

    :pswitch_34f
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    sget-object v0, Lcom/android/internal/app/MiuiServicePriority;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v15, v0}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    invoke-virtual {v13, v0, v1, v2}, Lcom/android/internal/app/IPerfShielder$Stub;->setServicePriorityWithNoProc(Ljava/util/List;J)V

    return v10

    :pswitch_360
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    sget-object v0, Lcom/android/internal/app/MiuiServicePriority;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v15, v0}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->setServicePriority(Ljava/util/List;)V

    return v10

    :pswitch_36d
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->updateProcessPartialMemInfoByPids([I)Ljava/util/List;

    move-result-object v1

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {v11, v1}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    return v10

    :pswitch_37f
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->updateProcessFullMemInfoByPids([I)Ljava/util/List;

    move-result-object v1

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {v11, v1}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    return v10

    :pswitch_391
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/app/IPerfShielder$Stub;->getAllRunningProcessMemInfos()Ljava/util/List;

    move-result-object v0

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {v11, v0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    return v10

    :pswitch_39f
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v13, v0, v1, v2, v3}, Lcom/android/internal/app/IPerfShielder$Stub;->setForkedProcessGroup(IIILjava/lang/String;)V

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    return v10

    :pswitch_3b9
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->getPackageNameByPid(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {v11, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v10

    :pswitch_3cb
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    invoke-virtual {v13, v0, v1}, Lcom/android/internal/app/IPerfShielder$Stub;->killUnusedApp(II)V

    return v10

    :pswitch_3da
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->setSchedFgPid(I)V

    return v10

    :pswitch_3e5
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v18

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v20

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_400

    move v7, v10

    goto :goto_401

    :cond_400
    move v7, v9

    :goto_401
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_409

    move v8, v10

    goto :goto_40a

    :cond_409
    move v8, v9

    :goto_40a
    move-object v0, v13

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    move-wide/from16 v3, v18

    move-wide/from16 v5, v20

    invoke-virtual/range {v0 .. v8}, Lcom/android/internal/app/IPerfShielder$Stub;->addActivityLaunchTime(Ljava/lang/String;Ljava/lang/String;JJZZ)V

    return v10

    :pswitch_417
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v16

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v17

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v19

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v21

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v23

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v25

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v26

    move-object v0, v13

    move/from16 v1, v16

    move/from16 v2, v17

    move-object/from16 v3, v18

    move-wide/from16 v4, v19

    move-wide/from16 v6, v21

    move-wide/from16 v8, v23

    move/from16 v28, v10

    move/from16 v10, v25

    move-object v13, v11

    move-object v14, v12

    move-wide/from16 v11, v26

    invoke-virtual/range {v0 .. v12}, Lcom/android/internal/app/IPerfShielder$Stub;->reportPerceptibleJank(IILjava/lang/String;JJJIJ)V

    return v28

    :cond_453
    move/from16 v28, v10

    move-object v13, v11

    move-object v14, v12

    invoke-virtual {v13, v14}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v28

    nop

    :pswitch_data_45c
    .packed-switch 0x1
        :pswitch_417
        :pswitch_3e5
        :pswitch_3da
        :pswitch_3cb
        :pswitch_3b9
        :pswitch_39f
        :pswitch_391
        :pswitch_37f
        :pswitch_36d
        :pswitch_360
        :pswitch_34f
        :pswitch_32f
        :pswitch_325
        :pswitch_315
        :pswitch_305
        :pswitch_2f7
        :pswitch_2e9
        :pswitch_2df
        :pswitch_2d1
        :pswitch_2a7
        :pswitch_291
        :pswitch_273
        :pswitch_261
        :pswitch_253
        :pswitch_22f
        :pswitch_215
        :pswitch_1ff
        :pswitch_1e8
        :pswitch_184
        :pswitch_159
        :pswitch_137
        :pswitch_fb
        :pswitch_c5
        :pswitch_b8
        :pswitch_99
        :pswitch_6d
        :pswitch_5b
        :pswitch_3d
        :pswitch_1a
    .end packed-switch
.end method
