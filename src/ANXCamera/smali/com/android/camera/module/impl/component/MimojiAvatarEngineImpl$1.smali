.class Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;
.super Ljava/lang/Object;
.source "MimojiAvatarEngineImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->initAvatarEngine(IIIIZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

.field final synthetic val$displayOrientation:I

.field final synthetic val$hashCode:I

.field final synthetic val$isFrontCamera:Z

.field final synthetic val$previewHeight:I

.field final synthetic val$previewWidth:I


# direct methods
.method constructor <init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;IIIIZ)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    iput p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->val$hashCode:I

    iput p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->val$displayOrientation:I

    iput p4, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->val$previewWidth:I

    iput p5, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->val$previewHeight:I

    iput-boolean p6, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->val$isFrontCamera:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$000(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    invoke-static {}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$100()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "avatar start init | "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->val$hashCode:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$200(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$100()Ljava/lang/String;

    move-result-object v1

    const-string v2, "avatar need really init"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->queryAvatar()Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$302(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Lcom/arcsoft/avatar/AvatarEngine;)Lcom/arcsoft/avatar/AvatarEngine;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v1

    sget-object v2, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TRACK_DATA:Ljava/lang/String;

    sget-object v3, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->FACE_MODEL:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/arcsoft/avatar/AvatarEngine;->init(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v1

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x1

    invoke-virtual {v1, v3, v2}, Lcom/arcsoft/avatar/AvatarEngine;->setRenderScene(ZF)V

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v1

    sget-object v2, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TRACK_DATA:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/arcsoft/avatar/AvatarEngine;->createOutlineEngine(Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1, v3}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$202(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$400(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule;

    move-result-object v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    new-instance v2, Lcom/arcsoft/avatar/RecordModule;

    iget-object v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v3}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$600(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v4}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$700(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule$MediaResultCallback;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/arcsoft/avatar/RecordModule;-><init>(Landroid/content/Context;Lcom/arcsoft/avatar/RecordModule$MediaResultCallback;)V

    invoke-static {v1, v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$502(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Lcom/arcsoft/avatar/RecordModule;)Lcom/arcsoft/avatar/RecordModule;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->val$displayOrientation:I

    iget v4, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->val$previewWidth:I

    iget v5, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->val$previewHeight:I

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v6

    iget-boolean v7, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->val$isFrontCamera:Z

    invoke-virtual/range {v2 .. v7}, Lcom/arcsoft/avatar/RecordModule;->init(IIILcom/arcsoft/avatar/AvatarEngine;Z)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->val$displayOrientation:I

    invoke-virtual {v1, v2}, Lcom/arcsoft/avatar/RecordModule;->setmImageOrientation(I)V

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->val$isFrontCamera:Z

    invoke-virtual {v1, v2}, Lcom/arcsoft/avatar/RecordModule;->setMirror(Z)V

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->val$previewWidth:I

    iget v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->val$previewHeight:I

    invoke-virtual {v1, v2, v3}, Lcom/arcsoft/avatar/RecordModule;->setPreviewSize(II)V

    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$600(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->getPreviewRect(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule;

    move-result-object v2

    sget v3, Lcom/android/camera/Util;->sWindowHeight:I

    iget v4, v1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v3, v4

    iget v4, v1, Landroid/graphics/Rect;->right:I

    iget v5, v1, Landroid/graphics/Rect;->bottom:I

    iget v6, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v5, v6

    const/4 v6, 0x0

    invoke-virtual {v2, v6, v3, v4, v5}, Lcom/arcsoft/avatar/RecordModule;->setDrawScope(IIII)V

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    new-instance v3, Landroid/util/Size;

    iget v4, v1, Landroid/graphics/Rect;->right:I

    iget v5, v1, Landroid/graphics/Rect;->bottom:I

    iget v1, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v5, v1

    invoke-direct {v3, v4, v5}, Landroid/util/Size;-><init>(II)V

    invoke-static {v2, v3}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$802(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Landroid/util/Size;)Landroid/util/Size;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1, v6}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$902(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
