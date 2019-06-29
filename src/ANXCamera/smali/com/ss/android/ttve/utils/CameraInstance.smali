.class public Lcom/ss/android/ttve/utils/CameraInstance;
.super Ljava/lang/Object;
.source "CameraInstance.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttve/utils/CameraInstance$CameraOpenCallback;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final ASSERT_MSG:Ljava/lang/String; = "\u68c0\u6d4b\u5230CameraDevice \u4e3a null! \u8bf7\u68c0\u67e5"

.field public static final DEFAULT_PREVIEW_RATE:I = 0x1e

.field public static final TAG:Ljava/lang/String; = "CameraInstance"

.field private static mThisInstance:Lcom/ss/android/ttve/utils/CameraInstance;


# instance fields
.field private comparatorBigger:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Landroid/hardware/Camera$Size;",
            ">;"
        }
    .end annotation
.end field

.field private comparatorSmaller:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Landroid/hardware/Camera$Size;",
            ">;"
        }
    .end annotation
.end field

.field private mCameraDevice:Landroid/hardware/Camera;

.field private mDefaultCameraID:I

.field private mFacing:I

.field private mIsPreviewing:Z

.field private mParams:Landroid/hardware/Camera$Parameters;

.field private mPictureHeight:I

.field private mPictureWidth:I

.field private mPreferPreviewHeight:I

.field private mPreferPreviewWidth:I

.field private mPreviewHeight:I

.field private mPreviewWidth:I

.field private mRotation:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mIsPreviewing:Z

    const/4 v1, -0x1

    iput v1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mDefaultCameraID:I

    const/16 v1, 0x500

    iput v1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPictureWidth:I

    const/16 v2, 0x2d0

    iput v2, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPictureHeight:I

    iput v1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPreferPreviewWidth:I

    iput v2, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPreferPreviewHeight:I

    iput v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mFacing:I

    new-instance v0, Lcom/ss/android/ttve/utils/CameraInstance$1;

    invoke-direct {v0, p0}, Lcom/ss/android/ttve/utils/CameraInstance$1;-><init>(Lcom/ss/android/ttve/utils/CameraInstance;)V

    iput-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->comparatorBigger:Ljava/util/Comparator;

    new-instance v0, Lcom/ss/android/ttve/utils/CameraInstance$2;

    invoke-direct {v0, p0}, Lcom/ss/android/ttve/utils/CameraInstance$2;-><init>(Lcom/ss/android/ttve/utils/CameraInstance;)V

    iput-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->comparatorSmaller:Ljava/util/Comparator;

    return-void
.end method

.method private static clamp(I)I
    .locals 2

    const/16 v0, -0x3e8

    const/16 v1, 0x3e8

    invoke-static {p0, v0, v1}, Lcom/ss/android/ttve/utils/CameraInstance;->clamp(III)I

    move-result p0

    return p0
.end method

.method private static clamp(III)I
    .locals 0

    if-le p0, p2, :cond_0

    return p2

    :cond_0
    if-ge p0, p1, :cond_1

    return p1

    :cond_1
    return p0
.end method

.method public static declared-synchronized getInstance()Lcom/ss/android/ttve/utils/CameraInstance;
    .locals 2

    const-class v0, Lcom/ss/android/ttve/utils/CameraInstance;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/ss/android/ttve/utils/CameraInstance;->mThisInstance:Lcom/ss/android/ttve/utils/CameraInstance;

    if-nez v1, :cond_0

    new-instance v1, Lcom/ss/android/ttve/utils/CameraInstance;

    invoke-direct {v1}, Lcom/ss/android/ttve/utils/CameraInstance;-><init>()V

    sput-object v1, Lcom/ss/android/ttve/utils/CameraInstance;->mThisInstance:Lcom/ss/android/ttve/utils/CameraInstance;

    :cond_0
    sget-object v1, Lcom/ss/android/ttve/utils/CameraInstance;->mThisInstance:Lcom/ss/android/ttve/utils/CameraInstance;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private rotateRectForOrientation(ILandroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 4

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    neg-int p1, p1

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->setRotate(F)V

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1, p2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1, p3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    iget v2, p1, Landroid/graphics/RectF;->left:F

    neg-float v2, v2

    iget v3, p1, Landroid/graphics/RectF;->top:F

    neg-float v3, v3

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->setTranslate(FF)V

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    iget v0, p1, Landroid/graphics/RectF;->left:F

    float-to-int v0, v0

    iget v2, p1, Landroid/graphics/RectF;->top:F

    float-to-int v2, v2

    iget v3, p1, Landroid/graphics/RectF;->right:F

    float-to-int v3, v3

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    float-to-int p1, p1

    invoke-virtual {p2, v0, v2, v3, p1}, Landroid/graphics/Rect;->set(IIII)V

    iget p1, v1, Landroid/graphics/RectF;->left:F

    float-to-int p1, p1

    iget p2, v1, Landroid/graphics/RectF;->top:F

    float-to-int p2, p2

    iget v0, v1, Landroid/graphics/RectF;->right:F

    float-to-int v0, v0

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    float-to-int v1, v1

    invoke-virtual {p3, p1, p2, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method private setCameraDisplayOrientation(Landroid/app/Activity;)V
    .locals 1

    invoke-virtual {p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object p1

    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Display;->getRotation()I

    move-result p1

    nop

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const/16 v0, 0x10e

    goto :goto_0

    :pswitch_1
    const/16 v0, 0xb4

    goto :goto_0

    :pswitch_2
    const/16 v0, 0x5a

    goto :goto_0

    :pswitch_3
    nop

    nop

    :goto_0
    invoke-virtual {p0, v0}, Lcom/ss/android/ttve/utils/CameraInstance;->setOrientationDegrees(I)I

    move-result p1

    iput p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mRotation:I

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public calculateTapArea(FFFI)Landroid/graphics/Rect;
    .locals 5

    const/high16 v0, 0x447a0000    # 1000.0f

    mul-float/2addr p3, v0

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Float;->intValue()I

    move-result p3

    const/high16 v0, 0x44fa0000    # 2000.0f

    mul-float/2addr p1, v0

    float-to-int p1, p1

    const/16 v1, 0x3e8

    sub-int/2addr p1, v1

    mul-float/2addr p2, v0

    float-to-int p2, p2

    sub-int/2addr p2, v1

    div-int/lit8 v0, p3, 0x2

    sub-int/2addr p1, v0

    const/16 v2, -0x3e8

    invoke-static {p1, v2, v1}, Lcom/ss/android/ttve/utils/CameraInstance;->clamp(III)I

    move-result p1

    sub-int/2addr p2, v0

    invoke-static {p2, v2, v1}, Lcom/ss/android/ttve/utils/CameraInstance;->clamp(III)I

    move-result p2

    new-instance v0, Landroid/graphics/RectF;

    int-to-float v3, p1

    int-to-float v4, p2

    add-int/2addr p1, p3

    invoke-static {p1}, Lcom/ss/android/ttve/utils/CameraInstance;->clamp(I)I

    move-result p1

    int-to-float p1, p1

    add-int/2addr p2, p3

    invoke-static {p2}, Lcom/ss/android/ttve/utils/CameraInstance;->clamp(I)I

    move-result p2

    int-to-float p2, p2

    invoke-direct {v0, v3, v4, p1, p2}, Landroid/graphics/RectF;-><init>(FFFF)V

    new-instance p1, Landroid/graphics/Rect;

    iget p2, v0, Landroid/graphics/RectF;->left:F

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    iget p3, v0, Landroid/graphics/RectF;->top:F

    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result p3

    iget v3, v0, Landroid/graphics/RectF;->right:F

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-direct {p1, p2, p3, v3, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2, v2, v2, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-direct {p0, p4, p2, p1}, Lcom/ss/android/ttve/utils/CameraInstance;->rotateRectForOrientation(ILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    new-instance p2, Landroid/graphics/Rect;

    iget p3, p1, Landroid/graphics/Rect;->left:I

    sub-int/2addr p3, v1

    iget p4, p1, Landroid/graphics/Rect;->top:I

    sub-int/2addr p4, v1

    iget v0, p1, Landroid/graphics/Rect;->right:I

    sub-int/2addr v0, v1

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr p1, v1

    invoke-direct {p2, p3, p4, v0, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    iget p1, p2, Landroid/graphics/Rect;->left:I

    invoke-static {p1}, Lcom/ss/android/ttve/utils/CameraInstance;->clamp(I)I

    move-result p1

    iput p1, p2, Landroid/graphics/Rect;->left:I

    iget p1, p2, Landroid/graphics/Rect;->right:I

    invoke-static {p1}, Lcom/ss/android/ttve/utils/CameraInstance;->clamp(I)I

    move-result p1

    iput p1, p2, Landroid/graphics/Rect;->right:I

    iget p1, p2, Landroid/graphics/Rect;->top:I

    invoke-static {p1}, Lcom/ss/android/ttve/utils/CameraInstance;->clamp(I)I

    move-result p1

    iput p1, p2, Landroid/graphics/Rect;->top:I

    iget p1, p2, Landroid/graphics/Rect;->bottom:I

    invoke-static {p1}, Lcom/ss/android/ttve/utils/CameraInstance;->clamp(I)I

    move-result p1

    iput p1, p2, Landroid/graphics/Rect;->bottom:I

    return-object p2
.end method

.method public focusAtPoint(FF)V
    .locals 1

    const v0, 0x3da3d70a    # 0.08f

    invoke-virtual {p0, p1, p2, v0}, Lcom/ss/android/ttve/utils/CameraInstance;->focusAtPoint(FFF)V

    return-void
.end method

.method public declared-synchronized focusAtPoint(FFF)V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    if-nez v0, :cond_0

    const-string p1, "CameraInstance"

    const-string p2, "Error: focus after release."

    invoke-static {p1, p2}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxNumMeteringAreas()I

    move-result v0

    if-lez v0, :cond_2

    iget v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mRotation:I

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/ss/android/ttve/utils/CameraInstance;->calculateTapArea(FFFI)Landroid/graphics/Rect;

    move-result-object p1

    const-string p2, "CameraInstance"

    const-string p3, "FocusAreas: [%d, %d, %d, %d]"

    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget v2, p1, Landroid/graphics/Rect;->left:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget v2, p1, Landroid/graphics/Rect;->top:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget v2, p1, Landroid/graphics/Rect;->right:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget v2, p1, Landroid/graphics/Rect;->bottom:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {p3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    new-instance p3, Landroid/hardware/Camera$Area;

    const/16 v0, 0x3e8

    invoke-direct {p3, p1, v0}, Landroid/hardware/Camera$Area;-><init>(Landroid/graphics/Rect;I)V

    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    iget-object p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    invoke-virtual {p1}, Landroid/hardware/Camera;->cancelAutoFocus()V

    sget-object p1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string p3, "Multilaser"

    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    sget-object p1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string p3, "MS40"

    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {p1, p2}, Landroid/hardware/Camera$Parameters;->setFocusAreas(Ljava/util/List;)V

    :cond_1
    iget-object p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {p1, p2}, Landroid/hardware/Camera$Parameters;->setMeteringAreas(Ljava/util/List;)V

    iget-object p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    const-string p2, "continuous-video"

    invoke-virtual {p1, p2}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    iget-object p2, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {p1, p2}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    iget-object p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    new-instance p2, Lcom/ss/android/ttve/utils/CameraInstance$3;

    invoke-direct {p2, p0}, Lcom/ss/android/ttve/utils/CameraInstance$3;-><init>(Lcom/ss/android/ttve/utils/CameraInstance;)V

    invoke-virtual {p1, p2}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_3
    const-string p2, "CameraInstance"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Error: focusAtPoint failed: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    goto :goto_1

    :cond_2
    const-string p1, "CameraInstance"

    const-string p2, "The device does not support metering areas..."

    invoke-static {p1, p2}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getCameraDevice()Landroid/hardware/Camera;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    return-object v0
.end method

.method public getCameraFacing()I
    .locals 1

    iget v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mFacing:I

    return v0
.end method

.method public declared-synchronized getParams()Landroid/hardware/Camera$Parameters;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_0
    nop

    const/4 v0, 0x0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getRotation()I
    .locals 1

    iget v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mRotation:I

    return v0
.end method

.method public initCamera(I)V
    .locals 11

    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    if-nez v0, :cond_0

    const-string p1, "CameraInstance"

    const-string v0, "initCamera: Camera is not opened!"

    invoke-static {p1, v0}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedPictureFormats()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const-string v4, "CameraInstance"

    const-string v5, "Picture Format: %x"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v2, v3

    invoke-static {v5, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    const/16 v1, 0x100

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setPictureFormat(I)V

    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    move-result-object v0

    nop

    iget-object v1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->comparatorBigger:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    move-object v4, v1

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/hardware/Camera$Size;

    if-eqz v4, :cond_2

    iget v6, v5, Landroid/hardware/Camera$Size;->width:I

    iget v7, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPictureWidth:I

    if-lt v6, v7, :cond_3

    iget v6, v5, Landroid/hardware/Camera$Size;->height:I

    iget v7, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPictureHeight:I

    if-lt v6, v7, :cond_3

    :cond_2
    nop

    move-object v4, v5

    :cond_3
    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v0

    nop

    iget-object v5, p0, Lcom/ss/android/ttve/utils/CameraInstance;->comparatorBigger:Ljava/util/Comparator;

    invoke-static {v0, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/4 v6, 0x2

    if-eqz v5, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/hardware/Camera$Size;

    const-string v7, "CameraInstance"

    const-string v8, "Supported preview size: %d x %d"

    new-array v6, v6, [Ljava/lang/Object;

    iget v9, v5, Landroid/hardware/Camera$Size;->width:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v6, v3

    iget v9, v5, Landroid/hardware/Camera$Size;->height:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v6, v2

    invoke-static {v8, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v1, :cond_5

    iget v6, v5, Landroid/hardware/Camera$Size;->width:I

    iget v7, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPreferPreviewWidth:I

    if-lt v6, v7, :cond_6

    iget v6, v5, Landroid/hardware/Camera$Size;->height:I

    iget v7, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPreferPreviewHeight:I

    if-lt v6, v7, :cond_6

    :cond_5
    nop

    move-object v1, v5

    :cond_6
    goto :goto_2

    :cond_7
    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFrameRates()Ljava/util/List;

    move-result-object v0

    iget-object v5, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    iget v7, v1, Landroid/hardware/Camera$Size;->width:I

    iget v1, v1, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v5, v7, v1}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    iget-object v1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    iget v5, v4, Landroid/hardware/Camera$Size;->width:I

    iget v4, v4, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v1, v5, v4}, Landroid/hardware/Camera$Parameters;->setPictureSize(II)V

    iget-object v1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v1

    const-string v4, "continuous-video"

    invoke-interface {v1, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    iget-object v1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    const-string v4, "continuous-video"

    invoke-virtual {v1, v4}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    :cond_8
    const/16 v1, 0x1e

    mul-int/lit8 v4, p1, 0x2

    div-int/lit8 v4, v4, 0x3

    mul-int/lit8 p1, p1, 0x4

    div-int/lit8 p1, p1, 0x3

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move v5, v1

    move v1, v3

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    const-string v8, "CameraInstance"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Supported frame rate: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/ss/android/ttve/common/TELogUtil;->v(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-ge v1, v8, :cond_9

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v1

    :cond_9
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-le v5, v8, :cond_a

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v5

    :cond_a
    goto :goto_3

    :cond_b
    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    const-string v1, "CameraInstance"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "FpsRange = ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    mul-int/lit16 v0, v0, 0x3e8

    mul-int/lit16 p1, p1, 0x3e8

    invoke-virtual {v1, v0, p1}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    new-array p1, v6, [I

    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0, p1}, Landroid/hardware/Camera$Parameters;->getPreviewFpsRange([I)V

    const-string v0, "CameraInstance"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "FpsRange = ["

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v4, p1, v3

    div-int/lit16 v4, v4, 0x3e8

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget p1, p1, v2

    div-int/lit16 p1, p1, 0x3e8

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "]"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    iget-object p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_4
    iget-object p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    iget-object p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getPictureSize()Landroid/hardware/Camera$Size;

    move-result-object p1

    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v0

    iget v1, v0, Landroid/hardware/Camera$Size;->width:I

    iput v1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPreviewWidth:I

    iget v1, v0, Landroid/hardware/Camera$Size;->height:I

    iput v1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPreviewHeight:I

    iget v1, p1, Landroid/hardware/Camera$Size;->width:I

    iput v1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPictureWidth:I

    iget v1, p1, Landroid/hardware/Camera$Size;->height:I

    iput v1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPictureHeight:I

    const-string v1, "CameraInstance"

    const-string v4, "Camera Picture Size: %d x %d"

    new-array v5, v6, [Ljava/lang/Object;

    iget v7, p1, Landroid/hardware/Camera$Size;->width:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v3

    iget p1, p1, Landroid/hardware/Camera$Size;->height:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v5, v2

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "CameraInstance"

    const-string v1, "Camera Preview Size: %d x %d"

    new-array v4, v6, [Ljava/lang/Object;

    iget v5, v0, Landroid/hardware/Camera$Size;->width:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v3

    iget v0, v0, Landroid/hardware/Camera$Size;->height:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v4, v2

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public isCameraOpened()Z
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isPreviewing()Z
    .locals 1

    iget-boolean v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mIsPreviewing:Z

    return v0
.end method

.method public isUsingFrontCamera()Z
    .locals 2

    iget v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mFacing:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public pictureHeight()I
    .locals 1

    iget v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPictureHeight:I

    return v0
.end method

.method public pictureWidth()I
    .locals 1

    iget v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPictureWidth:I

    return v0
.end method

.method public previewHeight()I
    .locals 1

    iget v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPreviewHeight:I

    return v0
.end method

.method public previewWidth()I
    .locals 1

    iget v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPreviewWidth:I

    return v0
.end method

.method public declared-synchronized setFocusMode(Ljava/lang/String;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0, p1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setOrientationDegrees(I)I
    .locals 3

    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    iget v1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mDefaultCameraID:I

    invoke-static {v1, v0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    iget v1, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    iget v0, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    add-int/2addr v0, p1

    rem-int/lit16 v0, v0, 0x168

    rsub-int p1, v0, 0x168

    add-int/lit16 p1, p1, 0xb4

    rem-int/lit16 p1, p1, 0x168

    goto :goto_0

    :cond_0
    iget v0, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    sub-int/2addr v0, p1

    add-int/lit16 v0, v0, 0x168

    rem-int/lit16 p1, v0, 0x168

    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    invoke-virtual {v0, p1}, Landroid/hardware/Camera;->setDisplayOrientation(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    :goto_1
    return p1
.end method

.method public declared-synchronized setParams(Landroid/hardware/Camera$Parameters;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    iput-object p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    iget-object p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    nop

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setPictureSize(IIZ)V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    if-nez v0, :cond_0

    iput p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPictureWidth:I

    iput p2, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPictureHeight:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz p3, :cond_3

    iget-object p3, p0, Lcom/ss/android/ttve/utils/CameraInstance;->comparatorBigger:Ljava/util/Comparator;

    invoke-static {v0, p3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Camera$Size;

    if-eqz v1, :cond_1

    iget v2, v0, Landroid/hardware/Camera$Size;->width:I

    if-lt v2, p1, :cond_2

    iget v2, v0, Landroid/hardware/Camera$Size;->height:I

    if-lt v2, p2, :cond_2

    :cond_1
    nop

    move-object v1, v0

    :cond_2
    goto :goto_0

    :cond_3
    iget-object p3, p0, Lcom/ss/android/ttve/utils/CameraInstance;->comparatorSmaller:Ljava/util/Comparator;

    invoke-static {v0, p3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_1
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Camera$Size;

    if-eqz v1, :cond_4

    iget v2, v0, Landroid/hardware/Camera$Size;->width:I

    if-gt v2, p1, :cond_5

    iget v2, v0, Landroid/hardware/Camera$Size;->height:I

    if-gt v2, p2, :cond_5

    :cond_4
    nop

    move-object v1, v0

    :cond_5
    goto :goto_1

    :cond_6
    iget p1, v1, Landroid/hardware/Camera$Size;->width:I

    iput p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPictureWidth:I

    iget p1, v1, Landroid/hardware/Camera$Size;->height:I

    iput p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPictureHeight:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    iget-object p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    iget p2, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPictureWidth:I

    iget p3, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPictureHeight:I

    invoke-virtual {p1, p2, p3}, Landroid/hardware/Camera$Parameters;->setPictureSize(II)V

    iget-object p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    iget-object p2, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {p1, p2}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    :catch_0
    move-exception p1

    :try_start_3
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setPreferPreviewSize(II)V
    .locals 0

    iput p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPreferPreviewHeight:I

    iput p2, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mPreferPreviewWidth:I

    return-void
.end method

.method public declared-synchronized startPreview(Landroid/graphics/SurfaceTexture;)V
    .locals 3

    monitor-enter p0

    :try_start_0
    const-string v0, "CameraInstance"

    const-string v1, "Camera startPreview..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mIsPreviewing:Z

    if-eqz v0, :cond_0

    const-string p1, "CameraInstance"

    const-string v0, "Camera is previewing..."

    invoke-static {p1, v0}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_1

    :try_start_2
    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    invoke-virtual {v0, p1}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V

    iget-object p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    invoke-virtual {p1}, Landroid/hardware/Camera;->startPreview()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mIsPreviewing:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_3
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    const-string v0, "CameraInstance"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startPreview: Error "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mIsPreviewing:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    iget-object p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    invoke-virtual {p1}, Landroid/hardware/Camera;->release()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    :catch_1
    move-exception p1

    :try_start_5
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :cond_1
    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized stopCamera()V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "CameraInstance"

    const-string v1, "stopCamera..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mIsPreviewing:Z

    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x0

    :try_start_1
    iget-object v1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    invoke-virtual {v1, v0}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v1

    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    iget-object v1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->release()V

    iput-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stopPreview()V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "CameraInstance"

    const-string v1, "Camera stopPreview..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mIsPreviewing:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mIsPreviewing:Z

    iget-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    const-string v0, "CameraInstance"

    const-string v1, "Camera stopped!"

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public tryOpenCamera(Lcom/ss/android/ttve/utils/CameraInstance$CameraOpenCallback;)Z
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/ss/android/ttve/utils/CameraInstance;->tryOpenCamera(Lcom/ss/android/ttve/utils/CameraInstance$CameraOpenCallback;I)Z

    move-result p1

    return p1
.end method

.method public declared-synchronized tryOpenCamera(Lcom/ss/android/ttve/utils/CameraInstance$CameraOpenCallback;I)Z
    .locals 6

    monitor-enter p0

    :try_start_0
    const-string v0, "CameraInstance"

    const-string/jumbo v1, "try open camera..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_1
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x8

    if-le v2, v3, :cond_1

    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v2

    new-instance v3, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v3}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    move v4, v1

    :goto_0
    if-ge v4, v2, :cond_1

    invoke-static {v4, v3}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    iget v5, v3, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-ne v5, p2, :cond_0

    iput v4, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mDefaultCameraID:I

    iput p2, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mFacing:I

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/ss/android/ttve/utils/CameraInstance;->stopPreview()V

    iget-object p2, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    invoke-virtual {p2}, Landroid/hardware/Camera;->release()V

    :cond_2
    iget p2, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mDefaultCameraID:I

    if-ltz p2, :cond_3

    iget p2, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mDefaultCameraID:I

    invoke-static {p2}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object p2

    iput-object p2, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    goto :goto_1

    :cond_3
    invoke-static {}, Landroid/hardware/Camera;->open()Landroid/hardware/Camera;

    move-result-object p2

    iput-object p2, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    iput v1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mFacing:I

    :goto_1
    invoke-virtual {p0, v1}, Lcom/ss/android/ttve/utils/CameraInstance;->setOrientationDegrees(I)I

    move-result p2

    iput p2, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mRotation:I

    const-string p2, "CameraInstance"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Camera rotation = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mRotation:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p2, v2}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    nop

    :try_start_2
    iget-object p2, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    if-eqz p2, :cond_5

    const-string p2, "CameraInstance"

    const-string v2, "Camera opened!"

    invoke-static {p2, v2}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const/16 p2, 0x1e

    :try_start_3
    invoke-virtual {p0, p2}, Lcom/ss/android/ttve/utils/CameraInstance;->initCamera(I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    nop

    if-eqz p1, :cond_4

    :try_start_4
    invoke-interface {p1}, Lcom/ss/android/ttve/utils/CameraInstance$CameraOpenCallback;->cameraReady()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :cond_4
    monitor-exit p0

    const/4 p1, 0x1

    return p1

    :catch_0
    move-exception p1

    :try_start_5
    iget-object p1, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;

    invoke-virtual {p1}, Landroid/hardware/Camera;->release()V

    iput-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    monitor-exit p0

    return v1

    :cond_5
    monitor-exit p0

    return v1

    :catch_1
    move-exception p1

    :try_start_6
    const-string p2, "CameraInstance"

    const-string v2, "Open Camera Failed!"

    invoke-static {p2, v2}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    iput-object v0, p0, Lcom/ss/android/ttve/utils/CameraInstance;->mCameraDevice:Landroid/hardware/Camera;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
