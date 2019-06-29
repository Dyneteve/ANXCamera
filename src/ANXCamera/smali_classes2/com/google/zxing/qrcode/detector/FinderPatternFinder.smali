.class public Lcom/google/zxing/qrcode/detector/FinderPatternFinder;
.super Ljava/lang/Object;
.source "FinderPatternFinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;,
        Lcom/google/zxing/qrcode/detector/FinderPatternFinder$FurthestFromAverageComparator;
    }
.end annotation


# static fields
.field private static final CENTER_QUORUM:I = 0x2

.field protected static final MAX_MODULES:I = 0x39

.field protected static final MIN_SKIP:I = 0x3


# instance fields
.field private final crossCheckStateCount:[I

.field private hasSkipped:Z

.field private final image:Lcom/google/zxing/common/BitMatrix;

.field private final possibleCenters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/qrcode/detector/FinderPattern;",
            ">;"
        }
    .end annotation
.end field

.field private final resultPointCallback:Lcom/google/zxing/ResultPointCallback;


# direct methods
.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;-><init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V

    return-void
.end method

.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    const/4 v0, 0x5

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    iput-object p2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    return-void
.end method

.method private static centerFromEnd([II)F
    .registers 5

    const/4 v0, 0x4

    aget v0, p0, v0

    sub-int v0, p1, v0

    const/4 v1, 0x3

    aget v1, p0, v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    const/4 v1, 0x2

    aget v1, p0, v1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    sub-float/2addr v0, v1

    return v0
.end method

.method private crossCheckDiagonal(IIII)Z
    .registers 21

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    invoke-direct/range {p0 .. p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->getCrossCheckStateCount()[I

    move-result-object v4

    const/4 v5, 0x0

    :goto_d
    const/4 v6, 0x2

    const/4 v7, 0x1

    if-lt v1, v5, :cond_28

    if-lt v2, v5, :cond_28

    iget-object v8, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    sub-int v9, v2, v5

    sub-int v10, v1, v5

    invoke-virtual {v8, v9, v10}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-nez v8, :cond_20

    goto :goto_28

    :cond_20
    aget v8, v4, v6

    add-int/2addr v8, v7

    aput v8, v4, v6

    add-int/lit8 v5, v5, 0x1

    goto :goto_d

    :cond_28
    :goto_28
    const/4 v8, 0x0

    if-lt v1, v5, :cond_127

    if-ge v2, v5, :cond_2f

    goto/16 :goto_127

    :cond_2f
    :goto_2f
    if-lt v1, v5, :cond_4c

    if-lt v2, v5, :cond_4c

    iget-object v9, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    sub-int v10, v2, v5

    sub-int v11, v1, v5

    invoke-virtual {v9, v10, v11}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v9

    if-nez v9, :cond_4c

    aget v9, v4, v7

    if-le v9, v3, :cond_44

    goto :goto_4c

    :cond_44
    aget v9, v4, v7

    add-int/2addr v9, v7

    aput v9, v4, v7

    add-int/lit8 v5, v5, 0x1

    goto :goto_2f

    :cond_4c
    :goto_4c
    if-lt v1, v5, :cond_126

    if-lt v2, v5, :cond_126

    aget v9, v4, v7

    if-le v9, v3, :cond_56

    goto/16 :goto_126

    :cond_56
    :goto_56
    if-lt v1, v5, :cond_73

    if-lt v2, v5, :cond_73

    iget-object v9, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    sub-int v10, v2, v5

    sub-int v11, v1, v5

    invoke-virtual {v9, v10, v11}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v9

    if-eqz v9, :cond_73

    aget v9, v4, v8

    if-le v9, v3, :cond_6b

    goto :goto_73

    :cond_6b
    aget v9, v4, v8

    add-int/2addr v9, v7

    aput v9, v4, v8

    add-int/lit8 v5, v5, 0x1

    goto :goto_56

    :cond_73
    :goto_73
    aget v9, v4, v8

    if-le v9, v3, :cond_78

    return v8

    :cond_78
    iget-object v9, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v9}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v9

    iget-object v10, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v10}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v10

    const/4 v5, 0x1

    :goto_85
    add-int v11, v1, v5

    if-ge v11, v9, :cond_a2

    add-int v11, v2, v5

    if-ge v11, v10, :cond_a2

    iget-object v11, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    add-int v12, v2, v5

    add-int v13, v1, v5

    invoke-virtual {v11, v12, v13}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v11

    if-nez v11, :cond_9a

    goto :goto_a2

    :cond_9a
    aget v11, v4, v6

    add-int/2addr v11, v7

    aput v11, v4, v6

    add-int/lit8 v5, v5, 0x1

    goto :goto_85

    :cond_a2
    :goto_a2
    add-int v11, v1, v5

    if-ge v11, v9, :cond_125

    add-int v11, v2, v5

    if-lt v11, v10, :cond_ac

    goto/16 :goto_125

    :cond_ac
    :goto_ac
    add-int v11, v1, v5

    const/4 v12, 0x3

    if-ge v11, v9, :cond_ce

    add-int v11, v2, v5

    if-ge v11, v10, :cond_ce

    iget-object v11, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    add-int v13, v2, v5

    add-int v14, v1, v5

    invoke-virtual {v11, v13, v14}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v11

    if-nez v11, :cond_ce

    aget v11, v4, v12

    if-lt v11, v3, :cond_c6

    goto :goto_ce

    :cond_c6
    aget v11, v4, v12

    add-int/2addr v11, v7

    aput v11, v4, v12

    add-int/lit8 v5, v5, 0x1

    goto :goto_ac

    :cond_ce
    :goto_ce
    add-int v11, v1, v5

    if-ge v11, v9, :cond_124

    add-int v11, v2, v5

    if-ge v11, v10, :cond_124

    aget v11, v4, v12

    if-lt v11, v3, :cond_db

    goto :goto_124

    :cond_db
    :goto_db
    add-int v11, v1, v5

    const/4 v13, 0x4

    if-ge v11, v9, :cond_fe

    add-int v11, v2, v5

    if-ge v11, v10, :cond_fe

    iget-object v11, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    add-int v14, v2, v5

    add-int v12, v1, v5

    invoke-virtual {v11, v14, v12}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v11

    if-eqz v11, :cond_fe

    aget v11, v4, v13

    if-lt v11, v3, :cond_f5

    goto :goto_fe

    :cond_f5
    aget v11, v4, v13

    add-int/2addr v11, v7

    aput v11, v4, v13

    add-int/lit8 v5, v5, 0x1

    const/4 v12, 0x3

    goto :goto_db

    :cond_fe
    :goto_fe
    aget v11, v4, v13

    if-lt v11, v3, :cond_103

    return v8

    :cond_103
    aget v11, v4, v8

    aget v12, v4, v7

    add-int/2addr v11, v12

    aget v12, v4, v6

    add-int/2addr v11, v12

    const/4 v12, 0x3

    aget v12, v4, v12

    add-int/2addr v11, v12

    aget v12, v4, v13

    add-int/2addr v11, v12

    sub-int v12, v11, p4

    invoke-static {v12}, Ljava/lang/Math;->abs(I)I

    move-result v12

    mul-int v6, v6, p4

    if-ge v12, v6, :cond_123

    invoke-static {v4}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v6

    if-eqz v6, :cond_123

    return v7

    :cond_123
    return v8

    :cond_124
    :goto_124
    return v8

    :cond_125
    :goto_125
    return v8

    :cond_126
    :goto_126
    return v8

    :cond_127
    :goto_127
    return v8
.end method

.method private crossCheckHorizontal(IIII)F
    .registers 16

    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v1

    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->getCrossCheckStateCount()[I

    move-result-object v2

    move v3, p1

    :goto_b
    const/4 v4, 0x2

    const/4 v5, 0x1

    if-ltz v3, :cond_1e

    invoke-virtual {v0, v3, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-nez v6, :cond_16

    goto :goto_1e

    :cond_16
    aget v6, v2, v4

    add-int/2addr v6, v5

    aput v6, v2, v4

    add-int/lit8 v3, v3, -0x1

    goto :goto_b

    :cond_1e
    :goto_1e
    const/high16 v6, 0x7fc00000    # Float.NaN

    if-gez v3, :cond_23

    return v6

    :cond_23
    :goto_23
    if-ltz v3, :cond_38

    invoke-virtual {v0, v3, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v7

    if-nez v7, :cond_38

    aget v7, v2, v5

    if-le v7, p3, :cond_30

    goto :goto_38

    :cond_30
    aget v7, v2, v5

    add-int/2addr v7, v5

    aput v7, v2, v5

    add-int/lit8 v3, v3, -0x1

    goto :goto_23

    :cond_38
    :goto_38
    if-ltz v3, :cond_cf

    aget v7, v2, v5

    if-le v7, p3, :cond_40

    goto/16 :goto_cf

    :cond_40
    :goto_40
    const/4 v7, 0x0

    if-ltz v3, :cond_56

    invoke-virtual {v0, v3, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-eqz v8, :cond_56

    aget v8, v2, v7

    if-le v8, p3, :cond_4e

    goto :goto_56

    :cond_4e
    aget v8, v2, v7

    add-int/2addr v8, v5

    aput v8, v2, v7

    add-int/lit8 v3, v3, -0x1

    goto :goto_40

    :cond_56
    :goto_56
    aget v8, v2, v7

    if-le v8, p3, :cond_5b

    return v6

    :cond_5b
    add-int/lit8 v3, p1, 0x1

    :goto_5d
    if-ge v3, v1, :cond_6e

    invoke-virtual {v0, v3, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-nez v8, :cond_66

    goto :goto_6e

    :cond_66
    aget v8, v2, v4

    add-int/2addr v8, v5

    aput v8, v2, v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_5d

    :cond_6e
    :goto_6e
    if-ne v3, v1, :cond_71

    return v6

    :cond_71
    :goto_71
    const/4 v8, 0x3

    if-ge v3, v1, :cond_87

    invoke-virtual {v0, v3, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v9

    if-nez v9, :cond_87

    aget v9, v2, v8

    if-lt v9, p3, :cond_7f

    goto :goto_87

    :cond_7f
    aget v9, v2, v8

    add-int/2addr v9, v5

    aput v9, v2, v8

    add-int/lit8 v3, v3, 0x1

    goto :goto_71

    :cond_87
    :goto_87
    if-eq v3, v1, :cond_ce

    aget v9, v2, v8

    if-lt v9, p3, :cond_8e

    goto :goto_ce

    :cond_8e
    :goto_8e
    const/4 v9, 0x4

    if-ge v3, v1, :cond_a4

    invoke-virtual {v0, v3, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v10

    if-eqz v10, :cond_a4

    aget v10, v2, v9

    if-lt v10, p3, :cond_9c

    goto :goto_a4

    :cond_9c
    aget v10, v2, v9

    add-int/2addr v10, v5

    aput v10, v2, v9

    add-int/lit8 v3, v3, 0x1

    goto :goto_8e

    :cond_a4
    :goto_a4
    aget v10, v2, v9

    if-lt v10, p3, :cond_a9

    return v6

    :cond_a9
    aget v7, v2, v7

    aget v5, v2, v5

    add-int/2addr v7, v5

    aget v4, v2, v4

    add-int/2addr v7, v4

    aget v4, v2, v8

    add-int/2addr v7, v4

    aget v4, v2, v9

    add-int/2addr v7, v4

    const/4 v4, 0x5

    sub-int v5, v7, p4

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    mul-int/2addr v4, v5

    if-lt v4, p4, :cond_c2

    return v6

    :cond_c2
    invoke-static {v2}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v4

    if-eqz v4, :cond_cd

    invoke-static {v2, v3}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->centerFromEnd([II)F

    move-result v6

    nop

    :cond_cd
    return v6

    :cond_ce
    :goto_ce
    return v6

    :cond_cf
    :goto_cf
    return v6
.end method

.method private crossCheckVertical(IIII)F
    .registers 16

    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v1

    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->getCrossCheckStateCount()[I

    move-result-object v2

    move v3, p1

    :goto_b
    const/4 v4, 0x2

    const/4 v5, 0x1

    if-ltz v3, :cond_1e

    invoke-virtual {v0, p2, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-nez v6, :cond_16

    goto :goto_1e

    :cond_16
    aget v6, v2, v4

    add-int/2addr v6, v5

    aput v6, v2, v4

    add-int/lit8 v3, v3, -0x1

    goto :goto_b

    :cond_1e
    :goto_1e
    const/high16 v6, 0x7fc00000    # Float.NaN

    if-gez v3, :cond_23

    return v6

    :cond_23
    :goto_23
    if-ltz v3, :cond_38

    invoke-virtual {v0, p2, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v7

    if-nez v7, :cond_38

    aget v7, v2, v5

    if-le v7, p3, :cond_30

    goto :goto_38

    :cond_30
    aget v7, v2, v5

    add-int/2addr v7, v5

    aput v7, v2, v5

    add-int/lit8 v3, v3, -0x1

    goto :goto_23

    :cond_38
    :goto_38
    if-ltz v3, :cond_d0

    aget v7, v2, v5

    if-le v7, p3, :cond_40

    goto/16 :goto_d0

    :cond_40
    :goto_40
    const/4 v7, 0x0

    if-ltz v3, :cond_56

    invoke-virtual {v0, p2, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-eqz v8, :cond_56

    aget v8, v2, v7

    if-le v8, p3, :cond_4e

    goto :goto_56

    :cond_4e
    aget v8, v2, v7

    add-int/2addr v8, v5

    aput v8, v2, v7

    add-int/lit8 v3, v3, -0x1

    goto :goto_40

    :cond_56
    :goto_56
    aget v8, v2, v7

    if-le v8, p3, :cond_5b

    return v6

    :cond_5b
    add-int/lit8 v3, p1, 0x1

    :goto_5d
    if-ge v3, v1, :cond_6e

    invoke-virtual {v0, p2, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-nez v8, :cond_66

    goto :goto_6e

    :cond_66
    aget v8, v2, v4

    add-int/2addr v8, v5

    aput v8, v2, v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_5d

    :cond_6e
    :goto_6e
    if-ne v3, v1, :cond_71

    return v6

    :cond_71
    :goto_71
    const/4 v8, 0x3

    if-ge v3, v1, :cond_87

    invoke-virtual {v0, p2, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v9

    if-nez v9, :cond_87

    aget v9, v2, v8

    if-lt v9, p3, :cond_7f

    goto :goto_87

    :cond_7f
    aget v9, v2, v8

    add-int/2addr v9, v5

    aput v9, v2, v8

    add-int/lit8 v3, v3, 0x1

    goto :goto_71

    :cond_87
    :goto_87
    if-eq v3, v1, :cond_cf

    aget v9, v2, v8

    if-lt v9, p3, :cond_8e

    goto :goto_cf

    :cond_8e
    :goto_8e
    const/4 v9, 0x4

    if-ge v3, v1, :cond_a4

    invoke-virtual {v0, p2, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v10

    if-eqz v10, :cond_a4

    aget v10, v2, v9

    if-lt v10, p3, :cond_9c

    goto :goto_a4

    :cond_9c
    aget v10, v2, v9

    add-int/2addr v10, v5

    aput v10, v2, v9

    add-int/lit8 v3, v3, 0x1

    goto :goto_8e

    :cond_a4
    :goto_a4
    aget v10, v2, v9

    if-lt v10, p3, :cond_a9

    return v6

    :cond_a9
    aget v7, v2, v7

    aget v5, v2, v5

    add-int/2addr v7, v5

    aget v5, v2, v4

    add-int/2addr v7, v5

    aget v5, v2, v8

    add-int/2addr v7, v5

    aget v5, v2, v9

    add-int/2addr v7, v5

    const/4 v5, 0x5

    sub-int v8, v7, p4

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    mul-int/2addr v5, v8

    mul-int/2addr v4, p4

    if-lt v5, v4, :cond_c3

    return v6

    :cond_c3
    invoke-static {v2}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v4

    if-eqz v4, :cond_ce

    invoke-static {v2, v3}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->centerFromEnd([II)F

    move-result v6

    nop

    :cond_ce
    return v6

    :cond_cf
    :goto_cf
    return v6

    :cond_d0
    :goto_d0
    return v6
.end method

.method private findRowSkip()I
    .registers 9

    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-gt v0, v2, :cond_b

    return v1

    :cond_b
    const/4 v3, 0x0

    iget-object v4, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_12
    :goto_12
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_19

    return v1

    :cond_19
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-virtual {v5}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getCount()I

    move-result v6

    const/4 v7, 0x2

    if-lt v6, v7, :cond_12

    if-nez v3, :cond_2a

    move-object v3, v5

    goto :goto_12

    :cond_2a
    iput-boolean v2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->hasSkipped:Z

    invoke-virtual {v3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v1

    invoke-virtual {v5}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v2

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    invoke-virtual {v3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v2

    invoke-virtual {v5}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v4

    sub-float/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    sub-float/2addr v1, v2

    float-to-int v1, v1

    nop

    div-int/2addr v1, v7

    return v1
.end method

.method protected static foundPatternCross([I)Z
    .registers 9

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    const/4 v2, 0x5

    const/4 v3, 0x0

    if-lt v1, v2, :cond_5d

    const/4 v1, 0x7

    if-ge v0, v1, :cond_a

    return v3

    :cond_a
    int-to-float v1, v0

    const/high16 v2, 0x40e00000    # 7.0f

    div-float/2addr v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, v1, v2

    aget v4, p0, v3

    int-to-float v4, v4

    sub-float v4, v1, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpg-float v4, v4, v2

    if-gez v4, :cond_5c

    const/4 v4, 0x1

    aget v5, p0, v4

    int-to-float v5, v5

    sub-float v5, v1, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v5, v5, v2

    if-gez v5, :cond_5c

    const/high16 v5, 0x40400000    # 3.0f

    mul-float v6, v5, v1

    const/4 v7, 0x2

    aget v7, p0, v7

    int-to-float v7, v7

    sub-float/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    mul-float/2addr v5, v2

    cmpg-float v5, v6, v5

    if-gez v5, :cond_5c

    const/4 v5, 0x3

    aget v5, p0, v5

    int-to-float v5, v5

    sub-float v5, v1, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v5, v5, v2

    if-gez v5, :cond_5c

    const/4 v5, 0x4

    aget v5, p0, v5

    int-to-float v5, v5

    sub-float v5, v1, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v5, v5, v2

    if-gez v5, :cond_5c

    return v4

    :cond_5c
    return v3

    :cond_5d
    aget v2, p0, v1

    if-nez v2, :cond_62

    return v3

    :cond_62
    add-int/2addr v0, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method private getCrossCheckStateCount()[I
    .registers 4

    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    const/4 v1, 0x0

    aput v1, v0, v1

    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    const/4 v2, 0x1

    aput v1, v0, v2

    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    const/4 v2, 0x2

    aput v1, v0, v2

    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    const/4 v2, 0x3

    aput v1, v0, v2

    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    const/4 v2, 0x4

    aput v1, v0, v2

    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    return-object v0
.end method

.method private haveMultiplyConfirmedCenters()Z
    .registers 10

    const/4 v0, 0x0

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    iget-object v3, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_e
    :goto_e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_44

    const/4 v3, 0x3

    const/4 v4, 0x0

    if-ge v0, v3, :cond_19

    return v4

    :cond_19
    int-to-float v3, v2

    div-float v5, v1, v3

    const/4 v3, 0x0

    iget-object v6, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_23
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_33

    const v6, 0x3d4ccccd    # 0.05f

    mul-float/2addr v6, v1

    cmpg-float v6, v3, v6

    if-gtz v6, :cond_32

    const/4 v4, 0x1

    :cond_32
    return v4

    :cond_33
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-virtual {v7}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v8

    sub-float/2addr v8, v5

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    add-float/2addr v3, v8

    goto :goto_23

    :cond_44
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-virtual {v4}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getCount()I

    move-result v5

    const/4 v6, 0x2

    if-lt v5, v6, :cond_e

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v4}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v5

    add-float/2addr v1, v5

    goto :goto_e
.end method

.method private selectBestPatterns()[Lcom/google/zxing/qrcode/detector/FinderPattern;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x3

    if-lt v0, v1, :cond_e2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-le v0, v1, :cond_7b

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_15
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_6c

    int-to-float v6, v0

    div-float v6, v4, v6

    int-to-float v7, v0

    div-float v7, v5, v7

    mul-float v8, v6, v6

    sub-float/2addr v7, v8

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v7

    double-to-float v7, v7

    iget-object v8, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    new-instance v9, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$FurthestFromAverageComparator;

    invoke-direct {v9, v6, v2}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$FurthestFromAverageComparator;-><init>(FLcom/google/zxing/qrcode/detector/FinderPatternFinder$FurthestFromAverageComparator;)V

    invoke-static {v8, v9}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    const v8, 0x3e4ccccd    # 0.2f

    mul-float/2addr v8, v6

    invoke-static {v8, v7}, Ljava/lang/Math;->max(FF)F

    move-result v8

    const/4 v9, 0x0

    :goto_3d
    iget-object v10, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    if-ge v9, v10, :cond_7b

    iget-object v10, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    if-gt v10, v1, :cond_4e

    goto :goto_7b

    :cond_4e
    iget-object v10, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-virtual {v10}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v11

    sub-float/2addr v11, v6

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v11

    cmpl-float v11, v11, v8

    if-lez v11, :cond_6a

    iget-object v11, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v11, v9}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    add-int/lit8 v9, v9, -0x1

    :cond_6a
    add-int/2addr v9, v3

    goto :goto_3d

    :cond_6c
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-virtual {v7}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v8

    add-float/2addr v4, v8

    mul-float v9, v8, v8

    add-float/2addr v5, v9

    goto :goto_15

    :cond_7b
    :goto_7b
    iget-object v4, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-le v4, v1, :cond_bf

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_8a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_b3

    iget-object v5, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    int-to-float v5, v5

    div-float v5, v4, v5

    iget-object v6, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    new-instance v7, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;

    invoke-direct {v7, v5, v2}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;-><init>(FLcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;)V

    invoke-static {v6, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    iget-object v2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    iget-object v6, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    invoke-interface {v2, v1, v6}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->clear()V

    goto :goto_bf

    :cond_b3
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-virtual {v6}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v7

    add-float/2addr v4, v7

    goto :goto_8a

    :cond_bf
    :goto_bf
    new-array v1, v1, [Lcom/google/zxing/qrcode/detector/FinderPattern;

    iget-object v2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    const/4 v4, 0x0

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v2, v1, v4

    iget-object v2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    const/4 v3, 0x2

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v2, v1, v3

    return-object v1

    :cond_e2
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method


# virtual methods
.method final find(Ljava/util/Map;)Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    .registers 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/qrcode/detector/FinderPatternInfo;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_12

    sget-object v4, Lcom/google/zxing/DecodeHintType;->TRY_HARDER:Lcom/google/zxing/DecodeHintType;

    invoke-interface {v1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_12

    move v4, v3

    goto :goto_13

    :cond_12
    move v4, v2

    :goto_13
    if-eqz v1, :cond_1f

    sget-object v5, Lcom/google/zxing/DecodeHintType;->PURE_BARCODE:Lcom/google/zxing/DecodeHintType;

    invoke-interface {v1, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f

    move v5, v3

    goto :goto_20

    :cond_1f
    move v5, v2

    :goto_20
    iget-object v6, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v6}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v6

    iget-object v7, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v7}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v7

    const/4 v8, 0x3

    mul-int v9, v8, v6

    div-int/lit16 v9, v9, 0xe4

    if-lt v9, v8, :cond_35

    if-eqz v4, :cond_36

    :cond_35
    const/4 v9, 0x3

    :cond_36
    const/4 v10, 0x0

    const/4 v11, 0x5

    new-array v11, v11, [I

    add-int/lit8 v12, v9, -0x1

    :goto_3c
    if-ge v12, v6, :cond_124

    if-eqz v10, :cond_42

    goto/16 :goto_124

    :cond_42
    aput v2, v11, v2

    aput v2, v11, v3

    const/4 v13, 0x2

    aput v2, v11, v13

    aput v2, v11, v8

    const/4 v14, 0x4

    aput v2, v11, v14

    const/4 v15, 0x0

    const/16 v16, 0x0

    move/from16 v19, v10

    move v10, v9

    move/from16 v9, v16

    move/from16 v16, v19

    :goto_58
    if-lt v9, v7, :cond_7b

    invoke-static {v11}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v9

    if-eqz v9, :cond_76

    invoke-virtual {v0, v11, v12, v7, v5}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->handlePossibleCenter([IIIZ)Z

    move-result v9

    if-eqz v9, :cond_76

    aget v10, v11, v2

    iget-boolean v13, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->hasSkipped:Z

    if-eqz v13, :cond_76

    invoke-direct/range {p0 .. p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->haveMultiplyConfirmedCenters()Z

    move-result v9

    move/from16 v19, v10

    move v10, v9

    move/from16 v9, v19

    goto :goto_79

    :cond_76
    move v9, v10

    move/from16 v10, v16

    :goto_79
    add-int/2addr v12, v9

    goto :goto_3c

    :cond_7b
    iget-object v8, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v8, v9, v12}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-eqz v8, :cond_94

    and-int/lit8 v8, v15, 0x1

    if-ne v8, v3, :cond_89

    add-int/lit8 v15, v15, 0x1

    :cond_89
    aget v8, v11, v15

    add-int/2addr v8, v3

    aput v8, v11, v15

    nop

    move v8, v3

    move v3, v14

    const/4 v14, 0x3

    goto/16 :goto_11b

    :cond_94
    and-int/lit8 v8, v15, 0x1

    if-nez v8, :cond_112

    if-ne v15, v14, :cond_106

    invoke-static {v11}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v8

    if-eqz v8, :cond_f1

    invoke-virtual {v0, v11, v12, v9, v5}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->handlePossibleCenter([IIIZ)Z

    move-result v8

    if-eqz v8, :cond_d6

    const/4 v10, 0x2

    iget-boolean v14, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->hasSkipped:Z

    if-eqz v14, :cond_b0

    invoke-direct/range {p0 .. p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->haveMultiplyConfirmedCenters()Z

    move-result v16

    goto :goto_c2

    :cond_b0
    invoke-direct/range {p0 .. p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->findRowSkip()I

    move-result v14

    aget v3, v11, v13

    if-le v14, v3, :cond_c2

    aget v3, v11, v13

    sub-int v3, v14, v3

    sub-int/2addr v3, v10

    add-int/2addr v12, v3

    add-int/lit8 v3, v7, -0x1

    nop

    move v9, v3

    :cond_c2
    :goto_c2
    const/4 v3, 0x0

    aput v2, v11, v2

    const/4 v14, 0x1

    aput v2, v11, v14

    aput v2, v11, v13

    const/4 v14, 0x3

    aput v2, v11, v14

    const/16 v17, 0x4

    aput v2, v11, v17

    nop

    move v15, v3

    move/from16 v3, v17

    goto :goto_ef

    :cond_d6
    move/from16 v17, v14

    const/4 v14, 0x3

    aget v3, v11, v13

    aput v3, v11, v2

    aget v3, v11, v14

    const/16 v18, 0x1

    aput v3, v11, v18

    aget v3, v11, v17

    aput v3, v11, v13

    aput v18, v11, v14

    aput v2, v11, v17

    const/4 v3, 0x3

    nop

    move v15, v3

    const/4 v3, 0x4

    :goto_ef
    const/4 v8, 0x1

    goto :goto_11b

    :cond_f1
    const/4 v14, 0x3

    aget v3, v11, v13

    aput v3, v11, v2

    aget v3, v11, v14

    const/4 v8, 0x1

    aput v3, v11, v8

    const/4 v3, 0x4

    aget v17, v11, v3

    aput v17, v11, v13

    aput v8, v11, v14

    aput v2, v11, v3

    const/4 v15, 0x3

    goto :goto_11b

    :cond_106
    move v8, v3

    move v3, v14

    const/4 v14, 0x3

    add-int/lit8 v15, v15, 0x1

    aget v17, v11, v15

    add-int/lit8 v17, v17, 0x1

    aput v17, v11, v15

    goto :goto_11b

    :cond_112
    move v8, v3

    move v3, v14

    const/4 v14, 0x3

    aget v17, v11, v15

    add-int/lit8 v17, v17, 0x1

    aput v17, v11, v15

    :goto_11b
    add-int/2addr v9, v8

    move/from16 v19, v14

    move v14, v3

    move v3, v8

    move/from16 v8, v19

    goto/16 :goto_58

    :cond_124
    :goto_124
    invoke-direct/range {p0 .. p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->selectBestPatterns()[Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v2

    invoke-static {v2}, Lcom/google/zxing/ResultPoint;->orderBestPatterns([Lcom/google/zxing/ResultPoint;)V

    new-instance v3, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    invoke-direct {v3, v2}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;-><init>([Lcom/google/zxing/qrcode/detector/FinderPattern;)V

    return-object v3
.end method

.method protected final getImage()Lcom/google/zxing/common/BitMatrix;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    return-object v0
.end method

.method protected final getPossibleCenters()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/zxing/qrcode/detector/FinderPattern;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    return-object v0
.end method

.method protected final handlePossibleCenter([IIIZ)Z
    .registers 15

    const/4 v0, 0x0

    aget v1, p1, v0

    const/4 v2, 0x1

    aget v3, p1, v2

    add-int/2addr v1, v3

    const/4 v3, 0x2

    aget v4, p1, v3

    add-int/2addr v1, v4

    const/4 v4, 0x3

    aget v4, p1, v4

    add-int/2addr v1, v4

    const/4 v4, 0x4

    aget v4, p1, v4

    add-int/2addr v1, v4

    invoke-static {p1, p3}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->centerFromEnd([II)F

    move-result v4

    float-to-int v5, v4

    aget v6, p1, v3

    invoke-direct {p0, p2, v5, v6, v1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckVertical(IIII)F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v6

    if-nez v6, :cond_80

    float-to-int v6, v4

    float-to-int v7, v5

    aget v8, p1, v3

    invoke-direct {p0, v6, v7, v8, v1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckHorizontal(IIII)F

    move-result v4

    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v6

    if-nez v6, :cond_80

    if-eqz p4, :cond_3e

    float-to-int v6, v5

    float-to-int v7, v4

    aget v3, p1, v3

    invoke-direct {p0, v6, v7, v3, v1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckDiagonal(IIII)Z

    move-result v3

    if-eqz v3, :cond_80

    :cond_3e
    int-to-float v0, v1

    const/high16 v3, 0x40e00000    # 7.0f

    div-float v3, v0, v3

    const/4 v6, 0x0

    const/4 v0, 0x0

    :goto_45
    iget-object v7, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-lt v0, v7, :cond_4e

    goto :goto_67

    :cond_4e
    iget-object v7, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v7, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-virtual {v7, v3, v5, v4}, Lcom/google/zxing/qrcode/detector/FinderPattern;->aboutEquals(FFF)Z

    move-result v8

    if-eqz v8, :cond_7d

    iget-object v8, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-virtual {v7, v5, v4, v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;->combineEstimate(FFF)Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v9

    invoke-interface {v8, v0, v9}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    const/4 v6, 0x1

    nop

    :goto_67
    if-nez v6, :cond_7c

    new-instance v0, Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-direct {v0, v4, v5, v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;-><init>(FFF)V

    iget-object v7, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v7, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    if-eqz v7, :cond_7c

    iget-object v7, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    invoke-interface {v7, v0}, Lcom/google/zxing/ResultPointCallback;->foundPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V

    :cond_7c
    return v2

    :cond_7d
    add-int/lit8 v0, v0, 0x1

    goto :goto_45

    :cond_80
    return v0
.end method
