.class Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager$3;
.super Ljava/lang/Object;
.source "MimojiPageChangeAnimManager.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->translateYEditLayout()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager$3;->this$0:Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 1

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager$3;->this$0:Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->access$200(Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;)Landroid/widget/LinearLayout;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return-void
.end method
