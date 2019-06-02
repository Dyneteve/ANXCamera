.class Lcom/android/camera/module/WideSelfieModule$4;
.super Ljava/lang/Object;
.source "WideSelfieModule.java"

# interfaces
.implements Lcom/android/camera/module/WideSelfieModule$SaveStateCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/WideSelfieModule;->startSaveTask([BIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/WideSelfieModule;


# direct methods
.method constructor <init>(Lcom/android/camera/module/WideSelfieModule;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/WideSelfieModule$4;->this$0:Lcom/android/camera/module/WideSelfieModule;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSaveCompleted()V
    .locals 5

    const-string v0, "WideSelfieModule"

    const-string v1, "onSaveCompleted"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule$4;->this$0:Lcom/android/camera/module/WideSelfieModule;

    invoke-static {v0}, Lcom/android/camera/module/WideSelfieModule;->access$500(Lcom/android/camera/module/WideSelfieModule;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0902a6

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    const/16 v2, 0x50

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/android/camera/module/WideSelfieModule$4;->this$0:Lcom/android/camera/module/WideSelfieModule;

    invoke-static {v4}, Lcom/android/camera/module/WideSelfieModule;->access$600(Lcom/android/camera/module/WideSelfieModule;)I

    move-result v4

    invoke-static {v1, v0, v2, v3, v4}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;Ljava/lang/String;III)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule$4;->this$0:Lcom/android/camera/module/WideSelfieModule;

    invoke-static {v0}, Lcom/android/camera/module/WideSelfieModule;->access$700(Lcom/android/camera/module/WideSelfieModule;)V

    return-void
.end method
