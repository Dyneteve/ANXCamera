.class Lcom/android/camera/fragment/FragmentWideSelfie$2;
.super Ljava/lang/Object;
.source "FragmentWideSelfie.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentWideSelfie;->setShootingUI()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/FragmentWideSelfie;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentWideSelfie;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie$2;->this$0:Lcom/android/camera/fragment/FragmentWideSelfie;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie$2;->this$0:Lcom/android/camera/fragment/FragmentWideSelfie;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentWideSelfie;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentWideSelfie$2;->this$0:Lcom/android/camera/fragment/FragmentWideSelfie;

    invoke-static {v1}, Lcom/android/camera/fragment/FragmentWideSelfie;->access$100(Lcom/android/camera/fragment/FragmentWideSelfie;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    const/16 v1, 0x12c

    invoke-virtual {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    :cond_0
    return-void
.end method
