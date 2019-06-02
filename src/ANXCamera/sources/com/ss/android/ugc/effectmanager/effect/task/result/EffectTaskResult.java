package com.ss.android.ugc.effectmanager.effect.task.result;

import com.ss.android.ugc.effectmanager.common.task.BaseTaskResult;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.effect.model.Effect;

public class EffectTaskResult extends BaseTaskResult {
    private Effect effect;
    private ExceptionResult exception;

    public EffectTaskResult(Effect effect2, ExceptionResult exceptionResult) {
        this.effect = effect2;
        this.exception = exceptionResult;
    }

    public Effect getEffect() {
        return this.effect;
    }

    public ExceptionResult getException() {
        return this.exception;
    }

    public void setEffect(Effect effect2) {
        this.effect = effect2;
    }

    public void setException(ExceptionResult exceptionResult) {
        this.exception = exceptionResult;
    }
}
