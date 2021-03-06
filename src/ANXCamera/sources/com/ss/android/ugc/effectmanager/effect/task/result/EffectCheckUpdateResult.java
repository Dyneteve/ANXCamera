package com.ss.android.ugc.effectmanager.effect.task.result;

import com.ss.android.ugc.effectmanager.common.task.BaseTaskResult;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;

public class EffectCheckUpdateResult extends BaseTaskResult {
    private ExceptionResult exception;
    private boolean isUpdate;
    private String panel = "";

    public EffectCheckUpdateResult(String str, boolean z, ExceptionResult exceptionResult) {
        this.panel = str;
        this.isUpdate = z;
        this.exception = exceptionResult;
    }

    public ExceptionResult getException() {
        return this.exception;
    }

    public String getPanel() {
        return this.panel;
    }

    public boolean isUpdate() {
        return this.isUpdate;
    }

    public void setException(ExceptionResult exceptionResult) {
        this.exception = exceptionResult;
    }

    public void setUpdate(boolean z) {
        this.isUpdate = z;
    }
}
