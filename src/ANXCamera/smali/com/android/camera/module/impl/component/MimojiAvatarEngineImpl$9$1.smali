.class Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9$1;
.super Ljava/lang/Object;
.source "MimojiAvatarEngineImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;->onCaptureResult(Ljava/nio/ByteBuffer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;

.field final synthetic val$byteBuffer:Ljava/nio/ByteBuffer;


# direct methods
.method constructor <init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;Ljava/nio/ByteBuffer;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9$1;->this$1:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;

    iput-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9$1;->val$byteBuffer:Ljava/nio/ByteBuffer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9$1;->this$1:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;

    iget-object v0, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9$1;->val$byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {v0, v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$2500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Ljava/nio/ByteBuffer;)V

    return-void
.end method
