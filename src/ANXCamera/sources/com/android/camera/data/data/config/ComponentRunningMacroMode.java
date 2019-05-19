package com.android.camera.data.data.config;

import android.support.annotation.NonNull;
import android.util.ArrayMap;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.runing.DataItemRunning;
import java.util.List;
import java.util.Map;

public class ComponentRunningMacroMode extends ComponentData {
    public static final String VALUE_OFF = "OFF";
    public static final String VALUE_ON = "ON";
    private Map<String, Boolean> mCacheValues = new ArrayMap();
    private int mCameraId;
    private boolean mIsNormalIntent;
    public List<ComponentDataItem> mItems;

    public ComponentRunningMacroMode(DataItemRunning dataItemRunning) {
        super(dataItemRunning);
    }

    private String getMode(int i) {
        if (165 == i) {
            i = 163;
        }
        if (169 == i) {
            i = 162;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(String.valueOf(i));
        sb.append("_");
        sb.append(this.mCameraId);
        return sb.toString();
    }

    public void clearArrayMap() {
        this.mCacheValues.clear();
    }

    @NonNull
    public String getDefaultValue(int i) {
        return "OFF";
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public List<ComponentDataItem> getItems() {
        return null;
    }

    public String getKey(int i) {
        return CameraSettings.KEY_MACRO_MODE;
    }

    public int getResIcon(boolean z) {
        return z ? R.drawable.ic_menu_macro_mode_on : R.drawable.ic_menu_macro_mode_off;
    }

    public int getResText() {
        return R.string.macro_mode;
    }

    public boolean isCacheSwitchOn(int i) {
        Boolean bool = (Boolean) this.mCacheValues.get(getMode(i));
        if (bool == null) {
            return false;
        }
        return bool.booleanValue();
    }

    public boolean isSwitchOn(int i) {
        if (!this.mIsNormalIntent) {
            return false;
        }
        return isCacheSwitchOn(i);
    }

    public void reInit(int i, boolean z) {
        this.mCameraId = i;
        this.mIsNormalIntent = z;
    }

    public void setSwitchOff(int i) {
        this.mCacheValues.put(getMode(i), Boolean.valueOf(false));
    }

    public void setSwitchOn(int i) {
        this.mCacheValues.put(getMode(i), Boolean.valueOf(true));
    }
}
