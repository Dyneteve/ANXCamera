.class public Lcom/android/camera/module/loader/FunctionParseAsdScene;
.super Ljava/lang/Object;
.source "FunctionParseAsdScene.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Function<",
        "Landroid/hardware/camera2/CaptureResult;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "FunctionParseAsdScene"


# instance fields
.field private mModuleWeakReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera/module/BaseModule;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/camera/module/BaseModule;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/FunctionParseAsdScene;->mModuleWeakReference:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public apply(Landroid/hardware/camera2/CaptureResult;)Ljava/lang/Integer;
    .locals 6

    iget-object v0, p0, Lcom/android/camera/module/loader/FunctionParseAsdScene;->mModuleWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/BaseModule;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getCameraDevice()Lcom/android/camera2/Camera2Proxy;

    move-result-object v1

    sget-object v2, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v2}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->isFrontCamera()Z

    move-result v3

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v4

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v4

    goto :goto_0

    :cond_0
    move v4, v5

    :goto_0
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->isPortraitMode()Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_1
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_3

    invoke-static {}, Lcom/mi/config/b;->ic()Z

    move-result p1

    if-eqz p1, :cond_3

    if-eqz v1, :cond_3

    const/4 p1, 0x3

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->getFlashMode()I

    move-result v0

    if-ne p1, v0, :cond_3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :cond_2
    :goto_1
    invoke-static {p1, v3, v4}, Lcom/android/camera/constant/AsdSceneConstant;->parseRtbSceneResult(Landroid/hardware/camera2/CaptureResult;ZZ)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :cond_3
    const/4 p1, -0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

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

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/FunctionParseAsdScene;->apply(Landroid/hardware/camera2/CaptureResult;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method
