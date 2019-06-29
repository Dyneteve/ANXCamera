package com.bytedance.frameworks.baselib.log;

import android.content.Context;
import android.text.TextUtils;
import com.bytedance.frameworks.baselib.log.LogHandler.IConfig;
import com.bytedance.frameworks.baselib.log.LogHandler.IResponseConfig;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

final class LogSender extends Thread {
    private static final long CLEAN_LOG_INTERVAL = 600000;
    private static final long DEFAULT_SCAN_LOG_INTERVAL = 120000;
    static final String KEY_MAGIC_TAG = "magic_tag";
    static final String KEY_MESSAGE = "message";
    static final String MAGIC_TAG = "log_queue";
    private static final long MAX_EXPIRE_TIME = 864000000;
    static final String STATUS_OK = "success";
    private static final String TAG = "LogSender";
    private final Context mContext;
    private final LogDBHelper mDbHelper;
    private long mLastCleanTime = 0;
    private final Object mLock = new Object();
    private LogQueue mLogQueue;
    private long mMinLog = -1;
    private final LinkedList<LogItem> mPendingQueue;
    private long mScanLogInterval = DEFAULT_SCAN_LOG_INTERVAL;
    private final AtomicBoolean mStopFlag;

    LogSender(Context context, LogQueue logQueue, LinkedList<LogItem> linkedList, AtomicBoolean atomicBoolean) {
        super(TAG);
        this.mLogQueue = logQueue;
        this.mContext = context;
        this.mPendingQueue = linkedList;
        this.mStopFlag = atomicBoolean;
        this.mDbHelper = LogDBHelper.getInstance(this.mContext);
    }

    private void cleanLog() {
        if (!isStop()) {
            Map allLogHandler = this.mLogQueue.getAllLogHandler();
            if (allLogHandler != null && !allLogHandler.isEmpty()) {
                for (String str : allLogHandler.keySet()) {
                    if (isStop()) {
                        break;
                    }
                    LogHandler logHandler = (LogHandler) allLogHandler.get(str);
                    if (logHandler != null) {
                        IConfig config = logHandler.getConfig();
                        if (config != null) {
                            this.mDbHelper.cleanExpireLog(str, config.getMaxRetryCount(), config.getLogExpireTime());
                        }
                    }
                }
            }
            this.mDbHelper.cleanExpireLog(null, -1, MAX_EXPIRE_TIME);
        }
    }

    private boolean isStop() {
        return this.mStopFlag.get();
    }

    /* JADX WARNING: Code restructure failed: missing block: B:15:0x002d, code lost:
        if (r0 == null) goto L_0x004e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x0040, code lost:
        if (r6.mDbHelper.insertLog(r0.type, r0.value) < Long.MAX_VALUE) goto L_0x004e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x0042, code lost:
        r6.mDbHelper.recreateTableQueue();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x0049, code lost:
        r6.mDbHelper.recreateTableQueue();
     */
    private boolean processPendingQueue() {
        boolean z;
        if (isStop()) {
            return false;
        }
        LogItem logItem = null;
        synchronized (this.mPendingQueue) {
            if (isStop()) {
                return false;
            }
            if (!this.mPendingQueue.isEmpty()) {
                logItem = (LogItem) this.mPendingQueue.poll();
            }
            z = !this.mPendingQueue.isEmpty();
        }
        return z;
    }

    /* JADX WARNING: Removed duplicated region for block: B:147:0x022b A[RETURN] */
    /* JADX WARNING: Removed duplicated region for block: B:148:0x022c  */
    private boolean scanAndSendLog() {
        boolean z;
        LogHandler logHandler;
        IConfig iConfig;
        boolean z2;
        boolean z3;
        boolean z4;
        boolean z5;
        boolean z6;
        if (isStop()) {
            return false;
        }
        if (this.mMinLog < 0 && System.currentTimeMillis() - this.mLastCleanTime > 600000) {
            this.mMinLog = 0;
            cleanLog();
            this.mLastCleanTime = System.currentTimeMillis();
        }
        if (!LogLib.isNetworkAvailable(this.mContext)) {
            this.mScanLogInterval = DEFAULT_SCAN_LOG_INTERVAL;
            return false;
        }
        LogItem log = this.mDbHelper.getLog(this.mMinLog);
        String str = null;
        if (log != null) {
            if (this.mMinLog < log.id) {
                this.mMinLog = log.id;
            } else {
                this.mMinLog++;
            }
            if (log.value == null || log.value.length <= 0) {
                iConfig = null;
                logHandler = null;
                z = true;
                z2 = false;
            } else {
                logHandler = this.mLogQueue.getLogHandler(log.type);
                if (logHandler == null) {
                    return true;
                }
                IConfig config = logHandler.getConfig();
                IResponseConfig responseConfig = logHandler.getResponseConfig();
                long currentTimeMillis = System.currentTimeMillis();
                long retryInterval = config.getRetryInterval();
                if (responseConfig != null) {
                    if (responseConfig.getRemoveSwitch()) {
                        z = false;
                        z2 = true;
                        iConfig = config;
                    } else {
                        long stopInterval = responseConfig.getStopInterval();
                        long stopMoreChannelInterval = logHandler.getStopMoreChannelInterval();
                        if ((stopInterval > 0 && currentTimeMillis - logHandler.getLastStopTime() < stopInterval) || (stopMoreChannelInterval > 0 && currentTimeMillis - logHandler.getLastStopTime() < stopMoreChannelInterval)) {
                            return true;
                        }
                        logHandler.setLastStopTime(System.currentTimeMillis());
                        if (retryInterval > 0 && log.retry_count > 0 && currentTimeMillis - log.retry_time < retryInterval * ((long) log.retry_count)) {
                            return true;
                        }
                        String lastSuccessChannel = logHandler.getLastSuccessChannel();
                        List channels = config.getChannels();
                        if (channels == null) {
                            return true;
                        }
                        try {
                            if (!TextUtils.isEmpty(lastSuccessChannel)) {
                                z6 = sendLog(logHandler, lastSuccessChannel, log.value);
                                z5 = true;
                            } else {
                                z6 = false;
                                z5 = false;
                            }
                            if (!z6) {
                                try {
                                    Iterator it = channels.iterator();
                                    z4 = z6;
                                    int i = 0;
                                    while (true) {
                                        try {
                                            if (!it.hasNext()) {
                                                break;
                                            }
                                            String str2 = (String) it.next();
                                            if (!responseConfig.getMoreChannelSwitch() && z5) {
                                                break;
                                            } else if (isStop()) {
                                                return true;
                                            } else {
                                                if (!TextUtils.isEmpty(str2)) {
                                                    if (!str2.equals(lastSuccessChannel)) {
                                                        boolean sendLog = sendLog(logHandler, str2, log.value);
                                                        if (sendLog) {
                                                            z4 = sendLog;
                                                            lastSuccessChannel = str2;
                                                            break;
                                                        }
                                                        i++;
                                                        z4 = sendLog;
                                                        z5 = true;
                                                    }
                                                }
                                                i++;
                                            }
                                        } catch (Throwable th) {
                                            th = th;
                                            String str3 = TAG;
                                            StringBuilder sb = new StringBuilder();
                                            sb.append("send log exception: ");
                                            sb.append(th);
                                            LogQueue.log(str3, sb.toString());
                                            str = lastSuccessChannel;
                                            z2 = z4;
                                            iConfig = config;
                                            z = false;
                                            if (!isStop()) {
                                            }
                                        }
                                    }
                                    if (i != channels.size() || channels.size() <= 1) {
                                        logHandler.setStopMoreChannelInterval(0);
                                    } else {
                                        logHandler.setStopMoreChannelInterval(responseConfig.getStopMoreChannelInterval());
                                    }
                                } catch (Throwable th2) {
                                    th = th2;
                                    z4 = z6;
                                    String str32 = TAG;
                                    StringBuilder sb2 = new StringBuilder();
                                    sb2.append("send log exception: ");
                                    sb2.append(th);
                                    LogQueue.log(str32, sb2.toString());
                                    str = lastSuccessChannel;
                                    z2 = z4;
                                    iConfig = config;
                                    z = false;
                                    if (!isStop()) {
                                    }
                                }
                                str = lastSuccessChannel;
                                z2 = z4;
                            } else {
                                logHandler.setStopMoreChannelInterval(0);
                                z4 = z6;
                                str = lastSuccessChannel;
                                z2 = z4;
                            }
                        } catch (Throwable th3) {
                            th = th3;
                            z4 = false;
                            String str322 = TAG;
                            StringBuilder sb22 = new StringBuilder();
                            sb22.append("send log exception: ");
                            sb22.append(th);
                            LogQueue.log(str322, sb22.toString());
                            str = lastSuccessChannel;
                            z2 = z4;
                            iConfig = config;
                            z = false;
                            if (!isStop()) {
                            }
                        }
                    }
                } else if (retryInterval > 0 && log.retry_count > 0 && currentTimeMillis - log.retry_time < retryInterval * ((long) log.retry_count)) {
                    return true;
                } else {
                    String lastSuccessChannel2 = logHandler.getLastSuccessChannel();
                    List channels2 = config.getChannels();
                    if (channels2 == null) {
                        return true;
                    }
                    try {
                        z3 = !TextUtils.isEmpty(lastSuccessChannel2) ? sendLog(logHandler, lastSuccessChannel2, log.value) : false;
                        if (!z3) {
                            try {
                                Iterator it2 = channels2.iterator();
                                while (true) {
                                    if (!it2.hasNext()) {
                                        break;
                                    }
                                    String str4 = (String) it2.next();
                                    if (isStop()) {
                                        return true;
                                    }
                                    if (!TextUtils.isEmpty(str4)) {
                                        if (!str4.equals(lastSuccessChannel2)) {
                                            boolean sendLog2 = sendLog(logHandler, str4, log.value);
                                            if (sendLog2) {
                                                str = str4;
                                                z2 = sendLog2;
                                                break;
                                            }
                                            z3 = sendLog2;
                                        }
                                    }
                                }
                            } catch (Throwable th4) {
                                th = th4;
                                String str5 = TAG;
                                StringBuilder sb3 = new StringBuilder();
                                sb3.append("send log exception: ");
                                sb3.append(th);
                                LogQueue.log(str5, sb3.toString());
                                str = lastSuccessChannel2;
                                z2 = z3;
                                iConfig = config;
                                z = false;
                                if (!isStop()) {
                                }
                            }
                        }
                        str = lastSuccessChannel2;
                        z2 = z3;
                    } catch (Throwable th5) {
                        th = th5;
                        z3 = false;
                        String str52 = TAG;
                        StringBuilder sb32 = new StringBuilder();
                        sb32.append("send log exception: ");
                        sb32.append(th);
                        LogQueue.log(str52, sb32.toString());
                        str = lastSuccessChannel2;
                        z2 = z3;
                        iConfig = config;
                        z = false;
                        if (!isStop()) {
                        }
                    }
                }
                iConfig = config;
                z = false;
            }
            if (!isStop()) {
                return true;
            }
            if (z) {
                this.mDbHelper.onLogSent(log.id, true, 0, 0);
            } else {
                if (z2) {
                    logHandler.setLastSuccessChannel(str);
                }
                if (this.mDbHelper.onLogSent(log.id, z2, iConfig.getLogExpireTime(), iConfig.getMaxRetryCount())) {
                    long retryInterval2 = iConfig.getRetryInterval() * ((long) (log.retry_count + 1));
                    if (retryInterval2 > 0) {
                        this.mScanLogInterval = retryInterval2;
                    }
                    this.mScanLogInterval = Math.min(DEFAULT_SCAN_LOG_INTERVAL, this.mScanLogInterval);
                } else {
                    this.mScanLogInterval = DEFAULT_SCAN_LOG_INTERVAL;
                }
                logHandler.onLogSent(log.value, z2);
            }
            return true;
        } else if (this.mMinLog == 0 && this.mDbHelper.getEventCount(null) == 0) {
            this.mScanLogInterval = 0;
            return false;
        } else {
            if (this.mMinLog == -1) {
                this.mScanLogInterval = DEFAULT_SCAN_LOG_INTERVAL;
            }
            this.mMinLog = -1;
            return false;
        }
    }

    private boolean sendLog(LogHandler logHandler, String str, byte[] bArr) throws Throwable {
        if (bArr == null || bArr.length <= 0 || logHandler == null || TextUtils.isEmpty(str)) {
            return false;
        }
        return logHandler.send(str, bArr);
    }

    /* access modifiers changed from: 0000 */
    public void awaken() {
        synchronized (this.mLock) {
            this.mLock.notify();
        }
    }

    /* access modifiers changed from: 0000 */
    public void quit() {
        awaken();
        this.mDbHelper.closeDatabase();
    }

    public void run() {
        LogQueue.log(TAG, "LogSender start");
        while (!isStop()) {
            boolean processPendingQueue = processPendingQueue();
            if (isStop()) {
                break;
            }
            boolean z = scanAndSendLog() || processPendingQueue;
            if (isStop()) {
                break;
            } else if (!z) {
                synchronized (this.mLock) {
                    try {
                        if (this.mScanLogInterval == 0) {
                            this.mLock.wait();
                        } else {
                            this.mLock.wait(this.mScanLogInterval);
                        }
                    } catch (InterruptedException e) {
                    }
                }
            }
        }
        LogQueue.log(TAG, "LogSender quit");
    }
}
