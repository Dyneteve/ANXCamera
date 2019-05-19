.class public Lcom/android/camera/fragment/beauty/BeautyParameters;
.super Ljava/lang/Object;
.source "BeautyParameters.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/beauty/BeautyParameters$BeautyType;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final BACK_LEVEL_BEAUTY_TAB_ID:I = 0x0

.field public static final BEAUTY_BODY_BEAUTY_TAB_ID:I = 0x1

.field public static final BEAUTY_BODY_TYPE:I = 0x5

.field public static final BEAUTY_FILTER_TYPE:I = 0x6

.field public static final BEAUTY_LIVE_BEAUTY_MODE_TYPE:I = 0x7

.field public static final BEAUTY_MODEL_BEAUTY_TAB_ID:I = 0x1

.field public static final BEAUTY_MODEL_TYPE:I = 0x2

.field public static final EYE_LIGHT_BEAUTY_TAB_ID:I = 0x3

.field public static final EYE_LIGHT_BEAUTY_TYPE:I = 0x4

.field public static final FRON_LEVEL_BEAUTY_TAB_ID:I = 0x0

.field public static final LEVEL_BEAUTY_TYPE:I = 0x1

.field public static final LIVE_BEAUTY_MODE_BEAUTY_TAB_ID:I = 0x1

.field public static final LIVE_FILTER_BEAUTY_TAB_ID:I = 0x0

.field public static final MAKE_UP_BEAUTY_TAB_ID:I = 0x2

.field public static final MAKE_UP_TYPE:I = 0x3

.field public static final SEEKBAR_MAX:I = 0x64

.field public static final TAG:Ljava/lang/String;

.field private static sInstance:Lcom/android/camera/fragment/beauty/BeautyParameters;


# instance fields
.field private mCameraLevelParameters:[[F

.field private mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

.field private mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/fragment/beauty/BeautyParameters;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x6

    new-array v0, v0, [[F

    const/4 v1, 0x4

    new-array v2, v1, [F

    fill-array-data v2, :array_0

    const/4 v3, 0x0

    aput-object v2, v0, v3

    new-array v2, v1, [F

    fill-array-data v2, :array_1

    const/4 v3, 0x1

    aput-object v2, v0, v3

    new-array v2, v1, [F

    fill-array-data v2, :array_2

    const/4 v3, 0x2

    aput-object v2, v0, v3

    new-array v2, v1, [F

    fill-array-data v2, :array_3

    const/4 v3, 0x3

    aput-object v2, v0, v3

    new-array v2, v1, [F

    fill-array-data v2, :array_4

    aput-object v2, v0, v1

    new-array v1, v1, [F

    fill-array-data v1, :array_5

    const/4 v2, 0x5

    aput-object v1, v0, v2

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mCameraLevelParameters:[[F

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_2
    .array-data 4
        0x40400000    # 3.0f
        0x40400000    # 3.0f
        0x40400000    # 3.0f
        0x40400000    # 3.0f
    .end array-data

    :array_3
    .array-data 4
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
    .end array-data

    :array_4
    .array-data 4
        0x40e00000    # 7.0f
        0x40e00000    # 7.0f
        0x40e00000    # 7.0f
        0x40e00000    # 7.0f
    .end array-data

    :array_5
    .array-data 4
        0x41000000    # 8.0f
        0x41000000    # 8.0f
        0x41000000    # 8.0f
        0x41000000    # 8.0f
    .end array-data
.end method

.method public static declared-synchronized getInstance()Lcom/android/camera/fragment/beauty/BeautyParameters;
    .locals 2

    const-class v0, Lcom/android/camera/fragment/beauty/BeautyParameters;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters;->sInstance:Lcom/android/camera/fragment/beauty/BeautyParameters;

    if-nez v1, :cond_0

    new-instance v1, Lcom/android/camera/fragment/beauty/BeautyParameters;

    invoke-direct {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters;-><init>()V

    sput-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters;->sInstance:Lcom/android/camera/fragment/beauty/BeautyParameters;

    :cond_0
    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters;->sInstance:Lcom/android/camera/fragment/beauty/BeautyParameters;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private getProcessorBeautyParams(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;I)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;",
            "I)",
            "Ljava/util/Map<",
            "Lcom/miui/filtersdk/beauty/BeautyParameterType;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1, p2}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->getIntelligentLevelParams(I)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method public static isCurrentModeSupportBeauty()Z
    .locals 2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    const/16 v1, 0xa2

    if-eq v0, v1, :cond_1

    const/16 v1, 0xa1

    if-eq v0, v1, :cond_1

    const/16 v1, 0xae

    if-eq v0, v1, :cond_1

    const/16 v1, 0xb0

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static isHiddenBeautyPanelOnShutter()Z
    .locals 2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    const/16 v1, 0xa2

    if-eq v0, v1, :cond_1

    const/16 v1, 0xa1

    if-eq v0, v1, :cond_1

    const/16 v1, 0xae

    if-eq v0, v1, :cond_1

    const/16 v1, 0xb0

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private setBeautyParameters()V
    .locals 2

    invoke-static {}, Lcom/android/camera/CameraSettings;->getBeautyShowLevel()I

    move-result v0

    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/EffectController;->isStickerEnable()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    invoke-direct {p0, v1, v0}, Lcom/android/camera/fragment/beauty/BeautyParameters;->getProcessorBeautyParams(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;I)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    invoke-virtual {v1, v0}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->setBeautyParamsDegree(Ljava/util/Map;)V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    invoke-direct {p0, v1, v0}, Lcom/android/camera/fragment/beauty/BeautyParameters;->getProcessorBeautyParams(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;I)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    invoke-virtual {v1, v0}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->setBeautyParamsDegree(Ljava/util/Map;)V

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public getMakeupProcessor()Lcom/miui/filtersdk/beauty/BeautyProcessor;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getStickerMakeupProcessor()Lcom/miui/filtersdk/beauty/BeautyProcessor;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setMakeupProcessor(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->getBeautyShowLevel()I

    move-result v0

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    nop

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/beauty/BeautyParameters;->getProcessorBeautyParams(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;I)Ljava/util/Map;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    invoke-virtual {v0, p1}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->setBeautyParamsDegree(Ljava/util/Map;)V

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setStickerMakeupProcessor(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->getBeautyShowLevel()I

    move-result v0

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    nop

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/beauty/BeautyParameters;->getProcessorBeautyParams(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;I)Ljava/util/Map;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    invoke-virtual {v0, p1}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->setBeautyParamsDegree(Ljava/util/Map;)V

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
