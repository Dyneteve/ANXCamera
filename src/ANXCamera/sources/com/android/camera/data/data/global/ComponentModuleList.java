package com.android.camera.data.data.global;

import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.mi.config.a;
import java.util.ArrayList;
import java.util.List;

public class ComponentModuleList extends ComponentData {
    private int mIntentType;

    public ComponentModuleList(DataItemGlobal dataItemGlobal) {
        super(dataItemGlobal);
    }

    public static final int getTransferredMode(int i) {
        if (i == 165) {
            return 163;
        }
        if (i == 176) {
            return 166;
        }
        switch (i) {
            case 168:
            case 169:
            case 170:
                return 162;
            default:
                return i;
        }
    }

    private List<ComponentDataItem> initItems() {
        if (this.mIntentType != -1) {
            ArrayList arrayList = new ArrayList();
            a dataItemFeature = DataRepository.dataItemFeature();
            if (this.mIntentType == 0 && dataItemFeature.gh()) {
                arrayList.add(new ComponentDataItem(-1, -1, R.string.module_name_new_slow_motion, String.valueOf(172)));
            }
            if (!dataItemFeature.gt() && this.mIntentType == 0) {
                arrayList.add(new ComponentDataItem(-1, -1, R.string.module_name_fun, String.valueOf(161)));
            }
            if (dataItemFeature.gt() && this.mIntentType == 0) {
                arrayList.add(new ComponentDataItem(-1, -1, R.string.module_name_fun, String.valueOf(174)));
            }
            if (this.mIntentType == 2 || this.mIntentType == 0) {
                arrayList.add(new ComponentDataItem(-1, -1, R.string.module_name_video, String.valueOf(162)));
            }
            if (this.mIntentType == 3) {
                arrayList.add(new ComponentDataItem(-1, -1, R.string.module_name_capture, String.valueOf(163)));
            } else if (this.mIntentType == 1 || this.mIntentType == 0) {
                arrayList.add(new ComponentDataItem(-1, -1, R.string.module_name_capture, String.valueOf(163)));
                if (this.mIntentType == 0 && dataItemFeature.hh()) {
                    arrayList.add(new ComponentDataItem(-1, -1, R.string.module_name_pixel, String.valueOf(175)));
                }
                if (dataItemFeature.hi()) {
                    arrayList.add(new ComponentDataItem(-1, -1, R.string.module_name_portrait, String.valueOf(171)));
                }
                if (DataRepository.dataItemFeature().gu() && this.mIntentType == 0) {
                    arrayList.add(new ComponentDataItem(-1, -1, R.string.module_name_fun_ar, String.valueOf(177)));
                }
                if ((dataItemFeature.fV() || dataItemFeature.hx()) && this.mIntentType == 0) {
                    arrayList.add(new ComponentDataItem(-1, -1, R.string.pref_camera_scenemode_entry_night, String.valueOf(173)));
                }
                if (dataItemFeature.gN() && this.mIntentType == 0) {
                    arrayList.add(new ComponentDataItem(-1, -1, R.string.module_name_panorama, String.valueOf(166)));
                }
                arrayList.add(new ComponentDataItem(-1, -1, R.string.module_name_professional, String.valueOf(167)));
            }
            return arrayList;
        }
        throw new RuntimeException("parse intent first!");
    }

    public String getDefaultValue(int i) {
        return null;
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            this.mItems = initItems();
        }
        return this.mItems;
    }

    public String getKey(int i) {
        StringBuilder sb = new StringBuilder();
        sb.append(DataItemGlobal.DATA_COMMON_CURRENT_MODE);
        sb.append(this.mIntentType);
        return sb.toString();
    }

    public int getMode(int i) {
        return Integer.valueOf(((ComponentDataItem) this.mItems.get(i)).mValue).intValue();
    }

    public boolean needShowLiveRedDot() {
        return !CameraSettings.isLiveModuleClicked();
    }

    public void reInit() {
    }

    public void setIntentType(int i) {
        this.mIntentType = i;
        if (this.mItems != null) {
            this.mItems.clear();
        }
        this.mItems = initItems();
    }
}
