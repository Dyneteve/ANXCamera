.class Lcom/android/camera/fragment/top/FragmentTopAlert$4;
.super Ljava/lang/Object;
.source "FragmentTopAlert.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/top/FragmentTopAlert;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/top/FragmentTopAlert;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$4;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$4;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$4;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-static {v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->access$700(Lcom/android/camera/fragment/top/FragmentTopAlert;)Landroid/widget/TextView;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->access$400(Lcom/android/camera/fragment/top/FragmentTopAlert;Landroid/view/View;)V

    return-void
.end method
