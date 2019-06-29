package com.ss.android.ugc.effectmanager.common;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

public class SimpleThreadFactory implements ThreadFactory {
    private boolean ignoreStatusCheck;
    private String threadName;
    private AtomicInteger threadSeq;

    public SimpleThreadFactory(String str) {
        this(str, false);
    }

    public SimpleThreadFactory(String str, boolean z) {
        this.threadSeq = new AtomicInteger();
        this.threadName = str;
        this.ignoreStatusCheck = z;
    }

    public Thread newThread(Runnable runnable) {
        int incrementAndGet = this.threadSeq.incrementAndGet();
        StringBuilder sb = new StringBuilder();
        sb.append(this.threadName);
        sb.append("-");
        sb.append(incrementAndGet);
        Thread thread = new Thread(runnable, sb.toString());
        if (!this.ignoreStatusCheck) {
            if (thread.isDaemon()) {
                thread.setDaemon(false);
            }
            if (thread.getPriority() != 5) {
                thread.setPriority(5);
            }
        }
        return thread;
    }
}
