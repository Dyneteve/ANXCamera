.class Lcom/android/camera/SensorStateManager$MainHandler;
.super Landroid/os/Handler;
.source "SensorStateManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/SensorStateManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MainHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/SensorStateManager;


# direct methods
.method public constructor <init>(Lcom/android/camera/SensorStateManager;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/SensorStateManager$MainHandler;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$MainHandler;->this$0:Lcom/android/camera/SensorStateManager;

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget p1, p1, Landroid/os/Message;->arg2:I

    const/4 v2, 0x1

    if-ne p1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-static {v0, v1, v2}, Lcom/android/camera/SensorStateManager;->access$1800(Lcom/android/camera/SensorStateManager;IZ)V

    goto :goto_1

    :pswitch_1
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$MainHandler;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1}, Lcom/android/camera/SensorStateManager;->access$1700(Lcom/android/camera/SensorStateManager;)V

    nop

    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
