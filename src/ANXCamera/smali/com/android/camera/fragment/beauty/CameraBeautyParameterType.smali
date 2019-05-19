.class public Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;
.super Ljava/lang/Object;
.source "CameraBeautyParameterType.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final BLUSHER_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final BODY_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final BODY_SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final BUTT_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final EYEBROW_DYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final EYE_LIGHT:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final FACE_3D_CHIN_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final FACE_3D_ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final FACE_3D_LIPS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final FACE_3D_NECK_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final FACE_3D_NOSE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final FACE_3D_RISORIUS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final FACE_3D_SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final FACE_3D_SLIM_NOSE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final FACE_3D_SMILE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final FACE_3D_SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final HEAD_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final JELLY_LIPS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final LEG_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final LIVE_ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final LIVE_SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final LIVE_SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final PUPIL_LINE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final RESET:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final SHOULDER_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final WHITEN_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final WHOLE_BODY_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;


# instance fields
.field public beautyParamType:Ljava/lang/String;

.field public beautyType:I

.field public shineType:I
    .annotation build Lcom/android/camera/data/data/runing/ComponentRunningShine$ShineType;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "RESET"

    const/4 v2, 0x3

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->RESET:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beautify_skin_smooth_ratio_key"

    const/4 v3, 0x2

    invoke-direct {v0, v3, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beautify_skin_color_ratio_key"

    invoke-direct {v0, v3, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->WHITEN_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beautify_enlarge_eye_ratio_key"

    invoke-direct {v0, v3, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beautify_slim_face_ratio_key"

    invoke-direct {v0, v3, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beautify_skin_smooth_ratio_key"

    invoke-direct {v0, v3, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beautify_slim_face_ratio_key"

    invoke-direct {v0, v3, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beautify_enlarge_eye_ratio_key"

    invoke-direct {v0, v3, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beautify_nose_ratio_key"

    invoke-direct {v0, v3, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_NOSE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beautify_risorius_ratio_key"

    invoke-direct {v0, v3, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_RISORIUS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beautify_lips_ratio_key"

    invoke-direct {v0, v3, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_LIPS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beautify_chin_ratio_key"

    invoke-direct {v0, v3, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_CHIN_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beautify_neck_ratio_key"

    invoke-direct {v0, v3, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_NECK_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beautify_smile_ratio_key"

    invoke-direct {v0, v3, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_SMILE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beautify_slim_nose_ratio_key"

    invoke-direct {v0, v3, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_SLIM_NOSE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_eye_light_type_key"

    const/4 v3, 0x4

    invoke-direct {v0, v3, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->EYE_LIGHT:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beautify_eyebrow_dye_ratio_key"

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->EYEBROW_DYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beautify_pupil_line_ratio_key"

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->PUPIL_LINE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beautify_jelly_lips_ratio_key"

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->JELLY_LIPS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beautify_blusher_ratio_key"

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->BLUSHER_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beautify_skin_smooth_ratio_key"

    const/4 v2, 0x5

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->BODY_SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beauty_head_slim_ratio"

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->HEAD_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beauty_body_slim_ratio"

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->BODY_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beauty_shoulder_slim_ratio"

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->SHOULDER_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "key_beauty_leg_slim_ratio"

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->LEG_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beauty_whole_body_slim_ratio"

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->WHOLE_BODY_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "pref_beauty_butt_slim_ratio"

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->BUTT_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "key_live_shrink_face_ratio"

    const/4 v2, 0x7

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->LIVE_SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "key_live_enlarge_eye_ratio"

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->LIVE_ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const-string v1, "key_live_smooth_strength"

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->LIVE_SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    return-void
.end method

.method private constructor <init>(ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyType:I

    iput-object p2, p0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Ljava/lang/String;

    return-void
.end method
