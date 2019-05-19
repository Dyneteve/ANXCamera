package bytedance.framwork.core.sdkmonitor;

import android.text.TextUtils;
import java.util.Iterator;
import java.util.LinkedList;
import org.json.JSONObject;

public class CacheData {
    private int MAX_LIMIT_SIZE = 100;
    private boolean mHasHandleCache;
    /* access modifiers changed from: private */
    public final LinkedList<SerViceMonitorData> mServiceMonitorData = new LinkedList<>();

    static class SerViceMonitorData {
        JSONObject extrJson;
        String serviceName;
        int status;
        JSONObject value;

        public SerViceMonitorData(String str, int i, JSONObject jSONObject, JSONObject jSONObject2) {
            this.serviceName = str;
            this.status = i;
            this.value = jSONObject;
            this.extrJson = jSONObject2;
        }
    }

    /* access modifiers changed from: private */
    public void handleServiceMonitorData(SDKMonitor sDKMonitor, SerViceMonitorData serViceMonitorData) {
        if (serViceMonitorData != null && !TextUtils.isEmpty(serViceMonitorData.serviceName)) {
            sDKMonitor.monitorStatusAndDuration(serViceMonitorData.serviceName, serViceMonitorData.status, serViceMonitorData.value, serViceMonitorData.extrJson);
        }
    }

    public void handleCacheData(final SDKMonitor sDKMonitor) {
        if (!this.mHasHandleCache) {
            this.mHasHandleCache = true;
            new Thread("handle_cache_monitor_data") {
                public void run() {
                    LinkedList linkedList;
                    try {
                        synchronized (CacheData.this.mServiceMonitorData) {
                            linkedList = new LinkedList(CacheData.this.mServiceMonitorData);
                            CacheData.this.mServiceMonitorData.clear();
                        }
                        Iterator it = linkedList.iterator();
                        while (it.hasNext()) {
                            CacheData.this.handleServiceMonitorData(sDKMonitor, (SerViceMonitorData) it.next());
                        }
                    } catch (Throwable th) {
                    }
                }
            }.start();
        }
    }

    public void insertServiceMonitorData(SerViceMonitorData serViceMonitorData) {
        if (serViceMonitorData != null) {
            synchronized (this.mServiceMonitorData) {
                if (this.mServiceMonitorData.size() > this.MAX_LIMIT_SIZE) {
                    this.mServiceMonitorData.poll();
                }
                this.mServiceMonitorData.add(serViceMonitorData);
            }
        }
    }
}
