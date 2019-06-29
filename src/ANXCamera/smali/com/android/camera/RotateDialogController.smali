.class public Lcom/android/camera/RotateDialogController;
.super Ljava/lang/Object;
.source "RotateDialogController.java"

# interfaces
.implements Lcom/android/camera/ui/Rotatable;


# static fields
.field private static final ANIM_DURATION:J = 0x96L

.field private static final TAG:Ljava/lang/String; = "RotateDialogController"


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mDialogRootLayout:Landroid/view/View;

.field private mFadeInAnim:Landroid/view/animation/Animation;

.field private mFadeOutAnim:Landroid/view/animation/Animation;

.field private mLayoutResourceID:I

.field private mRotateDialog:Lcom/android/camera/ui/RotateLayout;

.field private mRotateDialogButton1:Landroid/widget/TextView;

.field private mRotateDialogButton2:Landroid/widget/TextView;

.field private mRotateDialogButtonLayout:Landroid/view/View;

.field private mRotateDialogSpinner:Landroid/widget/ProgressBar;

.field private mRotateDialogText:Landroid/widget/TextView;

.field private mRotateDialogTitle:Landroid/widget/TextView;

.field private mRotateDialogTitleLayout:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/app/Activity;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera/RotateDialogController;->mActivity:Landroid/app/Activity;

    if-nez p2, :cond_0

    const p2, 0x7f040052

    :cond_0
    iput p2, p0, Lcom/android/camera/RotateDialogController;->mLayoutResourceID:I

    return-void
.end method

.method private fadeInDialog()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/RotateDialogController;->mDialogRootLayout:Landroid/view/View;

    iget-object v1, p0, Lcom/android/camera/RotateDialogController;->mFadeInAnim:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Lcom/android/camera/RotateDialogController;->mDialogRootLayout:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private fadeOutDialog()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/RotateDialogController;->mDialogRootLayout:Landroid/view/View;

    iget-object v1, p0, Lcom/android/camera/RotateDialogController;->mFadeOutAnim:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Lcom/android/camera/RotateDialogController;->mDialogRootLayout:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private inflateDialogLayout()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/RotateDialogController;->mDialogRootLayout:Landroid/view/View;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/RotateDialogController;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/android/camera/RotateDialogController;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/RotateDialogController;->mLayoutResourceID:I

    invoke-virtual {v1, v2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0e0101

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/RotateDialogController;->mDialogRootLayout:Landroid/view/View;

    const v1, 0x7f0e0102

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/RotateLayout;

    iput-object v1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialog:Lcom/android/camera/ui/RotateLayout;

    const v1, 0x7f0e0103

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogTitleLayout:Landroid/view/View;

    const v1, 0x7f0e0107

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogButtonLayout:Landroid/view/View;

    const v1, 0x7f0e0104

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogTitle:Landroid/widget/TextView;

    const v1, 0x7f0e0105

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogSpinner:Landroid/widget/ProgressBar;

    const v1, 0x7f0e0106

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogText:Landroid/widget/TextView;

    const v1, 0x7f0e0109

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogButton1:Landroid/widget/TextView;

    const v1, 0x7f0e0108

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogButton2:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/camera/RotateDialogController;->mActivity:Landroid/app/Activity;

    const/high16 v1, 0x10a0000

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/RotateDialogController;->mFadeInAnim:Landroid/view/animation/Animation;

    iget-object v0, p0, Lcom/android/camera/RotateDialogController;->mActivity:Landroid/app/Activity;

    const v1, 0x10a0001

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/RotateDialogController;->mFadeOutAnim:Landroid/view/animation/Animation;

    iget-object v0, p0, Lcom/android/camera/RotateDialogController;->mFadeInAnim:Landroid/view/animation/Animation;

    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    iget-object v0, p0, Lcom/android/camera/RotateDialogController;->mFadeOutAnim:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    :cond_0
    return-void
.end method

.method public static showSystemAlertDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/app/AlertDialog;
    .locals 1

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    if-eqz p3, :cond_0

    new-instance p0, Lcom/android/camera/RotateDialogController$3;

    invoke-direct {p0, p4}, Lcom/android/camera/RotateDialogController$3;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p3, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    :cond_0
    if-eqz p5, :cond_1

    new-instance p0, Lcom/android/camera/RotateDialogController$4;

    invoke-direct {p0, p6}, Lcom/android/camera/RotateDialogController$4;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p5, p0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    :cond_1
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    return-object p0
.end method

.method public static showSystemChoiceDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/app/AlertDialog;
    .locals 7

    new-instance v0, Lcom/android/camera/RotateDialogController$5;

    invoke-direct {v0}, Lcom/android/camera/RotateDialogController$5;-><init>()V

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f04005a

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    const v3, 0x7f0e010e

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v3, 0x7f090210

    invoke-virtual {p2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    new-instance v3, Landroid/text/SpannableString;

    invoke-direct {v3, p2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    new-instance v4, Lcom/android/camera/RotateDialogController$6;

    invoke-direct {v4, p0}, Lcom/android/camera/RotateDialogController$6;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    const/4 v5, 0x0

    const/16 v6, 0x21

    invoke-virtual {v3, v4, v5, p2, v6}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    const p2, 0x7f0e010f

    invoke-virtual {v2, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    const/4 v4, 0x1

    invoke-virtual {p2, v4}, Landroid/widget/TextView;->setClickable(Z)V

    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v3

    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v3, Lcom/android/camera/RotateDialogController$7;

    invoke-direct {v3, p0}, Lcom/android/camera/RotateDialogController$7;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    const p0, 0x7f0e0110

    invoke-virtual {v2, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/CheckBox;

    invoke-virtual {p0, p3}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1, v5}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    if-eqz p4, :cond_1

    new-instance p1, Lcom/android/camera/RotateDialogController$8;

    invoke-direct {p1, p0, p5, p6}, Lcom/android/camera/RotateDialogController$8;-><init>(Landroid/widget/CheckBox;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    invoke-virtual {v1, p4, p1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    :cond_1
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    const/16 p2, 0x63

    iput p2, p1, Landroid/view/WindowManager$LayoutParams;->type:I

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    return-object p0
.end method


# virtual methods
.method public dismissDialog()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/RotateDialogController;->mDialogRootLayout:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/RotateDialogController;->mDialogRootLayout:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lcom/android/camera/RotateDialogController;->fadeOutDialog()V

    :cond_0
    return-void
.end method

.method public resetRotateDialog()V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/RotateDialogController;->inflateDialogLayout()V

    iget-object v0, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogTitleLayout:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogSpinner:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogButton1:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogButton2:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogButtonLayout:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public setOrientation(IZ)V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/RotateDialogController;->inflateDialogLayout()V

    iget-object v0, p0, Lcom/android/camera/RotateDialogController;->mRotateDialog:Lcom/android/camera/ui/RotateLayout;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/ui/RotateLayout;->setOrientation(IZ)V

    return-void
.end method

.method public showAlertDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera/RotateDialogController;->resetRotateDialog()V

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogTitle:Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogTitleLayout:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    iget-object p1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogText:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz p3, :cond_1

    iget-object p1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogButton1:Landroid/widget/TextView;

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogButton1:Landroid/widget/TextView;

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogButton1:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogButton1:Landroid/widget/TextView;

    new-instance p2, Lcom/android/camera/RotateDialogController$1;

    invoke-direct {p2, p0, p4}, Lcom/android/camera/RotateDialogController$1;-><init>(Lcom/android/camera/RotateDialogController;Ljava/lang/Runnable;)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogButtonLayout:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    if-eqz p5, :cond_2

    iget-object p1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogButton2:Landroid/widget/TextView;

    invoke-virtual {p1, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogButton2:Landroid/widget/TextView;

    invoke-virtual {p1, p5}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogButton2:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogButton2:Landroid/widget/TextView;

    new-instance p2, Lcom/android/camera/RotateDialogController$2;

    invoke-direct {p2, p0, p6}, Lcom/android/camera/RotateDialogController$2;-><init>(Lcom/android/camera/RotateDialogController;Ljava/lang/Runnable;)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogButtonLayout:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_2
    invoke-direct {p0}, Lcom/android/camera/RotateDialogController;->fadeInDialog()V

    return-void
.end method

.method public showWaitingDialog(Ljava/lang/String;)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/RotateDialogController;->resetRotateDialog()V

    iget-object v0, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/android/camera/RotateDialogController;->mRotateDialogSpinner:Landroid/widget/ProgressBar;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    invoke-direct {p0}, Lcom/android/camera/RotateDialogController;->fadeInDialog()V

    return-void
.end method
