.class public final Landroid/provider/MiuiSettings$XSpace;
.super Ljava/lang/Object;
.source "MiuiSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/MiuiSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "XSpace"
.end annotation


# static fields
.field public static final CROSS_PROFILE_SECURE_SETTINGS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEFAULT_SETTING_ALWAYS_ASK:I = 0x0

.field public static final DEFAULT_SETTING_DEFAULT:I = 0x0

.field public static final DEFAULT_SETTING_MAIN:I = 0x1

.field public static final DEFAULT_SETTING_XSPACE:I = 0x2

.field public static final KEY_DEFAULT_GUIDE_TIMES:Ljava/lang/String; = "key_default_guide_times"

.field public static final KEY_WEIBO_OPEN:Ljava/lang/String; = "com.sina.weibo.SplashActivity"

.field public static final KEY_WEIBO_SEND:Ljava/lang/String; = "com.sina.weibo.composerinde.ComposerDispatchActivity"

.field public static final KEY_WEIBO_SHARE:Ljava/lang/String; = "com.sina.weibo.SSOActivity"

.field public static final KEY_WEIXIN_OPEN:Ljava/lang/String; = "com.tencent.mm.ui.LauncherUI"

.field public static final KEY_WEIXIN_PAY:Ljava/lang/String; = "com.tencent.mm.plugin.base.stub.WXPayEntryActivity"

.field public static final KEY_WEIXIN_SEND_TO_CIRCLE:Ljava/lang/String; = "com.tencent.mm.ui.tools.ShareToTimeLineUI"

.field public static final KEY_WEIXIN_SEND_TO_FRIEND:Ljava/lang/String; = "com.tencent.mm.ui.tools.ShareImgUI"

.field public static final KEY_WEIXIN_SHARE:Ljava/lang/String; = "com.tencent.mm.plugin.base.stub.WXEntryActivity"

.field public static final KEY_XSPACE_BOOT_GUIDE_TIMES:Ljava/lang/String; = "key_xspace_boot_guide_times"

.field public static final KEY_XSPACE_COMPETE_GUIDE_TIMES:Ljava/lang/String; = "key_xspace_compete_guide_times"

.field public static final KEY_XSPACE_QQ_LOGIN:Ljava/lang/String; = "com.tencent.open.agent.AgentActivity"

.field public static final KEY_XSPACE_QQ_OPEN:Ljava/lang/String; = "com.tencent.mobileqq.activity.SplashActivity"

.field public static final KEY_XSPACE_QQ_SEND:Ljava/lang/String; = "com.tencent.mobileqq.activity.qqSendActivity"

.field public static final KEY_XSPACE_QQ_SEND_TO_FRIEND:Ljava/lang/String; = "com.tencent.mobileqq.activity.JumpActivity"

.field public static final KEY_XSPACE_QQ_SEND_TO_PC:Ljava/lang/String; = "com.tencent.mobileqq.activity.qfileJumpActivity"

.field public static final PARAM_INTENT_KEY_COMPETE_XSPACE_GUIDE:Ljava/lang/String; = "param_intent_key_compete_xspace_guide"

.field public static final PARAM_INTENT_KEY_DEFAULT:Ljava/lang/String; = "param_intent_key_default"

.field public static final PARAM_INTENT_KEY_DEFAULT_ASKTYPE:Ljava/lang/String; = "param_intent_key_default_asktype"

.field public static final PARAM_INTENT_KEY_HAS_EXTRA:Ljava/lang/String; = "param_intent_key_has_extra"

.field public static final PARAM_INTENT_VALUE_COMPETE_BOOT_XSPACE_GUIDE:Ljava/lang/String; = "param_intent_value_compete_boot_xspace_guide"

.field public static final PARAM_INTENT_VALUE_COMPETE_INSTALL_XSPACE_GUIDE:Ljava/lang/String; = "param_intent_value_compete_install_xspace_guide"

.field public static final PARAM_INTENT_VALUE_COMPETE_TIMING_XSPACE_GUIDE:Ljava/lang/String; = "param_intent_value_compete_timing_xspace_guide"

.field public static final PARAM_INTENT_VALUE_DEFAULT:Ljava/lang/String; = "param_intent_value_default"

.field public static final PARAM_INTENT_VALUE_HAS_EXTRA:Ljava/lang/String; = "param_intent_value_has_extra"

.field public static final PARAM_INTENT_VALUE_UNINSTALL_XSPACE_USER:Ljava/lang/String; = "param_intent_value_uninstall_xspace_user"

.field public static final PREKEY_XSPACE_QQ_LOGIN:Ljava/lang/String; = "qq_login"

.field public static final PREKEY_XSPACE_QQ_OPEN:Ljava/lang/String; = "qq_open"

.field public static final PREKEY_XSPACE_QQ_SEND:Ljava/lang/String; = "qq_send"

.field public static final PREKEY_XSPACE_WEIBO_OPEN:Ljava/lang/String; = "weibo_open"

.field public static final PREKEY_XSPACE_WEIBO_SEND:Ljava/lang/String; = "weibo_send"

.field public static final PREKEY_XSPACE_WEIXIN_OPEN:Ljava/lang/String; = "weixin_open"

.field public static final PREKEY_XSPACE_WEIXIN_PAY:Ljava/lang/String; = "weixin_pay"

.field public static final PREKEY_XSPACE_WEIXIN_SHARE:Ljava/lang/String; = "weixin_share"

.field public static final QQ_PACKAGE_NAME:Ljava/lang/String; = "com.tencent.mobileqq"

.field public static final WEIBO_PACKAGE_NAME:Ljava/lang/String; = "com.sina.weibo"

.field public static final WEIXIN_PACKAGE_NAME:Ljava/lang/String; = "com.tencent.mm"

.field public static sCompeteXSpaceApps:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final sSupportDefaultSettingApps:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 4591
    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    sput-object v0, Landroid/provider/MiuiSettings$XSpace;->CROSS_PROFILE_SECURE_SETTINGS:Ljava/util/Set;

    .line 4594
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->CROSS_PROFILE_SECURE_SETTINGS:Ljava/util/Set;

    const-string/jumbo v1, "lock_screen_allow_private_notifications"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 4595
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->CROSS_PROFILE_SECURE_SETTINGS:Ljava/util/Set;

    const-string/jumbo v1, "lock_screen_show_notifications"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 4650
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Landroid/provider/MiuiSettings$XSpace;->sSupportDefaultSettingApps:Ljava/util/ArrayList;

    .line 4653
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sSupportDefaultSettingApps:Ljava/util/ArrayList;

    const-string v1, "com.tencent.mm.plugin.base.stub.WXPayEntryActivity"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4654
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sSupportDefaultSettingApps:Ljava/util/ArrayList;

    const-string v1, "com.tencent.mm.ui.tools.ShareImgUI"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4655
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sSupportDefaultSettingApps:Ljava/util/ArrayList;

    const-string v1, "com.tencent.mm.ui.tools.ShareToTimeLineUI"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4656
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sSupportDefaultSettingApps:Ljava/util/ArrayList;

    const-string v1, "com.tencent.mm.plugin.base.stub.WXEntryActivity"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4657
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sSupportDefaultSettingApps:Ljava/util/ArrayList;

    const-string v1, "com.tencent.mm.ui.LauncherUI"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4658
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sSupportDefaultSettingApps:Ljava/util/ArrayList;

    const-string v1, "com.sina.weibo.composerinde.ComposerDispatchActivity"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4659
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sSupportDefaultSettingApps:Ljava/util/ArrayList;

    const-string v1, "com.sina.weibo.SSOActivity"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4660
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sSupportDefaultSettingApps:Ljava/util/ArrayList;

    const-string v1, "com.sina.weibo.SplashActivity"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4661
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sSupportDefaultSettingApps:Ljava/util/ArrayList;

    const-string v1, "com.tencent.mobileqq.activity.JumpActivity"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4662
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sSupportDefaultSettingApps:Ljava/util/ArrayList;

    const-string v1, "com.tencent.mobileqq.activity.qfileJumpActivity"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4663
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sSupportDefaultSettingApps:Ljava/util/ArrayList;

    const-string v1, "com.tencent.open.agent.AgentActivity"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4664
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sSupportDefaultSettingApps:Ljava/util/ArrayList;

    const-string v1, "com.tencent.mobileqq.activity.SplashActivity"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4757
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Landroid/provider/MiuiSettings$XSpace;->sCompeteXSpaceApps:Ljava/util/ArrayList;

    .line 4760
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sCompeteXSpaceApps:Ljava/util/ArrayList;

    const-string v1, "com.excelliance.multiaccount"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4761
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sCompeteXSpaceApps:Ljava/util/ArrayList;

    const-string v1, "com.lbe.parallel.intl"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4762
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sCompeteXSpaceApps:Ljava/util/ArrayList;

    const-string v1, "com.parallel.space.lite"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4763
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sCompeteXSpaceApps:Ljava/util/ArrayList;

    const-string v1, "info.cloneapp.mochat.in.goast"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4764
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sCompeteXSpaceApps:Ljava/util/ArrayList;

    const-string v1, "com.jiubang.commerce.gomultiple"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4765
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sCompeteXSpaceApps:Ljava/util/ArrayList;

    const-string v1, "com.applisto.appcloner"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4766
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sCompeteXSpaceApps:Ljava/util/ArrayList;

    const-string v1, "com.trigtech.privateme"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4767
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sCompeteXSpaceApps:Ljava/util/ArrayList;

    const-string v1, "com.polestar.multiaccount"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4768
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sCompeteXSpaceApps:Ljava/util/ArrayList;

    const-string v1, "com.vaibhav.accountsmanager"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4769
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sCompeteXSpaceApps:Ljava/util/ArrayList;

    const-string v1, "com.in.parallel.accounts"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4770
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sCompeteXSpaceApps:Ljava/util/ArrayList;

    const-string v1, "com.lbe.parallel"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4771
    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->sCompeteXSpaceApps:Ljava/util/ArrayList;

    const-string v1, "com.excelliance.dualaid"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4772
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4583
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static belongToCrossXSpaceSecureSettings(Ljava/lang/String;I)Z
    .registers 3
    .param p0, "setting"    # Ljava/lang/String;
    .param p1, "userId"    # I

    .line 4599
    invoke-static {p1}, Lmiui/securityspace/XSpaceUserHandle;->isXSpaceUserId(I)Z

    move-result v0

    if-eqz v0, :cond_10

    sget-object v0, Landroid/provider/MiuiSettings$XSpace;->CROSS_PROFILE_SECURE_SETTINGS:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    return v0
.end method

.method public static getAskType(Landroid/content/Context;Ljava/lang/String;)I
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "appType"    # Ljava/lang/String;

    .line 4690
    const/4 v0, 0x0

    :try_start_1
    const-string v1, "com.tencent.mm.ui.tools.ShareImgUI"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_11

    const-string v1, "com.tencent.mm.ui.tools.ShareToTimeLineUI"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 4691
    :cond_11
    const-string v1, "com.tencent.mm.plugin.base.stub.WXEntryActivity"

    move-object p1, v1

    .line 4693
    :cond_14
    const-string v1, "com.sina.weibo.composerinde.ComposerDispatchActivity"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 4694
    const-string v1, "com.sina.weibo.SSOActivity"

    move-object p1, v1

    .line 4696
    :cond_1f
    const-string v1, "com.tencent.mobileqq.activity.JumpActivity"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2f

    const-string v1, "com.tencent.mobileqq.activity.qfileJumpActivity"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_32

    .line 4697
    :cond_2f
    const-string v1, "com.tencent.mobileqq.activity.qqSendActivity"

    move-object p1, v1

    .line 4699
    :cond_32
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {v1, p1, v0}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1
    :try_end_3a
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_1 .. :try_end_3a} :catch_3b

    return v1

    .line 4700
    :catch_3b
    move-exception v1

    .line 4702
    return v0
.end method

.method public static getGuideNotificationTimes(Landroid/content/Context;Ljava/lang/String;)I
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;

    .line 4777
    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {v1, p1, v0}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1
    :try_end_9
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_1 .. :try_end_9} :catch_a

    return v1

    .line 4778
    :catch_a
    move-exception v1

    .line 4780
    return v0
.end method

.method public static getSettingAppType(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "preKey"    # Ljava/lang/String;

    .line 4707
    const-string v0, ""

    .line 4708
    .local v0, "askType":Ljava/lang/String;
    const-string/jumbo v1, "weixin_pay"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 4709
    const-string v0, "com.tencent.mm.plugin.base.stub.WXPayEntryActivity"

    goto :goto_61

    .line 4710
    :cond_e
    const-string/jumbo v1, "weixin_share"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 4711
    const-string v0, "com.tencent.mm.plugin.base.stub.WXEntryActivity"

    goto :goto_61

    .line 4712
    :cond_1a
    const-string/jumbo v1, "weixin_open"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_26

    .line 4713
    const-string v0, "com.tencent.mm.ui.LauncherUI"

    goto :goto_61

    .line 4714
    :cond_26
    const-string/jumbo v1, "weibo_send"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_32

    .line 4715
    const-string v0, "com.sina.weibo.SSOActivity"

    goto :goto_61

    .line 4716
    :cond_32
    const-string/jumbo v1, "weibo_open"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3e

    .line 4717
    const-string v0, "com.sina.weibo.SplashActivity"

    goto :goto_61

    .line 4718
    :cond_3e
    const-string/jumbo v1, "qq_send"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4a

    .line 4719
    const-string v0, "com.tencent.mobileqq.activity.qqSendActivity"

    goto :goto_61

    .line 4720
    :cond_4a
    const-string/jumbo v1, "qq_login"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_56

    .line 4721
    const-string v0, "com.tencent.open.agent.AgentActivity"

    goto :goto_61

    .line 4722
    :cond_56
    const-string/jumbo v1, "qq_open"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_61

    .line 4723
    const-string v0, "com.tencent.mobileqq.activity.SplashActivity"

    .line 4725
    :cond_61
    :goto_61
    return-object v0
.end method

.method public static resetDefaultSetting(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "pkgName"    # Ljava/lang/String;

    .line 4730
    const-string v0, "com.tencent.mm"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_19

    .line 4731
    const-string v0, "com.tencent.mm.plugin.base.stub.WXPayEntryActivity"

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$XSpace;->setAskType(Landroid/content/Context;Ljava/lang/String;I)V

    .line 4732
    const-string v0, "com.tencent.mm.plugin.base.stub.WXEntryActivity"

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$XSpace;->setAskType(Landroid/content/Context;Ljava/lang/String;I)V

    .line 4733
    const-string v0, "com.tencent.mm.ui.LauncherUI"

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$XSpace;->setAskType(Landroid/content/Context;Ljava/lang/String;I)V

    goto :goto_43

    .line 4734
    :cond_19
    const-string v0, "com.sina.weibo"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 4735
    const-string v0, "com.sina.weibo.SSOActivity"

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$XSpace;->setAskType(Landroid/content/Context;Ljava/lang/String;I)V

    .line 4736
    const-string v0, "com.sina.weibo.SplashActivity"

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$XSpace;->setAskType(Landroid/content/Context;Ljava/lang/String;I)V

    goto :goto_43

    .line 4737
    :cond_2c
    const-string v0, "com.tencent.mobileqq"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_43

    .line 4738
    const-string v0, "com.tencent.mobileqq.activity.qqSendActivity"

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$XSpace;->setAskType(Landroid/content/Context;Ljava/lang/String;I)V

    .line 4739
    const-string v0, "com.tencent.open.agent.AgentActivity"

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$XSpace;->setAskType(Landroid/content/Context;Ljava/lang/String;I)V

    .line 4740
    const-string v0, "com.tencent.mobileqq.activity.SplashActivity"

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$XSpace;->setAskType(Landroid/content/Context;Ljava/lang/String;I)V

    .line 4742
    :cond_43
    :goto_43
    return-void
.end method

.method public static setAskType(Landroid/content/Context;Ljava/lang/String;I)V
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "appType"    # Ljava/lang/String;
    .param p2, "askType"    # I

    .line 4675
    const-string v0, "com.tencent.mm.ui.tools.ShareImgUI"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    const-string v0, "com.tencent.mm.ui.tools.ShareToTimeLineUI"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 4676
    :cond_10
    const-string p1, "com.tencent.mm.plugin.base.stub.WXEntryActivity"

    .line 4678
    :cond_12
    const-string v0, "com.sina.weibo.composerinde.ComposerDispatchActivity"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 4679
    const-string p1, "com.sina.weibo.SSOActivity"

    .line 4681
    :cond_1c
    const-string v0, "com.tencent.mobileqq.activity.JumpActivity"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c

    const-string v0, "com.tencent.mobileqq.activity.qfileJumpActivity"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 4682
    :cond_2c
    const-string p1, "com.tencent.mobileqq.activity.qqSendActivity"

    .line 4684
    :cond_2e
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, p2, v1}, Landroid/provider/Settings$Secure;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    .line 4685
    return-void
.end method

.method public static setGuideNotificationTimes(Landroid/content/Context;Ljava/lang/String;I)V
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "times"    # I

    .line 4785
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, p2, v1}, Landroid/provider/Settings$Secure;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    .line 4786
    return-void
.end method
