.class Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$1;
.super Ljava/lang/Object;
.source "FragmentMimojiEdit.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->startMimojiEdit()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$1;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

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

    return-void
.end method
