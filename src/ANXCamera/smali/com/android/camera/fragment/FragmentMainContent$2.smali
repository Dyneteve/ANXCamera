.class Lcom/android/camera/fragment/FragmentMainContent$2;
.super Ljava/lang/Object;
.source "FragmentMainContent.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentMainContent;->consumeResult(IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/FragmentMainContent;

.field final synthetic val$currentLightingView:Lcom/android/camera/ui/LightingView;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentMainContent;Lcom/android/camera/ui/LightingView;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentMainContent$2;->this$0:Lcom/android/camera/fragment/FragmentMainContent;

    iput-object p2, p0, Lcom/android/camera/fragment/FragmentMainContent$2;->val$currentLightingView:Lcom/android/camera/ui/LightingView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent$2;->this$0:Lcom/android/camera/fragment/FragmentMainContent;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentMainContent;->access$100(Lcom/android/camera/fragment/FragmentMainContent;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent$2;->val$currentLightingView:Lcom/android/camera/ui/LightingView;

    invoke-virtual {v0}, Lcom/android/camera/ui/LightingView;->triggerAnimateSuccess()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent$2;->val$currentLightingView:Lcom/android/camera/ui/LightingView;

    invoke-virtual {v0}, Lcom/android/camera/ui/LightingView;->triggerAnimateFocusing()V

    :goto_0
    return-void
.end method
