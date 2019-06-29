.class Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$2;
.super Ljava/lang/Object;
.source "EditLevelListAdapter.java"

# interfaces
.implements Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$2;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfigItemClick(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;ZI)V
    .locals 3

    if-nez p1, :cond_0

    invoke-static {}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->access$200()Ljava/lang/String;

    move-result-object p1

    const-string p2, "onConfigItemClick, ASAvatarConfigInfo is null"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->access$200()Ljava/lang/String;

    move-result-object p3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onConfigItemClick, ASAvatarConfigInfo = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p3, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p3, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$2;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    invoke-static {p3}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->access$300(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;)Lcom/android/camera/fragment/mimoji/ItfGvOnItemClickListener;

    move-result-object p3

    invoke-interface {p3}, Lcom/android/camera/fragment/mimoji/ItfGvOnItemClickListener;->notifyUIChanged()V

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object p3

    const/4 v0, 0x1

    invoke-virtual {p3, v0, p2}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setAllNeedUpdate(ZZ)V

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->addAvatarConfig(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)Lcom/arcsoft/avatar/AvatarEngine;

    iget p3, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    iget v1, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configID:I

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getASAvatarConfigValue()Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;

    move-result-object v2

    invoke-static {p3, v1, v2}, Lcom/arcsoft/avatar/util/AvatarConfigUtils;->updateConfigID(IILcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;)V

    iget-object p3, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$2;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    invoke-static {p3}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->access$400(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;)Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->setConfig(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)V

    if-eqz p2, :cond_2

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$2;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->access$400(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;)Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->getIsRendering()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$2;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->access$400(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;)Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->draw(Z)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$2;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->access$400(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;)Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->setStopRender(Z)V

    :cond_2
    :goto_0
    return-void
.end method
