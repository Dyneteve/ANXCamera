.class Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$4;
.super Ljava/lang/Object;
.source "FragmentDualCameraBokehAdjust.java"

# interfaces
.implements Lcom/android/camera/ui/HorizontalSlideView$OnTabListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$4;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTab(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$4;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->access$302(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;J)J

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$4;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;

    invoke-static {v0, p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->access$400(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;Landroid/view/View;)V

    return-void
.end method
