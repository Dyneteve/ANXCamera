.class public Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;
.super Ljava/lang/Object;
.source "AvatarConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/arcsoft/avatar/AvatarConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ASAvatarProcessInfo"
.end annotation


# static fields
.field private static final F_THRESHOLD:F = 0.5f

.field private static final Max_Express_Num:I = 0x45

.field private static final Max_Outline_Num:I = 0x9a

.field private static final OUTLINE_THRESHOLD_VALUE:F = 0.8f


# instance fields
.field private expWeights:[F

.field private face:Lcom/arcsoft/avatar/AvatarConfig$ASRect;

.field private faceCount:I

.field private faceOrientations:[F

.field private isMirror:Z

.field private orientation:I

.field private orientationLeftEyes:[F

.field private orientationRightEyes:[F

.field private orientations:[F

.field private outlines:[Lcom/arcsoft/avatar/AvatarConfig$ASPointF;

.field private processHeight:I

.field private processWidth:I

.field private result:I

.field private shelterFlags:[F

.field private zoomInScale:F


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x9a

    new-array v0, v0, [Lcom/arcsoft/avatar/AvatarConfig$ASPointF;

    iput-object v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->outlines:[Lcom/arcsoft/avatar/AvatarConfig$ASPointF;

    return-void
.end method


# virtual methods
.method public checkFaceBlocking()Z
    .locals 13

    nop

    nop

    nop

    nop

    const/4 v0, 0x0

    const/4 v1, 0x0

    move v2, v0

    move v3, v1

    move v4, v3

    move v5, v4

    move v6, v5

    move v7, v6

    move v8, v7

    move v9, v8

    move v10, v9

    :goto_0
    iget-object v11, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->shelterFlags:[F

    array-length v11, v11

    if-ge v2, v11, :cond_8

    if-ltz v2, :cond_0

    const/16 v11, 0x12

    if-gt v2, v11, :cond_0

    iget-object v11, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->shelterFlags:[F

    aget v11, v11, v2

    add-float/2addr v3, v11

    goto :goto_1

    :cond_0
    const/16 v11, 0x13

    if-lt v2, v11, :cond_1

    const/16 v11, 0x24

    if-gt v2, v11, :cond_1

    iget-object v11, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->shelterFlags:[F

    aget v11, v11, v2

    add-float/2addr v4, v11

    goto :goto_1

    :cond_1
    const/16 v11, 0x25

    if-lt v2, v11, :cond_2

    const/16 v11, 0x2e

    if-gt v2, v11, :cond_2

    iget-object v11, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->shelterFlags:[F

    aget v11, v11, v2

    add-float/2addr v5, v11

    goto :goto_1

    :cond_2
    const/16 v11, 0x2f

    if-lt v2, v11, :cond_3

    const/16 v11, 0x38

    if-gt v2, v11, :cond_3

    iget-object v11, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->shelterFlags:[F

    aget v11, v11, v2

    add-float/2addr v6, v11

    goto :goto_1

    :cond_3
    const/16 v11, 0x39

    if-lt v2, v11, :cond_4

    const/16 v11, 0x44

    if-gt v2, v11, :cond_4

    iget-object v11, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->shelterFlags:[F

    aget v11, v11, v2

    add-float/2addr v7, v11

    goto :goto_1

    :cond_4
    const/16 v11, 0x45

    if-lt v2, v11, :cond_5

    const/16 v11, 0x50

    if-gt v2, v11, :cond_5

    iget-object v11, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->shelterFlags:[F

    aget v11, v11, v2

    add-float/2addr v8, v11

    goto :goto_1

    :cond_5
    const/16 v11, 0x51

    if-lt v2, v11, :cond_6

    const/16 v11, 0x5c

    if-gt v2, v11, :cond_6

    iget-object v11, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->shelterFlags:[F

    aget v11, v11, v2

    add-float/2addr v9, v11

    goto :goto_1

    :cond_6
    const/16 v11, 0x5d

    if-lt v2, v11, :cond_7

    const/16 v11, 0x70

    if-gt v2, v11, :cond_7

    iget-object v11, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->shelterFlags:[F

    aget v11, v11, v2

    add-float/2addr v10, v11

    :cond_7
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_8
    const/4 v2, 0x7

    :goto_2
    const/16 v11, 0x1d

    if-gt v2, v11, :cond_9

    iget-object v11, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->shelterFlags:[F

    aget v11, v11, v2

    add-float/2addr v1, v11

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_9
    const/high16 v2, 0x41980000    # 19.0f

    div-float/2addr v3, v2

    const/high16 v2, 0x41900000    # 18.0f

    div-float/2addr v4, v2

    const/high16 v2, 0x41200000    # 10.0f

    div-float/2addr v5, v2

    div-float/2addr v6, v2

    const/high16 v2, 0x41400000    # 12.0f

    div-float/2addr v7, v2

    div-float/2addr v8, v2

    div-float/2addr v9, v2

    const/high16 v2, 0x41a00000    # 20.0f

    div-float/2addr v10, v2

    const/high16 v2, 0x41b80000    # 23.0f

    div-float/2addr v1, v2

    const-string v2, "CheckOutLine"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "leftFace = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v2, v11}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "CheckOutLine"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "rightFace = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v2, v11}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "CheckOutLine"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "leftEyeBrow = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v2, v11}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "CheckOutLine"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "rightEyeBrow = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v2, v11}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "CheckOutLine"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "leftEye = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v2, v11}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "CheckOutLine"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "rightEye = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v2, v11}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "CheckOutLine"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "nose = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v2, v11}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "CheckOutLine"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "mouth = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v2, v11}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "CheckOutLine"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "chin = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v2, v11}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/high16 v2, 0x3f000000    # 0.5f

    cmpl-float v11, v3, v2

    const/4 v12, 0x1

    if-lez v11, :cond_a

    cmpl-float v11, v5, v2

    if-lez v11, :cond_a

    cmpl-float v11, v7, v2

    if-lez v11, :cond_a

    const-string v0, "CheckOutLine"

    const-string v1, "--- > left is blocking <---"

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v12

    :cond_a
    cmpl-float v11, v4, v2

    if-lez v11, :cond_b

    cmpl-float v11, v6, v2

    if-lez v11, :cond_b

    cmpl-float v2, v8, v2

    if-lez v2, :cond_b

    const-string v0, "CheckOutLine"

    const-string v1, "--- > right is blocking <---"

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v12

    :cond_b
    const v2, 0x3ecccccd    # 0.4f

    cmpl-float v5, v5, v2

    if-lez v5, :cond_c

    cmpl-float v5, v6, v2

    if-lez v5, :cond_c

    cmpl-float v5, v8, v2

    if-lez v5, :cond_c

    cmpl-float v5, v7, v2

    if-lez v5, :cond_c

    const-string v0, "CheckOutLine"

    const-string v1, "--- > top is blocking <---"

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v12

    :cond_c
    cmpl-float v1, v1, v2

    if-lez v1, :cond_d

    cmpl-float v5, v10, v2

    if-lez v5, :cond_d

    cmpl-float v5, v9, v2

    if-lez v5, :cond_d

    const-string v0, "CheckOutLine"

    const-string v1, "--- > central is blocking <---"

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v12

    :cond_d
    cmpl-float v3, v3, v2

    if-lez v3, :cond_e

    cmpl-float v2, v4, v2

    if-lez v2, :cond_e

    if-lez v1, :cond_e

    const-string v0, "CheckOutLine"

    const-string v1, "--- > left & right is blocking <---"

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v12

    :cond_e
    return v0
.end method

.method public checkOutLineInfo()I
    .locals 10

    iget-object v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->faceOrientations:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v2, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->faceOrientations:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    iget-object v3, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->faceOrientations:[F

    const/4 v4, 0x2

    aget v3, v3, v4

    const/high16 v5, -0x3d240000    # -110.0f

    cmpl-float v5, v0, v5

    const/16 v6, 0x9

    const/high16 v7, -0x3e600000    # -20.0f

    const/high16 v8, 0x41a00000    # 20.0f

    if-ltz v5, :cond_0

    const/high16 v5, -0x3d740000    # -70.0f

    cmpg-float v5, v0, v5

    if-lez v5, :cond_4

    :cond_0
    cmpl-float v5, v0, v7

    if-ltz v5, :cond_1

    cmpg-float v5, v0, v8

    if-lez v5, :cond_4

    :cond_1
    const/high16 v5, 0x43200000    # 160.0f

    cmpl-float v5, v0, v5

    if-ltz v5, :cond_2

    const/high16 v5, 0x43340000    # 180.0f

    cmpg-float v5, v0, v5

    if-lez v5, :cond_4

    :cond_2
    const/high16 v5, -0x3ccc0000    # -180.0f

    cmpl-float v5, v0, v5

    if-ltz v5, :cond_3

    const/high16 v5, -0x3ce00000    # -160.0f

    cmpg-float v5, v0, v5

    if-lez v5, :cond_4

    :cond_3
    const/high16 v5, 0x428c0000    # 70.0f

    cmpl-float v5, v0, v5

    if-ltz v5, :cond_13

    const/high16 v5, 0x42dc0000    # 110.0f

    cmpg-float v0, v0, v5

    if-lez v0, :cond_4

    goto/16 :goto_9

    :cond_4
    cmpg-float v0, v7, v2

    if-gtz v0, :cond_12

    cmpg-float v0, v2, v8

    if-lez v0, :cond_5

    goto/16 :goto_8

    :cond_5
    cmpg-float v0, v7, v3

    if-gtz v0, :cond_11

    cmpg-float v0, v3, v8

    if-lez v0, :cond_6

    goto/16 :goto_7

    :cond_6
    nop

    const/4 v0, 0x0

    move v3, v0

    move v2, v1

    :goto_0
    const/16 v5, 0x24

    if-gt v2, v5, :cond_7

    iget-object v5, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->shelterFlags:[F

    aget v5, v5, v2

    add-float/2addr v3, v5

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_7
    const/high16 v2, 0x42100000    # 36.0f

    div-float/2addr v3, v2

    const-string v2, "CheckOutLine"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "fFaceValue = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    const v2, 0x3f4ccccd    # 0.8f

    cmpl-float v3, v3, v2

    if-lez v3, :cond_8

    const/4 v0, 0x6

    return v0

    :cond_8
    nop

    const/16 v3, 0x45

    move v5, v0

    :goto_1
    const/16 v6, 0x50

    if-gt v3, v6, :cond_9

    iget-object v6, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->shelterFlags:[F

    aget v6, v6, v3

    add-float/2addr v5, v6

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_9
    const/high16 v3, 0x41400000    # 12.0f

    div-float/2addr v5, v3

    const-string v6, "CheckOutLine"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "fLeftEyeValue = "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    nop

    nop

    nop

    const/16 v6, 0x39

    move v7, v0

    :goto_2
    const/16 v9, 0x44

    if-gt v6, v9, :cond_a

    iget-object v9, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->shelterFlags:[F

    aget v9, v9, v6

    add-float/2addr v7, v9

    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    :cond_a
    div-float v3, v7, v3

    const-string v6, "CheckOutLine"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "fRightEyeValue = "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    cmpl-float v6, v3, v5

    if-lez v6, :cond_b

    nop

    const/4 v4, 0x3

    goto :goto_3

    :cond_b
    move v3, v5

    :goto_3
    const/16 v5, 0x5d

    move v6, v0

    :goto_4
    const/16 v7, 0x70

    if-gt v5, v7, :cond_c

    iget-object v7, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->shelterFlags:[F

    aget v7, v7, v5

    add-float/2addr v6, v7

    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    :cond_c
    div-float v5, v6, v8

    const-string v6, "CheckOutLine"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "fMouthEyeValue = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    cmpl-float v6, v5, v3

    if-lez v6, :cond_d

    nop

    const/4 v4, 0x4

    move v3, v5

    :cond_d
    const/16 v5, 0x51

    :goto_5
    const/16 v6, 0x77

    if-gt v5, v6, :cond_e

    iget-object v6, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->shelterFlags:[F

    aget v6, v6, v5

    add-float/2addr v0, v6

    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    :cond_e
    const/high16 v5, 0x421c0000    # 39.0f

    div-float/2addr v0, v5

    const-string v5, "CheckOutLine"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "fNOSEEyeValue = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    cmpl-float v5, v0, v3

    if-lez v5, :cond_f

    const/4 v3, 0x5

    goto :goto_6

    :cond_f
    move v0, v3

    move v3, v4

    :goto_6
    const-string v4, "CheckOutLine"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "fMax = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v6, " res = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    cmpl-float v0, v0, v2

    if-lez v0, :cond_10

    move v1, v3

    nop

    :cond_10
    return v1

    :cond_11
    :goto_7
    return v6

    :cond_12
    :goto_8
    return v6

    :cond_13
    :goto_9
    return v6
.end method

.method public getFaceCount()I
    .locals 1

    iget v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->faceCount:I

    return v0
.end method

.method public setEmpty()V
    .locals 6

    const/4 v0, 0x0

    iput v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->processHeight:I

    iput v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->processWidth:I

    iput v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->orientation:I

    iput-boolean v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->isMirror:Z

    iput v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->faceCount:I

    iget-object v1, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->outlines:[Lcom/arcsoft/avatar/AvatarConfig$ASPointF;

    array-length v2, v1

    move v3, v0

    :goto_0
    const/4 v4, 0x0

    if-ge v3, v2, :cond_0

    aget-object v5, v1, v3

    iput v4, v5, Lcom/arcsoft/avatar/AvatarConfig$ASPointF;->x:F

    iput v4, v5, Lcom/arcsoft/avatar/AvatarConfig$ASPointF;->y:F

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->face:Lcom/arcsoft/avatar/AvatarConfig$ASRect;

    iput v0, v1, Lcom/arcsoft/avatar/AvatarConfig$ASRect;->bottom:I

    iget-object v1, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->face:Lcom/arcsoft/avatar/AvatarConfig$ASRect;

    iput v0, v1, Lcom/arcsoft/avatar/AvatarConfig$ASRect;->right:I

    iget-object v1, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->face:Lcom/arcsoft/avatar/AvatarConfig$ASRect;

    iput v0, v1, Lcom/arcsoft/avatar/AvatarConfig$ASRect;->top:I

    iget-object v1, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->face:Lcom/arcsoft/avatar/AvatarConfig$ASRect;

    iput v0, v1, Lcom/arcsoft/avatar/AvatarConfig$ASRect;->left:I

    iget-object v1, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->faceOrientations:[F

    invoke-static {v1, v4}, Ljava/util/Arrays;->fill([FF)V

    iput v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->result:I

    iget-object v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->orientations:[F

    invoke-static {v0, v4}, Ljava/util/Arrays;->fill([FF)V

    iget-object v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->orientationLeftEyes:[F

    invoke-static {v0, v4}, Ljava/util/Arrays;->fill([FF)V

    iget-object v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->orientationRightEyes:[F

    invoke-static {v0, v4}, Ljava/util/Arrays;->fill([FF)V

    iget-object v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->expWeights:[F

    invoke-static {v0, v4}, Ljava/util/Arrays;->fill([FF)V

    iput v4, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->zoomInScale:F

    return-void
.end method

.method public shelterIsNull()Z
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;->shelterFlags:[F

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
