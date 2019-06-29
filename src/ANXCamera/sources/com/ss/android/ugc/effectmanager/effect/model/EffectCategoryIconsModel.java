package com.ss.android.ugc.effectmanager.effect.model;

import java.util.ArrayList;
import java.util.List;

public class EffectCategoryIconsModel {
    private String uri;
    private List<String> url_list;

    public EffectCategoryIconsModel() {
        this.url_list = new ArrayList();
        this.uri = "";
    }

    public EffectCategoryIconsModel(List<String> list, String str) {
        this.url_list = list;
        this.uri = str;
    }

    public boolean checkValued() {
        if (this.url_list == null) {
            this.url_list = new ArrayList();
        }
        return true;
    }

    public String getUri() {
        return this.uri;
    }

    public List<String> getUrl_list() {
        return this.url_list;
    }

    public void setUri(String str) {
        this.uri = str;
    }

    public void setUrl_list(List<String> list) {
        this.url_list = list;
    }
}
