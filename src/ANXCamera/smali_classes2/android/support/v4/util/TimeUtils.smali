.class public Landroid/support/v4/util/TimeUtils;
.super Ljava/lang/Object;
.source "TimeUtils.java"


# static fields
.field public static final HUNDRED_DAY_FIELD_LEN:I = 0x13

.field private static final SECONDS_PER_DAY:I = 0x15180

.field private static final SECONDS_PER_HOUR:I = 0xe10

.field private static final SECONDS_PER_MINUTE:I = 0x3c

.field private static sFormatStr:[C

.field private static final sFormatSync:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroid/support/v4/util/TimeUtils;->sFormatSync:Ljava/lang/Object;

    const/16 v0, 0x18

    new-array v0, v0, [C

    sput-object v0, Landroid/support/v4/util/TimeUtils;->sFormatStr:[C

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static accumField(IIZI)I
    .registers 6

    const/4 v0, 0x3

    const/16 v1, 0x63

    if-gt p0, v1, :cond_20

    if-eqz p2, :cond_a

    if-lt p3, v0, :cond_a

    goto :goto_20

    :cond_a
    const/16 v0, 0x9

    const/4 v1, 0x2

    if-gt p0, v0, :cond_1e

    if-eqz p2, :cond_14

    if-lt p3, v1, :cond_14

    goto :goto_1e

    :cond_14
    if-nez p2, :cond_1b

    if-lez p0, :cond_19

    goto :goto_1b

    :cond_19
    const/4 v0, 0x0

    return v0

    :cond_1b
    :goto_1b
    const/4 v0, 0x1

    add-int/2addr v0, p1

    return v0

    :cond_1e
    :goto_1e
    add-int/2addr v1, p1

    return v1

    :cond_20
    :goto_20
    add-int/2addr v0, p1

    return v0
.end method

.method public static formatDuration(JJLjava/io/PrintWriter;)V
    .registers 8

    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-nez v0, :cond_c

    const-string v0, "--"

    invoke-virtual {p4, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    return-void

    :cond_c
    sub-long v0, p0, p2

    const/4 v2, 0x0

    invoke-static {v0, v1, p4, v2}, Landroid/support/v4/util/TimeUtils;->formatDuration(JLjava/io/PrintWriter;I)V

    return-void
.end method

.method public static formatDuration(JLjava/io/PrintWriter;)V
    .registers 4

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Landroid/support/v4/util/TimeUtils;->formatDuration(JLjava/io/PrintWriter;I)V

    return-void
.end method

.method public static formatDuration(JLjava/io/PrintWriter;I)V
    .registers 9

    sget-object v0, Landroid/support/v4/util/TimeUtils;->sFormatSync:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-static {p0, p1, p3}, Landroid/support/v4/util/TimeUtils;->formatDurationLocked(JI)I

    move-result v1

    new-instance v2, Ljava/lang/String;

    sget-object v3, Landroid/support/v4/util/TimeUtils;->sFormatStr:[C

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, v1}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    monitor-exit v0

    return-void

    :catchall_14
    move-exception v1

    monitor-exit v0
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v1
.end method

.method public static formatDuration(JLjava/lang/StringBuilder;)V
    .registers 7

    sget-object v0, Landroid/support/v4/util/TimeUtils;->sFormatSync:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_4
    invoke-static {p0, p1, v1}, Landroid/support/v4/util/TimeUtils;->formatDurationLocked(JI)I

    move-result v2

    sget-object v3, Landroid/support/v4/util/TimeUtils;->sFormatStr:[C

    invoke-virtual {p2, v3, v1, v2}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    monitor-exit v0

    return-void

    :catchall_f
    move-exception v1

    monitor-exit v0
    :try_end_11
    .catchall {:try_start_4 .. :try_end_11} :catchall_f

    throw v1
.end method

.method private static formatDurationLocked(JI)I
    .registers 30

    move-wide/from16 v0, p0

    move/from16 v2, p2

    sget-object v3, Landroid/support/v4/util/TimeUtils;->sFormatStr:[C

    array-length v3, v3

    if-ge v3, v2, :cond_d

    new-array v3, v2, [C

    sput-object v3, Landroid/support/v4/util/TimeUtils;->sFormatStr:[C

    :cond_d
    sget-object v3, Landroid/support/v4/util/TimeUtils;->sFormatStr:[C

    const-wide/16 v4, 0x0

    cmp-long v6, v0, v4

    const/16 v7, 0x20

    if-nez v6, :cond_26

    const/4 v4, 0x0

    add-int/lit8 v2, v2, -0x1

    :goto_1a
    if-ge v4, v2, :cond_1f

    aput-char v7, v3, v4

    goto :goto_1a

    :cond_1f
    const/16 v5, 0x30

    aput-char v5, v3, v4

    add-int/lit8 v5, v4, 0x1

    return v5

    :cond_26
    cmp-long v4, v0, v4

    if-lez v4, :cond_2e

    const/16 v4, 0x2b

    :goto_2c
    move v10, v4

    goto :goto_32

    :cond_2e
    const/16 v4, 0x2d

    neg-long v0, v0

    goto :goto_2c

    :goto_32
    const-wide/16 v4, 0x3e8

    rem-long v8, v0, v4

    long-to-int v11, v8

    div-long v4, v0, v4

    long-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-int v4, v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    const v9, 0x15180

    if-le v4, v9, :cond_4b

    div-int v5, v4, v9

    mul-int/2addr v9, v5

    sub-int/2addr v4, v9

    :cond_4b
    move v12, v5

    const/16 v5, 0xe10

    if-le v4, v5, :cond_57

    div-int/lit16 v5, v4, 0xe10

    mul-int/lit16 v6, v5, 0xe10

    sub-int/2addr v4, v6

    move v13, v5

    goto :goto_58

    :cond_57
    move v13, v6

    :goto_58
    const/16 v5, 0x3c

    if-le v4, v5, :cond_64

    div-int/lit8 v5, v4, 0x3c

    mul-int/lit8 v6, v5, 0x3c

    sub-int/2addr v4, v6

    move v15, v4

    move v14, v5

    goto :goto_66

    :cond_64
    move v15, v4

    move v14, v8

    :goto_66
    const/4 v4, 0x0

    const/16 v16, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x0

    const/4 v6, 0x1

    if-eqz v2, :cond_a4

    invoke-static {v12, v6, v8, v8}, Landroid/support/v4/util/TimeUtils;->accumField(IIZI)I

    move-result v5

    if-lez v5, :cond_76

    move v8, v6

    nop

    :cond_76
    invoke-static {v13, v6, v8, v9}, Landroid/support/v4/util/TimeUtils;->accumField(IIZI)I

    move-result v8

    add-int/2addr v5, v8

    if-lez v5, :cond_7f

    move v8, v6

    goto :goto_80

    :cond_7f
    const/4 v8, 0x0

    :goto_80
    invoke-static {v14, v6, v8, v9}, Landroid/support/v4/util/TimeUtils;->accumField(IIZI)I

    move-result v8

    add-int/2addr v5, v8

    if-lez v5, :cond_89

    move v8, v6

    goto :goto_8a

    :cond_89
    const/4 v8, 0x0

    :goto_8a
    invoke-static {v15, v6, v8, v9}, Landroid/support/v4/util/TimeUtils;->accumField(IIZI)I

    move-result v8

    add-int/2addr v5, v8

    if-lez v5, :cond_94

    move/from16 v8, v16

    goto :goto_95

    :cond_94
    const/4 v8, 0x0

    :goto_95
    invoke-static {v11, v9, v6, v8}, Landroid/support/v4/util/TimeUtils;->accumField(IIZI)I

    move-result v8

    add-int/2addr v8, v6

    add-int/2addr v5, v8

    :goto_9b
    if-ge v5, v2, :cond_a4

    aput-char v7, v3, v4

    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v5, v5, 0x1

    goto :goto_9b

    :cond_a4
    aput-char v10, v3, v4

    add-int/lit8 v18, v4, 0x1

    move/from16 v8, v18

    if-eqz v2, :cond_ae

    move v4, v6

    goto :goto_af

    :cond_ae
    const/4 v4, 0x0

    :goto_af
    move/from16 v19, v4

    const/16 v7, 0x64

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object v4, v3

    move v5, v12

    move/from16 v22, v6

    move v6, v7

    move/from16 v7, v18

    move/from16 v23, v8

    const/16 v17, 0x0

    move/from16 v8, v20

    move/from16 v20, v9

    move/from16 v9, v21

    invoke-static/range {v4 .. v9}, Landroid/support/v4/util/TimeUtils;->printField([CICIZI)I

    move-result v9

    const/16 v6, 0x68

    move/from16 v8, v23

    if-eq v9, v8, :cond_d5

    move/from16 v18, v22

    goto :goto_d7

    :cond_d5
    move/from16 v18, v17

    :goto_d7
    if-eqz v19, :cond_dc

    move/from16 v21, v20

    goto :goto_de

    :cond_dc
    move/from16 v21, v17

    :goto_de
    move-object v4, v3

    move v5, v13

    move v7, v9

    move/from16 v24, v8

    move/from16 v8, v18

    move/from16 v18, v9

    move/from16 v9, v21

    invoke-static/range {v4 .. v9}, Landroid/support/v4/util/TimeUtils;->printField([CICIZI)I

    move-result v9

    const/16 v6, 0x6d

    move/from16 v8, v24

    if-eq v9, v8, :cond_f6

    move/from16 v18, v22

    goto :goto_f8

    :cond_f6
    move/from16 v18, v17

    :goto_f8
    if-eqz v19, :cond_fd

    move/from16 v21, v20

    goto :goto_ff

    :cond_fd
    move/from16 v21, v17

    :goto_ff
    move-object v4, v3

    move v5, v14

    move v7, v9

    move/from16 v25, v8

    move/from16 v8, v18

    move/from16 v18, v9

    move/from16 v9, v21

    invoke-static/range {v4 .. v9}, Landroid/support/v4/util/TimeUtils;->printField([CICIZI)I

    move-result v9

    const/16 v6, 0x73

    move/from16 v8, v25

    if-eq v9, v8, :cond_115

    goto :goto_117

    :cond_115
    move/from16 v22, v17

    :goto_117
    if-eqz v19, :cond_11a

    goto :goto_11c

    :cond_11a
    move/from16 v20, v17

    :goto_11c
    move-object v4, v3

    move v5, v15

    move v7, v9

    move/from16 v26, v8

    move/from16 v8, v22

    move/from16 v18, v9

    move/from16 v9, v20

    invoke-static/range {v4 .. v9}, Landroid/support/v4/util/TimeUtils;->printField([CICIZI)I

    move-result v9

    const/16 v6, 0x6d

    const/4 v8, 0x1

    if-eqz v19, :cond_135

    move/from16 v7, v26

    if-eq v9, v7, :cond_137

    goto :goto_139

    :cond_135
    move/from16 v7, v26

    :cond_137
    move/from16 v16, v17

    :goto_139
    move-object v4, v3

    move v5, v11

    move/from16 v17, v7

    move v7, v9

    move/from16 v18, v9

    move/from16 v9, v16

    invoke-static/range {v4 .. v9}, Landroid/support/v4/util/TimeUtils;->printField([CICIZI)I

    move-result v4

    const/16 v5, 0x73

    aput-char v5, v3, v4

    add-int/lit8 v5, v4, 0x1

    return v5
.end method

.method private static printField([CICIZI)I
    .registers 9

    if-nez p4, :cond_4

    if-lez p1, :cond_3c

    :cond_4
    move v0, p3

    if-eqz p4, :cond_a

    const/4 v1, 0x3

    if-ge p5, v1, :cond_e

    :cond_a
    const/16 v1, 0x63

    if-le p1, v1, :cond_1a

    :cond_e
    div-int/lit8 v1, p1, 0x64

    add-int/lit8 v2, v1, 0x30

    int-to-char v2, v2

    aput-char v2, p0, p3

    add-int/lit8 p3, p3, 0x1

    mul-int/lit8 v2, v1, 0x64

    sub-int/2addr p1, v2

    :cond_1a
    if-eqz p4, :cond_1f

    const/4 v1, 0x2

    if-ge p5, v1, :cond_25

    :cond_1f
    const/16 v1, 0x9

    if-gt p1, v1, :cond_25

    if-eq v0, p3, :cond_31

    :cond_25
    div-int/lit8 v1, p1, 0xa

    add-int/lit8 v2, v1, 0x30

    int-to-char v2, v2

    aput-char v2, p0, p3

    add-int/lit8 p3, p3, 0x1

    mul-int/lit8 v2, v1, 0xa

    sub-int/2addr p1, v2

    :cond_31
    add-int/lit8 v1, p1, 0x30

    int-to-char v1, v1

    aput-char v1, p0, p3

    add-int/lit8 p3, p3, 0x1

    aput-char p2, p0, p3

    add-int/lit8 p3, p3, 0x1

    :cond_3c
    return p3
.end method
