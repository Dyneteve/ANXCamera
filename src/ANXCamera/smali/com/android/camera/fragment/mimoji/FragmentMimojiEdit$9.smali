.class Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$9;
.super Ljava/lang/Object;
.source "FragmentMimojiEdit.java"

# interfaces
.implements Lcom/android/camera/fragment/mimoji/ItfGvOnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->initConfigList()V
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

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$9;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notifyUIChanged()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$9;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$402(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;Z)Z

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$9;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$500(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)I

    move-result v0

    const/16 v1, 0x69

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$9;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->updateTitleState(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$9;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$200(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->resetLayoutPosition(I)V

    :cond_0
    return-void
.end method
