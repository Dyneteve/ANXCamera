.class Lcom/android/camera/module/LiveModule$2;
.super Ljava/lang/Object;
.source "LiveModule.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/LiveModule;->showAuthError()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/LiveModule;


# direct methods
.method constructor <init>(Lcom/android/camera/module/LiveModule;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/LiveModule$2;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule$2;->this$0:Lcom/android/camera/module/LiveModule;

    iget-object v1, v1, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f09027b

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    const v1, 0x7f09027c

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    new-instance v1, Lcom/android/camera/module/LiveModule$2$1;

    invoke-direct {v1, p0}, Lcom/android/camera/module/LiveModule$2$1;-><init>(Lcom/android/camera/module/LiveModule$2;)V

    const v2, 0x7f09027d

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    new-instance v1, Lcom/android/camera/module/LiveModule$2$2;

    invoke-direct {v1, p0}, Lcom/android/camera/module/LiveModule$2$2;-><init>(Lcom/android/camera/module/LiveModule$2;)V

    const v2, 0x7f0901b3

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method
