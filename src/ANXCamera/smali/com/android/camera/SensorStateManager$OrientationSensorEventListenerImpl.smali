.class Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;
.super Ljava/lang/Object;
.source "SensorStateManager.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/SensorStateManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "OrientationSensorEventListenerImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/SensorStateManager;


# direct methods
.method constructor <init>(Lcom/android/camera/SensorStateManager;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 2

    const-string p1, "SensorStateManager"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onAccuracyChanged accuracy="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 10

    iget-object v0, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v0}, Lcom/android/camera/SensorStateManager;->access$000(Lcom/android/camera/SensorStateManager;)Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v3, 0x2

    aget p1, p1, v3

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget-object v5, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v5}, Lcom/android/camera/SensorStateManager;->access$900(Lcom/android/camera/SensorStateManager;)Z

    move-result v5

    const/4 v6, 0x5

    const/4 v7, 0x0

    if-eqz v5, :cond_5

    iget-object v5, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v5}, Lcom/android/camera/SensorStateManager;->access$1000(Lcom/android/camera/SensorStateManager;)Z

    move-result v5

    if-eqz v5, :cond_1

    move v5, v6

    goto :goto_0

    :cond_1
    nop

    move v5, v7

    :goto_0
    const/16 v8, 0xa

    add-int/2addr v8, v5

    rsub-int v5, v5, 0xaa

    int-to-float v8, v8

    cmpg-float v9, v1, v8

    if-lez v9, :cond_2

    int-to-float v9, v5

    cmpl-float v9, v1, v9

    if-ltz v9, :cond_3

    :cond_2
    cmpg-float v8, v4, v8

    if-lez v8, :cond_4

    int-to-float v5, v5

    cmpl-float v5, v4, v5

    if-ltz v5, :cond_3

    goto :goto_1

    :cond_3
    move v5, v7

    goto :goto_2

    :cond_4
    :goto_1
    nop

    move v5, v2

    :goto_2
    iget-object v8, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v8}, Lcom/android/camera/SensorStateManager;->access$1000(Lcom/android/camera/SensorStateManager;)Z

    move-result v8

    if-eq v5, v8, :cond_5

    iget-object v8, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v8, v5}, Lcom/android/camera/SensorStateManager;->access$1002(Lcom/android/camera/SensorStateManager;Z)Z

    const-string v5, "SensorStateManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "SensorEventListenerImpl TYPE_ORIENTATION mIsLyingForLie="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v9}, Lcom/android/camera/SensorStateManager;->access$1000(Lcom/android/camera/SensorStateManager;)Z

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v5}, Lcom/android/camera/SensorStateManager;->access$1000(Lcom/android/camera/SensorStateManager;)Z

    move-result v5

    invoke-interface {v0, v5}, Lcom/android/camera/SensorStateManager$SensorStateListener;->onDeviceLieChanged(Z)V

    :cond_5
    iget-object v5, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v5}, Lcom/android/camera/SensorStateManager;->access$1100(Lcom/android/camera/SensorStateManager;)Z

    move-result v5

    if-eqz v5, :cond_a

    iget-object v5, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v5}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)Z

    move-result v5

    if-eqz v5, :cond_6

    goto :goto_3

    :cond_6
    move v6, v7

    :goto_3
    const/16 v5, 0x1a

    add-int/2addr v5, v6

    rsub-int v6, v6, 0x99

    int-to-float v5, v5

    cmpg-float v8, v1, v5

    if-lez v8, :cond_7

    int-to-float v8, v6

    cmpl-float v1, v1, v8

    if-ltz v1, :cond_8

    :cond_7
    cmpg-float v1, v4, v5

    if-lez v1, :cond_9

    int-to-float v1, v6

    cmpl-float v1, v4, v1

    if-ltz v1, :cond_8

    goto :goto_4

    :cond_8
    move v1, v7

    goto :goto_5

    :cond_9
    :goto_4
    nop

    move v1, v2

    :goto_5
    iget-object v5, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v5}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)Z

    move-result v5

    if-eq v1, v5, :cond_a

    iget-object v5, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v5, v1}, Lcom/android/camera/SensorStateManager;->access$1202(Lcom/android/camera/SensorStateManager;Z)Z

    const-string v1, "SensorStateManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SensorEventListenerImpl TYPE_ORIENTATION mIsLyingForGradienter="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v6}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)Z

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v6, "mOrientation="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v6}, Lcom/android/camera/SensorStateManager;->access$1300(Lcom/android/camera/SensorStateManager;)F

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v1}, Lcom/android/camera/SensorStateManager;->access$1300(Lcom/android/camera/SensorStateManager;)F

    move-result v1

    iget-object v5, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v5}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)Z

    move-result v5

    invoke-interface {v0, v1, v5}, Lcom/android/camera/SensorStateManager$SensorStateListener;->onDeviceOrientationChanged(FZ)V

    :cond_a
    const/high16 v0, 0x42b40000    # 90.0f

    sub-float/2addr v4, v0

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-static {}, Lcom/android/camera/SensorStateManager;->access$1400()I

    move-result v1

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_c

    iget-object v0, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    const/4 v1, 0x0

    cmpg-float p1, p1, v1

    if-gez p1, :cond_b

    goto :goto_6

    :cond_b
    move v2, v3

    :goto_6
    invoke-static {v0, v2}, Lcom/android/camera/SensorStateManager;->access$1500(Lcom/android/camera/SensorStateManager;I)V

    goto :goto_7

    :cond_c
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1, v7}, Lcom/android/camera/SensorStateManager;->access$1500(Lcom/android/camera/SensorStateManager;I)V

    :goto_7
    return-void
.end method
