.class public Lcom/android/camera/UserDefineWatermarkActivity;
.super Lmiui/app/Activity;
.source "UserDefineWatermarkActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/UserDefineWatermarkActivity$AllCapTransformationMethod;,
        Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;,
        Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;
    }
.end annotation


# static fields
.field private static final MSG_BG_FILTER_WORDS:I = 0x1

.field private static final MSG_MT_UI:I = 0x2

.field private static final PROP_NAME_MAX:I = 0xe

.field private static final TAG:Ljava/lang/String; = "UserDefineWatermarkAtivity"


# instance fields
.field protected mBackgroundHandler:Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;

.field private mEtUserDefineWords:Landroid/widget/EditText;

.field private mFlagBeyondLimit:Z

.field private mTextLast:Ljava/lang/String;

.field private mThreadBg:Landroid/os/HandlerThread;

.field protected mUiHandler:Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;

.field private mUserDefineWords:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lmiui/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/UserDefineWatermarkActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->onCancel()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/camera/UserDefineWatermarkActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->onSave()V

    return-void
.end method

.method static synthetic access$300(Lcom/android/camera/UserDefineWatermarkActivity;Landroid/os/Message;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/UserDefineWatermarkActivity;->doInBackground(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic access$400(Lcom/android/camera/UserDefineWatermarkActivity;Landroid/os/Message;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/UserDefineWatermarkActivity;->doInMainThread(Landroid/os/Message;)V

    return-void
.end method

.method private checkContentlegal(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/android/camera/sensitive/SensitiveFilter;->getInstance()Lcom/android/camera/sensitive/SensitiveFilter;

    move-result-object v0

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/android/camera/sensitive/SensitiveFilter;->getSensitiveWord(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private checkContentlength()Z
    .locals 4

    nop

    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mUserDefineWords:Ljava/lang/String;

    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mUserDefineWords:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/android/camera/UserDefineWatermarkActivity;->getTextLength(Ljava/lang/CharSequence;)D

    move-result-wide v0

    const-wide/high16 v2, 0x402c000000000000L    # 14.0

    cmpl-double v0, v0, v2

    const/4 v1, 0x1

    if-lez v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mFlagBeyondLimit:Z

    iget-object v1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mTextLast:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mTextLast:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSelection(I)V

    const v1, 0x7f090138

    invoke-static {p0, v1}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;I)V

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    return v0
.end method

.method private doInBackground(Landroid/os/Message;)V
    .locals 3

    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mUserDefineWords:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/android/camera/UserDefineWatermarkActivity;->checkContentlegal(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x2

    iput v1, v0, Landroid/os/Message;->what:I

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "LEGAL_WORD"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mUiHandler:Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;

    invoke-virtual {p1, v0}, Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;->sendMessage(Landroid/os/Message;)Z

    nop

    :goto_0
    return-void
.end method

.method private doInMainThread(Landroid/os/Message;)V
    .locals 3

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "LEGAL_WORD"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->getCustomWords()Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermark()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p1}, Lcom/android/camera/CameraSettings;->setCustomWatermark(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/camera/Util;->generateWatermark2File()Landroid/graphics/Bitmap;

    :cond_1
    const p1, 0x7f090136

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    invoke-virtual {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->finish()V

    goto :goto_0

    :cond_2
    const v0, 0x7f090137

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v1

    invoke-virtual {p0, v0, v2}, Lcom/android/camera/UserDefineWatermarkActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    nop

    :goto_0
    return-void
.end method

.method private getCustomWords()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    const v1, 0x7f090384

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private initTitle()V
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/16 v1, 0x10

    invoke-virtual {v0, v1, v1}, Landroid/app/ActionBar;->setDisplayOptions(II)V

    invoke-static {}, Lcom/android/camera/GeneralUtils;->editModeTitleLayout()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setCustomView(I)V

    invoke-virtual {v0}, Landroid/app/ActionBar;->getCustomView()Landroid/view/View;

    move-result-object v0

    const v1, 0x1020016

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v1, 0x1020019

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const/high16 v2, 0x7f020000

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setBackgroundResource(I)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v3, 0x1040000

    invoke-virtual {p0, v3}, Lcom/android/camera/UserDefineWatermarkActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v3, Lcom/android/camera/UserDefineWatermarkActivity$1;

    invoke-direct {v3, p0}, Lcom/android/camera/UserDefineWatermarkActivity$1;-><init>(Lcom/android/camera/UserDefineWatermarkActivity;)V

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x102001a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f020001

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackgroundResource(I)V

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v1, 0x104000a

    invoke-virtual {p0, v1}, Lcom/android/camera/UserDefineWatermarkActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v1, Lcom/android/camera/UserDefineWatermarkActivity$2;

    invoke-direct {v1, p0}, Lcom/android/camera/UserDefineWatermarkActivity$2;-><init>(Lcom/android/camera/UserDefineWatermarkActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090133

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/UserDefineWatermarkActivity;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private onCancel()V
    .locals 0

    invoke-virtual {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->finish()V

    return-void
.end method

.method private onSave()V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->checkContentlength()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mBackgroundHandler:Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;->sendEmptyMessage(I)Z

    :cond_0
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    iget-boolean p2, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mFlagBeyondLimit:Z

    if-nez p2, :cond_0

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mTextLast:Ljava/lang/String;

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mFlagBeyondLimit:Z

    return-void
.end method

.method public getTextLength(Ljava/lang/CharSequence;)D
    .locals 13

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    nop

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    nop

    nop

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    const/4 v5, -0x1

    move v6, v5

    move-wide v4, v3

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_7

    invoke-interface {p1, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v7

    const-string v8, "[^\\x00-\\xff]"

    invoke-virtual {v7, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    nop

    move v8, v2

    goto :goto_1

    :cond_0
    nop

    const/4 v8, 0x1

    :goto_1
    const-wide v9, 0x3ff4a3d70a3d70a4L    # 1.29

    if-gez v6, :cond_1

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    :cond_1
    if-ne v8, v6, :cond_2

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    :cond_2
    if-eq v8, v6, :cond_4

    if-nez v6, :cond_3

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v11

    int-to-double v11, v11

    goto :goto_2

    :cond_3
    nop

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v11

    int-to-double v11, v11

    div-double/2addr v11, v9

    :goto_2
    add-double/2addr v4, v11

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v11

    invoke-virtual {v0, v2, v11}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_4
    :goto_3
    add-int/lit8 v11, v1, -0x1

    if-ne v3, v11, :cond_6

    if-nez v6, :cond_5

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    int-to-double v9, v6

    goto :goto_4

    :cond_5
    nop

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    int-to-double v11, v6

    div-double v9, v11, v9

    :goto_4
    add-double/2addr v4, v9

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    invoke-virtual {v0, v2, v6}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_6
    nop

    add-int/lit8 v3, v3, 0x1

    move v6, v8

    goto :goto_0

    :cond_7
    return-wide v4
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lmiui/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f04003f

    invoke-virtual {p0, p1}, Lcom/android/camera/UserDefineWatermarkActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "StartActivityWhenLocked"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/high16 v0, 0x80000

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    :cond_0
    const p1, 0x7f0d00e5

    invoke-virtual {p0, p1}, Lcom/android/camera/UserDefineWatermarkActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    iget-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    invoke-virtual {p1, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    new-instance v0, Lcom/android/camera/UserDefineWatermarkActivity$AllCapTransformationMethod;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/camera/UserDefineWatermarkActivity$AllCapTransformationMethod;-><init>(Lcom/android/camera/UserDefineWatermarkActivity;Lcom/android/camera/UserDefineWatermarkActivity$1;)V

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermark()Ljava/lang/String;

    move-result-object p1

    const v0, 0x7f090384

    invoke-virtual {p0, v0}, Lcom/android/camera/UserDefineWatermarkActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermarkDefault()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    const-string v0, ""

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    iget-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setSelection(I)V

    :cond_2
    new-instance p1, Landroid/os/HandlerThread;

    const-string v0, "UserDefineWatermarkAtivity"

    const/16 v1, 0xa

    invoke-direct {p1, v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    iput-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mThreadBg:Landroid/os/HandlerThread;

    iget-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mThreadBg:Landroid/os/HandlerThread;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->start()V

    new-instance p1, Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;

    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mThreadBg:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;-><init>(Lcom/android/camera/UserDefineWatermarkActivity;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mBackgroundHandler:Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;

    new-instance p1, Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;-><init>(Lcom/android/camera/UserDefineWatermarkActivity;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mUiHandler:Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;

    return-void
.end method

.method protected onDestroy()V
    .locals 2

    invoke-super {p0}, Lmiui/app/Activity;->onDestroy()V

    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mBackgroundHandler:Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mBackgroundHandler:Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;

    invoke-virtual {v0, v1}, Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mUiHandler:Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mUiHandler:Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;

    invoke-virtual {v0, v1}, Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    :cond_1
    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mThreadBg:Landroid/os/HandlerThread;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mThreadBg:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    :cond_2
    return-void
.end method

.method protected onPause()V
    .locals 0

    invoke-super {p0}, Lmiui/app/Activity;->onPause()V

    return-void
.end method

.method protected onResume()V
    .locals 0

    invoke-super {p0}, Lmiui/app/Activity;->onResume()V

    invoke-virtual {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->showSoftInputFromWindow()V

    return-void
.end method

.method protected onStart()V
    .locals 0

    invoke-super {p0}, Lmiui/app/Activity;->onStart()V

    invoke-direct {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->initTitle()V

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->checkContentlength()Z

    return-void
.end method

.method public showSoftInputFromWindow()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setFocusable(Z)V

    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    invoke-virtual {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    return-void
.end method
