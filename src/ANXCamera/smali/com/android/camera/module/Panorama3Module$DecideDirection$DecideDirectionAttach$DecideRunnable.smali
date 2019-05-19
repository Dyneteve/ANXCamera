.class Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach$DecideRunnable;
.super Ljava/lang/Object;
.source "Panorama3Module.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DecideRunnable"
.end annotation


# instance fields
.field final synthetic this$2:Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;


# direct methods
.method private constructor <init>(Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach$DecideRunnable;->this$2:Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;Lcom/android/camera/module/Panorama3Module$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach$DecideRunnable;-><init>(Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach$DecideRunnable;->this$2:Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$3900(Lcom/android/camera/module/Panorama3Module;)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach$DecideRunnable;->this$2:Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$1900(Lcom/android/camera/module/Panorama3Module;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "DecideRunnable exit request stop"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "go to PanoramaPreview in DecideRunnable"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach$DecideRunnable;->this$2:Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    new-instance v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach$DecideRunnable;->this$2:Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;

    iget-object v2, v2, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v2, v2, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-direct {v1, v2}, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;-><init>(Lcom/android/camera/module/Panorama3Module;)V

    invoke-static {v0, v1}, Lcom/android/camera/module/Panorama3Module;->access$402(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/PanoramaState;)Lcom/android/camera/panorama/PanoramaState;

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach$DecideRunnable;->this$2:Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$400(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/PanoramaState;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach$DecideRunnable;->this$2:Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->listener:Lcom/android/camera/panorama/PanoramaState$IPanoramaStateEventListener;

    invoke-virtual {v0, v1}, Lcom/android/camera/panorama/PanoramaState;->setPanoramaStateEventListener(Lcom/android/camera/panorama/PanoramaState$IPanoramaStateEventListener;)V

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach$DecideRunnable;->this$2:Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    invoke-virtual {v0}, Lcom/android/camera/module/Panorama3Module$DecideDirection;->clearListener()V

    return-void
.end method
