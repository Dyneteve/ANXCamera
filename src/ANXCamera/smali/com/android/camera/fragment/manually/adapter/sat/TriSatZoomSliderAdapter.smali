.class public Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;
.super Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;
.source "TriSatZoomSliderAdapter.java"


# static fields
.field public static final ENTRY_COUNT_1X_TO_2X:I = 0xb

.field public static final ENTRY_COUNT_2X_TO_MAX:I = 0x26

.field public static final ENTRY_COUNT_MIN_TO_1X:I = 0x5

.field public static final ENTRY_COUNT_TOTAL:I = 0x34

.field public static final ENTRY_INDEX_1X:I = 0x4

.field public static final ENTRY_INDEX_2X:I = 0xe

.field public static final ENTRY_INDEX_MAX:I = 0x33

.field public static final ENTRY_INDEX_MIN:I = 0x0

.field public static final ENTRY_INDEX_TELE_ACTUAL:I

.field private static final RANGE_1X_TO_2X_ENTRY_INDEX_X:[F

.field private static final RANGE_1X_TO_2X_ZOOM_RATIO_Y:[F

.field private static final RANGE_2X_TO_MAX_ENTRY_INDEX_X:[F

.field private static final RANGE_2X_TO_MAX_ZOOM_RATIO_Y:[F

.field private static final RANGE_MIN_TO_1X_ENTRY_INDEX_X:[F

.field private static final RANGE_MIN_TO_1X_ZOOM_RATIO_Y:[F

.field private static final TAG:Ljava/lang/String; = "TriSatZoomSliderAdapter"

.field private static final sTextActivatedColorState:[I

.field private static final sTextDefaultColorState:[I


# instance fields
.field private mComponentData:Lcom/android/camera/data/data/ComponentData;

.field private mCurrentMode:I

.field private mCurrentValue:Ljava/lang/String;

.field private mCurrentValueIndex:I

.field private mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

.field private mDotColorActivated:I

.field private mDotRadius:I

.field private mEnable:Z

.field private mEntryLayouts:[Landroid/text/StaticLayout;

.field private mLineColorDefault:I

.field private mLineDotYGap:I

.field private mLineHalfHeight:F

.field private mLineLineGap:I

.field private mLineTextGap:I

.field private mLineWidth:I

.field private mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

.field private mPaint:Landroid/graphics/Paint;

.field private mRange1XTo2XEntryToZoomRatioSpline:Landroid/util/Spline;

.field private mRange1XTo2XZoomRatioToEntrySpline:Landroid/util/Spline;

.field private mRange2XToMaxEntryToZoomRatioSpline:Landroid/util/Spline;

.field private mRange2XToMaxZoomRatioToEntrySpline:Landroid/util/Spline;

.field private mRangeMinTo1XEntryToZoomRatioSpline:Landroid/util/Spline;

.field private mRangeMinTo1XZoomRatioToEntrySpline:Landroid/util/Spline;

.field private mTextColor:Landroid/content/res/ColorStateList;

.field private mTextPaint:Landroid/text/TextPaint;

.field private mTextSize:I

.field private mXTextStyle:Landroid/text/style/TextAppearanceSpan;

.field private final mZoomRatioMax:F

.field private final mZoomRatioMin:F


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    const v3, 0x10102fe

    aput v3, v1, v2

    sput-object v1, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->sTextActivatedColorState:[I

    new-array v0, v0, [I

    aput v2, v0, v2

    sput-object v0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->sTextDefaultColorState:[I

    invoke-static {}, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->findActualTeleIndex()I

    move-result v0

    sput v0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->ENTRY_INDEX_TELE_ACTUAL:I

    const/4 v0, 0x5

    new-array v1, v0, [F

    fill-array-data v1, :array_0

    sput-object v1, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->RANGE_MIN_TO_1X_ENTRY_INDEX_X:[F

    new-array v0, v0, [F

    fill-array-data v0, :array_1

    sput-object v0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->RANGE_MIN_TO_1X_ZOOM_RATIO_Y:[F

    const/4 v0, 0x2

    new-array v1, v0, [F

    fill-array-data v1, :array_2

    sput-object v1, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->RANGE_1X_TO_2X_ENTRY_INDEX_X:[F

    new-array v0, v0, [F

    fill-array-data v0, :array_3

    sput-object v0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->RANGE_1X_TO_2X_ZOOM_RATIO_Y:[F

    const/16 v0, 0x9

    new-array v1, v0, [F

    fill-array-data v1, :array_4

    sput-object v1, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->RANGE_2X_TO_MAX_ENTRY_INDEX_X:[F

    new-array v0, v0, [F

    fill-array-data v0, :array_5

    sput-object v0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->RANGE_2X_TO_MAX_ZOOM_RATIO_Y:[F

    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x40000000    # 2.0f
        0x40400000    # 3.0f
        0x40800000    # 4.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f19999a    # 0.6f
        0x3f333333    # 0.7f
        0x3f4ccccd    # 0.8f
        0x3f666666    # 0.9f
        0x3f800000    # 1.0f
    .end array-data

    :array_2
    .array-data 4
        0x40800000    # 4.0f
        0x41600000    # 14.0f
    .end array-data

    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x40000000    # 2.0f
    .end array-data

    :array_4
    .array-data 4
        0x41600000    # 14.0f
        0x41800000    # 16.0f
        0x41c00000    # 24.0f
        0x41e80000    # 29.0f
        0x41f80000    # 31.0f
        0x42040000    # 33.0f
        0x42080000    # 34.0f
        0x42100000    # 36.0f
        0x421c0000    # 39.0f
    .end array-data

    :array_5
    .array-data 4
        0x40000000    # 2.0f
        0x400ccccd    # 2.2f
        0x406ccccd    # 3.7f
        0x40a33333    # 5.1f
        0x40b9999a    # 5.8f
        0x40d33333    # 6.6f
        0x40e00000    # 7.0f
        0x41000000    # 8.0f
        0x41200000    # 10.0f
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;)V
    .locals 8

    invoke-direct {p0}, Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;-><init>()V

    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    iput p3, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mCurrentMode:I

    iput-object p4, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    iget p3, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mCurrentMode:I

    invoke-virtual {p2, p3}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mCurrentValue:Ljava/lang/String;

    move-object p2, p1

    check-cast p2, Lcom/android/camera/ActivityBase;

    invoke-virtual {p2}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p2

    check-cast p2, Lcom/android/camera/module/BaseModule;

    invoke-virtual {p2}, Lcom/android/camera/module/BaseModule;->getMaxZoomRatio()F

    move-result p3

    iput p3, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mZoomRatioMax:F

    invoke-virtual {p2}, Lcom/android/camera/module/BaseModule;->getMinZoomRatio()F

    move-result p2

    iput p2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mZoomRatioMin:F

    const-string p2, "TriSatZoomSliderAdapter"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "ZOOM RATIO RANGE ["

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p4, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mZoomRatioMin:F

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p4, ", "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p4, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mZoomRatioMax:F

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p4, "]"

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object p2, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->RANGE_MIN_TO_1X_ENTRY_INDEX_X:[F

    sget-object p3, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->RANGE_MIN_TO_1X_ZOOM_RATIO_Y:[F

    invoke-static {p2, p3}, Landroid/util/Spline;->createLinearSpline([F[F)Landroid/util/Spline;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mRangeMinTo1XEntryToZoomRatioSpline:Landroid/util/Spline;

    sget-object p2, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->RANGE_MIN_TO_1X_ZOOM_RATIO_Y:[F

    sget-object p3, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->RANGE_MIN_TO_1X_ENTRY_INDEX_X:[F

    invoke-static {p2, p3}, Landroid/util/Spline;->createLinearSpline([F[F)Landroid/util/Spline;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mRangeMinTo1XZoomRatioToEntrySpline:Landroid/util/Spline;

    sget-object p2, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->RANGE_1X_TO_2X_ENTRY_INDEX_X:[F

    sget-object p3, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->RANGE_1X_TO_2X_ZOOM_RATIO_Y:[F

    invoke-static {p2, p3}, Landroid/util/Spline;->createLinearSpline([F[F)Landroid/util/Spline;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mRange1XTo2XEntryToZoomRatioSpline:Landroid/util/Spline;

    sget-object p2, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->RANGE_1X_TO_2X_ZOOM_RATIO_Y:[F

    sget-object p3, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->RANGE_1X_TO_2X_ENTRY_INDEX_X:[F

    invoke-static {p2, p3}, Landroid/util/Spline;->createLinearSpline([F[F)Landroid/util/Spline;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mRange1XTo2XZoomRatioToEntrySpline:Landroid/util/Spline;

    invoke-static {}, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->getEntryX()[F

    move-result-object p2

    iget p3, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mZoomRatioMax:F

    invoke-static {p3}, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->getZoomRatioY(F)[F

    move-result-object p3

    invoke-static {p2, p3}, Landroid/util/Spline;->createMonotoneCubicSpline([F[F)Landroid/util/Spline;

    move-result-object p4

    iput-object p4, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mRange2XToMaxEntryToZoomRatioSpline:Landroid/util/Spline;

    invoke-static {p3, p2}, Landroid/util/Spline;->createMonotoneCubicSpline([F[F)Landroid/util/Spline;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mRange2XToMaxZoomRatioToEntrySpline:Landroid/util/Spline;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->initStyle(Landroid/content/Context;)V

    const/4 p1, 0x4

    new-array p1, p1, [Ljava/lang/CharSequence;

    sget p2, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_ULTR:F

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->createZoomRatioLabel(F)Ljava/lang/CharSequence;

    move-result-object p2

    const/4 p3, 0x0

    aput-object p2, p1, p3

    sget p2, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_WIDE:F

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->createZoomRatioLabel(F)Ljava/lang/CharSequence;

    move-result-object p2

    const/4 p4, 0x1

    aput-object p2, p1, p4

    sget p2, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_TELE:F

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->createZoomRatioLabel(F)Ljava/lang/CharSequence;

    move-result-object p2

    const/4 p4, 0x2

    aput-object p2, p1, p4

    iget p2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mZoomRatioMax:F

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->createZoomRatioLabel(F)Ljava/lang/CharSequence;

    move-result-object p2

    const/4 p4, 0x3

    aput-object p2, p1, p4

    array-length p2, p1

    new-array p2, p2, [Landroid/text/StaticLayout;

    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mEntryLayouts:[Landroid/text/StaticLayout;

    :goto_0
    array-length p2, p1

    if-ge p3, p2, :cond_0

    iget-object p2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mEntryLayouts:[Landroid/text/StaticLayout;

    new-instance p4, Landroid/text/StaticLayout;

    aget-object v1, p1, p3

    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mTextPaint:Landroid/text/TextPaint;

    sget v3, Lcom/android/camera/Util;->sWindowWidth:I

    sget-object v4, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p4

    invoke-direct/range {v0 .. v7}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    aput-object p4, p2, p3

    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private createZoomRatioLabel(F)Ljava/lang/CharSequence;
    .locals 4

    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    invoke-static {p1}, Lcom/android/camera/HybridZoomingSystem;->toDecimal(F)F

    move-result p1

    float-to-int v1, p1

    const/high16 v2, 0x41200000    # 10.0f

    mul-float/2addr v2, p1

    mul-int/lit8 v3, v1, 0xa

    int-to-float v3, v3

    sub-float/2addr v2, v3

    float-to-int v2, v2

    const/16 v3, 0x21

    if-nez v2, :cond_0

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

    invoke-static {v0, p1, v1, v3}, Lcom/android/camera/Util;->appendInApi26(Landroid/text/SpannableStringBuilder;Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;

    goto :goto_0

    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

    invoke-static {v0, p1, v1, v3}, Lcom/android/camera/Util;->appendInApi26(Landroid/text/SpannableStringBuilder;Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;

    :goto_0
    const-string p1, "X"

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mXTextStyle:Landroid/text/style/TextAppearanceSpan;

    invoke-static {v0, p1, v1, v3}, Lcom/android/camera/Util;->appendInApi26(Landroid/text/SpannableStringBuilder;Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;

    return-object v0
.end method

.method private drawText(ILandroid/graphics/Canvas;)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mEntryLayouts:[Landroid/text/StaticLayout;

    aget-object v0, v0, p1

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/text/StaticLayout;->getLineAscent(I)I

    move-result v0

    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mEntryLayouts:[Landroid/text/StaticLayout;

    aget-object v2, v2, p1

    invoke-virtual {v2, v1}, Landroid/text/StaticLayout;->getLineDescent(I)I

    move-result v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    const/4 v1, 0x0

    invoke-virtual {p2, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mEntryLayouts:[Landroid/text/StaticLayout;

    aget-object p1, v0, p1

    invoke-virtual {p1, p2}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method private static drawTextForItemAt(I)Z
    .locals 1

    if-eqz p0, :cond_1

    const/4 v0, 0x4

    if-eq p0, v0, :cond_1

    const/16 v0, 0xe

    if-eq p0, v0, :cond_1

    const/16 v0, 0x33

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method static findActualTeleIndex()I
    .locals 3

    invoke-static {}, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->getRealZoomRatioTele()I

    move-result v0

    int-to-float v0, v0

    sget v1, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_TELE:F

    const/high16 v2, 0x41200000    # 10.0f

    mul-float/2addr v1, v2

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_0

    sget v1, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_WIDE:F

    mul-float/2addr v1, v2

    cmpl-float v1, v0, v1

    if-lez v1, :cond_0

    sget v1, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_TELE:F

    mul-float/2addr v1, v2

    cmpg-float v1, v0, v1

    if-gez v1, :cond_0

    sget v1, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_WIDE:F

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    float-to-int v0, v0

    return v0

    :cond_0
    const/16 v0, 0xe

    return v0
.end method

.method private static getEntryX()[F
    .locals 7

    sget-object v0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->RANGE_2X_TO_MAX_ENTRY_INDEX_X:[F

    nop

    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aget v1, v0, v1

    const/16 v2, 0xe

    int-to-float v2, v2

    sub-float/2addr v1, v2

    const/high16 v3, 0x3f800000    # 1.0f

    add-float/2addr v1, v3

    float-to-int v1, v1

    array-length v3, v0

    new-array v3, v3, [F

    const/4 v4, 0x0

    :goto_0
    array-length v5, v0

    if-ge v4, v5, :cond_1

    aget v5, v0, v4

    cmpg-float v5, v5, v2

    if-gtz v5, :cond_0

    aget v5, v0, v4

    aput v5, v3, v4

    goto :goto_1

    :cond_0
    aget v5, v0, v4

    sub-float/2addr v5, v2

    add-int/lit8 v6, v1, -0x1

    int-to-float v6, v6

    div-float/2addr v5, v6

    const/high16 v6, 0x42140000    # 37.0f

    mul-float/2addr v5, v6

    add-float/2addr v5, v2

    aput v5, v3, v4

    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    return-object v3
.end method

.method private static getZoomRatioY(F)[F
    .locals 7

    sget-object v0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->RANGE_2X_TO_MAX_ZOOM_RATIO_Y:[F

    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aget v1, v0, v1

    float-to-int v1, v1

    array-length v2, v0

    new-array v2, v2, [F

    const/4 v3, 0x0

    :goto_0
    array-length v4, v0

    if-ge v3, v4, :cond_1

    aget v4, v0, v3

    sget v5, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_TELE:F

    cmpg-float v4, v4, v5

    if-gtz v4, :cond_0

    aget v4, v0, v3

    aput v4, v2, v3

    goto :goto_1

    :cond_0
    aget v4, v0, v3

    sget v5, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_TELE:F

    sub-float/2addr v4, v5

    int-to-float v5, v1

    sget v6, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_TELE:F

    sub-float/2addr v5, v6

    div-float/2addr v4, v5

    sget v5, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_TELE:F

    sub-float v5, p0, v5

    mul-float/2addr v4, v5

    sget v5, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_TELE:F

    add-float/2addr v4, v5

    aput v4, v2, v3

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-object v2
.end method

.method private static indexToSection(I)I
    .locals 1

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 v0, 0x4

    if-ne p0, v0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/16 v0, 0xe

    if-ne p0, v0, :cond_2

    const/4 p0, 0x2

    return p0

    :cond_2
    const/16 v0, 0x33

    if-ne p0, v0, :cond_3

    const/4 p0, 0x3

    return p0

    :cond_3
    const/4 p0, -0x1

    return p0
.end method

.method private initStyle(Landroid/content/Context;)V
    .locals 4

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    const v1, 0x7f0c0011

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v1

    iget v2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mTextSize:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mTextSize:I

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f0a0016

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    iput v2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mLineHalfHeight:F

    const v2, 0x7f0a0017

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mLineWidth:I

    const v2, 0x7f0a001a

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mDotRadius:I

    const v2, 0x7f0a0018

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mLineLineGap:I

    const v2, 0x7f0a0019

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mLineTextGap:I

    const v2, 0x7f0a001b

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mLineDotYGap:I

    const v2, 0x7f0b0050

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    iput v2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mLineColorDefault:I

    const v2, 0x7f0b0051

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mDotColorActivated:I

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mPaint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mLineWidth:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mTextSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    new-instance v0, Landroid/text/TextPaint;

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mPaint:Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    iput-object v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mTextPaint:Landroid/text/TextPaint;

    new-instance v0, Landroid/text/style/TextAppearanceSpan;

    const v1, 0x7f0c0018

    invoke-direct {v0, p1, v1}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

    new-instance v0, Landroid/text/style/TextAppearanceSpan;

    const v1, 0x7f0c0019

    invoke-direct {v0, p1, v1}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mXTextStyle:Landroid/text/style/TextAppearanceSpan;

    return-void

    nop

    :array_0
    .array-data 4
        0x1010095
        0x1010098
    .end array-data
.end method


# virtual methods
.method public draw(ILandroid/graphics/Canvas;Z)V
    .locals 8

    invoke-static {p1}, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->drawTextForItemAt(I)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mTextPaint:Landroid/text/TextPaint;

    if-eqz p3, :cond_0

    sget-object p3, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->sTextActivatedColorState:[I

    goto :goto_0

    :cond_0
    sget-object p3, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->sTextDefaultColorState:[I

    :goto_0
    iput-object p3, v0, Landroid/text/TextPaint;->drawableState:[I

    invoke-static {p1}, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->indexToSection(I)I

    move-result p1

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->drawText(ILandroid/graphics/Canvas;)V

    goto :goto_3

    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mPaint:Landroid/graphics/Paint;

    if-eqz p3, :cond_2

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mTextColor:Landroid/content/res/ColorStateList;

    sget-object v2, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->sTextActivatedColorState:[I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    goto :goto_1

    :cond_2
    iget v1, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mLineColorDefault:I

    :goto_1
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    const/4 v3, 0x0

    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mLineHalfHeight:F

    neg-float v4, v0

    const/4 v5, 0x0

    iget v6, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mLineHalfHeight:F

    iget-object v7, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mPaint:Landroid/graphics/Paint;

    move-object v2, p2

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    sget v0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->ENTRY_INDEX_TELE_ACTUAL:I

    if-ne p1, v0, :cond_4

    iget-object p1, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mPaint:Landroid/graphics/Paint;

    if-eqz p3, :cond_3

    iget p3, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mDotColorActivated:I

    goto :goto_2

    :cond_3
    iget p3, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mLineColorDefault:I

    :goto_2
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setColor(I)V

    const/4 p1, 0x0

    iget p3, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mLineHalfHeight:F

    neg-float p3, p3

    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mLineDotYGap:I

    int-to-float v0, v0

    sub-float/2addr p3, v0

    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mDotRadius:I

    int-to-float v0, v0

    sub-float/2addr p3, v0

    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mDotRadius:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p2, p1, p3, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :cond_4
    :goto_3
    return-void
.end method

.method public getAlign(I)Landroid/graphics/Paint$Align;
    .locals 0

    invoke-static {p1}, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->drawTextForItemAt(I)Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    return-object p1

    :cond_0
    sget-object p1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    return-object p1
.end method

.method public getCount()I
    .locals 1

    const/16 v0, 0x34

    return v0
.end method

.method public isEnable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mEnable:Z

    return v0
.end method

.method public mapPositionToZoomRatio(F)F
    .locals 2

    const/4 v0, 0x0

    cmpg-float v0, v0, p1

    const/high16 v1, 0x40800000    # 4.0f

    if-gtz v0, :cond_0

    cmpg-float v0, p1, v1

    if-gez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mRangeMinTo1XEntryToZoomRatioSpline:Landroid/util/Spline;

    invoke-virtual {v0, p1}, Landroid/util/Spline;->interpolate(F)F

    move-result p1

    return p1

    :cond_0
    cmpg-float v0, v1, p1

    if-gtz v0, :cond_1

    const/high16 v0, 0x41600000    # 14.0f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mRange1XTo2XEntryToZoomRatioSpline:Landroid/util/Spline;

    invoke-virtual {v0, p1}, Landroid/util/Spline;->interpolate(F)F

    move-result p1

    return p1

    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mRange2XToMaxEntryToZoomRatioSpline:Landroid/util/Spline;

    invoke-virtual {v0, p1}, Landroid/util/Spline;->interpolate(F)F

    move-result p1

    return p1
.end method

.method public mapZoomRatioToPosition(F)F
    .locals 1

    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_ULTR:F

    cmpg-float v0, v0, p1

    if-gtz v0, :cond_0

    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_WIDE:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mRangeMinTo1XZoomRatioToEntrySpline:Landroid/util/Spline;

    invoke-virtual {v0, p1}, Landroid/util/Spline;->interpolate(F)F

    move-result p1

    return p1

    :cond_0
    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_WIDE:F

    cmpg-float v0, v0, p1

    if-gtz v0, :cond_1

    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_TELE:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mRange1XTo2XZoomRatioToEntrySpline:Landroid/util/Spline;

    invoke-virtual {v0, p1}, Landroid/util/Spline;->interpolate(F)F

    move-result p1

    return p1

    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mRange2XToMaxZoomRatioToEntrySpline:Landroid/util/Spline;

    invoke-virtual {v0, p1}, Landroid/util/Spline;->interpolate(F)F

    move-result p1

    return p1
.end method

.method public measureGap(I)F
    .locals 0

    invoke-static {p1}, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->drawTextForItemAt(I)Z

    move-result p1

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mLineTextGap:I

    int-to-float p1, p1

    return p1

    :cond_0
    iget p1, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mLineLineGap:I

    int-to-float p1, p1

    return p1
.end method

.method public measureWidth(I)F
    .locals 1

    invoke-static {p1}, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->drawTextForItemAt(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mEntryLayouts:[Landroid/text/StaticLayout;

    invoke-static {p1}, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->indexToSection(I)I

    move-result p1

    aget-object p1, v0, p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/text/StaticLayout;->getLineWidth(I)F

    move-result p1

    return p1

    :cond_0
    iget p1, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mLineWidth:I

    int-to-float p1, p1

    return p1
.end method

.method public onPositionSelect(Lcom/android/camera/ui/HorizontalSlideView;IF)V
    .locals 3

    iget-boolean p1, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mEnable:Z

    if-nez p1, :cond_0

    return-void

    :cond_0
    nop

    const/16 p1, 0xe

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-gt p2, p1, :cond_2

    sget p1, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_ULTR:F

    int-to-float p3, p2

    const v2, 0x3dcccccd    # 0.1f

    mul-float/2addr p3, v2

    add-float/2addr p1, p3

    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p1

    iget p3, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mCurrentValueIndex:I

    if-eq p3, p2, :cond_1

    goto :goto_0

    :cond_1
    move v1, v0

    :goto_0
    goto :goto_1

    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->getCount()I

    move-result p1

    sub-int/2addr p1, v1

    int-to-float p1, p1

    mul-float/2addr p3, p1

    invoke-virtual {p0, p3}, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mapPositionToZoomRatio(F)F

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p1

    iget-object p3, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mCurrentValue:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    xor-int/2addr v1, p3

    :goto_1
    if-eqz v1, :cond_4

    iget-object p3, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    iget v1, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mCurrentMode:I

    invoke-virtual {p3, v1, p1}, Lcom/android/camera/data/data/ComponentData;->setComponentValue(ILjava/lang/String;)V

    iget-object p3, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    if-eqz p3, :cond_3

    iget-object p3, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mCurrentValue:Ljava/lang/String;

    invoke-interface {p3, v1, v2, p1, v0}, Lcom/android/camera/fragment/manually/ManuallyListener;->onManuallyDataChanged(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;Ljava/lang/String;Z)V

    :cond_3
    iput-object p1, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mCurrentValue:Ljava/lang/String;

    iput p2, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mCurrentValueIndex:I

    :cond_4
    return-void
.end method

.method public setEnable(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;->mEnable:Z

    return-void
.end method
