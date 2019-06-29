.class public Lcom/android/camera/fragment/CtaNoticeFragment;
.super Landroid/app/DialogFragment;
.source "CtaNoticeFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;,
        Lcom/android/camera/fragment/CtaNoticeFragment$CTA;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "CtaNoticeFragment"


# instance fields
.field private mClickListener:Lcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;

.field private mShowRemindButton:Z


# direct methods
.method public constructor <init>(ZLcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;)V
    .locals 0

    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    iput-boolean p1, p0, Lcom/android/camera/fragment/CtaNoticeFragment;->mShowRemindButton:Z

    iput-object p2, p0, Lcom/android/camera/fragment/CtaNoticeFragment;->mClickListener:Lcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/CtaNoticeFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/fragment/CtaNoticeFragment;->mShowRemindButton:Z

    return p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/CtaNoticeFragment;)Lcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/CtaNoticeFragment;->mClickListener:Lcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;

    return-object p0
.end method

.method public static checkCta(Landroid/app/FragmentManager;)Z
    .locals 1

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/android/camera/fragment/CtaNoticeFragment;->checkCta(Landroid/app/FragmentManager;Z)Z

    move-result p0

    return p0
.end method

.method public static checkCta(Landroid/app/FragmentManager;Z)Z
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/android/camera/fragment/CtaNoticeFragment;->checkCta(Landroid/app/FragmentManager;ZLcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;)Z

    move-result p0

    return p0
.end method

.method public static checkCta(Landroid/app/FragmentManager;ZLcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;)Z
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/android/camera/fragment/CtaNoticeFragment;->showCta(Landroid/app/FragmentManager;ZLcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;)Lcom/android/camera/fragment/CtaNoticeFragment;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static showCta(Landroid/app/FragmentManager;ZLcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;)Lcom/android/camera/fragment/CtaNoticeFragment;
    .locals 1

    invoke-static {}, Lcom/android/camera/fragment/CtaNoticeFragment$CTA;->canConnectNetwork()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "CtaNoticeFragment"

    invoke-virtual {p0, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/camera/fragment/CtaNoticeFragment;

    invoke-direct {v0, p1, p2}, Lcom/android/camera/fragment/CtaNoticeFragment;-><init>(ZLcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;)V

    const-string p1, "CtaNoticeFragment"

    invoke-virtual {v0, p0, p1}, Lcom/android/camera/fragment/CtaNoticeFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-object v0

    :cond_0
    check-cast v0, Lcom/android/camera/fragment/CtaNoticeFragment;

    return-object v0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/CtaNoticeFragment;->setCancelable(Z)V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 3

    new-instance p1, Lmiui/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/camera/fragment/CtaNoticeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v0, 0x7f0901e8

    invoke-virtual {p1, v0}, Lmiui/app/AlertDialog$Builder;->setTitle(I)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    const v0, 0x7f0901e6

    invoke-virtual {p1, v0}, Lmiui/app/AlertDialog$Builder;->setMessage(I)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lcom/android/camera/fragment/CtaNoticeFragment$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/CtaNoticeFragment$2;-><init>(Lcom/android/camera/fragment/CtaNoticeFragment;)V

    const v1, 0x7f0901e4

    invoke-virtual {p1, v1, v0}, Lmiui/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lcom/android/camera/fragment/CtaNoticeFragment$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/CtaNoticeFragment$1;-><init>(Lcom/android/camera/fragment/CtaNoticeFragment;)V

    const/high16 v1, 0x1040000

    invoke-virtual {p1, v1, v0}, Lmiui/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    iget-boolean v0, p0, Lcom/android/camera/fragment/CtaNoticeFragment;->mShowRemindButton:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/android/camera/fragment/CtaNoticeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f0901e5

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lmiui/app/AlertDialog$Builder;->setCheckBox(ZLjava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    :cond_0
    invoke-virtual {p1}, Lmiui/app/AlertDialog$Builder;->create()Lmiui/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method

.method public onStart()V
    .locals 2

    invoke-super {p0}, Landroid/app/DialogFragment;->onStart()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/CtaNoticeFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    check-cast v0, Lmiui/app/AlertDialog;

    invoke-virtual {v0}, Lmiui/app/AlertDialog;->getMessageView()Landroid/widget/TextView;

    move-result-object v0

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    :cond_0
    return-void
.end method
