package com.ss.android.ugc.effectmanager.network.interceptor;

import com.ss.android.ugc.effectmanager.common.task.BaseTask;

public abstract class BaseInterceptor {
    private boolean isEnabled = false;

    public void enable(boolean z) {
        this.isEnabled = z;
    }

    public abstract boolean intercept(BaseTask baseTask);

    public boolean isEnabled() {
        return this.isEnabled;
    }
}
