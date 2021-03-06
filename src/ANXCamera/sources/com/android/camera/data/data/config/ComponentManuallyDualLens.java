package com.android.camera.data.data.config;

import android.text.TextUtils;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.log.Log;
import java.util.ArrayList;
import java.util.List;

public class ComponentManuallyDualLens extends ComponentData {
    public static final String LENS_MACRO = "macro";
    public static final String LENS_TELE = "tele";
    public static final String LENS_ULTRA = "ultra";
    public static final String LENS_WIDE = "wide";
    private static final String TAG = "DualLens";

    public ComponentManuallyDualLens(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    private int indexOf(String str) {
        List items = getItems();
        if (items == null || TextUtils.isEmpty(str)) {
            return -1;
        }
        for (int i = 0; i < items.size(); i++) {
            if (TextUtils.equals(((ComponentDataItem) items.get(i)).mValue, str)) {
                return i;
            }
        }
        return -1;
    }

    private List<ComponentDataItem> initItems() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new ComponentDataItem(-1, -1, R.string.pref_camera_zoom_mode_entry_wide, LENS_WIDE));
        if (CameraSettings.isSupportedOpticalZoom()) {
            arrayList.add(new ComponentDataItem(-1, -1, R.string.pref_camera_zoom_mode_entry_tele, LENS_TELE));
        }
        if (DataRepository.dataItemFeature().isSupportUltraWide()) {
            arrayList.add(new ComponentDataItem(-1, -1, R.string.pref_camera_zoom_mode_entry_ultra, LENS_ULTRA));
        }
        if (DataRepository.dataItemFeature().hu() && DataRepository.dataItemFeature().hy()) {
            arrayList.add(new ComponentDataItem(-1, -1, R.string.pref_camera_zoom_mode_entry_macro, "macro"));
        }
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public boolean checkValueValid(String str) {
        for (ComponentDataItem componentDataItem : getItems()) {
            if (TextUtils.equals(str, componentDataItem.mValue)) {
                return true;
            }
        }
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("checkValueValid: invalid value: ");
        sb.append(str);
        Log.d(str2, sb.toString());
        return false;
    }

    public String getDefaultValue(int i) {
        return LENS_WIDE;
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_zoom_mode_title;
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            this.mItems = initItems();
        }
        return this.mItems;
    }

    public String getKey(int i) {
        return i != 167 ? CameraSettings.KEY_CAMERA_ZOOM_MODE : CameraSettings.KEY_CAMERA_MANUALLY_LENS;
    }

    public String next(String str, int i) {
        int indexOf = indexOf(str);
        List items = getItems();
        if (items == null) {
            return LENS_WIDE;
        }
        return ((ComponentDataItem) items.get(indexOf == items.size() + -1 ? 0 : indexOf + 1)).mValue;
    }

    /* access modifiers changed from: protected */
    public void resetComponentValue(int i) {
        this.mItems = initItems();
        setComponentValue(i, getDefaultValue(i));
    }

    public void resetLensType(ComponentConfigUltraWide componentConfigUltraWide, ProviderEditor providerEditor) {
        String componentValue = getComponentValue(167);
        if (!LENS_WIDE.equals(componentValue)) {
            providerEditor.putString(getKey(167), LENS_WIDE);
            if (LENS_ULTRA.equals(componentValue)) {
                providerEditor.putString(componentConfigUltraWide.getKey(167), "OFF");
            }
        }
    }
}
