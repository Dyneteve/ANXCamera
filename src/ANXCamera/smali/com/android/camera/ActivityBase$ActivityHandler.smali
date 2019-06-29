.class Lcom/android/camera/ActivityBase$ActivityHandler;
.super Landroid/os/Handler;
.source "ActivityBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ActivityBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ActivityHandler"
.end annotation


# instance fields
.field private final mActivity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera/ActivityBase;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/camera/ActivityBase;)V
    .locals 1

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera/ActivityBase$ActivityHandler;->mActivity:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 8

    iget-object v0, p0, Lcom/android/camera/ActivityBase$ActivityHandler;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget v1, p1, Landroid/os/Message;->what:I

    const/16 v2, 0xa

    const/4 v3, 0x1

    if-eq v1, v2, :cond_1

    packed-switch v1, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    invoke-static {}, Lcom/android/camera/statistic/CameraStatUtil;->trackModeSwitch()V

    goto :goto_1

    :pswitch_1
    const-string p1, "ActivityBase"

    const-string v1, "handleMessage:  set mIsFinishInKeyguard = true;"

    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v0, v3}, Lcom/android/camera/ActivityBase;->access$002(Lcom/android/camera/ActivityBase;Z)Z

    goto :goto_1

    :pswitch_2
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->isActivityPaused()Z

    move-result v1

    if-nez v1, :cond_4

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/android/camera/ActivityBase;->showDebugInfo(Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    iget v1, p1, Landroid/os/Message;->arg1:I

    const-string v2, "ActivityBase"

    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v5, "exception occurs, msg = %s , exception = 0x%x"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v6, v3

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    packed-switch v1, :pswitch_data_1

    :pswitch_3
    goto :goto_1

    :pswitch_4
    const p1, 0x7f090009

    invoke-static {v0, p1}, Lcom/android/camera/Util;->showErrorAndFinish(Landroid/app/Activity;I)V

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->showErrorDialog()V

    goto :goto_1

    :pswitch_5
    nop

    invoke-static {v0}, Lcom/android/camera/Util;->isInVideoCall(Landroid/app/Activity;)Z

    move-result p1

    if-eqz p1, :cond_2

    const p1, 0x7f0901b5

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->updateOpenCameraFailTimes()J

    move-result-wide v1

    const-wide/16 v3, 0x1

    cmp-long p1, v1, v3

    if-lez p1, :cond_3

    const p1, 0x7f090008

    goto :goto_0

    :cond_3
    const p1, 0x7f090007

    :goto_0
    invoke-static {v0, p1}, Lcom/android/camera/Util;->showErrorAndFinish(Landroid/app/Activity;I)V

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->showErrorDialog()V

    nop

    :cond_4
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xe2
        :pswitch_5
        :pswitch_4
        :pswitch_5
        :pswitch_3
        :pswitch_5
        :pswitch_5
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method
