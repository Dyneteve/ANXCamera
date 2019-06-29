.class Lcom/android/camera/module/VideoBase$MainHandler;
.super Landroid/os/Handler;
.source "VideoBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/VideoBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MainHandler"
.end annotation


# instance fields
.field private mModule:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera/module/VideoBase;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/camera/module/VideoBase;)V
    .locals 1

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->mModule:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7

    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->mModule:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/VideoBase;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->isCreated()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoBase$MainHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    return-void

    :cond_1
    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    if-nez v1, :cond_2

    return-void

    :cond_2
    iget v1, p1, Landroid/os/Message;->what:I

    const/16 v3, 0x80

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x1

    sparse-switch v1, :sswitch_data_0

    sget-boolean v1, Lcom/android/camera/module/BaseModule;->DEBUG:Z

    if-nez v1, :cond_7

    sget-object v1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "no consumer for this message: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    :sswitch_0
    sget-object p1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string v1, "autoFocus timeout!"

    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, v0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocused()V

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->onWaitingFocusFinished()Z

    goto/16 :goto_2

    :sswitch_1
    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->enterSavePowerMode()V

    goto/16 :goto_2

    :sswitch_2
    invoke-virtual {v0, v6, v5}, Lcom/android/camera/module/VideoBase;->stopVideoRecording(ZZ)V

    iget-object p1, v0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result p1

    if-nez p1, :cond_6

    iput-boolean v6, v0, Lcom/android/camera/module/VideoBase;->mOpenCameraFail:Z

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->onCameraException()V

    goto/16 :goto_2

    :sswitch_3
    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->onWaitStopCallbackTimeout()V

    goto/16 :goto_2

    :sswitch_4
    invoke-virtual {v0, v2}, Lcom/android/camera/module/VideoBase;->setActivity(Lcom/android/camera/Camera;)V

    goto/16 :goto_2

    :sswitch_5
    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->restoreMusicSound()V

    goto/16 :goto_2

    :sswitch_6
    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->updateRecordingTime()V

    goto/16 :goto_2

    :sswitch_7
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result p1

    if-eqz p1, :cond_6

    const/4 p1, 0x6

    const v1, 0x7f090192

    invoke-virtual {v0, p1, v1, v4}, Lcom/android/camera/module/VideoBase;->updateTipMessage(III)V

    goto/16 :goto_2

    :sswitch_8
    iget v1, p1, Landroid/os/Message;->arg1:I

    if-lez v1, :cond_3

    move v1, v6

    goto :goto_0

    :cond_3
    move v1, v5

    :goto_0
    iget p1, p1, Landroid/os/Message;->arg2:I

    if-lez p1, :cond_4

    move v5, v6

    nop

    :cond_4
    invoke-static {v0, v1, v5}, Lcom/android/camera/module/VideoBase;->access$000(Lcom/android/camera/module/VideoBase;ZZ)V

    goto :goto_2

    :sswitch_9
    const/16 p1, 0x11

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoBase$MainHandler;->removeMessages(I)V

    invoke-virtual {p0, v4}, Lcom/android/camera/module/VideoBase$MainHandler;->removeMessages(I)V

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/view/Window;->addFlags(I)V

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->getScreenDelay()I

    move-result p1

    int-to-long v0, p1

    invoke-virtual {p0, v4, v0, v1}, Lcom/android/camera/module/VideoBase$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_2

    :sswitch_a
    invoke-virtual {v0, v6, v5}, Lcom/android/camera/module/VideoBase;->stopVideoRecording(ZZ)V

    iput-boolean v6, v0, Lcom/android/camera/module/VideoBase;->mOpenCameraFail:Z

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->onCameraException()V

    goto :goto_2

    :sswitch_b
    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->onPreviewStart()V

    iput-object v2, v0, Lcom/android/camera/module/VideoBase;->mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;

    goto :goto_2

    :sswitch_c
    iget-object p1, v0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-static {p1}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result p1

    iget v1, v0, Lcom/android/camera/module/VideoBase;->mDisplayRotation:I

    if-eq p1, v1, :cond_5

    iget-boolean p1, v0, Lcom/android/camera/module/VideoBase;->mMediaRecorderRecording:Z

    if-nez p1, :cond_5

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->startPreview()V

    :cond_5
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-wide v3, v0, Lcom/android/camera/module/VideoBase;->mOnResumeTime:J

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x1388

    cmp-long p1, v1, v3

    if-gez p1, :cond_6

    const/4 p1, 0x4

    const-wide/16 v0, 0x64

    invoke-virtual {p0, p1, v0, v1}, Lcom/android/camera/module/VideoBase$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_2

    :goto_1
    :sswitch_d
    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/view/Window;->clearFlags(I)V

    nop

    :cond_6
    :goto_2
    return-void

    :cond_7
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "no consumer for this message: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_d
        0x4 -> :sswitch_c
        0x9 -> :sswitch_b
        0xa -> :sswitch_a
        0x11 -> :sswitch_9
        0x23 -> :sswitch_8
        0x28 -> :sswitch_7
        0x2a -> :sswitch_6
        0x2b -> :sswitch_5
        0x2d -> :sswitch_4
        0x2e -> :sswitch_3
        0x33 -> :sswitch_2
        0x34 -> :sswitch_1
        0x37 -> :sswitch_0
    .end sparse-switch
.end method
