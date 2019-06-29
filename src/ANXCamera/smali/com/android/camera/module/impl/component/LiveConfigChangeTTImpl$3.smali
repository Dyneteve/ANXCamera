.class Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$3;
.super Ljava/lang/Object;
.source "LiveConfigChangeTTImpl.java"

# interfaces
.implements Lcom/ss/android/medialib/TTRecorder$SlamDetectListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->startPreview(Landroid/view/Surface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;


# direct methods
.method constructor <init>(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$3;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSlam(Z)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v0, "onSlam open, register tt ar sensor"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$3;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {p1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$1000(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Lcom/android/camera/ActivityBase;

    move-result-object p1

    check-cast p1, Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/SensorStateManager;->setTTARSensorEnabled(Z)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v0, "onSlam close, unregister tt ar sensor"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$3;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {p1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$1000(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Lcom/android/camera/ActivityBase;

    move-result-object p1

    check-cast p1, Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/camera/SensorStateManager;->setTTARSensorEnabled(Z)V

    :goto_0
    return-void
.end method
