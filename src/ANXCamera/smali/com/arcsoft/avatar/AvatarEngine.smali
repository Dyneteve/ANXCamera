.class public Lcom/arcsoft/avatar/AvatarEngine;
.super Ljava/lang/Object;
.source "AvatarEngine.java"

# interfaces
.implements Lcom/arcsoft/avatar/AvatarConfig;


# static fields
.field private static final a:Ljava/lang/String; = "AvatarEngine"


# instance fields
.field private b:I

.field private c:I

.field private d:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap<",
            "Ljava/lang/String;",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
            ">;"
        }
    .end annotation
.end field

.field private e:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "Arcsoft_Avatar_Jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    const-string v0, "AvatarEngine"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->b:I

    iput v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->c:I

    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->d:Ljava/util/TreeMap;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    return-void
.end method

.method static synthetic a(Lcom/arcsoft/avatar/AvatarEngine;)Ljava/util/TreeMap;
    .locals 0

    iget-object p0, p0, Lcom/arcsoft/avatar/AvatarEngine;->d:Ljava/util/TreeMap;

    return-object p0
.end method

.method static synthetic b(Lcom/arcsoft/avatar/AvatarEngine;)I
    .locals 0

    iget p0, p0, Lcom/arcsoft/avatar/AvatarEngine;->b:I

    return p0
.end method

.method private native nativeAvatarProcess(JIII[B[BIZI)I
.end method

.method private native nativeAvatarProcessEx(JIII[Ljava/nio/ByteBuffer;[BIZI)I
.end method

.method private native nativeAvatarProcessEx2(JLcom/arcsoft/avatar/util/ASVLOFFSCREEN;[BIZI)I
.end method

.method private native nativeAvatarProfile(JLjava/lang/String;III[BIZLcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileInfo;Lcom/arcsoft/avatar/AvatarConfig$UpdateProgressCallback;)I
.end method

.method private native nativeAvatarRender(JIIIIZ[I)I
.end method

.method private native nativeCreate()J
.end method

.method private native nativeDestroy(J)I
.end method

.method private native nativeGetConfig(JIILcom/arcsoft/avatar/AvatarConfig$GetConfigCallback;)I
.end method

.method private native nativeGetConfigValue(JLcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;)I
.end method

.method private native nativeGetSupportConfigType(JILcom/arcsoft/avatar/AvatarConfig$GetSupportConfigTypeCallback;)I
.end method

.method private native nativeInit(JLjava/lang/String;Ljava/lang/String;)I
.end method

.method private native nativeIsSupportSwitchGender(J)Z
.end method

.method private native nativeLoadColorValue(Ljava/lang/String;)I
.end method

.method private native nativeLoadConfig(JLjava/lang/String;)I
.end method

.method private native nativeOutlineCreateEngine(JLjava/lang/String;)I
.end method

.method private native nativeOutlineDestroyEngine(J)I
.end method

.method private native nativeOutlineProcess(J[BIIIILcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;)I
.end method

.method private native nativeOutlineProcessEx(JLcom/arcsoft/avatar/util/ASVLOFFSCREEN;ILcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;)I
.end method

.method private native nativeProcessOutlineExpression(J[BIIIIZILcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;)I
.end method

.method private native nativeProcessWithInfo(J[BIIIIZILcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;)I
.end method

.method private native nativeProcessWithInfoEx(JLcom/arcsoft/avatar/util/ASVLOFFSCREEN;IZILcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;Z)I
.end method

.method private native nativeReleaseRender(J)I
.end method

.method private native nativeRenderBackgroundWithImageData(JLcom/arcsoft/avatar/util/ASVLOFFSCREEN;IZ[I)I
.end method

.method private native nativeRenderBackgroundWithTexture(JIIZ)I
.end method

.method private native nativeRenderThumb(JIIII[BIII[FF)I
.end method

.method private native nativeRenderWithBackground(JLcom/arcsoft/avatar/util/ASVLOFFSCREEN;IZIIIIZ[I[B)I
.end method

.method private native nativeSaveConfig(JLjava/lang/String;)I
.end method

.method private native nativeSetConfig(JLcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)I
.end method

.method private native nativeSetRenderScene(JZF)I
.end method

.method private native nativeSetTemplate(JLjava/lang/String;)I
.end method

.method private native nativeSwitchGender(JZ)I
.end method

.method private native nativeUnInit(J)I
.end method


# virtual methods
.method public declared-synchronized avatarProcess(III[B[BIZI)I
    .locals 13

    move-object v12, p0

    monitor-enter p0

    :try_start_0
    iget-wide v2, v12, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    move-object v1, v12

    move v4, p1

    move v5, p2

    move/from16 v6, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move/from16 v9, p6

    move/from16 v10, p7

    move/from16 v11, p8

    invoke-direct/range {v1 .. v11}, Lcom/arcsoft/avatar/AvatarEngine;->nativeAvatarProcess(JIII[B[BIZI)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized avatarProcessEx(III[Ljava/nio/ByteBuffer;[BIZI)I
    .locals 13

    move-object v12, p0

    monitor-enter p0

    :try_start_0
    iget-wide v2, v12, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    move-object v1, v12

    move v4, p1

    move v5, p2

    move/from16 v6, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move/from16 v9, p6

    move/from16 v10, p7

    move/from16 v11, p8

    invoke-direct/range {v1 .. v11}, Lcom/arcsoft/avatar/AvatarEngine;->nativeAvatarProcessEx(JIII[Ljava/nio/ByteBuffer;[BIZI)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized avatarProcessEx2(Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;[BIZI)I
    .locals 8

    monitor-enter p0

    :try_start_0
    iget-wide v1, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-direct/range {v0 .. v7}, Lcom/arcsoft/avatar/AvatarEngine;->nativeAvatarProcessEx2(JLcom/arcsoft/avatar/util/ASVLOFFSCREEN;[BIZI)I

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

.method public avatarProcessWithInfo([BIIIIZILcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;)I
    .locals 12

    const-string v0, "avatarProcessWithInfo"

    invoke-static {v0}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;)V

    move-object v0, p0

    iget-wide v2, v0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    move-object v1, v0

    move-object v4, p1

    move v5, p2

    move v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move/from16 v10, p7

    move-object/from16 v11, p8

    invoke-direct/range {v1 .. v11}, Lcom/arcsoft/avatar/AvatarEngine;->nativeProcessWithInfo(J[BIIIIZILcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;)I

    move-result v0

    const-string v1, "performance"

    const-string v2, "avatarProcessWithInfo"

    invoke-static {v1, v2}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method

.method public avatarProcessWithInfoEx(Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;IZILcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;Z)I
    .locals 9

    iget-wide v1, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move-object v7, p5

    move v8, p6

    invoke-direct/range {v0 .. v8}, Lcom/arcsoft/avatar/AvatarEngine;->nativeProcessWithInfoEx(JLcom/arcsoft/avatar/util/ASVLOFFSCREEN;IZILcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;Z)I

    move-result p1

    return p1
.end method

.method public declared-synchronized avatarProfile(Ljava/lang/String;III[BIZLcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileInfo;Lcom/arcsoft/avatar/AvatarConfig$UpdateProgressCallback;)I
    .locals 15

    move-object v14, p0

    monitor-enter p0

    :try_start_0
    iget-wide v2, v14, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    move-object v1, v14

    move-object/from16 v4, p1

    move/from16 v5, p2

    move/from16 v6, p3

    move/from16 v7, p4

    move-object/from16 v8, p5

    move/from16 v9, p6

    move/from16 v10, p7

    move-object/from16 v11, p8

    move-object/from16 v12, p9

    move-object/from16 v13, p10

    invoke-direct/range {v1 .. v13}, Lcom/arcsoft/avatar/AvatarEngine;->nativeAvatarProfile(JLjava/lang/String;III[BIZLcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileInfo;Lcom/arcsoft/avatar/AvatarConfig$UpdateProgressCallback;)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized avatarRender(IIIIZ[I)V
    .locals 9

    monitor-enter p0

    :try_start_0
    iget-wide v1, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move-object v8, p6

    invoke-direct/range {v0 .. v8}, Lcom/arcsoft/avatar/AvatarEngine;->nativeAvatarRender(JIIIIZ[I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public checkOutlineInfo(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;)I
    .locals 4

    const/4 v0, 0x1

    if-nez p1, :cond_0

    const-string p1, "CheckOutLine"

    const-string v1, "null"

    invoke-static {p1, v1}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_0
    const-string v1, "CheckOutLine"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "faceCount = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->getFaceCount()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->getFaceCount()I

    move-result v1

    if-le v1, v0, :cond_1

    const/16 p1, 0xa

    return p1

    :cond_1
    invoke-virtual {p1}, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->shelterIsNull()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string p1, "CheckOutLine"

    const-string v1, "shelterFlags == null"

    invoke-static {p1, v1}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_2
    invoke-virtual {p1}, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->getFaceCount()I

    move-result v1

    if-gtz v1, :cond_3

    return v0

    :cond_3
    invoke-virtual {p1}, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->checkOutLineInfo()I

    move-result p1

    return p1
.end method

.method public declared-synchronized createOutlineEngine(Ljava/lang/String;)I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    invoke-direct {p0, v0, v1, p1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeOutlineCreateEngine(JLjava/lang/String;)I

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

.method public declared-synchronized destroy()V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "destroy"

    invoke-static {v0}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;)V

    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    invoke-direct {p0, v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeDestroy(J)I

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    const-string v0, "performance"

    const-string v1, "destroy"

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized destroyOutlineEngine()I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    invoke-direct {p0, v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeOutlineDestroyEngine(J)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getConfig(II)Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-wide v2, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    new-instance v6, Lcom/arcsoft/avatar/AvatarEngine$2;

    invoke-direct {v6, p0, v0, p1}, Lcom/arcsoft/avatar/AvatarEngine$2;-><init>(Lcom/arcsoft/avatar/AvatarEngine;Ljava/util/ArrayList;I)V

    move-object v1, p0

    move v4, p1

    move v5, p2

    invoke-direct/range {v1 .. v6}, Lcom/arcsoft/avatar/AvatarEngine;->nativeGetConfig(JIILcom/arcsoft/avatar/AvatarConfig$GetConfigCallback;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getConfigValue(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    invoke-direct {p0, v0, v1, p1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeGetConfigValue(JLcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;)I

    iget v0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceColorID:I

    iput v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->b:I

    iget p1, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configLipColorID:I

    iput p1, p0, Lcom/arcsoft/avatar/AvatarEngine;->c:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getSupportConfigType(I)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-wide v1, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    new-instance v3, Lcom/arcsoft/avatar/AvatarEngine$1;

    invoke-direct {v3, p0, v0}, Lcom/arcsoft/avatar/AvatarEngine$1;-><init>(Lcom/arcsoft/avatar/AvatarEngine;Ljava/util/ArrayList;)V

    invoke-direct {p0, v1, v2, p1, v3}, Lcom/arcsoft/avatar/AvatarEngine;->nativeGetSupportConfigType(JILcom/arcsoft/avatar/AvatarConfig$GetSupportConfigTypeCallback;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized init(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "init"

    invoke-static {v0}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/arcsoft/avatar/AvatarEngine;->nativeCreate()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/arcsoft/avatar/AvatarEngine;->nativeInit(JLjava/lang/String;Ljava/lang/String;)I

    move-result p1

    const-string p2, "AvatarEngine"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "init res = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "performance"

    const-string p2, "init"

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized isSupportSwitchGender()Z
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    invoke-direct {p0, v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeIsSupportSwitchGender(J)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized loadColorValue(Ljava/lang/String;)I
    .locals 0

    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeLoadColorValue(Ljava/lang/String;)I

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

.method public declared-synchronized loadConfig(Ljava/lang/String;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "loadConfig"

    invoke-static {v0}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;)V

    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    invoke-direct {p0, v0, v1, p1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeLoadConfig(JLjava/lang/String;)I

    const-string p1, "performance"

    const-string v0, "loadConfig"

    invoke-static {p1, v0}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized outlineProcess([BIIII)I
    .locals 10

    monitor-enter p0

    :try_start_0
    new-instance v9, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;

    invoke-direct {v9}, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;-><init>()V

    const-string v0, "outlineProcess"

    invoke-static {v0}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;)V

    iget-wide v1, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move-object v8, v9

    invoke-direct/range {v0 .. v8}, Lcom/arcsoft/avatar/AvatarEngine;->nativeOutlineProcess(J[BIIIILcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;)I

    move-result p1

    const-string p2, "performance"

    const-string p3, "outlineProcess"

    invoke-static {p2, p3}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "CheckOutLine"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "nativeOutlineProcess = "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v9}, Lcom/arcsoft/avatar/AvatarEngine;->checkOutlineInfo(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;)I

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

.method public declared-synchronized outlineProcessEx(Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;I)I
    .locals 7

    monitor-enter p0

    :try_start_0
    new-instance v6, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;

    invoke-direct {v6}, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;-><init>()V

    const-string v0, "outlineProcessEx"

    invoke-static {v0}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;)V

    iget-wide v1, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    move-object v5, v6

    invoke-direct/range {v0 .. v5}, Lcom/arcsoft/avatar/AvatarEngine;->nativeOutlineProcessEx(JLcom/arcsoft/avatar/util/ASVLOFFSCREEN;ILcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;)I

    move-result p1

    const-string p2, "performance"

    const-string v0, "outlineProcessEx"

    invoke-static {p2, v0}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "CheckOutLine"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "nativeOutlineProcess = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v6}, Lcom/arcsoft/avatar/AvatarEngine;->checkOutlineInfo(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;)I

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

.method public declared-synchronized processOutlineExpression([BIIIIZILcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;)I
    .locals 13

    move-object v12, p0

    monitor-enter p0

    :try_start_0
    iget-wide v2, v12, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    move-object v1, v12

    move-object v4, p1

    move v5, p2

    move/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move/from16 v10, p7

    move-object/from16 v11, p8

    invoke-direct/range {v1 .. v11}, Lcom/arcsoft/avatar/AvatarEngine;->nativeProcessOutlineExpression(J[BIIIIZILcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized releaseRender()V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "releaseRender"

    invoke-static {v0}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;)V

    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    invoke-direct {p0, v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeReleaseRender(J)I

    const-string v0, "performance"

    const-string v1, "releaseRender"

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public renderBackgroundWithImageData(Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;IZ[I)I
    .locals 7

    iget-wide v1, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/arcsoft/avatar/AvatarEngine;->nativeRenderBackgroundWithImageData(JLcom/arcsoft/avatar/util/ASVLOFFSCREEN;IZ[I)I

    move-result p1

    return p1
.end method

.method public renderBackgroundWithTexture(IIZ)I
    .locals 6

    iget-wide v1, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/arcsoft/avatar/AvatarEngine;->nativeRenderBackgroundWithTexture(JIIZ)I

    move-result p1

    return p1
.end method

.method public declared-synchronized renderThumb(IIII[BIII[FF)I
    .locals 15

    move-object v14, p0

    monitor-enter p0

    :try_start_0
    const-string v0, "renderThumb"

    invoke-static {v0}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;)V

    iget-wide v2, v14, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    move-object v1, v14

    move/from16 v4, p1

    move/from16 v5, p2

    move/from16 v6, p3

    move/from16 v7, p4

    move-object/from16 v8, p5

    move/from16 v9, p6

    move/from16 v10, p7

    move/from16 v11, p8

    move-object/from16 v12, p9

    move/from16 v13, p10

    invoke-direct/range {v1 .. v13}, Lcom/arcsoft/avatar/AvatarEngine;->nativeRenderThumb(JIIII[BIII[FF)I

    move-result v0

    const-string v1, "performance"

    const-string v2, "renderThumb"

    invoke-static {v1, v2}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public renderWithBackground(Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;IZIIIIZ[I[B)I
    .locals 13

    move-object v0, p0

    iget-wide v1, v0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    move-object v3, p1

    move v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move-object/from16 v11, p9

    move-object/from16 v12, p10

    invoke-direct/range {v0 .. v12}, Lcom/arcsoft/avatar/AvatarEngine;->nativeRenderWithBackground(JLcom/arcsoft/avatar/util/ASVLOFFSCREEN;IZIIIIZ[I[B)I

    move-result v0

    return v0
.end method

.method public declared-synchronized saveConfig(Ljava/lang/String;)I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    invoke-direct {p0, v0, v1, p1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeSaveConfig(JLjava/lang/String;)I

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

.method public declared-synchronized setConfig(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)I
    .locals 5

    monitor-enter p0

    :try_start_0
    iget v0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_3

    iget v0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configID:I

    iput v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->b:I

    new-instance v0, Ljava/lang/Integer;

    iget v1, p0, Lcom/arcsoft/avatar/AvatarEngine;->b:I

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/arcsoft/avatar/AvatarEngine;->d:Ljava/util/TreeMap;

    invoke-virtual {v1}, Ljava/util/TreeMap;->size()I

    move-result v1

    if-lez v1, :cond_2

    iget-object v1, p0, Lcom/arcsoft/avatar/AvatarEngine;->d:Ljava/util/TreeMap;

    invoke-virtual {v1, v0}, Ljava/util/TreeMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/arcsoft/avatar/AvatarEngine;->d:Ljava/util/TreeMap;

    invoke-virtual {v2}, Ljava/util/TreeMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget v3, v3, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configID:I

    iget v4, p0, Lcom/arcsoft/avatar/AvatarEngine;->c:I

    if-ne v3, v4, :cond_0

    const/4 v1, 0x1

    goto :goto_1

    :cond_0
    goto :goto_0

    :cond_1
    :goto_1
    if-eqz v1, :cond_2

    iget-wide v1, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    iget-object v3, p0, Lcom/arcsoft/avatar/AvatarEngine;->d:Ljava/util/TreeMap;

    invoke-virtual {v3, v0}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    invoke-direct {p0, v1, v2, v0}, Lcom/arcsoft/avatar/AvatarEngine;->nativeSetConfig(JLcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)I

    :cond_2
    goto :goto_2

    :cond_3
    iget v0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_4

    iget v0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configID:I

    iput v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->c:I

    :cond_4
    :goto_2
    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    invoke-direct {p0, v0, v1, p1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeSetConfig(JLcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)I

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

.method public declared-synchronized setRenderScene(ZF)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/arcsoft/avatar/AvatarEngine;->nativeSetRenderScene(JZF)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setTemplatePath(Ljava/lang/String;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "setTemplatePath"

    invoke-static {v0}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;)V

    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    invoke-direct {p0, v0, v1, p1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeSetTemplate(JLjava/lang/String;)I

    const-string p1, "performance"

    const-string v0, "setTemplatePath"

    invoke-static {p1, v0}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized switchGender(Z)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    invoke-direct {p0, v0, v1, p1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeSwitchGender(JZ)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized unInit()V
    .locals 4

    monitor-enter p0

    :try_start_0
    const-string/jumbo v0, "unInit"

    invoke-static {v0}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;)V

    iget-wide v0, p0, Lcom/arcsoft/avatar/AvatarEngine;->e:J

    invoke-direct {p0, v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->nativeUnInit(J)I

    move-result v0

    const-string v1, "performance"

    const-string/jumbo v2, "unInit"

    invoke-static {v1, v2}, Lcom/arcsoft/avatar/util/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "AvatarEngine"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "uninit res = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
