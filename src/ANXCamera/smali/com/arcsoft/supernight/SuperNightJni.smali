.class public Lcom/arcsoft/supernight/SuperNightJni;
.super Ljava/lang/Object;
.source "SuperNightJni.java"


# instance fields
.field private a:Lcom/arcsoft/supernight/SuperNightJni;

.field private b:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "arcsoft_supernight_jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    const-string v0, "arcsoft_sn_mtk_apu"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    const-string v0, "arcsoft_super_night_raw_mtk"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    const-string v0, "arcsoft_super_night_raw_mpbase"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/arcsoft/supernight/SuperNightJni;->b:J

    return-void
.end method

.method private native nativeAddOneInputInfo(JLcom/arcsoft/supernight/SuperNightProcess$RawInfo;Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;)I
.end method

.method private native nativeInit(IIII)J
.end method

.method private native nativePostProcess(J)I
.end method

.method private native nativePreProcess(J)I
.end method

.method private native nativeProcess(JLcom/arcsoft/supernight/SuperNightProcess$FaceInfo;Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;ILandroid/graphics/Rect;)I
.end method

.method private native nativeProcessEx(JLcom/arcsoft/supernight/SuperNightProcess$FaceInfo;[BIIIIILandroid/graphics/Rect;)I
.end method

.method private native nativeUninit(J)I
.end method


# virtual methods
.method public declared-synchronized AddOneInputInfo(Lcom/arcsoft/supernight/SuperNightProcess$RawInfo;Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;)I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/arcsoft/supernight/SuperNightJni;->b:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/arcsoft/supernight/SuperNightJni;->nativeAddOneInputInfo(JLcom/arcsoft/supernight/SuperNightProcess$RawInfo;Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;)I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public init(IIII)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/arcsoft/supernight/SuperNightJni;->nativeInit(IIII)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/arcsoft/supernight/SuperNightJni;->b:J

    return-void
.end method

.method public postProcess()I
    .locals 2

    iget-wide v0, p0, Lcom/arcsoft/supernight/SuperNightJni;->b:J

    invoke-direct {p0, v0, v1}, Lcom/arcsoft/supernight/SuperNightJni;->nativePostProcess(J)I

    move-result v0

    return v0
.end method

.method public preProcess()I
    .locals 2

    iget-wide v0, p0, Lcom/arcsoft/supernight/SuperNightJni;->b:J

    invoke-direct {p0, v0, v1}, Lcom/arcsoft/supernight/SuperNightJni;->nativePreProcess(J)I

    move-result v0

    return v0
.end method

.method public process(Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;ILandroid/graphics/Rect;)I
    .locals 7

    iget-wide v1, p0, Lcom/arcsoft/supernight/SuperNightJni;->b:J

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/arcsoft/supernight/SuperNightJni;->nativeProcess(JLcom/arcsoft/supernight/SuperNightProcess$FaceInfo;Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;ILandroid/graphics/Rect;)I

    move-result p1

    return p1
.end method

.method public processEx(Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;[BIIIIILandroid/graphics/Rect;)I
    .locals 11

    move-object v0, p0

    iget-wide v1, v0, Lcom/arcsoft/supernight/SuperNightJni;->b:J

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move-object/from16 v10, p8

    invoke-direct/range {v0 .. v10}, Lcom/arcsoft/supernight/SuperNightJni;->nativeProcessEx(JLcom/arcsoft/supernight/SuperNightProcess$FaceInfo;[BIIIIILandroid/graphics/Rect;)I

    move-result v0

    return v0
.end method

.method public unInit()I
    .locals 2

    iget-wide v0, p0, Lcom/arcsoft/supernight/SuperNightJni;->b:J

    invoke-direct {p0, v0, v1}, Lcom/arcsoft/supernight/SuperNightJni;->nativeUninit(J)I

    move-result v0

    return v0
.end method
