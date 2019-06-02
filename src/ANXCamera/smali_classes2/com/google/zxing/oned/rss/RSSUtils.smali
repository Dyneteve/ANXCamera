.class public final Lcom/google/zxing/oned/rss/RSSUtils;
.super Ljava/lang/Object;
.source "RSSUtils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static combins(II)I
    .registers 7

    sub-int v0, p0, p1

    if-le v0, p1, :cond_8

    move v0, p1

    sub-int v1, p0, p1

    goto :goto_b

    :cond_8
    sub-int v0, p0, p1

    move v1, p1

    :goto_b
    const/4 v2, 0x1

    const/4 v3, 0x1

    move v4, p0

    :goto_e
    if-gt v4, v1, :cond_17

    :goto_10
    if-le v3, v0, :cond_13

    return v2

    :cond_13
    div-int/2addr v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_10

    :cond_17
    mul-int/2addr v2, v4

    if-gt v3, v0, :cond_1d

    div-int/2addr v2, v3

    add-int/lit8 v3, v3, 0x1

    :cond_1d
    add-int/lit8 v4, v4, -0x1

    goto :goto_e
.end method

.method public static getRSSvalue([IIZ)I
    .registers 15

    array-length v0, p0

    const/4 v1, 0x0

    array-length v2, p0

    const/4 v3, 0x0

    :goto_4
    if-lt v3, v2, :cond_78

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move v5, v1

    :goto_a
    add-int/lit8 v1, v0, -0x1

    if-lt v4, v1, :cond_f

    return v2

    :cond_f
    const/4 v1, 0x1

    const/4 v6, 0x1

    shl-int v7, v6, v4

    or-int/2addr v3, v7

    :goto_14
    aget v7, p0, v4

    if-lt v1, v7, :cond_1c

    sub-int/2addr v5, v1

    add-int/lit8 v4, v4, 0x1

    goto :goto_a

    :cond_1c
    sub-int v7, v5, v1

    sub-int/2addr v7, v6

    sub-int v8, v0, v4

    add-int/lit8 v8, v8, -0x2

    invoke-static {v7, v8}, Lcom/google/zxing/oned/rss/RSSUtils;->combins(II)I

    move-result v7

    if-eqz p2, :cond_44

    if-nez v3, :cond_44

    sub-int v8, v5, v1

    sub-int v9, v0, v4

    sub-int/2addr v9, v6

    sub-int/2addr v8, v9

    sub-int v9, v0, v4

    sub-int/2addr v9, v6

    if-lt v8, v9, :cond_44

    sub-int v8, v5, v1

    sub-int v9, v0, v4

    sub-int/2addr v8, v9

    sub-int v9, v0, v4

    add-int/lit8 v9, v9, -0x2

    invoke-static {v8, v9}, Lcom/google/zxing/oned/rss/RSSUtils;->combins(II)I

    move-result v8

    sub-int/2addr v7, v8

    :cond_44
    sub-int v8, v0, v4

    sub-int/2addr v8, v6

    if-le v8, v6, :cond_6a

    const/4 v8, 0x0

    sub-int v9, v5, v1

    sub-int v10, v0, v4

    add-int/lit8 v10, v10, -0x2

    sub-int/2addr v9, v10

    nop

    :goto_52
    if-gt v9, p1, :cond_5a

    add-int/lit8 v9, v0, -0x1

    sub-int/2addr v9, v4

    mul-int/2addr v9, v8

    sub-int/2addr v7, v9

    goto :goto_70

    :cond_5a
    sub-int v10, v5, v1

    sub-int/2addr v10, v9

    sub-int/2addr v10, v6

    sub-int v11, v0, v4

    add-int/lit8 v11, v11, -0x3

    invoke-static {v10, v11}, Lcom/google/zxing/oned/rss/RSSUtils;->combins(II)I

    move-result v10

    add-int/2addr v8, v10

    add-int/lit8 v9, v9, -0x1

    goto :goto_52

    :cond_6a
    sub-int v8, v5, v1

    if-le v8, p1, :cond_70

    add-int/lit8 v7, v7, -0x1

    :cond_70
    :goto_70
    add-int/2addr v2, v7

    add-int/lit8 v1, v1, 0x1

    shl-int v7, v6, v4

    not-int v7, v7

    and-int/2addr v3, v7

    goto :goto_14

    :cond_78
    aget v4, p0, v3

    add-int/2addr v1, v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_4
.end method
