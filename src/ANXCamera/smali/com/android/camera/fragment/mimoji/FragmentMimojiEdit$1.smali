.class Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$1;
.super Ljava/lang/Object;
.source "FragmentMimojiEdit.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->startMimojiEdit(ZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

.field final synthetic val$from:I


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;I)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$1;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    iput p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$1;->val$from:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$1;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$000(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$1;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$100(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/android/camera/ui/MimojiEditGLTextureView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/MimojiEditGLTextureView;->setVisibility(I)V

    iget v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$1;->val$from:I

    const/16 v1, 0x65

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$1;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$200(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->resetLayoutPosition(I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$1;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$200(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->resetLayoutPosition(I)V

    :goto_0
    return-void
.end method
