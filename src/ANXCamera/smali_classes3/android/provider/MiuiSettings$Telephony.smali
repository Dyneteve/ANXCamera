.class public Landroid/provider/MiuiSettings$Telephony;
.super Ljava/lang/Object;
.source "MiuiSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/MiuiSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Telephony"
.end annotation


# static fields
.field public static final ADD_ZERO_PREFIX_SWITCH:Ljava/lang/String; = "button_add_zero_prefix"

.field public static final AUTOIP_PREFIX:Ljava/lang/String; = "autoip_prefix"

.field public static final AUTOIP_SWITCH:Ljava/lang/String; = "button_autoip"

.field public static final AUTO_ANSWER_DEFAULT_DELAY_TIME:I = 0x3

.field public static final AUTO_ANSWER_DELAY_TIME:Ljava/lang/String; = "auto_answer_delay_time"

.field public static final AUTO_ANSWER_SCENARIO:Ljava/lang/String; = "auto_answer_scenario"

.field public static final AUTO_ANSWER_SCENARIO_ALWAYS:I = 0x0

.field public static final AUTO_ANSWER_SCENARIO_BLUETOOTH_ONLY:I = 0x2

.field public static final AUTO_ANSWER_SCENARIO_HEADSET_BLUETOOTH:I = 0x3

.field public static final AUTO_ANSWER_SCENARIO_HEADSET_ONLY:I = 0x1

.field public static final AUTO_COUNTRY_CODE:Ljava/lang/String; = "auto_country_code"

.field public static final AUTO_IP_SUPPORT_LOCAL_NUMBERS:Ljava/lang/String; = "button_auto_ip_support_local_numbers"

.field private static final CALL_WAITING_TONE:Ljava/lang/String; = "call_waiting_tone"

.field public static final CALL_WAITING_TONE_CONTINUOUSLY:I = 0x0

.field public static final CALL_WAITING_TONE_TWICE_AND_VIBRATE:I = 0x2

.field public static final CALL_WAITING_TONE_TWICE_ONLY:I = 0x1

.field public static final CONNECT_DISCONNECT_VIBRATE:Ljava/lang/String; = "button_connect_disconnect_vibrate"

.field public static final CONTACT_COUNTRYCODE:Ljava/lang/String; = "persist.radio.countrycode"

.field public static final CURRENT_AREACODE:Ljava/lang/String; = "current_areacode"

.field public static final ENABLED_ANTISPAM_STRANGE:Ljava/lang/String; = "button_antispam_strange"

.field public static final ENABLED_AUTO_ANSWER:Ljava/lang/String; = "button_auto_answer"

.field public static final ENABLED_AUTO_RECORD:Ljava/lang/String; = "button_auto_record_call"

.field public static final ENABLED_AUTO_REDIAL:Ljava/lang/String; = "button_auto_redial"

.field public static final ENABLED_HANDON_RINGER:Ljava/lang/String; = "button_handon_ringer"

.field public static final ENABLED_INCOMING_VIDEO_SHOW:Ljava/lang/String; = "button_incoming_video_show"

.field public static final ENABLED_RECORD_NOTIFY:Ljava/lang/String; = "button_call_recording_notification"

.field public static final ENABLED_TURN_OVER_MUTE:Ljava/lang/String; = "button_turn_over_mute"

.field public static final ENABLED_UNKNOWN_NUMBER_RECORD:Ljava/lang/String; = "button_record_unknown_number"

.field public static final ENABLED_VOICE_SERVICE:Ljava/lang/String; = "button_voice_service"

.field public static final ENABLED_YELLOWPAGE_RECORD:Ljava/lang/String; = "button_record_yellowpage_number"

.field public static final ENABLE_CRESCENDO_RINGER:Ljava/lang/String; = "button_crescendo_ringer"

.field public static final ENABLE_PROXIMITY_KEY:Ljava/lang/String; = "button_enable_proximity"

.field public static final ENABLE_REJECT_VIA_SMS_KEY:Ljava/lang/String; = "button_enable_reject_via_sms"

.field public static final ENABLE_TELOCATION:Ljava/lang/String; = "enable_telocation"

.field public static final IVR_MO_AREA_CODE_SLOT_1:Ljava/lang/String; = "ivr_mo_area_code_slot_1"

.field public static final IVR_MO_AREA_CODE_SLOT_2:Ljava/lang/String; = "ivr_mo_area_code_slot_2"

.field public static final IVR_TYPE_SLOT_1:Ljava/lang/String; = "ivr_type_slot_1"

.field public static final IVR_TYPE_SLOT_2:Ljava/lang/String; = "ivr_type_slot_2"

.field public static final MISSED_CALL_NOTIFY_TIMES:Ljava/lang/String; = "button_missed_call_notify_times"

.field public static final RECORD_SCENARIO:Ljava/lang/String; = "radio_record_scenario"

.field public static final RECORD_WHITE_LIST:Ljava/lang/String; = "record_white_list"

.field public static final REJECT_VIA_SMS_RESPONSE_1:Ljava/lang/String; = "reject_via_sms_response_1"

.field public static final REJECT_VIA_SMS_RESPONSE_2:Ljava/lang/String; = "reject_via_sms_response_2"

.field public static final REJECT_VIA_SMS_RESPONSE_3:Ljava/lang/String; = "reject_via_sms_response_3"

.field public static final REJECT_VIA_SMS_RESPONSE_4:Ljava/lang/String; = "reject_via_sms_response_4"

.field public static final VOLTE_FEATURE_DISABLED:Ljava/lang/String; = "volte_feature_disabled"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4776
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAutoAnswerCallDelayTime(Landroid/content/ContentResolver;)I
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5671
    const-string v0, "auto_answer_delay_time"

    const/4 v1, 0x3

    invoke-static {p0, v0, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getAutoAnswerCallScenario(Landroid/content/ContentResolver;)I
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5685
    const-string v0, "auto_answer_scenario"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getAutoIpPrefix(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "defaultPrefix"    # Ljava/lang/String;

    .line 5123
    const/4 v0, -0x1

    invoke-static {p0, p1, v0}, Landroid/provider/MiuiSettings$Telephony;->getAutoIpPrefix(Landroid/content/ContentResolver;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getAutoIpPrefix(Landroid/content/ContentResolver;Ljava/lang/String;I)Ljava/lang/String;
    .registers 5
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "defaultPrefix"    # Ljava/lang/String;
    .param p2, "slotId"    # I

    .line 5147
    const-string v0, "autoip_prefix"

    .line 5148
    .local v0, "prefix":Ljava/lang/String;
    if-ltz p2, :cond_13

    .line 5149
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 5151
    :cond_13
    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getCallWaitingTone(Landroid/content/Context;)I
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .line 5044
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "call_waiting_tone"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 5046
    .local v0, "index":I
    const-string/jumbo v1, "lithium"

    sget-object v2, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1a

    .line 5047
    const/4 v0, 0x0

    .line 5049
    :cond_1a
    return v0
.end method

.method public static getContactCountrycode(Landroid/content/ContentResolver;)Ljava/lang/String;
    .registers 2
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5103
    const-string/jumbo v0, "persist.radio.countrycode"

    invoke-static {p0, v0}, Landroid/provider/MiuiSettings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCurrentAeraCode(Landroid/content/ContentResolver;I)Ljava/lang/String;
    .registers 4
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "slotId"    # I

    .line 5073
    const-string v0, "current_areacode"

    .line 5074
    .local v0, "prefix":Ljava/lang/String;
    if-ltz p1, :cond_13

    .line 5075
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 5077
    :cond_13
    invoke-static {p0, v0}, Landroid/provider/MiuiSettings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getEnabledAutoRedial(Landroid/content/ContentResolver;)Z
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5290
    const-string v0, "button_auto_redial"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getEnabledVoiceService(Landroid/content/ContentResolver;)Z
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5647
    const-string v0, "button_voice_service"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getIVRParameterValue(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "key"    # Ljava/lang/String;

    .line 5455
    const-string v0, ""

    invoke-static {p0, p1, v0}, Landroid/provider/MiuiSettings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMissedCallNotifyTimes(Landroid/content/ContentResolver;)I
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5271
    const-string v0, "button_missed_call_notify_times"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getRecordScenario(Landroid/content/ContentResolver;)I
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5368
    const-string/jumbo v0, "radio_record_scenario"

    const-string v1, "0"

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static getRecordWhiteList(Landroid/content/ContentResolver;)Ljava/lang/String;
    .registers 2
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5388
    const-string/jumbo v0, "record_white_list"

    invoke-static {p0, v0}, Landroid/provider/MiuiSettings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRejectViaSmsResponse(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defValue"    # Ljava/lang/String;

    .line 5620
    invoke-static {p0, p1, p2}, Landroid/provider/MiuiSettings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getVibrateKey(Landroid/content/ContentResolver;)Ljava/lang/String;
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5252
    const-string v0, "button_connect_disconnect_vibrate"

    const-string v1, "100"

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isAntispamStangerEnabled(Landroid/content/ContentResolver;)Z
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5233
    const-string v0, "button_antispam_strange"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isAutoAddZeroPrefix(Landroid/content/ContentResolver;I)Z
    .registers 4
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "slotId"    # I

    .line 5525
    const-string v0, "button_add_zero_prefix"

    .line 5526
    .local v0, "prefix":Ljava/lang/String;
    if-ltz p1, :cond_13

    .line 5527
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 5529
    :cond_13
    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method public static isAutoAnswerCall(Landroid/content/ContentResolver;)Z
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5655
    const-string v0, "button_auto_answer"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isAutoCountryCodeEnable(Landroid/content/ContentResolver;)Z
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5482
    const-string v0, "auto_country_code"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isAutoIpEnable(Landroid/content/ContentResolver;I)Z
    .registers 4
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "slotId"    # I

    .line 5499
    const-string v0, "button_autoip"

    .line 5500
    .local v0, "prefix":Ljava/lang/String;
    if-ltz p1, :cond_13

    .line 5501
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 5503
    :cond_13
    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method public static isAutoIpSupportLocalNum(Landroid/content/ContentResolver;I)Z
    .registers 4
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "slotId"    # I

    .line 5552
    const-string v0, "button_auto_ip_support_local_numbers"

    .line 5553
    .local v0, "prefix":Ljava/lang/String;
    if-ltz p1, :cond_13

    .line 5554
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 5556
    :cond_13
    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method public static isAutoRecordEnabled(Landroid/content/ContentResolver;)Z
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5348
    const-string v0, "button_auto_record_call"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isCrescendoRingerEnable(Landroid/content/ContentResolver;)Z
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5214
    const-string v0, "button_crescendo_ringer"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isHandonRingerEnabled(Landroid/content/ContentResolver;)Z
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5195
    const-string v0, "button_handon_ringer"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isIncomingVideoShowEnabled(Landroid/content/ContentResolver;)Z
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5309
    const-string v0, "button_incoming_video_show"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isProximitySensorEnable(Landroid/content/ContentResolver;)Z
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5578
    const-string v0, "button_enable_proximity"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isRecordNotificationEnabled(Landroid/content/ContentResolver;)Z
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5328
    const-string v0, "button_call_recording_notification"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isRejectViaSmsEnable(Landroid/content/ContentResolver;)Z
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5595
    const-string v0, "button_enable_reject_via_sms"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isTelocationEnable(Landroid/content/ContentResolver;)Z
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5463
    const-string v0, "enable_telocation"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isTurnOverMuteEnabled(Landroid/content/ContentResolver;)Z
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5176
    const-string v0, "button_turn_over_mute"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isUnknownNumberRecordEnabled(Landroid/content/ContentResolver;)Z
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5408
    const-string v0, "button_record_unknown_number"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isYellowpageRecordEnabled(Landroid/content/ContentResolver;)Z
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;

    .line 5427
    const-string v0, "button_record_yellowpage_number"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static setAntispamStangerEnabled(Landroid/content/ContentResolver;Z)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "enabled"    # Z

    .line 5243
    const-string v0, "button_antispam_strange"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 5244
    return-void
.end method

.method public static setAutoAddZeroPrefixEnable(Landroid/content/ContentResolver;ZI)V
    .registers 5
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "enable"    # Z
    .param p2, "slotId"    # I

    .line 5539
    const-string v0, "button_add_zero_prefix"

    .line 5540
    .local v0, "prefix":Ljava/lang/String;
    if-ltz p2, :cond_13

    .line 5541
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 5543
    :cond_13
    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 5544
    return-void
.end method

.method public static setAutoAnswerCall(Landroid/content/ContentResolver;Z)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "enable"    # Z

    .line 5664
    const-string v0, "button_auto_answer"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 5665
    return-void
.end method

.method public static setAutoAnswerCallDelayTime(Landroid/content/ContentResolver;I)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "value"    # I

    .line 5678
    const-string v0, "auto_answer_delay_time"

    invoke-static {p0, v0, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 5679
    return-void
.end method

.method public static setAutoAnswerCallScenario(Landroid/content/ContentResolver;I)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "value"    # I

    .line 5700
    const-string v0, "auto_answer_scenario"

    invoke-static {p0, v0, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 5701
    return-void
.end method

.method public static setAutoCountryCodeEnable(Landroid/content/ContentResolver;Z)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "enable"    # Z

    .line 5491
    const-string v0, "auto_country_code"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 5492
    return-void
.end method

.method public static setAutoIpEnable(Landroid/content/ContentResolver;ZI)V
    .registers 5
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "enable"    # Z
    .param p2, "slotId"    # I

    .line 5512
    const-string v0, "button_autoip"

    .line 5513
    .local v0, "prefix":Ljava/lang/String;
    if-ltz p2, :cond_13

    .line 5514
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 5516
    :cond_13
    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 5517
    return-void
.end method

.method public static setAutoIpPrefix(Landroid/content/ContentResolver;Ljava/lang/String;)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "IpPrefix"    # Ljava/lang/String;

    .line 5134
    const/4 v0, -0x1

    invoke-static {p0, p1, v0}, Landroid/provider/MiuiSettings$Telephony;->setAutoIpPrefix(Landroid/content/ContentResolver;Ljava/lang/String;I)V

    .line 5135
    return-void
.end method

.method public static setAutoIpPrefix(Landroid/content/ContentResolver;Ljava/lang/String;I)V
    .registers 5
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "IpPrefix"    # Ljava/lang/String;
    .param p2, "slotId"    # I

    .line 5163
    const-string v0, "autoip_prefix"

    .line 5164
    .local v0, "prefix":Ljava/lang/String;
    if-ltz p2, :cond_13

    .line 5165
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 5167
    :cond_13
    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 5168
    return-void
.end method

.method public static setAutoIpSupportLocalNumEnable(Landroid/content/ContentResolver;ZI)V
    .registers 5
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "enable"    # Z
    .param p2, "slotId"    # I

    .line 5566
    const-string v0, "button_auto_ip_support_local_numbers"

    .line 5567
    .local v0, "prefix":Ljava/lang/String;
    if-ltz p2, :cond_13

    .line 5568
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 5570
    :cond_13
    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 5571
    return-void
.end method

.method public static setAutoRecordEnabled(Landroid/content/ContentResolver;Z)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "isEnabledAutoRecord"    # Z

    .line 5359
    const-string v0, "button_auto_record_call"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 5360
    return-void
.end method

.method public static setAutoRedialEnabled(Landroid/content/ContentResolver;Z)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "isEnabledRedial"    # Z

    .line 5300
    const-string v0, "button_auto_redial"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 5301
    return-void
.end method

.method public static setCallWaitingTone(Landroid/content/Context;I)V
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "callWaitingToneType"    # I

    .line 5062
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "call_waiting_tone"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 5064
    return-void
.end method

.method public static setContactCountrycode(Landroid/content/ContentResolver;Ljava/lang/String;)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "countryCode"    # Ljava/lang/String;

    .line 5114
    const-string/jumbo v0, "persist.radio.countrycode"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 5115
    return-void
.end method

.method public static setCrescendoRingerEnable(Landroid/content/ContentResolver;Z)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "enabled"    # Z

    .line 5224
    const-string v0, "button_crescendo_ringer"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 5225
    return-void
.end method

.method public static setCurrentAeraCode(Landroid/content/ContentResolver;Ljava/lang/String;I)V
    .registers 5
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "aeraCode"    # Ljava/lang/String;
    .param p2, "slotId"    # I

    .line 5088
    const-string v0, "current_areacode"

    .line 5089
    .local v0, "prefix":Ljava/lang/String;
    if-ltz p2, :cond_13

    .line 5090
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 5092
    :cond_13
    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 5093
    return-void
.end method

.method public static setHandonRingerEnabled(Landroid/content/ContentResolver;Z)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "enabled"    # Z

    .line 5205
    const-string v0, "button_handon_ringer"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 5206
    return-void
.end method

.method public static setIVRParameterValue(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 5446
    invoke-static {p0, p1, p2}, Landroid/provider/MiuiSettings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 5447
    return-void
.end method

.method public static setIncomingVideoShowEnabled(Landroid/content/ContentResolver;Z)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "isVideoShowEnabled"    # Z

    .line 5319
    const-string v0, "button_incoming_video_show"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 5320
    return-void
.end method

.method public static setMissedCallNotifyTimes(Landroid/content/ContentResolver;I)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "notifyTimes"    # I

    .line 5281
    const-string v0, "button_missed_call_notify_times"

    invoke-static {p0, v0, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 5282
    return-void
.end method

.method public static setProximitySensorEnable(Landroid/content/ContentResolver;Z)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "enable"    # Z

    .line 5587
    const-string v0, "button_enable_proximity"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 5588
    return-void
.end method

.method public static setRecordNotificationEnabled(Landroid/content/ContentResolver;Z)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "isEnabledRecordNotify"    # Z

    .line 5339
    const-string v0, "button_call_recording_notification"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 5340
    return-void
.end method

.method public static setRecordScenario(Landroid/content/ContentResolver;I)V
    .registers 4
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "recordScenario"    # I

    .line 5378
    const-string/jumbo v0, "radio_record_scenario"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Landroid/provider/MiuiSettings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 5379
    return-void
.end method

.method public static setRecordWhiteList(Landroid/content/ContentResolver;Ljava/lang/String;)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "recordWhiteList"    # Ljava/lang/String;

    .line 5399
    const-string/jumbo v0, "record_white_list"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 5400
    return-void
.end method

.method public static setRejectViaSmsEnable(Landroid/content/ContentResolver;Z)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "enable"    # Z

    .line 5604
    const-string v0, "button_enable_reject_via_sms"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 5605
    return-void
.end method

.method public static setRejectViaSmsRespone(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 5630
    invoke-static {p0, p1, p2}, Landroid/provider/MiuiSettings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 5631
    return-void
.end method

.method public static setTelocationEnable(Landroid/content/ContentResolver;Z)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "enable"    # Z

    .line 5472
    const-string v0, "enable_telocation"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 5473
    return-void
.end method

.method public static setTurnOverMuteEnabled(Landroid/content/ContentResolver;Z)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "enable"    # Z

    .line 5186
    const-string v0, "button_turn_over_mute"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 5187
    return-void
.end method

.method public static setUnknownNumberRecordEnabled(Landroid/content/ContentResolver;Z)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "enabledUnknownNumberRecord"    # Z

    .line 5418
    const-string v0, "button_record_unknown_number"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 5419
    return-void
.end method

.method public static setVibrateKey(Landroid/content/ContentResolver;Ljava/lang/String;)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "vibrateKey"    # Ljava/lang/String;

    .line 5262
    const-string v0, "button_connect_disconnect_vibrate"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 5263
    return-void
.end method

.method public static setVoiceServiceEnabled(Landroid/content/ContentResolver;Z)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "isEnabledVoiceService"    # Z

    .line 5639
    const-string v0, "button_voice_service"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 5640
    return-void
.end method

.method public static setYellowpageRecordEnabled(Landroid/content/ContentResolver;Z)V
    .registers 3
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "enabledYellowpageRecord"    # Z

    .line 5437
    const-string v0, "button_record_yellowpage_number"

    invoke-static {p0, v0, p1}, Landroid/provider/MiuiSettings$System;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 5438
    return-void
.end method
