package com.ss.android.ugc.effectmanager.effect.model;

import com.ss.android.ugc.effectmanager.common.model.UrlModel;
import java.util.ArrayList;
import java.util.List;

public class EffectPanelModel {
    private UrlModel icon;
    private String id;
    private List<String> tags;
    private String tags_updated_at;
    private String text;

    public EffectPanelModel() {
        if (this.icon == null) {
            this.icon = new UrlModel();
        }
        if (this.tags == null) {
            this.tags = new ArrayList();
        }
    }

    public EffectPanelModel(String str, UrlModel urlModel, List<String> list, String str2) {
        this.text = str;
        this.icon = urlModel;
        this.tags = list;
        this.tags_updated_at = str2;
    }

    public boolean checkValued() {
        if (this.icon == null) {
            this.icon = new UrlModel();
        }
        if (this.tags == null) {
            this.tags = new ArrayList();
        }
        return true;
    }

    public UrlModel getIcon() {
        return this.icon;
    }

    public String getId() {
        return this.id;
    }

    public List<String> getTags() {
        return this.tags;
    }

    public String getTags_updated_at() {
        return this.tags_updated_at;
    }

    public String getText() {
        return this.text;
    }

    public void setIcon(UrlModel urlModel) {
        this.icon = urlModel;
    }

    public void setId(String str) {
        this.id = str;
    }

    public void setTags(List<String> list) {
        this.tags = list;
    }

    public void setTags_updated_at(String str) {
        this.tags_updated_at = str;
    }

    public void setText(String str) {
        this.text = str;
    }
}
