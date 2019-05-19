package com.ss.android.ttve.monitor;

import android.text.TextUtils;
import android.util.Log;
import com.ss.android.medialib.log.IMonitor;
import com.ss.android.medialib.log.VEMonitor;
import com.ss.android.medialib.log.VEMonitorKeys;
import com.ss.android.ttve.common.TELogUtil;
import com.ss.android.vesdk.runtime.VERuntime;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class TEMonitor {
    public static int MONITOR_ACTION_CANCEL = 0;
    public static int MONITOR_ACTION_COMPILE = 1;
    private static final String TAG = "TEMonitor";
    private static WeakReference<IMonitor> sMonitor;

    public static void clear() {
        TEMonitorInvoker.nativeReset();
        VEMonitor.clear();
    }

    public static String getAppVersion() {
        return MonitorUtils.getAppVersion();
    }

    public static String getDeviceId() {
        return MonitorUtils.getDeviceId();
    }

    private static int getIsComplete(JSONObject jSONObject) {
        try {
            if (jSONObject.has("completed")) {
                return jSONObject.getInt("completed");
            }
            return 0;
        } catch (JSONException e) {
            TELogUtil.e(TAG, "get complete filed error!");
            e.printStackTrace();
            return 0;
        }
    }

    public static String getUserId() {
        return MonitorUtils.getUserId();
    }

    public static void init() {
        MonitorUtils.init(VERuntime.getInstance().getContext(), null, null, null);
        TEMonitorInvoker.nativeInit();
        VEMonitor.register(new IMonitor() {
            public void monitorLog(String str, JSONObject jSONObject) {
                TEMonitor.monitorVELog(jSONObject);
            }
        });
    }

    public static boolean monitorTELog(String str, String str2, float f) {
        HashMap hashMap = new HashMap();
        hashMap.put(str2, Float.valueOf(f));
        return monitorTELog(str, str2, (Map) hashMap);
    }

    public static boolean monitorTELog(String str, String str2, long j) {
        HashMap hashMap = new HashMap();
        hashMap.put(str2, Long.valueOf(j));
        return monitorTELog(str, str2, (Map) hashMap);
    }

    public static boolean monitorTELog(String str, String str2, String str3) {
        HashMap hashMap = new HashMap();
        hashMap.put(str2, str3);
        return monitorTELog(str, str2, (Map) hashMap);
    }

    public static boolean monitorTELog(String str, String str2, Map map) {
        return monitorTELog(sMonitor, str, str2, map);
    }

    private static boolean monitorTELog(WeakReference<IMonitor> weakReference, String str, String str2, Map map) {
        if (weakReference == null) {
            TELogUtil.d(TAG, "No monitor callback, return");
            return false;
        }
        map.putAll(VEMonitor.getMap());
        JSONObject jSONObject = new JSONObject();
        try {
            putAll(map, jSONObject);
            if (!TextUtils.isEmpty(str2)) {
                jSONObject.put("service", str2);
            }
            reportMonitor(weakReference, str, jSONObject);
            return true;
        } catch (JSONException e) {
            TELogUtil.d(TAG, "No monitor callback, skip");
            return false;
        }
    }

    /* access modifiers changed from: private */
    public static void monitorVELog(JSONObject jSONObject) {
        try {
            putAll(TEMonitorInvoker.nativeGetMap(), jSONObject);
        } catch (JSONException e) {
            TELogUtil.e(TAG, "merge monitor logs error");
            e.printStackTrace();
        }
        getIsComplete(jSONObject);
        reportMonitor(sMonitor, "sdk_video_edit_compose", jSONObject);
    }

    public static void perfDouble(String str, double d) {
        if (TextUtils.isEmpty(str)) {
            TELogUtil.w(TAG, "perfDouble: key is null");
        } else {
            TEMonitorInvoker.nativePerfDouble(str, d);
        }
    }

    public static void perfLong(String str, long j) {
        if (TextUtils.isEmpty(str)) {
            TELogUtil.w(TAG, "perfLong: key is null");
        } else {
            TEMonitorInvoker.nativePerfLong(str, j);
        }
    }

    public static void perfRational(String str, float f, float f2) {
        if (TextUtils.isEmpty(str)) {
            TELogUtil.w(TAG, "perfLong: key is null");
        } else {
            TEMonitorInvoker.nativePerfRational(str, f, f2);
        }
    }

    public static void perfString(String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            TELogUtil.w(TAG, "perfString: key is null");
            return;
        }
        if (str2 == null) {
            str2 = "";
        }
        TEMonitorInvoker.nativePerfString(str, str2);
    }

    private static void putAll(Map map, JSONObject jSONObject) throws JSONException {
        for (String str : map.keySet()) {
            int type = str.startsWith("iesve_") ? VEMonitorKeys.getType(str) : TEMonitorKeys.getType(str);
            if (type == TEMonitorKeys.TYPE_INT) {
                try {
                    jSONObject.put(str, Integer.parseInt((String) map.get(str)));
                } catch (Exception e) {
                    String str2 = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Parse int error:");
                    sb.append(map.get(str));
                    TELogUtil.d(str2, sb.toString());
                }
            } else if (type == TEMonitorKeys.TYPE_DOUBLE) {
                try {
                    jSONObject.put(str, (double) Float.parseFloat((String) map.get(str)));
                } catch (Exception e2) {
                    TELogUtil.d(TAG, "Parse float error");
                }
            } else {
                jSONObject.put(str, map.get(str));
            }
        }
    }

    public static void register(IMonitor iMonitor) {
        sMonitor = new WeakReference<>(iMonitor);
    }

    public static void report(int i) {
        TEMonitorInvoker.nativeMonitorPerf(i);
    }

    private static void reportMonitor(WeakReference<IMonitor> weakReference, String str, JSONObject jSONObject) {
        int i;
        String str2 = "sdk_video_edit_compose";
        if (jSONObject != null) {
            i = getIsComplete(jSONObject);
            try {
                if (jSONObject.has("service")) {
                    str2 = jSONObject.getString("service");
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        } else {
            i = 0;
        }
        MonitorUtils.monitorStatusRate(str2, i, jSONObject);
        if (weakReference != null && weakReference.get() != null) {
            try {
                ((IMonitor) weakReference.get()).monitorLog(str, jSONObject);
            } catch (Exception e2) {
                Log.e(TAG, "Something happened when monitor log", e2);
            }
        }
    }

    public static void setAppVersion(String str) {
        MonitorUtils.setAppVersion(str);
    }

    public static void setDeviceId(String str) {
        MonitorUtils.setDeviceId(str);
    }

    public static void setSDKMonitorEnable(boolean z) {
        MonitorUtils.setEnable(z);
    }

    public static void setUserId(String str) {
        MonitorUtils.setUserId(str);
    }
}
