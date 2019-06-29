package com.android.camera.data.data.config;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import java.util.List;

@Deprecated
public class ComponentConfigBeautyBody extends ComponentData {
    private static final int DEF_BEAUTY_BODY_VALUE = 0;
    private boolean mIsClosed;

    public ComponentConfigBeautyBody(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    public int getBeautyBodyValue(String str, int i) {
        return isClosed() ? i : this.mParentDataItem.getInt(str, i);
    }

    @NonNull
    public String getDefaultValue(int i) {
        return null;
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public List<ComponentDataItem> getItems() {
        return null;
    }

    public String getKey(int i) {
        switch (i) {
            case 161:
            case 162:
                return "_video";
            default:
                return null;
        }
    }

    public boolean isBeautyBodyKey(String str) {
        char c;
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        switch (str.hashCode()) {
            case -1735290593:
                if (str.equals("pref_beauty_body_slim_ratio")) {
                    c = 1;
                    break;
                }
            case -1518569458:
                if (str.equals("pref_beauty_butt_slim_ratio")) {
                    c = 5;
                    break;
                }
            case -1262324777:
                if (str.equals("pref_beauty_whole_body_slim_ratio")) {
                    c = 4;
                    break;
                }
            case -146567779:
                if (str.equals("key_beauty_leg_slim_ratio")) {
                    c = 3;
                    break;
                }
            case 1709402593:
                if (str.equals("pref_beauty_shoulder_slim_ratio")) {
                    c = 2;
                    break;
                }
            case 1945143841:
                if (str.equals("pref_beauty_head_slim_ratio")) {
                    c = 0;
                    break;
                }
            default:
                c = 65535;
                break;
        }
        switch (c) {
            case 0:
                return true;
            case 1:
                return true;
            case 2:
                return true;
            case 3:
                return true;
            case 4:
                return true;
            case 5:
                return true;
            default:
                return false;
        }
    }

    public boolean isClosed() {
        return this.mIsClosed;
    }

    public void resetBeautyBody(int i, ProviderEditor providerEditor) {
        String str = "pref_beauty_head_slim_ratio";
        String str2 = "pref_beauty_body_slim_ratio";
        String str3 = "pref_beauty_shoulder_slim_ratio";
        String str4 = "key_beauty_leg_slim_ratio";
        String str5 = "pref_beauty_whole_body_slim_ratio";
        String str6 = "pref_beauty_butt_slim_ratio";
        if (this.mParentDataItem.getInt(str, 0) > 0) {
            providerEditor.putInt(str, 0);
        }
        if (this.mParentDataItem.getInt(str2, 0) > 0) {
            providerEditor.putInt(str2, 0);
        }
        if (this.mParentDataItem.getInt(str3, 0) > 0) {
            providerEditor.putInt(str3, 0);
        }
        if (this.mParentDataItem.getInt(str4, 0) > 0) {
            providerEditor.putInt(str4, 0);
        }
        if (this.mParentDataItem.getInt(str5, 0) > 0) {
            providerEditor.putInt(str5, 0);
        }
        if (this.mParentDataItem.getInt(str6, 0) > 0) {
            providerEditor.putInt(str6, 0);
        }
    }

    public void setBeautyBodyValue(String str, int i) {
        setClosed(false);
        this.mParentDataItem.putInt(str, i).apply();
    }

    public void setClosed(boolean z) {
        this.mIsClosed = z;
    }
}
