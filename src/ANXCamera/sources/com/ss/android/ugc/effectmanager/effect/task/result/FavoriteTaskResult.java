package com.ss.android.ugc.effectmanager.effect.task.result;

import com.ss.android.ugc.effectmanager.common.task.BaseTaskResult;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import java.util.ArrayList;
import java.util.List;

public class FavoriteTaskResult extends BaseTaskResult {
    private List<String> mEffectIds = new ArrayList();
    private ExceptionResult mException;
    private boolean mIsSuccess;

    public FavoriteTaskResult(boolean z, List<String> list, ExceptionResult exceptionResult) {
        this.mIsSuccess = z;
        this.mEffectIds.clear();
        this.mEffectIds.addAll(list);
        this.mException = exceptionResult;
    }

    public List<String> getEffectIds() {
        return this.mEffectIds;
    }

    public ExceptionResult getException() {
        return this.mException;
    }

    public boolean isSuccess() {
        return this.mIsSuccess;
    }
}
