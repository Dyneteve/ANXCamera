.class Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2$1;
.super Ljava/lang/Object;
.source "MimojiAvatarEngineImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2;


# direct methods
.method constructor <init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2$1;->this$1:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xe2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MimojiAlert;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MimojiAlert;->firstProgressShow(Z)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mimojiAlert finish == null"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method
