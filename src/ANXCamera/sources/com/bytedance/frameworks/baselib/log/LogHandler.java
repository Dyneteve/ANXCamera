package com.bytedance.frameworks.baselib.log;

import android.content.Context;
import android.text.TextUtils;
import java.util.List;

public abstract class LogHandler {
    protected IConfig mConfig;
    private long mLastStopTime;
    private String mLastSuccessChannel;
    protected LogQueue mLogQueue;
    private IResponseConfig mResponseConfig;
    private long mStopMoreChannelInterval;
    protected String mType;

    public static abstract class BaseConfig implements IConfig {
        public long getLogExpireTime() {
            return 604800000;
        }

        public int getMaxRetryCount() {
            return 4;
        }

        public long getRetryInterval() {
            return 15000;
        }
    }

    public interface IConfig {
        List<String> getChannels();

        long getLogExpireTime();

        String getLogType();

        int getMaxRetryCount();

        long getRetryInterval();
    }

    public interface IResponseConfig {
        boolean getMoreChannelSwitch();

        boolean getRemoveSwitch();

        int getStatusCode();

        long getStopInterval();

        long getStopMoreChannelInterval();
    }

    public LogHandler(Context context, IConfig iConfig) {
        this.mConfig = iConfig;
        if (this.mConfig != null) {
            this.mType = iConfig.getLogType();
            if (!TextUtils.isEmpty(this.mType)) {
                this.mLogQueue = LogQueue.getInstance(context);
                this.mLogQueue.registerLogHandler(this.mType, this);
                return;
            }
            throw new IllegalArgumentException("type is empty.");
        }
        throw new IllegalArgumentException("config is null.");
    }

    public LogHandler(Context context, IConfig iConfig, IResponseConfig iResponseConfig) {
        this.mConfig = iConfig;
        this.mResponseConfig = iResponseConfig;
        if (this.mConfig == null) {
            throw new IllegalArgumentException("config is null.");
        } else if (this.mResponseConfig != null) {
            this.mType = iConfig.getLogType();
            if (!TextUtils.isEmpty(this.mType)) {
                this.mLogQueue = LogQueue.getInstance(context);
                this.mLogQueue.registerLogHandler(this.mType, this);
                return;
            }
            throw new IllegalArgumentException("type is empty.");
        } else {
            throw new IllegalArgumentException("responseConfig is null");
        }
    }

    public boolean enqueue(String str) {
        return enqueue(LogLib.safeGetBytes(str));
    }

    public boolean enqueue(byte[] bArr) {
        return this.mLogQueue.enqueue(this.mType, bArr);
    }

    /* access modifiers changed from: 0000 */
    public IConfig getConfig() {
        return this.mConfig;
    }

    public long getLastStopTime() {
        return this.mLastStopTime;
    }

    /* access modifiers changed from: 0000 */
    public String getLastSuccessChannel() {
        return this.mLastSuccessChannel;
    }

    /* access modifiers changed from: 0000 */
    public IResponseConfig getResponseConfig() {
        return this.mResponseConfig;
    }

    public long getStopMoreChannelInterval() {
        return this.mStopMoreChannelInterval;
    }

    /* access modifiers changed from: 0000 */
    public String getType() {
        return this.mType;
    }

    /* access modifiers changed from: protected */
    public void onLogSent(byte[] bArr, boolean z) {
    }

    /* access modifiers changed from: protected */
    public abstract boolean send(String str, byte[] bArr);

    public void setLastStopTime(long j) {
        this.mLastStopTime = j;
    }

    /* access modifiers changed from: 0000 */
    public void setLastSuccessChannel(String str) {
        this.mLastSuccessChannel = str;
    }

    public void setStopMoreChannelInterval(long j) {
        this.mStopMoreChannelInterval = j;
    }

    public void updateConfig(IConfig iConfig) {
        if (iConfig != null) {
            this.mConfig = iConfig;
        }
    }
}
