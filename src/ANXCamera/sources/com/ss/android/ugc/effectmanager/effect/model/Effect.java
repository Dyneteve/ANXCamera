package com.ss.android.ugc.effectmanager.effect.model;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.ss.android.ugc.effectmanager.common.model.UrlModel;
import java.util.ArrayList;
import java.util.List;

public class Effect implements Parcelable {
    public static final Creator<Effect> CREATOR = new Creator<Effect>() {
        public Effect createFromParcel(Parcel parcel) {
            return new Effect(parcel);
        }

        public Effect[] newArray(int i) {
            return new Effect[i];
        }
    };
    private String app_version;
    @Nullable
    private List<Effect> childEffects;
    private List<String> children;
    private String designer_id;
    private String device_platform;
    private boolean downloaded;
    private String effect_id;
    private int effect_type;
    private UrlModel file_url;
    private String hint;
    private UrlModel hint_icon;
    private UrlModel icon_url;
    private String id;
    private String name;
    private String parent;
    private String schema;
    private String sdk_version;
    private int source;
    private List<String> tags;
    private String tags_updated_at;
    private String type;
    private List<String> types;
    private String unzipPath;
    private String zipPath;

    public Effect() {
    }

    protected Effect(Parcel parcel) {
        this.name = parcel.readString();
        this.hint = parcel.readString();
        this.sdk_version = parcel.readString();
        this.app_version = parcel.readString();
        this.file_url = (UrlModel) parcel.readParcelable(UrlModel.class.getClassLoader());
        this.icon_url = (UrlModel) parcel.readParcelable(UrlModel.class.getClassLoader());
        this.id = parcel.readString();
        this.effect_id = parcel.readString();
        this.type = parcel.readString();
        this.types = parcel.createStringArrayList();
        this.device_platform = parcel.readString();
        this.zipPath = parcel.readString();
        this.unzipPath = parcel.readString();
        this.downloaded = parcel.readByte() != 0;
        this.tags = parcel.createStringArrayList();
        this.tags_updated_at = parcel.readString();
        this.hint_icon = (UrlModel) parcel.readParcelable(UrlModel.class.getClassLoader());
        this.children = parcel.createStringArrayList();
        this.childEffects = parcel.createTypedArrayList(CREATOR);
        this.effect_type = parcel.readInt();
        this.parent = parcel.readString();
        this.source = parcel.readInt();
        this.designer_id = parcel.readString();
        this.schema = parcel.readString();
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        return obj instanceof Effect ? TextUtils.equals(this.effect_id, ((Effect) obj).effect_id) : super.equals(obj);
    }

    public String getAppVersion() {
        return this.app_version;
    }

    public List<Effect> getChildEffects() {
        return this.childEffects;
    }

    public List<String> getChildren() {
        return this.children;
    }

    public String getDesignerId() {
        return this.designer_id;
    }

    public String getDevicePlatform() {
        return this.device_platform;
    }

    public String getEffectId() {
        return this.effect_id;
    }

    public int getEffectType() {
        return this.effect_type;
    }

    public UrlModel getFileUrl() {
        return this.file_url;
    }

    public String getHint() {
        return this.hint;
    }

    public UrlModel getHintIcon() {
        return this.hint_icon;
    }

    public UrlModel getIconUrl() {
        return this.icon_url;
    }

    public String getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }

    public String getParentId() {
        return this.parent;
    }

    public String getSchema() {
        return this.schema;
    }

    public String getSdkVersion() {
        return this.sdk_version;
    }

    public int getSource() {
        return this.source;
    }

    public List<String> getTags() {
        return this.tags == null ? new ArrayList() : this.tags;
    }

    public String getTagsUpdatedAt() {
        return this.tags_updated_at;
    }

    public String getType() {
        return this.type;
    }

    public List<String> getTypes() {
        return this.types;
    }

    public String getUnzipPath() {
        return this.unzipPath;
    }

    public String getZipPath() {
        return this.zipPath;
    }

    public boolean isDownloaded() {
        return this.downloaded;
    }

    public void setAppVersion(String str) {
        this.app_version = str;
    }

    public void setChildEffects(List<Effect> list) {
        this.childEffects = list;
    }

    public void setChildren(List<String> list) {
        this.children = list;
    }

    public void setDesignerId(String str) {
        this.designer_id = str;
    }

    public void setDevicePlatform(String str) {
        this.device_platform = str;
    }

    public void setDownloaded(boolean z) {
        this.downloaded = z;
    }

    public void setEffectId(String str) {
        this.effect_id = str;
    }

    public void setEffectType(int i) {
        this.effect_type = i;
    }

    public void setFileUrl(UrlModel urlModel) {
        this.file_url = urlModel;
    }

    public void setHint(String str) {
        this.hint = str;
    }

    public void setHintIcon(UrlModel urlModel) {
        this.hint_icon = urlModel;
    }

    public void setIconUrl(UrlModel urlModel) {
        this.icon_url = urlModel;
    }

    public void setId(String str) {
        this.id = str;
    }

    public void setName(String str) {
        this.name = str;
    }

    public void setParentId(String str) {
        this.parent = str;
    }

    public void setSchema(String str) {
        this.schema = str;
    }

    public void setSdkVersion(String str) {
        this.sdk_version = str;
    }

    public void setSource(int i) {
        this.source = i;
    }

    public void setTags(List<String> list) {
        this.tags = list;
    }

    public void setTagsUpdatedAt(String str) {
        this.tags_updated_at = str;
    }

    public void setType(String str) {
        this.type = str;
    }

    public void setTypes(List<String> list) {
        this.types = list;
    }

    public void setUnzipPath(String str) {
        this.unzipPath = str;
    }

    public void setZipPath(String str) {
        this.zipPath = str;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Effect{name='");
        sb.append(this.name);
        sb.append('\'');
        sb.append(", effect_id='");
        sb.append(this.effect_id);
        sb.append('\'');
        sb.append(", type='");
        sb.append(this.type);
        sb.append('\'');
        sb.append(", unzipPath='");
        sb.append(this.unzipPath);
        sb.append('\'');
        sb.append(", children=");
        sb.append(this.children);
        sb.append(", effectType=");
        sb.append(this.effect_type);
        sb.append(", parentId=");
        sb.append(this.parent);
        sb.append('}');
        return sb.toString();
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.name);
        parcel.writeString(this.hint);
        parcel.writeString(this.sdk_version);
        parcel.writeString(this.app_version);
        parcel.writeParcelable(this.file_url, i);
        parcel.writeParcelable(this.icon_url, i);
        parcel.writeString(this.id);
        parcel.writeString(this.effect_id);
        parcel.writeString(this.type);
        parcel.writeStringList(this.types);
        parcel.writeString(this.device_platform);
        parcel.writeString(this.zipPath);
        parcel.writeString(this.unzipPath);
        parcel.writeByte(this.downloaded ? (byte) 1 : 0);
        parcel.writeStringList(this.tags);
        parcel.writeString(this.tags_updated_at);
        parcel.writeParcelable(this.hint_icon, i);
        parcel.writeStringList(this.children);
        parcel.writeTypedList(this.childEffects);
        parcel.writeInt(this.effect_type);
        parcel.writeString(this.parent);
        parcel.writeInt(this.source);
        parcel.writeString(this.designer_id);
        parcel.writeString(this.schema);
    }
}
