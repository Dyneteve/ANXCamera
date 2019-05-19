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

    .line 17
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 18
    const-string v0, "com.android.internal.app.IPerfShielder"

    invoke-virtual {p0, p0, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 19
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/android/internal/app/IPerfShielder;
    .registers 3
    .param p0, "obj"    # Landroid/os/IBinder;

    .line 26
    if-nez p0, :cond_4

    .line 27
    const/4 v0, 0x0

    return-object v0

    .line 29
    :cond_4
    const-string v0, "com.android.internal.app.IPerfShielder"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 30
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_14

    instance-of v1, v0, Lcom/android/internal/app/IPerfShielder;

    if-eqz v1, :cond_14

    .line 31
    move-object v1, v0

    check-cast v1, Lcom/android/internal/app/IPerfShielder;

    return-object v1

    .line 33
    :cond_14
    new-instance v1, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;

    invoke-direct {v1, p0}, Lcom/android/internal/app/IPerfShielder$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v1
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 1

    .line 37
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .registers 35
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    move-object/from16 v13, p0

    move/from16 v14, p1

    move-object/from16 v15, p2

    move-object/from16 v11, p3

    .line 41
    const-string v12, "com.android.internal.app.IPerfShielder"

    .line 42
    .local v12, "descriptor":Ljava/lang/String;
    const v0, 0x5f4e5446

    const/4 v10, 0x1

    if-eq v14, v0, :cond_453

    const/4 v9, 0x0

    const/4 v0, 0x0

    packed-switch v14, :pswitch_data_45c

    .line 593
    invoke-super/range {p0 .. p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v0

    return v0

    .line 577
    :pswitch_1a
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 579
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 580
    .local v1, "cl":Ljava/lang/ClassLoader;
    invoke-virtual {v15, v1}, Landroid/os/Parcel;->readHashMap(Ljava/lang/ClassLoader;)Ljava/util/HashMap;

    move-result-object v2

    .line 582
    .local v2, "_arg0":Ljava/util/Map;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_38

    .line 583
    sget-object v0, Landroid/content/pm/ActivityInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ActivityInfo;

    .local v0, "_arg1":Landroid/content/pm/ActivityInfo;
    goto :goto_39

    .line 586
    .end local v0    # "_arg1":Landroid/content/pm/ActivityInfo;
    :cond_38
    nop

    .line 588
    .restart local v0    # "_arg1":Landroid/content/pm/ActivityInfo;
    :goto_39
    invoke-virtual {v13, v2, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->setHapLinks(Ljava/util/Map;Landroid/content/pm/ActivityInfo;)V

    .line 589
    return v10

    .line 562
    .end local v0    # "_arg1":Landroid/content/pm/ActivityInfo;
    .end local v1    # "cl":Ljava/lang/ClassLoader;
    .end local v2    # "_arg0":Ljava/util/Map;
    :pswitch_3d
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 564
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_4f

    .line 565
    sget-object v0, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    .local v0, "_arg0":Landroid/content/Intent;
    goto :goto_50

    .line 568
    .end local v0    # "_arg0":Landroid/content/Intent;
    :cond_4f
    nop

    .line 570
    .restart local v0    # "_arg0":Landroid/content/Intent;
    :goto_50
    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->resolveQuickAppInfos(Landroid/content/Intent;)Ljava/util/List;

    move-result-object v1

    .line 571
    .local v1, "_result":Ljava/util/List;, "Ljava/util/List<Lcom/android/internal/app/QuickAppResolveInfo;>;"
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 572
    invoke-virtual {v11, v1}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 573
    return v10

    .line 552
    .end local v0    # "_arg0":Landroid/content/Intent;
    .end local v1    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/android/internal/app/QuickAppResolveInfo;>;"
    :pswitch_5b
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 554
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 555
    .local v0, "_arg0":Ljava/lang/String;
    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->deleteFilterInfo(Ljava/lang/String;)Z

    move-result v1

    .line 556
    .local v1, "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 557
    invoke-virtual {v11, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 558
    return v10

    .line 531
    .end local v0    # "_arg0":Ljava/lang/String;
    .end local v1    # "_result":Z
    :pswitch_6d
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 533
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 535
    .local v1, "_arg0":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 537
    .local v2, "_arg1":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_87

    .line 538
    sget-object v0, Landroid/net/Uri;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    .local v0, "_arg2":Landroid/net/Uri;
    goto :goto_88

    .line 541
    .end local v0    # "_arg2":Landroid/net/Uri;
    :cond_87
    nop

    .line 544
    .restart local v0    # "_arg2":Landroid/net/Uri;
    :goto_88
    sget-object v3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v15, v3}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v3

    .line 545
    .local v3, "_arg3":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    invoke-virtual {v13, v1, v2, v0, v3}, Lcom/android/internal/app/IPerfShielder$Stub;->insertFilterInfo(Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/List;)Z

    move-result v4

    .line 546
    .local v4, "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 547
    invoke-virtual {v11, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 548
    return v10

    .line 514
    .end local v0    # "_arg2":Landroid/net/Uri;
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v2    # "_arg1":Ljava/lang/String;
    .end local v3    # "_arg3":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    .end local v4    # "_result":Z
    :pswitch_99
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 516
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 518
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_af

    .line 519
    sget-object v0, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    .local v0, "_arg1":Landroid/content/Intent;
    goto :goto_b0

    .line 522
    .end local v0    # "_arg1":Landroid/content/Intent;
    :cond_af
    nop

    .line 525
    .restart local v0    # "_arg1":Landroid/content/Intent;
    :goto_b0
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    .line 526
    .local v2, "_arg2":J
    invoke-virtual {v13, v1, v0, v2, v3}, Lcom/android/internal/app/IPerfShielder$Stub;->reportNotificationClick(Ljava/lang/String;Landroid/content/Intent;J)V

    .line 527
    return v10

    .line 506
    .end local v0    # "_arg1":Landroid/content/Intent;
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v2    # "_arg2":J
    :pswitch_b8
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 508
    sget-object v0, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v15, v0}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    .line 509
    .local v0, "_arg0":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->reportExcessiveCpuUsageRecords(Ljava/util/List;)V

    .line 510
    return v10

    .line 481
    .end local v0    # "_arg0":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    :pswitch_c5
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 483
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_d7

    .line 484
    sget-object v1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Bundle;

    .local v1, "_arg0":Landroid/os/Bundle;
    goto :goto_d8

    .line 487
    .end local v1    # "_arg0":Landroid/os/Bundle;
    :cond_d7
    move-object v1, v0

    .line 490
    .restart local v1    # "_arg0":Landroid/os/Bundle;
    :goto_d8
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_e8

    .line 491
    sget-object v0, Landroid/os/statistics/E2EScenarioPayload;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/statistics/E2EScenarioPayload;

    .line 494
    .local v2, "_arg1":Landroid/os/statistics/E2EScenarioPayload;
    :goto_e6
    move-object v2, v0

    goto :goto_e9

    .end local v2    # "_arg1":Landroid/os/statistics/E2EScenarioPayload;
    :cond_e8
    goto :goto_e6

    .line 497
    .restart local v2    # "_arg1":Landroid/os/statistics/E2EScenarioPayload;
    :goto_e9
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v6

    .line 499
    .local v6, "_arg2":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v7

    .line 500
    .local v7, "_arg3":J
    move-object v0, v13

    move v3, v6

    move-wide v4, v7

    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/app/IPerfShielder$Stub;->finishSpecificScenario(Landroid/os/Bundle;Landroid/os/statistics/E2EScenarioPayload;IJ)V

    .line 501
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 502
    return v10

    .line 454
    .end local v1    # "_arg0":Landroid/os/Bundle;
    .end local v2    # "_arg1":Landroid/os/statistics/E2EScenarioPayload;
    .end local v6    # "_arg2":I
    .end local v7    # "_arg3":J
    :pswitch_fb
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 456
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_10d

    .line 457
    sget-object v1, Landroid/os/statistics/E2EScenario;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/statistics/E2EScenario;

    .local v1, "_arg0":Landroid/os/statistics/E2EScenario;
    goto :goto_10e

    .line 460
    .end local v1    # "_arg0":Landroid/os/statistics/E2EScenario;
    :cond_10d
    move-object v1, v0

    .line 463
    .restart local v1    # "_arg0":Landroid/os/statistics/E2EScenario;
    :goto_10e
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v7

    .line 465
    .local v7, "_arg1":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_122

    .line 466
    sget-object v0, Landroid/os/statistics/E2EScenarioPayload;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/statistics/E2EScenarioPayload;

    .line 469
    .local v3, "_arg2":Landroid/os/statistics/E2EScenarioPayload;
    :goto_120
    move-object v3, v0

    goto :goto_123

    .end local v3    # "_arg2":Landroid/os/statistics/E2EScenarioPayload;
    :cond_122
    goto :goto_120

    .line 472
    .restart local v3    # "_arg2":Landroid/os/statistics/E2EScenarioPayload;
    :goto_123
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v8

    .line 474
    .local v8, "_arg3":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v16

    .line 475
    .local v16, "_arg4":J
    move-object v0, v13

    move-object v2, v7

    move v4, v8

    move-wide/from16 v5, v16

    invoke-virtual/range {v0 .. v6}, Lcom/android/internal/app/IPerfShielder$Stub;->finishMatchingScenario(Landroid/os/statistics/E2EScenario;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;IJ)V

    .line 476
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 477
    return v10

    .line 436
    .end local v1    # "_arg0":Landroid/os/statistics/E2EScenario;
    .end local v3    # "_arg2":Landroid/os/statistics/E2EScenarioPayload;
    .end local v7    # "_arg1":Ljava/lang/String;
    .end local v8    # "_arg3":I
    .end local v16    # "_arg4":J
    :pswitch_137
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 438
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_149

    .line 439
    sget-object v0, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    .local v0, "_arg0":Landroid/os/Bundle;
    goto :goto_14a

    .line 442
    .end local v0    # "_arg0":Landroid/os/Bundle;
    :cond_149
    nop

    .line 445
    .restart local v0    # "_arg0":Landroid/os/Bundle;
    :goto_14a
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 447
    .local v1, "_arg1":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    .line 448
    .local v2, "_arg2":J
    invoke-virtual {v13, v0, v1, v2, v3}, Lcom/android/internal/app/IPerfShielder$Stub;->abortSpecificScenario(Landroid/os/Bundle;IJ)V

    .line 449
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 450
    return v10

    .line 416
    .end local v0    # "_arg0":Landroid/os/Bundle;
    .end local v1    # "_arg1":I
    .end local v2    # "_arg2":J
    :pswitch_159
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 418
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_16c

    .line 419
    sget-object v0, Landroid/os/statistics/E2EScenario;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/statistics/E2EScenario;

    .line 422
    .local v1, "_arg0":Landroid/os/statistics/E2EScenario;
    :goto_16a
    move-object v1, v0

    goto :goto_16d

    .end local v1    # "_arg0":Landroid/os/statistics/E2EScenario;
    :cond_16c
    goto :goto_16a

    .line 425
    .restart local v1    # "_arg0":Landroid/os/statistics/E2EScenario;
    :goto_16d
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v6

    .line 427
    .local v6, "_arg1":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v7

    .line 429
    .local v7, "_arg2":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v8

    .line 430
    .local v8, "_arg3":J
    move-object v0, v13

    move-object v2, v6

    move v3, v7

    move-wide v4, v8

    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/app/IPerfShielder$Stub;->abortMatchingScenario(Landroid/os/statistics/E2EScenario;Ljava/lang/String;IJ)V

    .line 431
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 432
    return v10

    .line 373
    .end local v1    # "_arg0":Landroid/os/statistics/E2EScenario;
    .end local v6    # "_arg1":Ljava/lang/String;
    .end local v7    # "_arg2":I
    .end local v8    # "_arg3":J
    :pswitch_184
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 375
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_196

    .line 376
    sget-object v1, Landroid/os/statistics/E2EScenario;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/statistics/E2EScenario;

    .restart local v1    # "_arg0":Landroid/os/statistics/E2EScenario;
    goto :goto_197

    .line 379
    .end local v1    # "_arg0":Landroid/os/statistics/E2EScenario;
    :cond_196
    move-object v1, v0

    .line 382
    .restart local v1    # "_arg0":Landroid/os/statistics/E2EScenario;
    :goto_197
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_1a6

    .line 383
    sget-object v2, Landroid/os/statistics/E2EScenarioSettings;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v2, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/statistics/E2EScenarioSettings;

    .local v2, "_arg1":Landroid/os/statistics/E2EScenarioSettings;
    goto :goto_1a7

    .line 386
    .end local v2    # "_arg1":Landroid/os/statistics/E2EScenarioSettings;
    :cond_1a6
    move-object v2, v0

    .line 389
    .restart local v2    # "_arg1":Landroid/os/statistics/E2EScenarioSettings;
    :goto_1a7
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v16

    .line 391
    .local v16, "_arg2":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_1bb

    .line 392
    sget-object v0, Landroid/os/statistics/E2EScenarioPayload;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/statistics/E2EScenarioPayload;

    .line 395
    .local v4, "_arg3":Landroid/os/statistics/E2EScenarioPayload;
    :goto_1b9
    move-object v4, v0

    goto :goto_1bc

    .end local v4    # "_arg3":Landroid/os/statistics/E2EScenarioPayload;
    :cond_1bb
    goto :goto_1b9

    .line 398
    .restart local v4    # "_arg3":Landroid/os/statistics/E2EScenarioPayload;
    :goto_1bc
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v17

    .line 400
    .local v17, "_arg4":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v18

    .line 402
    .local v18, "_arg5":J
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_1cc

    move v8, v10

    goto :goto_1cd

    :cond_1cc
    move v8, v9

    .line 403
    .local v8, "_arg6":Z
    :goto_1cd
    move-object v0, v13

    move-object/from16 v3, v16

    move/from16 v5, v17

    move-wide/from16 v6, v18

    invoke-virtual/range {v0 .. v8}, Lcom/android/internal/app/IPerfShielder$Stub;->beginScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;IJZ)Landroid/os/Bundle;

    move-result-object v0

    .line 404
    .local v0, "_result":Landroid/os/Bundle;
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 405
    if-eqz v0, :cond_1e4

    .line 406
    invoke-virtual {v11, v10}, Landroid/os/Parcel;->writeInt(I)V

    .line 407
    invoke-virtual {v0, v11, v10}, Landroid/os/Bundle;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_1e7

    .line 410
    :cond_1e4
    invoke-virtual {v11, v9}, Landroid/os/Parcel;->writeInt(I)V

    .line 412
    :goto_1e7
    return v10

    .line 359
    .end local v0    # "_result":Landroid/os/Bundle;
    .end local v1    # "_arg0":Landroid/os/statistics/E2EScenario;
    .end local v2    # "_arg1":Landroid/os/statistics/E2EScenarioSettings;
    .end local v4    # "_arg3":Landroid/os/statistics/E2EScenarioPayload;
    .end local v8    # "_arg6":Z
    .end local v16    # "_arg2":Ljava/lang/String;
    .end local v17    # "_arg4":I
    .end local v18    # "_arg5":J
    :pswitch_1e8
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 360
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/app/IPerfShielder$Stub;->getPerfEventSocketFd()Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    .line 361
    .local v0, "_result":Landroid/os/ParcelFileDescriptor;
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 362
    if-eqz v0, :cond_1fb

    .line 363
    invoke-virtual {v11, v10}, Landroid/os/Parcel;->writeInt(I)V

    .line 364
    invoke-virtual {v0, v11, v10}, Landroid/os/ParcelFileDescriptor;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_1fe

    .line 367
    :cond_1fb
    invoke-virtual {v11, v9}, Landroid/os/Parcel;->writeInt(I)V

    .line 369
    :goto_1fe
    return v10

    .line 347
    .end local v0    # "_result":Landroid/os/ParcelFileDescriptor;
    :pswitch_1ff
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 349
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 351
    .local v0, "_arg0":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 352
    .local v1, "_arg1":Ljava/lang/String;
    invoke-virtual {v13, v0, v1}, Lcom/android/internal/app/IPerfShielder$Stub;->removeCallingPkgHookRule(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    .line 353
    .local v2, "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 354
    invoke-virtual {v11, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 355
    return v10

    .line 333
    .end local v0    # "_arg0":Ljava/lang/String;
    .end local v1    # "_arg1":Ljava/lang/String;
    .end local v2    # "_result":Z
    :pswitch_215
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 335
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 337
    .restart local v0    # "_arg0":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 339
    .restart local v1    # "_arg1":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 340
    .local v2, "_arg2":Ljava/lang/String;
    invoke-virtual {v13, v0, v1, v2}, Lcom/android/internal/app/IPerfShielder$Stub;->addCallingPkgHookRule(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    .line 341
    .local v3, "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 342
    invoke-virtual {v11, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 343
    return v10

    .line 317
    .end local v0    # "_arg0":Ljava/lang/String;
    .end local v1    # "_arg1":Ljava/lang/String;
    .end local v2    # "_arg2":Ljava/lang/String;
    .end local v3    # "_result":Z
    :pswitch_22f
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 319
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v8

    .line 321
    .local v8, "_arg0":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v9

    .line 323
    .local v9, "_arg1":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v16

    .line 325
    .local v16, "_arg2":J
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v18

    .line 327
    .local v18, "_arg3":J
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v20

    .line 328
    .local v20, "_arg4":Ljava/lang/String;
    move-object v0, v13

    move v1, v8

    move-object v2, v9

    move-wide/from16 v3, v16

    move-wide/from16 v5, v18

    move-object/from16 v7, v20

    invoke-virtual/range {v0 .. v7}, Lcom/android/internal/app/IPerfShielder$Stub;->reportAnr(ILjava/lang/String;JJLjava/lang/String;)V

    .line 329
    return v10

    .line 309
    .end local v8    # "_arg0":I
    .end local v9    # "_arg1":Ljava/lang/String;
    .end local v16    # "_arg2":J
    .end local v18    # "_arg3":J
    .end local v20    # "_arg4":Ljava/lang/String;
    :pswitch_253
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 310
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/app/IPerfShielder$Stub;->getFreeMemory()J

    move-result-wide v0

    .line 311
    .local v0, "_result":J
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 312
    invoke-virtual {v11, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 313
    return v10

    .line 299
    .end local v0    # "_result":J
    :pswitch_261
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 301
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 302
    .local v0, "_arg0":Ljava/lang/String;
    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->deletePackageInfo(Ljava/lang/String;)Z

    move-result v1

    .line 303
    .local v1, "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 304
    invoke-virtual {v11, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 305
    return v10

    .line 284
    .end local v0    # "_arg0":Ljava/lang/String;
    .end local v1    # "_result":Z
    :pswitch_273
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 286
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_285

    .line 287
    sget-object v0, Landroid/content/pm/PackageInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/PackageInfo;

    .local v0, "_arg0":Landroid/content/pm/PackageInfo;
    goto :goto_286

    .line 290
    .end local v0    # "_arg0":Landroid/content/pm/PackageInfo;
    :cond_285
    nop

    .line 292
    .restart local v0    # "_arg0":Landroid/content/pm/PackageInfo;
    :goto_286
    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->insertPackageInfo(Landroid/content/pm/PackageInfo;)Z

    move-result v1

    .line 293
    .restart local v1    # "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 294
    invoke-virtual {v11, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 295
    return v10

    .line 272
    .end local v0    # "_arg0":Landroid/content/pm/PackageInfo;
    .end local v1    # "_result":Z
    :pswitch_291
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 274
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 276
    .local v0, "_arg0":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 277
    .local v1, "_arg1":Ljava/lang/String;
    invoke-virtual {v13, v0, v1}, Lcom/android/internal/app/IPerfShielder$Stub;->deleteRedirectRule(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    .line 278
    .local v2, "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 279
    invoke-virtual {v11, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 280
    return v10

    .line 251
    .end local v0    # "_arg0":Ljava/lang/String;
    .end local v1    # "_arg1":Ljava/lang/String;
    .end local v2    # "_result":Z
    :pswitch_2a7
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 253
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 255
    .local v1, "_arg0":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 257
    .local v2, "_arg1":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    .line 259
    .local v3, "_arg2":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_2c5

    .line 260
    sget-object v0, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    .local v0, "_arg3":Landroid/os/Bundle;
    goto :goto_2c6

    .line 263
    .end local v0    # "_arg3":Landroid/os/Bundle;
    :cond_2c5
    nop

    .line 265
    .restart local v0    # "_arg3":Landroid/os/Bundle;
    :goto_2c6
    invoke-virtual {v13, v1, v2, v3, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->insertRedirectRule(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Z

    move-result v4

    .line 266
    .local v4, "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 267
    invoke-virtual {v11, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 268
    return v10

    .line 243
    .end local v0    # "_arg3":Landroid/os/Bundle;
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v2    # "_arg1":Ljava/lang/String;
    .end local v3    # "_arg2":Ljava/lang/String;
    .end local v4    # "_result":Z
    :pswitch_2d1
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 244
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/app/IPerfShielder$Stub;->getMemoryTrimLevel()I

    move-result v0

    .line 245
    .local v0, "_result":I
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 246
    invoke-virtual {v11, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 247
    return v10

    .line 236
    .end local v0    # "_result":I
    :pswitch_2df
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 237
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/app/IPerfShielder$Stub;->clearTimeConsumingIntent()V

    .line 238
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 239
    return v10

    .line 227
    :pswitch_2e9
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 229
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object v0

    .line 230
    .local v0, "_arg0":[Ljava/lang/String;
    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->removeTimeConsumingIntent([Ljava/lang/String;)V

    .line 231
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 232
    return v10

    .line 218
    .end local v0    # "_arg0":[Ljava/lang/String;
    :pswitch_2f7
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 220
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object v0

    .line 221
    .restart local v0    # "_arg0":[Ljava/lang/String;
    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->addTimeConsumingIntent([Ljava/lang/String;)V

    .line 222
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 223
    return v10

    .line 210
    .end local v0    # "_arg0":[Ljava/lang/String;
    :pswitch_305
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 212
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_310

    move v9, v10

    nop

    :cond_310
    move v0, v9

    .line 213
    .local v0, "_arg0":Z
    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->setMiuiBroadcastDispatchEnable(Z)V

    .line 214
    return v10

    .line 202
    .end local v0    # "_arg0":Z
    :pswitch_315
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 204
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_320

    move v9, v10

    nop

    :cond_320
    move v0, v9

    .line 205
    .restart local v0    # "_arg0":Z
    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->setMiuiContentProviderControl(Z)V

    .line 206
    return v10

    .line 195
    .end local v0    # "_arg0":Z
    :pswitch_325
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 196
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/app/IPerfShielder$Stub;->closeCheckPriority()V

    .line 197
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 198
    return v10

    .line 180
    :pswitch_32f
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 182
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_341

    .line 183
    sget-object v0, Lcom/android/internal/app/MiuiServicePriority;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, v15}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/app/MiuiServicePriority;

    .local v0, "_arg0":Lcom/android/internal/app/MiuiServicePriority;
    goto :goto_342

    .line 186
    .end local v0    # "_arg0":Lcom/android/internal/app/MiuiServicePriority;
    :cond_341
    nop

    .line 189
    .restart local v0    # "_arg0":Lcom/android/internal/app/MiuiServicePriority;
    :goto_342
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_34a

    move v9, v10

    nop

    :cond_34a
    move v1, v9

    .line 190
    .local v1, "_arg1":Z
    invoke-virtual {v13, v0, v1}, Lcom/android/internal/app/IPerfShielder$Stub;->removeServicePriority(Lcom/android/internal/app/MiuiServicePriority;Z)V

    .line 191
    return v10

    .line 170
    .end local v0    # "_arg0":Lcom/android/internal/app/MiuiServicePriority;
    .end local v1    # "_arg1":Z
    :pswitch_34f
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 172
    sget-object v0, Lcom/android/internal/app/MiuiServicePriority;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v15, v0}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    .line 174
    .local v0, "_arg0":Ljava/util/List;, "Ljava/util/List<Lcom/android/internal/app/MiuiServicePriority;>;"
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    .line 175
    .local v1, "_arg1":J
    invoke-virtual {v13, v0, v1, v2}, Lcom/android/internal/app/IPerfShielder$Stub;->setServicePriorityWithNoProc(Ljava/util/List;J)V

    .line 176
    return v10

    .line 162
    .end local v0    # "_arg0":Ljava/util/List;, "Ljava/util/List<Lcom/android/internal/app/MiuiServicePriority;>;"
    .end local v1    # "_arg1":J
    :pswitch_360
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 164
    sget-object v0, Lcom/android/internal/app/MiuiServicePriority;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v15, v0}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    .line 165
    .restart local v0    # "_arg0":Ljava/util/List;, "Ljava/util/List<Lcom/android/internal/app/MiuiServicePriority;>;"
    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->setServicePriority(Ljava/util/List;)V

    .line 166
    return v10

    .line 152
    .end local v0    # "_arg0":Ljava/util/List;, "Ljava/util/List<Lcom/android/internal/app/MiuiServicePriority;>;"
    :pswitch_36d
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 154
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    .line 155
    .local v0, "_arg0":[I
    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->updateProcessPartialMemInfoByPids([I)Ljava/util/List;

    move-result-object v1

    .line 156
    .local v1, "_result":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 157
    invoke-virtual {v11, v1}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 158
    return v10

    .line 142
    .end local v0    # "_arg0":[I
    .end local v1    # "_result":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    :pswitch_37f
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 144
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    .line 145
    .restart local v0    # "_arg0":[I
    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->updateProcessFullMemInfoByPids([I)Ljava/util/List;

    move-result-object v1

    .line 146
    .restart local v1    # "_result":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 147
    invoke-virtual {v11, v1}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 148
    return v10

    .line 134
    .end local v0    # "_arg0":[I
    .end local v1    # "_result":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    :pswitch_391
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 135
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/app/IPerfShielder$Stub;->getAllRunningProcessMemInfos()Ljava/util/List;

    move-result-object v0

    .line 136
    .local v0, "_result":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 137
    invoke-virtual {v11, v0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 138
    return v10

    .line 119
    .end local v0    # "_result":Ljava/util/List;, "Ljava/util/List<Landroid/os/Bundle;>;"
    :pswitch_39f
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 121
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 123
    .local v0, "_arg0":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 125
    .local v1, "_arg1":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 127
    .local v2, "_arg2":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    .line 128
    .local v3, "_arg3":Ljava/lang/String;
    invoke-virtual {v13, v0, v1, v2, v3}, Lcom/android/internal/app/IPerfShielder$Stub;->setForkedProcessGroup(IIILjava/lang/String;)V

    .line 129
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 130
    return v10

    .line 109
    .end local v0    # "_arg0":I
    .end local v1    # "_arg1":I
    .end local v2    # "_arg2":I
    .end local v3    # "_arg3":Ljava/lang/String;
    :pswitch_3b9
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 111
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 112
    .restart local v0    # "_arg0":I
    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->getPackageNameByPid(I)Ljava/lang/String;

    move-result-object v1

    .line 113
    .local v1, "_result":Ljava/lang/String;
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 114
    invoke-virtual {v11, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 115
    return v10

    .line 99
    .end local v0    # "_arg0":I
    .end local v1    # "_result":Ljava/lang/String;
    :pswitch_3cb
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 101
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 103
    .restart local v0    # "_arg0":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 104
    .local v1, "_arg1":I
    invoke-virtual {v13, v0, v1}, Lcom/android/internal/app/IPerfShielder$Stub;->killUnusedApp(II)V

    .line 105
    return v10

    .line 91
    .end local v0    # "_arg0":I
    .end local v1    # "_arg1":I
    :pswitch_3da
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 93
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 94
    .restart local v0    # "_arg0":I
    invoke-virtual {v13, v0}, Lcom/android/internal/app/IPerfShielder$Stub;->setSchedFgPid(I)V

    .line 95
    return v10

    .line 73
    .end local v0    # "_arg0":I
    :pswitch_3e5
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 75
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v16

    .line 77
    .local v16, "_arg0":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v17

    .line 79
    .local v17, "_arg1":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v18

    .line 81
    .local v18, "_arg2":J
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v20

    .line 83
    .local v20, "_arg3":J
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_400

    move v7, v10

    goto :goto_401

    :cond_400
    move v7, v9

    .line 85
    .local v7, "_arg4":Z
    :goto_401
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_409

    move v8, v10

    goto :goto_40a

    :cond_409
    move v8, v9

    .line 86
    .local v8, "_arg5":Z
    :goto_40a
    move-object v0, v13

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    move-wide/from16 v3, v18

    move-wide/from16 v5, v20

    invoke-virtual/range {v0 .. v8}, Lcom/android/internal/app/IPerfShielder$Stub;->addActivityLaunchTime(Ljava/lang/String;Ljava/lang/String;JJZZ)V

    .line 87
    return v10

    .line 51
    .end local v7    # "_arg4":Z
    .end local v8    # "_arg5":Z
    .end local v16    # "_arg0":Ljava/lang/String;
    .end local v17    # "_arg1":Ljava/lang/String;
    .end local v18    # "_arg2":J
    .end local v20    # "_arg3":J
    :pswitch_417
    invoke-virtual {v15, v12}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 53
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v16

    .line 55
    .local v16, "_arg0":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v17

    .line 57
    .local v17, "_arg1":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v18

    .line 59
    .local v18, "_arg2":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v19

    .line 61
    .local v19, "_arg3":J
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v21

    .line 63
    .local v21, "_arg4":J
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v23

    .line 65
    .local v23, "_arg5":J
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v25

    .line 67
    .local v25, "_arg6":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v26

    .line 68
    .local v26, "_arg7":J
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

    .end local v12    # "descriptor":Ljava/lang/String;
    .local v14, "descriptor":Ljava/lang/String;
    invoke-virtual/range {v0 .. v12}, Lcom/android/internal/app/IPerfShielder$Stub;->reportPerceptibleJank(IILjava/lang/String;JJJIJ)V

    .line 69
    return v28

    .line 46
    .end local v14    # "descriptor":Ljava/lang/String;
    .end local v16    # "_arg0":I
    .end local v17    # "_arg1":I
    .end local v18    # "_arg2":Ljava/lang/String;
    .end local v19    # "_arg3":J
    .end local v21    # "_arg4":J
    .end local v23    # "_arg5":J
    .end local v25    # "_arg6":I
    .end local v26    # "_arg7":J
    .restart local v12    # "descriptor":Ljava/lang/String;
    :cond_453
    move/from16 v28, v10

    move-object v13, v11

    move-object v14, v12

    .end local v12    # "descriptor":Ljava/lang/String;
    .restart local v14    # "descriptor":Ljava/lang/String;
    invoke-virtual {v13, v14}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 47
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
