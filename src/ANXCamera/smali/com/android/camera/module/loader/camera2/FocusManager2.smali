.class public Lcom/android/camera/module/loader/camera2/FocusManager2;
.super Lcom/android/camera/FocusManagerAbstract;
.source "FocusManager2.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;,
        Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;
    }
.end annotation


# static fields
.field private static final FOCUS_TIME_OUT:I = 0xfa0

.field private static final FORCE_RESET_TOUCH_FOCUS:I = 0x1

.field private static final FORCE_RESET_TOUCH_FOCUS_DELAY:I = 0x1388

.field private static final MAX_FACE_MOVE:I = 0x50

.field private static final RESET_TOUCH_FOCUS:I = 0x0

.field private static final RESET_TOUCH_FOCUS_DELAY:I = 0xbb8

.field private static final TAG:Ljava/lang/String; = "FocusManager"

.field private static final TAP_ACTION_AE:I = 0x1

.field private static final TAP_ACTION_AE_AND_AF:I = 0x2


# instance fields
.field private mAELockOnlySupported:Z

.field private mAeAwbLock:Z

.field private mCafStartTime:J

.field private mCameraFocusArea:Landroid/graphics/Rect;

.field private mCameraMeteringArea:Landroid/graphics/Rect;

.field private mDestroyed:Z

.field private mFocusAreaSupported:Z

.field private mFocusMode:Ljava/lang/String;

.field private mFocusResultConsumer:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer<",
            "Lcom/android/camera/module/loader/camera2/FocusTask;",
            ">;"
        }
    .end annotation
.end field

.field private mFocusResultDisposable:Lio/reactivex/disposables/Disposable;

.field private mFocusResultEmitter:Lio/reactivex/ObservableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableEmitter<",
            "Lcom/android/camera/module/loader/camera2/FocusTask;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private mKeepFocusUIState:Z

.field private mLastFocusFrom:I

.field private mLastState:I

.field private mLatestFocusFace:Landroid/graphics/RectF;

.field private mLatestFocusTime:J

.field private mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

.field private final mLock:Ljava/lang/Object;

.field private mLockAeAwbNeeded:Z

.field private mMeteringAreaSupported:Z

.field private mOverrideFocusMode:Ljava/lang/String;

.field private mPendingMultiCapture:Z

.field private mSupportedFocusModes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/camera2/CameraCapabilities;Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;ZLandroid/os/Looper;)V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/FocusManagerAbstract;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLock:Ljava/lang/Object;

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastState:I

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    new-instance v0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;

    invoke-direct {v0, p0}, Lcom/android/camera/module/loader/camera2/FocusManager2$2;-><init>(Lcom/android/camera/module/loader/camera2/FocusManager2;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusResultConsumer:Lio/reactivex/functions/Consumer;

    new-instance v0, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;

    invoke-direct {v0, p0, p4}, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;-><init>(Lcom/android/camera/module/loader/camera2/FocusManager2;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setCharacteristics(Lcom/android/camera2/CameraCapabilities;)V

    iput-object p2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-virtual {p0, p3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setMirror(Z)V

    new-instance p1, Lcom/android/camera/module/loader/camera2/FocusManager2$1;

    invoke-direct {p1, p0}, Lcom/android/camera/module/loader/camera2/FocusManager2$1;-><init>(Lcom/android/camera/module/loader/camera2/FocusManager2;)V

    invoke-static {p1}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object p1

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    iget-object p2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusResultConsumer:Lio/reactivex/functions/Consumer;

    invoke-virtual {p1, p2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusResultDisposable:Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setLastFocusState(I)V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/camera/module/loader/camera2/FocusManager2;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    return p0
.end method

.method static synthetic access$1100(Lcom/android/camera/module/loader/camera2/FocusManager2;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    return p0
.end method

.method static synthetic access$1200(Lcom/android/camera/module/loader/camera2/FocusManager2;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/android/camera/module/loader/camera2/FocusManager2;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    return p0
.end method

.method static synthetic access$1400(Lcom/android/camera/module/loader/camera2/FocusManager2;)Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/android/camera/module/loader/camera2/FocusManager2;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mMirror:Z

    return p0
.end method

.method static synthetic access$1600(Lcom/android/camera/module/loader/camera2/FocusManager2;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$1702(Lcom/android/camera/module/loader/camera2/FocusManager2;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    return p1
.end method

.method static synthetic access$1800(Lcom/android/camera/module/loader/camera2/FocusManager2;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    return p0
.end method

.method static synthetic access$200(Lcom/android/camera/module/loader/camera2/FocusManager2;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPendingMultiCapture:Z

    return p0
.end method

.method static synthetic access$300(Lcom/android/camera/module/loader/camera2/FocusManager2;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->multiCapture()V

    return-void
.end method

.method static synthetic access$400(Lcom/android/camera/module/loader/camera2/FocusManager2;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->capture()V

    return-void
.end method

.method static synthetic access$502(Lcom/android/camera/module/loader/camera2/FocusManager2;Lio/reactivex/ObservableEmitter;)Lio/reactivex/ObservableEmitter;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusResultEmitter:Lio/reactivex/ObservableEmitter;

    return-object p1
.end method

.method static synthetic access$600(Lcom/android/camera/module/loader/camera2/FocusManager2;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$700(Lcom/android/camera/module/loader/camera2/FocusManager2;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mDestroyed:Z

    return p0
.end method

.method static synthetic access$800(Lcom/android/camera/module/loader/camera2/FocusManager2;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    return p0
.end method

.method static synthetic access$900(Lcom/android/camera/module/loader/camera2/FocusManager2;ZZ)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onAutoFocusMoving(ZZ)V

    return-void
.end method

.method private afaeRectangle(Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 6

    const/4 v0, 0x1

    new-array v1, v0, [Landroid/hardware/camera2/params/MeteringRectangle;

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2, p1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v5, v4

    invoke-virtual {p1, v3, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-virtual {p1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr p1, v3

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    move-result p3

    int-to-float p3, p3

    div-float/2addr v3, p3

    iget p3, v2, Landroid/graphics/RectF;->left:F

    mul-float/2addr p3, p1

    iget v4, p2, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    add-float/2addr p3, v4

    iput p3, v2, Landroid/graphics/RectF;->left:F

    iget p3, v2, Landroid/graphics/RectF;->top:F

    mul-float/2addr p3, v3

    iget v4, p2, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    add-float/2addr p3, v4

    iput p3, v2, Landroid/graphics/RectF;->top:F

    iget p3, v2, Landroid/graphics/RectF;->right:F

    mul-float/2addr p3, p1

    iget p1, p2, Landroid/graphics/Rect;->left:I

    int-to-float p1, p1

    add-float/2addr p3, p1

    iput p3, v2, Landroid/graphics/RectF;->right:F

    iget p1, v2, Landroid/graphics/RectF;->bottom:F

    mul-float/2addr p1, v3

    iget p3, p2, Landroid/graphics/Rect;->top:I

    int-to-float p3, p3

    add-float/2addr p1, p3

    iput p1, v2, Landroid/graphics/RectF;->bottom:F

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    invoke-static {v2, p1}, Lcom/android/camera/Util;->rectFToRect(Landroid/graphics/RectF;Landroid/graphics/Rect;)V

    iget p3, p1, Landroid/graphics/Rect;->left:I

    iget v2, p2, Landroid/graphics/Rect;->left:I

    iget v3, p2, Landroid/graphics/Rect;->right:I

    invoke-static {p3, v2, v3}, Lcom/android/camera/Util;->clamp(III)I

    move-result p3

    iput p3, p1, Landroid/graphics/Rect;->left:I

    iget p3, p1, Landroid/graphics/Rect;->top:I

    iget v2, p2, Landroid/graphics/Rect;->top:I

    iget v3, p2, Landroid/graphics/Rect;->bottom:I

    invoke-static {p3, v2, v3}, Lcom/android/camera/Util;->clamp(III)I

    move-result p3

    iput p3, p1, Landroid/graphics/Rect;->top:I

    iget p3, p1, Landroid/graphics/Rect;->right:I

    iget v2, p2, Landroid/graphics/Rect;->left:I

    iget v3, p2, Landroid/graphics/Rect;->right:I

    invoke-static {p3, v2, v3}, Lcom/android/camera/Util;->clamp(III)I

    move-result p3

    iput p3, p1, Landroid/graphics/Rect;->right:I

    iget p3, p1, Landroid/graphics/Rect;->bottom:I

    iget v2, p2, Landroid/graphics/Rect;->top:I

    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    invoke-static {p3, v2, p2}, Lcom/android/camera/Util;->clamp(III)I

    move-result p2

    iput p2, p1, Landroid/graphics/Rect;->bottom:I

    invoke-static {p1, v0}, Lcom/android/camera/Util;->createMeteringRectangleFrom(Landroid/graphics/Rect;I)Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, v1, p2

    return-object v1
.end method

.method private capture()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->onWaitingFocusFinished()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/mi/config/b;->hV()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-direct {p0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    iput-boolean v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    :cond_0
    iput-boolean v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPendingMultiCapture:Z

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    :cond_1
    return-void
.end method

.method private focusPoint(IIIZ)V
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-eqz v0, :cond_8

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_8

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mOverrideFocusMode:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mOverrideFocusMode:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isAutoFocusMode(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isNeedCancelAutoFocus()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->cancelFocus()V

    :cond_1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeParameters(IIIZ)V

    const/4 v0, 0x1

    invoke-direct {p0, v0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeFocusIndicator(III)V

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->notifyFocusAreaUpdate()V

    const/4 p1, 0x5

    const/4 p2, 0x0

    if-ne p3, p1, :cond_2

    iget-boolean p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAELockOnlySupported:Z

    if-eqz p1, :cond_2

    move p1, v0

    goto :goto_0

    :cond_2
    nop

    move p1, p2

    :goto_0
    iget-boolean v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusAreaSupported:Z

    if-eqz v1, :cond_3

    if-eqz p4, :cond_4

    :cond_3
    if-eqz p1, :cond_5

    :cond_4
    invoke-direct {p0, p3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusValid(I)Z

    move-result p1

    if-eqz p1, :cond_7

    invoke-direct {p0, p3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->startFocus(I)V

    goto :goto_1

    :cond_5
    iget-boolean p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mMeteringAreaSupported:Z

    if-eqz p1, :cond_7

    const/4 p1, 0x3

    if-ne p1, p3, :cond_6

    invoke-direct {p0, p3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusValid(I)Z

    move-result p4

    if-eqz p4, :cond_6

    iget-object p4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {p4, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->playFocusSound(I)V

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    :cond_6
    iput p3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeMessages(I)V

    :cond_7
    :goto_1
    return-void

    :cond_8
    :goto_2
    return-void
.end method

.method private getTapAction()I
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusMode()Ljava/lang/String;

    move-result-object v0

    const-string v1, "edof"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "manual"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method private initializeFocusAreas(IIIIII)V
    .locals 9

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraFocusArea:Landroid/graphics/Rect;

    if-nez v1, :cond_0

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraFocusArea:Landroid/graphics/Rect;

    :cond_0
    const/high16 v3, 0x3f800000    # 1.0f

    iget-object v8, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraFocusArea:Landroid/graphics/Rect;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-virtual/range {v0 .. v8}, Lcom/android/camera/module/loader/camera2/FocusManager2;->calculateTapArea(IIFIIIILandroid/graphics/Rect;)V

    return-void
.end method

.method private initializeFocusIndicator(III)V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewPosition(III)V

    :cond_0
    return-void
.end method

.method private initializeMeteringAreas(IIIIIII)V
    .locals 9

    move-object v0, p0

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa6

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v2, 0x1

    move/from16 v3, p7

    if-ne v3, v2, :cond_0

    if-eqz v1, :cond_0

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isNeedExposure(I)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraMeteringArea:Landroid/graphics/Rect;

    return-void

    :cond_0
    iget-object v1, v0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraMeteringArea:Landroid/graphics/Rect;

    if-nez v1, :cond_1

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, v0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraMeteringArea:Landroid/graphics/Rect;

    :cond_1
    const v3, 0x3fe66666    # 1.8f

    iget-object v8, v0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraMeteringArea:Landroid/graphics/Rect;

    move v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-virtual/range {v0 .. v8}, Lcom/android/camera/module/loader/camera2/FocusManager2;->calculateTapArea(IIFIIIILandroid/graphics/Rect;)V

    return-void
.end method

.method private initializeParameters(IIIZ)V
    .locals 8

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusAreaSupported:Z

    if-eqz v0, :cond_0

    if-nez p4, :cond_0

    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_WIDTH:I

    iget v3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_HEIGHT:I

    iget v6, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    iget v7, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    move-object v1, p0

    move v4, p1

    move v5, p2

    invoke-direct/range {v1 .. v7}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeFocusAreas(IIIIII)V

    :cond_0
    iget-boolean p4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mMeteringAreaSupported:Z

    if-eqz p4, :cond_1

    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_WIDTH:I

    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_HEIGHT:I

    iget v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    iget v6, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v7, p3

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeMeteringAreas(IIIIIII)V

    :cond_1
    return-void
.end method

.method private isAutoFocusMode(Ljava/lang/String;)Z
    .locals 1

    const-string v0, "auto"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "macro"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private isFocusEnabled()Z
    .locals 3

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->needAutoFocusCall()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private isFocusValid(I)Z
    .locals 7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    const/4 v3, 0x3

    if-eq v2, v3, :cond_1

    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    const/4 v4, 0x4

    if-ne v2, v4, :cond_0

    goto :goto_0

    :cond_0
    const-wide/16 v4, 0xfa0

    goto :goto_1

    :cond_1
    :goto_0
    const-wide/16 v4, 0x1388

    :goto_1
    const/4 v6, 0x1

    if-ge p1, v3, :cond_4

    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    if-ge p1, v2, :cond_4

    iget-wide v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusTime:J

    invoke-static/range {v0 .. v5}, Lcom/android/camera/Util;->isTimeout(JJJ)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_2

    :cond_2
    iget p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    if-ne p1, v6, :cond_3

    const/4 p1, 0x7

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetTouchFocus(I)V

    :cond_3
    const/4 p1, 0x0

    return p1

    :cond_4
    :goto_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusTime:J

    return v6
.end method

.method private lockAeAwbIfNeeded()V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLockAeAwbNeeded:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAeAwbLock:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAeAwbLock:Z

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->notifyFocusAreaUpdate()V

    :cond_0
    return-void
.end method

.method private multiCapture()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->multiCapture()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPendingMultiCapture:Z

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeMessages(I)V

    :cond_0
    return-void
.end method

.method private needAutoFocusCall()Z
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getTapAction()I

    move-result v0

    const/4 v1, 0x2

    if-ne v1, v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusAreaSupported:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private onAutoFocusMoving(ZZ)V
    .locals 12

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-nez v0, :cond_0

    const-string p1, "FocusManager"

    const-string p2, "onAutoFocusMoving"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    nop

    const/4 v1, 0x0

    const/4 v2, 0x3

    const/4 v3, 0x1

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v4

    invoke-interface {v0, v4}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isFaceExists(I)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    nop

    move v4, v1

    goto :goto_0

    :cond_1
    move v4, v3

    :goto_0
    const-string v5, "FocusManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onAutoFocusMoving: mode="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusMode()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " show="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraFocusArea:Landroid/graphics/Rect;

    if-nez v5, :cond_b

    const-string v5, "auto"

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusMode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    goto/16 :goto_4

    :cond_2
    if-eqz v0, :cond_3

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewType(Z)V

    :cond_3
    const/4 v5, 0x2

    if-eqz p1, :cond_5

    iget p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-eq p1, v5, :cond_4

    invoke-direct {p0, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v3}, Landroid/os/Handler;->removeMessages(I)V

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    const-wide/16 v1, 0x1388

    invoke-virtual {p1, v3, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_4
    const-string p1, "FocusManager"

    const-string p2, "Camera KPI: CAF start"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCafStartTime:J

    if-eqz v4, :cond_a

    if-eqz v0, :cond_a

    invoke-interface {v0, v5, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showIndicator(II)V

    goto :goto_3

    :cond_5
    iget p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const-string v6, "FocusManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Camera KPI: CAF stop: Focus time: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    iget-wide v10, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCafStartTime:J

    sub-long/2addr v8, v10

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p2, :cond_6

    invoke-direct {p0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    invoke-direct {p0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setLastFocusState(I)V

    goto :goto_1

    :cond_6
    const/4 v6, 0x4

    invoke-direct {p0, v6}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    invoke-direct {p0, v6}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setLastFocusState(I)V

    :goto_1
    iget-object v6, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v6, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v3}, Landroid/os/Handler;->removeMessages(I)V

    if-eqz v4, :cond_8

    if-eqz v0, :cond_8

    nop

    if-eqz p2, :cond_7

    move p2, v5

    goto :goto_2

    :cond_7
    nop

    move p2, v2

    :goto_2
    invoke-interface {v0, v5, p2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showIndicator(II)V

    :cond_8
    if-ne p1, v5, :cond_a

    invoke-direct {p0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    iget-boolean p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPendingMultiCapture:Z

    if-eqz p1, :cond_9

    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->multiCapture()V

    goto :goto_3

    :cond_9
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->capture()V

    :cond_a
    :goto_3
    return-void

    :cond_b
    :goto_4
    return-void
.end method

.method private onlyAe()Z
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getTapAction()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private resetFocusAreaToCenter()V
    .locals 7

    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_WIDTH:I

    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_HEIGHT:I

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    div-int/lit8 v3, v0, 0x2

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    div-int/lit8 v4, v0, 0x2

    iget v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    iget v6, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeFocusAreas(IIIIII)V

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    div-int/lit8 v1, v1, 0x2

    const/4 v2, 0x5

    invoke-direct {p0, v2, v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeFocusIndicator(III)V

    return-void
.end method

.method private resetFocusAreaToFaceArea()Z
    .locals 10

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isFaceExists(I)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getFocusRect(I)Landroid/graphics/RectF;

    move-result-object v0

    if-eqz v0, :cond_0

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusFace:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget v2, v0, Landroid/graphics/RectF;->right:F

    add-float/2addr v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    float-to-int v6, v1

    iget v1, v0, Landroid/graphics/RectF;->top:F

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v1, v0

    div-float/2addr v1, v2

    float-to-int v7, v1

    iget v4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_WIDTH:I

    iget v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_HEIGHT:I

    iget v8, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    iget v9, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    move-object v3, p0

    invoke-direct/range {v3 .. v9}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeFocusAreas(IIIIII)V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private setFocusState(I)V
    .locals 3

    const-string v0, "FocusManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setFocusState: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iput p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    return-void
.end method

.method private setLastFocusState(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastState:I

    return-void
.end method

.method private startFocus(I)V
    .locals 3

    const-string v0, "FocusManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startFocus: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "auto"

    invoke-virtual {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusMode(Ljava/lang/String;)Ljava/lang/String;

    iput p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne p1, v2, :cond_0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result p1

    if-ne v2, p1, :cond_1

    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {p1, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->stopObjectTracking(Z)V

    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->startFocus()V

    invoke-direct {p0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v2}, Landroid/os/Handler;->removeMessages(I)V

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    const-wide/16 v0, 0x1388

    invoke-virtual {p1, v2, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method private unlockAeAwbIfNeeded()V
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLockAeAwbNeeded:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAeAwbLock:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAeAwbLock:Z

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->notifyFocusAreaUpdate()V

    :cond_0
    return-void
.end method


# virtual methods
.method public canRecord()Z
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusing()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public cancelFocus()V
    .locals 4

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusMode()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusMode(Ljava/lang/String;)Ljava/lang/String;

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetTouchFocus(I)V

    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->needAutoFocusCall()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->cancelFocus(Z)V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v1}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->notifyFocusAreaUpdate()V

    :goto_0
    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v3, 0x0

    if-eq v0, v1, :cond_1

    invoke-direct {p0, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    goto :goto_1

    :cond_1
    const-string v0, "FocusManager"

    const-string/jumbo v1, "waiting focus timeout!"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    iput-boolean v3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    const-string v0, "FocusManager"

    const-string v1, "cancelFocus"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public cancelLongPressedAutoFocus()V
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-direct {p0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setLastFocusState(I)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method public cancelMultiSnapPending()Z
    .locals 3

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPendingMultiCapture:Z

    if-eqz v0, :cond_0

    iput-boolean v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPendingMultiCapture:Z

    const/4 v0, 0x1

    return v0

    :cond_0
    return v1
.end method

.method public destroy()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mDestroyed:Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->removeMessages()V

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusResultDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public doMultiSnap(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->multiCapture()V

    :cond_1
    iget p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v0, 0x3

    if-eq p1, v0, :cond_4

    iget p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v0, 0x4

    if-eq p1, v0, :cond_4

    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->needAutoFocusCall()Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    iget p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_3

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPendingMultiCapture:Z

    goto :goto_1

    :cond_3
    iget p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-nez p1, :cond_5

    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->multiCapture()V

    goto :goto_1

    :cond_4
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->multiCapture()V

    :cond_5
    :goto_1
    return-void
.end method

.method public doSnap()V
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_3

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_3

    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->needAutoFocusCall()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    goto :goto_1

    :cond_2
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-nez v0, :cond_4

    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->capture()V

    goto :goto_1

    :cond_3
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->capture()V

    :cond_4
    :goto_1
    return-void
.end method

.method public focusFaceArea()Z
    .locals 7

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusMode()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isAutoFocusMode(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_5

    if-eqz v0, :cond_0

    const/4 v1, 0x2

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v3

    if-ne v1, v3, :cond_0

    goto :goto_2

    :cond_0
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getFocusRect(I)Landroid/graphics/RectF;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusFace:Landroid/graphics/RectF;

    const/4 v3, 0x1

    if-eqz v1, :cond_3

    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    if-ne v1, v3, :cond_3

    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget-object v4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusFace:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    sub-float/2addr v1, v4

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const/high16 v4, 0x42a00000    # 80.0f

    cmpg-float v1, v1, v4

    if-gez v1, :cond_3

    iget v1, v0, Landroid/graphics/RectF;->right:F

    iget v5, v0, Landroid/graphics/RectF;->left:F

    sub-float/2addr v1, v5

    iget-object v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusFace:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    iget-object v6, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusFace:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    sub-float/2addr v5, v6

    sub-float/2addr v1, v5

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpg-float v1, v1, v4

    if-gez v1, :cond_3

    return v2

    :cond_3
    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusFace:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget v4, v0, Landroid/graphics/RectF;->right:F

    add-float/2addr v1, v4

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v1, v4

    float-to-int v1, v1

    iget v5, v0, Landroid/graphics/RectF;->top:F

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v5, v0

    div-float/2addr v5, v4

    float-to-int v0, v5

    invoke-direct {p0, v1, v0, v3, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->focusPoint(IIIZ)V

    return v3

    :cond_4
    :goto_1
    return v2

    :cond_5
    :goto_2
    return v2
.end method

.method public getAeAwbLock()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAeAwbLock:Z

    return v0
.end method

.method public getCurrentFocusState()I
    .locals 1

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    return v0
.end method

.method public getFocusAreas(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraFocusArea:Landroid/graphics/Rect;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraFocusArea:Landroid/graphics/Rect;

    invoke-direct {p0, v0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->afaeRectangle(Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object p1

    return-object p1
.end method

.method public getFocusMode()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mOverrideFocusMode:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mOverrideFocusMode:Ljava/lang/String;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusMode()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    :cond_1
    const-string v0, "FocusManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getFocusMode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    return-object v0
.end method

.method public getLastFocusState()I
    .locals 1

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastState:I

    return v0
.end method

.method public getMeteringAreas(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraMeteringArea:Landroid/graphics/Rect;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraMeteringArea:Landroid/graphics/Rect;

    invoke-direct {p0, v0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->afaeRectangle(Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object p1

    return-object p1
.end method

.method public isFocusCompleted()Z
    .locals 2

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x4

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

.method public isFocusing()Z
    .locals 3

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    nop

    :cond_1
    :goto_0
    return v1
.end method

.method public isFocusingSnapOnFinish()Z
    .locals 2

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isNeedCancelAutoFocus()Z
    .locals 3

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    goto :goto_1

    :cond_1
    :goto_0
    move v1, v2

    :goto_1
    return v1
.end method

.method public onCameraReleased()V
    .locals 0

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onPreviewStopped()V

    return-void
.end method

.method public onDeviceBecomeStable()V
    .locals 0

    return-void
.end method

.method public onDeviceKeepMoving(D)V
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusTime:J

    const-wide/16 v4, 0xbb8

    invoke-static/range {v0 .. v5}, Lcom/android/camera/Util;->isTimeout(JJJ)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setLastFocusState(I)V

    iget-boolean p2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {p2, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_0
    return-void
.end method

.method public onFocusResult(Lcom/android/camera/module/loader/camera2/FocusTask;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusResultDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusResultEmitter:Lio/reactivex/ObservableEmitter;

    invoke-interface {v0, p1}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public onPreviewStarted()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    return-void
.end method

.method public onPreviewStopped()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetTouchFocus(I)V

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    return-void
.end method

.method public onShutter()V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAeAwbLock:Z

    return-void
.end method

.method public onShutterDown()V
    .locals 0

    return-void
.end method

.method public onShutterUp()V
    .locals 0

    return-void
.end method

.method public onSingleTapUp(IIZ)V
    .locals 1

    nop

    if-eqz p3, :cond_0

    const/4 p3, 0x5

    goto :goto_0

    :cond_0
    const/4 p3, 0x3

    :goto_0
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onlyAe()Z

    move-result v0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->focusPoint(IIIZ)V

    return-void
.end method

.method public overrideFocusMode(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mOverrideFocusMode:Ljava/lang/String;

    return-void
.end method

.method public prepareCapture(ZI)V
    .locals 8

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    nop

    nop

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusMode()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    const/4 v2, 0x3

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne p2, v1, :cond_3

    const-string v1, "auto"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "macro"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_1
    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastState:I

    if-eq v1, v2, :cond_2

    if-nez p1, :cond_3

    :cond_2
    nop

    move v1, v3

    goto :goto_0

    :cond_3
    move v1, v4

    :goto_0
    const-string v5, "FocusManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "prepareCapture: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string/jumbo v7, "|"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo p2, "|"

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v5, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const-string p2, "continuous-picture"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusEnabled()Z

    move-result v0

    if-eqz v0, :cond_6

    if-nez p2, :cond_6

    if-eqz v1, :cond_6

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-eq v0, v2, :cond_5

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_5

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v0, :cond_4

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isFaceExists(I)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->focusFaceArea()Z

    goto :goto_1

    :cond_4
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocusAreaToCenter()V

    invoke-direct {p0, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->startFocus(I)V

    nop

    :goto_1
    nop

    :goto_2
    move v3, v4

    goto :goto_3

    :cond_5
    if-eqz p1, :cond_6

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraFocusArea:Landroid/graphics/Rect;

    if-eqz v0, :cond_6

    invoke-static {}, Lcom/mi/config/b;->hV()Z

    move-result v0

    if-nez v0, :cond_6

    iput-boolean v4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mKeepFocusUIState:Z

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->startFocus(I)V

    iput-boolean v3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mKeepFocusUIState:Z

    goto :goto_2

    :cond_6
    :goto_3
    if-nez v3, :cond_8

    if-eqz p1, :cond_8

    if-eqz p2, :cond_8

    invoke-static {}, Lcom/mi/config/b;->iJ()Z

    move-result p1

    if-eqz p1, :cond_7

    iget p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-ne p1, v4, :cond_8

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->cancelFocus()V

    goto :goto_4

    :cond_7
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->requestAutoFocus()V

    :cond_8
    :goto_4
    return-void
.end method

.method public removeMessages()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    return-void
.end method

.method public requestAutoFocus()V
    .locals 6

    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->needAutoFocusCall()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-eqz v0, :cond_5

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    goto :goto_1

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xa6

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v2, 0x4

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isNeedCancelAutoFocus()Z

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v3, v5}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->cancelFocus(Z)V

    if-eqz v0, :cond_1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    :cond_1
    invoke-direct {p0, v5}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    iput-boolean v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v5}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v4}, Landroid/os/Handler;->removeMessages(I)V

    :cond_2
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocusAreaToFaceArea()Z

    move-result v1

    if-eqz v1, :cond_4

    if-eqz v0, :cond_3

    const/16 v1, 0x9

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    :cond_3
    nop

    move v2, v4

    goto :goto_0

    :cond_4
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocusAreaToCenter()V

    :goto_0
    iput-boolean v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAeAwbLock:Z

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->notifyFocusAreaUpdate()V

    invoke-direct {p0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->startFocus(I)V

    return-void

    :cond_5
    :goto_1
    return-void
.end method

.method public resetAfterCapture(Z)V
    .locals 3

    invoke-static {}, Lcom/mi/config/b;->hV()Z

    move-result v0

    const/4 v1, 0x7

    if-eqz v0, :cond_0

    invoke-virtual {p0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetTouchFocus(I)V

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_2

    iget p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    const/4 v0, 0x4

    const/4 v2, 0x0

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {p1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->cancelFocus(Z)V

    invoke-virtual {p0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetTouchFocus(I)V

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->removeMessages()V

    goto :goto_0

    :cond_1
    invoke-direct {p0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setLastFocusState(I)V

    :cond_2
    :goto_0
    return-void
.end method

.method public resetFocusIndicator(I)V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    :cond_0
    return-void
.end method

.method public resetFocusStateIfNeeded()V
    .locals 2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraFocusArea:Landroid/graphics/Rect;

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraMeteringArea:Landroid/graphics/Rect;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setLastFocusState(I)V

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_0
    return-void
.end method

.method public resetFocused()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    return-void
.end method

.method public resetTouchFocus(I)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraFocusArea:Landroid/graphics/Rect;

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraMeteringArea:Landroid/graphics/Rect;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocusIndicator(I)V

    :cond_0
    return-void
.end method

.method public setAeAwbLock(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAeAwbLock:Z

    return-void
.end method

.method public setCharacteristics(Lcom/android/camera2/CameraCapabilities;)V
    .locals 3

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isAFRegionSupported()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusAreaSupported:Z

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isAERegionSupported()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mMeteringAreaSupported:Z

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isAELockSupported()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isAWBLockSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move v0, v2

    goto :goto_1

    :cond_1
    :goto_0
    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLockAeAwbNeeded:Z

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->getSupportedFocusModes()[I

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/constant/AutoFocus;->convertToLegacyFocusModes([I)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mSupportedFocusModes:Ljava/util/List;

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mActiveArraySize:Landroid/graphics/Rect;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gV()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusAreaSupported:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mMeteringAreaSupported:Z

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isAELockSupported()Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_2

    :cond_2
    move v1, v2

    :goto_2
    iput-boolean v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAELockOnlySupported:Z

    const-string p1, "FocusManager"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setCharacteristics: mFocusAreaSupported = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusAreaSupported:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", mAELockOnlySupported = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAELockOnlySupported:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setFocusMode(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    if-nez p1, :cond_0

    const-string v0, "FocusManager"

    const-string v1, "setFocusMode: null focus mode"

    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2}, Ljava/lang/RuntimeException;-><init>()V

    invoke-static {v0, v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object p1

    :cond_0
    const-string v0, "auto"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mSupportedFocusModes:Ljava/util/List;

    invoke-static {p1, v0}, Lcom/android/camera/Util;->isSupported(Ljava/lang/String;Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_1

    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string p1, "auto"

    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    :goto_0
    const-string p1, "continuous-picture"

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    const-string p1, "continuous-video"

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    :cond_2
    const/4 p1, -0x1

    iput p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    :cond_3
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    return-object p1
.end method

.method public setPreviewSize(II)V
    .locals 1

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    if-ne v0, p1, :cond_0

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    if-eq v0, p2, :cond_1

    :cond_0
    iput p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    iput p2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    const-string p1, "FocusManager"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "setPreviewSize: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "x"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setMatrix()V

    :cond_1
    return-void
.end method

.method public updateFocusUI()V
    .locals 5

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget-boolean v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-eqz v1, :cond_5

    iget-boolean v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mKeepFocusUIState:Z

    if-nez v1, :cond_5

    if-nez v0, :cond_0

    goto :goto_3

    :cond_0
    nop

    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-ne v2, v1, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v1

    goto :goto_0

    :cond_1
    move v1, v3

    :goto_0
    iget v4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    packed-switch v4, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    nop

    const-string v2, "continuous-picture"

    iget-object v4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "continuous-video"

    iget-object v4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_1

    :cond_2
    const/4 v3, 0x3

    nop

    :cond_3
    :goto_1
    invoke-interface {v0, v1, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showIndicator(II)V

    goto :goto_2

    :pswitch_1
    invoke-interface {v0, v1, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showIndicator(II)V

    goto :goto_2

    :pswitch_2
    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showIndicator(II)V

    goto :goto_2

    :pswitch_3
    if-ne v1, v3, :cond_4

    const/4 v1, 0x7

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    goto :goto_2

    :cond_4
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearIndicator(I)V

    nop

    :goto_2
    return-void

    :cond_5
    :goto_3
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
