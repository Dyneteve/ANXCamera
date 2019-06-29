package com.bytedance.frameworks.core.monitor;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import com.bytedance.frameworks.core.monitor.config.MonitorConfigure;
import com.bytedance.frameworks.core.monitor.model.LocalLog;
import com.bytedance.frameworks.core.monitor.model.LocalVersionInfo;
import com.bytedance.frameworks.core.monitor.model.UploadLogLegacyCommand;
import com.bytedance.frameworks.core.monitor.net.DefaultLogSendImpl;
import com.bytedance.frameworks.core.monitor.net.MonitorLogSender;
import com.bytedance.frameworks.core.monitor.util.JsonUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import org.json.JSONArray;
import org.json.JSONObject;

public class LogReportManager {
    private static final String TAG = "LogReportManager";
    private String mAid;
    private volatile boolean mCollectLogSwitch = true;
    private JSONObject mHeaderInfo;
    private int mInterval = 120;
    private long mLastPackTime = 0;
    private LogStoreManager mLogStoreManager;
    private int mReportCount = 100;

    protected LogReportManager(Context context, String str, LogStoreManager logStoreManager) {
        StringBuilder sb = new StringBuilder();
        sb.append("LogReportManager: ");
        sb.append(logStoreManager.getAid());
        sb.append(" , threadName: ");
        sb.append(Thread.currentThread().getName());
        Log.d("monitorlib", sb.toString());
        this.mAid = str;
        this.mLogStoreManager = logStoreManager;
        MonitorLogSender.setImpl(str, "monitor", new DefaultLogSendImpl(context, str, "monitor"));
    }

    private LogStoreManager getLocalStore() {
        return this.mLogStoreManager;
    }

    private boolean sendLog(String str, JSONArray jSONArray, JSONArray jSONArray2, JSONArray jSONArray3, long j, boolean z) {
        try {
            JSONObject jSONObject = new JSONObject();
            if (JsonUtil.hasData(jSONArray)) {
                jSONObject.put("data", jSONArray);
            }
            if (JsonUtil.hasData(jSONArray2)) {
                jSONObject.put(MonitorCommonConstants.COUNT_TYPE, jSONArray2);
            }
            if (JsonUtil.hasData(jSONArray3)) {
                jSONObject.put(MonitorCommonConstants.TIMER_TYPE, jSONArray3);
            }
            if (!JsonUtil.hasData(jSONObject) || this.mHeaderInfo == null) {
                return true;
            }
            JSONObject jSONObject2 = new JSONObject(this.mHeaderInfo.toString());
            LocalVersionInfo localVersionById = getLocalStore().getLocalVersionById(j);
            if (localVersionById != null) {
                if (!TextUtils.isEmpty(localVersionById.versionCode)) {
                    jSONObject2.put("version_code", localVersionById.versionCode);
                }
                if (!TextUtils.isEmpty(localVersionById.versionName)) {
                    jSONObject2.put(DBHelper.COL_VERSION_NAME, localVersionById.versionName);
                }
                if (!TextUtils.isEmpty(localVersionById.manifestVersionCode)) {
                    jSONObject2.put(DBHelper.COL_MANIFEST_VERSION_CODE, localVersionById.manifestVersionCode);
                }
                if (!TextUtils.isEmpty(localVersionById.updateVersionCode)) {
                    jSONObject2.put(DBHelper.COL_UPDATE_VERSION_CODE, localVersionById.updateVersionCode);
                }
            }
            jSONObject2.put("debug_fetch", z ? 1 : 0);
            jSONObject.put("header", jSONObject2);
            return MonitorLogSender.send(this.mAid, str, jSONObject.toString());
        } catch (Throwable th) {
            return false;
        }
    }

    private void setHeaderInfo(JSONObject jSONObject) {
        this.mHeaderInfo = jSONObject;
    }

    private void setReportCount(int i) {
        if (i > 0) {
            this.mReportCount = i;
        }
    }

    private void setReportInterval(int i) {
        if (i > 0) {
            this.mInterval = i;
        }
    }

    /* access modifiers changed from: protected */
    public void packAndSendLog() {
        if (this.mCollectLogSwitch) {
            long currentTimeMillis = System.currentTimeMillis();
            if (getLocalStore().getLogSampledCount() > ((long) this.mReportCount) || (currentTimeMillis - this.mLastPackTime) / 1000 > ((long) this.mInterval)) {
                this.mLastPackTime = currentTimeMillis;
                List<String> reportTypeList = MonitorConfigure.getReportTypeList(this.mAid);
                if (reportTypeList != null) {
                    for (String str : reportTypeList) {
                        packOneReportType(str, MonitorConfigure.getUploadTypeByReportType(this.mAid, str), 100);
                    }
                }
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:38:0x00bf A[Catch:{ Exception -> 0x00d1 }] */
    /* JADX WARNING: Removed duplicated region for block: B:39:0x00c2 A[Catch:{ Exception -> 0x00d1 }] */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x00c6 A[Catch:{ Exception -> 0x00d1 }] */
    public void packOneReportType(String str, List<String> list, int i) {
        boolean z;
        boolean z2;
        char c;
        List<LocalLog> logSampled = getLocalStore().getLogSampled(list, i);
        if (logSampled != null && logSampled.size() > 0) {
            try {
                JSONArray jSONArray = new JSONArray();
                JSONArray jSONArray2 = new JSONArray();
                JSONArray jSONArray3 = new JSONArray();
                StringBuilder sb = new StringBuilder();
                long j = -1;
                boolean z3 = false;
                JSONArray jSONArray4 = jSONArray;
                JSONArray jSONArray5 = jSONArray2;
                JSONArray jSONArray6 = jSONArray3;
                long j2 = -1;
                int i2 = 0;
                boolean z4 = true;
                for (LocalLog localLog : logSampled) {
                    if (j2 == j) {
                        z2 = z;
                        j2 = localLog.versionId;
                    } else {
                        if (localLog.versionId != j2) {
                            z = sendLog(str, jSONArray4, jSONArray5, jSONArray6, j2, false) && z;
                            long j3 = localLog.versionId;
                            JSONArray jSONArray7 = new JSONArray();
                            JSONArray jSONArray8 = new JSONArray();
                            j2 = j3;
                            jSONArray6 = new JSONArray();
                            jSONArray5 = jSONArray8;
                            jSONArray4 = jSONArray7;
                        }
                        z2 = z;
                    }
                    long j4 = localLog.id;
                    String str2 = localLog.type;
                    String str3 = localLog.data;
                    if (i2 == 0) {
                        sb.append(j4);
                    } else {
                        sb.append(",");
                        sb.append(j4);
                    }
                    try {
                        JSONObject jSONObject = new JSONObject(str3);
                        int hashCode = str2.hashCode();
                        if (hashCode != 94851343) {
                            if (hashCode == 110364485) {
                                if (str2.equals(MonitorCommonConstants.TIMER_TYPE)) {
                                    c = 1;
                                    switch (c) {
                                        case 0:
                                            jSONArray5.put(jSONObject);
                                            break;
                                        case 1:
                                            jSONArray6.put(jSONObject);
                                            break;
                                        default:
                                            jSONObject.put("log_id", j4);
                                            jSONArray4.put(jSONObject);
                                            break;
                                    }
                                    i2++;
                                    z4 = z2;
                                    j = -1;
                                }
                            }
                        } else if (str2.equals(MonitorCommonConstants.COUNT_TYPE)) {
                            c = 0;
                            switch (c) {
                                case 0:
                                    break;
                                case 1:
                                    break;
                            }
                            i2++;
                            z4 = z2;
                            j = -1;
                        }
                        c = 65535;
                        switch (c) {
                            case 0:
                                break;
                            case 1:
                                break;
                        }
                    } catch (Exception e) {
                    }
                    i2++;
                    z4 = z2;
                    j = -1;
                }
                if (sendLog(str, jSONArray4, jSONArray5, jSONArray6, j2, false) && z) {
                    z3 = true;
                }
                if (z3) {
                    getLocalStore().deleteLocalLogByIds(sb.toString());
                }
            } catch (Exception e2) {
                String str4 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("json resolve failed:");
                sb2.append(Log.getStackTraceString(e2));
                Log.e(str4, sb2.toString());
            }
        }
    }

    public void setCollectLogSwitch(boolean z) {
        this.mCollectLogSwitch = z;
    }

    /* access modifiers changed from: protected */
    public void updateConfig() {
        setReportInterval(MonitorConfigure.getReportInterval(this.mAid));
        setReportCount(MonitorConfigure.getReportCount(this.mAid));
        setHeaderInfo(MonitorConfigure.getReportJsonHeaderInfo(this.mAid));
    }

    /* JADX WARNING: Removed duplicated region for block: B:28:0x0091 A[Catch:{ Throwable -> 0x01e5 }] */
    public void uploadLegacyLog(UploadLogLegacyCommand uploadLogLegacyCommand) {
        long j;
        int i;
        long j2;
        Iterator it;
        StringBuilder sb;
        int i2;
        JSONArray jSONArray;
        UploadLogLegacyCommand uploadLogLegacyCommand2 = uploadLogLegacyCommand;
        try {
            long j3 = uploadLogLegacyCommand2.startTime;
            long j4 = uploadLogLegacyCommand2.endTime;
            List<String> uploadTypeList = uploadLogLegacyCommand.getUploadTypeList();
            HashMap hashMap = new HashMap();
            if (uploadTypeList != null) {
                if (uploadTypeList.size() != 0) {
                    for (String str : uploadTypeList) {
                        String reportTypeByUploadType = MonitorConfigure.getReportTypeByUploadType(this.mAid, str);
                        if (!TextUtils.isEmpty(reportTypeByUploadType)) {
                            if (hashMap.containsKey(reportTypeByUploadType)) {
                                List list = (List) hashMap.get(reportTypeByUploadType);
                                list.add(str);
                                hashMap.put(reportTypeByUploadType, list);
                            } else {
                                ArrayList arrayList = new ArrayList();
                                arrayList.add(str);
                                hashMap.put(reportTypeByUploadType, arrayList);
                            }
                        }
                    }
                    boolean z = true;
                    int i3 = 0;
                    boolean z2 = false;
                    for (Entry entry : hashMap.entrySet()) {
                        List list2 = (List) entry.getValue();
                        String str2 = (String) entry.getKey();
                        int i4 = i3;
                        boolean z3 = z2;
                        boolean z4 = z;
                        while (true) {
                            LogStoreManager localStore = getLocalStore();
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append(i4);
                            sb2.append(",");
                            sb2.append(MonitorCommonConstants.MAX_COUNT_UPLOAD_SINGLE_TIME);
                            List localLog = localStore.getLocalLog(j3, j4, list2, sb2.toString());
                            if (localLog == null || localLog.size() <= 0) {
                                j = j3;
                                i4 = i4;
                                i = 0;
                            } else {
                                int size = localLog.size();
                                JSONArray jSONArray2 = new JSONArray();
                                Iterator it2 = localLog.iterator();
                                StringBuilder sb3 = new StringBuilder();
                                JSONArray jSONArray3 = jSONArray2;
                                boolean z5 = z4;
                                long j5 = -1;
                                int i5 = 0;
                                while (it2.hasNext()) {
                                    try {
                                        LocalLog localLog2 = (LocalLog) it2.next();
                                        if (j5 == -1) {
                                            j5 = localLog2.versionId;
                                            sb = sb3;
                                            it = it2;
                                            j2 = j3;
                                            jSONArray = jSONArray3;
                                            i2 = i4;
                                        } else if (localLog2.versionId != j5) {
                                            sb = sb3;
                                            it = it2;
                                            j2 = j3;
                                            i2 = i4;
                                            try {
                                                boolean z6 = sendLog(str2, jSONArray3, null, null, j5, true) && z5;
                                                try {
                                                    long j6 = localLog2.versionId;
                                                    try {
                                                        jSONArray = new JSONArray();
                                                        z5 = z6;
                                                        j5 = j6;
                                                    } catch (Exception e) {
                                                        z5 = z6;
                                                        j5 = j6;
                                                    }
                                                } catch (Exception e2) {
                                                    z5 = z6;
                                                }
                                            } catch (Exception e3) {
                                            }
                                        } else {
                                            sb = sb3;
                                            it = it2;
                                            j2 = j3;
                                            i2 = i4;
                                            jSONArray = jSONArray3;
                                        }
                                        try {
                                            long j7 = localLog2.id;
                                            if (i5 == 0) {
                                                sb.append(j7);
                                            } else {
                                                sb.append(",");
                                                sb.append(j7);
                                            }
                                            i5++;
                                            jSONArray.put(new JSONObject(localLog2.data));
                                            jSONArray3 = jSONArray;
                                        } catch (Exception e4) {
                                            jSONArray3 = jSONArray;
                                        }
                                    } catch (Exception e5) {
                                        sb = sb3;
                                        it = it2;
                                        j2 = j3;
                                        i2 = i4;
                                    }
                                    i4 = i2;
                                    sb3 = sb;
                                    it2 = it;
                                    j3 = j2;
                                }
                                StringBuilder sb4 = sb3;
                                j = j3;
                                int i6 = i4;
                                boolean z7 = sendLog(str2, jSONArray3, null, null, j5, true) && z5;
                                if (z7) {
                                    if (getLocalStore().deleteLocalLogByIds(sb4.toString()) <= 0) {
                                        z3 = true;
                                    }
                                } else {
                                    z3 = true;
                                }
                                if (z3) {
                                    i4 = i6 + MonitorCommonConstants.MAX_COUNT_UPLOAD_SINGLE_TIME;
                                    z4 = z7;
                                } else {
                                    z4 = z7;
                                    i4 = i6;
                                }
                                i = size;
                            }
                            if (i != 400) {
                                break;
                            }
                            j3 = j;
                        }
                        z = z4;
                        i3 = i4;
                        z2 = z3;
                        j3 = j;
                    }
                }
            }
            List<String> reportTypeList = MonitorConfigure.getReportTypeList(this.mAid);
            if (reportTypeList != null) {
                for (String str3 : reportTypeList) {
                    hashMap.put(str3, MonitorConfigure.getUploadTypeByReportType(this.mAid, str3));
                }
                boolean z8 = true;
                int i32 = 0;
                boolean z22 = false;
                for (Entry entry2 : hashMap.entrySet()) {
                }
            }
        } catch (Throwable th) {
            th.printStackTrace();
        }
    }
}
