package com.bytedance.frameworks.core.monitor.config;

import com.bytedance.frameworks.core.monitor.MonitorCommonConstants;
import java.util.List;
import org.json.JSONObject;

public class DefaultMonitorConfigure implements IMonitorConfigure {
    public long getMonitorLogMaxSaveCount() {
        return 40000;
    }

    public boolean getRemoveSwitch() {
        return false;
    }

    public String getReportTypeByUploadType(String str) {
        return null;
    }

    public List<String> getReportTypeList() {
        return null;
    }

    public List<String> getUploadTypeByReportType(String str) {
        return null;
    }

    public boolean isLogSendSwitch() {
        return true;
    }

    public int reportCount() {
        return 100;
    }

    public int reportFailRepeatBaseTime() {
        return 15;
    }

    public int reportFailRepeatCount() {
        return 4;
    }

    public int reportInterval() {
        return 120;
    }

    public JSONObject reportJsonHeaderInfo() {
        return null;
    }

    public List<String> reportUrl(String str) {
        return null;
    }

    public long stopMoreChannelInterval() {
        return MonitorCommonConstants.STOP_MORE_CHANNEL_INTERVAL;
    }
}
