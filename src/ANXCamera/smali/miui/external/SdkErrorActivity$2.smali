.class Lmiui/external/SdkErrorActivity$2;
.super Ljava/lang/Object;
.source "SdkErrorActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/external/SdkErrorActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmiui/external/SdkErrorActivity;


# direct methods
.method constructor <init>(Lmiui/external/SdkErrorActivity;)V
    .locals 0

    iput-object p1, p0, Lmiui/external/SdkErrorActivity$2;->this$0:Lmiui/external/SdkErrorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    iget-object p1, p0, Lmiui/external/SdkErrorActivity$2;->this$0:Lmiui/external/SdkErrorActivity;

    invoke-static {p1}, Lmiui/external/SdkErrorActivity;->access$000(Lmiui/external/SdkErrorActivity;)Landroid/app/Dialog;

    move-result-object p1

    new-instance p2, Lmiui/external/SdkErrorActivity$SdkDialogFragment;

    iget-object v0, p0, Lmiui/external/SdkErrorActivity$2;->this$0:Lmiui/external/SdkErrorActivity;

    invoke-direct {p2, v0, p1}, Lmiui/external/SdkErrorActivity$SdkDialogFragment;-><init>(Lmiui/external/SdkErrorActivity;Landroid/app/Dialog;)V

    iget-object v0, p0, Lmiui/external/SdkErrorActivity$2;->this$0:Lmiui/external/SdkErrorActivity;

    invoke-virtual {v0}, Lmiui/external/SdkErrorActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "SdkUpdatePromptDialog"

    invoke-virtual {p2, v0, v1}, Lmiui/external/SdkErrorActivity$SdkDialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    new-instance p2, Lmiui/external/SdkErrorActivity$2$1;

    invoke-direct {p2, p0, p1}, Lmiui/external/SdkErrorActivity$2$1;-><init>(Lmiui/external/SdkErrorActivity$2;Landroid/app/Dialog;)V

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    invoke-virtual {p2, p1}, Lmiui/external/SdkErrorActivity$2$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
