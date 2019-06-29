.class public Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;
.super Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;
.source "ExtraSlideFNumberAdapter.java"

# interfaces
.implements Lcom/android/camera/ui/HorizontalSlideView$OnPositionSelectListener;


# static fields
.field private static final ENTRY_COUNT_TOTAL:I

.field public static final F_NUMBERS:[Ljava/lang/String;


# instance fields
.field private mComponentData:Lcom/android/camera/data/data/ComponentData;

.field private mCurrentMode:I

.field private mCurrentValue:Ljava/lang/String;

.field private mEnable:Z

.field private mLineCircleRadius:I

.field private mLineColorDefault:I

.field private mLineColorDefaultCircle:I

.field private mLineColorDivider:I

.field private mLineDefaultCircleGap:I

.field private mLineHalfHeight:F

.field private mLineLineGap:I

.field private mLineWidth:I

.field private mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

.field private mPaint:Landroid/graphics/Paint;

.field private mTextSize:I

.field private mValidFNumbers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 25

    const-string v0, "1.0"

    const-string v1, "1.1"

    const-string v2, "1.2"

    const-string v3, "1.4"

    const-string v4, "1.6"

    const-string v5, "1.8"

    const-string v6, "2"

    const-string v7, "2.2"

    const-string v8, "2.5"

    const-string v9, "2.8"

    const-string v10, "3.2"

    const-string v11, "3.5"

    const-string v12, "4"

    const-string v13, "4.5"

    const-string v14, "5.0"

    const-string v15, "5.6"

    const-string v16, "6.3"

    const-string v17, "7.1"

    const-string v18, "8"

    const-string v19, "9"

    const-string v20, "10"

    const-string v21, "11"

    const-string v22, "13"

    const-string v23, "14"

    const-string v24, "16"

    filled-new-array/range {v0 .. v24}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->F_NUMBERS:[Ljava/lang/String;

    sget-object v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->F_NUMBERS:[Ljava/lang/String;

    array-length v0, v0

    sput v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->ENTRY_COUNT_TOTAL:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;-><init>()V

    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    iput p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mCurrentMode:I

    iput-object p4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    sget-object p3, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->F_NUMBERS:[Ljava/lang/String;

    invoke-static {p3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p3

    iput-object p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mValidFNumbers:Ljava/util/List;

    iget p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mCurrentMode:I

    invoke-virtual {p2, p3}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mCurrentValue:Ljava/lang/String;

    move-object p2, p1

    check-cast p2, Lcom/android/camera/ActivityBase;

    invoke-virtual {p2}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p2

    check-cast p2, Lcom/android/camera/module/BaseModule;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->initStyle(Landroid/content/Context;)V

    return-void
.end method

.method private initStyle(Landroid/content/Context;)V
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    const v1, 0x7f0d0012

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v1

    iget v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mTextSize:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mTextSize:I

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a00d7

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iput v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mLineHalfHeight:F

    const v0, 0x7f0a00d9

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mLineWidth:I

    const v0, 0x7f0a00da

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mLineLineGap:I

    const v0, 0x7f0b006c

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mLineColorDefault:I

    const v0, 0x7f0b006d

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mLineColorDivider:I

    const v0, 0x7f0b006f

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mLineColorDefaultCircle:I

    const v0, 0x7f0a00db

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mLineCircleRadius:I

    const v0, 0x7f0a00dc

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mLineDefaultCircleGap:I

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mPaint:Landroid/graphics/Paint;

    iget-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mPaint:Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mPaint:Landroid/graphics/Paint;

    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mLineWidth:I

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mPaint:Landroid/graphics/Paint;

    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mTextSize:I

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    return-void

    :array_0
    .array-data 4
        0x1010095
        0x1010098
    .end array-data
.end method

.method private mapPositionToFNumber(F)Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->F_NUMBERS:[Ljava/lang/String;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    int-to-float v0, v0

    mul-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    sget-object v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->F_NUMBERS:[Ljava/lang/String;

    aget-object p1, v0, p1

    return-object p1
.end method


# virtual methods
.method public draw(ILandroid/graphics/Canvas;Z)V
    .locals 7

    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mLineColorDefault:I

    rem-int/lit8 v1, p1, 0x3

    if-nez v1, :cond_0

    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mLineColorDivider:I

    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    sget-object v2, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->F_NUMBERS:[Ljava/lang/String;

    aget-object p1, v2, p1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mi/config/a;->p(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    if-nez p3, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mPaint:Landroid/graphics/Paint;

    iget p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mLineColorDefaultCircle:I

    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setColor(I)V

    const/4 p1, 0x0

    iget p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mLineDefaultCircleGap:I

    neg-int p3, p3

    int-to-float p3, p3

    iget v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mLineCircleRadius:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p2, p1, p3, v1, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    const/4 v2, 0x0

    iget p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mLineHalfHeight:F

    neg-float v3, p1

    const/4 v4, 0x0

    iget v5, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mLineHalfHeight:F

    iget-object v6, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mPaint:Landroid/graphics/Paint;

    move-object v1, p2

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public getAlign(I)Landroid/graphics/Paint$Align;
    .locals 0

    sget-object p1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    return-object p1
.end method

.method public getCount()I
    .locals 1

    sget v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->ENTRY_COUNT_TOTAL:I

    return v0
.end method

.method public mapFNumberToPosition(Ljava/lang/String;)F
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mValidFNumbers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    int-to-float p1, p1

    const/high16 v0, 0x3f800000    # 1.0f

    mul-float/2addr p1, v0

    sget-object v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->F_NUMBERS:[Ljava/lang/String;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    int-to-float v0, v0

    div-float/2addr p1, v0

    return p1
.end method

.method public measureGap(I)F
    .locals 0

    iget p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mLineLineGap:I

    int-to-float p1, p1

    return p1
.end method

.method public measureWidth(I)F
    .locals 0

    iget p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mLineWidth:I

    int-to-float p1, p1

    return p1
.end method

.method public onPositionSelect(Lcom/android/camera/ui/HorizontalSlideView;IF)V
    .locals 2

    iget-boolean p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mEnable:Z

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-direct {p0, p3}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mapPositionToFNumber(F)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mCurrentValue:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    iget-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    iget p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mCurrentMode:I

    invoke-virtual {p2, p3, p1}, Lcom/android/camera/data/data/ComponentData;->setComponentValue(ILjava/lang/String;)V

    iget-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    iget-object p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mCurrentValue:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-interface {p2, p3, v0, p1, v1}, Lcom/android/camera/fragment/manually/ManuallyListener;->onManuallyDataChanged(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;Ljava/lang/String;Z)V

    :cond_1
    iput-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mCurrentValue:Ljava/lang/String;

    :cond_2
    return-void
.end method

.method public setEnable(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mEnable:Z

    return-void
.end method
