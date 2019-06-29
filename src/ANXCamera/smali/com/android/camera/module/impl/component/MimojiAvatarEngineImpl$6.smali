.class Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$6;
.super Ljava/lang/Object;
.source "MimojiAvatarEngineImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->onRecordStart(Landroid/content/ContentValues;)V
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

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$6;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$6;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->getVideoEncoder()I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$6;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule;

    move-result-object v2

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$6;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1400(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/os/ParcelFileDescriptor;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v3

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$6;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/recoder/RecordingListener;

    move-result-object v4

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$6;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1600(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I

    move-result v5

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$6;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1700(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I

    move-result v6

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$6;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1800(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I

    move-result v7

    const v8, 0x989680

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    const-string/jumbo v0, "video/hevc"

    :goto_0
    move-object v9, v0

    goto :goto_1

    :cond_0
    const-string/jumbo v0, "video/avc"

    goto :goto_0

    :goto_1
    invoke-virtual/range {v2 .. v9}, Lcom/arcsoft/avatar/RecordModule;->startRecording(Ljava/io/FileDescriptor;Lcom/arcsoft/avatar/recoder/RecordingListener;IIIILjava/lang/String;)V

    :cond_1
    return-void
.end method
