package android.provider;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.ExtraNotificationManager;
import android.app.Fragment;
import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Configuration;
import android.content.res.MiuiConfiguration;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Environment;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.os.SystemProperties;
import android.os.UserHandle;
import android.provider.Settings.SettingNotFoundException;
import android.text.TextUtils;
import android.util.ArraySet;
import android.util.Base64;
import android.util.Log;
import android.util.Slog;
import com.mi.config.d;
import com.ss.android.ttve.common.TEDefine;
import java.io.Closeable;
import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;
import miui.hareware.display.DisplayFeatureManager;
import miui.mqsas.sdk.MQSEventManagerDelegate;
import miui.os.Build;
import miui.security.SecurityManager;
import miui.securityspace.XSpaceUserHandle;
import miui.telephony.SubscriptionManager;
import miui.telephony.TelephonyManager;
import miui.util.FeatureParser;
import miui.util.HardwareInfo;
import miui.util.IOUtils;
import miui.util.LockPatternUtilsWrapper;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class MiuiSettings {
    public static final String ACTION_ACCOUNT_LIST = "android.settings.ACCOUNT_LIST";
    public static String APP_LOCK_USE_FACE_UNLOCK_STATE = "com_miui_applicatinlock_use_face_unlock_state";
    public static String APP_LOCK_USE_FINGERPRINT_STATE = "com_miui_applicatinlock_use_fingerprint_state";
    public static final Set<String> CROSS_PROFILE_SETTINGS = new ArraySet();
    private static final String DISCOVER_AUTO_UPDATE_ENABLED = "com.xiaomi.discover.auto_update_enabled";
    private static final String DISCOVER_METERED_SYSTEM_UPDATE_CONFIRM_NEEDED_BY_REGION = "com.xiaomi.discover.metered_system_update_confirm_needed_by_region";
    private static final String DISCOVER_METERED_UPDATE_ANSWERED = "com.xiaomi.discover.metered_update_answered";
    private static final String DISCOVER_METERED_UPDATE_CONFIRM_NEEDED_BY_REGION = "com.xiaomi.discover.metered_update_confirm_needed_by_region";
    private static final String DOWNLOADMANAGER_DEBUG_DP_PATH = "debug_dp_path";
    private static final String DOWNLOADMANAGER_DEBUG_SWITCH = "debug_switch";
    private static final String DOWNLOADMANAGER_XUNLEI_USAGE_PERMISSION = "xunlei_usage_permission";
    private static final String DOWNLOADMANAGER_XUNLEI_VIP_TOKEN = "vip_token";
    private static final String DOWNLOADMANAGER__XUNLEI_TOKEN = "xunlei_token";
    private static final String LAST_SYNC_TIME_ANTISPAM = "setting_last_time_alert_antispam";
    private static final String LAST_SYNC_TIME_BROWSER = "setting_last_time_alert_com.miui.browser";
    private static final String LAST_SYNC_TIME_CALENDER = "setting_last_time_alert_com.android.calendar";
    private static final String LAST_SYNC_TIME_CALL_LOG = "setting_last_time_alert_call_log";
    private static final String LAST_SYNC_TIME_CONTACT = "setting_last_time_alert_com.android.contacts";
    private static final String LAST_SYNC_TIME_GALLERY = "setting_last_time_alert_com.miui.gallery.cloud.provider";
    private static final String LAST_SYNC_TIME_MUSIC = "setting_last_time_alert_com.miui.player";
    private static final String LAST_SYNC_TIME_NOTES = "setting_last_time_alert_notes";
    private static final String LAST_SYNC_TIME_RECORDER = "setting_last_time_alert_records";
    private static final String LAST_SYNC_TIME_SMS = "setting_last_time_alert_sms";
    private static final String LAST_SYNC_TIME_WIFI = "setting_last_time_alert_wifi";
    private static final String MARKET_CHOOSER_RECOMMENDED_ENABLE = "com.xiaomi.market.enable_app_chooser_recommend";
    private static final String MARKET_ENABLE_SHARE_PROGRESS_STATUS = "com.xiaomi.market.enable_share_progress_status";
    private static final String MARKET_ENABLE_SHARE_PROGRESS_STATUS_INTERNATIONAL = "com.xiaomi.discover.enable_share_progress_status";
    private static final String MIAPPS_HOME_USER_GUIDE_SHOWN_CONTROL = "com.xiaomi.mipicks.need_show_user_guide_status";
    private static final String MICLOUD_GDPR_PERMISSION_GRANTED = "micloud_gdpr_permission_granted";
    private static final String MICLOUD_NETWORK_AVAILABILITY_KEY = "micloud_network_availability";
    private static final String MIPICKS_ENABLE_SHARE_PROGRESS_STATUS = "com.xiaomi.mipicks.enable_share_progress_status";
    private static final String MIUI_HOME_ENABLE_SHARE_PROGRESS_STATUS = "com.miui.home.enable_share_progress_status";
    private static final String OPEN_PDC_HOST_KEY = "com.xiaomi.opensdk.pdc.host";
    private static final String PREF_KEY_WALLPAPER_SCREEN_SPAN = "pref_key_wallpaper_screen_span";
    public static final String PRIVACY_PASSWORD_BIND_XIAOMI_ACCOUNT = "privacy_password_bind_xiaomi_account";
    public static final String PRIVACY_PASSWORD_FINGERPRINT_AUTHENTICATION_NUM = "privacy_password_finger_authentication_num";
    private static final String SCREEN_RECORDER_SHOW_TOUCHES = "show_touches";
    private static final String SETTING_MICLOUD_ACCOUNTNAME = "micloud_accountname";
    private static final String SETTING_MICLOUD_ACCOUNTNAME_V2 = "micloud_accountname_v2";
    private static final String SETTING_MICLOUD_HOSTS = "micloud_hosts";
    private static final String SETTING_MICLOUD_HOSTS_V2 = "micloud_hosts_v2";
    private static final String SETTING_MICLOUD_UPDATEHOSTS_THIRD_PARTY = "micloud_updatehosts_third_party";
    public static final String SETTING_UPDATABLE_SYSTEM_APP_COUNT = "updatable_system_app_count";
    private static final String SYNC_SETTING_ANTISPAM_0 = "sync_for_sim_com.xiaomi-antispam-0";
    private static final String SYNC_SETTING_ANTISPAM_1 = "sync_for_sim_com.xiaomi-antispam-1";
    private static final String SYNC_SETTING_BROWSER_0 = "sync_for_sim_com.xiaomi-com.miui.browser-0";
    private static final String SYNC_SETTING_BROWSER_1 = "sync_for_sim_com.xiaomi-com.miui.browser-1";
    private static final String SYNC_SETTING_CALENDER_0 = "sync_for_sim_com.xiaomi-com.android.calendar-0";
    private static final String SYNC_SETTING_CALENDER_1 = "sync_for_sim_com.xiaomi-com.android.calendar-1";
    private static final String SYNC_SETTING_CALL_LOG_0 = "sync_for_sim_com.xiaomi-call_log-0";
    private static final String SYNC_SETTING_CALL_LOG_1 = "sync_for_sim_com.xiaomi-call_log-1";
    private static final String SYNC_SETTING_CONTACT_0 = "sync_for_sim_com.xiaomi-com.android.contacts-0";
    private static final String SYNC_SETTING_CONTACT_1 = "sync_for_sim_com.xiaomi-com.android.contacts-1";
    private static final String SYNC_SETTING_GALLERY_0 = "sync_for_sim_com.xiaomi-com.miui.gallery.cloud.provider-0";
    private static final String SYNC_SETTING_GALLERY_1 = "sync_for_sim_com.xiaomi-com.miui.gallery.cloud.provider-1";
    private static final String SYNC_SETTING_MUSIC_0 = "sync_for_sim_com.xiaomi-com.miui.player-0";
    private static final String SYNC_SETTING_MUSIC_1 = "sync_for_sim_com.xiaomi-com.miui.player-1";
    private static final String SYNC_SETTING_NOTES_0 = "sync_for_sim_com.xiaomi-notes-0";
    private static final String SYNC_SETTING_NOTES_1 = "sync_for_sim_com.xiaomi-notes-1";
    private static final String SYNC_SETTING_RECORDER_0 = "sync_for_sim_com.xiaomi-records-0";
    private static final String SYNC_SETTING_RECORDER_1 = "sync_for_sim_com.xiaomi-records-1";
    private static final String SYNC_SETTING_SMS_0 = "sync_for_sim_com.xiaomi-sms-0";
    private static final String SYNC_SETTING_SMS_1 = "sync_for_sim_com.xiaomi-sms-1";
    private static final String SYNC_SETTING_WIFI_0 = "sync_for_sim_com.xiaomi-wifi-0";
    private static final String SYNC_SETTING_WIFI_1 = "sync_for_sim_com.xiaomi-wifi-1";

    public static final class Ad {
        private static final String AAID = "ad_aaid";
        public static final String ACTION_AAID_RESET = "miui.intent.action.ad.AAID_RESET";
        private static final int BIT_FLAG_PERSONALIZED_AD_DIALOG_PROMOTED = 2;
        private static final int BIT_FLAG_PERSONALIZED_AD_ENABLE = 1;
        public static final String EXTRA_KEY_NEW_AAID = "new_aaid";
        public static final String EXTRA_KEY_OLD_AAID = "old_aaid";
        private static final String PERSONALIZED_AD_SETTINGS = "personalized_ad_enabled";
        private static final String PERSONALIZED_AD_TIME = "personalized_ad_time";
        private static final String TAG = "Ad";

        public static String getAaid(ContentResolver contentResolver) {
            return android.provider.Settings.Global.getString(contentResolver, AAID);
        }

        public static long getPersonalizedAdEnableTime(ContentResolver contentResolver) throws SecurityException {
            long j = android.provider.Settings.Global.getLong(contentResolver, PERSONALIZED_AD_TIME, 0);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("getPersonalizedAdEnableTime: ");
            sb.append(j);
            Slog.i(str, sb.toString());
            return j;
        }

        private static int getPersonizedAdSettings(ContentResolver contentResolver) {
            return android.provider.Settings.Global.getInt(contentResolver, PERSONALIZED_AD_SETTINGS, 1);
        }

        public static boolean isPersonalizedAdDialogPromoted(ContentResolver contentResolver) {
            int personizedAdSettings = getPersonizedAdSettings(contentResolver);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("isPersonalizedAdDialogPromoted getAdSettings: ");
            sb.append(personizedAdSettings);
            Slog.i(str, sb.toString());
            return (personizedAdSettings & 2) != 0;
        }

        public static boolean isPersonalizedAdEnabled(ContentResolver contentResolver) {
            int personizedAdSettings = getPersonizedAdSettings(contentResolver);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("isPersonalizedAdEnabled getAdSettings: ");
            sb.append(personizedAdSettings);
            Slog.i(str, sb.toString());
            return (personizedAdSettings & 1) != 0;
        }

        public static void resetAaid(Context context) throws SecurityException {
            String aaid = getAaid(context.getContentResolver());
            if (TextUtils.isEmpty(aaid)) {
                aaid = "";
            }
            String uuid = UUID.randomUUID().toString();
            android.provider.Settings.Global.putString(context.getContentResolver(), AAID, uuid);
            Intent intent = new Intent(ACTION_AAID_RESET);
            intent.putExtra(EXTRA_KEY_OLD_AAID, aaid);
            intent.putExtra(EXTRA_KEY_NEW_AAID, uuid);
            context.sendBroadcast(intent);
        }

        public static void setPersonalizedAdDialogPromoted(ContentResolver contentResolver, boolean z) throws SecurityException {
            int personizedAdSettings = getPersonizedAdSettings(contentResolver);
            int i = z ? personizedAdSettings | 2 : personizedAdSettings & -3;
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("setPersonalizedAdDialogPromoted: ");
            sb.append(z);
            sb.append(", oldAdSettings: ");
            sb.append(personizedAdSettings);
            sb.append(", newAdSettings: ");
            sb.append(i);
            Slog.i(str, sb.toString());
            setPersonizedAdSettings(contentResolver, i);
        }

        public static void setPersonalizedAdEnable(ContentResolver contentResolver, boolean z) throws SecurityException {
            int personizedAdSettings = getPersonizedAdSettings(contentResolver);
            int i = z ? personizedAdSettings | 1 : personizedAdSettings & -2;
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("setPersonalizedAdEnable: ");
            sb.append(z);
            sb.append(", oldAdSettings: ");
            sb.append(personizedAdSettings);
            sb.append(", newAdSettigns: ");
            sb.append(i);
            Slog.i(str, sb.toString());
            setPersonizedAdSettings(contentResolver, i);
        }

        public static void setPersonalizedAdEnableTime(ContentResolver contentResolver, long j) throws SecurityException {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("setPersonalizedAdEnableTime: ");
            sb.append(j);
            Slog.i(str, sb.toString());
            android.provider.Settings.Global.putLong(contentResolver, PERSONALIZED_AD_TIME, j);
        }

        private static void setPersonizedAdSettings(ContentResolver contentResolver, int i) {
            android.provider.Settings.Global.putInt(contentResolver, PERSONALIZED_AD_SETTINGS, i);
        }
    }

    public static final class AntiSpam {
        public static String ACTION_SOURCE_CALL = "action_source_call";
        public static String ACTION_SOURCE_OTHER = "action_source_other";
        public static String ACTION_SOURCE_SMS = "action_source_sms";
        public static final int AGENT = 2;
        public static final String AGENT_NUM_STATE = "agent_num_state";
        public static final String AGENT_NUM_STATE_SIM_2 = "agent_num_state_sim_2";
        public static final String ANTISPAM_ENABLE_FOR_SIM_1 = "antispam_enable_for_sim_1";
        public static final String ANTISPAM_ENABLE_FOR_SIM_2 = "antispam_enable_for_sim_2";
        public static final String ANTISPAM_MODE = "antispam_mode_enable";
        public static final String ANTISPAM_PKG = "com.miui.securitycenter";
        public static final String ANTISPAM_SETTINGS_SHARED_FOR_SIMS = "antispam_settings_shared_for_sims";
        public static final String AUTO_TIMER_OF_QM_ENABLE = "auto_timer_of_qm_enable";
        public static final String CALL_ACT_OF_REPEATED = "call_act_of_repeated";
        private static final String CALL_ACT_OF_VIP = "call_act_of_vip";
        public static final String CALL_TRANSFER_NUM_STATE = "call_transfer_num_state";
        public static final String CONTACT_CALL_MODE = "contact_call_mode";
        public static final String CONTACT_SMS_MODE = "contact_sms_mode";
        public static final int DISABLE = 0;
        public static final String EMPTY_CALL_MODE = "empty_call_mode";
        public static final int ENABLE = 1;
        private static final String END_TIME_OF_QM = "end_time_of_qm";
        public static final int FRAUD = 1;
        public static final String FRAUD_NUM_STATE = "fraud_num_state";
        public static final String FRAUD_NUM_STATE_SIM_2 = "fraud_num_state_sim_2";
        public static final int GUIDE_TYPE_DECLINE = 1;
        public static final int GUIDE_TYPE_END_CALL = 2;
        public static final int GUIDE_TYPE_MANUAL_MARK = 3;
        public static final int HARASS = 10;
        public static final String HARASS_NUM_STATE = "harass_num_state";
        public static final String HARASS_NUM_STATE_SIM_2 = "harass_num_state_sim_2";
        private static final String HAS_NEW_ANTISPAM = "has_new_antispam";
        public static final int IS_BLACKLIST_NOTIFICATION = 0;
        public static String KEY_ANTISPAM_ACTION_SOURCE = "antispam_action_source";
        public static final String KEY_SIM_ID = "key_sim_id";
        public static final String MARK_GUIDE_AGENT = "mark_guide_agent";
        public static final String MARK_GUIDE_FRAUD = "mark_guide_fraud";
        public static final String MARK_GUIDE_HARASS = "mark_guide_harass";
        public static final String MARK_GUIDE_IS_SET = "mark_guide_is_set";
        public static final String MARK_GUIDE_SELL = "mark_guide_sell";
        public static final String MARK_GUIDE_TYPE = "mark_guide_type";
        public static final String MARK_GUIDE_YELLOWPAGE_CID = "mark_guide_yellowpage_cid";
        public static final String MARK_NUM_GUIDE_CLASS = "com.miui.antispam.ui.activity.MarkNumGuideActivity";
        public static final int MARK_PROVIDER_ID_MIUI = 398;
        public static final String MARK_TIME_AGENT = "mark_time_agent";
        public static final String MARK_TIME_AGENT_SIM_2 = "mark_time_agent_sim_2";
        public static final int MARK_TIME_DEFAULT = 50;
        public static final String MARK_TIME_FRAUD = "mark_time_fraud";
        public static final String MARK_TIME_FRAUD_SIM_2 = "mark_time_fraud_sim_2";
        public static final String MARK_TIME_HARASS = "mark_time_harass";
        public static final String MARK_TIME_HARASS_SIM_2 = "mark_time_harass_sim_2";
        public static final String MARK_TIME_SELL = "mark_time_sell";
        public static final String MARK_TIME_SELL_SIM_2 = "mark_time_sell_sim_2";
        private static final String NEXT_AUTO_END_TIME_OF_QM = "next_auto_end_time_of_qm";
        private static final String NEXT_AUTO_START_TIME_OF_QM = "next_auto_start_time_of_qm";
        public static final String NOTIFICATION_BLOCK_TYPE = "notification_block_type";
        public static final String NOTIFICATION_INTERCEPT_NUMBER = "notification_intercept_number";
        public static final String NOTIFICATION_SHOW_TYPE = "notification_show_type";
        public static final int NOT_BLACKLIST_NOTIFICATION = 1;
        public static final String OVERSEA_CALL_MODE = "oversea_call_mode";
        public static final String QUIET_MODE_ENABLE = "quiet_mode_enable";
        private static final String QUIET_REPEAT_TYPE = "quiet_repeat_type";
        public static final String QUIET_WRISTBAND = "quiet_wristband";
        public static final String REPEATED_MARK_NUM_PERMISSION = "repeated_mark_num_permission";
        public static final int SELL = 3;
        public static final String SELL_NUM_STATE = "sell_num_state";
        public static final String SELL_NUM_STATE_SIM_2 = "sell_num_state_sim_2";
        public static final String SERVICE_SMS_MODE = "service_sms_mode";
        public static final int SHOW_ALL = 0;
        public static final int SHOW_NONE = 2;
        public static final String SHOW_NOTIFICATION_TYPE = "show_notification_type";
        public static final String SHOW_NOTIFICATION_TYPE_SIM_2 = "show_notification_type_sim_2";
        public static final int SHOW_NOT_BLACKLIST = 1;
        public static final int SIM_ID_1 = 1;
        public static final int SIM_ID_2 = 2;
        public static final String SMS_CLASSIFIER_AUTO_UPDATE = "sms_classifier_auto_update";
        public static final String SMS_CLASSIFIER_UPDATE_TIME = "sms_classifier_update_time";
        private static final String START_TIME_OF_QM = "start_time_of_qm";
        public static final String STRANGER_CALL_MODE = "stranger_call_mode";
        public static final String STRANGER_SMS_MODE = "stranger_sms_mode";
        public static final int VIP_ALL_CONTACTS = 0;
        public static final int VIP_CUSTOM = 2;
        private static final String VIP_LIST_FOR_QM = "vip_list_for_qm";
        public static final int VIP_STAR_CONTACTS = 1;
        public static final HashMap<Integer, Integer> mapIdToBlockType = new HashMap<Integer, Integer>() {
            {
                put(Integer.valueOf(1), Integer.valueOf(8));
                put(Integer.valueOf(2), Integer.valueOf(10));
                put(Integer.valueOf(3), Integer.valueOf(12));
                put(Integer.valueOf(10), Integer.valueOf(14));
            }
        };
        public static final HashMap<Integer, HashMap<Integer, String>> mapIdToMarkTime = new HashMap<Integer, HashMap<Integer, String>>() {
            {
                put(Integer.valueOf(1), new HashMap());
                put(Integer.valueOf(2), new HashMap());
                ((HashMap) get(Integer.valueOf(1))).put(Integer.valueOf(1), AntiSpam.MARK_TIME_FRAUD);
                ((HashMap) get(Integer.valueOf(1))).put(Integer.valueOf(2), AntiSpam.MARK_TIME_AGENT);
                ((HashMap) get(Integer.valueOf(1))).put(Integer.valueOf(3), AntiSpam.MARK_TIME_SELL);
                ((HashMap) get(Integer.valueOf(1))).put(Integer.valueOf(10), AntiSpam.MARK_TIME_HARASS);
                ((HashMap) get(Integer.valueOf(2))).put(Integer.valueOf(1), AntiSpam.MARK_TIME_FRAUD_SIM_2);
                ((HashMap) get(Integer.valueOf(2))).put(Integer.valueOf(2), AntiSpam.MARK_TIME_AGENT_SIM_2);
                ((HashMap) get(Integer.valueOf(2))).put(Integer.valueOf(3), AntiSpam.MARK_TIME_SELL_SIM_2);
                ((HashMap) get(Integer.valueOf(2))).put(Integer.valueOf(10), AntiSpam.MARK_TIME_HARASS_SIM_2);
            }
        };
        public static final HashMap<Integer, HashMap<Integer, String>> mapIdToState = new HashMap<Integer, HashMap<Integer, String>>() {
            {
                put(Integer.valueOf(1), new HashMap());
                put(Integer.valueOf(2), new HashMap());
                ((HashMap) get(Integer.valueOf(1))).put(Integer.valueOf(1), AntiSpam.FRAUD_NUM_STATE);
                ((HashMap) get(Integer.valueOf(1))).put(Integer.valueOf(2), AntiSpam.AGENT_NUM_STATE);
                ((HashMap) get(Integer.valueOf(1))).put(Integer.valueOf(3), AntiSpam.SELL_NUM_STATE);
                ((HashMap) get(Integer.valueOf(1))).put(Integer.valueOf(10), AntiSpam.HARASS_NUM_STATE);
                ((HashMap) get(Integer.valueOf(2))).put(Integer.valueOf(1), AntiSpam.FRAUD_NUM_STATE_SIM_2);
                ((HashMap) get(Integer.valueOf(2))).put(Integer.valueOf(2), AntiSpam.AGENT_NUM_STATE_SIM_2);
                ((HashMap) get(Integer.valueOf(2))).put(Integer.valueOf(3), AntiSpam.SELL_NUM_STATE_SIM_2);
                ((HashMap) get(Integer.valueOf(2))).put(Integer.valueOf(10), AntiSpam.HARASS_NUM_STATE_SIM_2);
            }
        };

        public static int getEndTimeForQuietMode(Context context) {
            return android.provider.Settings.Secure.getInt(context.getContentResolver(), END_TIME_OF_QM, 420);
        }

        public static int getMarkedNumberBlockType(int i) {
            return ((Integer) mapIdToBlockType.get(Integer.valueOf(i))).intValue();
        }

        public static int getMode(Context context, String str, int i) {
            return android.provider.Settings.Secure.getInt(context.getContentResolver(), str, i);
        }

        public static long getNextAutoEndTime(Context context) {
            return android.provider.Settings.Secure.getLong(context.getContentResolver(), NEXT_AUTO_END_TIME_OF_QM, 0);
        }

        public static long getNextAutoStartTime(Context context) {
            return android.provider.Settings.Secure.getLong(context.getContentResolver(), NEXT_AUTO_START_TIME_OF_QM, 0);
        }

        public static int getNotificationType(Context context, int i) {
            return android.provider.Settings.Secure.getInt(context.getContentResolver(), i == 1 ? SHOW_NOTIFICATION_TYPE : SHOW_NOTIFICATION_TYPE_SIM_2, 0);
        }

        public static int getQuietRepeatType(Context context) {
            return android.provider.Settings.Secure.getInt(context.getContentResolver(), QUIET_REPEAT_TYPE, 127);
        }

        public static long getSMSClassifierUpdateTime(Context context) {
            return android.provider.Settings.Secure.getLong(context.getContentResolver(), SMS_CLASSIFIER_UPDATE_TIME, 0);
        }

        public static int getStartTimeForQuietMode(Context context) {
            return android.provider.Settings.Secure.getInt(context.getContentResolver(), START_TIME_OF_QM, 1380);
        }

        public static boolean getState(Context context, String str, boolean z) {
            return miui.provider.ExtraSettings.Secure.getBoolean(context.getContentResolver(), str, z);
        }

        public static int getVipListForQuietMode(Context context) {
            return android.provider.Settings.Secure.getInt(context.getContentResolver(), VIP_LIST_FOR_QM, 0);
        }

        public static boolean hasNewAntispam(Context context) {
            return miui.provider.ExtraSettings.Secure.getBoolean(context.getContentResolver(), HAS_NEW_ANTISPAM, false);
        }

        public static boolean isAntiSpam(Context context) {
            boolean z = true;
            if (isAntiSpamSettingsSharedForSims(context)) {
                return isAntiSpamEnableForSim(context, 1);
            }
            boolean z2 = SubscriptionManager.getDefault().getSubscriptionInfoForSlot(0) != null;
            boolean z3 = SubscriptionManager.getDefault().getSubscriptionInfoForSlot(1) != null;
            if (z2 || z3) {
                if ((!isAntiSpamEnableForSim(context, 1) || !z2) && (!isAntiSpamEnableForSim(context, 2) || !z3)) {
                    z = false;
                }
                return z;
            }
            if (!isAntiSpamEnableForSim(context, 1) && !isAntiSpamEnableForSim(context, 2)) {
                z = false;
            }
            return z;
        }

        public static boolean isAntiSpamEnableForSim(Context context, int i) {
            return miui.provider.ExtraSettings.Secure.getBoolean(context.getContentResolver(), i == 1 ? ANTISPAM_ENABLE_FOR_SIM_1 : ANTISPAM_ENABLE_FOR_SIM_2, true);
        }

        public static boolean isAntiSpamSettingsSharedForSims(Context context) {
            return miui.provider.ExtraSettings.Secure.getBoolean(context.getContentResolver(), ANTISPAM_SETTINGS_SHARED_FOR_SIMS, true);
        }

        public static boolean isAutoTimerOfQuietModeEnable(Context context) {
            return android.provider.Settings.Secure.getInt(context.getContentResolver(), AUTO_TIMER_OF_QM_ENABLE, 0) == 1;
        }

        public static boolean isMarkNumBlockOpen(Context context, int i) {
            boolean z = false;
            if (i == 1) {
                if (getMode(context, FRAUD_NUM_STATE, 1) == 0 || getMode(context, AGENT_NUM_STATE, 1) == 0 || getMode(context, SELL_NUM_STATE, 1) == 0 || getMode(context, HARASS_NUM_STATE, 1) == 0) {
                    z = true;
                }
                return z;
            } else if (i != 2) {
                return false;
            } else {
                if (getMode(context, FRAUD_NUM_STATE_SIM_2, 1) == 0 || getMode(context, AGENT_NUM_STATE_SIM_2, 1) == 0 || getMode(context, SELL_NUM_STATE_SIM_2, 1) == 0 || getMode(context, HARASS_NUM_STATE_SIM_2, 1) == 0) {
                    z = true;
                }
                return z;
            }
        }

        private static boolean isMarkNumBlockSet(Context context) {
            return getState(context, MARK_GUIDE_IS_SET, false);
        }

        public static boolean isMarkingTypeGuided(Context context, String str) {
            return getState(context, str, false);
        }

        public static boolean isQuietModeEnable(Context context) {
            return ExtraNotificationManager.isQuietModeEnable(context, -3);
        }

        public static boolean isQuietModeEnable(Context context, int i) {
            return ExtraNotificationManager.isQuietModeEnable(context, i);
        }

        /* JADX WARNING: Code restructure failed: missing block: B:10:0x0025, code lost:
            r0.close();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:15:0x002f, code lost:
            if (r0 == null) goto L_0x0032;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:17:0x0033, code lost:
            return false;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:9:0x0023, code lost:
            if (r0 != null) goto L_0x0025;
         */
        public static boolean isQuietModeEnableForCurrentUser(Context context) {
            Cursor cursor = null;
            try {
                cursor = context.getContentResolver().query(Uri.withAppendedPath(Uri.parse("content://antispamCommon/zenmode"), "1"), null, null, null, null);
                if (cursor != null) {
                    if (cursor != null) {
                        cursor.close();
                    }
                    return true;
                }
            } catch (Exception e) {
                e.printStackTrace();
            } catch (Throwable th) {
                if (cursor != null) {
                    cursor.close();
                }
                throw th;
            }
        }

        public static boolean isQuietWristband(Context context) {
            return android.provider.Settings.Secure.getInt(context.getContentResolver(), QUIET_WRISTBAND, 0) == 1;
        }

        public static boolean isRepeatedCallActionEnable(Context context) {
            return ExtraNotificationManager.isRepeatedCallEnable(context);
        }

        public static boolean isSMSClassifierAutoUpdate(Context context) {
            return miui.provider.ExtraSettings.Secure.getBoolean(context.getContentResolver(), SMS_CLASSIFIER_AUTO_UPDATE, true);
        }

        public static boolean isVipCallActionEnable(Context context) {
            return android.provider.Settings.Secure.getInt(context.getContentResolver(), CALL_ACT_OF_VIP, 0) == 1;
        }

        public static String mapIdToString(int i) {
            if (i == 10) {
                return MARK_GUIDE_HARASS;
            }
            switch (i) {
                case 1:
                    return MARK_GUIDE_FRAUD;
                case 2:
                    return MARK_GUIDE_AGENT;
                case 3:
                    return MARK_GUIDE_SELL;
                default:
                    return "";
            }
        }

        public static void resetMarkedNumberBlockSettings(Context context) {
            setMode(context, FRAUD_NUM_STATE, 1);
            setMode(context, AGENT_NUM_STATE, 1);
            setMode(context, SELL_NUM_STATE, 1);
            setMode(context, HARASS_NUM_STATE, 1);
            setMode(context, FRAUD_NUM_STATE_SIM_2, 1);
            setMode(context, AGENT_NUM_STATE_SIM_2, 1);
            setMode(context, SELL_NUM_STATE_SIM_2, 1);
            setMode(context, HARASS_NUM_STATE_SIM_2, 1);
        }

        public static void setAntiSpamEnableForSim(Context context, int i, boolean z) {
            miui.provider.ExtraSettings.Secure.putBoolean(context.getContentResolver(), i == 1 ? ANTISPAM_ENABLE_FOR_SIM_1 : ANTISPAM_ENABLE_FOR_SIM_2, z);
        }

        public static void setAntiSpamSettingsSharedForSims(Context context, boolean z) {
            miui.provider.ExtraSettings.Secure.putBoolean(context.getContentResolver(), ANTISPAM_SETTINGS_SHARED_FOR_SIMS, z);
        }

        public static void setAutoTimerOfQuietMode(Context context, boolean z) {
            android.provider.Settings.Secure.putInt(context.getContentResolver(), AUTO_TIMER_OF_QM_ENABLE, z ? 1 : 0);
        }

        public static void setEndTimeForQuietMode(Context context, int i) {
            android.provider.Settings.Secure.putInt(context.getContentResolver(), END_TIME_OF_QM, i);
        }

        public static void setHasNewAntispam(Context context, boolean z) {
            miui.provider.ExtraSettings.Secure.putBoolean(context.getContentResolver(), HAS_NEW_ANTISPAM, z);
        }

        public static void setMarkNumBlockSet(Context context, boolean z) {
            setState(context, MARK_GUIDE_IS_SET, z);
        }

        public static void setMarkingTypeGuided(Context context, String str, boolean z) {
            setState(context, str, z);
        }

        public static void setMode(Context context, String str, int i) {
            android.provider.Settings.Secure.putInt(context.getContentResolver(), str, i);
        }

        public static void setNextAutoEndTime(Context context, long j) {
            android.provider.Settings.Secure.putLong(context.getContentResolver(), NEXT_AUTO_END_TIME_OF_QM, j);
        }

        public static void setNextAutoStartTime(Context context, long j) {
            android.provider.Settings.Secure.putLong(context.getContentResolver(), NEXT_AUTO_START_TIME_OF_QM, j);
        }

        public static void setNotificationType(Context context, int i, int i2) {
            android.provider.Settings.Secure.putInt(context.getContentResolver(), i2 == 1 ? SHOW_NOTIFICATION_TYPE : SHOW_NOTIFICATION_TYPE_SIM_2, i);
        }

        public static void setQuietMode(Context context, boolean z) {
            ExtraNotificationManager.setQuietMode(context, z, -3);
        }

        public static void setQuietMode(Context context, boolean z, int i) {
            ExtraNotificationManager.setQuietMode(context, z, i);
        }

        public static void setQuietRepeatType(Context context, int i) {
            android.provider.Settings.Secure.putInt(context.getContentResolver(), QUIET_REPEAT_TYPE, i);
        }

        public static void setQuietWristband(Context context, boolean z) {
            android.provider.Settings.Secure.putInt(context.getContentResolver(), QUIET_WRISTBAND, z ? 1 : 0);
        }

        public static void setRepeatedCallActionEnable(Context context, boolean z) {
            ExtraNotificationManager.setRepeatedCallEnable(context, z);
        }

        public static void setSMSClassifierAutoUpdate(Context context, boolean z) {
            miui.provider.ExtraSettings.Secure.putBoolean(context.getContentResolver(), SMS_CLASSIFIER_AUTO_UPDATE, z);
        }

        public static void setSMSClassifierUpdateTime(Context context, long j) {
            android.provider.Settings.Secure.putLong(context.getContentResolver(), SMS_CLASSIFIER_UPDATE_TIME, j);
        }

        public static void setStartTimeForQuietMode(Context context, int i) {
            android.provider.Settings.Secure.putInt(context.getContentResolver(), START_TIME_OF_QM, i);
        }

        public static void setState(Context context, String str, boolean z) {
            miui.provider.ExtraSettings.Secure.putBoolean(context.getContentResolver(), str, z);
        }

        public static void setVipCallActionEnable(Context context, boolean z) {
            android.provider.Settings.Secure.putInt(context.getContentResolver(), CALL_ACT_OF_VIP, z ? 1 : 0);
        }

        public static void setVipListForQuietMode(Context context, int i) {
            android.provider.Settings.Secure.putInt(context.getContentResolver(), VIP_LIST_FOR_QM, i);
        }

        public static boolean shouldShowGuidingDialog(Context context, int i) {
            return !Build.IS_INTERNATIONAL_BUILD && ((HashMap) mapIdToState.get(Integer.valueOf(1))).get(Integer.valueOf(i)) != null && !isMarkNumBlockOpen(context, 1) && !isMarkNumBlockOpen(context, 2) && !isMarkNumBlockSet(context) && !isMarkingTypeGuided(context, mapIdToString(i));
        }
    }

    public static final class AntiVirus {
        private static final String INSTALL_MONITOR_ENABLED = "virus_scan_install";

        public static boolean isInstallMonitorEnabled(Context context) {
            return miui.provider.ExtraSettings.System.getBoolean(context.getContentResolver(), INSTALL_MONITOR_ENABLED, true);
        }

        public static void setInstallMonitorEnabled(Context context, boolean z) {
            miui.provider.ExtraSettings.System.putBoolean(context.getContentResolver(), INSTALL_MONITOR_ENABLED, z);
        }
    }

    public static final class ForceTouch {
        private static final String ForceTouchEnable = "force_touch_enable";
        private static float mDeepPress = -1.0f;
        private static float mLightPress = -1.0f;
        private static int mSupportForceTouch = -1;

        private static void checkHighend() {
            if ("capricorn".equals(SystemProperties.get("ro.product.device", ""))) {
                long totalInternalMemory = getTotalInternalMemory();
                long totalPhysicalMemory = HardwareInfo.getTotalPhysicalMemory();
                if (totalInternalMemory < 128000000000L || totalPhysicalMemory < 4000000000L) {
                    mSupportForceTouch = 0;
                }
            }
        }

        public static float getDeepPressure() {
            if (mDeepPress < 0.0f) {
                mDeepPress = FeatureParser.getFloat("force_touch_deep", 0.8f).floatValue();
            }
            return mDeepPress;
        }

        public static float getLightPressure() {
            if (mLightPress < 0.0f) {
                mLightPress = FeatureParser.getFloat("force_touch_light", 0.4f).floatValue();
            }
            return mLightPress;
        }

        private static long getTotalInternalMemory() {
            long j = 0;
            ArrayList arrayList = new ArrayList();
            arrayList.add(Environment.getDataDirectory());
            if (!"mixed".equals(SystemProperties.get("ro.boot.sdcard.type", "mixed"))) {
                String externalStorageState = Environment.getExternalStorageState();
                if ("mounted".equals(externalStorageState) || "mounted_ro".equals(externalStorageState)) {
                    arrayList.add(Environment.getExternalStorageDirectory());
                }
            }
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                j += ((File) it.next()).getTotalSpace();
            }
            long j2 = j;
            return j2 >= 8 * 1000000000 ? ((long) Math.pow(2.0d, Math.ceil(Math.log((double) (j2 / 1000000000)) / Math.log(2.0d)))) * 1000000000 : ((j2 / 1000000000) + 1) * 1000000000;
        }

        public static boolean isEnabled(Context context) {
            boolean z = false;
            if (!isSupport()) {
                return false;
            }
            if (android.provider.Settings.System.getInt(context.getContentResolver(), ForceTouchEnable, 1) != 0) {
                z = true;
            }
            return z;
        }

        public static boolean isSupport() {
            if (mSupportForceTouch < 0) {
                mSupportForceTouch = FeatureParser.getBoolean("support_force_touch", false) ? 1 : 0;
                if (mSupportForceTouch == 1) {
                    checkHighend();
                }
            }
            return mSupportForceTouch == 1;
        }

        public static boolean setEnabled(Context context, boolean z) {
            if (!isSupport()) {
                return false;
            }
            android.provider.Settings.System.putInt(context.getContentResolver(), ForceTouchEnable, z ? 1 : 0);
            return true;
        }
    }

    public static final class FrequentPhrases {
        private static final String FREQUENT_PHRASES = "frequent_phrases";
        private static final String TAG_PHRASES = "phrases";

        public static ArrayList<String> getFrequentPhrases(Context context) {
            String string = miui.provider.ExtraSettings.System.getString(context.getContentResolver(), FREQUENT_PHRASES);
            if (TextUtils.isEmpty(string)) {
                return null;
            }
            try {
                JSONArray optJSONArray = new JSONObject(string).optJSONArray(TAG_PHRASES);
                if (optJSONArray == null || optJSONArray.length() == 0) {
                    return null;
                }
                ArrayList<String> arrayList = new ArrayList<>();
                for (int i = 0; i < optJSONArray.length(); i++) {
                    String optString = optJSONArray.optString(i);
                    if (!TextUtils.isEmpty(optString)) {
                        arrayList.add(optString);
                    }
                }
                return arrayList;
            } catch (JSONException e) {
                e.printStackTrace();
                return null;
            }
        }

        public static void setFrequentPhrases(Context context, ArrayList<String> arrayList) {
            if (arrayList == null || arrayList.size() == 0) {
                miui.provider.ExtraSettings.System.putString(context.getContentResolver(), FREQUENT_PHRASES, "");
            } else {
                JSONArray jSONArray = new JSONArray();
                for (int i = 0; i < arrayList.size(); i++) {
                    jSONArray.put(arrayList.get(i));
                }
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put(TAG_PHRASES, jSONArray);
                    miui.provider.ExtraSettings.System.putString(context.getContentResolver(), FREQUENT_PHRASES, jSONObject.toString());
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static class Global {
        public static final String CAN_NAV_BAR_HIDE = "can_nav_bar_hide";
        public static final String FORCE_FSG_NAV_BAR = "force_fsg_nav_bar";
        public static final String FORCE_IMMERSIVE_NAV_BAR = "force_immersive_nav_bar";
        public static final String HIDE_NAV_BAR = "hide_nav_bar";
        public static final String OPEN_PRIVACY_CONTACT_IN_SECOND_SPACE = "open_privacy_contact_in_second_space";
        public static final String OPEN_SECOND_SPACE_STATUS_ICON = "open_second_space_status_icon";
        public static final String POLICY_CONTROL_DEFAULT = "immersive.preconfirms=*";
        public static final String POLICY_CONTROL_IMMERSIVE_NAV_BAR = "immersive.navigation=*:immersive.preconfirms=*";
        public static final String SHOW_ASSISTANT_BUTTON = "show_assistant_button";
        public static final String SHOW_GESTURE_APPSWITCH_FEATURE = "show_gesture_appswitch_feature";
        public static final String SHOW_GESTURE_BACK_ANIMATION = "show_gesture_back_animation";

        public static boolean changeOpenSecondSpaceStatusIcon(ContentResolver contentResolver, boolean z) {
            return putBoolean(contentResolver, OPEN_SECOND_SPACE_STATUS_ICON, z);
        }

        public static boolean changePrivacyContactMode(ContentResolver contentResolver, boolean z) {
            return putBoolean(contentResolver, OPEN_PRIVACY_CONTACT_IN_SECOND_SPACE, z);
        }

        public static boolean getBoolean(ContentResolver contentResolver, String str) {
            return android.provider.Settings.Global.getInt(contentResolver, str, 0) != 0;
        }

        public static boolean isOpenSecondSpaceStatusIcon(ContentResolver contentResolver) {
            return android.provider.Settings.Global.getInt(contentResolver, OPEN_SECOND_SPACE_STATUS_ICON, 1) != 0;
        }

        public static boolean isOpenedPrivacyContactMode(ContentResolver contentResolver) {
            return getBoolean(contentResolver, OPEN_PRIVACY_CONTACT_IN_SECOND_SPACE);
        }

        public static boolean putBoolean(ContentResolver contentResolver, String str, boolean z) {
            return android.provider.Settings.Global.putInt(contentResolver, str, z ? 1 : 0);
        }
    }

    public static final class Key {
        public static final String CLOSE_APP = "close_app";
        public static final String CLOSE_TALKBACK = "close_talkback";
        public static final int DISABLE_THREE_GESTURE = 0;
        public static final String DOUBLE_CLICK_POWER_KEY = "double_click_power_key";
        public static final String DUMP_LOG = "dump_log";
        public static final int ENABLE_THREE_GESTURE = 1;
        public static final String ENABLE_THREE_GESTURE_KEY = "enable_three_gesture";
        public static final String GO_TO_SLEEP = "go_to_sleep";
        public static final String KEY_AI_BUTTON_SETTINGS = "key_ai_button_settings";
        public static final String KEY_BANK_CARD = "key_bank_card_in_ese";
        public static final int KEY_BANK_CARD_DISABLE = 0;
        public static final String KEY_COMBINATION_POWER_BACK = "key_combination_power_back";
        public static final String KEY_COMBINATION_POWER_HOME = "key_combination_power_home";
        public static final String KEY_COMBINATION_POWER_MENU = "key_combination_power_menu";
        public static final String KEY_DOUBLE_CLICK_AI_BUTTON_SETTINGS = "key_double_click_ai_button_settings";
        public static final String KEY_LONG_PRESS_DOWN_AI_BUTTON_SETTINGS = "key_long_press_down_ai_button_settings";
        public static final String KEY_LONG_PRESS_UP_AI_BUTTON_SETTINGS = "key_long_press_up_ai_button_settings";
        public static final String KEY_NONE = "key_none";
        public static final String KEY_SINGLE_CLICK_AI_BUTTON_SETTINGS = "key_single_click_ai_button_settings";
        public static final String KEY_TRANS_CARD = "key_trans_card_in_ese";
        public static final int KEY_TRANS_CARD_DISABLE = 0;
        public static final String KEY_UPDATED = "key_updated";
        public static final String LAUNCH_CAMERA = "launch_camera";
        public static final String LAUNCH_GOOGLE_SEARCH = "launch_google_search";
        public static final String LAUNCH_RECENTS = "launch_recents";
        public static final String LAUNCH_VOICE_ASSISTANT = "launch_voice_assistant";
        public static final String LONG_PRESS_BACK_KEY = "long_press_back_key";
        public static final String LONG_PRESS_HOME_KEY = "long_press_home_key";
        public static final String LONG_PRESS_MENU_KEY = "long_press_menu_key";
        public static final String LONG_PRESS_MENU_KEY_WHEN_LOCK = "long_press_menu_key_when_lock";
        public static final String LONG_PRESS_POWER_LAUNCH_XIAOAI = "long_press_power_launch_xiaoai";
        public static final int LONG_PRESS_POWER_LAUNCH_XIAOAI_DISABLE = 0;
        public static final int LONG_PRESS_POWER_LAUNCH_XIAOAI_ENABLE = 1;
        public static final String LONG_PRESS_VOLUME_DOWN = "key_long_press_volume_down";
        public static final String LONG_PRESS_VOLUME_DOWN_DEFAULT = "none";
        public static final String LONG_PRESS_VOLUME_DOWN_PAY = "public_transportation_shortcuts";
        public static final String LONG_PRESS_VOLUME_DOWN_STREET_SNAP = "Street-snap";
        public static final String LONG_PRESS_VOLUME_DOWN_STREET_SNAP_MOVIE = "Street-snap-movie";
        public static final String LONG_PRESS_VOLUME_DOWN_STREET_SNAP_PICTURE = "Street-snap-picture";
        public static final String MI_PAY = "mi_pay";
        public static final String NONE = "none";
        public static final String SCREEN_SHOT = "screen_shot";
        public static final String SEND_BACK_WHEN_XIAOAI_APPEAR = "send_back_when_xiaoai_appear";
        public static final String SHOW_MENU = "show_menu";
        public static final String SINGLE_KEY_USE_ACTION = "single_key_use_enable";
        public static final int SINGLE_KEY_USE_DISABLE = 0;
        public static final int SINGLE_KEY_USE_ENABLE = 1;
        public static final String SPLIT_SCREEN = "split_screen";
        public static final String THREE_GESTURE_DOWN = "three_gesture_down";
        public static final String TURN_ON_TORCH = "turn_on_torch";
        public static final String VOLUMEKEY_LAUNCH_CAMERA = "volumekey_launch_camera";
        public static final String WIRED_HEADSET_LAUNCH_XIAOAI = "wired_headset_launch_xiaoai";

        public static String getKeyAndGestureShortcutFunction(Context context, String str) {
            String stringForUser = android.provider.Settings.System.getStringForUser(context.getContentResolver(), str, -2);
            if (!TextUtils.isEmpty(stringForUser)) {
                return stringForUser;
            }
            if (DOUBLE_CLICK_POWER_KEY.equals(str)) {
                return null;
            }
            if (THREE_GESTURE_DOWN.equals(str)) {
                return SCREEN_SHOT;
            }
            if (LONG_PRESS_HOME_KEY.equals(str)) {
                return !Build.IS_GLOBAL_BUILD ? LAUNCH_VOICE_ASSISTANT : LAUNCH_GOOGLE_SEARCH;
            }
            if (LONG_PRESS_MENU_KEY.equals(str)) {
                return "show_menu";
            }
            if (LONG_PRESS_MENU_KEY_WHEN_LOCK.equals(str)) {
                return TURN_ON_TORCH;
            }
            if (LONG_PRESS_BACK_KEY.equals(str)) {
                return null;
            }
            if (KEY_COMBINATION_POWER_HOME.equals(str)) {
                return null;
            }
            if (KEY_COMBINATION_POWER_BACK.equals(str)) {
                return null;
            }
            if (KEY_COMBINATION_POWER_MENU.equals(str)) {
                return null;
            }
            return stringForUser;
        }

        public static boolean isTSMClientInstalled(Context context) {
            PackageManager packageManager = context.getPackageManager();
            if (packageManager != null) {
                try {
                    if (packageManager.getPackageInfo("com.miui.tsmclient", 0) != null) {
                        return true;
                    }
                } catch (NameNotFoundException e) {
                }
            }
            return false;
        }

        public static void updateOldKeyFunctionToNew(Context context) {
            if (android.provider.Settings.System.getIntForUser(context.getContentResolver(), KEY_UPDATED, 0, -2) == 0) {
                String screenKeyLongPressAction = System.getScreenKeyLongPressAction(context, System.SCREEN_KEY_LONG_PRESS_APP_SWITCH);
                String screenKeyLongPressAction2 = System.getScreenKeyLongPressAction(context, System.SCREEN_KEY_LONG_PRESS_HOME);
                String screenKeyLongPressAction3 = System.getScreenKeyLongPressAction(context, System.SCREEN_KEY_LONG_PRESS_BACK);
                if (System.SCREEN_KEY_LONG_PRESS_ACTION_VOICE_ASSISTANT.equals(screenKeyLongPressAction2)) {
                    android.provider.Settings.System.putStringForUser(context.getContentResolver(), LONG_PRESS_HOME_KEY, LAUNCH_VOICE_ASSISTANT, -2);
                } else if (System.SCREEN_KEY_LONG_PRESS_ACTION_VOICE_ASSISTANT.equals(screenKeyLongPressAction3)) {
                    android.provider.Settings.System.putStringForUser(context.getContentResolver(), LONG_PRESS_BACK_KEY, LAUNCH_VOICE_ASSISTANT, -2);
                } else if (System.SCREEN_KEY_LONG_PRESS_ACTION_VOICE_ASSISTANT.equals(screenKeyLongPressAction)) {
                    android.provider.Settings.System.putStringForUser(context.getContentResolver(), LONG_PRESS_MENU_KEY, LAUNCH_VOICE_ASSISTANT, -2);
                }
                if ("close_app".equals(screenKeyLongPressAction3)) {
                    android.provider.Settings.System.putStringForUser(context.getContentResolver(), LONG_PRESS_BACK_KEY, "close_app", -2);
                } else if ("close_app".equals(screenKeyLongPressAction2)) {
                    android.provider.Settings.System.putStringForUser(context.getContentResolver(), LONG_PRESS_HOME_KEY, "close_app", -2);
                } else if ("close_app".equals(screenKeyLongPressAction)) {
                    android.provider.Settings.System.putStringForUser(context.getContentResolver(), LONG_PRESS_MENU_KEY, "close_app", -2);
                }
                android.provider.Settings.System.putIntForUser(context.getContentResolver(), KEY_UPDATED, 1, -2);
            }
        }
    }

    public static final class MiuiVoip {
        private static final String MIUI_VOIP_ACTIVATED = "miui_voip_activated";
        private static final String MIUI_VOIP_CALLLOG_AUTO = "miui_voip_calllog_auto";
        private static final String MIUI_VOIP_CONTACT_COUNT = "miui_voip_contact_count";
        private static final String MIUI_VOIP_ENABLED = "miui_voip_enabled";
        private static final String MIUI_VOIP_NEW_CONTACT_COUNT = "miui_voip_new_contact_count";
        private static final String MIUI_VOIP_WIFI_AUTO = "miui_voip_wifi_auto";

        public static int getVoipContactCount(Context context) {
            return miui.provider.ExtraSettings.System.getInt(context.getContentResolver(), MIUI_VOIP_CONTACT_COUNT, 0);
        }

        public static int getVoipNewContactCount(Context context) {
            return miui.provider.ExtraSettings.System.getInt(context.getContentResolver(), MIUI_VOIP_NEW_CONTACT_COUNT, 0);
        }

        public static boolean isVoipActivated(Context context) {
            return miui.provider.ExtraSettings.System.getBoolean(context.getContentResolver(), MIUI_VOIP_ACTIVATED, false);
        }

        public static boolean isVoipCallLogAuto(Context context) {
            return miui.provider.ExtraSettings.System.getBoolean(context.getContentResolver(), MIUI_VOIP_CALLLOG_AUTO, false);
        }

        public static boolean isVoipEnabled(Context context) {
            return miui.provider.ExtraSettings.System.getBoolean(context.getContentResolver(), MIUI_VOIP_ENABLED, false);
        }

        public static boolean isVoipWifiAuto(Context context) {
            return miui.provider.ExtraSettings.System.getBoolean(context.getContentResolver(), MIUI_VOIP_WIFI_AUTO, false);
        }

        public static void setVoipActivated(Context context, boolean z) {
            miui.provider.ExtraSettings.System.putBoolean(context.getContentResolver(), MIUI_VOIP_ACTIVATED, z);
        }

        public static void setVoipCallLogAuto(Context context, boolean z) {
            miui.provider.ExtraSettings.System.putBoolean(context.getContentResolver(), MIUI_VOIP_CALLLOG_AUTO, z);
        }

        public static void setVoipContactCount(Context context, int i) {
            miui.provider.ExtraSettings.System.putInt(context.getContentResolver(), MIUI_VOIP_CONTACT_COUNT, i);
        }

        public static void setVoipEnabled(Context context, boolean z) {
            miui.provider.ExtraSettings.System.putBoolean(context.getContentResolver(), MIUI_VOIP_ENABLED, z);
        }

        public static void setVoipNewContactCount(Context context, int i) {
            miui.provider.ExtraSettings.System.putInt(context.getContentResolver(), MIUI_VOIP_NEW_CONTACT_COUNT, i);
        }

        public static void setVoipWifiAuto(Context context, boolean z) {
            miui.provider.ExtraSettings.System.putBoolean(context.getContentResolver(), MIUI_VOIP_WIFI_AUTO, z);
        }
    }

    public static final class Privacy {
        public static final String ACTION_PRIVACY_AUTHORIZATION_DIALOG = "miui.intent.action.PRIVACY_AUTHORIZATION_DIALOG";
        public static final String PRIVACY_PREFIX = "privacy_status_";

        public static boolean isEnabled(Context context, String str) {
            return ((SecurityManager) context.getSystemService("security")).isAppPrivacyEnabled(str);
        }

        public static void setEnabled(Context context, String str, boolean z) {
            ((SecurityManager) context.getSystemService("security")).setAppPrivacyStatus(str, z);
        }
    }

    public static final class ScreenEffect {
        public static final int DEFALUT_SCREEN_COLOR = 2;
        public static final int DEFAULT_PAPER_MODE_LEVEL = SystemProperties.getInt("sys.paper_mode_default_level", (PAPER_MODE_MAX_LEVEL / 8) * 5);
        public static final int DEFAULT_SCREEN_OPTIMIZE_MODE = getDefaultScreenOptimizeMode();
        public static final int DEFAULT_SCREEN_SATURATION = getDefaultSaturation();
        public static final int FLAG_SUPPORT_ADAPT_MODE = 1;
        public static final int FLAG_SUPPORT_ENHANCE_MODE = 2;
        public static final int FLAG_SUPPORT_MONOCHROME_MODE = 8;
        public static final int FLAG_SUPPORT_STANDARD_MODE = 4;
        public static final String GAME_HDR_LEVEL = "game_hdr_level";
        public static final String GAME_MODE = "screen_game_mode";
        public static final int GAME_MODE_DISABLE_EYECARE = 1;
        public static final int GAME_MODE_ENABLE_HDR = 2;
        public static final int MONOCHROME_MODE_DEFAULT = 2;
        public static final int MONOCHROME_MODE_GLOBAL = 1;
        public static final int MONOCHROME_MODE_LOCAL = 2;
        public static final String NIGHT_LIGHT_LEVEL = "night_light_level";
        public static final int PAPER_MODE_AUTO_TWILIGHT = 1;
        public static final int PAPER_MODE_CUSTOMIZE_TIME = 2;
        public static final int PAPER_MODE_DEFAULT = 1;
        public static final int PAPER_MODE_GLOBAL = 1;
        public static final int PAPER_MODE_LOCAL = 2;
        public static final int PAPER_MODE_MAX_LEVEL = SystemProperties.getInt("sys.paper_mode_max_level", Math.round(FeatureParser.getFloat("paper_mode_max_level", 8.0f).floatValue()));
        public static final String PAPER_MODE_SCHEDULER_TYPE = "paper_mode_scheduler_type";
        public static final int PAPER_MODE_TIME_CANCEL = 0;
        public static final String PROPERTY_SCREEN_PAPER_MODE_LEVEL = "persist.sys.eyecare_cache";
        public static final int SCREEN_COLOR_COOL = 3;
        public static final String SCREEN_COLOR_LEVEL = "screen_color_level";
        public static final int SCREEN_COLOR_NATURE = 2;
        public static final String SCREEN_COLOR_SELECTED = "screen_color_selected";
        public static final int SCREEN_COLOR_WARM = 1;
        public static final int SCREEN_EFFECT_SUPPORTED = FeatureParser.getInteger("screen_effect_supported", 0);
        public static final String SCREEN_MONOCHROME_MODE = "screen_monochrome_mode";
        public static final String SCREEN_MONOCHROME_MODE_ENABLED = "screen_monochrome_mode_enabled";
        public static final boolean SCREEN_MONOCHROME_MODE_ENABLED_DEFAULT = false;
        public static final String SCREEN_MONOCHROME_MODE_WHITE_LIST = "screen_monochrome_mode_white_list";
        public static final int SCREEN_OPTIMIZE_ADAPT = 1;
        public static final int SCREEN_OPTIMIZE_ENHANCE = 2;
        public static final String SCREEN_OPTIMIZE_MODE = "screen_optimize_mode";
        public static final int SCREEN_OPTIMIZE_STANDARD = 3;
        public static final String SCREEN_PAPER_MODE = "screen_paper_mode";
        public static final String SCREEN_PAPER_MODE_ENABLED = "screen_paper_mode_enabled";
        public static final boolean SCREEN_PAPER_MODE_ENABLED_DEFAULT = false;
        public static final String SCREEN_PAPER_MODE_LEVEL = "screen_paper_mode_level";
        public static final String SCREEN_PAPER_MODE_TIME_ENABLED = "screen_paper_mode_time_enabled";
        public static final boolean SCREEN_PAPER_MODE_TIME_ENABLED_DEFAULT = false;
        public static final String SCREEN_PAPER_MODE_TIME_END = "screen_paper_mode_time_end";
        public static final String SCREEN_PAPER_MODE_TIME_START = "screen_paper_mode_time_start";
        public static final String SCREEN_PAPER_MODE_TWILIGHT_END = "screen_paper_mode_twilight_end";
        public static final int SCREEN_PAPER_MODE_TWILIGHT_END_DEAULT = 1080;
        public static final String SCREEN_PAPER_MODE_TWILIGHT_START = "screen_paper_mode_twilight_start";
        public static final int SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT = 360;
        public static final String SCREEN_PAPER_MODE_WHITE_LIST = "screen_paper_mode_white_list";
        public static final int SCREEN_SATURATION_STANDARD = 10;
        public static final int SCREEN_SATURATION_VIVID = 11;
        public static final boolean isScreenPaperModeSupported = FeatureParser.getBoolean("support_screen_paper_mode", false);

        private static int getDefaultSaturation() {
            int i = 10;
            if (FeatureParser.getBoolean(d.vk, false)) {
                i = 11;
            }
            return FeatureParser.getInteger("display_ce", i);
        }

        private static int getDefaultScreenOptimizeMode() {
            return (SCREEN_EFFECT_SUPPORTED & 1) == 0 ? 2 : 1;
        }

        public static HashMap<String, Boolean> getScreenModePkgList(Context context, String str) {
            String stringForUser = android.provider.Settings.System.getStringForUser(context.getContentResolver(), str, -2);
            HashMap<String, Boolean> hashMap = new HashMap<>();
            if (!TextUtils.isEmpty(stringForUser)) {
                String[] split = stringForUser.split(",");
                if (split != null) {
                    for (String str2 : split) {
                        int indexOf = str2.indexOf(61);
                        hashMap.put(str2.substring(0, indexOf), Boolean.valueOf(str2.substring(indexOf + 1)));
                    }
                }
            }
            return hashMap;
        }

        public static boolean isInPaperModeTimeSchedule(Context context, int i, int i2) {
            Calendar instance = Calendar.getInstance();
            int i3 = (instance.get(11) * 60) + instance.get(12);
            if (i > i2) {
                return i3 < i2 || i3 >= i;
            }
            if (i < i2) {
                return i3 >= i && i3 < i2;
            }
            return false;
        }

        public static boolean isScreenPaperMode() {
            return DisplayFeatureManager.getInstance().getEyeCare() > 0;
        }

        public static void setScreenModePkgList(Context context, HashMap<String, Boolean> hashMap, String str) {
            if (hashMap != null && hashMap.size() != 0) {
                StringBuilder sb = new StringBuilder();
                Iterator it = hashMap.entrySet().iterator();
                while (it.hasNext()) {
                    Entry entry = (Entry) it.next();
                    sb.append((String) entry.getKey());
                    sb.append('=');
                    sb.append((Boolean) entry.getValue());
                    if (it.hasNext()) {
                        sb.append(",");
                    }
                }
                android.provider.Settings.System.putString(context.getContentResolver(), str, sb.toString());
            }
        }

        public static void setScreenPaperMode(boolean z) {
            if (z) {
                DisplayFeatureManager.getInstance().setEyeCare(SystemProperties.getInt(PROPERTY_SCREEN_PAPER_MODE_LEVEL, DEFAULT_PAPER_MODE_LEVEL));
                return;
            }
            DisplayFeatureManager.getInstance().setEyeCare(0);
        }
    }

    public static class Secure extends android.provider.SystemSettings.Secure {
        public static final String ACCESS_CONTROL_LOCK_CONVENIENT = "access_control_lock_convenient";
        public static final String ACCESS_CONTROL_LOCK_ENABLED = "access_control_lock_enabled";
        public static final String ACCESS_CONTROL_LOCK_MODE = "access_control_lock_mode";
        public static final String ACCESS_CONTROL_MASK_NOTIFICATION = "access_control_mask_notification";
        public static String APP_ENCRYPT_PASSWORD = "app_encrypt_password";
        public static final String ATRACE_ENABLED = "atrace_enabled";
        public static final String BATTERY_LIGHT_TURN_ON = "battery_light_turn_on";
        public static final String BLUETOOTH_TRACE_LOG = "bluetooth_trace_log";
        public static final String CHILDREN_MODE_DENY_SMS_PERMISSION = "children_mode_deny_sms_permission";
        public static final String CHILDREN_MODE_ENABLED = "children_mode_enabled";
        public static final String CLOUD_MESSAGING_ON = "cloud_messaging_on";
        public static final int DEFAULT_EXPERIMENTAL_PERMISSION_ALLOW = 1;
        public static final int DEFAULT_FIND_DEVICE_PIN_LOCK = 0;
        public static final String DEFAULT_INPUT_METHOD_CHOOSED = "default_input_method_choosed";
        public static final int DEFAULT_LOCAL_AUTO_BACKUP = 0;
        public static final int DEFAULT_PERMANENTLY_LOCK_SIM_CHANGE = 0;
        public static final int DEFAULT_VPN_ENABLE_PASSWORD = 0;
        public static final String ENABLE_AUTO_SPEAKER = "enable_auto_speaker";
        public static final String ENABLE_MIKEY_MODE = "enable_mikey_mode";
        public static final String ENABLE_MIUI_IME_XIAOAI_VOICE = "enable_miui_ime_xiaoai_voice";
        public static final String ENABLE_MIUI_SECURITY_IME = "enable_miui_security_ime";
        public static final String EXPERIMENTAL_PERMISSION_ALLOW = "experimental_permission_allow";
        public static String FIND_DEVICE_PIN_LOCK = "find_device_pin_lock";
        public static String FORCE_CLOCE_DIALOG_ENABLED = "force_close_dialog_enabled";
        public static final String GREEN_KID_ACTIVE = "green_kid_active";
        public static final String HAS_SHOW_GUIDE = "has_show_guide";
        public static final String HTTP_INVOKE_APP = "http_invoke_app";
        public static final String IS_SECOND_SPACE = "is_second_space";
        public static final String KEY_FIRST_ENTER_SECURITY_SPACE = "first_enter_security_space";
        public static final String KID_USER_ID = "kid_user_id";
        public static final String LIGHT_TURN_ON = "light_turn_on";
        public static final String LIGHT_TURN_ON_ENDTIME = "light_turn_on_endTime";
        public static final String LIGHT_TURN_ON_STARTTIME = "light_turn_on_startTime";
        public static final String LOCAL_AUTO_BACKUP = "local_auto_backup";
        public static final String LOCK_SCREEN_SECURE_AFTER_TIMEOUT = "enable_lock_screen_secure_after_timeout";
        public static String MIUI_OPTIMIZATION = "miui_optimization";
        public static final String MOBILE_POLICY = "mobile_policy";
        public static final String MUSIC_LIGHT_TURN_ON = "music_light_turn_on";
        public static final String NOTIFICATION_LIGHT_TURN_ON = "notification_light_turn_on";
        public static final String OPEN_CROSS_USER_NOTIFICATION = "open_cross_user_notification";
        public static final String OPEN_SWITCH_USER_NOTIFICATION = "open_switch_user_notification";
        public static final String PACKAGE_ACCESSIBILITY_SERVICE_IGNORED = "package_accessibillity_service_ignored";
        public static final String PASSWORD_FOR_PRIVACYMODE = "password_for_privacymode";
        public static String PERMANENTLY_LOCK_SIM_CHANGE = "permanently_lock_sim_change";
        public static final String PRIVACY_PASSWORD_IS_OPEN = "privacy_password_is_open";
        public static final String PRIVATE_GALLERY_LOCK_ENABLED = "private_gallery_lock_enabled";
        public static final String PRIVATE_GALLERY_LOCK_PATTERN_VISIBLE = "private_gallery_lock_pattern_visible_pattern";
        public static final String PRIVATE_SMS_LOCK_ENABLED = "private_sms_lock_enabled";
        public static final String PRIVATE_SMS_LOCK_PATTERN_VISIBLE = "private_sms_lock_pattern_visible_pattern";
        public static String REGISTER_FIND_DEVICE_SIM_NUMBER = "resister_find_device_sim_number";
        public static final String SCREEN_BUTTONS_HAS_BEEN_DISABLED = "screen_buttons_has_been_disabled";
        public static final String SCREEN_BUTTONS_TURN_ON = "screen_buttons_turn_on";
        public static final String SECOND_SPACE_ENTRANCE_STATUS = "second_space_entrance_status";
        public static final String SECOND_USER_ID = "second_user_id";
        public static final String SSPACE_USED = "sSpace_used";
        public static final String STATUS_BAR_NOTIFICATION_SHADE_SHORTCUT = "status_bar_notification_shade_shortcut";
        public static final int STATUS_BAR_NOTIFICATION_SHADE_SHORTCUT_SEARCH = 0;
        public static final int STATUS_BAR_NOTIFICATION_SHADE_SHORTCUT_SETTINGS = 1;
        public static final String SYNC_ON_WIFI_ONLY = "sync_on_wifi_only";
        public static final String TALKBACK_WATERMARK_ENABLED = "talkback_watermark_enable";
        public static final String TIMESTAMP_USER_DISABLE_HYBRID_ICON_TIP = "ts_user_disable_hybrid_icon_tip";
        public static final String TIME_CHANGE_DISALLOW = "time_change_disallow";
        public static final String TST_SUPPORT = "tst_support";
        public static final int TST_SUPP_NOT_SUPPORT = 0;
        public static final int TST_SUPP_SUPPORT = 1;
        public static final int TST_SUPP_UNKNOWN = -1;
        public static String UNLOCK_FAILED_ATTEMPTS = "unlock_failed_attempts";
        public static final String UPLOAD_DEBUG_LOG = "upload_debug_log_pref";
        public static final String UPLOAD_LOG = "upload_log_pref";
        public static final String USB_MODE = "usb_mode";
        public static final int USB_MODE_ASK_USER = 0;
        public static final int USB_MODE_CHARGE_ONLY = 1;
        public static final int USB_MODE_MOUNT_STORAGE = 2;
        public static final String VPN_ENABLE_PASSWORD = "vpn_password_enable";
        public static final String XSPACE_ENABLED = "xspace_enabled";
        public static final String XSPACE_USED = "xSpace_used";

        /* access modifiers changed from: private */
        public static Intent buildNewPasswordIntent(String str) {
            Intent intent = new Intent("android.app.action.SET_NEW_PASSWORD");
            intent.putExtra("set_keyguard_password", false);
            intent.putExtra("common_password_business_key", str);
            return intent;
        }

        public static void changeOpenCrossUserNotification(ContentResolver contentResolver, boolean z, int i) {
            android.provider.Settings.Secure.putIntForUser(contentResolver, OPEN_CROSS_USER_NOTIFICATION, z ? 1 : 0, i);
        }

        public static void changeOpenSwitchUserNotification(ContentResolver contentResolver, boolean z, int i) {
            android.provider.Settings.Secure.putIntForUser(contentResolver, OPEN_SWITCH_USER_NOTIFICATION, z ? 1 : 0, i);
        }

        public static void enableHttpInvokeApp(ContentResolver contentResolver, boolean z) {
            android.provider.Settings.Secure.putInt(contentResolver, HTTP_INVOKE_APP, z ? 1 : 0);
        }

        public static void enableUploadDebugLog(ContentResolver contentResolver, boolean z) {
            android.provider.Settings.Secure.putInt(contentResolver, UPLOAD_DEBUG_LOG, z ? 1 : 0);
        }

        public static void enableUserExperienceProgram(ContentResolver contentResolver, boolean z) {
            android.provider.Settings.Secure.putInt(contentResolver, UPLOAD_LOG, z ? 1 : 0);
        }

        public static boolean getBoolean(ContentResolver contentResolver, String str, boolean z) {
            return android.provider.Settings.Secure.getInt(contentResolver, str, z ? 1 : 0) != 0;
        }

        public static int getCtaSupported(ContentResolver contentResolver) {
            if (Build.IS_INTERNATIONAL_BUILD) {
                return 0;
            }
            return android.provider.Settings.Secure.getInt(contentResolver, TST_SUPPORT, -1);
        }

        public static long getDisableHybridIconTipTS(ContentResolver contentResolver) {
            return android.provider.Settings.Secure.getLong(contentResolver, TIMESTAMP_USER_DISABLE_HYBRID_ICON_TIP, -1);
        }

        public static int getSecondSpaceEntranceStatus(ContentResolver contentResolver, int i) {
            return android.provider.Settings.Secure.getIntForUser(contentResolver, SECOND_SPACE_ENTRANCE_STATUS, 1, i);
        }

        public static boolean hasCommonPassword(Context context) {
            return LockPatternUtilsWrapper.getActivePasswordQuality(context) != 0;
        }

        public static boolean isCommonPasswordEnabledForBusiness(Context context, String str) {
            boolean z = true;
            if (System.KEY_COMMON_PASSWORD_KEYGUARD.equals(str)) {
                if (LockPatternUtilsWrapper.getActivePasswordQuality(context) == 0) {
                    z = false;
                }
                return z;
            }
            if (android.provider.Settings.Secure.getInt(context.getContentResolver(), str, 0) == 0) {
                z = false;
            }
            return z;
        }

        public static boolean isFingerprintEnabledForBusiness(Context context, String str) {
            return android.provider.Settings.Secure.getInt(context.getContentResolver(), str, 0) == 2;
        }

        public static boolean isForceCloseDialogEnabled(Context context) {
            boolean z = false;
            try {
                if (1 == android.provider.Settings.Secure.getIntForUser(context.getContentResolver(), FORCE_CLOCE_DIALOG_ENABLED, -2)) {
                    z = true;
                }
                return z;
            } catch (SettingNotFoundException e) {
                if (!"user".equals(Build.TYPE) || Build.IS_DEVELOPMENT_VERSION || Build.IS_INTERNATIONAL_BUILD) {
                    z = true;
                }
                return z;
            }
        }

        public static boolean isGreenKidActive(ContentResolver contentResolver) {
            return android.provider.Settings.Secure.getInt(contentResolver, GREEN_KID_ACTIVE, 0) == 1;
        }

        public static boolean isHttpInvokeAppEnable(ContentResolver contentResolver) {
            return android.provider.Settings.Secure.getInt(contentResolver, HTTP_INVOKE_APP, 1) == 1;
        }

        public static boolean isOpenCrossUserNotification(ContentResolver contentResolver, int i) {
            return android.provider.Settings.Secure.getIntForUser(contentResolver, OPEN_CROSS_USER_NOTIFICATION, 1, i) != 0;
        }

        public static boolean isOpenSwitchUserNotification(ContentResolver contentResolver, int i) {
            return android.provider.Settings.Secure.getIntForUser(contentResolver, OPEN_SWITCH_USER_NOTIFICATION, 1, i) != 0;
        }

        public static boolean isSecureSpace(ContentResolver contentResolver) {
            return (UserHandle.myUserId() == 0 || android.provider.Settings.Secure.getInt(contentResolver, IS_SECOND_SPACE, 0) == 0) ? false : true;
        }

        public static boolean isTimeChangeDisallow(ContentResolver contentResolver) {
            return android.provider.Settings.Secure.getInt(contentResolver, TIME_CHANGE_DISALLOW, 0) == 1;
        }

        public static boolean isUploadDebugLogEnable(ContentResolver contentResolver) {
            return android.provider.Settings.Secure.getInt(contentResolver, UPLOAD_DEBUG_LOG, isUserExperienceProgramEnable(contentResolver) ? 1 : 0) == 1;
        }

        public static boolean isUserExperienceProgramEnable(ContentResolver contentResolver) {
            return android.provider.Settings.Secure.getInt(contentResolver, UPLOAD_LOG, Build.IS_DEVELOPMENT_VERSION ? 1 : 0) == 1;
        }

        public static void putBoolean(ContentResolver contentResolver, String str, boolean z) {
            android.provider.Settings.Secure.putInt(contentResolver, str, z ? 1 : 0);
        }

        static void recordAccessibilityModifications(ContentResolver contentResolver, String str, String str2, int i) {
            if ("enabled_accessibility_services".equals(str)) {
                String stringForUser = android.provider.Settings.Secure.getStringForUser(contentResolver, "enabled_accessibility_services", i);
                String[] split = stringForUser == null ? new String[0] : stringForUser.split(":");
                String[] split2 = str2 == null ? new String[0] : str2.split(":");
                for (String str3 : split) {
                    if (!TextUtils.isEmpty(str3)) {
                        boolean z = false;
                        int length = split2.length;
                        int i2 = 0;
                        while (true) {
                            if (i2 >= length) {
                                break;
                            } else if (str3.equals(split2[i2])) {
                                z = true;
                                break;
                            } else {
                                i2++;
                            }
                        }
                        if (!z) {
                            StringBuilder sb = new StringBuilder();
                            sb.append("disable_");
                            sb.append(str3.replaceAll("\\W", "_"));
                            android.provider.Settings.Secure.putStringForUser(contentResolver, sb.toString(), contentResolver.getPackageName(), i);
                        }
                    }
                }
                for (String str4 : split2) {
                    if (!TextUtils.isEmpty(str4)) {
                        boolean z2 = false;
                        int length2 = split.length;
                        int i3 = 0;
                        while (true) {
                            if (i3 >= length2) {
                                break;
                            } else if (split[i3].equals(str4)) {
                                z2 = true;
                                break;
                            } else {
                                i3++;
                            }
                        }
                        if (!z2) {
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("enable_");
                            sb2.append(str4.replaceAll("\\W", "_"));
                            android.provider.Settings.Secure.putStringForUser(contentResolver, sb2.toString(), contentResolver.getPackageName(), i);
                        }
                    }
                }
            }
        }

        public static void setCtaSupported(ContentResolver contentResolver, int i) {
            if (!Build.IS_INTERNATIONAL_BUILD) {
                android.provider.Settings.Secure.putInt(contentResolver, TST_SUPPORT, i);
            }
        }

        public static boolean setDisableHybridIconTipTS(ContentResolver contentResolver, long j) {
            return android.provider.Settings.Secure.putLong(contentResolver, TIMESTAMP_USER_DISABLE_HYBRID_ICON_TIP, j);
        }

        public static void setSecondSpaceEntranceStatus(ContentResolver contentResolver, boolean z, int i) {
            android.provider.Settings.Secure.putIntForUser(contentResolver, SECOND_SPACE_ENTRANCE_STATUS, z ? 1 : 0, i);
        }

        public static boolean setTimeChangeDisallow(ContentResolver contentResolver, boolean z) {
            return android.provider.Settings.Secure.putInt(contentResolver, TIME_CHANGE_DISALLOW, z ? 1 : 0);
        }

        public static void showApplyPasswordConfirmDialog(final Activity activity, final OnClickListener onClickListener, final String str, String str2) {
            AnonymousClass3 r0 = new OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    if (i == -1) {
                        android.provider.Settings.Secure.putInt(activity.getContentResolver(), str, 2);
                    }
                    if (onClickListener != null) {
                        onClickListener.onClick(dialogInterface, i);
                    }
                }
            };
            new Builder(activity).setCancelable(false).setIconAttribute(16843605).setTitle(activity.getString(285868207, new Object[]{str2})).setMessage(activity.getString(285868208, new Object[]{str2})).setPositiveButton(285868209, r0).setNegativeButton(285868203, r0).create().show();
        }

        private static void showConfirmDialog(Activity activity, OnClickListener onClickListener) {
            new Builder(activity).setCancelable(false).setIconAttribute(16843605).setTitle(285868205).setMessage(285868206).setPositiveButton(285868204, onClickListener).setNegativeButton(285868203, onClickListener).create().show();
        }

        public static void showSetPasswordConfirmDialog(final Activity activity, final OnClickListener onClickListener, final String str, final int i) {
            try {
                showConfirmDialog(activity, new OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        if (i == -1) {
                            activity.startActivityForResult(Secure.buildNewPasswordIntent(str), i);
                        }
                        if (onClickListener != null) {
                            onClickListener.onClick(dialogInterface, i);
                        }
                    }
                });
            } catch (Exception e) {
            }
        }

        public static void showSetPasswordConfirmDialog(final Fragment fragment, final OnClickListener onClickListener, final String str, final int i) {
            showConfirmDialog(fragment.getActivity(), new OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    if (i == -1) {
                        fragment.startActivityForResult(Secure.buildNewPasswordIntent(str), i);
                    }
                    if (onClickListener != null) {
                        onClickListener.onClick(dialogInterface, i);
                    }
                }
            });
        }
    }

    public static final class SettingsCloudData {
        public static final String PRODUCT_DATA = "productData";
        private static final Uri URI_CLOUD_ALL_DATA = Uri.parse("content://com.android.settings.cloud.CloudSettings/cloud_all_data");
        private static final Uri URI_CLOUD_ALL_DATA_NOTIFY = Uri.parse("content://com.android.settings.cloud.CloudSettings/cloud_all_data/notify");
        private static final Uri URI_CLOUD_ALL_DATA_SINGLE = Uri.parse("content://com.android.settings.cloud.CloudSettings/cloud_all_data/single");

        public static class CloudData implements Parcelable {
            public static final Creator<CloudData> CREATOR = new Creator<CloudData>() {
                public CloudData createFromParcel(Parcel parcel) {
                    return new CloudData(parcel.readString());
                }

                public CloudData[] newArray(int i) {
                    return new CloudData[i];
                }
            };
            private String data;
            private JSONObject json;

            public CloudData(String str) {
                this.data = str;
            }

            private boolean hasKey(String str) throws JSONException {
                initJson();
                return this.json.has(str);
            }

            private void initJson() throws JSONException {
                if (this.json == null) {
                    this.json = new JSONObject(this.data);
                }
            }

            public int describeContents() {
                return 0;
            }

            public boolean equals(Object obj) {
                boolean z = true;
                if (obj == this) {
                    return true;
                }
                if (!(obj instanceof CloudData)) {
                    return false;
                }
                CloudData cloudData = (CloudData) obj;
                if (this.data != cloudData.data && (this.data == null || !this.data.equals(cloudData.data))) {
                    z = false;
                }
                return z;
            }

            public boolean getBoolean(String str, boolean z) {
                try {
                    if (hasKey(str)) {
                        return this.json.getBoolean(str);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return z;
            }

            public int getInt(String str, int i) {
                try {
                    if (hasKey(str)) {
                        return this.json.getInt(str);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return i;
            }

            public long getLong(String str, long j) {
                try {
                    if (hasKey(str)) {
                        return this.json.getLong(str);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return j;
            }

            public String getString(String str, String str2) {
                try {
                    if (hasKey(str)) {
                        return this.json.getString(str);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return str2;
            }

            public int hashCode() {
                if (this.data != null) {
                    return this.data.hashCode();
                }
                return 0;
            }

            public JSONObject json() {
                try {
                    initJson();
                    return this.json;
                } catch (JSONException e) {
                    e.printStackTrace();
                    return null;
                }
            }

            public String toString() {
                return this.data.toString();
            }

            public void writeToParcel(Parcel parcel, int i) {
                parcel.writeString(this.data);
            }
        }

        public static boolean getCloudDataBoolean(ContentResolver contentResolver, String str, String str2, boolean z) {
            CloudData cloudDataSingle = getCloudDataSingle(contentResolver, str, null, null, false);
            return cloudDataSingle != null ? cloudDataSingle.getBoolean(str2, z) : z;
        }

        public static int getCloudDataInt(ContentResolver contentResolver, String str, String str2, int i) {
            CloudData cloudDataSingle = getCloudDataSingle(contentResolver, str, null, null, false);
            return cloudDataSingle != null ? cloudDataSingle.getInt(str2, i) : i;
        }

        public static List<CloudData> getCloudDataList(ContentResolver contentResolver, String str) {
            Cursor cursor = null;
            try {
                cursor = contentResolver.query(URI_CLOUD_ALL_DATA, new String[]{str}, null, null, null);
                if (cursor != null) {
                    Bundle extras = cursor.getExtras();
                    if (extras != null && !extras.isEmpty()) {
                        ArrayList parcelableArrayList = cursor.getExtras().getParcelableArrayList(PRODUCT_DATA);
                        IOUtils.closeQuietly((Closeable) cursor);
                        return parcelableArrayList;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            } catch (Throwable th) {
                IOUtils.closeQuietly((Closeable) null);
                throw th;
            }
            IOUtils.closeQuietly((Closeable) cursor);
            return null;
        }

        public static long getCloudDataLong(ContentResolver contentResolver, String str, String str2, long j) {
            CloudData cloudDataSingle = getCloudDataSingle(contentResolver, str, null, null, false);
            return cloudDataSingle != null ? cloudDataSingle.getLong(str2, j) : j;
        }

        public static Uri getCloudDataNotifyUri() {
            return URI_CLOUD_ALL_DATA_NOTIFY;
        }

        public static CloudData getCloudDataSingle(ContentResolver contentResolver, String str, String str2, String str3, boolean z) {
            if (str == null) {
                throw new NullPointerException("moduleName is null");
            } else if (!z || !(str2 == null || str3 == null)) {
                Cursor cursor = null;
                try {
                    cursor = contentResolver.query(URI_CLOUD_ALL_DATA_SINGLE, new String[]{str, str2, str3, String.valueOf(z)}, null, null, null);
                    if (cursor != null) {
                        Bundle extras = cursor.getExtras();
                        if (extras != null && !extras.isEmpty()) {
                            CloudData cloudData = (CloudData) cursor.getExtras().getParcelable(PRODUCT_DATA);
                            IOUtils.closeQuietly((Closeable) cursor);
                            return cloudData;
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } catch (Throwable th) {
                    IOUtils.closeQuietly((Closeable) null);
                    throw th;
                }
                IOUtils.closeQuietly((Closeable) cursor);
                return null;
            } else {
                throw new NullPointerException("Want cache, but key or propertyName is null");
            }
        }

        public static String getCloudDataString(ContentResolver contentResolver, String str, String str2, String str3) {
            CloudData cloudDataSingle = getCloudDataSingle(contentResolver, str, null, null, false);
            return cloudDataSingle != null ? cloudDataSingle.getString(str2, str3) : str3;
        }
    }

    public static final class SilenceMode {
        protected static final boolean DEBUG_MODE = Log.isLoggable("SilenceMode.MOD", 3);
        public static final String LASTEST_MODE = "default_mode";
        public static final String[] MISTAT_RINGERMODE_LIST = {"normal", "DND", TEDefine.FACE_BEAUTY_NULL, "silence", "new"};
        public static final String MISTAT_SILENCE_DND = "silence_DND";
        public static final int MIUI_ALARMS = 3;
        public static final int MIUI_IMPORTANT_INTERRUPTIONS = 1;
        public static final int MIUI_NO_INTERRUPTIONS = 2;
        public static final String MUTE_MUSIC = "mute_music";
        public static final String MUTE_MUSIC_AT_SILENT = "mute_music_at_silent";
        public static final String MUTE_VOICEASSIST_AT_SILENT = "mute_voiceassit_at_silent";
        public static final int NORMAL = 0;
        public static final String REMAIN_TIME = "remain_time";
        public static final String SHOW_NOTIFICATION = "show_notification";
        public static final String SILENCE_MODE = "zen_mode";
        private static final String TAG = "SilenceMode";
        public static final String VIP_ENABLE = "vip_enable";
        public static final String VOLUME_MUSIC_BEFORE_MUTE = "volume_music_before_mute";
        public static final int ZEN_MODE_MIUI_SILENT = 4;
        public static final boolean isSupported = (VERSION.SDK_INT >= 23);

        public static void enableVIPMode(Context context, boolean z) {
            ExtraNotificationManager.enableVIPMode(context, z, -3);
        }

        public static void enableVIPMode(Context context, boolean z, int i) {
            ExtraNotificationManager.enableVIPMode(context, z, i);
        }

        public static int getLastestQuietMode(Context context) {
            return 4;
        }

        public static long getRemainTime(Context context) {
            return ExtraNotificationManager.getRemainTime(context);
        }

        public static int getZenMode(Context context) {
            return ExtraNotificationManager.getZenMode(context);
        }

        public static boolean isDNDEnabled(Context context) {
            return getZenMode(context) == 1;
        }

        public static boolean isSilenceModeEnable(Context context) {
            return !isSupported ? AntiSpam.isQuietModeEnable(context) : ExtraNotificationManager.isSilenceModeEnable(context, -3);
        }

        public static boolean isSilenceModeEnable(Context context, int i) {
            return ExtraNotificationManager.isSilenceModeEnable(context, i);
        }

        public static boolean isVIPModeEnable(Context context) {
            return ExtraNotificationManager.isVIPModeEnable(context);
        }

        public static boolean muteMusicStream(Context context) {
            return getZenMode(context) == 1 && 1 == android.provider.Settings.System.getIntForUser(context.getContentResolver(), MUTE_MUSIC, 1, -3);
        }

        public static void reportRingerModeInfo(String str, String str2, String str3, long j) {
            StringBuilder sb = new StringBuilder();
            sb.append("type=");
            sb.append(str);
            sb.append(";");
            sb.append("mode=");
            sb.append(str2);
            sb.append(";");
            sb.append("params=");
            sb.append(str3);
            sb.append(";");
            sb.append("time=");
            sb.append(j);
            sb.append(";");
            if (DEBUG_MODE) {
                String str4 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("reportRingerModeInfo:");
                sb2.append(sb.toString());
                Log.d(str4, sb2.toString());
            }
            MQSEventManagerDelegate.getInstance().reportSimpleEvent(77, sb.toString());
        }

        public static void setRemainTime(Context context, long j) {
            android.provider.Settings.Secure.putLong(context.getContentResolver(), REMAIN_TIME, j);
        }

        public static void setSilenceMode(Context context, int i, Uri uri) {
            ExtraNotificationManager.setSilenceMode(context, i, uri);
        }

        public static void setSilenceMode(Context context, int i, Uri uri, int i2) {
            ExtraNotificationManager.setSilenceMode(context, i, uri);
        }

        public static boolean showNotification(Context context) {
            return getZenMode(context) == 1 && 1 == android.provider.Settings.System.getIntForUser(context.getContentResolver(), SHOW_NOTIFICATION, 1, -3);
        }
    }

    public static class System extends android.provider.SystemSettings.System {
        public static final String ACTIVITY_RESOLVE_ORDER = "activity_resolve_order";
        private static final String ACTIVITY_RESOLVE_ORDER_DELIMETER = ",";
        public static final String AI_PRELOAD_USER_STATE = "ai_preload_user_state";
        public static final String ALWAYS_ENABLE_MMS = "always_enable_mms";
        public static final String ANR_PACKAGES = "anr_pkgs";
        public static final String AUTO_DUAL_CLOCK = "auto_dual_clock";
        public static final String AUTO_TEST_MODE_ENABLE = "auto_test_mode_on";
        public static final String BATTERY_INDICATOR_STYLE = "battery_indicator_style";
        public static final int BATTERY_INDICATOR_STYLE_DEFAULT = 1;
        public static final int BATTERY_INDICATOR_STYLE_GRAPHIC = 0;
        public static final int BATTERY_INDICATOR_STYLE_NUMBER = 1;
        public static final int BATTERY_INDICATOR_STYLE_NUMBER_NEXT_TO_ICON = 3;
        public static final int BATTERY_INDICATOR_STYLE_TOP = 2;
        public static final String BATTERY_LEVEL_LOW_CUSTOMIZED = "battery_level_low_customized";
        public static final String BREATHING_LIGHT_COLOR = "breathing_light_color";
        public static final String BREATHING_LIGHT_FREQ = "breathing_light_freq";
        public static final String CALENDAR_ALERT = "calendar_alert";
        public static final String CALL_BREATHING_LIGHT_COLOR = "call_breathing_light_color";
        public static final int CALL_BREATHING_LIGHT_COLOR_DEFAULT = 255;
        public static final String CALL_BREATHING_LIGHT_FREQ = "call_breathing_light_freq";
        public static final int CALL_BREATHING_LIGHT_FREQ_DEFAULT = 2;
        public static final String CAMERA_KEY_PREFERRED_ACTION_APP_COMPONENT = "camera_key_preferred_action_app_component";
        public static final String CAMERA_KEY_PREFERRED_ACTION_SHORTCUT_ID = "camera_key_preferred_action_shortcut_id";
        public static final int CAMERA_KEY_PREFERRED_ACTION_SHORTCUT_ID_CALL = 3;
        public static final int CAMERA_KEY_PREFERRED_ACTION_SHORTCUT_ID_HOME = 0;
        public static final int CAMERA_KEY_PREFERRED_ACTION_SHORTCUT_ID_SCREENSHOT = 1;
        public static final int CAMERA_KEY_PREFERRED_ACTION_SHORTCUT_ID_SEARCH = 2;
        public static final int CAMERA_KEY_PREFERRED_ACTION_SHORTCUT_ID_WAKE = 4;
        public static final String CAMERA_KEY_PREFERRED_ACTION_TOGGLE_ID = "camera_key_preferred_action_toggle_id";
        public static final String CAMERA_KEY_PREFERRED_ACTION_TYPE = "camera_key_preferred_action_type";
        public static final int CAMERA_KEY_PREFERRED_ACTION_TYPE_APP = 3;
        public static final int CAMERA_KEY_PREFERRED_ACTION_TYPE_DEFAULT = 0;
        public static final int CAMERA_KEY_PREFERRED_ACTION_TYPE_NONE = 0;
        public static final int CAMERA_KEY_PREFERRED_ACTION_TYPE_SHORTCUT = 1;
        public static final int CAMERA_KEY_PREFERRED_ACTION_TYPE_TOGGLE = 2;
        public static final String CDMA_PRECISE_ANSWER_STATE = "cdma_precise_answer_state";
        public static final int CDMA_PRECISE_ANSWER_STATE_DEFAULT = 1;
        public static final int CDMA_PRECISE_ANSWER_STATE_DISABLE = 0;
        public static final int CDMA_PRECISE_ANSWER_STATE_ENABLE = 1;
        private static final String CN_OPERATOR = "460";
        public static final String CONFIG_NETWORK_PRIORITY_SUPPORT = "sys.net.support.netprio";
        public static final String CURRENT_LIVE_WALLPAPER_PACKAGENAME = "current_live_wallpaper_packagename";
        public static final String DANGEROUS_OPTIONS_HINT = "dangerous_option_hint";
        public static final String DATA_AND_WIFI_ROAM = "data_and_wifi_roam";
        public static final int DATA_AND_WIFI_ROAM_DEFAULT = 0;
        public static final String DEFAULT_ALARM_ALERT = "default_alarm_alert";
        public static final Uri DEFAULT_CALENDAR_ALERT_URI = android.provider.Settings.System.getUriFor(CALENDAR_ALERT);
        public static final boolean DEFAULT_ENABLE_DEMO_MODE = false;
        public static final Uri DEFAULT_RINGTONE_URI_SLOT_1 = android.provider.Settings.System.getUriFor(RINGTONE_SOUND_SLOT_1);
        public static final Uri DEFAULT_RINGTONE_URI_SLOT_2 = android.provider.Settings.System.getUriFor(RINGTONE_SOUND_SLOT_2);
        public static final int DEFAULT_SCREEN_BUTTONS_TIMEOUT = 5000;
        public static final Uri DEFAULT_SMS_DELIVERED_RINGTONE_URI = android.provider.Settings.System.getUriFor(SMS_DELIVERED_SOUND);
        public static final Uri DEFAULT_SMS_DELIVERED_SOUND_URI_SLOT_1 = android.provider.Settings.System.getUriFor(SMS_DELIVERED_SOUND_SLOT_1);
        public static final Uri DEFAULT_SMS_DELIVERED_SOUND_URI_SLOT_2 = android.provider.Settings.System.getUriFor(SMS_DELIVERED_SOUND_SLOT_2);
        public static final Uri DEFAULT_SMS_RECEIVED_RINGTONE_URI = android.provider.Settings.System.getUriFor(SMS_RECEIVED_SOUND);
        public static final Uri DEFAULT_SMS_RECEIVED_SOUND_URI_SLOT_1 = android.provider.Settings.System.getUriFor(SMS_RECEIVED_SOUND_SLOT_1);
        public static final Uri DEFAULT_SMS_RECEIVED_SOUND_URI_SLOT_2 = android.provider.Settings.System.getUriFor(SMS_RECEIVED_SOUND_SLOT_2);
        public static final boolean DEFAULT_TOUCH_SENSITIVE = false;
        public static final String DELETE_SOUND_EFFECT = "delete_sound_effect";
        public static final String DIAL_PAD_TOUCH_TONE = "dial_pad_touch_tone";
        public static final int DIAL_PAD_TOUCH_TONE_DEFAULT = -1;
        public static final int DIAL_PAD_TOUCH_TONE_HUMAN = 1;
        public static final int DIAL_PAD_TOUCH_TONE_PIANO = 0;
        public static final String DISABLE_WIFI_AUTO_CONNECT_SSID = "disable_wifi_auto_connect_ssid";
        public static final String DRIVE_MODE_CALLING_AUTO_SMS_REPLY = "drive_mode_calling_auto_sms_reply";
        public static final String DRIVE_MODE_DRIVE_MODE = "drive_mode_drive_mode";
        public static final String DRIVE_MODE_INVERT_STOP_REPORT = "drive_mode_invert_stop_report";
        public static final String DRIVE_MODE_ONLY_CONTACT_REPLY = "drive_mode_only_contact_reply";
        public static final String DRIVE_MODE_PHONE_REPORT = "drive_mode_phone_report";
        public static final String DRIVE_MODE_SMS_AUTO_REPLY_CONTENT = "drive_mode_sms_auto_reply_content";
        public static final String DRIVE_MODE_SMS_AUTO_SMS_REPLY = "drive_mode_sms_auto_sms_reply";
        public static final String DRIVE_MODE_SMS_REPORT = "drive_mode_sms_report";
        public static final String EDGE_HANDGRIP_MODE = "edge_handgrip";
        public static final String EDGE_HANDGRIP_MODE_BACK = "edge_handgrip_back";
        public static final String EDGE_HANDGRIP_MODE_CLEAN = "edge_handgrip_clean";
        public static final String EDGE_HANDGRIP_MODE_PHOTO = "edge_handgrip_photo";
        public static final String EDGE_HANDGRIP_MODE_SCREENSHOT = "edge_handgrip_screenshot";
        public static final String ENABLE_AUTO_DISABLE_SCREEN_ROTATION = "enable_auto_disable_screen_rotation";
        public static final String ENABLE_DEMO_MODE = "enable_demo_mode";
        public static final String ENABLE_SCREEN_ON_PROXIMITY_SENSOR = "enable_screen_on_proximity_sensor";
        public static final String ENABLE_SNAPSHOT_SCREENLOCK = "enable_snapshot_screenlock";
        public static final int ENABLE_SNAPSHOT_SCREENLOCK_DEFAULT = 0;
        public static final String ENABLE_TELOCATION = "enable_telocation";
        public static final int ENABLE_TELOCATION_DEFAULT = 1;
        public static final int FINGERPRINT_NAV_ACTION_HOME = 1;
        public static final int FINGERPRINT_NAV_ACTION_NONE = 0;
        public static final String FINGERPRINT_NAV_CENTER_ACTION = "fingerprint_nav_center_action";
        public static final String FLASH_WHEN_RING_ENABLED = "flash_when_ring_enabled";
        public static final boolean FLASH_WHEN_RING_ENABLED_DEFAULT = false;
        public static final String GESTURE_WAKEUP_MODE = "gesture_wakeup";
        public static final String HANDY_MODE_ENTER_DIRECT = "handy_mode_enter_direct";
        public static final String HANDY_MODE_SIZE = "handy_mode_size";
        public static final String HANDY_MODE_STATE = "handy_mode_state";
        public static final String HAPTIC_FEEDBACK_LEVEL = "haptic_feedback_level";
        public static final int HAPTIC_FEEDBACK_LEVEL_DEFAULT = SystemProperties.getInt("ro.haptic.default_level", 1);
        public static final int HAPTIC_FEEDBACK_LEVEL_MAX = 2;
        public static final int HAPTIC_FEEDBACK_LEVEL_MIN = 0;
        public static final boolean HAS_DELETE_SOUND_EFFECT_DEFAULT = true;
        public static final String HAS_FOLLOWED_MIPUB = "has_followed_mipub";
        public static final String HAS_SCREENSHOT_SOUND = "has_screenshot_sound";
        public static final boolean HAS_SCREENSHOT_SOUND_DEFAULT = true;
        public static final String HOTSOPT_MAC_BLACK_SET = "hotspot_mac_black_set";
        public static final String HOTSOPT_MAX_STATION_NUM = "hotspot_max_station_num";
        public static final String HOTSOPT_VENDOR_SPECIFIC = "hotspot_vendor_specific";
        public static final String IS_SECURITY_ENCRYTPION_ENABLED = "is_security_encryption_enabled";
        public static final String IS_SHOW_THREE_GESTURE_ALERT = "is_show_three_gesture_alert";
        public static final String KEEP_LAUNCHER_IN_MEMORY = "keep_launcher_in_memory";
        public static final int KEEP_LAUNCHER_IN_MEMORY_DEFAULT = 1;
        public static final String KEYGUARD_DISABLE_POWER_KEY_LONG_PRESS = "keyguard_disable_power_key_long_press";
        public static final int KEYGUARD_DISABLE_POWER_KEY_LONG_PRESS_DEFAULT = 0;
        public static final String KEYGUARD_LEFT_FUNCTION_CHOOSER = "keyguard_left_function_chooser";
        public static final String KEYGUARD_LEFT_FUNCTION_ENABLED = "keyguard_left_function_enabled";
        public static final String KEYGUARD_RIGHT_FUNCTION_CHOOSER = "keyguard_right_function_chooser";
        public static final String KEYGUARD_RIGHT_FUNCTION_ENABLED = "keyguard_right_function_enabled";
        public static final String KEY_AUTO_DISABLE_SCREEN_BUTTON = "auto_disable_screen_button";
        public static final String KEY_COMMON_PASSWORD_CHILDRENMODE = "childrenmode";
        public static final String KEY_COMMON_PASSWORD_KEYGUARD = "miui_keyguard";
        public static final String KEY_FUNCTION_LIMIT_SWITCH = "persist.sys.func_limit_switch";
        public static final String KEY_IN_SMALL_WINDOW_MODE = "is_small_window";
        public static final String KEY_MIDROP_ENABLED = "key_midrop_enabled";
        public static final String KEY_SECURITY_CENTER_ALLOW_CONNECT_NETWORK = "persist.sys.sc_allow_conn";
        public static final String KEY_TOUCH_ASSISTANT_ENABLED = "touch_assistant_enabled";
        public static final String KEY_TOUCH_ASSISTANT_SHOW_ON_KEYGUARD = "touch_assistant_show_on_keyguard";
        public static final String KEY_TOUCH_ASSISTANT_TEMPORARY = "touch_assistant_temporary";
        public static final String KEY_WAKEUP_FOR_KEYGUARD_NOTIFICATION = "wakeup_for_keyguard_notification";
        public static final String LAST_AUDIBLE_RING_VOLUME = "last_audible_ring_volume";
        public static final String LAST_VALID_DEVICE_ID = "last_valid_device_id";
        public static final String LOCAL_SEA_LEVEL_PRESSURE = "persist.sea_level_pres";
        public static final String LOCKED_APPS = "locked_apps";
        public static final String MEMORY_LOW_THRESHOLD_PROPERTY = "sys.memory.threshold.low";
        public static final String MIUI_ACCOUNT_LOGIN_CHECK = "miui_account_login_check";
        public static final String MIUI_HOME_ENABLE_AUTO_FILL_EMPTY_CELLS = "miui_home_enable_auto_fill_empty_cells";
        public static final String MIUI_HOME_LOCK_SCREEN_CELLS = "miui_home_lock_screen_cells";
        public static final String MIUI_HOME_SCREEN_CELLS_SIZE = "miui_home_screen_cells_size";
        public static final String MIUI_PERMISSION_CHECK = "miui_permission_check";
        public static final String MIUI_POPUP_GESTURE_CHECK = "miui_popup_gesture_check";
        public static final String MIUI_POPUP_LED_CHECK = "miui_popup_led_check";
        public static final String MIUI_POPUP_SOUND_CHECK = "miui_popup_sound_check";
        public static final int MIUI_POPUP_SOUND_DEFAULT = 0;
        public static final String MIUI_POPUP_SOUND_INDEX = "miui_popup_sound_index";
        public static final String MIUI_RECENTS_PRIVACY_THUMBNAIL_BLUR = "miui_recents_privacy_thumbnail_blur";
        public static final String MIUI_RECENTS_SHOW_MEM_INFO = "miui_recents_show_mem_info";
        public static final String MIUI_RECENTS_SHOW_RECOMMEND = "miui_recents_show_recommend";
        public static final String MIUI_SLIDER_COVER_STATUS = "sc_status";
        public static final String MIUI_SLIDER_HISTORY_COUNT = "miui_slider_history_count";
        public static final String MIUI_SLIDER_LAUNCH_PKG = "miui_slider_launch_pkg";
        public static final String MIUI_SLIDER_SOUND_CHECK = "miui_slider_sound_check";
        public static final String MIUI_SLIDER_SOUND_CLOSE = "miui_slider_sound_close";
        public static final int MIUI_SLIDER_SOUND_DEFAULT = 0;
        public static final String MIUI_SLIDER_SOUND_INDEX = "miui_slider_sound_index";
        public static final int MIUI_SLIDER_SOUND_ONLINE = -1;
        public static final String MIUI_SLIDER_SOUND_OPEN = "miui_slider_sound_open";
        public static final String MIUI_SLIDER_TOOL_CHOICE = "miui_slider_tool_choice";
        public static final int MIUI_SLIDER_TOOL_DRAWER = 2;
        public static final int MIUI_SLIDER_TOOL_LAUNCH_APP = 3;
        public static final int MIUI_SLIDER_TOOL_NONE = 0;
        public static final int MIUI_SLIDER_TOOL_SELFIE = 1;
        public static final String MIUI_SLIDER_VIDEO_BOX = "gb_videobox";
        public static final String MMS_BREATHING_LIGHT_COLOR = "mms_breathing_light_color";
        public static final String MMS_BREATHING_LIGHT_FREQ = "mms_breathing_light_freq";
        public static final String MMS_PRIVATE_ADDRESS_MARKER = "mms_private_address_marker";
        public static final String MMS_SYNC_WILD_MSG_STATE = "mms_sync_wild_msg_state";
        public static final int MMS_SYNC_WILD_MSG_STATE_DONE = 3;
        public static final int MMS_SYNC_WILD_MSG_STATE_DOWNLOAD_PENDING = 2;
        public static final int MMS_SYNC_WILD_MSG_STATE_INIT = 0;
        public static final int MMS_SYNC_WILD_MSG_STATE_MSG_FOUND = 1;
        public static final int MMS_SYNC_WILD_MSG_STATE_UPGRADE = 4;
        public static final int MMS_SYNC_WILD_MSG_STATE_UPGRADE_SIM = 5;
        public static final String MMS_SYNC_WILD_NUMBERS = "mms_sync_wild_numbers";
        public static final String MMS_THREAD_MARKER = "mms_thread_marker";
        public static final String MMS_UPLOAD_OLD_MSG_ACCOUNTS = "mms_upload_old_msg_accounts";
        public static final String MMS_UPLOAD_OLD_MSG_STATE = "mms_upload_old_msg_state";
        public static final int MMS_UPLOAD_OLD_MSG_STATE_INIT = 0;
        public static final int MMS_UPLOAD_OLD_MSG_STATE_NEED_PROMPT = 1;
        public static final String NEED_RESET_SCREEN_OFF_TIMEOUT = "need_reset_screen_off_timeout";
        public static final int NETWORK_TRAFFIC_POLICY_MODE_CLOSED = 0;
        public static final int NETWORK_TRAFFIC_POLICY_MODE_FAST = 2;
        public static final int NETWORK_TRAFFIC_POLICY_MODE_NORMAL = 1;
        public static final String NEW_NUMERIC_PASSWORD_TYPE = "new_numeric_password_type";
        public static final String NEXT_ALARM_CLOCK_FORMATTED = "next_alarm_clock_formatted";
        public static final int NOTIFICATION_STYLE_GOOGLE = 1;
        public static final int NOTIFICATION_STYLE_MIUI = 0;
        public static final String PACKAGE_DELETE_BY_RESTORE_PHONE = "package_delete_by_restore_phone";
        public static final String PERSIST_SYS_LINE_BREAKING = "persist.sys.line_breaking";
        public static final String PICK_UP_GESTURE_WAKEUP_MODE = "pick_up_gesture_wakeup_mode";
        public static final String POWER_MODE = "power_mode";
        public static final String POWER_MODE_KEY_PROPERTY = "persist.sys.aries.power_profile";
        public static final String[] POWER_MODE_VALUES = {"high", "middle"};
        public static final String POWER_MODE_VALUE_DEFAULT = "middle";
        public static final String POWER_MODE_VALUE_HIGH = "high";
        public static final String POWER_MODE_VALUE_LOW = "low";
        public static final String POWER_MODE_VALUE_MIDDLE = "middle";
        public static final String PRIVATE_SMS_NOTIFICATION_ENABLED = "pref_key_enable_private_notification";
        public static final Set<String> PUBLIC_SETTINGS = new ArraySet();
        public static final String RANDOM_NOTE_MODE_MUTE_TIME_INTERVAL_MS = "random_note_mode_mute_time_interval_ms";
        public static final String RANDOM_NOTE_MODE_RANDOM_SOUND_NUMBER = "random_note_mode_random_sound_number";
        public static final String RANDOM_NOTE_MODE_SEQUENCE_SOUND_NUMBER = "random_note_mode_sequence_sound_number";
        public static final String RANDOM_NOTE_MODE_SEQUENCE_TIME_INTERVAL_MS = "random_note_mode_sequence_time_interval_ms";
        public static final String RECENT_APPS_KEY_SHOW = "recent_apps_key_show";
        public static final String REMOTE_CONTROL_PACKAGE_NAME = "remote_control_pkg_name";
        public static final String REMOTE_CONTROL_PROCESS_NAME = "remote_control_proc_name";
        public static final String RESIDENT_ID = "resident_id";
        public static final String RESIDENT_TIMEZONE = "resident_timezone";
        public static final String RINGTONE_SOUND_SLOT_1 = "ringtone_sound_slot_1";
        public static final String RINGTONE_SOUND_SLOT_2 = "ringtone_sound_slot_2";
        public static final String RINGTONE_SOUND_USE_UNIFORM = "ringtone_sound_use_uniform";
        public static final String SCREENSHOT_NOTIFICATION_ENABLED = "screenshot_notification_enabled";
        public static final String SCREEN_BUTTONS_TIMEOUT = "screen_buttons_timeout";
        public static final int SCREEN_KEY_BACK = 3;
        public static final int SCREEN_KEY_COUNT = 4;
        public static final int SCREEN_KEY_HOME = 1;
        public static final String SCREEN_KEY_LONG_PRESS_ACTION_CLOSE_APP = "close_app";
        public static final String SCREEN_KEY_LONG_PRESS_ACTION_GOOGLE_NOW = "google_now";
        public static final String SCREEN_KEY_LONG_PRESS_ACTION_NONE = "none";
        public static final String SCREEN_KEY_LONG_PRESS_ACTION_QUICK_SEARCH = "quick_search";
        public static final String SCREEN_KEY_LONG_PRESS_ACTION_RECENT_PANEL = "recent_panel";
        public static final String SCREEN_KEY_LONG_PRESS_ACTION_SHOW_MENU = "show_menu";
        public static final String SCREEN_KEY_LONG_PRESS_ACTION_VOICE_ASSISTANT = "voice_assistant";
        public static final String SCREEN_KEY_LONG_PRESS_APP_SWITCH = "screen_key_long_press_app_switch";
        public static final String SCREEN_KEY_LONG_PRESS_BACK = "screen_key_long_press_back";
        public static final String SCREEN_KEY_LONG_PRESS_HOME = "screen_key_long_press_home";
        public static final String SCREEN_KEY_LONG_PRESS_MENU = "screen_key_long_press_menu";
        public static final String SCREEN_KEY_LONG_PRESS_TIMEOUT = "screen_key_long_press_timeout";
        public static final int SCREEN_KEY_LONG_PRESS_TIMEOUT_DEFAULT = 500;
        public static final int SCREEN_KEY_MENU = 0;
        public static final String SCREEN_KEY_ORDER = "screen_key_order";
        public static final String SCREEN_KEY_PRESS_APP_SWITCH = "screen_key_press_app_switch";
        public static final boolean SCREEN_KEY_PRESS_APP_SWITCH_DEFAULT = true;
        public static final int SCREEN_KEY_RECENT_APPS = 2;
        public static final String SCREEN_OFF_BY_LID_PROPERTY_STRING = "sys.keyguard.screen_off_by_lid";
        public static final String SHOW_LOCK_BEFORE_UNLOCK = "show_lock_before_unlock";
        public static final boolean SHOW_LOCK_BEFORE_UNLOCK_DEFAULT = (!Build.IS_CM_CUSTOMIZATION_TEST);
        public static final String SHOW_ROUNDED_CORNERS = "show_rounded_corners";
        public static final String SHUTDOWN_ALARM_CLOCK_OFFSET = "shutdown_alarm_clock_offset";
        private static final String SIMPLE_MODE = "simple_mode";
        public static final int SMARTCOVER_DISABLED = 0;
        public static final int SMARTCOVER_FULL_MODE = 4;
        public static final String SMARTCOVER_GUIDE_KEY = "smart_cover_key";
        public static final int SMARTCOVER_LATTICE_MODE = 3;
        public static final int SMARTCOVER_MODE_DEFAULT_VALUE = -1;
        public static final String SMARTCOVER_MODE_KEY = "persist.sys.smartcover_mode";
        public static final int SMARTCOVER_NORMAL_MODE = 1;
        public static final int SMARTCOVER_SMALLWINDOW_MODE = 2;
        public static final String SMARTCOVER_SMALLWIN_TYPE = "persist.sys.smallwin_type";
        public static final String SMS_DELIVERED_SOUND = "sms_delivered_sound";
        public static final String SMS_DELIVERED_SOUND_SLOT_1 = "sms_delivered_sound_slot_1";
        public static final String SMS_DELIVERED_SOUND_SLOT_2 = "sms_delivered_sound_slot_2";
        public static final String SMS_DELIVERED_SOUND_USE_UNIFORM = "sms_delivered_sound_use_uniform";
        public static final String SMS_NOTIFICATION_BODY_ENABLED = "pref_key_enable_notification_body";
        public static final String SMS_NOTIFICATION_ENABLED = "pref_key_enable_notification";
        public static final String SMS_RECEIVED_SOUND = "sms_received_sound";
        public static final String SMS_RECEIVED_SOUND_SLOT_1 = "sms_received_sound_slot_1";
        public static final String SMS_RECEIVED_SOUND_SLOT_2 = "sms_received_sound_slot_2";
        public static final String SMS_RECEIVED_SOUND_USE_UNIFORM = "sms_received_sound_use_uniform";
        public static final String SMS_WAKE_UP_SCREEN_ENABLED = "pref_key_enable_wake_up_screen";
        public static final String STATUS_BAR_COLLAPSE_AFTER_CLICKED = "status_bar_collapse_after_clicked";
        public static final String STATUS_BAR_CUSTOM_CARRIER = "status_bar_custom_carrier";
        public static final String STATUS_BAR_EXPANDABLE_UNDER_FULLSCREEN = "status_bar_expandable_under_fullscreen";
        public static final String STATUS_BAR_EXPANDABLE_UNDER_KEYGUARD = "status_bar_expandable_under_keyguard";
        public static final String STATUS_BAR_IN_CALL_NOTIFICATION_FLOATING = "status_bar_in_call_notification_floating";
        public static final String STATUS_BAR_NOTIFICATION_STYLE = "status_bar_notification_style";
        public static final String STATUS_BAR_REAL_CARRIER = "status_bar_real_carrier";
        public static final String STATUS_BAR_SHOW_CARRIER_UNDER_KEYGUARD = "status_bar_show_carrier_under_keyguard";
        public static final String STATUS_BAR_SHOW_CUSTOM_CARRIER = "status_bar_show_custom_carrier";
        public static final String STATUS_BAR_SHOW_NETWORK_ASSISTANT = "status_bar_show_network_assistant";
        public static final int STATUS_BAR_SHOW_NETWORK_ASSISTANT_DEFAULT = 0;
        public static final String STATUS_BAR_SHOW_NETWORK_SPEED = "status_bar_show_network_speed";
        public static final int STATUS_BAR_SHOW_NETWORK_SPEED_DEFAULT = 0;
        public static final String STATUS_BAR_SHOW_NOTIFICATION_ICON = "status_bar_show_notification_icon";
        public static final int STATUS_BAR_SHOW_NOTIFICATION_ICON_DEFAULT = ((Build.IS_CTA_BUILD || Build.IS_CM_CUSTOMIZATION_TEST || Build.IS_CU_CUSTOMIZATION_TEST || "mx_telcel".equals(SystemProperties.get("ro.miui.customized.region", ""))) ? 1 : 0);
        public static final String STATUS_BAR_STYLE = "status_bar_style_type";
        public static final int STATUS_BAR_STYLE_DEFAULT = 0;
        public static final int STATUS_BAR_STYLE_LIST = 0;
        public static final int STATUS_BAR_STYLE_PAGE = 1;
        public static final String STATUS_BAR_TOGGLE_LIST = "status_bar_toggle_list_order_new";
        public static final String STATUS_BAR_TOGGLE_PAGE = "status_bar_toggle_page_order";
        public static final String STATUS_BAR_UPDATE_NETWORK_SPEED_INTERVAL = "status_bar_network_speed_interval";
        public static final int STATUS_BAR_UPDATE_NETWORK_SPEED_INTERVAL_DEFAULT = 4000;
        public static final String SYSTEM_NEW_VERSION_FOUND = "system_new_version_found";
        public static final String T9_INDEXING_KEY = "t9_indexing_key";
        public static final int T9_INDEXING_KEY_PINYIN = 0;
        public static final int T9_INDEXING_KEY_ZHUYIN = 1;
        public static final String THREE_GESTURE_SCREENSHOT = "three_gesture_screenshot";
        public static final boolean THREE_GESTURE_SCREENSHOT_DEFAULT = false;
        public static final String TORCH_STATE = "torch_state";
        public static final String TOUCH_SENSITIVE = "touch_sensitive";
        public static final String TRACKBALL_WAKE_SCREEN = "trackball_wake_screen";
        public static final String UI_MODE_SCALE = "ui_mode_scale";
        public static final String USER_GUIDE_LOCK_SCREEN_UNLOCK = "user_guide_lock_screen_unlock";
        public static final String USER_GUIDE_STATUS_BAR_CALL = "user_guide_status_bar_call";
        public static final String USER_GUIDE_STATUS_BAR_NOTIFICATION = "user_guide_status_bar_notification";
        public static final String USER_GUIDE_STATUS_BAR_TOGGLE = "user_guide_status_bar_toggle";
        public static final String USER_GUIDE_STATUS_BAR_TOGGLE_LIST = "user_guide_status_bar_toggle_list";
        public static final String USER_NETWORK_PRIORITY_ENABLED = "user_network_priority_enabled";
        public static final String VIBRATE_IN_NORMAL = "vibrate_in_normal";
        public static final boolean VIBRATE_IN_NORMAL_DEFAULT = Build.IS_CM_CUSTOMIZATION_TEST;
        public static final String VIBRATE_IN_SILENT = "vibrate_in_silent";
        public static final boolean VIBRATE_IN_SILENT_DEFAULT = true;
        public static final String VOICEASSIST_INVERT_STOP_REPORT = "voiceassist_invert_stop_report";
        public static final String VOICEASSIST_MENU_LONG_LAUNCH = "voiceassist_menu_long_press_launch";
        public static final String VOICEASSIST_PHONE_BY_EAR_LAUNCH = "voiceassist_phone_by_ear_launch";
        public static final String VOICEASSIST_PHONE_REPORT = "voiceassist_phone_report";
        public static final String VOICEASSIST_REPORT_METHOD = "voiceassist_report_method";
        public static final int VOICEASSIST_REPORT_OFF = 2;
        public static final int VOICEASSIST_REPORT_ON = 1;
        public static final int VOICEASSIST_REPORT_WIREDON = 0;
        public static final String VOICEASSIST_SMS_REPORT = "voiceassist_sms_report";
        public static final String VOLUMEKEY_WAKE_SCREEN = "volumekey_wake_screen";
        public static final String WIFI_ASSISTANT = "wifi_assistant";
        public static final String WIFI_ASSISTANT_DATA_PROMPT = "wifi_assistant_data_prompt";
        public static final int WIFI_ASSISTANT_DATA_PROMPT_DEFAULT = 1;
        public static final int WIFI_ASSISTANT_DEFAULT = 1;
        public static final String WIFI_CONNECT_TYPE = "wifi_connect_type";
        public static final int WIFI_CONNECT_TYPE_ASK = 2;
        public static final int WIFI_CONNECT_TYPE_AUTO = 0;
        public static final int WIFI_CONNECT_TYPE_MANUL = 1;
        public static final String WIFI_DIALOG_REMIND_TYPE = "wifi_dialog_remind_type";
        public static final int WIFI_DIALOG_REMIND_TYPE_CLOSE = 0;
        public static final int WIFI_DIALOG_REMIND_TYPE_OPEN = 1;
        public static final String WIFI_MASTER_KEY = "wifi_master_key";
        public static final int WIFI_MASTER_KEY_DEFAULT = 1;
        public static final String WIFI_PRIORITY_TYPE = "wifi_priority_type";
        public static final int WIFI_PRIORITY_TYPE_DEFAULT = 0;
        public static final int WIFI_PRIORITY_TYPE_MAMUAL = 1;
        public static final int WIFI_SELECT_SSID_ASK = 2;
        public static final int WIFI_SELECT_SSID_AUTO = 0;
        public static final int WIFI_SELECT_SSID_MANUL = 1;
        public static final String WIFI_SELECT_SSID_TYPE = "wifi_select_ssid_type";
        public static final String WIFI_SHARE = "wifi";
        public static final String WINDOW_TYPE_LAYER = "window_type_layer";
        public static final int WIRELESS_COMPATIABLE_MODE = 0;
        public static final String WIRELESS_CONNECT_MODE = "wireless_compatible_mode";
        public static final int WIRELESS_HIGH_MODE = 1;
        private static final String WORD_PHOTO = "word_photo";
        public static ArrayList<Integer> screenKeys = new ArrayList<>();

        public enum SmallWindowType {
            X7_STYLE,
            A1_STYLE,
            A7_LATTICE,
            B7_FULL
        }

        static {
            screenKeys.add(Integer.valueOf(2));
            screenKeys.add(Integer.valueOf(1));
            screenKeys.add(Integer.valueOf(3));
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_CALL_LOG_0);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_CALL_LOG_1);
            PUBLIC_SETTINGS.add(MiuiSettings.LAST_SYNC_TIME_CALL_LOG);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_WIFI_0);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_WIFI_1);
            PUBLIC_SETTINGS.add(MiuiSettings.LAST_SYNC_TIME_WIFI);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_GALLERY_0);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_GALLERY_1);
            PUBLIC_SETTINGS.add(MiuiSettings.LAST_SYNC_TIME_GALLERY);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_RECORDER_0);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_RECORDER_1);
            PUBLIC_SETTINGS.add(MiuiSettings.LAST_SYNC_TIME_RECORDER);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_CALENDER_0);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_CALENDER_1);
            PUBLIC_SETTINGS.add(MiuiSettings.LAST_SYNC_TIME_CALENDER);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_NOTES_0);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_NOTES_1);
            PUBLIC_SETTINGS.add(MiuiSettings.LAST_SYNC_TIME_NOTES);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_SMS_0);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_SMS_1);
            PUBLIC_SETTINGS.add(MiuiSettings.LAST_SYNC_TIME_SMS);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_CONTACT_0);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_CONTACT_1);
            PUBLIC_SETTINGS.add(MiuiSettings.LAST_SYNC_TIME_CONTACT);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_BROWSER_0);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_BROWSER_1);
            PUBLIC_SETTINGS.add(MiuiSettings.LAST_SYNC_TIME_BROWSER);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_ANTISPAM_0);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_ANTISPAM_1);
            PUBLIC_SETTINGS.add(MiuiSettings.LAST_SYNC_TIME_ANTISPAM);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_MUSIC_0);
            PUBLIC_SETTINGS.add(MiuiSettings.SYNC_SETTING_MUSIC_1);
            PUBLIC_SETTINGS.add(MiuiSettings.LAST_SYNC_TIME_MUSIC);
            PUBLIC_SETTINGS.add(MiuiSettings.OPEN_PDC_HOST_KEY);
            PUBLIC_SETTINGS.add(MiuiSettings.MICLOUD_NETWORK_AVAILABILITY_KEY);
            PUBLIC_SETTINGS.add(MiuiSettings.SETTING_MICLOUD_HOSTS);
            PUBLIC_SETTINGS.add(MiuiSettings.SETTING_MICLOUD_ACCOUNTNAME);
            PUBLIC_SETTINGS.add(MiuiSettings.SETTING_MICLOUD_HOSTS_V2);
            PUBLIC_SETTINGS.add(MiuiSettings.SETTING_MICLOUD_ACCOUNTNAME_V2);
            PUBLIC_SETTINGS.add(MiuiSettings.SETTING_MICLOUD_UPDATEHOSTS_THIRD_PARTY);
            PUBLIC_SETTINGS.add(MiuiSettings.MICLOUD_GDPR_PERMISSION_GRANTED);
            PUBLIC_SETTINGS.add(MMS_SYNC_WILD_MSG_STATE);
            PUBLIC_SETTINGS.add(MMS_SYNC_WILD_NUMBERS);
            PUBLIC_SETTINGS.add(MMS_UPLOAD_OLD_MSG_STATE);
            PUBLIC_SETTINGS.add(MMS_UPLOAD_OLD_MSG_ACCOUNTS);
            PUBLIC_SETTINGS.add(MMS_THREAD_MARKER);
            PUBLIC_SETTINGS.add(MMS_PRIVATE_ADDRESS_MARKER);
            PUBLIC_SETTINGS.add("miprofile.settings.miprofile_user_notice");
            PUBLIC_SETTINGS.add("miprofile.settings.miprofile_badge_notice");
            PUBLIC_SETTINGS.add("miprofile.settings.miprofile_set");
            PUBLIC_SETTINGS.add("miprofile.settings.miprofile_on");
            PUBLIC_SETTINGS.add("miprofile.settings.miprofile_visible");
            PUBLIC_SETTINGS.add(MiuiSettings.DOWNLOADMANAGER_DEBUG_SWITCH);
            PUBLIC_SETTINGS.add(MiuiSettings.DOWNLOADMANAGER_DEBUG_DP_PATH);
            PUBLIC_SETTINGS.add(MiuiSettings.DOWNLOADMANAGER__XUNLEI_TOKEN);
            PUBLIC_SETTINGS.add(MiuiSettings.DOWNLOADMANAGER_XUNLEI_VIP_TOKEN);
            PUBLIC_SETTINGS.add(MiuiSettings.DOWNLOADMANAGER_XUNLEI_USAGE_PERMISSION);
            PUBLIC_SETTINGS.add(DEFAULT_ALARM_ALERT);
            PUBLIC_SETTINGS.add(NEXT_ALARM_CLOCK_FORMATTED);
            PUBLIC_SETTINGS.add(SHUTDOWN_ALARM_CLOCK_OFFSET);
            PUBLIC_SETTINGS.add(VOICEASSIST_REPORT_METHOD);
            PUBLIC_SETTINGS.add(VOICEASSIST_PHONE_REPORT);
            PUBLIC_SETTINGS.add(VOICEASSIST_SMS_REPORT);
            PUBLIC_SETTINGS.add(LAST_VALID_DEVICE_ID);
            PUBLIC_SETTINGS.add("livetalk_service_status");
            PUBLIC_SETTINGS.add("livetalk_enabled");
            PUBLIC_SETTINGS.add("livetalk_switch_state");
            PUBLIC_SETTINGS.add("need_prompt");
            PUBLIC_SETTINGS.add("livetalk_use_current_account");
            PUBLIC_SETTINGS.add("internal_dial_avaiable");
            PUBLIC_SETTINGS.add("international_dial_avaiable");
            PUBLIC_SETTINGS.add("recent_country_remain_mins");
            PUBLIC_SETTINGS.add("livetalk_dial_range");
            PUBLIC_SETTINGS.add("livetalk_available_status");
            PUBLIC_SETTINGS.add("livetalk_remain_minutes");
            PUBLIC_SETTINGS.add(android.provider.SystemSettings.System.LOCK_WALLPAPER_PROVIDER_AUTHORITY);
            String str = "clock_changed_time_";
            Set<String> set = PUBLIC_SETTINGS;
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append("1x2");
            set.add(sb.toString());
            Set<String> set2 = PUBLIC_SETTINGS;
            StringBuilder sb2 = new StringBuilder();
            sb2.append(str);
            sb2.append("2x2");
            set2.add(sb2.toString());
            Set<String> set3 = PUBLIC_SETTINGS;
            StringBuilder sb3 = new StringBuilder();
            sb3.append(str);
            sb3.append("2x4");
            set3.add(sb3.toString());
            Set<String> set4 = PUBLIC_SETTINGS;
            StringBuilder sb4 = new StringBuilder();
            sb4.append(str);
            sb4.append("4x4");
            set4.add(sb4.toString());
            Set<String> set5 = PUBLIC_SETTINGS;
            StringBuilder sb5 = new StringBuilder();
            sb5.append(str);
            sb5.append("3x4");
            set5.add(sb5.toString());
            PUBLIC_SETTINGS.add(MiuiSettings.PREF_KEY_WALLPAPER_SCREEN_SPAN);
            PUBLIC_SETTINGS.add(MiuiSettings.MARKET_ENABLE_SHARE_PROGRESS_STATUS);
            PUBLIC_SETTINGS.add(MiuiSettings.MIUI_HOME_ENABLE_SHARE_PROGRESS_STATUS);
            PUBLIC_SETTINGS.add(MiuiSettings.MARKET_ENABLE_SHARE_PROGRESS_STATUS_INTERNATIONAL);
            PUBLIC_SETTINGS.add(MiuiSettings.MIPICKS_ENABLE_SHARE_PROGRESS_STATUS);
            PUBLIC_SETTINGS.add(MiuiSettings.MARKET_CHOOSER_RECOMMENDED_ENABLE);
            PUBLIC_SETTINGS.add(MiuiSettings.DISCOVER_AUTO_UPDATE_ENABLED);
            PUBLIC_SETTINGS.add(MiuiSettings.DISCOVER_METERED_UPDATE_ANSWERED);
            PUBLIC_SETTINGS.add(MiuiSettings.DISCOVER_METERED_UPDATE_CONFIRM_NEEDED_BY_REGION);
            PUBLIC_SETTINGS.add(MiuiSettings.DISCOVER_METERED_SYSTEM_UPDATE_CONFIRM_NEEDED_BY_REGION);
            PUBLIC_SETTINGS.add(MiuiSettings.MIAPPS_HOME_USER_GUIDE_SHOWN_CONTROL);
            PUBLIC_SETTINGS.add(KEY_TOUCH_ASSISTANT_ENABLED);
            PUBLIC_SETTINGS.add(KEY_TOUCH_ASSISTANT_SHOW_ON_KEYGUARD);
            PUBLIC_SETTINGS.add("frequent_phrases");
            PUBLIC_SETTINGS.add(RINGTONE_SOUND_SLOT_1);
            PUBLIC_SETTINGS.add(RINGTONE_SOUND_SLOT_2);
            PUBLIC_SETTINGS.add(SMS_RECEIVED_SOUND);
            PUBLIC_SETTINGS.add(SMS_RECEIVED_SOUND_SLOT_1);
            PUBLIC_SETTINGS.add(SMS_RECEIVED_SOUND_SLOT_2);
            PUBLIC_SETTINGS.add(CALENDAR_ALERT);
            PUBLIC_SETTINGS.add(MiuiSettings.SETTING_UPDATABLE_SYSTEM_APP_COUNT);
            PUBLIC_SETTINGS.add(MiuiSettings.SCREEN_RECORDER_SHOW_TOUCHES);
            PUBLIC_SETTINGS.add(HANDY_MODE_STATE);
            PUBLIC_SETTINGS.add(Key.LONG_PRESS_POWER_LAUNCH_XIAOAI);
            PUBLIC_SETTINGS.add(Key.SEND_BACK_WHEN_XIAOAI_APPEAR);
            PUBLIC_SETTINGS.add(Key.DOUBLE_CLICK_POWER_KEY);
            PUBLIC_SETTINGS.add(DRIVE_MODE_DRIVE_MODE);
            PUBLIC_SETTINGS.add(AI_PRELOAD_USER_STATE);
            PUBLIC_SETTINGS.add(AUTO_DUAL_CLOCK);
            PUBLIC_SETTINGS.add(RESIDENT_ID);
            PUBLIC_SETTINGS.add(RESIDENT_TIMEZONE);
            PUBLIC_SETTINGS.add(RANDOM_NOTE_MODE_RANDOM_SOUND_NUMBER);
            PUBLIC_SETTINGS.add(RANDOM_NOTE_MODE_SEQUENCE_SOUND_NUMBER);
            PUBLIC_SETTINGS.add(RANDOM_NOTE_MODE_SEQUENCE_TIME_INTERVAL_MS);
            PUBLIC_SETTINGS.add(RANDOM_NOTE_MODE_MUTE_TIME_INTERVAL_MS);
        }

        public static boolean belongToCrossXSpaceSettings(String str, int i) {
            return XSpaceUserHandle.isXSpaceUserId(i) && MiuiSettings.CROSS_PROFILE_SETTINGS.contains(str);
        }

        private static String flattenOrderToString(List<ComponentName> list) {
            StringBuilder sb = new StringBuilder();
            int size = list.size() - 1;
            int i = 0;
            while (true) {
                sb.append(((ComponentName) list.get(i)).flattenToShortString());
                if (i == size) {
                    return sb.toString();
                }
                sb.append(ACTIVITY_RESOLVE_ORDER_DELIMETER);
                i++;
            }
        }

        public static List<ComponentName> getActivityResolveOrder(ContentResolver contentResolver) {
            return unflattenOrderFromString(getString(contentResolver, ACTIVITY_RESOLVE_ORDER));
        }

        public static boolean getBooleanForUser(ContentResolver contentResolver, String str, boolean z, int i) {
            return android.provider.Settings.System.getIntForUser(contentResolver, str, z ? 1 : 0, i) != 0;
        }

        public static HashSet<String> getDisableWifiAutoConnectSsid(Context context) {
            String stringForUser = android.provider.Settings.System.getStringForUser(context.getContentResolver(), DISABLE_WIFI_AUTO_CONNECT_SSID, -3);
            HashSet<String> hashSet = new HashSet<>();
            if (!TextUtils.isEmpty(stringForUser)) {
                String[] split = stringForUser.split(ACTIVITY_RESOLVE_ORDER_DELIMETER);
                if (split != null) {
                    for (int i = 0; i < split.length; i++) {
                        try {
                            hashSet.add(new String(Base64.decode(split[i], 2)));
                        } catch (IllegalArgumentException e) {
                        }
                    }
                }
            }
            return hashSet;
        }

        public static Rect getDisplayWindowSizeInSmartCover() {
            Resources system = Resources.getSystem();
            SmallWindowType smallWindowMode = getSmallWindowMode();
            int[] iArr = {system.getInteger(285802511), system.getInteger(285802512), system.getInteger(285802513), system.getInteger(285802514)};
            Rect rect = new Rect(iArr[0], iArr[1], iArr[2], iArr[3]);
            if (smallWindowMode == null) {
                return rect;
            }
            int[] iArr2 = {FeatureParser.getInteger("smartcover_smallwindow_left", iArr[0]), FeatureParser.getInteger("smartcover_smallwindow_top", iArr[1]), FeatureParser.getInteger("smartcover_smallwindow_right", iArr[2]), FeatureParser.getInteger("smartcover_smallwindow_bottom", iArr[3])};
            if (FeatureParser.getBoolean("support_multiple_small_win_cover", false)) {
                switch (smallWindowMode) {
                    case X7_STYLE:
                        iArr2 = FeatureParser.getIntArray("smartcover_smallwindow_x7_size");
                        break;
                    case A1_STYLE:
                        iArr2 = FeatureParser.getIntArray("smartcover_smallwindow_a1_size");
                        break;
                    case A7_LATTICE:
                        iArr2 = FeatureParser.getIntArray("smartcover_smallwindow_a7_size");
                        break;
                    case B7_FULL:
                        iArr2 = FeatureParser.getIntArray("smartcover_smallwindow_b7_size");
                        break;
                }
            }
            if (iArr2 != null && iArr2.length == 4) {
                rect.set(iArr2[0], iArr2[1], iArr2[2], iArr2[3]);
            }
            return rect;
        }

        public static int getHapticFeedbackLevel(Context context) {
            return android.provider.Settings.System.getIntForUser(context.getContentResolver(), HAPTIC_FEEDBACK_LEVEL, HAPTIC_FEEDBACK_LEVEL_DEFAULT, -3);
        }

        public static Set<String> getHotSpotMacBlackSet(Context context) {
            String stringForUser = android.provider.Settings.System.getStringForUser(context.getContentResolver(), HOTSOPT_MAC_BLACK_SET, -2);
            HashSet hashSet = new HashSet();
            if (!TextUtils.isEmpty(stringForUser)) {
                String[] split = stringForUser.split(ACTIVITY_RESOLVE_ORDER_DELIMETER);
                if (split != null) {
                    for (int i = 0; i < split.length; i++) {
                        try {
                            hashSet.add(new String(Base64.decode(split[i], 2)));
                        } catch (IllegalArgumentException e) {
                        }
                    }
                }
            }
            return hashSet;
        }

        public static int getHotSpotMaxStationNum(Context context) {
            try {
                return android.provider.Settings.System.getIntForUser(context.getContentResolver(), HOTSOPT_MAX_STATION_NUM, -2);
            } catch (SettingNotFoundException e) {
                return 0;
            }
        }

        public static String getHotSpotVendorSpecific(Context context) {
            return android.provider.Settings.System.getStringForUser(context.getContentResolver(), HOTSOPT_VENDOR_SPECIFIC, -2);
        }

        public static String getScreenKeyLongPressAction(Context context, String str) {
            String stringForUser = android.provider.Settings.System.getStringForUser(context.getContentResolver(), str, -2);
            if (!TextUtils.isEmpty(stringForUser)) {
                return stringForUser;
            }
            String str2 = "none";
            String[] stringArray = context.getResources().getStringArray(285671442);
            return SCREEN_KEY_LONG_PRESS_MENU.equals(str) ? stringArray[0] : SCREEN_KEY_LONG_PRESS_HOME.equals(str) ? stringArray[1] : SCREEN_KEY_LONG_PRESS_BACK.equals(str) ? stringArray[2] : SCREEN_KEY_LONG_PRESS_APP_SWITCH.equals(str) ? stringArray[3] : str2;
        }

        public static ArrayList<Integer> getScreenKeyOrder(Context context) {
            ArrayList<Integer> arrayList = new ArrayList<>();
            String string = android.provider.Settings.System.getString(context.getContentResolver(), SCREEN_KEY_ORDER);
            if (!TextUtils.isEmpty(string)) {
                String[] split = string.split(" ");
                int i = 0;
                while (i < split.length) {
                    try {
                        int intValue = Integer.valueOf(split[i]).intValue();
                        if (screenKeys.contains(Integer.valueOf(intValue))) {
                            arrayList.add(Integer.valueOf(intValue));
                        }
                        i++;
                    } catch (Exception e) {
                        arrayList.clear();
                    }
                }
            }
            Iterator it = screenKeys.iterator();
            while (it.hasNext()) {
                Integer num = (Integer) it.next();
                if (!arrayList.contains(num)) {
                    arrayList.add(num);
                }
            }
            return arrayList;
        }

        public static int getShowCustomCarrierDefault() {
            return (Build.IS_CM_CUSTOMIZATION_TEST || Build.IS_CU_CUSTOMIZATION_TEST || Build.IS_CT_CUSTOMIZATION_TEST || Resources.getSystem().getBoolean(285933594)) ? 1 : 0;
        }

        public static SmallWindowType getSmallWindowMode() {
            SmallWindowType smallWindowType;
            int[] iArr;
            int i = SystemProperties.getInt(SMARTCOVER_SMALLWIN_TYPE, -99);
            if (i == -99) {
                if (FeatureParser.getBoolean("support_multiple_small_win_cover", false)) {
                    iArr = FeatureParser.getIntArray("small_win_cover_type");
                } else {
                    iArr = new int[1];
                    if (FeatureParser.getBoolean("support_small_win_cover", false)) {
                        iArr[0] = FeatureParser.getInteger("small_win_cover_type", -1);
                    } else {
                        iArr[0] = -1;
                    }
                }
                if (iArr == null) {
                    return null;
                }
                i = iArr[0];
            }
            switch (i) {
                case 0:
                    smallWindowType = SmallWindowType.X7_STYLE;
                    break;
                case 1:
                    smallWindowType = SmallWindowType.A1_STYLE;
                    break;
                case 2:
                    smallWindowType = SmallWindowType.A7_LATTICE;
                    break;
                case 3:
                    smallWindowType = SmallWindowType.B7_FULL;
                    break;
                default:
                    smallWindowType = null;
                    break;
            }
            return smallWindowType;
        }

        public static String getString(ContentResolver contentResolver, String str) {
            return android.provider.Settings.System.getString(contentResolver, str);
        }

        public static synchronized String getString(ContentResolver contentResolver, String str, String str2) {
            String string;
            synchronized (System.class) {
                string = android.provider.Settings.System.getString(contentResolver, str);
                if (string == null) {
                    string = str2;
                }
            }
            return string;
        }

        public static String getStringForUser(ContentResolver contentResolver, String str, int i) {
            return android.provider.Settings.System.getStringForUser(contentResolver, str, i);
        }

        public static int getT9IndexingKeyDefault() {
            return Build.checkRegion("TW") ? 1 : 0;
        }

        public static boolean isCdmaPreciseAnswerStateEnabled(Context context) {
            return android.provider.Settings.System.getInt(context.getContentResolver(), CDMA_PRECISE_ANSWER_STATE, 1) == 1;
        }

        private static boolean isCnFromOperator(String str) {
            String str2 = "";
            if (!TextUtils.isEmpty(str) && str.length() >= 3) {
                str2 = str.substring(0, 3);
            }
            return CN_OPERATOR.equals(str2);
        }

        public static boolean isHapticFeedbackDisabled(Context context) {
            return android.provider.Settings.System.getIntForUser(context.getContentResolver(), "haptic_feedback_enabled", 0, -3) == 0;
        }

        public static final boolean isInCnRegion() {
            TelephonyManager telephonyManager = TelephonyManager.getDefault();
            boolean z = false;
            boolean z2 = telephonyManager.getIccCardCount() > 0;
            int phoneCount = telephonyManager.getPhoneCount();
            String str = null;
            if (z2) {
                String str2 = null;
                for (int i = 0; i < phoneCount; i++) {
                    str2 = telephonyManager.getNetworkOperatorForSlot(i);
                    if (isCnFromOperator(str2)) {
                        return true;
                    }
                }
                str = str2;
            }
            if (Build.checkRegion("CN") && (!z2 || TextUtils.isEmpty(str))) {
                z = true;
            }
            return z;
        }

        public static boolean isInSmallWindowMode(Context context) {
            return getBoolean(context.getContentResolver(), KEY_IN_SMALL_WINDOW_MODE, false);
        }

        public static boolean isMiDropEnabled(Context context) {
            return getBoolean(context.getContentResolver(), KEY_MIDROP_ENABLED, false);
        }

        public static boolean isMiuiPublicSettings(PackageInfo packageInfo, String str) {
            if (PUBLIC_SETTINGS.contains(str) && (packageInfo.applicationInfo.flags & 1) != 0) {
                return true;
            }
            Slog.d("SystemSettings", "Want to modify SystemSettings? See MiuiSettings.System.PUBLIC_SETTINGS");
            return false;
        }

        public static boolean isSimpleMode(Context context) {
            return android.provider.Settings.System.getInt(context.getContentResolver(), SIMPLE_MODE, Build.IS_INTERNATIONAL_BUILD ^ true ? 1 : 0) == 1;
        }

        public static boolean isTouchAssistantEnabledForUser(Context context, int i, boolean z) {
            return android.provider.Settings.System.getIntForUser(context.getContentResolver(), KEY_TOUCH_ASSISTANT_ENABLED, 0, i) == 1;
        }

        public static boolean isTouchAssistantTemporaryForUser(Context context, int i, boolean z) {
            return android.provider.Settings.System.getIntForUser(context.getContentResolver(), KEY_TOUCH_ASSISTANT_ENABLED, 2, i) == 2;
        }

        public static void putActivityResolveOrder(ContentResolver contentResolver, List<ComponentName> list) {
            putString(contentResolver, ACTIVITY_RESOLVE_ORDER, flattenOrderToString(list));
        }

        public static boolean putBoolean(ContentResolver contentResolver, String str, boolean z) {
            return android.provider.Settings.System.putInt(contentResolver, str, z ? 1 : 0);
        }

        public static boolean putBooleanForUser(ContentResolver contentResolver, String str, boolean z, int i) {
            return android.provider.Settings.System.putIntForUser(contentResolver, str, z ? 1 : 0, i);
        }

        public static boolean putString(ContentResolver contentResolver, String str, String str2) {
            return android.provider.Settings.System.putString(contentResolver, str, str2);
        }

        public static boolean putStringForUser(ContentResolver contentResolver, String str, String str2, int i) {
            return android.provider.Settings.System.putStringForUser(contentResolver, str, str2, i);
        }

        public static void setDisableWifiAutoConnectSsid(Context context, HashSet<String> hashSet) {
            if (hashSet != null) {
                StringBuilder sb = new StringBuilder();
                Iterator it = hashSet.iterator();
                while (it.hasNext()) {
                    try {
                        sb.append(Base64.encodeToString(((String) it.next()).getBytes(), 2));
                        sb.append(ACTIVITY_RESOLVE_ORDER_DELIMETER);
                    } catch (IllegalArgumentException e) {
                    }
                }
                android.provider.Settings.System.putStringForUser(context.getContentResolver(), DISABLE_WIFI_AUTO_CONNECT_SSID, sb.toString(), -3);
            }
        }

        public static void setHotSpotMacBlackSet(Context context, Set<String> set) {
            if (set != null) {
                String str = "^[a-fA-F0-9]{2}+:[a-fA-F0-9]{2}+:[a-fA-F0-9]{2}+:[a-fA-F0-9]{2}+:[a-fA-F0-9]{2}+:[a-fA-F0-9]{2}$";
                StringBuilder sb = new StringBuilder();
                for (String str2 : set) {
                    try {
                        if (str2.matches("^[a-fA-F0-9]{2}+:[a-fA-F0-9]{2}+:[a-fA-F0-9]{2}+:[a-fA-F0-9]{2}+:[a-fA-F0-9]{2}+:[a-fA-F0-9]{2}$")) {
                            sb.append(Base64.encodeToString(str2.getBytes(), 2));
                            sb.append(ACTIVITY_RESOLVE_ORDER_DELIMETER);
                        }
                    } catch (IllegalArgumentException e) {
                    }
                }
                android.provider.Settings.System.putStringForUser(context.getContentResolver(), HOTSOPT_MAC_BLACK_SET, sb.toString(), -2);
            }
        }

        public static boolean setHotSpotMaxStationNum(Context context, int i) {
            if (i <= 0 || i >= 2008) {
                return false;
            }
            android.provider.Settings.System.putIntForUser(context.getContentResolver(), HOTSOPT_MAX_STATION_NUM, i, -2);
            return true;
        }

        public static void setHotSpotVendorSpecific(Context context, String str) {
            if (str != null) {
                android.provider.Settings.System.putStringForUser(context.getContentResolver(), HOTSOPT_VENDOR_SPECIFIC, str, -2);
            }
        }

        public static void setSimpleMode(Context context, boolean z) {
            android.provider.Settings.System.putInt(context.getContentResolver(), SIMPLE_MODE, z ? 1 : 0);
        }

        public static void setSmartCoverMode(boolean z) {
            if (!FeatureParser.getBoolean("support_hall_sensor", false) || !z) {
                SystemProperties.set(SMARTCOVER_MODE_KEY, String.valueOf(0));
                return;
            }
            SmallWindowType smallWindowMode = getSmallWindowMode();
            if (smallWindowMode == null) {
                SystemProperties.set(SMARTCOVER_MODE_KEY, String.valueOf(1));
                return;
            }
            switch (smallWindowMode) {
                case X7_STYLE:
                case A1_STYLE:
                    SystemProperties.set(SMARTCOVER_MODE_KEY, String.valueOf(2));
                    break;
                case A7_LATTICE:
                    SystemProperties.set(SMARTCOVER_MODE_KEY, String.valueOf(3));
                    break;
                case B7_FULL:
                    SystemProperties.set(SMARTCOVER_MODE_KEY, String.valueOf(4));
                    break;
                default:
                    SystemProperties.set(SMARTCOVER_MODE_KEY, String.valueOf(1));
                    break;
            }
        }

        public static void setUseWordPhoto(Context context, boolean z) {
            android.provider.Settings.System.putInt(context.getContentResolver(), WORD_PHOTO, z ? 1 : 0);
        }

        private static List<ComponentName> unflattenOrderFromString(String str) {
            ArrayList arrayList = new ArrayList();
            if (str != null) {
                String[] split = str.split(ACTIVITY_RESOLVE_ORDER_DELIMETER);
                for (String unflattenFromString : split) {
                    arrayList.add(ComponentName.unflattenFromString(unflattenFromString));
                }
            }
            return arrayList;
        }

        public static void updateScreenColor() {
            if (!"1".equals(SystemProperties.get("sys.boot_completed", "0")) || !FeatureParser.getBoolean("support_screen_color_persist", false)) {
                String str = "DisplayFeatureManager";
                Slog.d("DisplayFeatureManager", "updateScreenColor begin");
                DisplayFeatureManager instance = DisplayFeatureManager.getInstance();
                if (ScreenEffect.isScreenPaperMode()) {
                    Slog.d("DisplayFeatureManager", "setScreenPaperMode true");
                    ScreenEffect.setScreenPaperMode(true);
                } else {
                    int screenGamut = instance.getScreenGamut();
                    if (FeatureParser.getInteger("screen_standard_mode", 0) != 1 || screenGamut == 0) {
                        int colorPrefer = instance.getColorPrefer();
                        if (colorPrefer != 2) {
                            StringBuilder sb = new StringBuilder();
                            sb.append("setColorPrefer ");
                            sb.append(colorPrefer);
                            Slog.d("DisplayFeatureManager", sb.toString());
                            instance.setColorPrefer(colorPrefer);
                        }
                    } else {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("setScreenGamut ");
                        sb2.append(screenGamut);
                        Slog.d("DisplayFeatureManager", sb2.toString());
                        instance.setScreenGamut(screenGamut);
                    }
                }
                int screenSaturation = instance.getScreenSaturation();
                StringBuilder sb3 = new StringBuilder();
                sb3.append("setScreenSaturation ");
                sb3.append(screenSaturation);
                Slog.d("DisplayFeatureManager", sb3.toString());
                instance.setScreenSaturation(screenSaturation);
                if (FeatureParser.getBoolean("support_screen_optimize", false)) {
                    int screenCabc = instance.getScreenCabc();
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("setScreenCabc ");
                    sb4.append(screenCabc);
                    Slog.d("DisplayFeatureManager", sb4.toString());
                    instance.setScreenCabc(screenCabc);
                }
                Slog.d("DisplayFeatureManager", "updateScreenColor end");
            }
        }

        public static boolean useWordPhoto(Context context) {
            return android.provider.Settings.System.getInt(context.getContentResolver(), WORD_PHOTO, 0) == 1;
        }
    }

    public static class Telephony {
        public static final String ADD_ZERO_PREFIX_SWITCH = "button_add_zero_prefix";
        public static final String AUTOIP_PREFIX = "autoip_prefix";
        public static final String AUTOIP_SWITCH = "button_autoip";
        public static final int AUTO_ANSWER_DEFAULT_DELAY_TIME = 3;
        public static final String AUTO_ANSWER_DELAY_TIME = "auto_answer_delay_time";
        public static final String AUTO_ANSWER_SCENARIO = "auto_answer_scenario";
        public static final int AUTO_ANSWER_SCENARIO_ALWAYS = 0;
        public static final int AUTO_ANSWER_SCENARIO_BLUETOOTH_ONLY = 2;
        public static final int AUTO_ANSWER_SCENARIO_HEADSET_BLUETOOTH = 3;
        public static final int AUTO_ANSWER_SCENARIO_HEADSET_ONLY = 1;
        public static final String AUTO_COUNTRY_CODE = "auto_country_code";
        public static final String AUTO_IP_SUPPORT_LOCAL_NUMBERS = "button_auto_ip_support_local_numbers";
        private static final String CALL_WAITING_TONE = "call_waiting_tone";
        public static final int CALL_WAITING_TONE_CONTINUOUSLY = 0;
        public static final int CALL_WAITING_TONE_TWICE_AND_VIBRATE = 2;
        public static final int CALL_WAITING_TONE_TWICE_ONLY = 1;
        public static final String CONNECT_DISCONNECT_VIBRATE = "button_connect_disconnect_vibrate";
        public static final String CONTACT_COUNTRYCODE = "persist.radio.countrycode";
        public static final String CURRENT_AREACODE = "current_areacode";
        public static final String ENABLED_ANTISPAM_STRANGE = "button_antispam_strange";
        public static final String ENABLED_AUTO_ANSWER = "button_auto_answer";
        public static final String ENABLED_AUTO_RECORD = "button_auto_record_call";
        public static final String ENABLED_AUTO_REDIAL = "button_auto_redial";
        public static final String ENABLED_HANDON_RINGER = "button_handon_ringer";
        public static final String ENABLED_INCOMING_VIDEO_SHOW = "button_incoming_video_show";
        public static final String ENABLED_RECORD_NOTIFY = "button_call_recording_notification";
        public static final String ENABLED_TURN_OVER_MUTE = "button_turn_over_mute";
        public static final String ENABLED_UNKNOWN_NUMBER_RECORD = "button_record_unknown_number";
        public static final String ENABLED_VOICE_SERVICE = "button_voice_service";
        public static final String ENABLED_YELLOWPAGE_RECORD = "button_record_yellowpage_number";
        public static final String ENABLE_CRESCENDO_RINGER = "button_crescendo_ringer";
        public static final String ENABLE_PROXIMITY_KEY = "button_enable_proximity";
        public static final String ENABLE_REJECT_VIA_SMS_KEY = "button_enable_reject_via_sms";
        public static final String ENABLE_TELOCATION = "enable_telocation";
        public static final String IVR_MO_AREA_CODE_SLOT_1 = "ivr_mo_area_code_slot_1";
        public static final String IVR_MO_AREA_CODE_SLOT_2 = "ivr_mo_area_code_slot_2";
        public static final String IVR_TYPE_SLOT_1 = "ivr_type_slot_1";
        public static final String IVR_TYPE_SLOT_2 = "ivr_type_slot_2";
        public static final String MISSED_CALL_NOTIFY_TIMES = "button_missed_call_notify_times";
        public static final String RECORD_SCENARIO = "radio_record_scenario";
        public static final String RECORD_WHITE_LIST = "record_white_list";
        public static final String REJECT_VIA_SMS_RESPONSE_1 = "reject_via_sms_response_1";
        public static final String REJECT_VIA_SMS_RESPONSE_2 = "reject_via_sms_response_2";
        public static final String REJECT_VIA_SMS_RESPONSE_3 = "reject_via_sms_response_3";
        public static final String REJECT_VIA_SMS_RESPONSE_4 = "reject_via_sms_response_4";
        public static final String VOLTE_FEATURE_DISABLED = "volte_feature_disabled";

        public static int getAutoAnswerCallDelayTime(ContentResolver contentResolver) {
            return android.provider.Settings.System.getInt(contentResolver, AUTO_ANSWER_DELAY_TIME, 3);
        }

        public static int getAutoAnswerCallScenario(ContentResolver contentResolver) {
            return android.provider.Settings.System.getInt(contentResolver, AUTO_ANSWER_SCENARIO, 0);
        }

        public static String getAutoIpPrefix(ContentResolver contentResolver, String str) {
            return getAutoIpPrefix(contentResolver, str, -1);
        }

        public static String getAutoIpPrefix(ContentResolver contentResolver, String str, int i) {
            String str2 = AUTOIP_PREFIX;
            if (i >= 0) {
                StringBuilder sb = new StringBuilder();
                sb.append(str2);
                sb.append(i);
                str2 = sb.toString();
            }
            return System.getString(contentResolver, str2, str);
        }

        public static int getCallWaitingTone(Context context) {
            int i = android.provider.Settings.System.getInt(context.getContentResolver(), CALL_WAITING_TONE, 0);
            if (!"lithium".equals(Build.DEVICE) || i != 2) {
                return i;
            }
            return 0;
        }

        public static String getContactCountrycode(ContentResolver contentResolver) {
            return System.getString(contentResolver, CONTACT_COUNTRYCODE);
        }

        public static String getCurrentAeraCode(ContentResolver contentResolver, int i) {
            String str = CURRENT_AREACODE;
            if (i >= 0) {
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append(i);
                str = sb.toString();
            }
            return System.getString(contentResolver, str);
        }

        public static boolean getEnabledAutoRedial(ContentResolver contentResolver) {
            return System.getBoolean(contentResolver, ENABLED_AUTO_REDIAL, false);
        }

        public static boolean getEnabledVoiceService(ContentResolver contentResolver) {
            return System.getBoolean(contentResolver, ENABLED_VOICE_SERVICE, false);
        }

        public static String getIVRParameterValue(ContentResolver contentResolver, String str) {
            return System.getString(contentResolver, str, "");
        }

        public static int getMissedCallNotifyTimes(ContentResolver contentResolver) {
            return android.provider.Settings.System.getInt(contentResolver, MISSED_CALL_NOTIFY_TIMES, 0);
        }

        public static int getRecordScenario(ContentResolver contentResolver) {
            return Integer.valueOf(System.getString(contentResolver, RECORD_SCENARIO, "0")).intValue();
        }

        public static String getRecordWhiteList(ContentResolver contentResolver) {
            return System.getString(contentResolver, RECORD_WHITE_LIST);
        }

        public static String getRejectViaSmsResponse(ContentResolver contentResolver, String str, String str2) {
            return System.getString(contentResolver, str, str2);
        }

        public static String getVibrateKey(ContentResolver contentResolver) {
            return System.getString(contentResolver, CONNECT_DISCONNECT_VIBRATE, "100");
        }

        public static boolean isAntispamStangerEnabled(ContentResolver contentResolver) {
            return System.getBoolean(contentResolver, ENABLED_ANTISPAM_STRANGE, false);
        }

        public static boolean isAutoAddZeroPrefix(ContentResolver contentResolver, int i) {
            String str = ADD_ZERO_PREFIX_SWITCH;
            if (i >= 0) {
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append(i);
                str = sb.toString();
            }
            return System.getBoolean(contentResolver, str, false);
        }

        public static boolean isAutoAnswerCall(ContentResolver contentResolver) {
            return System.getBoolean(contentResolver, ENABLED_AUTO_ANSWER, false);
        }

        public static boolean isAutoCountryCodeEnable(ContentResolver contentResolver) {
            return System.getBoolean(contentResolver, AUTO_COUNTRY_CODE, false);
        }

        public static boolean isAutoIpEnable(ContentResolver contentResolver, int i) {
            String str = AUTOIP_SWITCH;
            if (i >= 0) {
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append(i);
                str = sb.toString();
            }
            return System.getBoolean(contentResolver, str, false);
        }

        public static boolean isAutoIpSupportLocalNum(ContentResolver contentResolver, int i) {
            String str = AUTO_IP_SUPPORT_LOCAL_NUMBERS;
            if (i >= 0) {
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append(i);
                str = sb.toString();
            }
            return System.getBoolean(contentResolver, str, false);
        }

        public static boolean isAutoRecordEnabled(ContentResolver contentResolver) {
            return System.getBoolean(contentResolver, ENABLED_AUTO_RECORD, false);
        }

        public static boolean isCrescendoRingerEnable(ContentResolver contentResolver) {
            return System.getBoolean(contentResolver, ENABLE_CRESCENDO_RINGER, false);
        }

        public static boolean isHandonRingerEnabled(ContentResolver contentResolver) {
            return System.getBoolean(contentResolver, ENABLED_HANDON_RINGER, false);
        }

        public static boolean isIncomingVideoShowEnabled(ContentResolver contentResolver) {
            return System.getBoolean(contentResolver, ENABLED_INCOMING_VIDEO_SHOW, true);
        }

        public static boolean isProximitySensorEnable(ContentResolver contentResolver) {
            return System.getBoolean(contentResolver, ENABLE_PROXIMITY_KEY, true);
        }

        public static boolean isRecordNotificationEnabled(ContentResolver contentResolver) {
            return System.getBoolean(contentResolver, ENABLED_RECORD_NOTIFY, true);
        }

        public static boolean isRejectViaSmsEnable(ContentResolver contentResolver) {
            return System.getBoolean(contentResolver, ENABLE_REJECT_VIA_SMS_KEY, true);
        }

        public static boolean isTelocationEnable(ContentResolver contentResolver) {
            return System.getBoolean(contentResolver, "enable_telocation", true);
        }

        public static boolean isTurnOverMuteEnabled(ContentResolver contentResolver) {
            return System.getBoolean(contentResolver, ENABLED_TURN_OVER_MUTE, false);
        }

        public static boolean isUnknownNumberRecordEnabled(ContentResolver contentResolver) {
            return System.getBoolean(contentResolver, ENABLED_UNKNOWN_NUMBER_RECORD, false);
        }

        public static boolean isYellowpageRecordEnabled(ContentResolver contentResolver) {
            return System.getBoolean(contentResolver, ENABLED_YELLOWPAGE_RECORD, false);
        }

        public static void setAntispamStangerEnabled(ContentResolver contentResolver, boolean z) {
            System.putBoolean(contentResolver, ENABLED_ANTISPAM_STRANGE, z);
        }

        public static void setAutoAddZeroPrefixEnable(ContentResolver contentResolver, boolean z, int i) {
            String str = ADD_ZERO_PREFIX_SWITCH;
            if (i >= 0) {
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append(i);
                str = sb.toString();
            }
            System.putBoolean(contentResolver, str, z);
        }

        public static void setAutoAnswerCall(ContentResolver contentResolver, boolean z) {
            System.putBoolean(contentResolver, ENABLED_AUTO_ANSWER, z);
        }

        public static void setAutoAnswerCallDelayTime(ContentResolver contentResolver, int i) {
            android.provider.Settings.System.putInt(contentResolver, AUTO_ANSWER_DELAY_TIME, i);
        }

        public static void setAutoAnswerCallScenario(ContentResolver contentResolver, int i) {
            android.provider.Settings.System.putInt(contentResolver, AUTO_ANSWER_SCENARIO, i);
        }

        public static void setAutoCountryCodeEnable(ContentResolver contentResolver, boolean z) {
            System.putBoolean(contentResolver, AUTO_COUNTRY_CODE, z);
        }

        public static void setAutoIpEnable(ContentResolver contentResolver, boolean z, int i) {
            String str = AUTOIP_SWITCH;
            if (i >= 0) {
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append(i);
                str = sb.toString();
            }
            System.putBoolean(contentResolver, str, z);
        }

        public static void setAutoIpPrefix(ContentResolver contentResolver, String str) {
            setAutoIpPrefix(contentResolver, str, -1);
        }

        public static void setAutoIpPrefix(ContentResolver contentResolver, String str, int i) {
            String str2 = AUTOIP_PREFIX;
            if (i >= 0) {
                StringBuilder sb = new StringBuilder();
                sb.append(str2);
                sb.append(i);
                str2 = sb.toString();
            }
            System.putString(contentResolver, str2, str);
        }

        public static void setAutoIpSupportLocalNumEnable(ContentResolver contentResolver, boolean z, int i) {
            String str = AUTO_IP_SUPPORT_LOCAL_NUMBERS;
            if (i >= 0) {
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append(i);
                str = sb.toString();
            }
            System.putBoolean(contentResolver, str, z);
        }

        public static void setAutoRecordEnabled(ContentResolver contentResolver, boolean z) {
            System.putBoolean(contentResolver, ENABLED_AUTO_RECORD, z);
        }

        public static void setAutoRedialEnabled(ContentResolver contentResolver, boolean z) {
            System.putBoolean(contentResolver, ENABLED_AUTO_REDIAL, z);
        }

        public static void setCallWaitingTone(Context context, int i) {
            android.provider.Settings.System.putInt(context.getContentResolver(), CALL_WAITING_TONE, i);
        }

        public static void setContactCountrycode(ContentResolver contentResolver, String str) {
            System.putString(contentResolver, CONTACT_COUNTRYCODE, str);
        }

        public static void setCrescendoRingerEnable(ContentResolver contentResolver, boolean z) {
            System.putBoolean(contentResolver, ENABLE_CRESCENDO_RINGER, z);
        }

        public static void setCurrentAeraCode(ContentResolver contentResolver, String str, int i) {
            String str2 = CURRENT_AREACODE;
            if (i >= 0) {
                StringBuilder sb = new StringBuilder();
                sb.append(str2);
                sb.append(i);
                str2 = sb.toString();
            }
            System.putString(contentResolver, str2, str);
        }

        public static void setHandonRingerEnabled(ContentResolver contentResolver, boolean z) {
            System.putBoolean(contentResolver, ENABLED_HANDON_RINGER, z);
        }

        public static void setIVRParameterValue(ContentResolver contentResolver, String str, String str2) {
            System.putString(contentResolver, str, str2);
        }

        public static void setIncomingVideoShowEnabled(ContentResolver contentResolver, boolean z) {
            System.putBoolean(contentResolver, ENABLED_INCOMING_VIDEO_SHOW, z);
        }

        public static void setMissedCallNotifyTimes(ContentResolver contentResolver, int i) {
            android.provider.Settings.System.putInt(contentResolver, MISSED_CALL_NOTIFY_TIMES, i);
        }

        public static void setProximitySensorEnable(ContentResolver contentResolver, boolean z) {
            System.putBoolean(contentResolver, ENABLE_PROXIMITY_KEY, z);
        }

        public static void setRecordNotificationEnabled(ContentResolver contentResolver, boolean z) {
            System.putBoolean(contentResolver, ENABLED_RECORD_NOTIFY, z);
        }

        public static void setRecordScenario(ContentResolver contentResolver, int i) {
            System.putString(contentResolver, RECORD_SCENARIO, String.valueOf(i));
        }

        public static void setRecordWhiteList(ContentResolver contentResolver, String str) {
            System.putString(contentResolver, RECORD_WHITE_LIST, str);
        }

        public static void setRejectViaSmsEnable(ContentResolver contentResolver, boolean z) {
            System.putBoolean(contentResolver, ENABLE_REJECT_VIA_SMS_KEY, z);
        }

        public static void setRejectViaSmsRespone(ContentResolver contentResolver, String str, String str2) {
            System.putString(contentResolver, str, str2);
        }

        public static void setTelocationEnable(ContentResolver contentResolver, boolean z) {
            System.putBoolean(contentResolver, "enable_telocation", z);
        }

        public static void setTurnOverMuteEnabled(ContentResolver contentResolver, boolean z) {
            System.putBoolean(contentResolver, ENABLED_TURN_OVER_MUTE, z);
        }

        public static void setUnknownNumberRecordEnabled(ContentResolver contentResolver, boolean z) {
            System.putBoolean(contentResolver, ENABLED_UNKNOWN_NUMBER_RECORD, z);
        }

        public static void setVibrateKey(ContentResolver contentResolver, String str) {
            System.putString(contentResolver, CONNECT_DISCONNECT_VIBRATE, str);
        }

        public static void setVoiceServiceEnabled(ContentResolver contentResolver, boolean z) {
            System.putBoolean(contentResolver, ENABLED_VOICE_SERVICE, z);
        }

        public static void setYellowpageRecordEnabled(ContentResolver contentResolver, boolean z) {
            System.putBoolean(contentResolver, ENABLED_YELLOWPAGE_RECORD, z);
        }
    }

    public static final class VirtualSim {
        public static final int DC_ONLY_VIRTUAL_SIM = 1;
        public static final String MISIM_ID = "misim_id";
        public static final String MISIM_IMSI = "misim_imsi";
        public static final int NORMAL_VIRTUAL_SIM = 0;
        public static final int STATUS_DISABLING = 1;
        public static final int STATUS_ENABLING = 0;
        public static final int STATUS_NORMAL = 2;
        public static final String VIRTUAL_SIM_ICCID = "virtual_sim_iccid";
        public static final String VIRTUAL_SIM_IMSI = "virtual_sim_imsi";
        public static final String VIRTUAL_SIM_NETWORK_TYPE = "virtual_sim_network_type";
        public static final String VIRTUAL_SIM_SLOT_ID = "virtual_sim_slot_id";
        public static final String VIRTUAL_SIM_STATUS = "virtual_sim_status";
        public static final String VIRTUAL_SIM_TYPE = "virtual_sim_type";

        public static long getMiSimId(Context context) {
            return miui.provider.ExtraSettings.Secure.getLong(context.getContentResolver(), MISIM_ID, 0);
        }

        public static String getSupportNetworkType(Context context) {
            return miui.provider.ExtraSettings.Secure.getString(context.getContentResolver(), VIRTUAL_SIM_NETWORK_TYPE, "");
        }

        public static String getVirtualSimIccId(Context context) {
            return miui.provider.ExtraSettings.Secure.getString(context.getContentResolver(), VIRTUAL_SIM_ICCID, "");
        }

        public static String getVirtualSimImsi(Context context) {
            return miui.provider.ExtraSettings.Secure.getString(context.getContentResolver(), VIRTUAL_SIM_IMSI, "");
        }

        public static int getVirtualSimSlotId(Context context) {
            return miui.provider.ExtraSettings.Secure.getInt(context.getContentResolver(), VIRTUAL_SIM_SLOT_ID, 0);
        }

        public static int getVirtualSimStatus(Context context) {
            return miui.provider.ExtraSettings.Secure.getInt(context.getContentResolver(), VIRTUAL_SIM_STATUS, 2);
        }

        public static int getVirtualSimType(Context context) {
            return miui.provider.ExtraSettings.Secure.getInt(context.getContentResolver(), VIRTUAL_SIM_TYPE, 0);
        }

        public static boolean isMiSimEnabled(Context context) {
            String string = miui.provider.ExtraSettings.Secure.getString(context.getContentResolver(), MISIM_IMSI, null);
            return !TextUtils.isEmpty(string) && isVirtualSimEnabled(context) && string.equals(getVirtualSimImsi(context));
        }

        public static boolean isSupport4G(Context context) {
            String string = miui.provider.ExtraSettings.Secure.getString(context.getContentResolver(), VIRTUAL_SIM_NETWORK_TYPE, "");
            return TextUtils.isEmpty(string) || string.contains("4G");
        }

        public static boolean isVirtualSimEnabled(Context context) {
            return !TextUtils.isEmpty(getVirtualSimImsi(context));
        }

        public static void setMiSimId(Context context, long j) {
            miui.provider.ExtraSettings.Secure.putLong(context.getContentResolver(), MISIM_ID, j);
        }

        public static void setMiSimImsi(Context context, String str) {
            miui.provider.ExtraSettings.Secure.putString(context.getContentResolver(), MISIM_IMSI, str);
        }

        public static void setSupportNetworkType(Context context, String str) {
            miui.provider.ExtraSettings.Secure.putString(context.getContentResolver(), VIRTUAL_SIM_NETWORK_TYPE, str);
        }

        public static void setVirtualSimIccId(Context context, String str) {
            miui.provider.ExtraSettings.Secure.putString(context.getContentResolver(), VIRTUAL_SIM_ICCID, str);
        }

        public static void setVirtualSimImsi(Context context, String str) {
            miui.provider.ExtraSettings.Secure.putString(context.getContentResolver(), VIRTUAL_SIM_IMSI, str);
        }

        public static void setVirtualSimSlotId(Context context, int i) {
            miui.provider.ExtraSettings.Secure.putInt(context.getContentResolver(), VIRTUAL_SIM_SLOT_ID, i);
        }

        public static void setVirtualSimStatus(Context context, int i) {
            miui.provider.ExtraSettings.Secure.putInt(context.getContentResolver(), VIRTUAL_SIM_STATUS, i);
        }

        public static void setVirtualSimType(Context context, int i) {
            miui.provider.ExtraSettings.Secure.putInt(context.getContentResolver(), VIRTUAL_SIM_TYPE, i);
        }
    }

    public static final class XSpace {
        public static final Set<String> CROSS_PROFILE_SECURE_SETTINGS = new ArraySet();
        public static final int DEFAULT_SETTING_ALWAYS_ASK = 0;
        public static final int DEFAULT_SETTING_DEFAULT = 0;
        public static final int DEFAULT_SETTING_MAIN = 1;
        public static final int DEFAULT_SETTING_XSPACE = 2;
        public static final String FACEBOOK_PACKAGE_NAME = "com.facebook.katana";
        public static final String INSTAGRAM_PACKAGE_NAME = "com.instagram.android";
        public static final String KEY_DEFAULT_GUIDE_TIMES = "key_default_guide_times";
        public static final String KEY_FACEBOOK_LOGIN = "com.facebook.katana.ProxyAuth";
        public static final String KEY_FACEBOOK_OPEN_FROM_GOOGLE_VOICE_ASSISTANT = "com.google.android.googlequicksearchbox-com.facebook.katana";
        public static final String KEY_FACEBOOK_SEND = "com.facebook.platform.common.activity.PlatformWrapperActivity";
        public static final String KEY_INSTAGRAM_OPEN_FROM_GOOGLE_VOICE_ASSISTANT = "com.google.android.googlequicksearchbox-com.instagram.android";
        public static final String KEY_INSTAGRAM_SEND = "com.instagram.share.handleractivity.ShareHandlerActivity";
        public static final String KEY_WEIBO_OPEN = "com.sina.weibo.SplashActivity";
        public static final String KEY_WEIBO_OPEN_FROM_XIAOAI = "com.miui.voiceassist-com.sina.weibo";
        public static final String KEY_WEIBO_SEND = "com.sina.weibo.composerinde.ComposerDispatchActivity";
        public static final String KEY_WEIBO_SHARE = "com.sina.weibo.SSOActivity";
        public static final String KEY_WEIXIN_OPEN = "com.tencent.mm.ui.LauncherUI";
        public static final String KEY_WEIXIN_OPEN_FROM_XIAOAI = "com.miui.voiceassist-com.tencent.mm";
        public static final String KEY_WEIXIN_PAY = "com.tencent.mm.plugin.base.stub.WXPayEntryActivity";
        public static final String KEY_WEIXIN_SEND_TO_CIRCLE = "com.tencent.mm.ui.tools.ShareToTimeLineUI";
        public static final String KEY_WEIXIN_SEND_TO_FRIEND = "com.tencent.mm.ui.tools.ShareImgUI";
        public static final String KEY_WEIXIN_SHARE = "com.tencent.mm.plugin.base.stub.WXEntryActivity";
        public static final String KEY_WHATSAPP_OPEN_FROM_GOOGLE_VOICE_ASSISTANT = "com.google.android.googlequicksearchbox-com.whatsapp";
        public static final String KEY_WHATSAPP_SEND = "com.whatsapp.ContactPicker";
        public static final String KEY_XSPACE_BOOT_GUIDE_TIMES = "key_xspace_boot_guide_times";
        public static final String KEY_XSPACE_COMPETE_GUIDE_TIMES = "key_xspace_compete_guide_times";
        public static final String KEY_XSPACE_QQ_LOGIN = "com.tencent.open.agent.AgentActivity";
        public static final String KEY_XSPACE_QQ_OPEN = "com.tencent.mobileqq.activity.SplashActivity";
        public static final String KEY_XSPACE_QQ_OPEN_FROM_XIAOAI = "com.miui.voiceassist-com.tencent.mobileqq";
        public static final String KEY_XSPACE_QQ_SEND = "com.tencent.mobileqq.activity.qqSendActivity";
        public static final String KEY_XSPACE_QQ_SEND_TO_FRIEND = "com.tencent.mobileqq.activity.JumpActivity";
        public static final String KEY_XSPACE_QQ_SEND_TO_PC = "com.tencent.mobileqq.activity.qfileJumpActivity";
        public static final String PARAM_INTENT_KEY_COMPETE_XSPACE_GUIDE = "param_intent_key_compete_xspace_guide";
        public static final String PARAM_INTENT_KEY_DEFAULT = "param_intent_key_default";
        public static final String PARAM_INTENT_KEY_DEFAULT_ASKTYPE = "param_intent_key_default_asktype";
        public static final String PARAM_INTENT_KEY_HAS_EXTRA = "param_intent_key_has_extra";
        public static final String PARAM_INTENT_VALUE_COMPETE_BOOT_XSPACE_GUIDE = "param_intent_value_compete_boot_xspace_guide";
        public static final String PARAM_INTENT_VALUE_COMPETE_INSTALL_XSPACE_GUIDE = "param_intent_value_compete_install_xspace_guide";
        public static final String PARAM_INTENT_VALUE_COMPETE_TIMING_XSPACE_GUIDE = "param_intent_value_compete_timing_xspace_guide";
        public static final String PARAM_INTENT_VALUE_DEFAULT = "param_intent_value_default";
        public static final String PARAM_INTENT_VALUE_HAS_EXTRA = "param_intent_value_has_extra";
        public static final String PARAM_INTENT_VALUE_UNINSTALL_XSPACE_USER = "param_intent_value_uninstall_xspace_user";
        public static final String PREKEY_XSPACE_FACEBOOK_LOGIN = "facebook_login";
        public static final String PREKEY_XSPACE_FACEBOOK_OPEN = "facebook_open";
        public static final String PREKEY_XSPACE_FACEBOOK_SEND = "facebook_send";
        public static final String PREKEY_XSPACE_INSTAGRAM_OPEN = "instagram_open";
        public static final String PREKEY_XSPACE_INSTAGRAM_SEND = "instagram_send";
        public static final String PREKEY_XSPACE_QQ_LOGIN = "qq_login";
        public static final String PREKEY_XSPACE_QQ_OPEN = "qq_open";
        public static final String PREKEY_XSPACE_QQ_SEND = "qq_send";
        public static final String PREKEY_XSPACE_WEIBO_OPEN = "weibo_open";
        public static final String PREKEY_XSPACE_WEIBO_SEND = "weibo_send";
        public static final String PREKEY_XSPACE_WEIXIN_OPEN = "weixin_open";
        public static final String PREKEY_XSPACE_WEIXIN_PAY = "weixin_pay";
        public static final String PREKEY_XSPACE_WEIXIN_SHARE = "weixin_share";
        public static final String PREKEY_XSPACE_WHATSAPP_OPEN = "whatsapp_open";
        public static final String PREKEY_XSPACE_WHATSAPP_SEND = "whatsapp_send";
        public static final String QQ_PACKAGE_NAME = "com.tencent.mobileqq";
        public static final String WEIBO_PACKAGE_NAME = "com.sina.weibo";
        public static final String WEIXIN_PACKAGE_NAME = "com.tencent.mm";
        public static final String WHATSAPP_PACKAGE_NAME = "com.whatsapp";
        public static ArrayList<String> sCompeteXSpaceApps = new ArrayList<>();
        public static final ArrayList<String> sSupportDefaultSettingApps = new ArrayList<>();

        static {
            CROSS_PROFILE_SECURE_SETTINGS.add("lock_screen_allow_private_notifications");
            CROSS_PROFILE_SECURE_SETTINGS.add("lock_screen_show_notifications");
            sSupportDefaultSettingApps.add(KEY_WEIXIN_PAY);
            sSupportDefaultSettingApps.add(KEY_WEIXIN_SEND_TO_FRIEND);
            sSupportDefaultSettingApps.add(KEY_WEIXIN_SEND_TO_CIRCLE);
            sSupportDefaultSettingApps.add(KEY_WEIXIN_SHARE);
            sSupportDefaultSettingApps.add(KEY_WEIXIN_OPEN);
            sSupportDefaultSettingApps.add(KEY_WEIXIN_OPEN_FROM_XIAOAI);
            sSupportDefaultSettingApps.add(KEY_WEIBO_SEND);
            sSupportDefaultSettingApps.add(KEY_WEIBO_SHARE);
            sSupportDefaultSettingApps.add(KEY_WEIBO_OPEN);
            sSupportDefaultSettingApps.add(KEY_WEIBO_OPEN_FROM_XIAOAI);
            sSupportDefaultSettingApps.add(KEY_XSPACE_QQ_SEND_TO_FRIEND);
            sSupportDefaultSettingApps.add(KEY_XSPACE_QQ_SEND_TO_PC);
            sSupportDefaultSettingApps.add(KEY_XSPACE_QQ_LOGIN);
            sSupportDefaultSettingApps.add(KEY_XSPACE_QQ_OPEN);
            sSupportDefaultSettingApps.add(KEY_XSPACE_QQ_OPEN_FROM_XIAOAI);
            sSupportDefaultSettingApps.add(KEY_WHATSAPP_SEND);
            sSupportDefaultSettingApps.add(KEY_WHATSAPP_OPEN_FROM_GOOGLE_VOICE_ASSISTANT);
            sSupportDefaultSettingApps.add(KEY_FACEBOOK_SEND);
            sSupportDefaultSettingApps.add(KEY_FACEBOOK_LOGIN);
            sSupportDefaultSettingApps.add(KEY_FACEBOOK_OPEN_FROM_GOOGLE_VOICE_ASSISTANT);
            sSupportDefaultSettingApps.add(KEY_INSTAGRAM_SEND);
            sSupportDefaultSettingApps.add(KEY_INSTAGRAM_OPEN_FROM_GOOGLE_VOICE_ASSISTANT);
            sCompeteXSpaceApps.add("com.excelliance.multiaccount");
            sCompeteXSpaceApps.add("com.lbe.parallel.intl");
            sCompeteXSpaceApps.add("com.parallel.space.lite");
            sCompeteXSpaceApps.add("info.cloneapp.mochat.in.goast");
            sCompeteXSpaceApps.add("com.jiubang.commerce.gomultiple");
            sCompeteXSpaceApps.add("com.applisto.appcloner");
            sCompeteXSpaceApps.add("com.trigtech.privateme");
            sCompeteXSpaceApps.add("com.polestar.multiaccount");
            sCompeteXSpaceApps.add("com.vaibhav.accountsmanager");
            sCompeteXSpaceApps.add("com.in.parallel.accounts");
            sCompeteXSpaceApps.add("com.lbe.parallel");
            sCompeteXSpaceApps.add("com.excelliance.dualaid");
        }

        public static boolean belongToCrossXSpaceSecureSettings(String str, int i) {
            return XSpaceUserHandle.isXSpaceUserId(i) && CROSS_PROFILE_SECURE_SETTINGS.contains(str);
        }

        public static int getAskType(Context context, String str) {
            try {
                if (!str.equals(KEY_WEIXIN_SEND_TO_FRIEND) && !str.equals(KEY_WEIXIN_SEND_TO_CIRCLE)) {
                    if (!str.equals(KEY_WEIXIN_OPEN)) {
                        if (str.equals(KEY_WEIBO_SEND)) {
                            str = KEY_WEIBO_SHARE;
                        } else if (str.equals(KEY_XSPACE_QQ_SEND_TO_FRIEND) || str.equals(KEY_XSPACE_QQ_SEND_TO_PC) || str.equals(KEY_XSPACE_QQ_OPEN)) {
                            str = KEY_XSPACE_QQ_SEND;
                        }
                        return android.provider.Settings.Secure.getIntForUser(context.getContentResolver(), str, 0);
                    }
                }
                str = KEY_WEIXIN_SHARE;
                return android.provider.Settings.Secure.getIntForUser(context.getContentResolver(), str, 0);
            } catch (SettingNotFoundException e) {
                return 0;
            }
        }

        public static int getGuideNotificationTimes(Context context, String str) {
            try {
                return android.provider.Settings.Secure.getIntForUser(context.getContentResolver(), str, 0);
            } catch (SettingNotFoundException e) {
                return 0;
            }
        }

        public static String getSettingAppType(String str) {
            return PREKEY_XSPACE_WEIXIN_PAY.equals(str) ? KEY_WEIXIN_PAY : PREKEY_XSPACE_WEIXIN_SHARE.equals(str) ? KEY_WEIXIN_SHARE : PREKEY_XSPACE_WEIXIN_OPEN.equals(str) ? KEY_WEIXIN_OPEN_FROM_XIAOAI : PREKEY_XSPACE_WEIBO_SEND.equals(str) ? KEY_WEIBO_SHARE : PREKEY_XSPACE_WEIBO_OPEN.equals(str) ? KEY_WEIBO_OPEN_FROM_XIAOAI : PREKEY_XSPACE_QQ_SEND.equals(str) ? KEY_XSPACE_QQ_SEND : PREKEY_XSPACE_QQ_LOGIN.equals(str) ? KEY_XSPACE_QQ_LOGIN : PREKEY_XSPACE_QQ_OPEN.equals(str) ? KEY_XSPACE_QQ_OPEN_FROM_XIAOAI : PREKEY_XSPACE_WHATSAPP_SEND.equals(str) ? KEY_WHATSAPP_SEND : PREKEY_XSPACE_WHATSAPP_OPEN.equals(str) ? KEY_WHATSAPP_OPEN_FROM_GOOGLE_VOICE_ASSISTANT : PREKEY_XSPACE_FACEBOOK_SEND.equals(str) ? KEY_FACEBOOK_SEND : PREKEY_XSPACE_FACEBOOK_LOGIN.equals(str) ? KEY_FACEBOOK_LOGIN : PREKEY_XSPACE_FACEBOOK_OPEN.equals(str) ? KEY_FACEBOOK_OPEN_FROM_GOOGLE_VOICE_ASSISTANT : PREKEY_XSPACE_INSTAGRAM_SEND.equals(str) ? KEY_INSTAGRAM_SEND : PREKEY_XSPACE_INSTAGRAM_OPEN.equals(str) ? KEY_INSTAGRAM_OPEN_FROM_GOOGLE_VOICE_ASSISTANT : "";
        }

        public static void resetDefaultSetting(Context context, String str) {
            if (WEIXIN_PACKAGE_NAME.equals(str)) {
                setAskType(context, KEY_WEIXIN_PAY, 0);
                setAskType(context, KEY_WEIXIN_SHARE, 0);
                setAskType(context, KEY_WEIXIN_OPEN_FROM_XIAOAI, 0);
            } else if (WEIBO_PACKAGE_NAME.equals(str)) {
                setAskType(context, KEY_WEIBO_SHARE, 0);
                setAskType(context, KEY_WEIBO_OPEN_FROM_XIAOAI, 0);
            } else if (QQ_PACKAGE_NAME.equals(str)) {
                setAskType(context, KEY_XSPACE_QQ_SEND, 0);
                setAskType(context, KEY_XSPACE_QQ_LOGIN, 0);
                setAskType(context, KEY_XSPACE_QQ_OPEN_FROM_XIAOAI, 0);
            } else if (WHATSAPP_PACKAGE_NAME.equals(str)) {
                setAskType(context, KEY_WHATSAPP_SEND, 0);
                setAskType(context, KEY_WHATSAPP_OPEN_FROM_GOOGLE_VOICE_ASSISTANT, 0);
            } else if (FACEBOOK_PACKAGE_NAME.equals(str)) {
                setAskType(context, KEY_FACEBOOK_SEND, 0);
                setAskType(context, KEY_FACEBOOK_LOGIN, 0);
                setAskType(context, KEY_FACEBOOK_OPEN_FROM_GOOGLE_VOICE_ASSISTANT, 0);
            } else if (INSTAGRAM_PACKAGE_NAME.equals(str)) {
                setAskType(context, KEY_INSTAGRAM_SEND, 0);
                setAskType(context, KEY_INSTAGRAM_OPEN_FROM_GOOGLE_VOICE_ASSISTANT, 0);
            }
        }

        public static void setAskType(Context context, String str, int i) {
            if (str.equals(KEY_WEIXIN_SEND_TO_FRIEND) || str.equals(KEY_WEIXIN_SEND_TO_CIRCLE) || str.equals(KEY_WEIXIN_OPEN)) {
                str = KEY_WEIXIN_SHARE;
            } else if (str.equals(KEY_WEIBO_SEND)) {
                str = KEY_WEIBO_SHARE;
            } else if (str.equals(KEY_XSPACE_QQ_SEND_TO_FRIEND) || str.equals(KEY_XSPACE_QQ_SEND_TO_PC) || str.equals(KEY_XSPACE_QQ_OPEN)) {
                str = KEY_XSPACE_QQ_SEND;
            }
            android.provider.Settings.Secure.putIntForUser(context.getContentResolver(), str, i, 0);
        }

        public static void setGuideNotificationTimes(Context context, String str, int i) {
            android.provider.Settings.Secure.putIntForUser(context.getContentResolver(), str, i, 0);
        }
    }

    static {
        CROSS_PROFILE_SETTINGS.add("ringtone");
        CROSS_PROFILE_SETTINGS.add("notification_sound");
        CROSS_PROFILE_SETTINGS.add("alarm_alert");
        CROSS_PROFILE_SETTINGS.add("user_rotation");
        CROSS_PROFILE_SETTINGS.add("accelerometer_rotation");
        CROSS_PROFILE_SETTINGS.add("hide_rotation_lock_toggle_for_accessibility");
        CROSS_PROFILE_SETTINGS.add("frequent_phrases");
    }

    public static void getConfigurationForUser(ContentResolver contentResolver, Configuration configuration, int i) {
        boolean z = true;
        int i2 = android.provider.Settings.System.getInt(contentResolver, System.UI_MODE_SCALE, 1) & 15;
        if (!(i2 == 12 || i2 == 13 || i2 == 14 || i2 == 15 || i2 == 11)) {
            z = false;
        }
        if (z) {
            configuration.fontScale = MiuiConfiguration.getFontScale(i2);
        }
    }
}
