.class public Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;
.super Ljava/lang/Object;
.source "FunctionParseBeautyBodySlimCount.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Function<",
        "Landroid/hardware/camera2/CaptureResult;",
        "Landroid/hardware/camera2/CaptureResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "FunctionParseBeautyBodySlimCount"

.field public static final TIP_INTERVAL_TIME:J = 0x2710L

.field public static final TIP_TIME:J = 0xfa0L


# instance fields
.field private final mCallbackRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera2/Camera2Proxy$BeautyBodySlimCountCallback;",
            ">;"
        }
    .end annotation
.end field

.field private final mIsSupportBeautyBody:Z

.field private mTipHideTime:J

.field private mTipShowTime:J

.field private mTipStatus:Z


# direct methods
.method public constructor <init>(Lcom/android/camera2/Camera2Proxy$BeautyBodySlimCountCallback;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mCallbackRef:Ljava/lang/ref/WeakReference;

    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportBeautyBody()Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mIsSupportBeautyBody:Z

    return-void
.end method


# virtual methods
.method public apply(Landroid/hardware/camera2/CaptureResult;)Landroid/hardware/camera2/CaptureResult;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mIsSupportBeautyBody:Z

    if-nez v0, :cond_0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mCallbackRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera2/Camera2Proxy$BeautyBodySlimCountCallback;

    if-nez v0, :cond_1

    return-object p1

    :cond_1
    iget-boolean v1, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipStatus:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipShowTime:J

    sub-long/2addr v3, v5

    const-wide/16 v5, 0xfa0

    cmp-long v1, v3, v5

    if-lez v1, :cond_2

    iput-boolean v2, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipStatus:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipHideTime:J

    :cond_2
    invoke-interface {v0}, Lcom/android/camera2/Camera2Proxy$BeautyBodySlimCountCallback;->isBeautyBodySlimCountDetectStarted()Z

    move-result v1

    if-nez v1, :cond_4

    iget-boolean v1, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipStatus:Z

    if-eqz v1, :cond_3

    invoke-interface {v0, v2}, Lcom/android/camera2/Camera2Proxy$BeautyBodySlimCountCallback;->onBeautyBodySlimCountChange(Z)V

    iput-boolean v2, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipStatus:Z

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipHideTime:J

    :cond_3
    return-object p1

    :cond_4
    invoke-static {p1}, Lcom/android/camera2/CaptureResultParser;->getBeautyBodySlimCountResult(Landroid/hardware/camera2/CaptureResult;)I

    move-result v1

    const/4 v3, -0x1

    if-ne v1, v3, :cond_5

    return-object p1

    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipHideTime:J

    sub-long/2addr v3, v5

    const-wide/16 v5, 0x2710

    cmp-long v3, v3, v5

    if-gez v3, :cond_6

    return-object p1

    :cond_6
    const/4 v3, 0x1

    if-eq v1, v3, :cond_7

    move v2, v3

    goto :goto_0

    :cond_7
    nop

    :goto_0
    iget-boolean v3, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipStatus:Z

    if-ne v3, v2, :cond_8

    return-object p1

    :cond_8
    iput-boolean v2, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipStatus:Z

    const-string v3, "FunctionParseBeautyBodySlimCount"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Beauty body slim count:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {v0, v2}, Lcom/android/camera2/Camera2Proxy$BeautyBodySlimCountCallback;->onBeautyBodySlimCountChange(Z)V

    if-eqz v2, :cond_9

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipShowTime:J

    goto :goto_1

    :cond_9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipHideTime:J

    :goto_1
    return-object p1
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    check-cast p1, Landroid/hardware/camera2/CaptureResult;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->apply(Landroid/hardware/camera2/CaptureResult;)Landroid/hardware/camera2/CaptureResult;

    move-result-object p1

    return-object p1
.end method
