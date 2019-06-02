package com.ss.android.ugc.effectmanager.effect.repository;

import android.os.Handler;
import android.os.Message;
import com.ss.android.ugc.effectmanager.EffectConfiguration;
import com.ss.android.ugc.effectmanager.common.WeakHandler;
import com.ss.android.ugc.effectmanager.common.WeakHandler.IHandler;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.context.EffectContext;
import com.ss.android.ugc.effectmanager.effect.listener.ICheckChannelListener;
import com.ss.android.ugc.effectmanager.effect.model.EffectChannelResponse;
import com.ss.android.ugc.effectmanager.effect.task.result.EffectChannelTaskResult;
import com.ss.android.ugc.effectmanager.effect.task.result.EffectCheckUpdateResult;
import com.ss.android.ugc.effectmanager.effect.task.task.CheckUpdateTask;
import com.ss.android.ugc.effectmanager.effect.task.task.FetchEffectChannelCacheTask;
import com.ss.android.ugc.effectmanager.effect.task.task.FetchEffectChannelTask;
import com.ss.android.ugc.effectmanager.effect.task.task.FetchExistEffectListTask;

public class EffectChannelRepository implements IHandler {
    private EffectConfiguration mConfiguration = this.mEffectContext.getEffectConfiguration();
    private EffectContext mEffectContext;
    private EffectListListener mEffectListListener;
    private Handler mHandler = new WeakHandler(this);

    public interface EffectListListener {
        void updateEffectChannel(String str, EffectChannelResponse effectChannelResponse, int i, ExceptionResult exceptionResult);
    }

    public EffectChannelRepository(EffectContext effectContext) {
        this.mEffectContext = effectContext;
    }

    public void checkUpdate(String str, String str2) {
        this.mConfiguration.getTaskManager().commit(new CheckUpdateTask(this.mEffectContext, str2, this.mHandler, str));
    }

    public void fetchExistEffectList(String str, String str2) {
        this.mConfiguration.getTaskManager().commit(new FetchExistEffectListTask(str, str2, this.mEffectContext, this.mHandler));
    }

    /* JADX WARNING: type inference failed for: r9v2, types: [com.ss.android.ugc.effectmanager.effect.task.task.FetchEffectChannelTask] */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Unknown variable types count: 1 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void fetchList(String str, String str2, boolean z) {
        FetchEffectChannelCacheTask fetchEffectChannelCacheTask;
        if (z) {
            FetchEffectChannelCacheTask fetchEffectChannelCacheTask2 = new FetchEffectChannelCacheTask(this.mEffectContext, str, str2, this.mHandler, false);
            fetchEffectChannelCacheTask = fetchEffectChannelCacheTask2;
        } else {
            fetchEffectChannelCacheTask = new FetchEffectChannelTask(this.mEffectContext, str, str2, this.mHandler);
        }
        this.mConfiguration.getTaskManager().commit(fetchEffectChannelCacheTask);
    }

    public void handleMsg(Message message) {
        if (this.mEffectListListener != null) {
            if (message.what == 14 && (message.obj instanceof EffectChannelTaskResult)) {
                EffectChannelTaskResult effectChannelTaskResult = (EffectChannelTaskResult) message.obj;
                ExceptionResult exception = effectChannelTaskResult.getException();
                if (exception == null) {
                    this.mEffectListListener.updateEffectChannel(effectChannelTaskResult.getTaskID(), effectChannelTaskResult.getEffectChannels(), 23, null);
                } else {
                    this.mEffectListListener.updateEffectChannel(effectChannelTaskResult.getTaskID(), effectChannelTaskResult.getEffectChannels(), 27, exception);
                }
            }
            if (message.what == 13 && (message.obj instanceof EffectCheckUpdateResult)) {
                EffectCheckUpdateResult effectCheckUpdateResult = (EffectCheckUpdateResult) message.obj;
                ExceptionResult exception2 = effectCheckUpdateResult.getException();
                ICheckChannelListener checkChannelListener = this.mConfiguration.getListenerManger().getCheckChannelListener(effectCheckUpdateResult.getTaskID());
                if (checkChannelListener != null) {
                    if (exception2 == null) {
                        checkChannelListener.checkChannelSuccess(effectCheckUpdateResult.isUpdate());
                    } else {
                        checkChannelListener.checkChannelFailed(exception2);
                    }
                }
            }
        }
    }

    public void setOnEffectListListener(EffectListListener effectListListener) {
        this.mEffectListListener = effectListListener;
    }
}
