.class public Landroid/support/v4/graphics/ColorUtils;
.super Ljava/lang/Object;
.source "ColorUtils.java"


# static fields
.field private static final MIN_ALPHA_SEARCH_MAX_ITERATIONS:I = 0xa

.field private static final MIN_ALPHA_SEARCH_PRECISION:I = 0xa


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static HSLToColor([F)I
    .registers 14

    const/4 v0, 0x0

    aget v1, p0, v0

    const/4 v2, 0x1

    aget v2, p0, v2

    const/4 v3, 0x2

    aget v3, p0, v3

    const/high16 v4, 0x40000000    # 2.0f

    mul-float v5, v4, v3

    const/high16 v6, 0x3f800000    # 1.0f

    sub-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    sub-float v5, v6, v5

    mul-float/2addr v5, v2

    const/high16 v7, 0x3f000000    # 0.5f

    mul-float/2addr v7, v5

    sub-float v7, v3, v7

    const/high16 v8, 0x42700000    # 60.0f

    div-float v8, v1, v8

    rem-float/2addr v8, v4

    sub-float/2addr v8, v6

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v4

    sub-float/2addr v6, v4

    mul-float/2addr v6, v5

    float-to-int v4, v1

    div-int/lit8 v4, v4, 0x3c

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/high16 v11, 0x437f0000    # 255.0f

    packed-switch v4, :pswitch_data_c4

    goto/16 :goto_b1

    :pswitch_35
    add-float v12, v5, v7

    mul-float/2addr v12, v11

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v8

    mul-float v12, v11, v7

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v9

    add-float v12, v6, v7

    mul-float/2addr v11, v12

    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v10

    goto :goto_b1

    :pswitch_4a
    add-float v12, v6, v7

    mul-float/2addr v12, v11

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v8

    mul-float v12, v11, v7

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v9

    add-float v12, v5, v7

    mul-float/2addr v11, v12

    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v10

    goto :goto_b1

    :pswitch_5f
    mul-float v12, v11, v7

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v8

    add-float v12, v6, v7

    mul-float/2addr v12, v11

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v9

    add-float v12, v5, v7

    mul-float/2addr v11, v12

    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v10

    goto :goto_b1

    :pswitch_74
    mul-float v12, v11, v7

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v8

    add-float v12, v5, v7

    mul-float/2addr v12, v11

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v9

    add-float v12, v6, v7

    mul-float/2addr v11, v12

    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v10

    goto :goto_b1

    :pswitch_89
    add-float v12, v6, v7

    mul-float/2addr v12, v11

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v8

    add-float v12, v5, v7

    mul-float/2addr v12, v11

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v9

    mul-float/2addr v11, v7

    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v10

    goto :goto_b1

    :pswitch_9d
    add-float v12, v5, v7

    mul-float/2addr v12, v11

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v8

    add-float v12, v6, v7

    mul-float/2addr v12, v11

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v9

    mul-float/2addr v11, v7

    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v10

    nop

    :goto_b1
    const/16 v11, 0xff

    invoke-static {v8, v0, v11}, Landroid/support/v4/graphics/ColorUtils;->constrain(III)I

    move-result v8

    invoke-static {v9, v0, v11}, Landroid/support/v4/graphics/ColorUtils;->constrain(III)I

    move-result v9

    invoke-static {v10, v0, v11}, Landroid/support/v4/graphics/ColorUtils;->constrain(III)I

    move-result v0

    invoke-static {v8, v9, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v10

    return v10

    :pswitch_data_c4
    .packed-switch 0x0
        :pswitch_9d
        :pswitch_89
        :pswitch_74
        :pswitch_5f
        :pswitch_4a
        :pswitch_35
        :pswitch_35
    .end packed-switch
.end method

.method public static RGBToHSL(III[F)V
    .registers 20

    move/from16 v0, p0

    int-to-float v1, v0

    const/high16 v2, 0x437f0000    # 255.0f

    div-float/2addr v1, v2

    move/from16 v3, p1

    int-to-float v4, v3

    div-float/2addr v4, v2

    move/from16 v5, p2

    int-to-float v6, v5

    div-float/2addr v6, v2

    invoke-static {v4, v6}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-static {v4, v6}, Ljava/lang/Math;->min(FF)F

    move-result v7

    invoke-static {v1, v7}, Ljava/lang/Math;->min(FF)F

    move-result v7

    sub-float v8, v2, v7

    add-float v9, v2, v7

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    cmpl-float v11, v2, v7

    const/high16 v12, 0x3f800000    # 1.0f

    const/4 v13, 0x0

    if-nez v11, :cond_2f

    move v10, v13

    move v11, v13

    goto :goto_53

    :cond_2f
    cmpl-float v11, v2, v1

    if-nez v11, :cond_3a

    sub-float v11, v4, v6

    div-float/2addr v11, v8

    const/high16 v14, 0x40c00000    # 6.0f

    rem-float/2addr v11, v14

    :goto_39
    goto :goto_49

    :cond_3a
    cmpl-float v11, v2, v4

    if-nez v11, :cond_43

    sub-float v11, v6, v1

    div-float/2addr v11, v8

    add-float/2addr v11, v10

    goto :goto_39

    :cond_43
    sub-float v11, v1, v4

    div-float/2addr v11, v8

    const/high16 v14, 0x40800000    # 4.0f

    add-float/2addr v11, v14

    :goto_49
    mul-float/2addr v10, v9

    sub-float/2addr v10, v12

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    sub-float v10, v12, v10

    div-float v10, v8, v10

    :goto_53
    const/high16 v14, 0x42700000    # 60.0f

    mul-float/2addr v14, v11

    const/high16 v12, 0x43b40000    # 360.0f

    rem-float/2addr v14, v12

    cmpg-float v11, v14, v13

    if-gez v11, :cond_5e

    add-float/2addr v14, v12

    :cond_5e
    const/4 v11, 0x0

    invoke-static {v14, v13, v12}, Landroid/support/v4/graphics/ColorUtils;->constrain(FFF)F

    move-result v12

    aput v12, p3, v11

    const/4 v11, 0x1

    const/high16 v12, 0x3f800000    # 1.0f

    invoke-static {v10, v13, v12}, Landroid/support/v4/graphics/ColorUtils;->constrain(FFF)F

    move-result v15

    aput v15, p3, v11

    const/4 v11, 0x2

    invoke-static {v9, v13, v12}, Landroid/support/v4/graphics/ColorUtils;->constrain(FFF)F

    move-result v12

    aput v12, p3, v11

    return-void
.end method

.method public static calculateContrast(II)D
    .registers 10

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    const/16 v1, 0xff

    if-ne v0, v1, :cond_2b

    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-ge v0, v1, :cond_12

    invoke-static {p0, p1}, Landroid/support/v4/graphics/ColorUtils;->compositeColors(II)I

    move-result p0

    :cond_12
    invoke-static {p0}, Landroid/support/v4/graphics/ColorUtils;->calculateLuminance(I)D

    move-result-wide v0

    const-wide v2, 0x3fa999999999999aL    # 0.05

    add-double/2addr v0, v2

    invoke-static {p1}, Landroid/support/v4/graphics/ColorUtils;->calculateLuminance(I)D

    move-result-wide v4

    add-double/2addr v4, v2

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->min(DD)D

    move-result-wide v6

    div-double/2addr v2, v6

    return-wide v2

    :cond_2b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "background can not be translucent"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static calculateLuminance(I)D
    .registers 21

    invoke-static/range {p0 .. p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    int-to-double v0, v0

    const-wide v2, 0x406fe00000000000L    # 255.0

    div-double/2addr v0, v2

    const-wide v4, 0x3fa41c8216c61523L    # 0.03928

    cmpg-double v6, v0, v4

    const-wide v7, 0x4003333333333333L    # 2.4

    const-wide v9, 0x3ff0e147ae147ae1L    # 1.055

    const-wide v11, 0x3fac28f5c28f5c29L    # 0.055

    const-wide v13, 0x4029d70a3d70a3d7L    # 12.92

    if-gez v6, :cond_2b

    div-double v15, v0, v13

    goto :goto_33

    :cond_2b
    add-double v15, v0, v11

    div-double v11, v15, v9

    invoke-static {v11, v12, v7, v8}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v15

    :goto_33
    move-wide v0, v15

    invoke-static/range {p0 .. p0}, Landroid/graphics/Color;->green(I)I

    move-result v6

    int-to-double v11, v6

    div-double/2addr v11, v2

    cmpg-double v6, v11, v4

    if-gez v6, :cond_41

    div-double v15, v11, v13

    goto :goto_4e

    :cond_41
    const-wide v15, 0x3fac28f5c28f5c29L    # 0.055

    add-double v17, v11, v15

    div-double v13, v17, v9

    invoke-static {v13, v14, v7, v8}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v15

    :goto_4e
    move-wide v11, v15

    invoke-static/range {p0 .. p0}, Landroid/graphics/Color;->blue(I)I

    move-result v6

    int-to-double v13, v6

    div-double/2addr v13, v2

    cmpg-double v2, v13, v4

    if-gez v2, :cond_61

    const-wide v2, 0x4029d70a3d70a3d7L    # 12.92

    div-double v2, v13, v2

    goto :goto_6c

    :cond_61
    const-wide v2, 0x3fac28f5c28f5c29L    # 0.055

    add-double/2addr v2, v13

    div-double/2addr v2, v9

    invoke-static {v2, v3, v7, v8}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    :goto_6c
    const-wide v4, 0x3fcb367a0f9096bcL    # 0.2126

    mul-double/2addr v4, v0

    const-wide v6, 0x3fe6e2eb1c432ca5L    # 0.7152

    mul-double/2addr v6, v11

    add-double/2addr v4, v6

    const-wide v6, 0x3fb27bb2fec56d5dL    # 0.0722

    mul-double/2addr v6, v2

    add-double/2addr v4, v6

    return-wide v4
.end method

.method public static calculateMinimumAlpha(IIF)I
    .registers 12

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    const/16 v1, 0xff

    if-ne v0, v1, :cond_3a

    invoke-static {p0, v1}, Landroid/support/v4/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v0

    invoke-static {v0, p1}, Landroid/support/v4/graphics/ColorUtils;->calculateContrast(II)D

    move-result-wide v2

    float-to-double v4, p2

    cmpg-double v4, v2, v4

    if-gez v4, :cond_17

    const/4 v1, -0x1

    return v1

    :cond_17
    const/4 v4, 0x0

    const/4 v5, 0x0

    nop

    :goto_1a
    const/16 v6, 0xa

    if-gt v4, v6, :cond_39

    sub-int v7, v1, v5

    if-le v7, v6, :cond_39

    add-int v6, v5, v1

    div-int/lit8 v6, v6, 0x2

    invoke-static {p0, v6}, Landroid/support/v4/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v0

    invoke-static {v0, p1}, Landroid/support/v4/graphics/ColorUtils;->calculateContrast(II)D

    move-result-wide v2

    float-to-double v7, p2

    cmpg-double v7, v2, v7

    if-gez v7, :cond_35

    move v5, v6

    goto :goto_36

    :cond_35
    move v1, v6

    :goto_36
    add-int/lit8 v4, v4, 0x1

    goto :goto_1a

    :cond_39
    return v1

    :cond_3a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "background can not be translucent"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static colorToHSL(I[F)V
    .registers 5

    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v2

    invoke-static {v0, v1, v2, p1}, Landroid/support/v4/graphics/ColorUtils;->RGBToHSL(III[F)V

    return-void
.end method

.method private static compositeAlpha(II)I
    .registers 4

    rsub-int v0, p1, 0xff

    rsub-int v1, p0, 0xff

    mul-int/2addr v0, v1

    div-int/lit16 v0, v0, 0xff

    rsub-int v0, v0, 0xff

    return v0
.end method

.method public static compositeColors(II)I
    .registers 9

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    invoke-static {v1, v0}, Landroid/support/v4/graphics/ColorUtils;->compositeAlpha(II)I

    move-result v2

    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v3

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v4

    invoke-static {v3, v1, v4, v0, v2}, Landroid/support/v4/graphics/ColorUtils;->compositeComponent(IIIII)I

    move-result v3

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v4

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v5

    invoke-static {v4, v1, v5, v0, v2}, Landroid/support/v4/graphics/ColorUtils;->compositeComponent(IIIII)I

    move-result v4

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v5

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v6

    invoke-static {v5, v1, v6, v0, v2}, Landroid/support/v4/graphics/ColorUtils;->compositeComponent(IIIII)I

    move-result v5

    invoke-static {v2, v3, v4, v5}, Landroid/graphics/Color;->argb(IIII)I

    move-result v6

    return v6
.end method

.method private static compositeComponent(IIIII)I
    .registers 8

    if-nez p4, :cond_4

    const/4 v0, 0x0

    return v0

    :cond_4
    const/16 v0, 0xff

    mul-int v1, v0, p0

    mul-int/2addr v1, p1

    mul-int v2, p2, p3

    sub-int/2addr v0, p1

    mul-int/2addr v2, v0

    add-int/2addr v1, v2

    mul-int/lit16 v0, p4, 0xff

    div-int/2addr v1, v0

    return v1
.end method

.method private static constrain(FFF)F
    .registers 4

    cmpg-float v0, p0, p1

    if-gez v0, :cond_6

    move v0, p1

    goto :goto_d

    :cond_6
    cmpl-float v0, p0, p2

    if-lez v0, :cond_c

    move v0, p2

    goto :goto_d

    :cond_c
    move v0, p0

    :goto_d
    return v0
.end method

.method private static constrain(III)I
    .registers 4

    if-ge p0, p1, :cond_4

    move v0, p1

    goto :goto_9

    :cond_4
    if-le p0, p2, :cond_8

    move v0, p2

    goto :goto_9

    :cond_8
    move v0, p0

    :goto_9
    return v0
.end method

.method public static setAlphaComponent(II)I
    .registers 4

    if-ltz p1, :cond_e

    const/16 v0, 0xff

    if-gt p1, v0, :cond_e

    const v0, 0xffffff

    and-int/2addr v0, p0

    shl-int/lit8 v1, p1, 0x18

    or-int/2addr v0, v1

    return v0

    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "alpha must be between 0 and 255."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
