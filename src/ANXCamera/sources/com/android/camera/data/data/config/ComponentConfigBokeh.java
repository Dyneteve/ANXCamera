package com.android.camera.data.data.config;

import android.support.annotation.NonNull;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import java.util.ArrayList;
import java.util.List;

public class ComponentConfigBokeh extends ComponentData {
    public static final String BOKEH_VALUE_OFF = "off";
    public static final String BOKEH_VALUE_ON = "on";

    public ComponentConfigBokeh(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    private static List<ComponentDataItem> createItems(int i, int i2) {
        ArrayList arrayList = new ArrayList();
        boolean z = true;
        if (i2 != 1 || !DataRepository.dataItemFeature().gD()) {
            z = false;
        }
        if (z) {
            arrayList.add(new ComponentDataItem(R.drawable.ic_portrait_button_normal, R.drawable.ic_portrait_button_normal, R.string.pref_camera_front_bokeh_entry_off, "off"));
            arrayList.add(new ComponentDataItem(R.drawable.ic_portrait_button_normal, R.drawable.ic_portrait_button_normal, R.string.pref_camera_front_bokeh_entry_on, "on"));
        }
        return arrayList;
    }

    @NonNull
    public String getDefaultValue(int i) {
        return "off";
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public List<ComponentDataItem> getItems() {
        return this.mItems;
    }

    public String getKey(int i) {
        return CameraSettings.KEY_CAMERA_BOKEH;
    }

    /* access modifiers changed from: 0000 */
    public void reInit(int i, int i2) {
        this.mItems = createItems(i, i2);
    }

    public void toggle(int i) {
        if ("on".equals(getComponentValue(i))) {
            setComponentValue(i, "off");
        } else {
            setComponentValue(i, "on");
        }
    }
}
