package com.android.camera.data.data.config;

import android.support.annotation.DrawableRes;
import android.support.annotation.StringRes;
import com.android.camera.CameraSettings;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.oneplus.camera.R;
import java.util.ArrayList;
import java.util.List;

public class ComponentManuallyFocus extends ComponentData {
    private boolean mIsFixedFocus;

    public ComponentManuallyFocus(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    private List<ComponentDataItem> initItems() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new ComponentDataItem(-1, -1, R.string.pref_camera_focusmode_entry_auto, "1000"));
        arrayList.add(new ComponentDataItem(-1, -1, R.string.pref_camera_focusmode_entry_auto, "manual"));
        return arrayList;
    }

    public boolean disableUpdate() {
        return this.mIsFixedFocus;
    }

    public String getDefaultValue(int i) {
        return "1000";
    }

    @StringRes
    public int getDefaultValueDisplayString(int i) {
        return R.string.pref_camera_focusmode_entry_auto;
    }

    public int getDisplayTitleString() {
        return R.string.pref_qc_focus_position_title;
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            this.mItems = initItems();
        }
        return this.mItems;
    }

    public String getKey(int i) {
        return CameraSettings.KEY_QC_FOCUS_POSITION;
    }

    @StringRes
    public int getValueDisplayString(int i) {
        if (Integer.valueOf(getComponentValue(i)).intValue() == 1000) {
            return R.string.pref_camera_focusmode_entry_auto;
        }
        return -1;
    }

    @DrawableRes
    public int getValueSelectedDrawable(int i) {
        int intValue = Integer.valueOf(getComponentValue(i)).intValue();
        if (intValue == 1000) {
            return -1;
        }
        double d = (double) intValue;
        return d >= 600.0d ? R.drawable.ic_focusmode_macro : d >= 200.0d ? R.drawable.ic_focusmode_normal : R.drawable.ic_focusmode_infinity;
    }

    public void setFixedFocusLens(boolean z) {
        this.mIsFixedFocus = z;
    }
}
