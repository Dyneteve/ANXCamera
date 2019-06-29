package com.bytedance.frameworks.core.monitor.config;

import android.text.TextUtils;
import com.bytedance.frameworks.core.monitor.MonitorCommonConstants;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import org.json.JSONObject;

public class MonitorConfigure {
    private static ConcurrentHashMap<String, IMonitorConfigure> sAid2MonitorCogfigMap = new ConcurrentHashMap<>();
    private static IMonitorConfigure sDefCommonConfig = new DefaultMonitorConfigure();

    static {
        sAid2MonitorCogfigMap.put(MonitorCommonConstants.DEFAULT_AID, sDefCommonConfig);
    }

    public static boolean getLogRemoveSwitch(String str) {
        return (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) ? sDefCommonConfig.getRemoveSwitch() : ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).getRemoveSwitch();
    }

    public static long getMaxMonitorLogSaveCount(String str) {
        return (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) ? sDefCommonConfig.getMonitorLogMaxSaveCount() : ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).getMonitorLogMaxSaveCount();
    }

    public static int getReportCount(String str) {
        return (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) ? sDefCommonConfig.reportCount() : ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).reportCount();
    }

    public static int getReportFailBaseTime(String str) {
        return (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) ? sDefCommonConfig.reportFailRepeatBaseTime() * 1000 : ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).reportFailRepeatBaseTime() * 1000;
    }

    public static int getReportFailRepeatCount(String str) {
        return (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) ? sDefCommonConfig.reportFailRepeatCount() : ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).reportFailRepeatCount();
    }

    public static int getReportInterval(String str) {
        return (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) ? sDefCommonConfig.reportInterval() : ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).reportInterval();
    }

    public static JSONObject getReportJsonHeaderInfo(String str) {
        return (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) ? sDefCommonConfig.reportJsonHeaderInfo() : ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).reportJsonHeaderInfo();
    }

    public static String getReportTypeByUploadType(String str, String str2) {
        return (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) ? sDefCommonConfig.getReportTypeByUploadType(str2) : ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).getReportTypeByUploadType(str2);
    }

    public static List<String> getReportTypeList(String str) {
        return (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) ? sDefCommonConfig.getReportTypeList() : ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).getReportTypeList();
    }

    public static List<String> getReportUrl(String str, String str2) {
        return (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) ? sDefCommonConfig.reportUrl(str2) : ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).reportUrl(str2);
    }

    public static long getStopMoreChannelInterval(String str) {
        return (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) ? sDefCommonConfig.stopMoreChannelInterval() : ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).stopMoreChannelInterval();
    }

    public static List<String> getUploadTypeByReportType(String str, String str2) {
        return (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) ? sDefCommonConfig.getUploadTypeByReportType(str2) : ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).getUploadTypeByReportType(str2);
    }

    public static void setCommonConfig(IMonitorConfigure iMonitorConfigure) {
        sDefCommonConfig = iMonitorConfigure;
        setCommonConfig(MonitorCommonConstants.DEFAULT_AID, iMonitorConfigure);
    }

    public static void setCommonConfig(String str, IMonitorConfigure iMonitorConfigure) {
        if (iMonitorConfigure != null) {
            sAid2MonitorCogfigMap.put(str, iMonitorConfigure);
        }
    }
}
