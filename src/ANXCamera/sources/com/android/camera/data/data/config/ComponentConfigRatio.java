package com.android.camera.data.data.config;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera2.CameraCapabilities;
import com.mi.config.b;
import java.util.ArrayList;
import java.util.List;

public class ComponentConfigRatio extends ComponentData {
    public static final String RATIO_16X9 = "16x9";
    public static final String RATIO_1X1 = "1x1";
    public static final String RATIO_4X3 = "4x3";
    public static final String RATIO_FULL_18X9 = "18x9";
    public static final String RATIO_FULL_195X9 = "19.5x9";
    @CameraRatio
    private String mDefaultValue = RATIO_4X3;
    private String mForceValue;
    private ArrayList<String> sEntryValues = new ArrayList<>();
    private boolean sSupport18x9;
    private boolean sSupport195x9;

    public @interface CameraRatio {
    }

    public ComponentConfigRatio(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    public String[] getCurrentlySupportRatioEntries() {
        List<ComponentDataItem> items = getItems();
        ArrayList arrayList = new ArrayList(items.size());
        for (ComponentDataItem componentDataItem : items) {
            arrayList.add(CameraSettings.getString(componentDataItem.mDisplayNameRes));
        }
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    public String[] getCurrentlySupportRatioValues() {
        List<ComponentDataItem> items = getItems();
        ArrayList arrayList = new ArrayList(items.size());
        for (ComponentDataItem componentDataItem : items) {
            arrayList.add(componentDataItem.mValue);
        }
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    @NonNull
    public String getDefaultValue(int i) {
        return this.mDefaultValue;
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public String[] getFullSupportRatioValues() {
        this.sEntryValues.clear();
        this.sEntryValues.add(RATIO_4X3);
        this.sEntryValues.add(RATIO_16X9);
        if (b.gR()) {
            this.sEntryValues.add(RATIO_FULL_18X9);
        }
        if (DataRepository.dataItemFeature().fo()) {
            this.sEntryValues.add(RATIO_FULL_195X9);
        }
        String[] strArr = new String[this.sEntryValues.size()];
        this.sEntryValues.toArray(strArr);
        return strArr;
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            reInit(DataRepository.dataItemGlobal().getCurrentMode(), DataRepository.dataItemGlobal().getCurrentCameraId(), null);
        }
        return this.mItems;
    }

    public String getKey(int i) {
        return "pref_camera_picturesize_key";
    }

    public int getMappingModeByRatio(int i, String str) {
        if (i != 163 && i != 165) {
            return i;
        }
        if (str == null) {
            str = getComponentValue(160);
        }
        char c = 65535;
        if (str.hashCode() == 50858 && str.equals(RATIO_1X1)) {
            c = 0;
        }
        return c != 0 ? 163 : 165;
    }

    public String getNextValue(int i) {
        String persistValue = getPersistValue(i);
        int size = this.mItems.size();
        for (int i2 = 0; i2 < size; i2++) {
            if (TextUtils.equals(((ComponentDataItem) this.mItems.get(i2)).mValue, persistValue)) {
                return ((ComponentDataItem) this.mItems.get((i2 + 1) % size)).mValue;
            }
        }
        return getDefaultValue(i);
    }

    public String getPictureSizeRatioString(int i) {
        return this.mForceValue != null ? this.mForceValue : getComponentValue(i);
    }

    public void initSensorRatio(List<CameraSize> list, int i, int i2) {
        if (b.qS || b.qZ) {
            this.mDefaultValue = RATIO_16X9;
            return;
        }
        CameraSize cameraSize = new CameraSize();
        int i3 = -1;
        int i4 = 0;
        for (int i5 = 0; i5 < list.size(); i5++) {
            cameraSize.parseSize((CameraSize) list.get(i5));
            if (i4 < cameraSize.area()) {
                i4 = cameraSize.area();
                i3 = i5;
            }
        }
        cameraSize.parseSize((CameraSize) list.get(i3));
        if (((double) Math.abs(cameraSize.getRatio() - 1.33f)) < 0.02d) {
            this.mDefaultValue = RATIO_4X3;
        } else {
            this.mDefaultValue = RATIO_16X9;
        }
        reInit(i, i2, null);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:41:0x011a, code lost:
        r6.mItems.add(new com.android.camera.data.data.ComponentDataItem(com.android.camera.R.drawable.ic_config_timer, com.android.camera.R.drawable.ic_config_timer, com.android.camera.R.string.pref_camera_picturesize_entry_4_3, RATIO_4X3));
        r6.mItems.add(new com.android.camera.data.data.ComponentDataItem(com.android.camera.R.drawable.ic_config_timer, com.android.camera.R.drawable.ic_config_timer, com.android.camera.R.string.pref_camera_picturesize_entry_16_9, RATIO_16X9));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:42:0x0134, code lost:
        if (r6.sSupport18x9 == false) goto L_0x0143;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:43:0x0136, code lost:
        r6.mItems.add(new com.android.camera.data.data.ComponentDataItem(com.android.camera.R.drawable.ic_config_timer, com.android.camera.R.drawable.ic_config_timer, com.android.camera.R.string.pref_camera_picturesize_entry_18_9, RATIO_FULL_18X9));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:45:0x0145, code lost:
        if (r6.sSupport195x9 == false) goto L_0x01a8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:46:0x0147, code lost:
        r6.mItems.add(new com.android.camera.data.data.ComponentDataItem(com.android.camera.R.drawable.ic_config_timer, com.android.camera.R.drawable.ic_config_timer, com.android.camera.R.string.pref_camera_picturesize_entry_195_9, RATIO_FULL_195X9));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:48:0x0158, code lost:
        if (r8 != 0) goto L_0x0165;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:50:0x015e, code lost:
        if (com.android.camera.CameraSettings.isUltraPixelOn() == false) goto L_0x016f;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:51:0x0160, code lost:
        r6.mForceValue = RATIO_4X3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x0169, code lost:
        if (com.android.camera.CameraSettings.isUltraPixelOn() == false) goto L_0x016f;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:54:0x016b, code lost:
        r6.mForceValue = RATIO_4X3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:55:0x016f, code lost:
        r6.mItems.add(new com.android.camera.data.data.ComponentDataItem(com.android.camera.R.drawable.ic_config_timer, com.android.camera.R.drawable.ic_config_timer, com.android.camera.R.string.pref_camera_picturesize_entry_4_3, RATIO_4X3));
        r6.mItems.add(new com.android.camera.data.data.ComponentDataItem(com.android.camera.R.drawable.ic_config_timer, com.android.camera.R.drawable.ic_config_timer, com.android.camera.R.string.pref_camera_picturesize_entry_16_9, RATIO_16X9));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:56:0x0189, code lost:
        if (r6.sSupport18x9 == false) goto L_0x0198;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:57:0x018b, code lost:
        r6.mItems.add(new com.android.camera.data.data.ComponentDataItem(com.android.camera.R.drawable.ic_config_timer, com.android.camera.R.drawable.ic_config_timer, com.android.camera.R.string.pref_camera_picturesize_entry_18_9, RATIO_FULL_18X9));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:59:0x019a, code lost:
        if (r6.sSupport195x9 == false) goto L_0x01a8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:60:0x019c, code lost:
        r6.mItems.add(new com.android.camera.data.data.ComponentDataItem(com.android.camera.R.drawable.ic_config_timer, com.android.camera.R.drawable.ic_config_timer, com.android.camera.R.string.pref_camera_picturesize_entry_195_9, RATIO_FULL_195X9));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:62:0x01aa, code lost:
        return r6.mItems;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public List<ComponentDataItem> reInit(int i, int i2, CameraCapabilities cameraCapabilities) {
        if (b.gR()) {
            this.sSupport18x9 = true;
        } else {
            this.sSupport18x9 = false;
        }
        if (DataRepository.dataItemFeature().fo()) {
            this.sSupport195x9 = true;
        } else {
            this.sSupport195x9 = false;
        }
        if (this.mItems == null) {
            this.mItems = new ArrayList();
        } else {
            this.mItems.clear();
        }
        this.mForceValue = null;
        switch (i) {
            case 163:
            case 173:
                break;
            case 165:
            case 175:
                this.mForceValue = RATIO_4X3;
                break;
            case 166:
                break;
            case 167:
                if (CameraSettings.isUltraPixelOn()) {
                    this.mForceValue = RATIO_4X3;
                }
                this.mItems.add(new ComponentDataItem(R.drawable.ic_config_timer, R.drawable.ic_config_timer, R.string.pref_camera_picturesize_entry_4_3, RATIO_4X3));
                this.mItems.add(new ComponentDataItem(R.drawable.ic_config_timer, R.drawable.ic_config_timer, R.string.pref_camera_picturesize_entry_16_9, RATIO_16X9));
                if (!this.sSupport18x9) {
                    if (this.sSupport195x9) {
                        this.mItems.add(new ComponentDataItem(R.drawable.ic_config_timer, R.drawable.ic_config_timer, R.string.pref_camera_picturesize_entry_195_9, RATIO_FULL_195X9));
                        break;
                    }
                } else {
                    this.mItems.add(new ComponentDataItem(R.drawable.ic_config_timer, R.drawable.ic_config_timer, R.string.pref_camera_picturesize_entry_18_9, RATIO_FULL_18X9));
                    break;
                }
                break;
            case 171:
                this.mItems.add(new ComponentDataItem(R.drawable.ic_config_timer, R.drawable.ic_config_timer, R.string.pref_camera_picturesize_entry_4_3, RATIO_4X3));
                this.mItems.add(new ComponentDataItem(R.drawable.ic_config_timer, R.drawable.ic_config_timer, R.string.pref_camera_picturesize_entry_16_9, RATIO_16X9));
                if (i2 != 0 || !DataRepository.dataItemFeature().fI()) {
                    if (!this.sSupport18x9) {
                        if (this.sSupport195x9) {
                            this.mItems.add(new ComponentDataItem(R.drawable.ic_config_timer, R.drawable.ic_config_timer, R.string.pref_camera_picturesize_entry_195_9, RATIO_FULL_195X9));
                            break;
                        }
                    } else {
                        this.mItems.add(new ComponentDataItem(R.drawable.ic_config_timer, R.drawable.ic_config_timer, R.string.pref_camera_picturesize_entry_18_9, RATIO_FULL_18X9));
                        break;
                    }
                } else {
                    this.mForceValue = RATIO_4X3;
                    break;
                }
                break;
            case 176:
                this.mForceValue = RATIO_4X3;
                break;
            case 177:
                this.mItems.add(new ComponentDataItem(R.drawable.ic_config_timer, R.drawable.ic_config_timer, R.string.pref_camera_picturesize_entry_4_3, RATIO_4X3));
                this.mItems.add(new ComponentDataItem(R.drawable.ic_config_timer, R.drawable.ic_config_timer, R.string.pref_camera_picturesize_entry_16_9, RATIO_16X9));
                if (!this.sSupport18x9) {
                    if (this.sSupport195x9) {
                        this.mItems.add(new ComponentDataItem(R.drawable.ic_config_timer, R.drawable.ic_config_timer, R.string.pref_camera_picturesize_entry_195_9, RATIO_FULL_195X9));
                        break;
                    }
                } else {
                    this.mItems.add(new ComponentDataItem(R.drawable.ic_config_timer, R.drawable.ic_config_timer, R.string.pref_camera_picturesize_entry_18_9, RATIO_FULL_18X9));
                    break;
                }
                break;
        }
    }
}
