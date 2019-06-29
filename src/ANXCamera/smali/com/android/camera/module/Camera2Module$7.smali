.class Lcom/android/camera/module/Camera2Module$7;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/Camera2Module;->handleSuperNightResultIfNeed()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;

.field final synthetic val$directlyShowResult:Z


# direct methods
.method constructor <init>(Lcom/android/camera/module/Camera2Module;Z)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$7;->this$0:Lcom/android/camera/module/Camera2Module;

    iput-boolean p2, p0, Lcom/android/camera/module/Camera2Module$7;->val$directlyShowResult:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    if-eqz v0, :cond_1

    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module$7;->val$directlyShowResult:Z

    if-eqz v1, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPostSavingStart()V

    :cond_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPostSavingFinish()V

    :cond_1
    return-void
.end method
