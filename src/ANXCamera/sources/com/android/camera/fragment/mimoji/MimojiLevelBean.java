package com.android.camera.fragment.mimoji;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigInfo;
import java.util.ArrayList;

public class MimojiLevelBean implements Parcelable {
    public static final Creator<MimojiLevelBean> CREATOR = new Creator<MimojiLevelBean>() {
        public MimojiLevelBean createFromParcel(Parcel parcel) {
            return new MimojiLevelBean(parcel);
        }

        public MimojiLevelBean[] newArray(int i) {
            return new MimojiLevelBean[i];
        }
    };
    public int configType;
    public String configTypeName;
    public ArrayList<ASAvatarConfigInfo> thumnails = new ArrayList<>();

    public MimojiLevelBean() {
    }

    protected MimojiLevelBean(Parcel parcel) {
        this.configTypeName = parcel.readString();
        this.configType = parcel.readInt();
    }

    public int describeContents() {
        return 0;
    }

    public ArrayList<ASAvatarConfigInfo> getColorConfigInfos() {
        AvatarEngineManager instance = AvatarEngineManager.getInstance();
        if (instance == null) {
            return null;
        }
        return instance.getSubConfigColorList(this.configType);
    }

    public int getColorType() {
        AvatarEngineManager instance = AvatarEngineManager.getInstance();
        if (instance == null) {
            return -1;
        }
        return instance.getColorType(this.configType);
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.configTypeName);
        parcel.writeInt(this.configType);
    }
}
