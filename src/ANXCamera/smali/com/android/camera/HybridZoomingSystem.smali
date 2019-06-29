.class public Lcom/android/camera/HybridZoomingSystem;
.super Ljava/lang/Object;
.source "HybridZoomingSystem.java"


# static fields
.field private static final DEFAULT_OPTICAL_ZOOM_RATIO_COMBINATION:Ljava/lang/String;

.field public static final FLOAT_MICRO_SCENE_ZOOM_MAX:F = 1.0f

.field public static final FLOAT_MOON_MODE_ZOOM_MAX:F = 20.0f

.field public static final FLOAT_MOON_MODE_ZOOM_MIN:F = 1.0f

.field public static final FLOAT_STEP_FOR_ZOOM_RATIO_CHANGE:F = 0.1f

.field public static final FLOAT_ULTRA_WIDE_ZOOM_MAX:F = 6.0f

.field public static final FLOAT_ZOOM_RATIO_FOLD:F = 5.0f

.field public static final FLOAT_ZOOM_RATIO_NONE:F = 1.0f

.field public static final FLOAT_ZOOM_RATIO_TELE:F

.field public static final FLOAT_ZOOM_RATIO_ULTR:F

.field public static final FLOAT_ZOOM_RATIO_WIDE:F

.field public static final IS_2_OR_MORE_SAT:Z

.field public static final IS_2_SAT:Z

.field public static final IS_3_OR_MORE_SAT:Z

.field public static final IS_3_SAT:Z

.field private static final OPTICAL_ZOOM_RATIO_COMBINATION:Ljava/lang/String;

.field private static final STANDALONE_MACRO_OPTICAL_ZOOM_RATIO_COMBINATION:Ljava/lang/String;

.field public static final STRING_ZOOM_RATIO_NONE:Ljava/lang/String; = "1.0"

.field public static final STRING_ZOOM_RATIO_TELE:Ljava/lang/String;

.field public static final STRING_ZOOM_RATIO_ULTR:Ljava/lang/String;

.field public static final STRING_ZOOM_RATIO_WIDE:Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "HybridZoomingSystem"

.field public static final TOLERANCE_FOR_ZOOM_RATIO_CHANGED:F = 0.01f

.field private static sDefaultOpticalZoomRatioIndex:I

.field public static sDefaultStandaloneMacroOpticalZoomRatio:F

.field private static sDefaultStandaloneMacroOpticalZoomRatioIndex:I

.field private static sStandaloneMacroSupportedOpticalZoomRatios:[F

.field private static sSupportedOpticalZoomRatios:[F

.field private static final sZoomRatioHistory:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sZoomingSourceIdentity:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method private static synthetic $closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    .locals 0

    if-eqz p0, :cond_0

    :try_start_0
    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V

    :goto_0
    return-void
.end method

.method static constructor <clinit>()V
    .locals 11

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/android/camera/HybridZoomingSystem;->sZoomingSourceIdentity:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/android/camera/HybridZoomingSystem;->sZoomRatioHistory:Ljava/util/Map;

    invoke-static {}, Lcom/mi/config/b;->isSupportedOpticalZoom()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "1.0:2.0"

    goto :goto_0

    :cond_0
    const-string v0, "1.0"

    :goto_0
    sput-object v0, Lcom/android/camera/HybridZoomingSystem;->DEFAULT_OPTICAL_ZOOM_RATIO_COMBINATION:Ljava/lang/String;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    sget-object v2, Lcom/android/camera/HybridZoomingSystem;->DEFAULT_OPTICAL_ZOOM_RATIO_COMBINATION:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/mi/config/a;->L(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/HybridZoomingSystem;->OPTICAL_ZOOM_RATIO_COMBINATION:Ljava/lang/String;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    sget-object v2, Lcom/android/camera/HybridZoomingSystem;->DEFAULT_OPTICAL_ZOOM_RATIO_COMBINATION:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/mi/config/a;->M(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/HybridZoomingSystem;->STANDALONE_MACRO_OPTICAL_ZOOM_RATIO_COMBINATION:Ljava/lang/String;

    const/4 v0, -0x1

    sput v0, Lcom/android/camera/HybridZoomingSystem;->sDefaultOpticalZoomRatioIndex:I

    sput v0, Lcom/android/camera/HybridZoomingSystem;->sDefaultStandaloneMacroOpticalZoomRatioIndex:I

    const/high16 v2, 0x3f800000    # 1.0f

    sput v2, Lcom/android/camera/HybridZoomingSystem;->sDefaultStandaloneMacroOpticalZoomRatio:F

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/Scanner;

    sget-object v5, Lcom/android/camera/HybridZoomingSystem;->OPTICAL_ZOOM_RATIO_COMBINATION:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    const/4 v5, 0x0

    :try_start_0
    const-string v6, "\\s*[:,]\\s*"

    invoke-virtual {v4, v6}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    nop

    move v6, v0

    :goto_1
    invoke-virtual {v4}, Ljava/util/Scanner;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-virtual {v4}, Ljava/util/Scanner;->next()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_1

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_1

    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    const-string v8, "1.0"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    sget v7, Lcom/android/camera/HybridZoomingSystem;->sDefaultOpticalZoomRatioIndex:I

    if-ne v7, v0, :cond_1

    sput v6, Lcom/android/camera/HybridZoomingSystem;->sDefaultOpticalZoomRatioIndex:I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :cond_1
    goto :goto_1

    :cond_2
    invoke-static {v5, v4}, Lcom/android/camera/HybridZoomingSystem;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    sget v4, Lcom/android/camera/HybridZoomingSystem;->sDefaultOpticalZoomRatioIndex:I

    if-ltz v4, :cond_c

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    const/4 v6, 0x1

    if-lt v4, v6, :cond_c

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [F

    sput-object v4, Lcom/android/camera/HybridZoomingSystem;->sSupportedOpticalZoomRatios:[F

    nop

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v7, v1

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    sget-object v9, Lcom/android/camera/HybridZoomingSystem;->sSupportedOpticalZoomRatios:[F

    add-int/lit8 v10, v7, 0x1

    invoke-static {v8}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v8

    aput v8, v9, v7

    nop

    move v7, v10

    goto :goto_2

    :cond_3
    const-string v4, "HybridZoomingSystem"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v8, Lcom/android/camera/HybridZoomingSystem;->sSupportedOpticalZoomRatios:[F

    invoke-static {v8}, Ljava/util/Arrays;->toString([F)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "["

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v8, Lcom/android/camera/HybridZoomingSystem;->sDefaultOpticalZoomRatioIndex:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, "]"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v7}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mi/config/a;->hu()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {v3}, Ljava/util/List;->clear()V

    new-instance v4, Ljava/util/Scanner;

    sget-object v7, Lcom/android/camera/HybridZoomingSystem;->STANDALONE_MACRO_OPTICAL_ZOOM_RATIO_COMBINATION:Ljava/lang/String;

    invoke-direct {v4, v7}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    :try_start_1
    const-string v7, "\\s*[:,]\\s*"

    invoke-virtual {v4, v7}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    nop

    move v7, v0

    :goto_3
    invoke-virtual {v4}, Ljava/util/Scanner;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_5

    invoke-virtual {v4}, Ljava/util/Scanner;->next()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_4

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_4

    invoke-interface {v3, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v7, v7, 0x1

    const-string v9, "1.0"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    sget v8, Lcom/android/camera/HybridZoomingSystem;->sDefaultStandaloneMacroOpticalZoomRatioIndex:I

    if-ne v8, v0, :cond_4

    sput v7, Lcom/android/camera/HybridZoomingSystem;->sDefaultStandaloneMacroOpticalZoomRatioIndex:I
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_4
    goto :goto_3

    :cond_5
    invoke-static {v5, v4}, Lcom/android/camera/HybridZoomingSystem;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    sget v0, Lcom/android/camera/HybridZoomingSystem;->sDefaultStandaloneMacroOpticalZoomRatioIndex:I

    if-ltz v0, :cond_7

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    if-lt v0, v6, :cond_7

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [F

    sput-object v0, Lcom/android/camera/HybridZoomingSystem;->sStandaloneMacroSupportedOpticalZoomRatios:[F

    nop

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move v3, v1

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    sget-object v5, Lcom/android/camera/HybridZoomingSystem;->sStandaloneMacroSupportedOpticalZoomRatios:[F

    add-int/lit8 v7, v3, 0x1

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    aput v4, v5, v3

    nop

    move v3, v7

    goto :goto_4

    :cond_6
    const-string v0, "HybridZoomingSystem"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/android/camera/HybridZoomingSystem;->sStandaloneMacroSupportedOpticalZoomRatios:[F

    invoke-static {v4}, Ljava/util/Arrays;->toString([F)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v4, Lcom/android/camera/HybridZoomingSystem;->sDefaultStandaloneMacroOpticalZoomRatioIndex:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The supported optical zoom ratios are probably not configured correctly"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_5

    :catch_0
    move-exception v0

    move-object v5, v0

    :try_start_2
    throw v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_5
    invoke-static {v5, v4}, Lcom/android/camera/HybridZoomingSystem;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw v0

    :cond_8
    :goto_6
    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->OPTICAL_ZOOM_RATIO_COMBINATION:Ljava/lang/String;

    const-string v3, "^\\d+\\.\\d+\\s*:\\s*\\d+\\.\\d+$"

    invoke-virtual {v0, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_2_SAT:Z

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->OPTICAL_ZOOM_RATIO_COMBINATION:Ljava/lang/String;

    const-string v3, "^\\d+\\.\\d+\\s*:\\s*\\d+\\.\\d+(\\s*:\\s*\\d+\\.\\d+)*$"

    invoke-virtual {v0, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_2_OR_MORE_SAT:Z

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->OPTICAL_ZOOM_RATIO_COMBINATION:Ljava/lang/String;

    const-string v3, "^\\d+\\.\\d+\\s*:\\s*\\d+\\.\\d+\\s*:\\s*\\d+\\.\\d+$"

    invoke-virtual {v0, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_SAT:Z

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->OPTICAL_ZOOM_RATIO_COMBINATION:Ljava/lang/String;

    const-string v3, "^\\d+\\.\\d+\\s*:\\s*\\d+\\.\\d+\\s*:\\s*\\d+\\.\\d+(\\s*:\\s*\\d+\\.\\d+)*$"

    invoke-virtual {v0, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_SAT:Z

    if-eqz v0, :cond_9

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sSupportedOpticalZoomRatios:[F

    aget v0, v0, v1

    goto :goto_7

    :cond_9
    const v0, 0x3f19999a    # 0.6f

    :goto_7
    sput v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_ULTR:F

    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_SAT:Z

    if-eqz v0, :cond_a

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sSupportedOpticalZoomRatios:[F

    aget v2, v0, v6

    nop

    :cond_a
    sput v2, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_WIDE:F

    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_SAT:Z

    if-eqz v0, :cond_b

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sSupportedOpticalZoomRatios:[F

    const/4 v2, 0x2

    aget v0, v0, v2

    goto :goto_8

    :cond_b
    const/high16 v0, 0x40000000    # 2.0f

    :goto_8
    sput v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_TELE:F

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "%.1fx"

    new-array v3, v6, [Ljava/lang/Object;

    sget v4, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_ULTR:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v3, v1

    invoke-static {v0, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/HybridZoomingSystem;->STRING_ZOOM_RATIO_ULTR:Ljava/lang/String;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "%.1fx"

    new-array v3, v6, [Ljava/lang/Object;

    sget v4, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_WIDE:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v3, v1

    invoke-static {v0, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/HybridZoomingSystem;->STRING_ZOOM_RATIO_WIDE:Ljava/lang/String;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "%.1fx"

    new-array v3, v6, [Ljava/lang/Object;

    sget v4, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_TELE:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v3, v1

    invoke-static {v0, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/HybridZoomingSystem;->STRING_ZOOM_RATIO_TELE:Ljava/lang/String;

    return-void

    :cond_c
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The supported optical zoom ratios are probably not configured correctly"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_1
    move-exception v0

    goto :goto_9

    :catch_1
    move-exception v0

    move-object v5, v0

    :try_start_3
    throw v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :goto_9
    invoke-static {v5, v4}, Lcom/android/camera/HybridZoomingSystem;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw v0
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static add(FF)F
    .locals 1

    const/high16 v0, 0x41200000    # 10.0f

    mul-float/2addr p0, v0

    float-to-int p0, p0

    mul-float/2addr p1, v0

    float-to-int p1, p1

    add-int/2addr p0, p1

    int-to-float p0, p0

    div-float/2addr p0, v0

    return p0
.end method

.method public static clamp(FFF)F
    .locals 1

    cmpl-float v0, p0, p2

    if-lez v0, :cond_0

    return p2

    :cond_0
    cmpg-float p2, p0, p1

    if-gez p2, :cond_1

    return p1

    :cond_1
    return p0
.end method

.method public static clearZoomRatioHistory()V
    .locals 2

    const-string v0, "HybridZoomingSystem"

    const-string v1, "clearZoomRatioHistory()"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sZoomRatioHistory:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sZoomingSourceIdentity:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-void
.end method

.method public static getDefaultOpticalZoomRatioIndex()I
    .locals 1

    sget v0, Lcom/android/camera/HybridZoomingSystem;->sDefaultOpticalZoomRatioIndex:I

    return v0
.end method

.method public static getDefaultStandaloneMacroOpticalZoomRatioIndex()I
    .locals 1

    sget v0, Lcom/android/camera/HybridZoomingSystem;->sDefaultStandaloneMacroOpticalZoomRatioIndex:I

    return v0
.end method

.method public static getMaximumOpticalZoomRatio()F
    .locals 2

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sSupportedOpticalZoomRatios:[F

    array-length v0, v0

    sget-object v1, Lcom/android/camera/HybridZoomingSystem;->sSupportedOpticalZoomRatios:[F

    add-int/lit8 v0, v0, -0x1

    aget v0, v1, v0

    return v0
.end method

.method public static getMaximumStandaloneOpticalZoomRatio()F
    .locals 2

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sStandaloneMacroSupportedOpticalZoomRatios:[F

    array-length v0, v0

    sget-object v1, Lcom/android/camera/HybridZoomingSystem;->sStandaloneMacroSupportedOpticalZoomRatios:[F

    add-int/lit8 v0, v0, -0x1

    aget v0, v1, v0

    return v0
.end method

.method public static getMinimumOpticalZoomRatio()F
    .locals 2

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sSupportedOpticalZoomRatios:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0
.end method

.method public static getMinimumStandaloneOpticalZoomRatio()F
    .locals 2

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sStandaloneMacroSupportedOpticalZoomRatios:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0
.end method

.method public static getOpticalZoomRatioAt(I)F
    .locals 3

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sSupportedOpticalZoomRatios:[F

    array-length v0, v0

    if-ltz p0, :cond_0

    if-ge p0, v0, :cond_0

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sSupportedOpticalZoomRatios:[F

    aget p0, v0, p0

    return p0

    :cond_0
    new-instance p0, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The given index must be in range [0, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static getOpticalZoomRatioIndex(F)I
    .locals 3

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sSupportedOpticalZoomRatios:[F

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    sget-object v1, Lcom/android/camera/HybridZoomingSystem;->sSupportedOpticalZoomRatios:[F

    aget v1, v1, v0

    cmpl-float v1, p0, v1

    if-ltz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Illegal zoom ratio: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getStandaloneMacroOpticalZoomRatioAt(I)F
    .locals 3

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sStandaloneMacroSupportedOpticalZoomRatios:[F

    array-length v0, v0

    if-ltz p0, :cond_0

    if-ge p0, v0, :cond_0

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sStandaloneMacroSupportedOpticalZoomRatios:[F

    aget p0, v0, p0

    return p0

    :cond_0
    new-instance p0, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The given index must be in range [0, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static getStandaloneMacroOpticalZoomRatioIndex(F)I
    .locals 4

    nop

    nop

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sStandaloneMacroSupportedOpticalZoomRatios:[F

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, -0x1

    const/4 v2, 0x0

    :goto_0
    if-ltz v0, :cond_3

    sget-object v3, Lcom/android/camera/HybridZoomingSystem;->sStandaloneMacroSupportedOpticalZoomRatios:[F

    aget v3, v3, v0

    cmpl-float v3, p0, v3

    if-ltz v3, :cond_0

    return v0

    :cond_0
    sget-object v3, Lcom/android/camera/HybridZoomingSystem;->sStandaloneMacroSupportedOpticalZoomRatios:[F

    aget v3, v3, v0

    cmpg-float v3, v2, v3

    if-gez v3, :cond_1

    goto :goto_1

    :cond_1
    sget-object v2, Lcom/android/camera/HybridZoomingSystem;->sStandaloneMacroSupportedOpticalZoomRatios:[F

    aget v2, v2, v0

    :goto_1
    sget-object v3, Lcom/android/camera/HybridZoomingSystem;->sStandaloneMacroSupportedOpticalZoomRatios:[F

    aget v3, v3, v0

    cmpg-float v3, v2, v3

    if-gez v3, :cond_2

    goto :goto_2

    :cond_2
    move v1, v0

    :goto_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_3
    cmpg-float v0, v2, p0

    if-gez v0, :cond_4

    return v1

    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Illegal zoom ratio: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getStandaloneMacroSupportedOpticalZoomRatios()[F
    .locals 1

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sStandaloneMacroSupportedOpticalZoomRatios:[F

    return-object v0
.end method

.method public static getSupportedOpticalZoomRatios()[F
    .locals 1

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sSupportedOpticalZoomRatios:[F

    return-object v0
.end method

.method public static getZoomRatioHistory(ILjava/lang/String;)Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sZoomRatioHistory:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    move-object p0, p1

    :goto_0
    return-object p0
.end method

.method public static getZoomingSourceIdentity()I
    .locals 1

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sZoomingSourceIdentity:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public static isOpticalZoomRatio(F)Z
    .locals 1

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sSupportedOpticalZoomRatios:[F

    invoke-static {v0, p0}, Ljava/util/Arrays;->binarySearch([FF)I

    move-result p0

    if-ltz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static preload()V
    .locals 2

    const-string v0, "HybridZoomingSystem"

    const-string v1, "preload"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public static setZoomRatioHistory(ILjava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sZoomRatioHistory:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static setZoomingSourceIdentity(I)V
    .locals 3

    const-string v0, "HybridZoomingSystem"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setZoomingSourceIdentity(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->sZoomingSourceIdentity:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-void
.end method

.method public static sub(FF)F
    .locals 1

    const/high16 v0, 0x41200000    # 10.0f

    mul-float/2addr p0, v0

    float-to-int p0, p0

    mul-float/2addr p1, v0

    float-to-int p1, p1

    sub-int/2addr p0, p1

    int-to-float p0, p0

    div-float/2addr p0, v0

    return p0
.end method

.method public static toCropRegion(FLandroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 6

    const/4 v0, 0x0

    cmpg-float v0, p0, v0

    if-lez v0, :cond_1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    mul-float/2addr v3, p0

    div-float/2addr v2, v3

    float-to-int v2, v2

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p1, v3

    float-to-int p1, p1

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    sub-int v4, v0, v2

    sub-int v5, v1, p1

    add-int/2addr v0, v2

    add-int/2addr v1, p1

    invoke-virtual {v3, v4, v5, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    const-string p1, "HybridZoomingSystem"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "toCropRegion(): zoom ratio = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p0, ", crop region = "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v3

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "activeArraySize must be non null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Zoom ratio must be greater than 0.0f"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static toDecimal(F)F
    .locals 1

    const/high16 v0, 0x41200000    # 10.0f

    mul-float/2addr p0, v0

    float-to-int p0, p0

    int-to-float p0, p0

    div-float/2addr p0, v0

    return p0
.end method

.method public static toFloat(Ljava/lang/String;F)F
    .locals 3

    :try_start_0
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v0

    const-string v0, "HybridZoomingSystem"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid zoom: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return p1
.end method

.method public static toString(F)Ljava/lang/String;
    .locals 4

    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_ULTR:F

    cmpl-float v0, v0, p0

    if-nez v0, :cond_0

    sget-object p0, Lcom/android/camera/HybridZoomingSystem;->STRING_ZOOM_RATIO_ULTR:Ljava/lang/String;

    return-object p0

    :cond_0
    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_WIDE:F

    cmpl-float v0, v0, p0

    if-nez v0, :cond_1

    sget-object p0, Lcom/android/camera/HybridZoomingSystem;->STRING_ZOOM_RATIO_WIDE:Ljava/lang/String;

    return-object p0

    :cond_1
    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_TELE:F

    cmpl-float v0, v0, p0

    if-nez v0, :cond_2

    sget-object p0, Lcom/android/camera/HybridZoomingSystem;->STRING_ZOOM_RATIO_TELE:Ljava/lang/String;

    return-object p0

    :cond_2
    invoke-static {p0}, Lcom/android/camera/HybridZoomingSystem;->toDecimal(F)F

    move-result p0

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%.1fx"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    aput-object p0, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
