package com.bytedance.frameworks.baselib.log;

import android.content.Context;
import java.util.LinkedList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

public final class LogQueue {
    static final boolean DEBUG = false;
    private static final int MAX_QUEUE_SIZE = 2000;
    static final String TAG = "LogQueue";
    private static LogQueue sLogQueue;
    private final Context mContext;
    private final Map<String, LogHandler> mLogHandlers;
    private final LogSender mLogSender;
    private final LinkedList<LogItem> mPendingQueue = new LinkedList<>();
    private final AtomicBoolean mStopFlag = new AtomicBoolean(false);

    private LogQueue(Context context) {
        this.mContext = context.getApplicationContext();
        this.mLogHandlers = new ConcurrentHashMap();
        this.mLogSender = new LogSender(this.mContext, this, this.mPendingQueue, this.mStopFlag);
        this.mLogSender.start();
    }

    public static LogQueue getInstance(Context context) {
        if (sLogQueue == null) {
            synchronized (LogQueue.class) {
                if (sLogQueue == null) {
                    sLogQueue = new LogQueue(context);
                }
            }
        }
        return sLogQueue;
    }

    static void log(String str) {
    }

    static void log(String str, String str2) {
    }

    public static void quit() {
        synchronized (LogQueue.class) {
            if (sLogQueue != null) {
                sLogQueue.stop();
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public boolean enqueue(String str, byte[] bArr) {
        if (isStop() || bArr == null || bArr.length <= 0 || getLogHandler(str) == null) {
            return false;
        }
        synchronized (this.mPendingQueue) {
            if (this.mStopFlag.get()) {
                return false;
            }
            if (this.mPendingQueue.size() >= 2000) {
                this.mPendingQueue.poll();
            }
            boolean add = this.mPendingQueue.add(new LogItem(str, bArr));
            this.mLogSender.awaken();
            return add;
        }
    }

    /* access modifiers changed from: 0000 */
    public Map<String, LogHandler> getAllLogHandler() {
        return this.mLogHandlers;
    }

    /* access modifiers changed from: 0000 */
    public LogHandler getLogHandler(String str) {
        return (LogHandler) this.mLogHandlers.get(str);
    }

    /* access modifiers changed from: 0000 */
    public boolean isStop() {
        return this.mStopFlag.get();
    }

    public void registerLogHandler(String str, LogHandler logHandler) {
        if (!isStop() && logHandler != null) {
            this.mLogHandlers.put(str, logHandler);
        }
    }

    /* access modifiers changed from: 0000 */
    public void stop() {
        synchronized (this.mPendingQueue) {
            this.mPendingQueue.clear();
        }
        this.mStopFlag.set(true);
        this.mLogSender.quit();
    }

    public void unregisterLogHandler(LogHandler logHandler) {
        if (!isStop() && logHandler != null) {
            this.mLogHandlers.remove(logHandler.getType());
        }
    }
}
