.class public Lcom/android/camera/fragment/mimoji/AvatarEngineManager;
.super Ljava/lang/Object;
.source "AvatarEngineManager.java"


# static fields
.field public static final FACE_MODEL:Ljava/lang/String;

.field public static final PersonTemplatePath:Ljava/lang/String;

.field public static final THUMB_HEIGHT:I = 0xc8

.field public static final THUMB_WIDTH:I = 0xc8

.field public static final TRACK_DATA:Ljava/lang/String;

.field public static final TempEditConfigPath:Ljava/lang/String;

.field public static final TempOriginalConfigPath:Ljava/lang/String;

.field private static mInstance:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;


# instance fields
.field private mASAvatarConfigValue:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;

.field private mASAvatarConfigValueDefault:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;

.field private mAllNeedUpdate:Z

.field private mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

.field private mAvatarRef:I

.field private mConfigMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field private mInnerConfigSelectMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private mInterruptMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mIsColorSelected:Z

.field private mNeedUpdateMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mSelectTabIndex:I

.field private mSelectType:I

.field private mSubConfigs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/fragment/mimoji/MimojiLevelBean;",
            ">;"
        }
    .end annotation
.end field

.field private mTypeList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/android/camera/fragment/mimoji/MimojiHelper;->MIMOJI_DIR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "track_data.dat"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TRACK_DATA:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/android/camera/fragment/mimoji/MimojiHelper;->MIMOJI_DIR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "config.txt"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->FACE_MODEL:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/android/camera/fragment/mimoji/MimojiHelper;->MIMOJI_DIR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "model/cartoon_xiaomi_v_0_0_0_15"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/android/camera/fragment/mimoji/MimojiHelper;->MIMOJI_DIR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "origin_config.dat"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TempOriginalConfigPath:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/android/camera/fragment/mimoji/MimojiHelper;->MIMOJI_DIR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "edit_config.dat"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TempEditConfigPath:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSelectType:I

    iput v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSelectTabIndex:I

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mTypeList:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mConfigMap:Ljava/util/Map;

    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSubConfigs:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mNeedUpdateMap:Ljava/util/Map;

    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInterruptMap:Ljava/util/Map;

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAllNeedUpdate:Z

    iput v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatarRef:I

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mIsColorSelected:Z

    return-void
.end method

.method public static filterTypeTitle(I)Z
    .locals 2

    const/4 v0, 0x1

    if-eq p0, v0, :cond_0

    const/16 v1, 0xc

    if-eq p0, v1, :cond_0

    const/16 v1, 0xe

    if-eq p0, v1, :cond_0

    const/16 v1, 0x1c

    if-eq p0, v1, :cond_0

    packed-switch p0, :pswitch_data_0

    packed-switch p0, :pswitch_data_1

    return v0

    :cond_0
    :pswitch_0
    const/4 p0, 0x0

    return p0

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x13
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static declared-synchronized getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;
    .locals 2

    const-class v0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInstance:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-direct {v1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;-><init>()V

    sput-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInstance:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    :cond_0
    sget-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInstance:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static replaceTabTitle(Landroid/content/Context;I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/16 v0, 0xc

    if-eq p1, v0, :cond_2

    const/16 v0, 0xe

    if-eq p1, v0, :cond_1

    const/16 v0, 0x1c

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    const-string p0, ""

    return-object p0

    :pswitch_0
    const p1, 0x7f0902d7

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1
    const p1, 0x7f0902d5

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_2
    const p1, 0x7f0902d4

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_3
    const p1, 0x7f0902dc

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_4
    const p1, 0x7f0902d9

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const p1, 0x7f0902d6

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    const p1, 0x7f0902d8

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    const p1, 0x7f0902dd

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3
    const p1, 0x7f0902d3

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x13
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private resetInnerConfigSelectMap()V
    .locals 0

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getASAvatarConfigValueDefault()Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;

    return-void
.end method

.method public static showConfigTypeName(I)Z
    .locals 2

    const/4 v0, 0x1

    if-eq p0, v0, :cond_0

    const/16 v1, 0x9

    if-eq p0, v1, :cond_0

    const/16 v1, 0xe

    if-eq p0, v1, :cond_0

    const/16 v1, 0x1c

    if-eq p0, v1, :cond_0

    packed-switch p0, :pswitch_data_0

    return v0

    :cond_0
    :pswitch_0
    const/4 p0, 0x0

    return p0

    nop

    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public getASAvatarConfigValue()Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mASAvatarConfigValue:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;

    return-object v0
.end method

.method public getASAvatarConfigValueDefault()Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;
    .locals 5

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mASAvatarConfigValueDefault:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mASAvatarConfigValueDefault:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;

    sget-object v1, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "value \u5c5e\u6027:gender = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->gender:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configHairStyleID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairStyleID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configHairColorID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairColorID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configHairColorValue = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairColorValue:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " configFaceColorID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceColorID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configFaceColorValue = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceColorValue:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " configEyeColorID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeColorID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configEyeColorValue = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeColorValue:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " configLipColorID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configLipColorID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configLipColorValue = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configLipColorValue:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " configHairHighlightColorID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairHighlightColorID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configHairHighlightColorValue = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairHighlightColorValue:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " configFrecklesID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFrecklesID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configNevusID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configNevusID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configEyewearStyleID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearStyleID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configEyewearFrameID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearFrameID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configEyewearFrameValue = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearFrameValue:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " configEyewearLensesID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearLensesID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configEyewearLensesValue = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearLensesValue:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " configHeadwearStyleID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHeadwearStyleID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configHeadwearColorID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHeadwearColorID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configHeadwearColorValue = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHeadwearColorValue:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " configBeardStyleID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configBeardStyleID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configBeardColorID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configBeardColorID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configBeardColorValue = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configBeardColorValue:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " configEarringStyleID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEarringStyleID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configEyelashStyleID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyelashStyleID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configEyebrowColorID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowColorID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configEyebrowColorValue = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowColorValue:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " configFaceShapeID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceShapeID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configFaceShapeValue = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceShapeValue:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " configEyeShapeID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeShapeID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configEyeShapeValue = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeShapeValue:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " configMouthShapeID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configMouthShapeID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configMouthShapeValue = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configMouthShapeValue:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " configNoseShapeID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configNoseShapeID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configNoseShapeValue = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configNoseShapeValue:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " configEarShapeID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEarShapeID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configEarShapeValue = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEarShapeValue:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " configEyebrowShapeID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowShapeID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " configEyebrowShapeValue = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowShapeValue:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairStyleID:I

    int-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairColorID:I

    int-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceColorID:I

    int-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v2, 0x13

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceShapeID:I

    int-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeColorValue:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/4 v2, 0x5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configLipColorID:I

    int-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/4 v2, 0x7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFrecklesID:I

    int-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v2, 0x8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configNevusID:I

    int-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v2, 0x17

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget v4, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearStyleID:I

    int-to-float v4, v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v3, 0x9

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget v4, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHeadwearStyleID:I

    int-to-float v4, v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v3, 0xe

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget v4, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configBeardStyleID:I

    int-to-float v4, v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v3, 0xf

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget v4, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configBeardColorID:I

    int-to-float v4, v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEarringStyleID:I

    int-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v2, 0x11

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyelashStyleID:I

    int-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v2, 0x12

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowColorID:I

    int-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v2, 0x14

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeShapeID:I

    int-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v2, 0x15

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configMouthShapeID:I

    int-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v2, 0x18

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configNoseShapeID:I

    int-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v2, 0x1b

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEarShapeID:I

    int-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v2, 0x1c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v0, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowShapeID:I

    int-to-float v0, v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mASAvatarConfigValueDefault:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;

    return-object v0
.end method

.method public getColorType(I)I
    .locals 1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/16 v0, 0xc

    if-eq p1, v0, :cond_2

    const/16 v0, 0xe

    if-eq p1, v0, :cond_1

    const/16 v0, 0x1c

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    const/4 p1, -0x1

    return p1

    :pswitch_0
    const/16 p1, 0x18

    return p1

    :pswitch_1
    const/4 p1, 0x4

    return p1

    :pswitch_2
    const/4 p1, 0x3

    return p1

    :cond_0
    const/16 p1, 0x12

    return p1

    :cond_1
    const/16 p1, 0xf

    return p1

    :cond_2
    const/16 p1, 0xd

    return p1

    :cond_3
    const/4 p1, 0x2

    return p1

    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getConfigList(I)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mConfigMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mConfigMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    :goto_0
    return-object p1
.end method

.method public getConfigTypeForIndex(I)Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mTypeList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mTypeList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mTypeList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getConfigTypeList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mTypeList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getInnerConfigSelectIndex(I)F
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    const/high16 p1, -0x40800000    # -1.0f

    return p1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    return p1
.end method

.method public getInterruptIndex(I)I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInterruptMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1
.end method

.method public getSelectConfigList()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mConfigMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mConfigMap:Ljava/util/Map;

    iget v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSelectType:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    :goto_0
    return-object v0
.end method

.method public getSelectType()I
    .locals 1

    iget v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSelectType:I

    return v0
.end method

.method public getSelectTypeIndex()I
    .locals 1

    iget v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSelectTabIndex:I

    return v0
.end method

.method public getSubConfigColorList(I)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/16 v0, 0xc

    if-eq p1, v0, :cond_2

    const/16 v0, 0xe

    if-eq p1, v0, :cond_1

    const/16 v0, 0x1c

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return-object p1

    :pswitch_0
    const/4 p1, 0x5

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1

    :pswitch_1
    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1

    :pswitch_2
    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1

    :cond_0
    const/16 p1, 0x12

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1

    :cond_1
    const/16 p1, 0xf

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1

    :cond_2
    const/16 p1, 0xd

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1

    :cond_3
    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getSubConfigList(Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/fragment/mimoji/MimojiLevelBean;",
            ">;"
        }
    .end annotation

    iget v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSelectType:I

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getSubConfigList(Landroid/content/Context;I)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1
.end method

.method public getSubConfigList(Landroid/content/Context;I)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I)",
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/fragment/mimoji/MimojiLevelBean;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSubConfigs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const/4 v0, 0x1

    if-eq p2, v0, :cond_8

    const/16 v0, 0xc

    if-eq p2, v0, :cond_6

    const/16 v0, 0xe

    if-eq p2, v0, :cond_5

    const/16 v0, 0x1c

    if-eq p2, v0, :cond_4

    packed-switch p2, :pswitch_data_0

    packed-switch p2, :pswitch_data_1

    goto/16 :goto_0

    :pswitch_0
    new-instance p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    invoke-direct {p2}, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;-><init>()V

    const/16 v0, 0x15

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    iput v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    const v0, 0x7f0902e3

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSubConfigs:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    new-instance p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    invoke-direct {p2}, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;-><init>()V

    const/16 v0, 0x18

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    if-eqz v1, :cond_9

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_9

    iput v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    const v0, 0x7f0902e4

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSubConfigs:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_1
    new-instance p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    invoke-direct {p2}, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;-><init>()V

    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    if-eqz v1, :cond_1

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1

    iput v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    const v0, 0x7f0902e0

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSubConfigs:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    new-instance p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    invoke-direct {p2}, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;-><init>()V

    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    if-eqz v1, :cond_9

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_9

    iput v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    const v0, 0x7f0902e1

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSubConfigs:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_2
    new-instance p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    invoke-direct {p2}, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;-><init>()V

    iget-object v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    const/16 v1, 0x13

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    iget-object v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_2

    iput v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    const v0, 0x7f0902d4

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSubConfigs:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    new-instance p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    invoke-direct {p2}, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;-><init>()V

    const/16 v0, 0x1b

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    if-eqz v1, :cond_9

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_9

    iput v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    const v0, 0x7f0902df

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSubConfigs:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_3
    new-instance p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    invoke-direct {p2}, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;-><init>()V

    const/16 v0, 0x9

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    if-eqz v1, :cond_9

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_9

    iput v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    const v0, 0x7f0902dc

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSubConfigs:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_4
    new-instance p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    invoke-direct {p2}, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;-><init>()V

    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    if-eqz v1, :cond_3

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_3

    iput v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    const v0, 0x7f0902db

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSubConfigs:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    new-instance p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    invoke-direct {p2}, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;-><init>()V

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    if-eqz v1, :cond_9

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_9

    iput v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    const v0, 0x7f0902da

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSubConfigs:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_4
    new-instance p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    invoke-direct {p2}, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;-><init>()V

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    if-eqz v1, :cond_9

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_9

    iput v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    const v0, 0x7f0902e2

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSubConfigs:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_5
    new-instance p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    invoke-direct {p2}, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;-><init>()V

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    if-eqz v1, :cond_9

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_9

    iput v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    const v0, 0x7f0902d8

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSubConfigs:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_6
    new-instance p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    invoke-direct {p2}, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;-><init>()V

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    if-eqz v1, :cond_7

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_7

    iput v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    const v0, 0x7f0902de

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSubConfigs:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_7
    new-instance p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    invoke-direct {p2}, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;-><init>()V

    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    if-eqz v1, :cond_9

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_9

    iput v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    const v0, 0x7f0902e5

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSubConfigs:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_8
    new-instance p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    invoke-direct {p2}, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;-><init>()V

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigList(I)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    if-eqz v1, :cond_9

    iget-object v1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_9

    iput v0, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configType:I

    const v0, 0x7f0902d3

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p2, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSubConfigs:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_9
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSubConfigs:Ljava/util/ArrayList;

    return-object p1

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x13
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public initUpdatePara()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInterruptMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mNeedUpdateMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAllNeedUpdate:Z

    return-void
.end method

.method public isColorSelected()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mIsColorSelected:Z

    return v0
.end method

.method public isNeedUpdate(I)Z
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mNeedUpdateMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mNeedUpdateMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v1

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_2

    iget-boolean p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAllNeedUpdate:Z

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    move v1, v2

    nop

    :cond_2
    :goto_0
    return v1
.end method

.method public isShowSubType(I)Z
    .locals 1

    const/16 v0, 0x13

    if-eq p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public putConfigList(ILjava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mConfigMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mConfigMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public declared-synchronized queryAvatar()Lcom/arcsoft/avatar/AvatarEngine;
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    if-nez v0, :cond_0

    const-string v0, "AvatarEngineManager"

    const-string v1, "avatar create"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/arcsoft/avatar/AvatarEngine;

    invoke-direct {v0}, Lcom/arcsoft/avatar/AvatarEngine;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatarRef:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatarRef:I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized releaseAvatar()V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "AvatarEngineManager"

    const-string v1, "avatar destroy"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/AvatarEngine;->destroy()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public resetData()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSelectType:I

    iput v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSelectTabIndex:I

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->resetInnerConfigSelectMap()V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSubConfigs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public setASAvatarConfigValue(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;)V
    .locals 4

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mASAvatarConfigValue:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;

    if-eqz p1, :cond_0

    sget-object v0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "value \u5c5e\u6027:gender = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->gender:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configHairStyleID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairStyleID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configHairColorID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairColorID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configHairColorValue = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairColorValue:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " configFaceColorID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceColorID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configFaceColorValue = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceColorValue:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " configEyeColorID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeColorID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configEyeColorValue = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeColorValue:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " configLipColorID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configLipColorID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configLipColorValue = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configLipColorValue:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " configHairHighlightColorID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairHighlightColorID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configHairHighlightColorValue = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairHighlightColorValue:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " configFrecklesID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFrecklesID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configNevusID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configNevusID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configEyewearStyleID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearStyleID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configEyewearFrameID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearFrameID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configEyewearFrameValue = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearFrameValue:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " configEyewearLensesID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearLensesID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configEyewearLensesValue = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearLensesValue:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " configHeadwearStyleID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHeadwearStyleID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configHeadwearColorID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHeadwearColorID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configHeadwearColorValue = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHeadwearColorValue:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " configBeardStyleID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configBeardStyleID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configBeardColorID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configBeardColorID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configBeardColorValue = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configBeardColorValue:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " configEarringStyleID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEarringStyleID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configEyelashStyleID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyelashStyleID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configEyebrowColorID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowColorID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configEyebrowColorValue = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowColorValue:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " configFaceShapeID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceShapeID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configFaceShapeValue = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceShapeValue:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " configEyeShapeID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeShapeID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configEyeShapeValue = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeShapeValue:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " configMouthShapeID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configMouthShapeID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configMouthShapeValue = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configMouthShapeValue:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " configNoseShapeID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configNoseShapeID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configNoseShapeValue = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configNoseShapeValue:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " configEarShapeID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEarShapeID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configEarShapeValue = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEarShapeValue:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " configEyebrowShapeID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowShapeID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " configEyebrowShapeValue = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowShapeValue:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairStyleID:I

    int-to-float v2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairColorID:I

    int-to-float v2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceColorID:I

    int-to-float v2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v1, 0x13

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceShapeID:I

    int-to-float v2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeColorValue:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configLipColorID:I

    int-to-float v2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFrecklesID:I

    int-to-float v2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configNevusID:I

    int-to-float v2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v1, 0x17

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearStyleID:I

    int-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v2, 0x9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHeadwearStyleID:I

    int-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v2, 0xe

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configBeardStyleID:I

    int-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v2, 0xf

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configBeardColorID:I

    int-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEarringStyleID:I

    int-to-float v2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v1, 0x11

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyelashStyleID:I

    int-to-float v2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v1, 0x12

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowColorID:I

    int-to-float v2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v1, 0x14

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeShapeID:I

    int-to-float v2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v1, 0x15

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configMouthShapeID:I

    int-to-float v2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v1, 0x18

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configNoseShapeID:I

    int-to-float v2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v1, 0x1b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEarShapeID:I

    int-to-float v2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    const/16 v1, 0x1c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget p1, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowShapeID:I

    int-to-float p1, p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public setASAvatarConfigValueDefault(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;)V
    .locals 0

    invoke-virtual {p1}, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mASAvatarConfigValueDefault:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;

    return-void
.end method

.method public setAllNeedUpdate(ZZ)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAllNeedUpdate:Z

    iput-boolean p2, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mIsColorSelected:Z

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInterruptMap:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->clear()V

    return-void
.end method

.method public setConfigTypeList(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mTypeList:Ljava/util/ArrayList;

    return-void
.end method

.method public setInnerConfigSelectIndex(IF)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInnerConfigSelectMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setInterruptIndex(II)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInterruptMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setIsColorSelected(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mIsColorSelected:Z

    return-void
.end method

.method public setSelectType(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSelectType:I

    return-void
.end method

.method public setSelectTypeIndex(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSelectTabIndex:I

    return-void
.end method

.method public setTypeNeedUpdate(IZ)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mNeedUpdateMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
