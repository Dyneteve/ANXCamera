package com.ss.android.ugc.effectmanager.common.model;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.util.List;

public class UrlModel implements Parcelable {
    public static final Creator<UrlModel> CREATOR = new Creator<UrlModel>() {
        public UrlModel createFromParcel(Parcel parcel) {
            return new UrlModel(parcel);
        }

        public UrlModel[] newArray(int i) {
            return new UrlModel[i];
        }
    };
    private String uri;
    private List<String> url_list;

    public UrlModel() {
    }

    private UrlModel(Parcel parcel) {
        this.url_list = parcel.createStringArrayList();
        this.uri = parcel.readString();
    }

    public int describeContents() {
        return 0;
    }

    public String getUri() {
        return this.uri;
    }

    public List<String> getUrlList() {
        return this.url_list;
    }

    public void setUri(String str) {
        this.uri = str;
    }

    public void setUrlList(List<String> list) {
        this.url_list = list;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeStringList(this.url_list);
        parcel.writeString(this.uri);
    }
}
