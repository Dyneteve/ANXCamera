.class public Lcom/android/camera/effect/BeautyInfoFactory;
.super Ljava/lang/Object;
.source "BeautyInfoFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFilterDegree(Lcom/miui/filtersdk/filter/helper/FilterType;)I
    .locals 2

    sget-object v0, Lcom/android/camera/effect/BeautyInfoFactory$1;->$SwitchMap$com$miui$filtersdk$filter$helper$FilterType:[I

    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    const/16 v1, 0x46

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    const/16 p0, 0x64

    return p0

    :pswitch_0
    const/16 p0, 0x50

    return p0

    :pswitch_1
    return v1

    :pswitch_2
    const/16 p0, 0x3c

    return p0

    :cond_0
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x19
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static getIndiaFilterDegree(Lcom/miui/filtersdk/filter/helper/FilterType;)I
    .locals 2

    sget-object v0, Lcom/android/camera/effect/BeautyInfoFactory$1;->$SwitchMap$com$miui$filtersdk$filter$helper$FilterType:[I

    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/16 v0, 0xd

    const/16 v1, 0x50

    if-eq p0, v0, :cond_0

    const/16 v0, 0x10

    if-eq p0, v0, :cond_0

    const/16 v0, 0x46

    packed-switch p0, :pswitch_data_0

    const/16 p0, 0x64

    return p0

    :pswitch_0
    return v0

    :pswitch_1
    return v1

    :pswitch_2
    return v0

    :pswitch_3
    const/16 p0, 0x3c

    return p0

    :cond_0
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x19
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static initBeautyFilterInfo()Ljava/util/ArrayList;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/effect/FilterInfo;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    nop

    new-instance v1, Lcom/android/camera/effect/FilterInfo;

    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    const/4 v3, 0x0

    const v4, 0x7f09006f

    const v5, 0x7f0201d5

    invoke-direct {v1, v2, v4, v5, v3}, Lcom/android/camera/effect/FilterInfo;-><init>(IIII)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;->BEAUTY:Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;

    invoke-static {v1}, Lcom/miui/filtersdk/filter/helper/FilterFactory;->getFiltersByScene(Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;)[Lcom/miui/filtersdk/filter/helper/FilterType;

    move-result-object v1

    nop

    nop

    array-length v2, v1

    move v4, v3

    move v5, v4

    move v6, v5

    move v7, v6

    :goto_0
    if-ge v4, v2, :cond_1

    aget-object v8, v1, v4

    sget-object v9, Lcom/android/camera/effect/BeautyInfoFactory$1;->$SwitchMap$com$miui$filtersdk$filter$helper$FilterType:[I

    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_0

    move v12, v5

    move v13, v6

    move v5, v7

    goto/16 :goto_2

    :pswitch_0
    const/16 v5, 0x96

    const v6, 0x7f09008b

    const v7, 0x7f0201cd

    goto :goto_1

    :pswitch_1
    const/16 v5, 0x8c

    const v6, 0x7f090091

    const v7, 0x7f0201cf

    goto :goto_1

    :pswitch_2
    const/16 v5, 0x82

    const v6, 0x7f090090

    const v7, 0x7f0201ce

    goto :goto_1

    :pswitch_3
    const/16 v5, 0x78

    const v6, 0x7f09008f

    const v7, 0x7f0201d0

    goto :goto_1

    :pswitch_4
    const/16 v5, 0x6e

    const v6, 0x7f09008e

    const v7, 0x7f0201d3

    goto :goto_1

    :pswitch_5
    const/16 v5, 0x64

    const v6, 0x7f09008d

    const v7, 0x7f0201d7

    goto :goto_1

    :pswitch_6
    const/16 v5, 0x50

    const v6, 0x7f090089

    const v7, 0x7f0201d1

    goto :goto_1

    :pswitch_7
    const/16 v5, 0x32

    const v6, 0x7f090084

    const v7, 0x7f0201cb

    goto :goto_1

    :pswitch_8
    const/16 v5, 0x28

    const v6, 0x7f09008c

    const v7, 0x7f0201d9

    goto :goto_1

    :pswitch_9
    const/16 v5, 0x1e

    const v6, 0x7f090085

    const v7, 0x7f0201d6

    goto :goto_1

    :pswitch_a
    const/16 v5, 0x14

    const v6, 0x7f090086

    const v7, 0x7f0201cc

    goto :goto_1

    :pswitch_b
    const/16 v5, 0xa

    const v6, 0x7f090083

    const v7, 0x7f0201d4

    nop

    :goto_1
    move v12, v6

    move v13, v7

    :goto_2
    if-eqz v12, :cond_0

    if-eqz v13, :cond_0

    new-instance v6, Lcom/android/camera/effect/FilterInfo;

    const/4 v10, 0x2

    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v11

    move-object v9, v6

    move v14, v5

    invoke-direct/range {v9 .. v14}, Lcom/android/camera/effect/FilterInfo;-><init>(IIIII)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    nop

    nop

    move v6, v3

    move v12, v6

    goto :goto_3

    :cond_0
    move v6, v13

    :goto_3
    add-int/lit8 v4, v4, 0x1

    move v7, v5

    move v5, v12

    goto/16 :goto_0

    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static initIndiaBeautyFilterInfo()Ljava/util/ArrayList;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/effect/FilterInfo;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    nop

    new-instance v1, Lcom/android/camera/effect/FilterInfo;

    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    const/4 v3, 0x0

    const v4, 0x7f09006f

    const v5, 0x7f0201e2

    invoke-direct {v1, v2, v4, v5, v3}, Lcom/android/camera/effect/FilterInfo;-><init>(IIII)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;->BEAUTY_INDIA:Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;

    invoke-static {v1}, Lcom/miui/filtersdk/filter/helper/FilterFactory;->getFiltersByScene(Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;)[Lcom/miui/filtersdk/filter/helper/FilterType;

    move-result-object v1

    nop

    nop

    array-length v2, v1

    move v4, v3

    move v5, v4

    move v6, v5

    move v7, v6

    :goto_0
    if-ge v4, v2, :cond_1

    aget-object v8, v1, v4

    sget-object v9, Lcom/android/camera/effect/BeautyInfoFactory$1;->$SwitchMap$com$miui$filtersdk$filter$helper$FilterType:[I

    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_0

    move v12, v5

    move v13, v6

    move v5, v7

    goto/16 :goto_2

    :pswitch_0
    const/16 v5, 0xa0

    const v6, 0x7f09008b

    const v7, 0x7f0201db

    goto :goto_1

    :pswitch_1
    const/16 v5, 0x96

    const v6, 0x7f090091

    const v7, 0x7f0201de

    goto :goto_1

    :pswitch_2
    const/16 v5, 0x8c

    const v6, 0x7f09008f

    const v7, 0x7f0201df

    goto :goto_1

    :pswitch_3
    const/16 v5, 0x82

    const v6, 0x7f090090

    const v7, 0x7f0201dd

    goto :goto_1

    :pswitch_4
    const/16 v5, 0x78

    const v6, 0x7f090092

    const v7, 0x7f0201dc

    goto :goto_1

    :pswitch_5
    const/16 v5, 0x64

    const v6, 0x7f090393

    const v7, 0x7f0201e6

    goto :goto_1

    :pswitch_6
    const/16 v5, 0x50

    const v6, 0x7f090391

    const v7, 0x7f0201e5

    goto :goto_1

    :pswitch_7
    const/16 v5, 0x32

    const v6, 0x7f09038e

    const v7, 0x7f0201ea

    goto :goto_1

    :pswitch_8
    const/16 v5, 0x28

    const v6, 0x7f09038d

    const v7, 0x7f0201e7

    goto :goto_1

    :pswitch_9
    const/16 v5, 0x1e

    const v6, 0x7f09038c

    const v7, 0x7f0201e0

    goto :goto_1

    :pswitch_a
    const/16 v5, 0x14

    const v6, 0x7f09038b

    const v7, 0x7f0201e3

    goto :goto_1

    :pswitch_b
    const/16 v5, 0xa

    const v6, 0x7f09038a

    const v7, 0x7f0201e8

    nop

    :goto_1
    move v12, v6

    move v13, v7

    :goto_2
    if-eqz v12, :cond_0

    if-eqz v13, :cond_0

    new-instance v6, Lcom/android/camera/effect/FilterInfo;

    const/4 v10, 0x2

    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v11

    move-object v9, v6

    move v14, v5

    invoke-direct/range {v9 .. v14}, Lcom/android/camera/effect/FilterInfo;-><init>(IIIII)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    nop

    nop

    move v6, v3

    move v12, v6

    goto :goto_3

    :cond_0
    move v6, v13

    :goto_3
    add-int/lit8 v4, v4, 0x1

    move v7, v5

    move v5, v12

    goto/16 :goto_0

    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0xd
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
