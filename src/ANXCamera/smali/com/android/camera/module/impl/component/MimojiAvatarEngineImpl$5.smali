.class Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;
.super Ljava/lang/Object;
.source "MimojiAvatarEngineImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->onMimojiSelect(Lcom/android/camera/fragment/mimoji/MimojiInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

.field final synthetic val$mimojiInfo:Lcom/android/camera/fragment/mimoji/MimojiInfo;


# direct methods
.method constructor <init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Lcom/android/camera/fragment/mimoji/MimojiInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    iput-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;->val$mimojiInfo:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;->val$mimojiInfo:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1202(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;->val$mimojiInfo:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setmCurrentMimojiInfo(Lcom/android/camera/fragment/mimoji/MimojiInfo;)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;->val$mimojiInfo:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mAvatarTemplatePath:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;->val$mimojiInfo:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    iget-object v1, v1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    invoke-static {}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$100()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "change mimoji with path = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ", and config = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$000(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v3}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1000(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    iget-object v4, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v4, v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1002(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    invoke-static {v1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->isPrefabModel(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v3}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Lcom/arcsoft/avatar/RecordModule;->changeHumanTemplate(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->loadConfig(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    if-nez v3, :cond_3

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/arcsoft/avatar/AvatarEngine;->setTemplatePath(Ljava/lang/String;)V

    :cond_3
    :goto_0
    monitor-exit v2

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1202(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setmCurrentMimojiInfo(Lcom/android/camera/fragment/mimoji/MimojiInfo;)V

    return-void
.end method
