.class public Lcom/android/camera/data/data/runing/TypeElementsBeauty;
.super Lcom/android/camera/data/data/TypeElements;
.source "TypeElementsBeauty.java"


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/runing/ComponentRunningShine;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/data/data/TypeElements;-><init>(Lcom/android/camera/data/data/ComponentData;)V

    return-void
.end method

.method private createTypeItem(Ljava/lang/String;Ljava/lang/String;ZLcom/android/camera2/CameraCapabilities;)Lcom/android/camera/data/data/TypeItem;
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Lcom/android/camera/data/data/runing/ComponentRunningShine$ShineType;
        .end annotation
    .end param

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    invoke-direct {p0, p2, p4}, Lcom/android/camera/data/data/runing/TypeElementsBeauty;->supportType(Ljava/lang/String;Lcom/android/camera2/CameraCapabilities;)Z

    move-result p3

    if-nez p3, :cond_0

    return-object v0

    :cond_0
    const/4 p3, -0x1

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result p4

    sparse-switch p4, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string p4, "pref_beauty_head_slim_ratio"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/16 p3, 0x10

    goto/16 :goto_0

    :sswitch_1
    const-string p4, "key_live_enlarge_eye_ratio"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/16 p3, 0x17

    goto/16 :goto_0

    :sswitch_2
    const-string p4, "pref_beauty_shoulder_slim_ratio"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/16 p3, 0x12

    goto/16 :goto_0

    :sswitch_3
    const-string p4, "pref_beautify_pupil_line_ratio_key"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/16 p3, 0xc

    goto/16 :goto_0

    :sswitch_4
    const-string p4, "pref_beautify_blusher_ratio_key"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/16 p3, 0xe

    goto/16 :goto_0

    :sswitch_5
    const-string p4, "pref_beautify_skin_color_ratio_key"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/4 p3, 0x0

    goto/16 :goto_0

    :sswitch_6
    const-string p4, "pref_beautify_enlarge_eye_ratio_key"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/4 p3, 0x2

    goto/16 :goto_0

    :sswitch_7
    const-string p4, "pref_beautify_nose_ratio_key"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/4 p3, 0x4

    goto/16 :goto_0

    :sswitch_8
    const-string p4, "pref_eye_light_type_key"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/16 p3, 0xf

    goto/16 :goto_0

    :sswitch_9
    const-string p4, "pref_beautify_skin_smooth_ratio_key"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/4 p3, 0x3

    goto/16 :goto_0

    :sswitch_a
    const-string p4, "pref_beautify_slim_face_ratio_key"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/4 p3, 0x1

    goto/16 :goto_0

    :sswitch_b
    const-string p4, "key_live_shrink_face_ratio"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/16 p3, 0x16

    goto/16 :goto_0

    :sswitch_c
    const-string p4, "pref_beautify_risorius_ratio_key"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/4 p3, 0x5

    goto/16 :goto_0

    :sswitch_d
    const-string p4, "key_beauty_leg_slim_ratio"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/16 p3, 0x13

    goto/16 :goto_0

    :sswitch_e
    const-string p4, "pref_beautify_chin_ratio_key"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/4 p3, 0x7

    goto/16 :goto_0

    :sswitch_f
    const-string p4, "pref_beautify_lips_ratio_key"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/4 p3, 0x6

    goto :goto_0

    :sswitch_10
    const-string p4, "pref_beautify_neck_ratio_key"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/16 p3, 0x8

    goto :goto_0

    :sswitch_11
    const-string p4, "pref_beautify_slim_nose_ratio_key"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/16 p3, 0xa

    goto :goto_0

    :sswitch_12
    const-string p4, "pref_beautify_eyebrow_dye_ratio_key"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/16 p3, 0xb

    goto :goto_0

    :sswitch_13
    const-string p4, "pref_beautify_smile_ratio_key"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/16 p3, 0x9

    goto :goto_0

    :sswitch_14
    const-string p4, "pref_beauty_whole_body_slim_ratio"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/16 p3, 0x14

    goto :goto_0

    :sswitch_15
    const-string p4, "pref_beauty_butt_slim_ratio"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/16 p3, 0x15

    goto :goto_0

    :sswitch_16
    const-string p4, "pref_beautify_jelly_lips_ratio_key"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/16 p3, 0xd

    goto :goto_0

    :sswitch_17
    const-string p4, "pref_beauty_body_slim_ratio"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/16 p3, 0x11

    goto :goto_0

    :sswitch_18
    const-string p4, "key_live_smooth_strength"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/16 p3, 0x18

    :cond_1
    :goto_0
    const p4, 0x7f0201a6

    const v1, 0x7f0901dc

    const v2, 0x7f020199

    const v3, 0x7f0901db

    const v4, 0x7f020196

    const v5, 0x7f0901da

    const v6, 0x7f0201a8

    packed-switch p3, :pswitch_data_0

    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "to be continued"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    invoke-direct {p3, v6, v5, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_1
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    invoke-direct {p3, v4, v3, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_2
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    invoke-direct {p3, v2, v1, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_3
    return-object v0

    :pswitch_4
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    const p4, 0x7f0201af

    const v0, 0x7f090241

    invoke-direct {p3, p4, v0, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_5
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    const p4, 0x7f02019c

    const v0, 0x7f090240

    invoke-direct {p3, p4, v0, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_6
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    const p4, 0x7f0201a5

    const v0, 0x7f09023f

    invoke-direct {p3, p4, v0, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_7
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    const p4, 0x7f020192

    const v0, 0x7f09023e

    invoke-direct {p3, p4, v0, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_8
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    const p4, 0x7f02019a

    const v0, 0x7f09023d

    invoke-direct {p3, p4, v0, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_9
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    const p4, 0x7f020197

    const v0, 0x7f090219

    invoke-direct {p3, p4, v0, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_a
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    const p4, 0x7f020191

    const v0, 0x7f09023a

    invoke-direct {p3, p4, v0, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_b
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    const p4, 0x7f02019b

    const v0, 0x7f090239

    invoke-direct {p3, p4, v0, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_c
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    const p4, 0x7f0201a3

    const v0, 0x7f090238

    invoke-direct {p3, p4, v0, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_d
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    const p4, 0x7f020198

    const v0, 0x7f090237

    invoke-direct {p3, p4, v0, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_e
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    const p4, 0x7f0201a7

    const v0, 0x7f0901e3

    invoke-direct {p3, p4, v0, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_f
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    const v0, 0x7f0901e2

    invoke-direct {p3, p4, v0, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_10
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    const p4, 0x7f0201a1

    const v0, 0x7f0901e1

    invoke-direct {p3, p4, v0, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_11
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    const p4, 0x7f020193

    const v0, 0x7f0901e0

    invoke-direct {p3, p4, v0, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_12
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    const p4, 0x7f02019d

    const v0, 0x7f0901df

    invoke-direct {p3, p4, v0, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_13
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    const p4, 0x7f0201a4

    const v0, 0x7f0901de

    invoke-direct {p3, p4, v0, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_14
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    const p4, 0x7f0201a2

    const v0, 0x7f0901dd

    invoke-direct {p3, p4, v0, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_15
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    invoke-direct {p3, v6, v5, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_16
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    invoke-direct {p3, v4, v3, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_17
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    invoke-direct {p3, v2, v1, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :pswitch_18
    new-instance p3, Lcom/android/camera/data/data/TypeItem;

    const v0, 0x7f0901d9

    invoke-direct {p3, p4, v0, p1, p2}, Lcom/android/camera/data/data/TypeItem;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object p3

    :sswitch_data_0
    .sparse-switch
        -0x7dcb43c1 -> :sswitch_18
        -0x676e6ee1 -> :sswitch_17
        -0x5e6b0daf -> :sswitch_16
        -0x5a8387f2 -> :sswitch_15
        -0x4b3d8c29 -> :sswitch_14
        -0x423823b0 -> :sswitch_13
        -0x3926c11e -> :sswitch_12
        -0x3579d363 -> :sswitch_11
        -0x1403c3d1 -> :sswitch_10
        -0x12884130 -> :sswitch_f
        -0x102a61a6 -> :sswitch_e
        -0x8bc7263 -> :sswitch_d
        -0x25d6108 -> :sswitch_c
        0xa78ecec -> :sswitch_b
        0x35532ea7 -> :sswitch_a
        0x36aaa8f8 -> :sswitch_9
        0x3832544d -> :sswitch_8
        0x3ad8a2a3 -> :sswitch_7
        0x3e8271ec -> :sswitch_6
        0x3f0b1471 -> :sswitch_5
        0x5514d1b5 -> :sswitch_4
        0x6202ad75 -> :sswitch_3
        0x65e369e1 -> :sswitch_2
        0x699265fd -> :sswitch_1
        0x73f08a21 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
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

.method private initAdvanceItems(Ljava/util/List;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera/data/data/runing/ComponentRunningShine;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/TypeItem;",
            ">;I",
            "Lcom/android/camera2/CameraCapabilities;",
            "Lcom/android/camera/data/data/runing/ComponentRunningShine;",
            ")V"
        }
    .end annotation

    const-string p2, "pref_beautify_slim_face_ratio_key"

    const-string p4, "pref_beautify_enlarge_eye_ratio_key"

    const-string v0, "pref_beautify_skin_color_ratio_key"

    const-string v1, "pref_beautify_skin_smooth_ratio_key"

    filled-new-array {p2, p4, v0, v1}, [Ljava/lang/String;

    move-result-object v4

    const-string v3, "3"

    const/4 v6, 0x1

    move-object v2, p0

    move-object v5, p1

    move-object v7, p3

    invoke-direct/range {v2 .. v7}, Lcom/android/camera/data/data/runing/TypeElementsBeauty;->initItemsBySupportedTypes(Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;ZLcom/android/camera2/CameraCapabilities;)V

    return-void
.end method

.method private initFigureItems(Ljava/util/List;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera/data/data/runing/ComponentRunningShine;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/TypeItem;",
            ">;I",
            "Lcom/android/camera2/CameraCapabilities;",
            "Lcom/android/camera/data/data/runing/ComponentRunningShine;",
            ")V"
        }
    .end annotation

    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->BEAUTY_CATEGORY_BACK_FIGURE:[Ljava/lang/String;

    const-string v1, "6"

    const/4 v4, 0x1

    move-object v0, p0

    move-object v3, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/data/data/runing/TypeElementsBeauty;->initItemsBySupportedTypes(Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;ZLcom/android/camera2/CameraCapabilities;)V

    invoke-virtual {p4}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->isSmoothDependBeautyVersion()Z

    move-result p2

    if-eqz p2, :cond_0

    const-string p2, "4"

    const-string p4, "pref_beautify_skin_smooth_ratio_key"

    const/4 v0, 0x1

    invoke-direct {p0, p2, p4, v0, p3}, Lcom/android/camera/data/data/runing/TypeElementsBeauty;->createTypeItem(Ljava/lang/String;Ljava/lang/String;ZLcom/android/camera2/CameraCapabilities;)Lcom/android/camera/data/data/TypeItem;

    move-result-object p2

    if-eqz p2, :cond_0

    const/4 p3, 0x0

    invoke-interface {p1, p3, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private initItemsBySupportedTypes(Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;ZLcom/android/camera2/CameraCapabilities;)V
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Lcom/android/camera/data/data/runing/ComponentRunningShine$ShineType;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/TypeItem;",
            ">;Z",
            "Lcom/android/camera2/CameraCapabilities;",
            ")V"
        }
    .end annotation

    array-length v0, p2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p2, v1

    invoke-direct {p0, p1, v2, p4, p5}, Lcom/android/camera/data/data/runing/TypeElementsBeauty;->createTypeItem(Ljava/lang/String;Ljava/lang/String;ZLcom/android/camera2/CameraCapabilities;)Lcom/android/camera/data/data/TypeItem;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-interface {p3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private initLiveBeautyItems(Ljava/util/List;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera/data/data/runing/ComponentRunningShine;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/TypeItem;",
            ">;I",
            "Lcom/android/camera2/CameraCapabilities;",
            "Lcom/android/camera/data/data/runing/ComponentRunningShine;",
            ")V"
        }
    .end annotation

    const-string p2, "key_live_smooth_strength"

    const-string p4, "key_live_shrink_face_ratio"

    const-string v0, "key_live_enlarge_eye_ratio"

    filled-new-array {p2, p4, v0}, [Ljava/lang/String;

    move-result-object v3

    const-string v2, "11"

    const/4 v5, 0x0

    move-object v1, p0

    move-object v4, p1

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/android/camera/data/data/runing/TypeElementsBeauty;->initItemsBySupportedTypes(Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;ZLcom/android/camera2/CameraCapabilities;)V

    return-void
.end method

.method private initMakeUpItems(Ljava/util/List;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera/data/data/runing/ComponentRunningShine;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/TypeItem;",
            ">;I",
            "Lcom/android/camera2/CameraCapabilities;",
            "Lcom/android/camera/data/data/runing/ComponentRunningShine;",
            ")V"
        }
    .end annotation

    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->BEAUTY_CATEGORY_FRONT_MAKEUP:[Ljava/lang/String;

    const/4 p4, 0x1

    if-ne p2, p4, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p2

    invoke-virtual {p2}, Lcom/mi/config/a;->fD()Z

    move-result p2

    if-nez p2, :cond_1

    :cond_0
    const/4 p2, 0x3

    const/4 p4, 0x0

    aput-object p4, v2, p2

    :cond_1
    const-string v1, "5"

    const/4 v4, 0x1

    move-object v0, p0

    move-object v3, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/data/data/runing/TypeElementsBeauty;->initItemsBySupportedTypes(Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;ZLcom/android/camera2/CameraCapabilities;)V

    return-void
.end method

.method private initReModelingItems(Ljava/util/List;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera/data/data/runing/ComponentRunningShine;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/TypeItem;",
            ">;I",
            "Lcom/android/camera2/CameraCapabilities;",
            "Lcom/android/camera/data/data/runing/ComponentRunningShine;",
            ")V"
        }
    .end annotation

    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->BEAUTY_CATEGORY_FRONT_REMODELING:[Ljava/lang/String;

    const-string v1, "4"

    const/4 v4, 0x1

    move-object v0, p0

    move-object v3, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/data/data/runing/TypeElementsBeauty;->initItemsBySupportedTypes(Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;ZLcom/android/camera2/CameraCapabilities;)V

    invoke-virtual {p4}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->isSmoothDependBeautyVersion()Z

    move-result p2

    if-eqz p2, :cond_0

    const-string p2, "4"

    const-string p4, "pref_beautify_skin_smooth_ratio_key"

    const/4 v0, 0x1

    invoke-direct {p0, p2, p4, v0, p3}, Lcom/android/camera/data/data/runing/TypeElementsBeauty;->createTypeItem(Ljava/lang/String;Ljava/lang/String;ZLcom/android/camera2/CameraCapabilities;)Lcom/android/camera/data/data/TypeItem;

    move-result-object p2

    if-eqz p2, :cond_0

    const/4 p3, 0x0

    invoke-interface {p1, p3, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private supportType(Ljava/lang/String;Lcom/android/camera2/CameraCapabilities;)Z
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p2, p1}, Lcom/android/camera2/CameraCapabilities;->isSupportBeautyType(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method


# virtual methods
.method public initAndGetSupportItems(ILcom/android/camera2/CameraCapabilities;Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .param p3    # Ljava/lang/String;
        .annotation build Lcom/android/camera/data/data/runing/ComponentRunningShine$ShineType;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/android/camera2/CameraCapabilities;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/TypeItem;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/data/data/runing/TypeElementsBeauty;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    check-cast v0, Lcom/android/camera/data/data/runing/ComponentRunningShine;

    nop

    nop

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, -0x1

    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/16 v4, 0x620

    if-eq v3, v4, :cond_0

    packed-switch v3, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const-string v3, "6"

    invoke-virtual {p3, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_1

    const/4 v2, 0x3

    goto :goto_0

    :pswitch_1
    const-string v3, "5"

    invoke-virtual {p3, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_1

    const/4 v2, 0x2

    goto :goto_0

    :pswitch_2
    const-string v3, "4"

    invoke-virtual {p3, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :pswitch_3
    const-string v3, "3"

    invoke-virtual {p3, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_1

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    const-string v3, "11"

    invoke-virtual {p3, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_1

    const/4 v2, 0x4

    :cond_1
    :goto_0
    packed-switch v2, :pswitch_data_1

    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "to be continued"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_4
    invoke-direct {p0, v1, p1, p2, v0}, Lcom/android/camera/data/data/runing/TypeElementsBeauty;->initLiveBeautyItems(Ljava/util/List;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera/data/data/runing/ComponentRunningShine;)V

    goto :goto_1

    :pswitch_5
    invoke-direct {p0, v1, p1, p2, v0}, Lcom/android/camera/data/data/runing/TypeElementsBeauty;->initFigureItems(Ljava/util/List;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera/data/data/runing/ComponentRunningShine;)V

    goto :goto_1

    :pswitch_6
    invoke-direct {p0, v1, p1, p2, v0}, Lcom/android/camera/data/data/runing/TypeElementsBeauty;->initMakeUpItems(Ljava/util/List;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera/data/data/runing/ComponentRunningShine;)V

    goto :goto_1

    :pswitch_7
    invoke-direct {p0, v1, p1, p2, v0}, Lcom/android/camera/data/data/runing/TypeElementsBeauty;->initReModelingItems(Ljava/util/List;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera/data/data/runing/ComponentRunningShine;)V

    goto :goto_1

    :pswitch_8
    invoke-direct {p0, v1, p1, p2, v0}, Lcom/android/camera/data/data/runing/TypeElementsBeauty;->initAdvanceItems(Ljava/util/List;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera/data/data/runing/ComponentRunningShine;)V

    nop

    :goto_1
    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x33
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method
