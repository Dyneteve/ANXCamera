package com.bytedance.frameworks.core.monitor;

import android.content.Context;
import android.util.Log;
import com.bytedance.frameworks.core.monitor.model.LocalVersionInfo;

public class LogVersionManager {
    private static LogVersionManager sLogVersionManager;
    private Context mContext;
    private long mCurrentVersionId;
    private LocalVersionInfo mCurrentVersionInfo;
    private LogStoreManager mLogStoreManager;

    protected LogVersionManager(Context context, LogStoreManager logStoreManager) {
        StringBuilder sb = new StringBuilder();
        sb.append("LogVersionManager: ");
        sb.append(logStoreManager.getAid());
        sb.append(" , threadName: ");
        sb.append(Thread.currentThread().getName());
        Log.d("monitorlib", sb.toString());
        this.mContext = context.getApplicationContext();
        this.mLogStoreManager = logStoreManager;
    }

    /* access modifiers changed from: protected */
    public long checkAndSaveVersion() {
        if (this.mCurrentVersionInfo == null) {
            return 2147483647L;
        }
        LocalVersionInfo latestLocalVersion = this.mLogStoreManager.getLatestLocalVersion();
        if (latestLocalVersion == null || !latestLocalVersion.equals(this.mCurrentVersionInfo)) {
            this.mCurrentVersionId = this.mLogStoreManager.saveLocalVersion(this.mCurrentVersionInfo);
        } else {
            this.mCurrentVersionId = latestLocalVersion.id;
        }
        return this.mCurrentVersionId;
    }

    public long getCurrentVersionId() {
        return this.mCurrentVersionId;
    }

    public void setCurrentVersionInfo(LocalVersionInfo localVersionInfo) {
        this.mCurrentVersionInfo = localVersionInfo;
        checkAndSaveVersion();
    }
}
