package com.ss.android.ugc.effectmanager.effect.model;

import java.util.List;

public class EffectCategoryResponse {
    private List<Effect> addedEffects;
    private List<Effect> collectionEffect;
    private List<Effect> deletedEffects;
    private Effect frontEffect;
    private String icon_normal_url;
    private String icon_selected_url;
    private String id;
    private String key;
    private String name;
    private Effect rearEffect;
    private List<String> tags;
    private String tagsUpdateTime;
    private List<Effect> totalEffects;

    public EffectCategoryResponse() {
    }

    public EffectCategoryResponse(String str, String str2, String str3, List<Effect> list, List<String> list2, String str4) {
        this.id = str;
        this.name = str2;
        this.key = str3;
        this.totalEffects = list;
    }

    public EffectCategoryResponse(String str, String str2, String str3, List<Effect> list, List<String> list2, String str4, List<Effect> list3) {
        this.id = str;
        this.name = str2;
        this.key = str3;
        this.totalEffects = list;
        this.collectionEffect = list3;
    }

    public List<Effect> getAddedEffects() {
        return this.addedEffects;
    }

    public List<Effect> getCollectionEffect() {
        return this.collectionEffect;
    }

    public List<Effect> getDeletedEffects() {
        return this.deletedEffects;
    }

    public Effect getFrontEffect() {
        return this.frontEffect;
    }

    public String getIcon_normal_url() {
        return this.icon_normal_url;
    }

    public String getIcon_selected_url() {
        return this.icon_selected_url;
    }

    public String getId() {
        return this.id;
    }

    public String getKey() {
        return this.key;
    }

    public String getName() {
        return this.name;
    }

    public Effect getRearEffect() {
        return this.rearEffect;
    }

    public List<String> getTags() {
        return this.tags;
    }

    public String getTagsUpdateTime() {
        return this.tagsUpdateTime;
    }

    public List<Effect> getTotalEffects() {
        return this.totalEffects;
    }

    public void setAddedEffects(List<Effect> list) {
        this.addedEffects = list;
    }

    public void setCollectionEffect(List<Effect> list) {
        this.collectionEffect = list;
    }

    public void setDeletedEffects(List<Effect> list) {
        this.deletedEffects = list;
    }

    public void setFrontEffect(Effect effect) {
        this.frontEffect = effect;
    }

    public void setIcon_normal_url(String str) {
        this.icon_normal_url = str;
    }

    public void setIcon_selected_url(String str) {
        this.icon_selected_url = str;
    }

    public void setId(String str) {
        this.id = str;
    }

    public void setKey(String str) {
        this.key = str;
    }

    public void setName(String str) {
        this.name = str;
    }

    public void setRearEffect(Effect effect) {
        this.rearEffect = effect;
    }

    public void setTags(List<String> list) {
        this.tags = list;
    }

    public void setTagsUpdateTime(String str) {
        this.tagsUpdateTime = str;
    }

    public void setTotalEffects(List<Effect> list) {
        this.totalEffects = list;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("EffectCategoryResponse{id='");
        sb.append(this.id);
        sb.append('\'');
        sb.append(", name='");
        sb.append(this.name);
        sb.append('\'');
        sb.append(", key='");
        sb.append(this.key);
        sb.append('\'');
        sb.append(", collection='");
        sb.append(this.collectionEffect);
        sb.append('\'');
        sb.append('}');
        return sb.toString();
    }
}
