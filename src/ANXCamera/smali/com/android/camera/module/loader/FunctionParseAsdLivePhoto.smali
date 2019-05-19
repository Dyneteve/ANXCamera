.class public Lcom/android/camera/module/loader/FunctionParseAsdLivePhoto;
.super Ljava/lang/Object;
.source "FunctionParseAsdLivePhoto.java"

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


# instance fields
.field private mLivePhotoResultCallbackReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera2/Camera2Proxy$LivePhotoResultCallback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/camera2/Camera2Proxy$LivePhotoResultCallback;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/FunctionParseAsdLivePhoto;->mLivePhotoResultCallbackReference:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public apply(Landroid/hardware/camera2/CaptureResult;)Landroid/hardware/camera2/CaptureResult;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/module/loader/FunctionParseAsdLivePhoto;->mLivePhotoResultCallbackReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera2/Camera2Proxy$LivePhotoResultCallback;

    if-nez v0, :cond_0

    return-object p1

    :cond_0
    invoke-interface {v0}, Lcom/android/camera2/Camera2Proxy$LivePhotoResultCallback;->isLivePhotoStarted()Z

    move-result v1

    if-nez v1, :cond_1

    return-object p1

    :cond_1
    sget-object v1, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    sget-object v2, Landroid/hardware/camera2/CaptureResult;->CONTROL_AWB_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v2}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    sget-object v3, Landroid/hardware/camera2/CaptureResult;->SENSOR_TIMESTAMP:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v3}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    new-instance v4, Lcom/xiaomi/camera/liveshot/LivePhotoResult;

    invoke-direct {v4}, Lcom/xiaomi/camera/liveshot/LivePhotoResult;-><init>()V

    const/4 v5, 0x0

    if-nez v1, :cond_2

    move v1, v5

    goto :goto_0

    :cond_2
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    :goto_0
    invoke-virtual {v4, v1}, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->setAEState(I)V

    if-nez v2, :cond_3

    goto :goto_1

    :cond_3
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v5

    :goto_1
    invoke-virtual {v4, v5}, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->setAWBState(I)V

    if-nez v3, :cond_4

    const-wide/16 v1, 0x0

    goto :goto_2

    :cond_4
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    :goto_2
    invoke-virtual {v4, v1, v2}, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->setTimeStamp(J)V

    invoke-interface {v0}, Lcom/android/camera2/Camera2Proxy$LivePhotoResultCallback;->isGyroStable()Z

    move-result v1

    invoke-virtual {v4, v1}, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->setGyroscropStable(Z)V

    invoke-interface {v0}, Lcom/android/camera2/Camera2Proxy$LivePhotoResultCallback;->getFilterId()I

    move-result v1

    invoke-virtual {v4, v1}, Lcom/xiaomi/camera/liveshot/LivePhotoResult;->setFilterId(I)V

    invoke-interface {v0, v4}, Lcom/android/camera2/Camera2Proxy$LivePhotoResultCallback;->onLivePhotoResultCallback(Lcom/xiaomi/camera/liveshot/LivePhotoResult;)V

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

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/FunctionParseAsdLivePhoto;->apply(Landroid/hardware/camera2/CaptureResult;)Landroid/hardware/camera2/CaptureResult;

    move-result-object p1

    return-object p1
.end method
