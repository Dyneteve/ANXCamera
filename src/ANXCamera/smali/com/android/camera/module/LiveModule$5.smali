.class Lcom/android/camera/module/LiveModule$5;
.super Ljava/lang/Object;
.source "LiveModule.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/LiveModule;->startScreenLight(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/LiveModule;

.field final synthetic val$brightness:I

.field final synthetic val$color:I


# direct methods
.method constructor <init>(Lcom/android/camera/module/LiveModule;II)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/LiveModule$5;->this$0:Lcom/android/camera/module/LiveModule;

    iput p2, p0, Lcom/android/camera/module/LiveModule$5;->val$brightness:I

    iput p3, p0, Lcom/android/camera/module/LiveModule$5;->val$color:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/LiveModule$5;->this$0:Lcom/android/camera/module/LiveModule;

    iget-object v0, v0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/LiveModule$5;->this$0:Lcom/android/camera/module/LiveModule;

    iget-object v0, v0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    iget v1, p0, Lcom/android/camera/module/LiveModule$5;->val$brightness:I

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setWindowBrightness(I)V

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;

    if-eqz v0, :cond_1

    iget v1, p0, Lcom/android/camera/module/LiveModule$5;->val$color:I

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;->setScreenLightColor(I)V

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;->showScreenLight()V

    :cond_1
    return-void
.end method
