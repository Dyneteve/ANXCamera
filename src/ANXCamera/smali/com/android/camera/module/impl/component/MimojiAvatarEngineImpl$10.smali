.class Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;
.super Ljava/lang/Object;
.source "MimojiAvatarEngineImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->onPreviewFrame(Landroid/media/Image;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

.field final synthetic val$res:I


# direct methods
.method constructor <init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;I)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    iput p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->val$res:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$2000(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->val$res:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;->showOrHideTips(Z)V

    return-void
.end method
