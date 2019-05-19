package com.android.camera.fragment.beauty;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.android.camera.constant.BeautyConstant;
import com.mi.config.b;
import java.util.Locale;

public class BeautyValues implements Parcelable {
    public static final Creator<BeautyValues> CREATOR = new Creator<BeautyValues>() {
        public BeautyValues createFromParcel(Parcel parcel) {
            return new BeautyValues(parcel);
        }

        public BeautyValues[] newArray(int i) {
            return new BeautyValues[i];
        }
    };
    public int mBeautyBlusher;
    public int mBeautyBodySlim;
    public int mBeautyButtSlim;
    public int mBeautyChin;
    public int mBeautyEnlargeEye;
    public int mBeautyEyebrowDye;
    public int mBeautyHeadSlim;
    public int mBeautyJellyLips;
    public int mBeautyLegSlim;
    public String mBeautyLevel;
    public int mBeautyLips;
    public int mBeautyNeck;
    public int mBeautyNose;
    public int mBeautyPupilLine;
    public int mBeautyRisorius;
    public int mBeautyShoulderSlim;
    public int mBeautySkinColor;
    public int mBeautySkinSmooth;
    public int mBeautySlimFace;
    public int mBeautySlimNose;
    public int mBeautySmile;
    public int mBeautyWholeBodySlim;

    public BeautyValues() {
    }

    protected BeautyValues(Parcel parcel) {
        this.mBeautyLevel = parcel.readString();
        if (b.iw()) {
            this.mBeautySkinSmooth = parcel.readInt();
            this.mBeautySlimFace = parcel.readInt();
            this.mBeautyEnlargeEye = parcel.readInt();
            this.mBeautyNose = parcel.readInt();
            this.mBeautyRisorius = parcel.readInt();
            this.mBeautyLips = parcel.readInt();
            this.mBeautyChin = parcel.readInt();
            this.mBeautyNeck = parcel.readInt();
            this.mBeautySmile = parcel.readInt();
            this.mBeautySlimNose = parcel.readInt();
            this.mBeautyEyebrowDye = parcel.readInt();
            this.mBeautyPupilLine = parcel.readInt();
            this.mBeautyJellyLips = parcel.readInt();
            this.mBeautyBlusher = parcel.readInt();
            this.mBeautyHeadSlim = parcel.readInt();
            this.mBeautyBodySlim = parcel.readInt();
            this.mBeautyShoulderSlim = parcel.readInt();
            this.mBeautyLegSlim = parcel.readInt();
            this.mBeautyWholeBodySlim = parcel.readInt();
            this.mBeautyButtSlim = parcel.readInt();
            return;
        }
        this.mBeautySkinColor = parcel.readInt();
        this.mBeautySlimFace = parcel.readInt();
        this.mBeautySkinSmooth = parcel.readInt();
        this.mBeautyEnlargeEye = parcel.readInt();
    }

    public BeautyValues(BeautyValues beautyValues) {
        if (beautyValues != null) {
            this.mBeautyLevel = beautyValues.mBeautyLevel;
            this.mBeautySkinColor = beautyValues.mBeautySkinColor;
            this.mBeautySlimFace = beautyValues.mBeautySlimFace;
            this.mBeautySkinSmooth = beautyValues.mBeautySkinSmooth;
            this.mBeautyEnlargeEye = beautyValues.mBeautyEnlargeEye;
            this.mBeautyNose = beautyValues.mBeautyNose;
            this.mBeautyRisorius = beautyValues.mBeautyRisorius;
            this.mBeautyLips = beautyValues.mBeautyLips;
            this.mBeautyChin = beautyValues.mBeautyChin;
            this.mBeautyNeck = beautyValues.mBeautyNeck;
            this.mBeautySmile = beautyValues.mBeautySmile;
            this.mBeautySlimNose = beautyValues.mBeautySlimNose;
            this.mBeautyEyebrowDye = beautyValues.mBeautyEyebrowDye;
            this.mBeautyPupilLine = beautyValues.mBeautyPupilLine;
            this.mBeautyJellyLips = beautyValues.mBeautyJellyLips;
            this.mBeautyBlusher = beautyValues.mBeautyBlusher;
            this.mBeautyHeadSlim = beautyValues.mBeautyHeadSlim;
            this.mBeautyBodySlim = beautyValues.mBeautyBodySlim;
            this.mBeautyShoulderSlim = beautyValues.mBeautyShoulderSlim;
            this.mBeautyLegSlim = beautyValues.mBeautyLegSlim;
            this.mBeautyWholeBodySlim = beautyValues.mBeautyWholeBodySlim;
            this.mBeautyButtSlim = beautyValues.mBeautyButtSlim;
        }
    }

    public int describeContents() {
        return 0;
    }

    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int getValueByType(String str) {
        char c;
        switch (str.hashCode()) {
            case -1735290593:
                if (str.equals("pref_beauty_body_slim_ratio")) {
                    c = 16;
                    break;
                }
            case -1584074159:
                if (str.equals("pref_beautify_jelly_lips_ratio_key")) {
                    c = 13;
                    break;
                }
            case -1518569458:
                if (str.equals("pref_beauty_butt_slim_ratio")) {
                    c = 20;
                    break;
                }
            case -1262324777:
                if (str.equals("pref_beauty_whole_body_slim_ratio")) {
                    c = 19;
                    break;
                }
            case -1110975408:
                if (str.equals("pref_beautify_smile_ratio_key")) {
                    c = 9;
                    break;
                }
            case -958841118:
                if (str.equals("pref_beautify_eyebrow_dye_ratio_key")) {
                    c = 11;
                    break;
                }
            case -897176419:
                if (str.equals("pref_beautify_slim_nose_ratio_key")) {
                    c = 10;
                    break;
                }
            case -335791057:
                if (str.equals("pref_beautify_neck_ratio_key")) {
                    c = 8;
                    break;
                }
            case -310919472:
                if (str.equals("pref_beautify_lips_ratio_key")) {
                    c = 6;
                    break;
                }
            case -271212966:
                if (str.equals("pref_beautify_chin_ratio_key")) {
                    c = 7;
                    break;
                }
            case -146567779:
                if (str.equals("key_beauty_leg_slim_ratio")) {
                    c = 18;
                    break;
                }
            case -39674120:
                if (str.equals("pref_beautify_risorius_ratio_key")) {
                    c = 5;
                    break;
                }
            case 894643879:
                if (str.equals("pref_beautify_slim_face_ratio_key")) {
                    c = 1;
                    break;
                }
            case 917154040:
                if (str.equals("pref_beautify_skin_smooth_ratio_key")) {
                    c = 3;
                    break;
                }
            case 987275939:
                if (str.equals("pref_beautify_nose_ratio_key")) {
                    c = 4;
                    break;
                }
            case 1048736236:
                if (str.equals("pref_beautify_enlarge_eye_ratio_key")) {
                    c = 2;
                    break;
                }
            case 1057690737:
                if (str.equals("pref_beautify_skin_color_ratio_key")) {
                    c = 0;
                    break;
                }
            case 1427427765:
                if (str.equals("pref_beautify_blusher_ratio_key")) {
                    c = 14;
                    break;
                }
            case 1644342645:
                if (str.equals("pref_beautify_pupil_line_ratio_key")) {
                    c = 12;
                    break;
                }
            case 1709402593:
                if (str.equals("pref_beauty_shoulder_slim_ratio")) {
                    c = 17;
                    break;
                }
            case 1945143841:
                if (str.equals("pref_beauty_head_slim_ratio")) {
                    c = 15;
                    break;
                }
            default:
                c = 65535;
                break;
        }
        switch (c) {
            case 0:
                return this.mBeautySkinColor;
            case 1:
                return this.mBeautySlimFace;
            case 2:
                return this.mBeautyEnlargeEye;
            case 3:
                return this.mBeautySkinSmooth;
            case 4:
                return this.mBeautyNose;
            case 5:
                return this.mBeautyRisorius;
            case 6:
                return this.mBeautyLips;
            case 7:
                return this.mBeautyChin;
            case 8:
                return this.mBeautyNeck;
            case 9:
                return this.mBeautySmile;
            case 10:
                return this.mBeautySlimNose;
            case 11:
                return this.mBeautyEyebrowDye;
            case 12:
                return this.mBeautyPupilLine;
            case 13:
                return this.mBeautyJellyLips;
            case 14:
                return this.mBeautyBlusher;
            case 15:
                return this.mBeautyHeadSlim;
            case 16:
                return this.mBeautyBodySlim;
            case 17:
                return this.mBeautyShoulderSlim;
            case 18:
                return this.mBeautyLegSlim;
            case 19:
                return this.mBeautyWholeBodySlim;
            case 20:
                return this.mBeautyButtSlim;
            default:
                return 0;
        }
    }

    public boolean isBeautyBodyOn() {
        return this.mBeautyHeadSlim > 0 || this.mBeautyBodySlim > 0 || this.mBeautyShoulderSlim > 0 || this.mBeautyLegSlim > 0 || this.mBeautyWholeBodySlim > 0 || this.mBeautyButtSlim > 0;
    }

    public boolean isBeautyLevelOn() {
        return !BeautyConstant.LEVEL_CLOSE.equals(this.mBeautyLevel);
    }

    public boolean isBeautyMakeUpOn() {
        return this.mBeautyEyebrowDye > 0 || this.mBeautyPupilLine > 0 || this.mBeautyJellyLips > 0 || this.mBeautyBlusher > 0;
    }

    public boolean isBeautyModelOn() {
        return this.mBeautySlimFace > 0 || this.mBeautyEnlargeEye > 0 || this.mBeautyNose > 0 || this.mBeautyRisorius > 0 || !(this.mBeautyLips == 0 || this.mBeautyLips == 0) || (!(this.mBeautyChin == 0 || this.mBeautyChin == 0) || this.mBeautyNeck > 0 || this.mBeautySmile > 0 || this.mBeautySlimNose > 0);
    }

    public boolean isFaceBeautyOn() {
        return isBeautyLevelOn() || isSmoothLevelOn() || isBeautyModelOn() || isBeautyMakeUpOn() || isBeautyBodyOn();
    }

    public boolean isSmoothLevelOn() {
        return this.mBeautySkinSmooth > 0;
    }

    public void resetAll() {
        resetBeautyLevel();
        resetSmoothLevel();
        resetBeautyModelLegacy();
        resetBeautyModel();
        resetBeautyMakeUp();
        resetBeautyBody();
    }

    public void resetBeautyBody() {
        this.mBeautyHeadSlim = 0;
        this.mBeautyBodySlim = 0;
        this.mBeautyShoulderSlim = 0;
        this.mBeautyLegSlim = 0;
        this.mBeautyWholeBodySlim = 0;
        this.mBeautyButtSlim = 0;
    }

    public void resetBeautyLevel() {
        this.mBeautyLevel = BeautyConstant.LEVEL_CLOSE;
    }

    public void resetBeautyMakeUp() {
        this.mBeautyEyebrowDye = 0;
        this.mBeautyPupilLine = 0;
        this.mBeautyJellyLips = 0;
        this.mBeautyBlusher = 0;
    }

    public void resetBeautyModel() {
        this.mBeautySlimFace = 0;
        this.mBeautyEnlargeEye = 0;
        this.mBeautyNose = 0;
        this.mBeautyRisorius = 0;
        this.mBeautyLips = 0;
        this.mBeautyChin = 0;
        this.mBeautyNeck = 0;
        this.mBeautySmile = 0;
        this.mBeautySlimNose = 0;
    }

    public void resetBeautyModelLegacy() {
        this.mBeautySkinColor = 0;
        this.mBeautySlimFace = 0;
        this.mBeautySkinSmooth = 0;
        this.mBeautyEnlargeEye = 0;
    }

    public void resetSmoothLevel() {
        this.mBeautySkinSmooth = 0;
    }

    public String toString() {
        if (!b.iw()) {
            return String.format(Locale.ENGLISH, "beauty level: %s | sc: %d | sf: %d | ss: %d | ee: %d ", new Object[]{this.mBeautyLevel, Integer.valueOf(this.mBeautySkinColor), Integer.valueOf(this.mBeautySlimFace), Integer.valueOf(this.mBeautySkinSmooth), Integer.valueOf(this.mBeautyEnlargeEye)});
        }
        return String.format(Locale.ENGLISH, "3d beauty level: %s | sf: %d | ee: %d | ns: %d | rs: %d | lp: %d | cn: %d | nk: %d | se: %d | sn: %d | ed: %d | pl: %d | jl: %d | blusher: %d| headSlim: %d | bodySlim: %d | shoulderSlim: %d | legSlim: %d ", new Object[]{this.mBeautyLevel, Integer.valueOf(this.mBeautySlimFace), Integer.valueOf(this.mBeautyEnlargeEye), Integer.valueOf(this.mBeautyNose), Integer.valueOf(this.mBeautyRisorius), Integer.valueOf(this.mBeautyLips), Integer.valueOf(this.mBeautyChin), Integer.valueOf(this.mBeautyNeck), Integer.valueOf(this.mBeautySmile), Integer.valueOf(this.mBeautySlimNose), Integer.valueOf(this.mBeautyEyebrowDye), Integer.valueOf(this.mBeautyPupilLine), Integer.valueOf(this.mBeautyJellyLips), Integer.valueOf(this.mBeautyBlusher), Integer.valueOf(this.mBeautyHeadSlim), Integer.valueOf(this.mBeautyBodySlim), Integer.valueOf(this.mBeautyShoulderSlim), Integer.valueOf(this.mBeautyLegSlim)});
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.mBeautyLevel);
        if (b.iw()) {
            parcel.writeInt(this.mBeautySkinSmooth);
            parcel.writeInt(this.mBeautySlimFace);
            parcel.writeInt(this.mBeautyEnlargeEye);
            parcel.writeInt(this.mBeautyNose);
            parcel.writeInt(this.mBeautyRisorius);
            parcel.writeInt(this.mBeautyLips);
            parcel.writeInt(this.mBeautyChin);
            parcel.writeInt(this.mBeautyNeck);
            parcel.writeInt(this.mBeautySmile);
            parcel.writeInt(this.mBeautySlimNose);
            parcel.writeInt(this.mBeautyEyebrowDye);
            parcel.writeInt(this.mBeautyPupilLine);
            parcel.writeInt(this.mBeautyJellyLips);
            parcel.writeInt(this.mBeautyBlusher);
            parcel.writeInt(this.mBeautyHeadSlim);
            parcel.writeInt(this.mBeautyBodySlim);
            parcel.writeInt(this.mBeautyShoulderSlim);
            parcel.writeInt(this.mBeautyLegSlim);
            parcel.writeInt(this.mBeautyWholeBodySlim);
            parcel.writeInt(this.mBeautyButtSlim);
            return;
        }
        parcel.writeInt(this.mBeautySkinColor);
        parcel.writeInt(this.mBeautySlimFace);
        parcel.writeInt(this.mBeautySkinSmooth);
        parcel.writeInt(this.mBeautyEnlargeEye);
    }
}
