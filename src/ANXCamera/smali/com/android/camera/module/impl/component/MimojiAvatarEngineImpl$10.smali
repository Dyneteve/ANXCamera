.class Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;
.super Ljava/lang/Object;
.source "MimojiAvatarEngineImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->onPreviewFrame(Landroid/media/Image;Lcom/android/camera2/Camera2Proxy;I)V
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

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    invoke-static {}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "onPreviewFrame mIsAvatarInited START"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$202(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$000(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$200(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$100()Ljava/lang/String;

    move-result-object v2

    const-string v3, "onPreviewFrame avatar need really init"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->queryAvatar()Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$302(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Lcom/arcsoft/avatar/AvatarEngine;)Lcom/arcsoft/avatar/AvatarEngine;

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v2

    sget-object v3, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TRACK_DATA:Ljava/lang/String;

    sget-object v4, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->FACE_MODEL:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lcom/arcsoft/avatar/AvatarEngine;->init(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v2

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x1

    invoke-virtual {v2, v4, v3}, Lcom/arcsoft/avatar/AvatarEngine;->setRenderScene(ZF)V

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v2

    sget-object v3, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TRACK_DATA:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/arcsoft/avatar/AvatarEngine;->createOutlineEngine(Ljava/lang/String;)I

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2, v4}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$202(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$400(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    :cond_0
    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule;

    move-result-object v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    new-instance v3, Lcom/arcsoft/avatar/RecordModule;

    iget-object v4, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v4}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$600(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v5}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$700(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule$MediaResultCallback;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/arcsoft/avatar/RecordModule;-><init>(Landroid/content/Context;Lcom/arcsoft/avatar/RecordModule$MediaResultCallback;)V

    invoke-static {v2, v3}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$502(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Lcom/arcsoft/avatar/RecordModule;)Lcom/arcsoft/avatar/RecordModule;

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule;

    move-result-object v3

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$2700(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I

    move-result v4

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1700(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I

    move-result v5

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1800(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I

    move-result v6

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v7

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$2800(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Z

    move-result v8

    invoke-virtual/range {v3 .. v8}, Lcom/arcsoft/avatar/RecordModule;->init(IIILcom/arcsoft/avatar/AvatarEngine;Z)V

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v3}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$2700(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/arcsoft/avatar/RecordModule;->setmImageOrientation(I)V

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v3}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$2800(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/arcsoft/avatar/RecordModule;->setMirror(Z)V

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v3}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1700(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I

    move-result v3

    iget-object v4, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v4}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1800(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I

    move-result v4

    invoke-virtual {v2, v3, v4}, Lcom/arcsoft/avatar/RecordModule;->setPreviewSize(II)V

    :goto_0
    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$600(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/android/camera/Util;->getPreviewRect(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v3}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule;

    move-result-object v3

    sget v4, Lcom/android/camera/Util;->sWindowHeight:I

    iget v5, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v4, v5

    iget v5, v2, Landroid/graphics/Rect;->right:I

    iget v6, v2, Landroid/graphics/Rect;->bottom:I

    iget v7, v2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v6, v7

    invoke-virtual {v3, v1, v4, v5, v6}, Lcom/arcsoft/avatar/RecordModule;->setDrawScope(IIII)V

    iget-object v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    new-instance v4, Landroid/util/Size;

    iget v5, v2, Landroid/graphics/Rect;->right:I

    iget v6, v2, Landroid/graphics/Rect;->bottom:I

    iget v2, v2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v6, v2

    invoke-direct {v4, v5, v6}, Landroid/util/Size;-><init>(II)V

    invoke-static {v3, v4}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$802(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Landroid/util/Size;)Landroid/util/Size;

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2, v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$902(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
