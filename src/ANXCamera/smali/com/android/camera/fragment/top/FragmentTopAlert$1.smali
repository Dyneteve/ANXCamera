.class Lcom/android/camera/fragment/top/FragmentTopAlert$1;
.super Lcom/android/camera/fragment/top/FragmentTopAlert$TopAlertRunnable;
.source "FragmentTopAlert.java"


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
    .locals 1

    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/top/FragmentTopAlert$TopAlertRunnable;-><init>(Lcom/android/camera/fragment/top/FragmentTopAlert;Lcom/android/camera/fragment/top/FragmentTopAlert$1;)V

    return-void
.end method


# virtual methods
.method public runToSafe()V
    .locals 3

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-virtual {v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a00a7

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    const/4 v2, -0x2

    invoke-direct {v0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-static {v2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->access$100(Lcom/android/camera/fragment/top/FragmentTopAlert;)Lcom/android/camera/ui/ToggleSwitch;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->access$200(Lcom/android/camera/fragment/top/FragmentTopAlert;Landroid/view/View;Landroid/widget/LinearLayout$LayoutParams;)V

    return-void
.end method
