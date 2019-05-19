.class Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$6$1;
.super Ljava/lang/Object;
.source "FragmentMimojiEdit.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$6;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$6;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$6;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$6$1;->this$1:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$6$1;->this$1:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$6;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$6;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    const/4 p2, 0x1

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$200(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;ZZ)V

    return-void
.end method
