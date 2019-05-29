.class public Lcom/android/camera/constant/BeautyConstant;
.super Ljava/lang/Object;
.source "BeautyConstant.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/constant/BeautyConstant$Type;,
        Lcom/android/camera/constant/BeautyConstant$BeautyVersion;
    }
.end annotation


# static fields
.field public static final AI_HUMAN_BEAUTY_SMOOTH_LEVEL:I = 0xa

.field public static final BEAUTY_CATEGORY_BACK_FIGURE:[Ljava/lang/String;

.field public static final BEAUTY_CATEGORY_FRONT_ADVANCE:[Ljava/lang/String;

.field public static final BEAUTY_CATEGORY_FRONT_MAKEUP:[Ljava/lang/String;

.field public static final BEAUTY_CATEGORY_FRONT_REMODELING:[Ljava/lang/String;

.field public static final BEAUTY_CATEGORY_LEVEL:[Ljava/lang/String;

.field public static final BEAUTY_CATEGORY_LIVE:[Ljava/lang/String;

.field public static final BEAUTY_INVALID_VALUE:I = 0x0

.field public static final BEAUTY_LEVEL:Ljava/lang/String; = "pref_beautify_level_key_capture"

.field public static final BEAUTY_RESET:Ljava/lang/String; = "RESET"

.field public static final BLUSHER_RATIO:Ljava/lang/String; = "pref_beautify_blusher_ratio_key"

.field public static final BODY_SLIM_RATIO:Ljava/lang/String; = "pref_beauty_body_slim_ratio"

.field public static final BUTT_SLIM_RATIO:Ljava/lang/String; = "pref_beauty_butt_slim_ratio"

.field public static final CHIN_RATIO:Ljava/lang/String; = "pref_beautify_chin_ratio_key"

.field public static final ENLARGE_EYE_RATIO:Ljava/lang/String; = "pref_beautify_enlarge_eye_ratio_key"

.field public static final EYEBROW_DYE_RATIO:Ljava/lang/String; = "pref_beautify_eyebrow_dye_ratio_key"

.field public static final EYE_LIGHT:Ljava/lang/String; = "pref_eye_light_type_key"

.field public static final HAIRLINE_RATIO:Ljava/lang/String; = "pref_beautify_hairline_ratio_key"

.field public static final HEAD_SLIM_RATIO:Ljava/lang/String; = "pref_beauty_head_slim_ratio"

.field public static final JELLY_LIPS_RATIO:Ljava/lang/String; = "pref_beautify_jelly_lips_ratio_key"

.field public static final LEG_SLIM_RATIO:Ljava/lang/String; = "key_beauty_leg_slim_ratio"

.field public static final LEVEL_CLOSE:Ljava/lang/String; = "i:0"

.field public static final LEVEL_HIGH:Ljava/lang/String; = "i:3"

.field public static final LEVEL_LOW:Ljava/lang/String; = "i:1"

.field public static final LEVEL_MEDIUM:Ljava/lang/String; = "i:2"

.field public static final LEVEL_XHIGH:Ljava/lang/String; = "i:4"

.field public static final LEVEL_XXHIGH:Ljava/lang/String; = "i:5"

.field public static final LEVEL_XXXHIGH:Ljava/lang/String; = "i:6"

.field public static final LIPS_RATIO:Ljava/lang/String; = "pref_beautify_lips_ratio_key"

.field public static final LIVE_ENLARGE_EYE_RATIO:Ljava/lang/String; = "key_live_enlarge_eye_ratio"

.field public static final LIVE_SHRINK_FACE_RATIO:Ljava/lang/String; = "key_live_shrink_face_ratio"

.field public static final LIVE_SMOOTH_STRENGTH:Ljava/lang/String; = "key_live_smooth_strength"

.field public static final NECK_RATIO:Ljava/lang/String; = "pref_beautify_neck_ratio_key"

.field public static final NOSE_RATIO:Ljava/lang/String; = "pref_beautify_nose_ratio_key"

.field public static final PREFIX_BEAUTY_LEVEL:Ljava/lang/String; = "i:"

.field public static final PUPIL_LINE_RATIO:Ljava/lang/String; = "pref_beautify_pupil_line_ratio_key"

.field public static final RISORIUS_RATIO:Ljava/lang/String; = "pref_beautify_risorius_ratio_key"

.field public static final SHOULDER_SLIM_RATIO:Ljava/lang/String; = "pref_beauty_shoulder_slim_ratio"

.field public static final SHRINK_FACE_RATIO:Ljava/lang/String; = "pref_beautify_slim_face_ratio_key"

.field public static final SLIM_NOSE_RATIO:Ljava/lang/String; = "pref_beautify_slim_nose_ratio_key"

.field public static final SMILE_RATIO:Ljava/lang/String; = "pref_beautify_smile_ratio_key"

.field public static final SMOOTH_STRENGTH:Ljava/lang/String; = "pref_beautify_skin_smooth_ratio_key"

.field public static final VERSION_DEPEND_LEVEL:I = 0x2

.field public static final VERSION_DEPEND_SMOOTH_SKIN:I = 0x3

.field public static final VERSION_LEGACY:I = 0x1

.field public static final WHITEN_STRENGTH:Ljava/lang/String; = "pref_beautify_skin_color_ratio_key"

.field public static final WHOLE_BODY_SLIM_RATIO:Ljava/lang/String; = "pref_beauty_whole_body_slim_ratio"


# direct methods
.method static constructor <clinit>()V
    .locals 11

    const-string v0, "pref_beautify_level_key_capture"

    const-string v1, "pref_beautify_skin_smooth_ratio_key"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/BeautyConstant;->BEAUTY_CATEGORY_LEVEL:[Ljava/lang/String;

    const-string v0, "pref_beauty_whole_body_slim_ratio"

    const-string v1, "key_beauty_leg_slim_ratio"

    const-string v2, "pref_beauty_head_slim_ratio"

    const-string v3, "pref_beauty_body_slim_ratio"

    const-string v4, "pref_beauty_shoulder_slim_ratio"

    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/BeautyConstant;->BEAUTY_CATEGORY_BACK_FIGURE:[Ljava/lang/String;

    const-string v0, "pref_beautify_eyebrow_dye_ratio_key"

    const-string v1, "pref_beautify_pupil_line_ratio_key"

    const-string v2, "pref_beautify_jelly_lips_ratio_key"

    const-string v3, "pref_eye_light_type_key"

    const-string v4, "pref_beautify_blusher_ratio_key"

    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/BeautyConstant;->BEAUTY_CATEGORY_FRONT_MAKEUP:[Ljava/lang/String;

    const-string v1, "pref_beautify_slim_face_ratio_key"

    const-string v2, "pref_beautify_enlarge_eye_ratio_key"

    const-string v3, "pref_beautify_nose_ratio_key"

    const-string v4, "pref_beautify_chin_ratio_key"

    const-string v5, "pref_beautify_lips_ratio_key"

    const-string v6, "pref_beautify_risorius_ratio_key"

    const-string v7, "pref_beautify_neck_ratio_key"

    const-string v8, "pref_beautify_smile_ratio_key"

    const-string v9, "pref_beautify_slim_nose_ratio_key"

    const-string v10, "pref_beautify_hairline_ratio_key"

    filled-new-array/range {v1 .. v10}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/BeautyConstant;->BEAUTY_CATEGORY_FRONT_REMODELING:[Ljava/lang/String;

    const-string v0, "pref_beautify_skin_smooth_ratio_key"

    const-string v1, "pref_beautify_slim_face_ratio_key"

    const-string v2, "pref_beautify_enlarge_eye_ratio_key"

    const-string v3, "pref_beautify_skin_color_ratio_key"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/BeautyConstant;->BEAUTY_CATEGORY_FRONT_ADVANCE:[Ljava/lang/String;

    const-string v0, "key_live_shrink_face_ratio"

    const-string v1, "key_live_enlarge_eye_ratio"

    const-string v2, "key_live_smooth_strength"

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/BeautyConstant;->BEAUTY_CATEGORY_LIVE:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDefaultValueByKey(Ljava/lang/String;)I
    .locals 3

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x0

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "key_live_enlarge_eye_ratio"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x4

    goto :goto_1

    :sswitch_1
    const-string v0, "pref_beautify_skin_smooth_ratio_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_1

    :sswitch_2
    const-string v0, "pref_beautify_slim_face_ratio_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x2

    goto :goto_1

    :sswitch_3
    const-string v0, "pref_beautify_level_key_capture"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    move p0, v2

    goto :goto_1

    :sswitch_4
    const-string v0, "key_live_shrink_face_ratio"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    move p0, v1

    goto :goto_1

    :sswitch_5
    const-string v0, "key_live_smooth_strength"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x5

    goto :goto_1

    :cond_0
    :goto_0
    const/4 p0, -0x1

    :goto_1
    const/16 v0, 0x28

    packed-switch p0, :pswitch_data_0

    return v2

    :pswitch_0
    return v0

    :pswitch_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result p0

    if-eqz p0, :cond_1

    goto :goto_2

    :cond_1
    move v0, v2

    :goto_2
    return v0

    :pswitch_2
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoModule()Z

    move-result p0

    if-eqz p0, :cond_2

    return v2

    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result p0

    if-eqz p0, :cond_3

    goto :goto_3

    :cond_3
    move v0, v2

    :goto_3
    return v0

    :pswitch_3
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoModule()Z

    move-result p0

    if-eqz p0, :cond_4

    return v2

    :cond_4
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result p0

    if-eqz p0, :cond_5

    goto :goto_4

    :cond_5
    move v1, v2

    :goto_4
    return v1

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7dcb43c1 -> :sswitch_5
        0xa78ecec -> :sswitch_4
        0x311292c7 -> :sswitch_3
        0x35532ea7 -> :sswitch_2
        0x36aaa8f8 -> :sswitch_1
        0x699265fd -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static getLevelInteger(Ljava/lang/String;)I
    .locals 1

    :try_start_0
    const-string v0, ":"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x1

    aget-object p0, p0, v0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 p0, 0x0

    return p0
.end method

.method public static isLiveBeautyModeKey(Ljava/lang/String;)Z
    .locals 4

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, -0x7dcb43c1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v0, v1, :cond_2

    const v1, 0xa78ecec

    if-eq v0, v1, :cond_1

    const v1, 0x699265fd

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "key_live_enlarge_eye_ratio"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    move p0, v3

    goto :goto_1

    :cond_1
    const-string v0, "key_live_shrink_face_ratio"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    move p0, v2

    goto :goto_1

    :cond_2
    const-string v0, "key_live_smooth_strength"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    const/4 p0, 0x2

    goto :goto_1

    :cond_3
    :goto_0
    const/4 p0, -0x1

    :goto_1
    packed-switch p0, :pswitch_data_0

    return v2

    :pswitch_0
    return v3

    :pswitch_1
    return v3

    :pswitch_2
    return v3

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static isSupportTwoWayAdjustable(Ljava/lang/String;)Z
    .locals 4

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, -0x12884130

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v0, v1, :cond_1

    const v1, -0x102a61a6

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "pref_beautify_chin_ratio_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    move p0, v3

    goto :goto_1

    :cond_1
    const-string v0, "pref_beautify_lips_ratio_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    move p0, v2

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p0, -0x1

    :goto_1
    packed-switch p0, :pswitch_data_0

    return v3

    :pswitch_0
    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static warppedSettingForLive(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    return-object p0
.end method

.method public static wrappedSettingKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->getActiveModuleIndex()I

    move-result v0

    const/16 v1, 0xa1

    if-eq v0, v1, :cond_2

    const/16 v1, 0xa3

    if-eq v0, v1, :cond_1

    const/16 v1, 0xa5

    if-eq v0, v1, :cond_1

    const/16 v1, 0xa7

    if-eq v0, v1, :cond_1

    const/16 v1, 0xab

    if-eq v0, v1, :cond_0

    packed-switch v0, :pswitch_data_0

    invoke-static {p0}, Lcom/android/camera/constant/BeautyConstant;->wrappedSettingKeyForVideo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_0
    invoke-static {p0}, Lcom/android/camera/constant/BeautyConstant;->wrappedSettingKeyForMimoji(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1
    invoke-static {p0}, Lcom/android/camera/constant/BeautyConstant;->wrappedSettingKeyForWideSelfie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_2
    invoke-static {p0}, Lcom/android/camera/constant/BeautyConstant;->warppedSettingForLive(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-static {p0}, Lcom/android/camera/constant/BeautyConstant;->wrappedSettingKeyForPortrait(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    :pswitch_3
    invoke-static {p0}, Lcom/android/camera/constant/BeautyConstant;->wrappedSettingKeyForCapture(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    invoke-static {p0}, Lcom/android/camera/constant/BeautyConstant;->wrappedSettingKeyForFun(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_0
    .packed-switch 0xad
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static wrappedSettingKeyForCapture(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0xa3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static wrappedSettingKeyForFun(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static wrappedSettingKeyForMimoji(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0xb1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static wrappedSettingKeyForPortrait(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0xab

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static wrappedSettingKeyForVideo(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static wrappedSettingKeyForWideSelfie(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0xb0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
