package com.ss.android.vesdk;

import android.content.Context;
import android.support.annotation.NonNull;
import android.util.Log;
import com.ss.android.ttve.common.TELogUtil;
import com.ss.android.ttve.monitor.MonitorUtils;
import com.ss.android.ttve.monitor.TEMonitor;
import com.ss.android.ttve.nativePort.TEEffectUtils;
import com.ss.android.ttve.oauth.TEOAuth;
import com.ss.android.ttve.oauth.TEOAuthResult;
import com.ss.android.vesdk.VEListener.VEMonitorListener;
import com.ss.android.vesdk.runtime.VEEnv;
import com.ss.android.vesdk.runtime.VEExternalMonitorListener;
import com.ss.android.vesdk.runtime.VERuntime;
import java.io.File;

public class VESDK {
    public static int MONITOR_ACTION_CANCEL = TEMonitor.MONITOR_ACTION_CANCEL;
    public static String VESDK_COMPILE_ID = "139_139_170";

    public static TEOAuthResult activate(Context context, @NonNull String str, @NonNull String str2, @NonNull String str3) {
        return TEOAuth.activate(context, str, str2, str3);
    }

    public static void destroy() {
        VERuntime.getInstance().destroy();
    }

    public static String getActivationCode() {
        return TEOAuth.getActivationCode();
    }

    public static String getEffectSDKVer() {
        String effectVersion = TEEffectUtils.getEffectVersion();
        StringBuilder sb = new StringBuilder();
        sb.append("Effect Ver is : ");
        sb.append(effectVersion);
        Log.d("Steven", sb.toString());
        return effectVersion;
    }

    @Deprecated
    public static void init(@NonNull Context context, @NonNull VEEnv vEEnv) {
        VERuntime.getInstance().init(context, vEEnv);
    }

    public static void init(@NonNull Context context, @NonNull String str) {
        VERuntime.getInstance().init(context, str);
    }

    public static void monitorClear() {
        TEMonitor.clear();
    }

    public static void monitorRegister(VEMonitorListener vEMonitorListener) {
        VERuntime.getInstance().registerMonitor(vEMonitorListener);
    }

    public static void monitorReport(int i) {
        TEMonitor.report(i);
    }

    public static boolean needUpdateEffectModelFiles() throws VEException {
        int needUpdateEffectModelFiles = VERuntime.getInstance().needUpdateEffectModelFiles();
        if (needUpdateEffectModelFiles != -108) {
            return needUpdateEffectModelFiles == 0;
        }
        throw new VEException(needUpdateEffectModelFiles, "please set setWorkspace in VESDK init");
    }

    @Deprecated
    public static void setAB(@NonNull VEAB veab) {
        VERuntime.getInstance().setAB(veab);
    }

    public static void setAppFiled(@NonNull VEAppField vEAppField) {
        MonitorUtils.setUserId(vEAppField.userId);
        MonitorUtils.setDeviceId(vEAppField.deviceId);
        MonitorUtils.setAppVersion(vEAppField.version);
    }

    public static void setCustomEffectModelDir(String str) {
        File file = new File(str);
        if (!file.exists() || !file.isDirectory()) {
            throw new IllegalArgumentException("Set custom EffectModel dir which is not exist or not a directory. (EffectModel path should point to a directory)");
        }
        VERuntime.getInstance().updateEffectModelFiles(file);
    }

    public static void setExternalMonitorListener(@NonNull VEExternalMonitorListener vEExternalMonitorListener) {
        VERuntime.getInstance().setExternalMonitorListener(vEExternalMonitorListener);
    }

    public static void setLogLevel(byte b) {
        TELogUtil.setUp(null, b);
    }

    public static void setSDKMonitorEnable(boolean z) {
        TEMonitor.setSDKMonitorEnable(z);
    }

    public static void updateEffectModelFiles() throws VEException {
        if (needUpdateEffectModelFiles()) {
            int updateEffectModelFiles = VERuntime.getInstance().updateEffectModelFiles();
            if (updateEffectModelFiles == -108) {
                throw new VEException(updateEffectModelFiles, "please set VEEnv or VEEnv#setWorkspace");
            } else if (updateEffectModelFiles == -1) {
                throw new VEException(updateEffectModelFiles, "fail when updating model files");
            }
        }
    }
}
