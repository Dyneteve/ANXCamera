package com.ss.android.ugc.effectmanager.effect.task.task;

import android.os.Handler;
import android.text.TextUtils;
import com.android.camera.module.impl.component.FileUtils;
import com.ss.android.ugc.effectmanager.EffectConfiguration;
import com.ss.android.ugc.effectmanager.common.EffectConstants;
import com.ss.android.ugc.effectmanager.common.listener.ICache;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.common.task.NormalTask;
import com.ss.android.ugc.effectmanager.common.utils.EffectUtils;
import com.ss.android.ugc.effectmanager.context.EffectContext;
import com.ss.android.ugc.effectmanager.effect.model.Effect;
import com.ss.android.ugc.effectmanager.effect.task.result.EffectListTaskResult;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class DownloadEffectListTask extends NormalTask {
    private List<Effect> downloadedList;
    private List<Effect> effectList;
    private ICache mCache;
    private EffectConfiguration mConfiguration = this.mEffectContext.getEffectConfiguration();
    private int mCurCnt;
    private EffectContext mEffectContext;

    public DownloadEffectListTask(EffectContext effectContext, List<Effect> list, String str, Handler handler) {
        super(handler, str, EffectConstants.NETWORK);
        this.mEffectContext = effectContext;
        this.mCache = effectContext.getEffectConfiguration().getCache();
        this.effectList = list;
        this.downloadedList = new ArrayList();
        this.downloadedList.addAll(list);
    }

    private void downloadEffect(List<Effect> list) throws Exception {
        for (Effect effect : list) {
            if (TextUtils.isEmpty(effect.getZipPath()) || TextUtils.isEmpty(effect.getUnzipPath())) {
                StringBuilder sb = new StringBuilder();
                sb.append(this.mConfiguration.getEffectDir());
                sb.append(File.separator);
                sb.append(effect.getId());
                sb.append(FileUtils.SUFFIX);
                effect.setZipPath(sb.toString());
                StringBuilder sb2 = new StringBuilder();
                sb2.append(this.mConfiguration.getEffectDir());
                sb2.append(File.separator);
                sb2.append(effect.getId());
                effect.setUnzipPath(sb2.toString());
            }
            if (!this.mCache.has(effect.getId())) {
                try {
                    EffectUtils.downloadEffect(this.mConfiguration, effect);
                } catch (Exception e) {
                    this.downloadedList.remove(effect);
                    throw e;
                }
            }
        }
    }

    public void execute() {
        try {
            downloadEffect(this.effectList);
            sendMessage(17, new EffectListTaskResult(this.downloadedList, null));
        } catch (Exception e) {
            e.printStackTrace();
            sendMessage(17, new EffectListTaskResult(this.downloadedList, new ExceptionResult(e)));
        }
    }
}
