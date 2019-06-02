package com.ss.android.ugc.effectmanager.effect.model;

import java.util.ArrayList;
import java.util.List;

public class EffectChannelResponse {
    private List<Effect> allCategoryEffects;
    private List<EffectCategoryResponse> categoryResponseList;
    private List<Effect> collections;
    private Effect frontEffect;
    private String panel;
    private EffectPanelModel panelModel;
    private Effect rearEffect;
    private String version;

    public EffectChannelResponse() {
        this.allCategoryEffects = new ArrayList();
        this.categoryResponseList = new ArrayList();
    }

    public EffectChannelResponse(String str) {
        this.panel = str;
        this.allCategoryEffects = new ArrayList();
        this.categoryResponseList = new ArrayList();
    }

    public EffectChannelResponse(String str, List<Effect> list, List<EffectCategoryResponse> list2) {
        this.version = str;
        this.allCategoryEffects = list;
        this.categoryResponseList = list2;
    }

    public List<Effect> getAllCategoryEffects() {
        return this.allCategoryEffects;
    }

    public List<EffectCategoryResponse> getCategoryResponseList() {
        return this.categoryResponseList;
    }

    public List<Effect> getCollections() {
        return this.collections;
    }

    public Effect getFrontEffect() {
        return this.frontEffect;
    }

    public String getPanel() {
        return this.panel;
    }

    public EffectPanelModel getPanelModel() {
        if (this.panelModel == null) {
            this.panelModel = new EffectPanelModel();
        }
        this.panelModel.setId(this.panel);
        return this.panelModel;
    }

    public Effect getRearEffect() {
        return this.rearEffect;
    }

    public String getVersion() {
        return this.version;
    }

    public void setAllCategoryEffects(List<Effect> list) {
        this.allCategoryEffects = list;
    }

    public void setCategoryResponseList(List<EffectCategoryResponse> list) {
        this.categoryResponseList = list;
    }

    public void setCollections(List<Effect> list) {
        this.collections = list;
    }

    public void setFrontEffect(Effect effect) {
        this.frontEffect = effect;
    }

    public void setPanel(String str) {
        this.panel = str;
    }

    public void setPanelModel(EffectPanelModel effectPanelModel) {
        if (effectPanelModel == null) {
            effectPanelModel = new EffectPanelModel();
        }
        this.panelModel = effectPanelModel;
    }

    public void setRearEffect(Effect effect) {
        this.rearEffect = effect;
    }

    public void setVersion(String str) {
        this.version = str;
    }
}
