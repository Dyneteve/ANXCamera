package com.xiaomi.camera.liveshot.util;

import com.android.camera.log.Log;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicBoolean;

public class BackgroundTaskScheduler {
    /* access modifiers changed from: private */
    public static final String TAG = BackgroundTaskScheduler.class.getSimpleName();
    private final ExecutorService mExecutor;
    /* access modifiers changed from: private */
    public final List<BackgroundTaskContainer> mTaskList = new ArrayList();

    private class BackgroundTaskContainer implements Runnable {
        private final CancellableTask mTask;

        private BackgroundTaskContainer(CancellableTask cancellableTask) {
            this.mTask = cancellableTask;
        }

        /* access modifiers changed from: private */
        public void cancel() {
            this.mTask.setCancelled();
        }

        public void run() {
            synchronized (BackgroundTaskScheduler.this.mTaskList) {
                if (!BackgroundTaskScheduler.this.mTaskList.remove(this)) {
                    Log.d(BackgroundTaskScheduler.TAG, "This task does not exist in task list.");
                }
            }
            this.mTask.run();
        }
    }

    public static abstract class CancellableTask implements Runnable {
        private final AtomicBoolean mCancelled = new AtomicBoolean();

        /* access modifiers changed from: protected */
        public boolean isCancelled() {
            return this.mCancelled.get();
        }

        /* access modifiers changed from: protected */
        public void setCancelled() {
            this.mCancelled.set(true);
        }
    }

    public BackgroundTaskScheduler(ExecutorService executorService) {
        this.mExecutor = executorService;
    }

    public void abortRemainingTasks() {
        synchronized (this.mTaskList) {
            for (BackgroundTaskContainer access$100 : this.mTaskList) {
                access$100.cancel();
            }
        }
    }

    public void execute(CancellableTask cancellableTask) {
        synchronized (this.mTaskList) {
            BackgroundTaskContainer backgroundTaskContainer = new BackgroundTaskContainer(cancellableTask);
            this.mTaskList.add(backgroundTaskContainer);
            this.mExecutor.execute(backgroundTaskContainer);
        }
    }

    public int getRemainingTaskCount() {
        int size;
        synchronized (this.mTaskList) {
            size = this.mTaskList.size();
        }
        return size;
    }

    public void shutdown() {
        this.mExecutor.shutdown();
    }

    public Future<?> submit(CancellableTask cancellableTask) {
        Future<?> submit;
        synchronized (this.mTaskList) {
            BackgroundTaskContainer backgroundTaskContainer = new BackgroundTaskContainer(cancellableTask);
            this.mTaskList.add(backgroundTaskContainer);
            submit = this.mExecutor.submit(backgroundTaskContainer);
        }
        return submit;
    }
}
