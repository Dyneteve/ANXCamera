.class Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;
.super Ljava/lang/Object;
.source "FragmentMimojiEdit.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->showAlertDialog(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

.field final synthetic val$backType:I


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;I)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    iput p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->val$backType:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->val$backType:I

    const/4 p2, 0x0

    const/4 v0, 0x1

    const/4 v1, 0x2

    if-eq p1, v1, :cond_1

    iget p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->val$backType:I

    if-eq p1, v0, :cond_1

    iget p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->val$backType:I

    const/4 v1, 0x3

    if-ne p1, v1, :cond_0

    goto :goto_0

    :cond_0
    move v0, p2

    goto :goto_1

    :cond_1
    :goto_0
    nop

    :goto_1
    if-nez v0, :cond_3

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$1100(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$400(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object p1

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {v1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$1200(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {v1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$1300(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    :cond_2
    sget-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TempOriginalConfigPath:Ljava/lang/String;

    :goto_2
    invoke-virtual {p1, v1}, Lcom/arcsoft/avatar/AvatarEngine;->loadConfig(Ljava/lang/String;)V

    :cond_3
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$5;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {p1, v0, p2}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$700(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;ZZ)V

    return-void
.end method
