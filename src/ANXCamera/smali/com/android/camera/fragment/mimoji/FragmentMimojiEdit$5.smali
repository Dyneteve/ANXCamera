.class Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;
.super Landroid/os/Handler;
.source "FragmentMimojiEdit.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getSelectType()I

    move-result p1

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->isColorSelected()Z

    move-result v0

    nop

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {v3}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$900(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3, p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getSubConfigList(Landroid/content/Context;I)Ljava/util/ArrayList;

    move-result-object v2

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->isNeedUpdate(I)Z

    move-result p1

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {v3}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$800(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    move-result-object v3

    xor-int/lit8 v4, p1, 0x1

    invoke-virtual {v3, v2, v4, v0}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->refreshData(Ljava/util/List;ZZ)V

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$1000(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->draw(Z)V

    goto/16 :goto_0

    :pswitch_1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/os/Bundle;

    const-string v0, "OUTER"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    const-string v1, "INNER"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    const-string v2, "TYPE"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {v2}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$800(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    move-result-object v2

    invoke-virtual {v2, p1, v0, v1}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->notifyThumbnailUpdate(III)V

    goto/16 :goto_0

    :pswitch_2
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, [B

    const/16 v0, 0xc8

    invoke-static {p1, v0, v0}, Lcom/android/camera/fragment/mimoji/MimojiHelper;->getThumbnailBitmapFromData([BII)Landroid/graphics/Bitmap;

    move-result-object p1

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyyMMddHHmmssSSS"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/android/camera/fragment/mimoji/MimojiHelper;->CUSTOM_DIR:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "config.dat"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "pic.png"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/module/impl/component/FileUtils;->saveBitmap(Landroid/graphics/Bitmap;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$400(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object p1

    invoke-virtual {p1, v3}, Lcom/arcsoft/avatar/AvatarEngine;->saveConfig(Ljava/lang/String;)I

    move-result p1

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {v2}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$400(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/arcsoft/avatar/AvatarEngine;->loadConfig(Ljava/lang/String;)V

    sget-object v2, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "res = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "  save path : "

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v3}, Lcom/android/camera/CameraSettings;->setCurrentMimojiState(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$500(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)I

    move-result p1

    const/4 v2, 0x4

    if-ne p1, v2, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$600(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/module/impl/component/FileUtils;->deleteFile(Ljava/lang/String;)Z

    :cond_0
    new-instance p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;

    invoke-direct {p1}, Lcom/android/camera/fragment/mimoji/MimojiInfo;-><init>()V

    iput-object v3, p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    sget-object v2, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    iput-object v2, p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mAvatarTemplatePath:Ljava/lang/String;

    iput-object v0, p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mThumbnailUrl:Ljava/lang/String;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object v0

    iput-object p1, v0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mCurrentMimojiInfo:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    const/4 v0, 0x1

    invoke-static {p1, v1, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$700(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;ZZ)V

    nop

    :cond_1
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
