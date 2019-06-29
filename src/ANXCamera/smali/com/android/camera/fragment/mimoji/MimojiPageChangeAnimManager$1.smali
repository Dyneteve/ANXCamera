.class Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager$1;
.super Ljava/lang/Object;
.source "MimojiPageChangeAnimManager.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->translateYTextureView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;

.field final synthetic val$animator:Landroid/animation/ValueAnimator;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;Landroid/animation/ValueAnimator;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager$1;->this$0:Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;

    iput-object p2, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager$1;->val$animator:Landroid/animation/ValueAnimator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager$1;->val$animator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager$1;->this$0:Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->access$000(Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v0

    float-to-int p1, p1

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager$1;->this$0:Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->access$100(Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;)Lcom/android/camera/ui/MimojiEditGLTextureView;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager$1;->this$0:Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->access$000(Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/MimojiEditGLTextureView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
