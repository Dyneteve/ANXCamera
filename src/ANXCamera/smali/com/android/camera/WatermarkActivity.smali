.class public Lcom/android/camera/WatermarkActivity;
.super Lcom/android/camera/BasePreferenceActivity;
.source "WatermarkActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/WatermarkActivity$AllCapTransformationMethod;,
        Lcom/android/camera/WatermarkActivity$UiHandler;,
        Lcom/android/camera/WatermarkActivity$BackgroundHandler;,
        Lcom/android/camera/WatermarkActivity$TextJudge;
    }
.end annotation


# static fields
.field private static final MSG_BG_FILTER_WORDS:I = 0x1

.field private static final MSG_MT_UI:I = 0x2

.field private static final PROP_NAME_MAX:I = 0xe

.field public static final TAG:Ljava/lang/String; = "WatermarkActivity"


# instance fields
.field private mAlertDialog:Landroid/app/AlertDialog;

.field protected mBackgroundHandler:Lcom/android/camera/WatermarkActivity$BackgroundHandler;

.field private mDefindWatermark:Ljava/lang/String;

.field private mEtUserDefineWords:Landroid/widget/EditText;

.field protected mPreferenceGroup:Landroid/preference/PreferenceScreen;

.field private mThreadBg:Landroid/os/HandlerThread;

.field protected mUiHandler:Lcom/android/camera/WatermarkActivity$UiHandler;

.field private mUserDefineWatermark:Landroid/preference/Preference;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/WatermarkActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/WatermarkActivity;->onSave()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/camera/WatermarkActivity;)Landroid/app/AlertDialog;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/WatermarkActivity;->mAlertDialog:Landroid/app/AlertDialog;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/camera/WatermarkActivity;)Landroid/widget/EditText;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/WatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/WatermarkActivity;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/WatermarkActivity;->mDefindWatermark:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/camera/WatermarkActivity;)Landroid/os/HandlerThread;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/WatermarkActivity;->mThreadBg:Landroid/os/HandlerThread;

    return-object p0
.end method

.method static synthetic access$502(Lcom/android/camera/WatermarkActivity;Landroid/os/HandlerThread;)Landroid/os/HandlerThread;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/WatermarkActivity;->mThreadBg:Landroid/os/HandlerThread;

    return-object p1
.end method

.method static synthetic access$600(Lcom/android/camera/WatermarkActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/WatermarkActivity;->release()V

    return-void
.end method

.method static synthetic access$700(Lcom/android/camera/WatermarkActivity;Landroid/os/Message;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/WatermarkActivity;->doInBackground(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic access$800(Lcom/android/camera/WatermarkActivity;Landroid/os/Message;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/WatermarkActivity;->doInMainThread(Landroid/os/Message;)V

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

.method private checkContentlength(Ljava/lang/CharSequence;)Z
    .locals 2

    nop

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Lcom/android/camera/WatermarkActivity;->getTextLength(Ljava/lang/CharSequence;)Lcom/android/camera/WatermarkActivity$TextJudge;

    move-result-object p1

    iget-boolean v0, p1, Lcom/android/camera/WatermarkActivity$TextJudge;->isOverLimit:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/android/camera/WatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    iget-object p1, p1, Lcom/android/camera/WatermarkActivity$TextJudge;->legalString:Ljava/lang/String;

    invoke-virtual {v1, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const p1, 0x7f090133

    invoke-static {p0, p1}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;I)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

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
    iget-object p1, p0, Lcom/android/camera/WatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/camera/WatermarkActivity;->checkContentlegal(Ljava/lang/CharSequence;)Ljava/lang/String;

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

    iget-object p1, p0, Lcom/android/camera/WatermarkActivity;->mUiHandler:Lcom/android/camera/WatermarkActivity$UiHandler;

    invoke-virtual {p1, v0}, Lcom/android/camera/WatermarkActivity$UiHandler;->sendMessage(Landroid/os/Message;)Z

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

    if-eqz v0, :cond_3

    invoke-direct {p0}, Lcom/android/camera/WatermarkActivity;->getCustomWords()Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermark()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p1}, Lcom/android/camera/CameraSettings;->setCustomWatermark(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/android/camera/WatermarkActivity;->mDefindWatermark:Ljava/lang/String;

    invoke-static {}, Lcom/android/camera/Util;->generateWatermark2File()Landroid/graphics/Bitmap;

    invoke-static {}, Lcom/android/camera/statistic/CameraStatUtil;->trackUserDefineWatermark()V

    :cond_1
    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mUserDefineWatermark:Landroid/preference/Preference;

    check-cast v0, Lcom/android/camera/ui/ValuePreference;

    const v2, 0x7f09038f

    invoke-virtual {p0, v2}, Lcom/android/camera/WatermarkActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string p1, ""

    :cond_2
    invoke-virtual {v0, p1}, Lcom/android/camera/ui/ValuePreference;->setValue(Ljava/lang/String;)V

    const p1, 0x7f090131

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_3
    const v0, 0x7f090132

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v1

    invoke-virtual {p0, v0, v2}, Lcom/android/camera/WatermarkActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    nop

    :goto_0
    return-void
.end method

.method private filterPreference()V
    .locals 2

    invoke-static {}, Lcom/mi/config/b;->hL()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_time_watermark_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/WatermarkActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedDualCameraWaterMark()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_dualcamera_watermark_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/WatermarkActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "user_define_watermark_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/WatermarkActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedDualCameraWaterMark()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gv()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "user_define_watermark_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/WatermarkActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    :cond_2
    return-void
.end method

.method private getCustomWords()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    const v1, 0x7f09038f

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/WatermarkActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/WatermarkActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private initializeActivity()V
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera/WatermarkActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/WatermarkActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->removeAll()V

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/WatermarkActivity;->getPreferenceXml()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/WatermarkActivity;->addPreferencesFromResource(I)V

    invoke-virtual {p0}, Lcom/android/camera/WatermarkActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/WatermarkActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    if-nez v0, :cond_1

    const-string v0, "WatermarkActivity"

    const-string v1, "fail to init PreferenceGroup"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/WatermarkActivity;->finish()V

    :cond_1
    invoke-direct {p0}, Lcom/android/camera/WatermarkActivity;->filterPreference()V

    invoke-direct {p0}, Lcom/android/camera/WatermarkActivity;->registerListener()V

    invoke-direct {p0}, Lcom/android/camera/WatermarkActivity;->updateEntries()V

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    iget-object v1, p0, Lcom/android/camera/WatermarkActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/WatermarkActivity;->updatePreferences(Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;)V

    return-void
.end method

.method private onSave()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mBackgroundHandler:Lcom/android/camera/WatermarkActivity$BackgroundHandler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/WatermarkActivity$BackgroundHandler;->sendEmptyMessage(I)Z

    return-void
.end method

.method private registerListener()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {p0, v0, p0}, Lcom/android/camera/WatermarkActivity;->registerListener(Landroid/preference/PreferenceGroup;Landroid/preference/Preference$OnPreferenceChangeListener;)V

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_time_watermark_key"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_dualcamera_watermark_key"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    :cond_1
    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "user_define_watermark_key"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/WatermarkActivity;->mUserDefineWatermark:Landroid/preference/Preference;

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mUserDefineWatermark:Landroid/preference/Preference;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mUserDefineWatermark:Landroid/preference/Preference;

    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    :cond_2
    return-void
.end method

.method private release()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mBackgroundHandler:Lcom/android/camera/WatermarkActivity$BackgroundHandler;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mBackgroundHandler:Lcom/android/camera/WatermarkActivity$BackgroundHandler;

    invoke-virtual {v0, v1}, Lcom/android/camera/WatermarkActivity$BackgroundHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mUiHandler:Lcom/android/camera/WatermarkActivity$UiHandler;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mUiHandler:Lcom/android/camera/WatermarkActivity$UiHandler;

    invoke-virtual {v0, v1}, Lcom/android/camera/WatermarkActivity$UiHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    :cond_1
    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mThreadBg:Landroid/os/HandlerThread;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mThreadBg:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    :cond_2
    return-void
.end method

.method private showDialog()V
    .locals 5

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mAlertDialog:Landroid/app/AlertDialog;

    if-nez v0, :cond_0

    new-instance v0, Landroid/app/AlertDialog$Builder;

    const v1, 0x7f0d0005

    invoke-direct {v0, p0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f040007

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0e001a

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/android/camera/WatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/android/camera/WatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    invoke-virtual {v2, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object v2, p0, Lcom/android/camera/WatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    new-instance v4, Lcom/android/camera/WatermarkActivity$AllCapTransformationMethod;

    invoke-direct {v4, v3}, Lcom/android/camera/WatermarkActivity$AllCapTransformationMethod;-><init>(Lcom/android/camera/WatermarkActivity$1;)V

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    const v2, 0x7f09012d

    invoke-virtual {p0, v2}, Lcom/android/camera/WatermarkActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    const v1, 0x7f090383

    invoke-virtual {p0, v1}, Lcom/android/camera/WatermarkActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const v1, 0x7f090382

    invoke-virtual {p0, v1}, Lcom/android/camera/WatermarkActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/android/camera/WatermarkActivity$1;

    invoke-direct {v2, p0}, Lcom/android/camera/WatermarkActivity$1;-><init>(Lcom/android/camera/WatermarkActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/WatermarkActivity;->mAlertDialog:Landroid/app/AlertDialog;

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mAlertDialog:Landroid/app/AlertDialog;

    new-instance v1, Lcom/android/camera/WatermarkActivity$2;

    invoke-direct {v1, p0}, Lcom/android/camera/WatermarkActivity$2;-><init>(Lcom/android/camera/WatermarkActivity;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mAlertDialog:Landroid/app/AlertDialog;

    new-instance v1, Lcom/android/camera/WatermarkActivity$3;

    invoke-direct {v1, p0}, Lcom/android/camera/WatermarkActivity$3;-><init>(Lcom/android/camera/WatermarkActivity;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mAlertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mAlertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mAlertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :goto_0
    return-void
.end method

.method private updateEntries()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string v1, "pref_dualcamera_watermark_key"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    if-eqz v0, :cond_0

    nop

    invoke-virtual {p0}, Lcom/android/camera/WatermarkActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f100015

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    invoke-static {v1}, Lcom/mi/config/b;->r(Z)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    nop

    invoke-virtual {p0}, Lcom/android/camera/WatermarkActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    invoke-static {v1}, Lcom/mi/config/b;->r(Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mUserDefineWatermark:Landroid/preference/Preference;

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermark()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/WatermarkActivity;->mDefindWatermark:Ljava/lang/String;

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mUserDefineWatermark:Landroid/preference/Preference;

    check-cast v0, Lcom/android/camera/ui/ValuePreference;

    iget-object v1, p0, Lcom/android/camera/WatermarkActivity;->mDefindWatermark:Ljava/lang/String;

    const v2, 0x7f09038f

    invoke-virtual {p0, v2}, Lcom/android/camera/WatermarkActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, ""

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/android/camera/WatermarkActivity;->mDefindWatermark:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ValuePreference;->setValue(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mUserDefineWatermark:Landroid/preference/Preference;

    check-cast v0, Lcom/android/camera/ui/ValuePreference;

    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraWaterMarkOpen()Z

    move-result v1

    if-nez v1, :cond_3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCameraWaterMarkOpen()Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    goto :goto_2

    :cond_3
    :goto_1
    const/4 v1, 0x1

    :goto_2
    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ValuePreference;->setEnabled(Z)V

    :cond_4
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1

    iget-object p1, p0, Lcom/android/camera/WatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setSelection(I)V

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method protected getPreferenceXml()I
    .locals 1

    const v0, 0x7f070001

    return v0
.end method

.method public getTextLength(Ljava/lang/CharSequence;)Lcom/android/camera/WatermarkActivity$TextJudge;
    .locals 17

    new-instance v0, Lcom/android/camera/WatermarkActivity$TextJudge;

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/android/camera/WatermarkActivity$TextJudge;-><init>(Lcom/android/camera/WatermarkActivity;)V

    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x20

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    nop

    invoke-interface/range {p1 .. p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    nop

    nop

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    const/4 v7, -0x1

    move v8, v7

    move-wide v6, v5

    move v5, v4

    :goto_0
    const/4 v11, 0x1

    if-ge v5, v2, :cond_8

    move-object/from16 v12, p1

    invoke-interface {v12, v5}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v13

    invoke-static {v13}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v13

    const-string v14, "[^\\x00-\\xff]"

    invoke-virtual {v13, v14}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_0

    nop

    move v11, v4

    goto :goto_1

    :cond_0
    nop

    :goto_1
    const-wide v14, 0x3ff4a3d70a3d70a4L    # 1.29

    if-gez v8, :cond_1

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    :cond_1
    if-ne v11, v8, :cond_2

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    :cond_2
    if-eq v11, v8, :cond_4

    if-nez v8, :cond_3

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v9

    int-to-double v9, v9

    goto :goto_2

    :cond_3
    nop

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v9

    int-to-double v9, v9

    div-double/2addr v9, v14

    :goto_2
    add-double/2addr v6, v9

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v9

    invoke-virtual {v1, v4, v9}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_4
    :goto_3
    add-int/lit8 v9, v2, -0x1

    if-ne v5, v9, :cond_6

    if-nez v8, :cond_5

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v8

    int-to-double v8, v8

    goto :goto_4

    :cond_5
    nop

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v8

    int-to-double v8, v8

    div-double/2addr v8, v14

    :goto_4
    add-double/2addr v6, v8

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v8

    invoke-virtual {v1, v4, v8}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_6
    nop

    const-wide/high16 v8, 0x402c000000000000L    # 14.0

    cmpg-double v8, v6, v8

    if-gtz v8, :cond_7

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_7
    add-int/lit8 v5, v5, 0x1

    move v8, v11

    goto :goto_0

    :cond_8
    const-wide/high16 v8, 0x402c000000000000L    # 14.0

    cmpl-double v1, v6, v8

    if-lez v1, :cond_9

    iput-boolean v11, v0, Lcom/android/camera/WatermarkActivity$TextJudge;->isOverLimit:Z

    goto :goto_5

    :cond_9
    iput-boolean v4, v0, Lcom/android/camera/WatermarkActivity$TextJudge;->isOverLimit:Z

    :goto_5
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/camera/WatermarkActivity$TextJudge;->legalString:Ljava/lang/String;

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/android/camera/WatermarkActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "StartActivityWhenLocked"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/WatermarkActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/high16 v0, 0x80000

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/WatermarkActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, ":miui:starting_window_label"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getCharSequenceExtra(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/WatermarkActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object p1

    if-eqz p1, :cond_1

    const v0, 0x7f090381

    invoke-virtual {p1, v0}, Landroid/app/ActionBar;->setTitle(I)V

    :cond_1
    invoke-direct {p0}, Lcom/android/camera/WatermarkActivity;->initializeActivity()V

    return-void
.end method

.method protected onDestroy()V
    .locals 0

    invoke-super {p0}, Lcom/android/camera/BasePreferenceActivity;->onDestroy()V

    invoke-direct {p0}, Lcom/android/camera/WatermarkActivity;->release()V

    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 5

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const v2, 0x67b0c582

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eq v1, v2, :cond_1

    const v2, 0x6871f874

    if-eq v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const-string/jumbo v1, "user_define_watermark_key"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    move v0, v4

    goto :goto_1

    :cond_1
    const-string v1, "pref_dualcamera_watermark_key"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    move v0, v3

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, -0x1

    :goto_1
    packed-switch v0, :pswitch_data_0

    goto :goto_3

    :pswitch_0
    return v3

    :pswitch_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gv()Z

    move-result v0

    if-eqz v0, :cond_4

    move-object v0, p2

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mUserDefineWatermark:Landroid/preference/Preference;

    invoke-virtual {v0, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    goto :goto_2

    :cond_3
    iget-object v0, p0, Lcom/android/camera/WatermarkActivity;->mUserDefineWatermark:Landroid/preference/Preference;

    invoke-virtual {v0, v3}, Landroid/preference/Preference;->setEnabled(Z)V

    :goto_2
    nop

    :cond_4
    :goto_3
    invoke-super {p0, p1, p2}, Lcom/android/camera/BasePreferenceActivity;->onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z

    return v4

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 1

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    const-string/jumbo v0, "user_define_watermark_key"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/android/camera/WatermarkActivity;->showDialog()V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/WatermarkActivity;->checkContentlength(Ljava/lang/CharSequence;)Z

    return-void
.end method

.method protected updateConflictPreference(Landroid/preference/Preference;)V
    .locals 0

    return-void
.end method
