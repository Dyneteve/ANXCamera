.class public Lcom/android/camera/module/loader/FunctionUISetup;
.super Lcom/android/camera/module/loader/Func1Base;
.source "FunctionUISetup.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera/module/loader/Func1Base<",
        "Lcom/android/camera/module/BaseModule;",
        "Lcom/android/camera/module/BaseModule;",
        ">;"
    }
.end annotation


# instance fields
.field private mNeedNotifyUI:Z


# direct methods
.method public constructor <init>(IZ)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/Func1Base;-><init>(I)V

    iput-boolean p2, p0, Lcom/android/camera/module/loader/FunctionUISetup;->mNeedNotifyUI:Z

    return-void
.end method


# virtual methods
.method public apply(Lcom/android/camera/module/loader/NullHolder;)Lcom/android/camera/module/loader/NullHolder;
    .locals 8
    .param p1    # Lcom/android/camera/module/loader/NullHolder;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/camera/module/loader/NullHolder<",
            "Lcom/android/camera/module/BaseModule;",
            ">;)",
            "Lcom/android/camera/module/loader/NullHolder<",
            "Lcom/android/camera/module/BaseModule;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/android/camera/module/loader/NullHolder;->isPresent()Z

    move-result v0

    if-nez v0, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/module/loader/NullHolder;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/BaseModule;

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->isDeparted()Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 p1, 0xe1

    invoke-static {v0, p1}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;I)Lcom/android/camera/module/loader/NullHolder;

    move-result-object p1

    return-object p1

    :cond_1
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->isCreated()Z

    move-result v1

    if-nez v1, :cond_2

    return-object p1

    :cond_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/loader/FunctionUISetup;->mTargetMode:I

    const/16 v3, 0xa3

    const/4 v4, 0x3

    const/4 v5, 0x1

    if-eq v2, v3, :cond_5

    const/16 v3, 0xab

    if-eq v2, v3, :cond_3

    goto/16 :goto_0

    :cond_3
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v2

    invoke-virtual {v2, v5}, Lcom/android/camera/Camera;->isNewBieAlive(I)Z

    move-result v2

    if-eqz v2, :cond_4

    goto/16 :goto_0

    :cond_4
    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isNormalIntent()Z

    move-result v2

    if-eqz v2, :cond_9

    const-string v2, "pref_camera_first_portrait_use_hint_shown_key"

    invoke-virtual {v1, v2, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v2

    invoke-virtual {v2, v5}, Lcom/android/camera/Camera;->showNewBie(I)Z

    nop

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    const-string v2, "pref_camera_first_portrait_use_hint_shown_key"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    goto :goto_0

    :cond_5
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mi/config/a;->isSupportUltraWide()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Lcom/android/camera/Camera;->isNewBieAlive(I)Z

    move-result v2

    if-eqz v2, :cond_6

    goto :goto_0

    :cond_6
    const-string v2, "pref_camera_first_ultra_wide_use_hint_shown_key"

    invoke-virtual {v1, v2, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/android/camera/Camera;->showNewBie(I)Z

    goto :goto_0

    :cond_7
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/android/camera/Camera;->isNewBieAlive(I)Z

    move-result v2

    if-eqz v2, :cond_8

    goto :goto_0

    :cond_8
    const-string v2, "pref_camera_first_ai_scene_use_hint_shown_key"

    invoke-virtual {v1, v2, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->fL()Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/android/camera/Camera;->showNewBie(I)Z

    nop

    :cond_9
    :goto_0
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->getPreviewRect(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/module/BaseModule;->onPreviewLayoutChanged(Landroid/graphics/Rect;)V

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lcom/android/camera/module/BaseModule;->onPreviewSizeChanged(II)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xa0

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getLastCameraId()I

    move-result v3

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v6

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result v7

    nop

    if-eq v3, v6, :cond_a

    const/4 v4, 0x2

    goto :goto_1

    :cond_a
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->getLastUiStyle()I

    move-result v3

    if-eq v3, v7, :cond_b

    goto :goto_1

    :cond_b
    move v4, v5

    :goto_1
    invoke-virtual {v0, v1, v7}, Lcom/android/camera/module/BaseModule;->setDisplayRectAndUIStyle(Landroid/graphics/Rect;I)V

    iget-boolean v1, p0, Lcom/android/camera/module/loader/FunctionUISetup;->mNeedNotifyUI:Z

    if-eqz v1, :cond_c

    if-eqz v2, :cond_c

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getAnimationComposite()Lcom/android/camera/animation/AnimationComposite;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/loader/FunctionUISetup;->mTargetMode:I

    invoke-virtual {v1, v4, v2}, Lcom/android/camera/animation/AnimationComposite;->notifyDataChanged(II)V

    :cond_c
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isRecordLocation()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/camera/LocationManager;->recordLocation(Z)V

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getPreviewSize()Lcom/android/camera/CameraSize;

    move-result-object v0

    if-eqz v0, :cond_d

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa6

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget v2, v0, Lcom/android/camera/CameraSize;->width:I

    iget v0, v0, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v2, v0}, Lcom/android/camera/CameraSettings;->getPreviewAspectRatio(II)F

    move-result v0

    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setPreviewAspectRatio(F)V

    :cond_d
    return-object p1
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    check-cast p1, Lcom/android/camera/module/loader/NullHolder;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/FunctionUISetup;->apply(Lcom/android/camera/module/loader/NullHolder;)Lcom/android/camera/module/loader/NullHolder;

    move-result-object p1

    return-object p1
.end method

.method public getWorkThread()Lio/reactivex/Scheduler;
    .locals 1

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    return-object v0
.end method
