.class Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$12;
.super Ljava/lang/Object;
.source "MimojiAvatarEngineImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->createAvatar([BII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;


# direct methods
.method constructor <init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$12;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$12;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->setDisableSingleTapUp(Z)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$12;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$3000(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    return-void
.end method
