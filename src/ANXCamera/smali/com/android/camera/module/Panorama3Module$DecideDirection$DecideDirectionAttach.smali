.class Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;
.super Lcom/android/camera/panorama/AttachRunnable;
.source "Panorama3Module.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/Panorama3Module$DecideDirection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DecideDirectionAttach"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach$DecideRunnable;
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;


# direct methods
.method private constructor <init>(Lcom/android/camera/module/Panorama3Module$DecideDirection;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    invoke-direct {p0}, Lcom/android/camera/panorama/AttachRunnable;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/module/Panorama3Module$DecideDirection;Lcom/android/camera/module/Panorama3Module$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;-><init>(Lcom/android/camera/module/Panorama3Module$DecideDirection;)V

    return-void
.end method

.method private createDirection(I)V
    .locals 9

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$3300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    move-result-object v0

    iget v0, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    const/16 v1, 0x5a

    if-eq v0, v1, :cond_3

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$3300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    move-result-object v0

    iget v0, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    const/16 v2, 0x10e

    if-ne v0, v2, :cond_0

    goto/16 :goto_0

    :cond_0
    packed-switch p1, :pswitch_data_0

    goto/16 :goto_1

    :pswitch_0
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, "direction : VERTICAL_DOWN"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->getScaleH()I

    move-result v7

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {p1}, Lcom/android/camera/module/Panorama3Module;->access$3800(Lcom/android/camera/module/Panorama3Module;)I

    move-result p1

    if-ne p1, v1, :cond_1

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    new-instance v0, Lcom/android/camera/panorama/DownDirectionFunction;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2100(Lcom/android/camera/module/Panorama3Module;)I

    move-result v3

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2200(Lcom/android/camera/module/Panorama3Module;)I

    move-result v4

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$3400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v5

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v6

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$3300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    move-result-object v1

    iget v8, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    move-object v2, v0

    invoke-direct/range {v2 .. v8}, Lcom/android/camera/panorama/DownDirectionFunction;-><init>(IIIIII)V

    invoke-static {p1, v0}, Lcom/android/camera/module/Panorama3Module;->access$3602(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/DirectionFunction;)Lcom/android/camera/panorama/DirectionFunction;

    goto/16 :goto_1

    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    new-instance v0, Lcom/android/camera/panorama/UpDirectionFunction;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2100(Lcom/android/camera/module/Panorama3Module;)I

    move-result v3

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2200(Lcom/android/camera/module/Panorama3Module;)I

    move-result v4

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$3400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v5

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v6

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$3300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    move-result-object v1

    iget v8, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    move-object v2, v0

    invoke-direct/range {v2 .. v8}, Lcom/android/camera/panorama/UpDirectionFunction;-><init>(IIIIII)V

    invoke-static {p1, v0}, Lcom/android/camera/module/Panorama3Module;->access$3602(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/DirectionFunction;)Lcom/android/camera/panorama/DirectionFunction;

    goto/16 :goto_1

    :pswitch_1
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, "direction : VERTICAL_UP"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->getScaleH()I

    move-result v7

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {p1}, Lcom/android/camera/module/Panorama3Module;->access$3800(Lcom/android/camera/module/Panorama3Module;)I

    move-result p1

    if-ne p1, v1, :cond_2

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    new-instance v0, Lcom/android/camera/panorama/UpDirectionFunction;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2100(Lcom/android/camera/module/Panorama3Module;)I

    move-result v3

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2200(Lcom/android/camera/module/Panorama3Module;)I

    move-result v4

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$3400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v5

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v6

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$3300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    move-result-object v1

    iget v8, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    move-object v2, v0

    invoke-direct/range {v2 .. v8}, Lcom/android/camera/panorama/UpDirectionFunction;-><init>(IIIIII)V

    invoke-static {p1, v0}, Lcom/android/camera/module/Panorama3Module;->access$3602(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/DirectionFunction;)Lcom/android/camera/panorama/DirectionFunction;

    goto/16 :goto_1

    :cond_2
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    new-instance v0, Lcom/android/camera/panorama/DownDirectionFunction;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2100(Lcom/android/camera/module/Panorama3Module;)I

    move-result v3

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2200(Lcom/android/camera/module/Panorama3Module;)I

    move-result v4

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$3400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v5

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v6

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$3300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    move-result-object v1

    iget v8, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    move-object v2, v0

    invoke-direct/range {v2 .. v8}, Lcom/android/camera/panorama/DownDirectionFunction;-><init>(IIIIII)V

    invoke-static {p1, v0}, Lcom/android/camera/module/Panorama3Module;->access$3602(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/DirectionFunction;)Lcom/android/camera/panorama/DirectionFunction;

    goto/16 :goto_1

    :cond_3
    :goto_0
    packed-switch p1, :pswitch_data_1

    goto/16 :goto_1

    :pswitch_2
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, "direction : VERTICAL_DOWN"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->getScaleV()I

    move-result v7

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {p1}, Lcom/android/camera/module/Panorama3Module;->access$3800(Lcom/android/camera/module/Panorama3Module;)I

    move-result p1

    if-ne p1, v1, :cond_4

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    new-instance v0, Lcom/android/camera/panorama/LeftDirectionFunction;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2100(Lcom/android/camera/module/Panorama3Module;)I

    move-result v3

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2200(Lcom/android/camera/module/Panorama3Module;)I

    move-result v4

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$3400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v5

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v6

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$3300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    move-result-object v1

    iget v8, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    move-object v2, v0

    invoke-direct/range {v2 .. v8}, Lcom/android/camera/panorama/LeftDirectionFunction;-><init>(IIIIII)V

    invoke-static {p1, v0}, Lcom/android/camera/module/Panorama3Module;->access$3602(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/DirectionFunction;)Lcom/android/camera/panorama/DirectionFunction;

    goto/16 :goto_1

    :cond_4
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    new-instance v0, Lcom/android/camera/panorama/RightDirectionFunction;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2100(Lcom/android/camera/module/Panorama3Module;)I

    move-result v3

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2200(Lcom/android/camera/module/Panorama3Module;)I

    move-result v4

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$3400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v5

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v6

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$3300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    move-result-object v1

    iget v8, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    move-object v2, v0

    invoke-direct/range {v2 .. v8}, Lcom/android/camera/panorama/RightDirectionFunction;-><init>(IIIIII)V

    invoke-static {p1, v0}, Lcom/android/camera/module/Panorama3Module;->access$3602(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/DirectionFunction;)Lcom/android/camera/panorama/DirectionFunction;

    goto/16 :goto_1

    :pswitch_3
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, "direction : VERTICAL_UP"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->getScaleV()I

    move-result v7

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {p1}, Lcom/android/camera/module/Panorama3Module;->access$3800(Lcom/android/camera/module/Panorama3Module;)I

    move-result p1

    if-ne p1, v1, :cond_5

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    new-instance v0, Lcom/android/camera/panorama/RightDirectionFunction;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2100(Lcom/android/camera/module/Panorama3Module;)I

    move-result v3

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2200(Lcom/android/camera/module/Panorama3Module;)I

    move-result v4

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$3400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v5

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v6

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$3300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    move-result-object v1

    iget v8, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    move-object v2, v0

    invoke-direct/range {v2 .. v8}, Lcom/android/camera/panorama/RightDirectionFunction;-><init>(IIIIII)V

    invoke-static {p1, v0}, Lcom/android/camera/module/Panorama3Module;->access$3602(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/DirectionFunction;)Lcom/android/camera/panorama/DirectionFunction;

    goto :goto_1

    :cond_5
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    new-instance v0, Lcom/android/camera/panorama/LeftDirectionFunction;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2100(Lcom/android/camera/module/Panorama3Module;)I

    move-result v3

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2200(Lcom/android/camera/module/Panorama3Module;)I

    move-result v4

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$3400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v5

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v6

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$3300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    move-result-object v1

    iget v8, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    move-object v2, v0

    invoke-direct/range {v2 .. v8}, Lcom/android/camera/panorama/LeftDirectionFunction;-><init>(IIIIII)V

    invoke-static {p1, v0}, Lcom/android/camera/module/Panorama3Module;->access$3602(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/DirectionFunction;)Lcom/android/camera/panorama/DirectionFunction;

    nop

    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x3
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method private getScaleH()I
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$2400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v0

    sget v1, Lcom/android/camera/Util;->sWindowHeight:I

    div-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method private getScaleV()I
    .locals 3

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$2400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$2500(Lcom/android/camera/module/Panorama3Module;)I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v2, v2, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$2600(Lcom/android/camera/module/Panorama3Module;)F

    move-result v2

    div-float/2addr v1, v2

    div-float/2addr v0, v1

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v0, v1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method private isUnDecideDirection(I)Z
    .locals 2

    const/4 v0, 0x1

    const/4 v1, -0x1

    if-eq p1, v1, :cond_1

    if-eqz p1, :cond_1

    const/4 v1, 0x2

    if-eq p1, v1, :cond_1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    nop

    :cond_1
    :goto_0
    return v0
.end method


# virtual methods
.method public run()V
    .locals 19

    move-object/from16 v1, p0

    :goto_0
    :try_start_0
    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$2700(Lcom/android/camera/module/Panorama3Module;)Ljava/util/concurrent/LinkedBlockingQueue;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/panorama/CaptureImage;

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$2800()Lcom/android/camera/panorama/CaptureImage;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    if-eq v0, v2, :cond_9

    :try_start_1
    invoke-virtual {v1, v0}, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->setImage(Lcom/android/camera/panorama/CaptureImage;)V

    sget-object v2, Lcom/android/camera/module/Panorama3Module;->mEngineLock:Ljava/lang/Object;

    monitor-enter v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    iget-object v3, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v3, v3, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v3}, Lcom/android/camera/module/Panorama3Module;->access$500(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->getAttachCount()J

    move-result-wide v3

    const-wide/16 v5, 0x5

    rem-long/2addr v3, v5

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    const/4 v4, 0x1

    if-nez v3, :cond_0

    iget-object v3, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v3, v3, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v3}, Lcom/android/camera/module/Panorama3Module;->access$2900(Lcom/android/camera/module/Panorama3Module;)V

    iget-object v3, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v3, v3, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v3, v4}, Lcom/android/camera/module/Panorama3Module;->access$3002(Lcom/android/camera/module/Panorama3Module;Z)Z

    :cond_0
    iget-object v3, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v3, v3, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v3, v0}, Lcom/android/camera/module/Panorama3Module;->access$3100(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/CaptureImage;)V

    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$1700(Lcom/android/camera/module/Panorama3Module;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v3, "DecideDirectionAttach request stop"

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->closeSrc()V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0

    return-void

    :cond_1
    :try_start_4
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v3, "DecideDirectionAttach attach start"

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$500(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3;

    move-result-object v5

    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->byteBuffer:[Ljava/nio/ByteBuffer;

    const/4 v3, 0x0

    aget-object v6, v0, v3

    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->byteBuffer:[Ljava/nio/ByteBuffer;

    aget-object v7, v0, v4

    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->byteBuffer:[Ljava/nio/ByteBuffer;

    const/4 v15, 0x2

    aget-object v8, v0, v15

    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->rowStride:[I

    aget v9, v0, v3

    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->rowStride:[I

    aget v10, v0, v4

    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->rowStride:[I

    aget v11, v0, v15

    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->pixelStride:[I

    aget v12, v0, v3

    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->pixelStride:[I

    aget v13, v0, v4

    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->pixelStride:[I

    aget v14, v0, v15

    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$3200(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/SensorInfoManager;

    move-result-object v0

    const/16 v16, 0x0

    iget-object v15, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v15, v15, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-virtual {v15}, Lcom/android/camera/module/Panorama3Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v15

    invoke-virtual {v15}, Lcom/android/camera/Camera;->getApplicationContext()Landroid/content/Context;

    move-result-object v17

    move-object v15, v0

    invoke-virtual/range {v5 .. v17}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->attach(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIILcom/android/camera/panorama/SensorInfoManager;[DLandroid/content/Context;)I

    move-result v0

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v5

    const-string v6, "DecideDirectionAttach attach end"

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const v5, -0x3fffffff    # -2.0000002f

    if-ne v0, v5, :cond_2

    move v5, v4

    goto :goto_1

    :cond_2
    nop

    move v5, v3

    :goto_1
    if-eqz v0, :cond_4

    if-nez v5, :cond_3

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "DecideDirectionAttach error ret:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "attach error ret:0x%08X"

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v4, v3

    invoke-static {v6, v7, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->closeSrc()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_0

    return-void

    :cond_4
    :try_start_6
    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$3300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    move-result-object v0

    iget v0, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->direction:I

    invoke-direct {v1, v0}, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->isUnDecideDirection(I)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$500(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->getDirection()I

    move-result v0

    iget-object v5, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v5, v5, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v5}, Lcom/android/camera/module/Panorama3Module;->access$3300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    move-result-object v5

    iget v5, v5, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->direction:I

    if-ne v0, v5, :cond_6

    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :try_start_7
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->closeSrc()V
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_0

    goto/16 :goto_0

    :cond_5
    :try_start_8
    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$3300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    move-result-object v0

    iget v0, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->direction:I

    :cond_6
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "getDirection = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v5, 0x2

    new-array v5, v5, [I

    iget-object v6, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v6, v6, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v6}, Lcom/android/camera/module/Panorama3Module;->access$500(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->getOutputImageSize([I)I

    move-result v6

    if-eqz v6, :cond_7

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v0

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "getOutputImageSize error ret:0x%08X"

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v3

    invoke-static {v5, v7, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    :try_start_9
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->closeSrc()V
    :try_end_9
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_9} :catch_0

    return-void

    :cond_7
    :try_start_a
    iget-object v6, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v6, v6, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    aget v3, v5, v3

    invoke-static {v6, v3}, Lcom/android/camera/module/Panorama3Module;->access$3402(Lcom/android/camera/module/Panorama3Module;I)I

    iget-object v3, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v3, v3, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    aget v4, v5, v4

    invoke-static {v3, v4}, Lcom/android/camera/module/Panorama3Module;->access$2402(Lcom/android/camera/module/Panorama3Module;I)I

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mMaxWidth = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v5, v5, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v5}, Lcom/android/camera/module/Panorama3Module;->access$3400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", mMaxHeight = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v5, v5, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v5}, Lcom/android/camera/module/Panorama3Module;->access$2400(Lcom/android/camera/module/Panorama3Module;)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    :try_start_b
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->closeSrc()V

    nop

    iget-object v2, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v2, v2, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2, v0}, Lcom/android/camera/module/Panorama3Module;->access$3502(Lcom/android/camera/module/Panorama3Module;I)I

    invoke-direct {v1, v0}, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->createDirection(I)V

    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$3600(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/DirectionFunction;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/panorama/DirectionFunction;->enabled()Z

    move-result v0
    :try_end_b
    .catch Ljava/lang/InterruptedException; {:try_start_b .. :try_end_b} :catch_0

    if-eqz v0, :cond_8

    goto :goto_2

    :cond_8
    goto/16 :goto_0

    :catchall_0
    move-exception v0

    :try_start_c
    monitor-exit v2
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    :try_start_d
    throw v0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    :catchall_1
    move-exception v0

    :try_start_e
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->closeSrc()V

    throw v0
    :try_end_e
    .catch Ljava/lang/InterruptedException; {:try_start_e .. :try_end_e} :catch_0

    :cond_9
    :goto_2
    goto :goto_3

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_3
    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;->this$1:Lcom/android/camera/module/Panorama3Module$DecideDirection;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$DecideDirection;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Panorama3Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    new-instance v2, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach$DecideRunnable;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v3}, Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach$DecideRunnable;-><init>(Lcom/android/camera/module/Panorama3Module$DecideDirection$DecideDirectionAttach;Lcom/android/camera/module/Panorama3Module$1;)V

    invoke-virtual {v0, v2}, Lcom/android/camera/Camera;->runOnUiThread(Ljava/lang/Runnable;)V

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "DecideDirectionAttach end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
