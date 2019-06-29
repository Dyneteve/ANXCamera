.class Lcom/ss/android/vesdk/VEEditor$6;
.super Ljava/lang/Object;
.source "VEEditor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/vesdk/VEEditor;->genReverseVideoAsync(Lcom/ss/android/vesdk/VEReverseCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/vesdk/VEEditor;

.field final synthetic val$callback:Lcom/ss/android/vesdk/VEReverseCallback;


# direct methods
.method constructor <init>(Lcom/ss/android/vesdk/VEEditor;Lcom/ss/android/vesdk/VEReverseCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$6;->this$0:Lcom/ss/android/vesdk/VEEditor;

    iput-object p2, p0, Lcom/ss/android/vesdk/VEEditor$6;->val$callback:Lcom/ss/android/vesdk/VEReverseCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$6;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {v0}, Lcom/ss/android/vesdk/VEEditor;->access$1400(Lcom/ss/android/vesdk/VEEditor;)Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    move-result-object v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$6;->val$callback:Lcom/ss/android/vesdk/VEReverseCallback;

    invoke-interface {v0, v1}, Lcom/ss/android/vesdk/VEReverseCallback;->onReverseFinish(I)V

    const-string v0, "VEEditor"

    const-string v1, "reverse may be canceled"

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v2, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    array-length v2, v2

    if-gtz v2, :cond_2

    :cond_1
    const-string v2, "VEEditor"

    const-string v3, "reverse failed, invalid params!"

    invoke-static {v2, v3}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor$6;->val$callback:Lcom/ss/android/vesdk/VEReverseCallback;

    const/16 v3, -0x64

    invoke-interface {v2, v3}, Lcom/ss/android/vesdk/VEReverseCallback;->onReverseFinish(I)V

    :cond_2
    new-instance v2, Lcom/ss/android/medialib/FFMpegInvoker;

    invoke-direct {v2}, Lcom/ss/android/medialib/FFMpegInvoker;-><init>()V

    iget-object v3, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    array-length v3, v3

    new-array v3, v3, [Ljava/lang/String;

    iput-object v3, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mReverseVideoPath:[Ljava/lang/String;

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    iget-object v5, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    array-length v5, v5

    if-ge v4, v5, :cond_5

    invoke-virtual {v0, v4}, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->genReverseVideoPath(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    aget-object v6, v6, v4

    invoke-virtual {v2, v6, v5}, Lcom/ss/android/medialib/FFMpegInvoker;->addFastReverseVideo(Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    iget-object v7, p0, Lcom/ss/android/vesdk/VEEditor$6;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {v7}, Lcom/ss/android/vesdk/VEEditor;->access$1500(Lcom/ss/android/vesdk/VEEditor;)Z

    move-result v7

    if-eqz v7, :cond_3

    const-string v0, "VEEditor"

    const-string v2, "reverse failed, reverse has been canceled"

    invoke-static {v0, v2}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$6;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {v0, v3}, Lcom/ss/android/vesdk/VEEditor;->access$1502(Lcom/ss/android/vesdk/VEEditor;Z)Z

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$6;->val$callback:Lcom/ss/android/vesdk/VEReverseCallback;

    invoke-interface {v0, v1}, Lcom/ss/android/vesdk/VEReverseCallback;->onReverseFinish(I)V

    return-void

    :cond_3
    if-eqz v6, :cond_4

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$6;->val$callback:Lcom/ss/android/vesdk/VEReverseCallback;

    invoke-interface {v0, v1}, Lcom/ss/android/vesdk/VEReverseCallback;->onReverseFinish(I)V

    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "reverse mResManager.mVideoPaths["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "] failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_4
    iget-object v6, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mReverseVideoPath:[Ljava/lang/String;

    aput-object v5, v6, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$6;->this$0:Lcom/ss/android/vesdk/VEEditor;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/ss/android/vesdk/VEEditor;->access$1602(Lcom/ss/android/vesdk/VEEditor;Z)Z

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$6;->val$callback:Lcom/ss/android/vesdk/VEReverseCallback;

    invoke-interface {v0, v3}, Lcom/ss/android/vesdk/VEReverseCallback;->onReverseFinish(I)V

    return-void
.end method
