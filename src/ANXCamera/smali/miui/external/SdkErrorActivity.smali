.class public Lmiui/external/SdkErrorActivity;
.super Landroid/app/Activity;
.source "SdkErrorActivity.java"

# interfaces
.implements Lmiui/external/SdkConstants;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/external/SdkErrorActivity$SdkDialogFragment;
    }
.end annotation


# instance fields
.field private mDismissListener:Landroid/content/DialogInterface$OnClickListener;

.field private mLanguage:Ljava/lang/String;

.field private mUpdateListener:Landroid/content/DialogInterface$OnClickListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    new-instance v0, Lmiui/external/SdkErrorActivity$1;

    invoke-direct {v0, p0}, Lmiui/external/SdkErrorActivity$1;-><init>(Lmiui/external/SdkErrorActivity;)V

    iput-object v0, p0, Lmiui/external/SdkErrorActivity;->mDismissListener:Landroid/content/DialogInterface$OnClickListener;

    new-instance v0, Lmiui/external/SdkErrorActivity$2;

    invoke-direct {v0, p0}, Lmiui/external/SdkErrorActivity$2;-><init>(Lmiui/external/SdkErrorActivity;)V

    iput-object v0, p0, Lmiui/external/SdkErrorActivity;->mUpdateListener:Landroid/content/DialogInterface$OnClickListener;

    return-void
.end method

.method static synthetic access$000(Lmiui/external/SdkErrorActivity;)Landroid/app/Dialog;
    .locals 0

    invoke-direct {p0}, Lmiui/external/SdkErrorActivity;->createUpdateDialog()Landroid/app/Dialog;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lmiui/external/SdkErrorActivity;)Z
    .locals 0

    invoke-direct {p0}, Lmiui/external/SdkErrorActivity;->updateSdk()Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lmiui/external/SdkErrorActivity;)Landroid/app/Dialog;
    .locals 0

    invoke-direct {p0}, Lmiui/external/SdkErrorActivity;->createUpdateSuccessfulDialog()Landroid/app/Dialog;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lmiui/external/SdkErrorActivity;)Landroid/app/Dialog;
    .locals 0

    invoke-direct {p0}, Lmiui/external/SdkErrorActivity;->createUpdateFailedDialog()Landroid/app/Dialog;

    move-result-object p0

    return-object p0
.end method

.method private createDoubleActionDialog(Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/Dialog;
    .locals 1

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const p2, 0x104000a

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/high16 p2, 0x1040000

    invoke-virtual {p1, p2, p4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const p2, 0x1080027

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method

.method private createGenericErrorDialog()Landroid/app/Dialog;
    .locals 3

    nop

    nop

    sget-object v0, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lmiui/external/SdkErrorActivity;->mLanguage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "MIUI SDK\u53d1\u751f\u9519\u8bef"

    const-string v1, "\u8bf7\u91cd\u65b0\u5b89\u88c5MIUI SDK\u518d\u8fd0\u884c\u672c\u7a0b\u5e8f\u3002"

    goto :goto_0

    :cond_0
    const-string v0, "MIUI SDK encounter errors"

    const-string v1, "Please re-install MIUI SDK and then re-run this application."

    :goto_0
    iget-object v2, p0, Lmiui/external/SdkErrorActivity;->mDismissListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-direct {p0, v0, v1, v2}, Lmiui/external/SdkErrorActivity;->createSingleActionDialog(Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/Dialog;

    move-result-object v0

    return-object v0
.end method

.method private createLowSdkVersionDialog()Landroid/app/Dialog;
    .locals 4

    nop

    nop

    invoke-direct {p0}, Lmiui/external/SdkErrorActivity;->supportUpdateSdk()Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lmiui/external/SdkErrorActivity;->mLanguage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "MIUI SDK\u7248\u672c\u8fc7\u4f4e"

    const-string v1, "\u8bf7\u5148\u5347\u7ea7MIUI SDK\u518d\u8fd0\u884c\u672c\u7a0b\u5e8f\u3002"

    goto :goto_0

    :cond_0
    const-string v0, "MIUI SDK too old"

    const-string v1, "Please upgrade MIUI SDK and then re-run this application."

    :goto_0
    iget-object v2, p0, Lmiui/external/SdkErrorActivity;->mDismissListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-direct {p0, v0, v1, v2}, Lmiui/external/SdkErrorActivity;->createSingleActionDialog(Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/Dialog;

    move-result-object v0

    return-object v0

    :cond_1
    sget-object v0, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lmiui/external/SdkErrorActivity;->mLanguage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "MIUI SDK\u7248\u672c\u8fc7\u4f4e"

    const-string v1, "\u8bf7\u5148\u5347\u7ea7MIUI SDK\u518d\u8fd0\u884c\u672c\u7a0b\u5e8f\u3002\u662f\u5426\u73b0\u5728\u5347\u7ea7\uff1f"

    goto :goto_1

    :cond_2
    const-string v0, "MIUI SDK too old"

    const-string v1, "Please upgrade MIUI SDK and then re-run this application. Upgrade now?"

    :goto_1
    iget-object v2, p0, Lmiui/external/SdkErrorActivity;->mUpdateListener:Landroid/content/DialogInterface$OnClickListener;

    iget-object v3, p0, Lmiui/external/SdkErrorActivity;->mDismissListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-direct {p0, v0, v1, v2, v3}, Lmiui/external/SdkErrorActivity;->createDoubleActionDialog(Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/Dialog;

    move-result-object v0

    return-object v0
.end method

.method private createNoSdkDialog()Landroid/app/Dialog;
    .locals 3

    nop

    nop

    sget-object v0, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lmiui/external/SdkErrorActivity;->mLanguage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "\u6ca1\u6709\u627e\u5230MIUI SDK"

    const-string v1, "\u8bf7\u5148\u5b89\u88c5MIUI SDK\u518d\u8fd0\u884c\u672c\u7a0b\u5e8f\u3002"

    goto :goto_0

    :cond_0
    const-string v0, "MIUI SDK not found"

    const-string v1, "Please install MIUI SDK and then re-run this application."

    :goto_0
    iget-object v2, p0, Lmiui/external/SdkErrorActivity;->mDismissListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-direct {p0, v0, v1, v2}, Lmiui/external/SdkErrorActivity;->createSingleActionDialog(Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/Dialog;

    move-result-object v0

    return-object v0
.end method

.method private createSingleActionDialog(Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/Dialog;
    .locals 1

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const p2, 0x104000a

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const p2, 0x1080027

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method

.method private createUpdateDialog()Landroid/app/Dialog;
    .locals 4

    nop

    nop

    sget-object v0, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lmiui/external/SdkErrorActivity;->mLanguage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "MIUI SDK\u6b63\u5728\u66f4\u65b0"

    const-string v1, "\u8bf7\u7a0d\u5019..."

    goto :goto_0

    :cond_0
    const-string v0, "MIUI SDK updating"

    const-string v1, "Please wait..."

    :goto_0
    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-static {p0, v0, v1, v2, v3}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)Landroid/app/ProgressDialog;

    move-result-object v0

    return-object v0
.end method

.method private createUpdateFailedDialog()Landroid/app/Dialog;
    .locals 3

    nop

    nop

    sget-object v0, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lmiui/external/SdkErrorActivity;->mLanguage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "MIUI SDK\u66f4\u65b0\u5931\u8d25"

    const-string v1, "\u8bf7\u7a0d\u540e\u91cd\u8bd5\u3002"

    goto :goto_0

    :cond_0
    const-string v0, "MIUI SDK update failed"

    const-string v1, "Please try it later."

    :goto_0
    iget-object v2, p0, Lmiui/external/SdkErrorActivity;->mDismissListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-direct {p0, v0, v1, v2}, Lmiui/external/SdkErrorActivity;->createSingleActionDialog(Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/Dialog;

    move-result-object v0

    return-object v0
.end method

.method private createUpdateSuccessfulDialog()Landroid/app/Dialog;
    .locals 3

    nop

    nop

    sget-object v0, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lmiui/external/SdkErrorActivity;->mLanguage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "MIUI SDK\u66f4\u65b0\u5b8c\u6210"

    const-string v1, "\u8bf7\u91cd\u65b0\u8fd0\u884c\u672c\u7a0b\u5e8f\u3002"

    goto :goto_0

    :cond_0
    const-string v0, "MIUI SDK updated"

    const-string v1, "Please re-run this application."

    :goto_0
    iget-object v2, p0, Lmiui/external/SdkErrorActivity;->mDismissListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-direct {p0, v0, v1, v2}, Lmiui/external/SdkErrorActivity;->createSingleActionDialog(Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/Dialog;

    move-result-object v0

    return-object v0
.end method

.method private supportUpdateSdk()Z
    .locals 6

    nop

    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lmiui/external/SdkEntranceHelper;->getSdkEntrance()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "supportUpdate"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/util/Map;

    aput-object v5, v4, v0

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v3, v2, v0

    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    nop

    move v0, v1

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return v0
.end method

.method private updateSdk()Z
    .locals 7

    nop

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-static {}, Lmiui/external/SdkEntranceHelper;->getSdkEntrance()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "update"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Ljava/util/Map;

    aput-object v6, v5, v0

    invoke-virtual {v2, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v3, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v1, v4, v0

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    nop

    move v0, v1

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    const v0, 0x1030055

    invoke-virtual {p0, v0}, Lmiui/external/SdkErrorActivity;->setTheme(I)V

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lmiui/external/SdkErrorActivity;->mLanguage:Ljava/lang/String;

    nop

    invoke-virtual {p0}, Lmiui/external/SdkErrorActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v0, "com.miui.sdk.error"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p1

    check-cast p1, Lmiui/external/SdkConstants$SdkError;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-nez p1, :cond_1

    sget-object p1, Lmiui/external/SdkConstants$SdkError;->GENERIC:Lmiui/external/SdkConstants$SdkError;

    :cond_1
    nop

    sget-object v0, Lmiui/external/SdkErrorActivity$3;->$SwitchMap$miui$external$SdkConstants$SdkError:[I

    invoke-virtual {p1}, Lmiui/external/SdkConstants$SdkError;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    invoke-direct {p0}, Lmiui/external/SdkErrorActivity;->createGenericErrorDialog()Landroid/app/Dialog;

    move-result-object p1

    goto :goto_1

    :pswitch_0
    invoke-direct {p0}, Lmiui/external/SdkErrorActivity;->createLowSdkVersionDialog()Landroid/app/Dialog;

    move-result-object p1

    goto :goto_1

    :pswitch_1
    invoke-direct {p0}, Lmiui/external/SdkErrorActivity;->createNoSdkDialog()Landroid/app/Dialog;

    move-result-object p1

    nop

    :goto_1
    new-instance v0, Lmiui/external/SdkErrorActivity$SdkDialogFragment;

    invoke-direct {v0, p0, p1}, Lmiui/external/SdkErrorActivity$SdkDialogFragment;-><init>(Lmiui/external/SdkErrorActivity;Landroid/app/Dialog;)V

    invoke-virtual {p0}, Lmiui/external/SdkErrorActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string v1, "SdkErrorPromptDialog"

    invoke-virtual {v0, p1, v1}, Lmiui/external/SdkErrorActivity$SdkDialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
