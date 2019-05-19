.class Lcom/android/camera/fragment/live/FragmentLiveSticker$1;
.super Ljava/lang/Object;
.source "FragmentLiveSticker.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/live/FragmentLiveSticker;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/live/FragmentLiveSticker;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$1;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    const-string p1, "live_sticker_off"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveClick(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$1;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker;

    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->onItemSelected(ILandroid/view/View;)V

    return-void
.end method
