package com.ss.android.ugc.effectmanager.effect.task.task;

import android.accounts.NetworkErrorException;
import android.os.Handler;
import android.text.TextUtils;
import com.android.camera.module.impl.component.FileUtils;
import com.ss.android.ugc.effectmanager.EffectConfiguration;
import com.ss.android.ugc.effectmanager.common.EffectConstants;
import com.ss.android.ugc.effectmanager.common.EffectRequest;
import com.ss.android.ugc.effectmanager.common.ErrorConstants;
import com.ss.android.ugc.effectmanager.common.exception.StatusCodeException;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.common.task.NormalTask;
import com.ss.android.ugc.effectmanager.common.utils.EffectUtils;
import com.ss.android.ugc.effectmanager.context.EffectContext;
import com.ss.android.ugc.effectmanager.effect.model.Effect;
import com.ss.android.ugc.effectmanager.effect.task.result.EffectTaskResult;
import java.io.File;
import java.io.InputStream;
import java.util.List;

public class DownloadEffectTask extends NormalTask {
    private EffectConfiguration mConfiguration;
    private int mCurCnt;
    private List<String> mDownLoadUrl = EffectUtils.getUrl(this.mEffect.getFileUrl());
    private Effect mEffect;
    private EffectContext mEffectContext;

    public DownloadEffectTask(Effect effect, EffectContext effectContext, String str, Handler handler) {
        super(handler, str, EffectConstants.NETWORK);
        this.mEffect = effect;
        this.mEffectContext = effectContext;
        this.mConfiguration = effectContext.getEffectConfiguration();
        this.mCurCnt = effectContext.getEffectConfiguration().getRetryCount();
    }

    private Effect download(String str, String str2) throws Exception {
        InputStream execute = this.mEffectContext.getEffectConfiguration().getEffectNetWorker().execute(new EffectRequest("GET", str));
        if (execute != null) {
            EffectUtils.convertStreamToFile(execute, str2);
            return this.mEffect;
        }
        throw new NetworkErrorException(ErrorConstants.EXCEPTION_DOWNLOAD_ERROR);
    }

    public void execute() {
        sendMessage(42, new EffectTaskResult(this.mEffect, null));
        if (this.mEffect == null || this.mDownLoadUrl == null || this.mDownLoadUrl.isEmpty() || EffectUtils.isUrlModelEmpty(this.mEffect.getFileUrl())) {
            sendMessage(15, new EffectTaskResult(this.mEffect, new ExceptionResult((int) ErrorConstants.CODE_EFFECT_NULL)));
            return;
        }
        int i = 0;
        int size = this.mDownLoadUrl.size();
        while (true) {
            if (i >= size) {
                break;
            } else if (isCanceled()) {
                sendMessage(15, new EffectTaskResult(this.mEffect, new ExceptionResult((int) ErrorConstants.CODE_CANCEL_DOWNLOAD)));
                break;
            } else {
                try {
                    if (TextUtils.isEmpty(this.mEffect.getZipPath()) || TextUtils.isEmpty(this.mEffect.getUnzipPath())) {
                        Effect effect = this.mEffect;
                        StringBuilder sb = new StringBuilder();
                        sb.append(this.mConfiguration.getEffectDir());
                        sb.append(File.separator);
                        sb.append(this.mEffect.getId());
                        sb.append(FileUtils.SUFFIX);
                        effect.setZipPath(sb.toString());
                        Effect effect2 = this.mEffect;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append(this.mConfiguration.getEffectDir());
                        sb2.append(File.separator);
                        sb2.append(this.mEffect.getId());
                        effect2.setUnzipPath(sb2.toString());
                    }
                    Effect download = download((String) this.mDownLoadUrl.get(i), this.mEffect.getZipPath());
                    if (download != null) {
                        com.ss.android.ugc.effectmanager.common.utils.FileUtils.unZip(download.getZipPath(), download.getUnzipPath());
                        sendMessage(15, new EffectTaskResult(download, null));
                        break;
                    }
                    i++;
                } catch (Exception e) {
                    if (i == size - 1 || (e instanceof StatusCodeException)) {
                        e.printStackTrace();
                        com.ss.android.ugc.effectmanager.common.utils.FileUtils.removeDir(this.mEffect.getUnzipPath());
                        sendMessage(15, new EffectTaskResult(this.mEffect, new ExceptionResult(e)));
                    }
                }
            }
        }
    }
}
