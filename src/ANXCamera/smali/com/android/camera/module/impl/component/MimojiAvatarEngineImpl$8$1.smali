.class Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$8$1;
.super Ljava/lang/Object;
.source "MimojiAvatarEngineImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$8;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$8;


# direct methods
.method constructor <init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$8;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$8$1;->this$1:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$8$1;->this$1:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$8;

    iget-object v0, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$8;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$700(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arcsoft/avatar/RecordModule;->stopRecording()V

    return-void
.end method
