package com.ss.android.ugc.effectmanager.common;

import com.ss.android.ugc.effectmanager.common.task.BaseTask;
import com.ss.android.ugc.effectmanager.context.EffectContext;
import com.ss.android.ugc.effectmanager.network.interceptor.BaseInterceptor;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ExecutorService;

public class TaskManager {
    private EffectContext mEffectContext;
    private ExecutorService mExecutor;
    private boolean mInit = false;
    private Map<String, BaseInterceptor> mInterceptions;

    public static class TaskManagerConfig {
        /* access modifiers changed from: private */
        public EffectContext mEffectContext;
        private ExecutorService mExecutor;

        public ExecutorService getExecutor() {
            return this.mExecutor;
        }

        public TaskManagerConfig setEffectContext(EffectContext effectContext) {
            this.mEffectContext = effectContext;
            return this;
        }

        public TaskManagerConfig setExecutor(ExecutorService executorService) {
            this.mExecutor = executorService;
            return this;
        }
    }

    private void checkInit() {
        if (!this.mInit) {
            throw new IllegalStateException("EffectPlatformSDK: TaskManager is not init !!!");
        }
    }

    public void addInterception(String str, BaseInterceptor baseInterceptor) {
        this.mInterceptions.put(str, baseInterceptor);
    }

    public void commit(final BaseTask baseTask) {
        boolean z;
        if (baseTask != null) {
            checkInit();
            Iterator it = this.mInterceptions.values().iterator();
            while (true) {
                if (!it.hasNext()) {
                    z = false;
                    break;
                } else if (((BaseInterceptor) it.next()).intercept(baseTask)) {
                    z = true;
                    break;
                }
            }
            if (!z) {
                this.mExecutor.execute(new Runnable() {
                    public void run() {
                        baseTask.execute();
                    }
                });
            }
        }
    }

    public void destroy() {
        this.mExecutor.shutdownNow();
    }

    public void enableInterception(String str, boolean z) {
        BaseInterceptor baseInterceptor = (BaseInterceptor) this.mInterceptions.get(str);
        if (baseInterceptor != null) {
            baseInterceptor.enable(z);
        }
    }

    public Map<String, BaseInterceptor> getInterceptions() {
        return this.mInterceptions;
    }

    public void init(TaskManagerConfig taskManagerConfig) {
        this.mExecutor = taskManagerConfig.getExecutor();
        this.mEffectContext = taskManagerConfig.mEffectContext;
        this.mInit = true;
        this.mInterceptions = new HashMap();
    }
}
