package com.ss.android.ugc.effectmanager.link.task.result;

import com.ss.android.ugc.effectmanager.common.task.BaseTaskResult;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.link.model.host.HostStatus;

public class HostStatusUpdateResult extends BaseTaskResult {
    private ExceptionResult mExceptionResult;
    private HostStatus mHostStatus;

    public HostStatusUpdateResult(HostStatus hostStatus, ExceptionResult exceptionResult) {
        this.mHostStatus = hostStatus;
        this.mExceptionResult = exceptionResult;
    }

    public ExceptionResult getExceptionResult() {
        return this.mExceptionResult;
    }

    public HostStatus getHostStatus() {
        return this.mHostStatus;
    }

    public void setExceptionResult(ExceptionResult exceptionResult) {
        this.mExceptionResult = exceptionResult;
    }

    public void setHostStatus(HostStatus hostStatus) {
        this.mHostStatus = hostStatus;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("HostStatusUpdateResult{mHostStatus=");
        sb.append(this.mHostStatus);
        sb.append(", mExceptionResult=");
        sb.append(this.mExceptionResult);
        sb.append('}');
        return sb.toString();
    }
}
