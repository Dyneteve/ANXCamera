package com.android.camera.data.data.runing;

import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import com.android.camera.CameraSettings;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.effect.FilterInfo;
import com.android.camera.fragment.beauty.BeautyValues;
import com.android.camera2.CameraCapabilities;
import com.mi.config.b;
import com.oneplus.camera.R;
import java.util.ArrayList;
import java.util.List;

public class ComponentRunningShine extends ComponentData {
    public static final int ENTRY_NONE = -1;
    public static final int ENTRY_POPUP_BEAUTY = 5;
    public static final int ENTRY_POPUP_SHINE = 4;
    public static final int ENTRY_TOP_BEAUTY = 2;
    public static final int ENTRY_TOP_FILTER = 3;
    public static final int ENTRY_TOP_SHINE = 1;
    public static final String SHINE_BEAUTY_LEVEL_SMOOTH = "2";
    public static final String SHINE_BEAUTY_LEVEL_SWITCH = "1";
    public static final String SHINE_EYE_LIGHT = "9";
    public static final String SHINE_FIGURE = "6";
    public static final String SHINE_FILTER = "7";
    public static final String SHINE_LIGHTING = "8";
    public static final String SHINE_LIVE_BEAUTY = "11";
    public static final String SHINE_LIVE_FILTER = "10";
    public static final String SHINE_LIVE_SPEED = "13";
    public static final String SHINE_LIVE_STICKER = "12";
    public static final String SHINE_MAKEUP = "5";
    public static final String SHINE_MODEL_ADVANCE = "3";
    public static final String SHINE_MODEL_REMODELING = "4";
    private BeautyValues mBeautyValues;
    private int mBeautyVersion;
    private boolean mCurrentStatus;
    @ShineType
    private String mCurrentType;
    @ShineType
    private String mDefaultType;
    private boolean mIsClosed;
    @ShineEntry
    private int mShineEntry;
    private boolean mSupportBeautyBody;
    private boolean mSupportBeautyLevel;
    private boolean mSupportBeautyMakeUp;
    private boolean mSupportBeautyModel;
    private boolean mSupportSmoothLevel;
    private TypeElementsBeauty mTypeElementsBeauty = new TypeElementsBeauty(this);

    public @interface ShineEntry {
    }

    public @interface ShineType {
    }

    public ComponentRunningShine(DataItemRunning dataItemRunning) {
        super(dataItemRunning);
    }

    private ComponentDataItem generateBeautyLevelItem(boolean z) {
        return b.iw() ? new ComponentDataItem(R.drawable.ic_beauty_off, R.drawable.ic_beauty_on, R.string.beauty_fragment_tab_name_3d_beauty, "1") : new ComponentDataItem(R.drawable.ic_beauty_off, R.drawable.ic_beauty_on, R.string.beauty_fragment_tab_name_beauty, "1");
    }

    private ComponentDataItem generateFigureItem() {
        return new ComponentDataItem(R.drawable.ic_beauty_off, R.drawable.ic_beauty_on, isSmoothDependBeautyVersion() ? R.string.beauty_fragment_tab_name_3d_beauty : R.string.beauty_body, "6");
    }

    private ComponentDataItem generateFilterItem() {
        return new ComponentDataItem(R.drawable.ic_new_effect_button_normal, R.drawable.ic_new_effect_button_selected, R.string.pref_camera_coloreffect_title, "7");
    }

    private ComponentDataItem generateMakeupItem() {
        return new ComponentDataItem(R.drawable.ic_beauty_off, R.drawable.ic_beauty_on, R.string.beauty_fragment_tab_name_3d_makeup, "5");
    }

    private ComponentDataItem generateModelItem() {
        if (!b.iw()) {
            return new ComponentDataItem(R.drawable.ic_beauty_off, R.drawable.ic_beauty_on, R.string.beauty_fragment_tab_name_makeup, "3");
        }
        return new ComponentDataItem(R.drawable.ic_beauty_off, R.drawable.ic_beauty_on, isSmoothDependBeautyVersion() ? R.string.beauty_fragment_tab_name_3d_beauty : R.string.beauty_fragment_tab_name_3d_remodeling, "4");
    }

    private ComponentDataItem generateSmoothLevelItem(boolean z) {
        return new ComponentDataItem(R.drawable.ic_beauty_off, R.drawable.ic_beauty_on, R.string.beauty_fragment_tab_name_3d_beauty, "2");
    }

    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean determineStatus(int i) {
        char c;
        if (this.mBeautyValues == null) {
            this.mBeautyValues = new BeautyValues();
        }
        boolean z = false;
        if (isClosed()) {
            this.mCurrentStatus = false;
        } else {
            Boolean bool = null;
            Boolean bool2 = null;
            for (ComponentDataItem componentDataItem : this.mItems) {
                String str = componentDataItem.mValue;
                int hashCode = str.hashCode();
                switch (hashCode) {
                    case 49:
                        if (str.equals("1")) {
                            c = 0;
                            break;
                        }
                    case 50:
                        if (str.equals("2")) {
                            c = 5;
                            break;
                        }
                    case 51:
                        if (str.equals("3")) {
                            c = 1;
                            break;
                        }
                    case 52:
                        if (str.equals("4")) {
                            c = 2;
                            break;
                        }
                    case 53:
                        if (str.equals("5")) {
                            c = 3;
                            break;
                        }
                    case 54:
                        if (str.equals("6")) {
                            c = 4;
                            break;
                        }
                    case 55:
                        if (str.equals("7")) {
                            c = 7;
                            break;
                        }
                    default:
                        switch (hashCode) {
                            case 1567:
                                if (str.equals("10")) {
                                    c = 8;
                                    break;
                                }
                            case 1568:
                                if (str.equals(SHINE_LIVE_BEAUTY)) {
                                    c = 6;
                                    break;
                                }
                        }
                        c = 65535;
                        break;
                }
                switch (c) {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                        if (bool != null) {
                            break;
                        } else {
                            bool = Boolean.valueOf(CameraSettings.isFaceBeautyOn(i, this.mBeautyValues));
                            break;
                        }
                    case 5:
                        if (bool != null) {
                            break;
                        } else {
                            bool = Boolean.valueOf(CameraSettings.isFaceBeautyOn(i, this.mBeautyValues));
                            break;
                        }
                    case 6:
                        if (bool != null) {
                            break;
                        } else {
                            bool = Boolean.valueOf(CameraSettings.isLiveBeautyOpen());
                            break;
                        }
                    case 7:
                        if (bool2 != null) {
                            break;
                        } else {
                            int parseInt = Integer.parseInt(DataRepository.dataItemRunning().getComponentConfigFilter().getComponentValue(i));
                            if (parseInt != FilterInfo.FILTER_ID_NONE && parseInt > 0) {
                                bool2 = Boolean.valueOf(true);
                                break;
                            }
                        }
                    case 8:
                        if (bool2 == null && DataRepository.dataItemLive().getLiveFilter() != 0) {
                            bool2 = Boolean.valueOf(true);
                            break;
                        }
                }
            }
            if ((bool != null && bool.booleanValue()) || (bool2 != null && bool2.booleanValue())) {
                z = true;
            }
            this.mCurrentStatus = z;
        }
        return this.mCurrentStatus;
    }

    public int getBeautyVersion() {
        return this.mBeautyVersion;
    }

    @DrawableRes
    public int getBottomEntryRes(int i) {
        this.mCurrentStatus = determineStatus(i);
        switch (this.mShineEntry) {
            case 4:
                return this.mCurrentStatus ? R.drawable.ic_beauty_tips_on : R.drawable.ic_beauty_tips_normal;
            case 5:
                return this.mCurrentStatus ? R.drawable.ic_beauty_on : R.drawable.ic_beauty_off;
            default:
                return R.drawable.ic_shine_off;
        }
    }

    public boolean getCurrentStatus() {
        return this.mCurrentStatus;
    }

    @ShineType
    public String getCurrentType() {
        return this.mCurrentType;
    }

    @NonNull
    public String getDefaultValue(int i) {
        return this.mDefaultType;
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public List<ComponentDataItem> getItems() {
        return this.mItems;
    }

    public String getKey(int i) {
        return null;
    }

    @DrawableRes
    public int getTopConfigEntryRes(int i) {
        this.mCurrentStatus = determineStatus(i);
        int i2 = this.mShineEntry;
        int i3 = R.drawable.ic_shine_off;
        switch (i2) {
            case 1:
                if (this.mCurrentStatus) {
                    i3 = R.drawable.ic_shine_on;
                }
                return i3;
            case 2:
                return this.mCurrentStatus ? R.drawable.ic_beauty_on : R.drawable.ic_beauty_off;
            case 3:
                return this.mCurrentStatus ? R.drawable.ic_new_effect_button_selected : R.drawable.ic_new_effect_button_normal;
            default:
                return R.drawable.ic_shine_off;
        }
    }

    public int getTopConfigItem() {
        switch (this.mShineEntry) {
            case 1:
            case 2:
            case 3:
                return 212;
            default:
                throw new RuntimeException("unknown Shine");
        }
    }

    public TypeElementsBeauty getTypeElementsBeauty() {
        return this.mTypeElementsBeauty;
    }

    public boolean isClosed() {
        return this.mIsClosed;
    }

    public boolean isLegacyBeautyVersion() {
        return this.mBeautyVersion == 1;
    }

    public boolean isSmoothDependBeautyVersion() {
        return this.mBeautyVersion == 3;
    }

    public void reInit(int i, int i2, CameraCapabilities cameraCapabilities) {
        boolean z;
        boolean z2;
        boolean z3;
        boolean z4;
        boolean z5;
        boolean z6;
        boolean z7;
        if (this.mItems == null) {
            this.mItems = new ArrayList();
        } else {
            this.mItems.clear();
        }
        this.mBeautyVersion = cameraCapabilities.getBeautyVersion();
        boolean z8 = true;
        if (this.mBeautyVersion < 0) {
            if (b.iw()) {
                this.mBeautyVersion = 2;
            } else {
                this.mBeautyVersion = 1;
            }
        }
        this.mShineEntry = -1;
        this.mDefaultType = null;
        this.mSupportBeautyLevel = false;
        this.mSupportSmoothLevel = false;
        this.mSupportBeautyModel = false;
        this.mSupportBeautyMakeUp = false;
        this.mSupportBeautyBody = false;
        switch (i) {
            case 161:
                if (!cameraCapabilities.isSupportVideoBeauty()) {
                    this.mShineEntry = 3;
                    this.mItems.add(generateFilterItem());
                    break;
                } else {
                    this.mShineEntry = 4;
                    if (i2 == 0) {
                        this.mDefaultType = "7";
                        if (!isSmoothDependBeautyVersion()) {
                            this.mSupportBeautyLevel = true;
                            this.mItems.add(generateBeautyLevelItem(i2 == 1));
                            if (DataRepository.dataItemFeature().isSupportShortVideoBeautyBody()) {
                                this.mSupportBeautyBody = true;
                                this.mItems.add(generateFigureItem());
                            }
                        } else {
                            this.mSupportSmoothLevel = true;
                            if (DataRepository.dataItemFeature().isSupportShortVideoBeautyBody()) {
                                this.mSupportBeautyBody = true;
                                this.mItems.add(generateFigureItem());
                            } else {
                                List list = this.mItems;
                                if (i2 != 1) {
                                    z3 = false;
                                }
                                list.add(generateSmoothLevelItem(z3));
                            }
                        }
                    } else if (!isSmoothDependBeautyVersion()) {
                        this.mSupportBeautyLevel = true;
                        List list2 = this.mItems;
                        if (i2 != 1) {
                            z2 = false;
                        }
                        list2.add(generateBeautyLevelItem(z2));
                    } else {
                        this.mSupportSmoothLevel = true;
                        List list3 = this.mItems;
                        if (i2 != 1) {
                            z = false;
                        }
                        list3.add(generateSmoothLevelItem(z));
                    }
                    this.mItems.add(generateFilterItem());
                    break;
                }
            case 162:
            case 169:
                if (cameraCapabilities.isSupportVideoBeauty()) {
                    this.mShineEntry = 2;
                    if (isSmoothDependBeautyVersion()) {
                        this.mSupportSmoothLevel = true;
                        List list4 = this.mItems;
                        if (i2 != 1) {
                            z4 = false;
                        }
                        list4.add(generateSmoothLevelItem(z4));
                        break;
                    } else {
                        this.mSupportBeautyLevel = true;
                        List list5 = this.mItems;
                        if (i2 != 1) {
                            z5 = false;
                        }
                        list5.add(generateBeautyLevelItem(z5));
                        break;
                    }
                }
                break;
            case 163:
            case 165:
                if (!CameraSettings.isUltraPixelRear48MPOn()) {
                    if (!isSmoothDependBeautyVersion()) {
                        this.mSupportBeautyLevel = true;
                        this.mItems.add(generateBeautyLevelItem(i2 == 1));
                    } else {
                        this.mSupportSmoothLevel = true;
                    }
                    if (i2 == 0) {
                        this.mShineEntry = 1;
                        this.mDefaultType = "7";
                        if (DataRepository.dataItemFeature().isSupportBeautyBody()) {
                            this.mSupportBeautyBody = true;
                            this.mItems.add(generateFigureItem());
                        }
                    } else {
                        this.mShineEntry = 4;
                        if (!DataRepository.dataItemFeature().gE()) {
                            this.mSupportBeautyModel = true;
                            this.mItems.add(generateModelItem());
                            if (DataRepository.dataItemFeature().fw() && cameraCapabilities.isSupportBeautyMakeup()) {
                                this.mSupportBeautyMakeUp = true;
                                this.mItems.add(generateMakeupItem());
                            }
                        }
                    }
                } else if (i2 == 0) {
                    this.mShineEntry = 3;
                } else {
                    this.mShineEntry = 4;
                }
                this.mItems.add(generateFilterItem());
                break;
            case 167:
            case 175:
                this.mShineEntry = 3;
                this.mItems.add(generateFilterItem());
                break;
            case 171:
                this.mShineEntry = 4;
                if (!isSmoothDependBeautyVersion()) {
                    this.mSupportBeautyLevel = true;
                    List list6 = this.mItems;
                    if (i2 != 1) {
                        z7 = false;
                    }
                    list6.add(generateBeautyLevelItem(z7));
                } else {
                    this.mSupportSmoothLevel = true;
                    List list7 = this.mItems;
                    if (i2 != 1) {
                        z6 = false;
                    }
                    list7.add(generateSmoothLevelItem(z6));
                }
                this.mItems.add(generateFilterItem());
                break;
            case 174:
                this.mShineEntry = 4;
                this.mItems.add(new ComponentDataItem(R.drawable.ic_new_effect_button_normal, R.drawable.ic_new_effect_button_selected, R.string.pref_camera_coloreffect_title, "10"));
                this.mItems.add(new ComponentDataItem(R.drawable.ic_beauty_off, R.drawable.ic_beauty_on, R.string.beauty_fragment_tab_name_3d_beauty, SHINE_LIVE_BEAUTY));
                break;
            case 176:
                this.mShineEntry = 4;
                if (isSmoothDependBeautyVersion()) {
                    this.mSupportSmoothLevel = true;
                    List list8 = this.mItems;
                    if (i2 != 1) {
                        z8 = false;
                    }
                    list8.add(generateSmoothLevelItem(z8));
                    break;
                } else {
                    this.mSupportBeautyLevel = true;
                    List list9 = this.mItems;
                    if (i2 != 1) {
                        z8 = false;
                    }
                    list9.add(generateBeautyLevelItem(z8));
                    break;
                }
        }
        if (this.mDefaultType == null && !this.mItems.isEmpty()) {
            this.mDefaultType = ((ComponentDataItem) this.mItems.get(0)).mValue;
        }
        this.mCurrentType = this.mDefaultType;
    }

    public void reInit(@ShineType String str) {
        if (this.mItems == null) {
            this.mItems = new ArrayList();
        } else {
            this.mItems.clear();
        }
    }

    public void setClosed(boolean z) {
        this.mIsClosed = z;
    }

    public void setCurrentType(@ShineType String str) {
        this.mCurrentType = str;
    }

    public boolean supportBeautyBody() {
        return this.mSupportBeautyBody;
    }

    public boolean supportBeautyLevel() {
        return this.mSupportBeautyLevel;
    }

    public boolean supportBeautyMakeUp() {
        return this.mSupportBeautyMakeUp;
    }

    public boolean supportBeautyModel() {
        return this.mSupportBeautyModel;
    }

    public boolean supportPopUpEntry() {
        switch (this.mShineEntry) {
            case 4:
            case 5:
                return true;
            default:
                return false;
        }
    }

    public boolean supportSmoothLevel() {
        return this.mSupportSmoothLevel;
    }

    public boolean supportTopConfigEntry() {
        switch (this.mShineEntry) {
            case 1:
            case 2:
            case 3:
                return true;
            default:
                return false;
        }
    }
}
