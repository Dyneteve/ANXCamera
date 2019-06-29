.class Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2;
.super Ljava/lang/Object;
.source "MimojiAvatarEngineImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->initMimojiResource(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

.field final synthetic val$featureVersion:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    iput-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2;->val$featureVersion:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const v2, 0x8000

    :try_start_0
    iget-object v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v3}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$600(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/content/Context;

    move-result-object v3

    const-string v4, "mimoji/model.zip"

    sget-object v5, Lcom/android/camera/fragment/mimoji/MimojiHelper;->MIMOJI_DIR:Ljava/lang/String;

    invoke-static {v3, v4, v5, v2}, Lcom/android/camera/Util;->verifyAssetZip(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    invoke-static {}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$100()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "verify asset zip failed..."

    invoke-static {v3, v4, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    invoke-static {}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$100()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "init model spend time = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setIsLoading(Z)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2;->val$featureVersion:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->setMimojiModleVersion(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mAvatarTemplatePath = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1000(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1100(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2$1;

    invoke-direct {v1, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2$1;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
