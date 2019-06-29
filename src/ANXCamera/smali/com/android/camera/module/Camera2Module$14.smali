.class Lcom/android/camera/module/Camera2Module$14;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Lcom/android/camera/SensorStateManager$SensorStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/Camera2Module;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;


# direct methods
.method constructor <init>(Lcom/android/camera/module/Camera2Module;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isWorking()Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public notifyDevicePostureChanged()V
    .locals 0

    return-void
.end method

.method public onDeviceBecomeStable()V
    .locals 0

    return-void
.end method

.method public onDeviceBeginMoving()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-boolean v0, v0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isEdgePhotoEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getEdgeShutterView()Lcom/android/camera/ui/V9EdgeShutterView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/V9EdgeShutterView;->onDeviceMoving()V

    :cond_0
    return-void
.end method

.method public onDeviceKeepMoving(D)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-boolean v0, v0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$1400(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/loader/camera2/FocusManager2;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$1100(Lcom/android/camera/module/Camera2Module;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$1300(Lcom/android/camera/module/Camera2Module;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isEvAdjusted(Z)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$3000(Lcom/android/camera/module/Camera2Module;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$1400(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/loader/camera2/FocusManager2;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onDeviceKeepMoving(D)V

    :cond_0
    return-void
.end method

.method public onDeviceKeepStable()V
    .locals 0

    return-void
.end method

.method public onDeviceLieChanged(Z)V
    .locals 5

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-boolean v0, v0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$4000(Lcom/android/camera/module/Camera2Module;)I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v1, v1, Lcom/android/camera/module/Camera2Module;->mOrientationCompensation:I

    add-int/2addr v1, p1

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v1, v1, Lcom/android/camera/module/Camera2Module;->mOrientationCompensation:I

    add-int/2addr v1, p1

    invoke-static {v0, v1}, Lcom/android/camera/module/Camera2Module;->access$4002(Lcom/android/camera/module/Camera2Module;I)I

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p1, p1, Lcom/android/camera/module/Camera2Module;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v4, v4, Lcom/android/camera/module/Camera2Module;->mOrientationCompensation:I

    invoke-virtual {v2, v1, v3, v4}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v2

    const-wide/16 v3, 0x190

    invoke-virtual {p1, v2, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p1, p1, Lcom/android/camera/module/Camera2Module;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v3, v3, Lcom/android/camera/module/Camera2Module;->mOrientationCompensation:I

    invoke-virtual {v2, v1, v0, v3}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    const-wide/16 v1, 0x1388

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p1, p1, Lcom/android/camera/module/Camera2Module;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v3, v3, Lcom/android/camera/module/Camera2Module;->mOrientationCompensation:I

    invoke-virtual {v2, v1, v0, v3}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    const-wide/16 v1, 0x1f4

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    :cond_1
    :goto_0
    return-void
.end method

.method public onDeviceOrientationChanged(FZ)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    if-nez p2, :cond_0

    move v1, p1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v1, v1, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    int-to-float v1, v1

    :goto_0
    iput v1, v0, Lcom/android/camera/module/Camera2Module;->mDeviceRotation:F

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v1, v1, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v2, v2, Lcom/android/camera/module/Camera2Module;->mDeviceRotation:F

    invoke-static {v1, v2}, Lcom/android/camera/Util;->getShootRotation(Landroid/app/Activity;F)F

    move-result v1

    invoke-virtual {v0, p2, v1}, Lcom/android/camera/effect/EffectController;->setDeviceRotation(ZF)V

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x21

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-boolean v0, v0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez v0, :cond_2

    if-nez p2, :cond_2

    const/high16 p2, -0x40800000    # -1.0f

    cmpl-float p2, p1, p2

    if-eqz p2, :cond_2

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget p2, p2, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    invoke-static {p1, p2}, Lcom/android/camera/Util;->roundOrientation(II)I

    move-result p1

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p2, p2, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {p2}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result p2

    add-int/2addr p2, p1

    rem-int/lit16 p2, p2, 0x168

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    :cond_2
    return-void
.end method

.method public onDeviceRotationChanged([F)V
    .locals 0

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 2

    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v1}, Lcom/android/camera/module/Camera2Module;->access$4200(Lcom/android/camera/module/Camera2Module;)[F

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/module/Camera2Module;->access$4102(Lcom/android/camera/module/Camera2Module;[F)[F

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$14;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    invoke-static {v0, p1}, Lcom/android/camera/module/Camera2Module;->access$4202(Lcom/android/camera/module/Camera2Module;[F)[F

    :cond_0
    return-void
.end method
