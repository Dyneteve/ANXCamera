.class public abstract Lcom/android/camera/FocusManagerAbstract;
.super Ljava/lang/Object;
.source "FocusManagerAbstract.java"


# static fields
.field public static final FOCUS_FROM_AUTO:I = 0x0

.field public static final FOCUS_FROM_FACE:I = 0x1

.field public static final FOCUS_FROM_FORCE:I = 0x4

.field public static final FOCUS_FROM_LONG_PRESS:I = 0x5

.field public static final FOCUS_FROM_NONE:I = -0x1

.field public static final FOCUS_FROM_OBJECT_TRACK:I = 0x2

.field public static final FOCUS_FROM_TOUCH:I = 0x3

.field public static final STATE_FAIL:I = 0x4

.field public static final STATE_FOCUSING:I = 0x1

.field public static final STATE_FOCUSING_SNAP_ON_FINISH:I = 0x2

.field public static final STATE_IDLE:I = 0x0

.field public static final STATE_SUCCESS:I = 0x3

.field private static final TAG:Ljava/lang/String; = "FocusManagerAbstract"


# instance fields
.field protected final FOCUS_AREA_HEIGHT:I

.field protected final FOCUS_AREA_SCALE:F

.field protected final FOCUS_AREA_WIDTH:I

.field protected final METERING_AREA_SCALE:F

.field protected mActiveArraySize:Landroid/graphics/Rect;

.field protected mCancelAutoFocusIfMove:Z

.field protected mDisplayOrientation:I

.field protected mFocusArea:[Landroid/hardware/camera2/params/MeteringRectangle;

.field protected mInitialized:Z

.field protected mMatrix:Landroid/graphics/Matrix;

.field protected mMeteringArea:[Landroid/hardware/camera2/params/MeteringRectangle;

.field protected mMirror:Z

.field protected mPreviewHeight:I

.field protected mPreviewWidth:I

.field protected mRenderHeight:I

.field protected mRenderWidth:I

.field protected mState:I


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/android/camera/FocusManagerAbstract;->mMatrix:Landroid/graphics/Matrix;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/FocusManagerAbstract;->mInitialized:Z

    iput v0, p0, Lcom/android/camera/FocusManagerAbstract;->mState:I

    nop

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a015f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/FocusManagerAbstract;->FOCUS_AREA_WIDTH:I

    nop

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0160

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/FocusManagerAbstract;->FOCUS_AREA_HEIGHT:I

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/android/camera/FocusManagerAbstract;->FOCUS_AREA_SCALE:F

    const v0, 0x3fe66666    # 1.8f

    iput v0, p0, Lcom/android/camera/FocusManagerAbstract;->METERING_AREA_SCALE:F

    return-void
.end method


# virtual methods
.method protected calculateTapArea(IIFIIIILandroid/graphics/Rect;)V
    .locals 0

    int-to-float p1, p1

    mul-float/2addr p1, p3

    float-to-int p1, p1

    int-to-float p2, p2

    mul-float/2addr p2, p3

    float-to-int p2, p2

    div-int/lit8 p3, p1, 0x2

    sub-int/2addr p4, p3

    sub-int/2addr p6, p1

    const/4 p3, 0x0

    invoke-static {p4, p3, p6}, Lcom/android/camera/Util;->clamp(III)I

    move-result p4

    div-int/lit8 p6, p2, 0x2

    sub-int/2addr p5, p6

    sub-int/2addr p7, p2

    invoke-static {p5, p3, p7}, Lcom/android/camera/Util;->clamp(III)I

    move-result p3

    new-instance p5, Landroid/graphics/RectF;

    int-to-float p6, p4

    int-to-float p7, p3

    add-int/2addr p4, p1

    int-to-float p1, p4

    add-int/2addr p3, p2

    int-to-float p2, p3

    invoke-direct {p5, p6, p7, p1, p2}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-static {p5, p8}, Lcom/android/camera/Util;->rectFToRect(Landroid/graphics/RectF;Landroid/graphics/Rect;)V

    return-void
.end method

.method public getPreviewHeight()I
    .locals 1

    iget v0, p0, Lcom/android/camera/FocusManagerAbstract;->mPreviewHeight:I

    return v0
.end method

.method public getPreviewWidth()I
    .locals 1

    iget v0, p0, Lcom/android/camera/FocusManagerAbstract;->mPreviewWidth:I

    return v0
.end method

.method public setDisplayOrientation(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/FocusManagerAbstract;->mDisplayOrientation:I

    invoke-virtual {p0}, Lcom/android/camera/FocusManagerAbstract;->setMatrix()V

    return-void
.end method

.method protected setMatrix()V
    .locals 11

    iget v0, p0, Lcom/android/camera/FocusManagerAbstract;->mPreviewWidth:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/FocusManagerAbstract;->mPreviewHeight:I

    if-eqz v0, :cond_0

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iget-boolean v2, p0, Lcom/android/camera/FocusManagerAbstract;->mMirror:Z

    iget v3, p0, Lcom/android/camera/FocusManagerAbstract;->mDisplayOrientation:I

    iget v4, p0, Lcom/android/camera/FocusManagerAbstract;->mRenderWidth:I

    iget v5, p0, Lcom/android/camera/FocusManagerAbstract;->mRenderHeight:I

    iget v1, p0, Lcom/android/camera/FocusManagerAbstract;->mPreviewWidth:I

    int-to-float v1, v1

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v1, v6

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v7

    iget v1, p0, Lcom/android/camera/FocusManagerAbstract;->mPreviewHeight:I

    int-to-float v1, v1

    div-float/2addr v1, v6

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v8

    iget-object v1, p0, Lcom/android/camera/FocusManagerAbstract;->mActiveArraySize:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v9

    iget-object v1, p0, Lcom/android/camera/FocusManagerAbstract;->mActiveArraySize:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v10

    move-object v1, v0

    move v6, v7

    move v7, v8

    move v8, v9

    move v9, v10

    invoke-static/range {v1 .. v9}, Lcom/android/camera/Util;->prepareMatrix(Landroid/graphics/Matrix;ZIIIIIII)V

    iget-object v1, p0, Lcom/android/camera/FocusManagerAbstract;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/FocusManagerAbstract;->mInitialized:Z

    :cond_0
    return-void
.end method

.method public setMirror(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/FocusManagerAbstract;->mMirror:Z

    invoke-virtual {p0}, Lcom/android/camera/FocusManagerAbstract;->setMatrix()V

    return-void
.end method

.method public abstract setPreviewSize(II)V
.end method

.method public setRenderSize(II)V
    .locals 1

    iget v0, p0, Lcom/android/camera/FocusManagerAbstract;->mRenderWidth:I

    if-ne p1, v0, :cond_0

    iget v0, p0, Lcom/android/camera/FocusManagerAbstract;->mRenderHeight:I

    if-eq p2, v0, :cond_1

    :cond_0
    iput p1, p0, Lcom/android/camera/FocusManagerAbstract;->mRenderWidth:I

    iput p2, p0, Lcom/android/camera/FocusManagerAbstract;->mRenderHeight:I

    const-string p1, "FocusManagerAbstract"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "setRenderSize: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/android/camera/FocusManagerAbstract;->mRenderWidth:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " | "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/android/camera/FocusManagerAbstract;->mRenderHeight:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/FocusManagerAbstract;->setMatrix()V

    :cond_1
    return-void
.end method
