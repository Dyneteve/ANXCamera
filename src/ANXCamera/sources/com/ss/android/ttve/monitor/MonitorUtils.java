package com.ss.android.ttve.monitor;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.text.TextUtils;
import android.util.Log;
import bytedance.framwork.core.sdkmonitor.SDKMonitor;
import bytedance.framwork.core.sdkmonitor.SDKMonitor.IGetCommonParams;
import bytedance.framwork.core.sdkmonitor.SDKMonitorUtils;
import com.ss.android.vesdk.keyvaluepair.VEKeyValue;
import com.ss.android.vesdk.runtime.VERuntime;
import com.ss.android.vesdk.runtime.cloudconfig.DeviceInfoDetector;
import java.util.Map.Entry;
import org.json.JSONException;
import org.json.JSONObject;

@RestrictTo({Scope.LIBRARY})
public class MonitorUtils {
    public static final String KEY_APP_VERSION = "app_version";
    public static final String KEY_CHANNEL = "channel";
    public static final String KEY_DEVICE_ID = "device_id";
    public static final String KEY_PACKAGE_NAME = "package_name";
    public static final String KEY_USER_ID = "user_id";
    public static final String KEY_VERSION_CODE = "version_code";
    public static final String MONITOR_AID = "1357";
    public static final String MONITOR_SERVICE_NAME = "sdk_video_edit_compose";
    private static final String TAG = "MonitorUtils";
    private static boolean sEnable = true;

    private static JSONObject generateHeaderInfo(@NonNull Context context, @NonNull String str, @NonNull String str2, String str3) {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("device_id", str);
            jSONObject.put("app_version", "medialib_oem:2.9.0.14_20190325110154_xiaomi_46495c4e9_v8a");
            jSONObject.put("channel", "release");
            jSONObject.put("package_name", context.getPackageName());
            jSONObject.put(KEY_USER_ID, str2);
            jSONObject.put("version_code", str3);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jSONObject;
    }

    public static String getAppVersion() {
        return getHeaderInfo("app_version");
    }

    public static String getDeviceId() {
        return getHeaderInfo("device_id");
    }

    private static String getHeaderInfo(String str) {
        if (!sEnable) {
            Log.w(TAG, "getHeaderInfo: Monitor not enabled just return.");
            return null;
        }
        SDKMonitor instance = SDKMonitorUtils.getInstance(MONITOR_AID);
        if (instance == null) {
            Log.e(TAG, "SDKMonitor is not inited, setDeviceId failed!");
            return null;
        }
        JSONObject reportJsonHeaderInfo = instance.reportJsonHeaderInfo();
        if (reportJsonHeaderInfo != null) {
            try {
                return reportJsonHeaderInfo.getString(str);
            } catch (JSONException e) {
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("getHeaderInfo failed! key = ");
                sb.append(str);
                Log.e(str2, sb.toString(), e);
            }
        }
        return null;
    }

    public static String getUserId() {
        return getHeaderInfo(KEY_USER_ID);
    }

    public static void init(@NonNull Context context, String str, String str2, String str3) {
        if (!sEnable) {
            Log.w(TAG, "init: Monitor not enabled just return.");
        } else {
            SDKMonitorUtils.init(context, MONITOR_AID, generateHeaderInfo(context, str, str2, str3), new IGetCommonParams() {
                public String getSessionId() {
                    return null;
                }
            });
        }
    }

    public static void monitorStatistics(String str, int i, VEKeyValue vEKeyValue) {
        if (!sEnable) {
            Log.w(TAG, "monitorStatistics: Monitor not enabled just return.");
            return;
        }
        JSONObject parseJsonObj = vEKeyValue == null ? null : vEKeyValue.parseJsonObj();
        if (!VERuntime.getInstance().notifyExternalMonitor(str, i, parseJsonObj == null ? null : parseJsonObj.toString())) {
            SDKMonitorUtils.getInstance(MONITOR_AID).monitorStatusAndDuration(str, i, parseJsonObj, null);
        }
    }

    public static void monitorStatusRate(String str, int i, JSONObject jSONObject) {
        if (!sEnable) {
            Log.w(TAG, "monitorStatusRate: Monitor not enabled just return.");
        } else if (jSONObject == null) {
            Log.w(TAG, "monitorStatusRate: empty log data!");
        } else {
            if (TextUtils.isEmpty(getHeaderInfo("device_id"))) {
                setHeaderInfo("device_id", "Unknown");
                Log.e(TAG, "Device id is empty, please set device id with 1. TEMonitor.setDeviceId(deviceid) before using SDK. \n 2. Use TEMonitor.setSDKMonitorEnable(false) to disable SDKMonitor.");
            }
            if (TextUtils.isEmpty(getHeaderInfo(KEY_USER_ID))) {
                setHeaderInfo(KEY_USER_ID, "Unknown");
                Log.e(TAG, "User id is empty, please set user id with TEMonitor.setUserId(userid) before using SDK\n 2. Use TEMonitor.setSDKMonitorEnable(false) to disable SDKMonitor.");
            }
            if (TextUtils.isEmpty(getHeaderInfo("app_version"))) {
                setHeaderInfo("app_version", "Unknown");
                Log.e(TAG, "App version is empty, please set app version with TEMonitor.setAppVersion(version) before using SDK\n 2. Use TEMonitor.setSDKMonitorEnable(false) to disable SDKMonitor.");
            }
            try {
                for (Entry entry : DeviceInfoDetector.toMap().entrySet()) {
                    String str2 = (String) entry.getValue();
                    if (!DeviceInfoDetector.sNumberKeys.contains(entry.getKey())) {
                        StringBuilder sb = new StringBuilder();
                        sb.append(TEMonitorKeys.TETRACKER_DEVICE_INFO_PREFIX);
                        sb.append((String) entry.getKey());
                        jSONObject.put(sb.toString(), str2);
                    } else if (!TextUtils.isEmpty(str2)) {
                        try {
                            float parseFloat = Float.parseFloat(str2);
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append(TEMonitorKeys.TETRACKER_DEVICE_INFO_PREFIX);
                            sb2.append((String) entry.getKey());
                            jSONObject.put(sb2.toString(), (double) parseFloat);
                        } catch (Exception e) {
                            String str3 = TAG;
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("Device info value is error key = ");
                            sb3.append((String) entry.getKey());
                            Log.e(str3, sb3.toString());
                        }
                    }
                }
            } catch (JSONException e2) {
                Log.e(TAG, "monitorStatusRate: json exception!", e2);
            }
            SDKMonitorUtils.getInstance(MONITOR_AID).monitorStatusAndDuration(str, i, jSONObject, null);
        }
    }

    public static void setAppVersion(String str) {
        setHeaderInfo("app_version", str);
    }

    public static void setDeviceId(String str) {
        setHeaderInfo("device_id", str);
    }

    public static void setEnable(boolean z) {
        sEnable = z;
    }

    private static void setHeaderInfo(String str, String str2) {
        if (!sEnable) {
            Log.w(TAG, "setHeaderInfo: Monitor not enabled just return.");
            return;
        }
        SDKMonitor instance = SDKMonitorUtils.getInstance(MONITOR_AID);
        if (instance == null) {
            Log.e(TAG, "SDKMonitor is not inited, setDeviceId failed!");
            return;
        }
        JSONObject reportJsonHeaderInfo = instance.reportJsonHeaderInfo();
        if (reportJsonHeaderInfo != null) {
            try {
                reportJsonHeaderInfo.put(str, str2);
            } catch (JSONException e) {
                String str3 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("setHeaderInfo failed! key = ");
                sb.append(str);
                Log.e(str3, sb.toString(), e);
            }
        }
    }

    public static void setUserId(String str) {
        setHeaderInfo(KEY_USER_ID, str);
    }
}
