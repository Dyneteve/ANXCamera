package com.ss.android.ugc.effectmanager.effect.model;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BuildEffectChannelResponse {
    private static final String COMPRESSED_FILE_SUFFIX = ".zip";
    private String mFileDirectory;
    private boolean mIsCache;
    private String mPanel;

    public BuildEffectChannelResponse(String str, String str2, boolean z) {
        this.mPanel = str;
        this.mFileDirectory = str2;
        this.mIsCache = z;
    }

    private void fillEffectPath(List<Effect> list) {
        if (list != null && !list.isEmpty()) {
            for (Effect effect : list) {
                StringBuilder sb = new StringBuilder();
                sb.append(this.mFileDirectory);
                sb.append(File.separator);
                sb.append(effect.getId());
                sb.append(".zip");
                effect.setZipPath(sb.toString());
                StringBuilder sb2 = new StringBuilder();
                sb2.append(this.mFileDirectory);
                sb2.append(File.separator);
                sb2.append(effect.getId());
                effect.setUnzipPath(sb2.toString());
            }
        }
    }

    private List<Effect> getCategoryAllEffects(EffectCategoryModel effectCategoryModel, Map<String, Effect> map) {
        ArrayList arrayList = new ArrayList();
        for (String str : effectCategoryModel.getEffects()) {
            Effect effect = (Effect) map.get(str);
            if (effect != null) {
                arrayList.add(effect);
            }
        }
        return arrayList;
    }

    private void getChildEffect(List<Effect> list, Map<String, Effect> map) {
        for (Effect effect : list) {
            if (effect.getEffectType() == 1) {
                ArrayList arrayList = new ArrayList();
                for (String str : effect.getChildren()) {
                    Effect effect2 = (Effect) map.get(str);
                    if (effect2 != null) {
                        arrayList.add(effect2);
                    }
                }
                effect.setChildEffects(arrayList);
            }
        }
    }

    private Effect getEffect(String str, Map<String, Effect> map) {
        return (Effect) map.get(str);
    }

    private List<EffectCategoryResponse> initCategory(EffectChannelModel effectChannelModel, Map<String, Effect> map) {
        ArrayList arrayList = new ArrayList();
        if (!effectChannelModel.getCategory().isEmpty()) {
            for (EffectCategoryModel effectCategoryModel : effectChannelModel.getCategory()) {
                EffectCategoryResponse effectCategoryResponse = new EffectCategoryResponse();
                effectCategoryResponse.setId(effectCategoryModel.getId());
                effectCategoryResponse.setName(effectCategoryModel.getName());
                effectCategoryResponse.setKey(effectCategoryModel.getKey());
                if (!effectCategoryModel.getIcon().getUrl_list().isEmpty()) {
                    effectCategoryResponse.setIcon_normal_url((String) effectCategoryModel.getIcon().getUrl_list().get(0));
                }
                if (!effectCategoryModel.getIcon_selected().getUrl_list().isEmpty()) {
                    effectCategoryResponse.setIcon_selected_url((String) effectCategoryModel.getIcon_selected().getUrl_list().get(0));
                }
                effectCategoryResponse.setTotalEffects(getCategoryAllEffects(effectCategoryModel, map));
                effectCategoryResponse.setTags(effectCategoryModel.getTags());
                effectCategoryResponse.setTagsUpdateTime(effectCategoryModel.getTagsUpdated());
                effectCategoryResponse.setCollectionEffect(effectChannelModel.getCollection());
                arrayList.add(effectCategoryResponse);
            }
        }
        return arrayList;
    }

    public EffectChannelResponse buildChannelResponse(EffectChannelModel effectChannelModel) {
        System.currentTimeMillis();
        HashMap hashMap = new HashMap();
        HashMap hashMap2 = new HashMap();
        for (Effect effect : effectChannelModel.getEffects()) {
            hashMap.put(effect.getEffectId(), effect);
        }
        for (Effect effect2 : effectChannelModel.getCollection()) {
            hashMap2.put(effect2.getEffectId(), effect2);
        }
        EffectChannelResponse effectChannelResponse = new EffectChannelResponse();
        effectChannelResponse.setPanel(this.mPanel);
        effectChannelResponse.setVersion(effectChannelModel.getVersion());
        effectChannelResponse.setAllCategoryEffects(effectChannelModel.getEffects());
        effectChannelResponse.setCollections(effectChannelModel.getCollection());
        effectChannelResponse.setCategoryResponseList(initCategory(effectChannelModel, hashMap));
        getChildEffect(effectChannelModel.getEffects(), hashMap2);
        effectChannelResponse.setPanelModel(effectChannelModel.getPanel());
        effectChannelResponse.setFrontEffect(getEffect(effectChannelModel.getFront_effect_id(), hashMap));
        effectChannelResponse.setRearEffect(getEffect(effectChannelModel.getRear_effect_id(), hashMap));
        if (!this.mIsCache) {
            fillEffectPath(effectChannelModel.getEffects());
            fillEffectPath(effectChannelModel.getCollection());
        }
        return effectChannelResponse;
    }
}
