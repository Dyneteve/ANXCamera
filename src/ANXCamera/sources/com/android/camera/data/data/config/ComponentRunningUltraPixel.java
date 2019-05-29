package com.android.camera.data.data.config;

import android.content.res.Resources;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import com.android.camera.CameraAppImpl;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.log.Log;
import com.android.camera2.CameraCapabilities;
import java.util.ArrayList;
import java.util.List;

public class ComponentRunningUltraPixel extends ComponentData {
    private static final String TAG = ComponentRunningUltraPixel.class.getSimpleName();
    public static final String ULTRA_PIXEL_OFF = "OFF";
    public static final String ULTRA_PIXEL_ON_FRONT_32M = "FRONT_32M";
    public static final String ULTRA_PIXEL_ON_REAR_48M = "REAR_48M";
    private String mCloseTipString = null;
    private boolean mIsClosed;
    @DrawableRes
    private int mMenuDrawable = -1;
    private String mMenuString = null;
    private String mOpenTipString = null;

    public @interface UltraPixelSupport {
    }

    public ComponentRunningUltraPixel(DataItemRunning dataItemRunning) {
        super(dataItemRunning);
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x002f  */
    /* JADX WARNING: Removed duplicated region for block: B:13:0x0046  */
    /* JADX WARNING: Removed duplicated region for block: B:14:0x0067  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void initUltraPixelResource(@UltraPixelSupport String str) {
        char c;
        Resources resources = CameraAppImpl.getAndroidContext().getResources();
        int hashCode = str.hashCode();
        if (hashCode == -1379357032) {
            if (str.equals(ULTRA_PIXEL_ON_FRONT_32M)) {
                c = 0;
                switch (c) {
                    case 0:
                        break;
                    case 1:
                        break;
                }
            }
        } else if (hashCode == -70723282 && str.equals(ULTRA_PIXEL_ON_REAR_48M)) {
            c = 1;
            switch (c) {
                case 0:
                    this.mMenuDrawable = R.drawable.ic_menu_ultra_pixel_photography_32mp;
                    this.mOpenTipString = resources.getString(R.string.ultra_pixel_photography_32mp_open_tip);
                    this.mCloseTipString = resources.getString(R.string.ultra_pixel_photography_32mp_close_tip);
                    this.mMenuString = resources.getString(R.string.pref_menu_ultra_pixel_photography_32mp);
                    return;
                case 1:
                    this.mMenuDrawable = R.drawable.ic_menu_ultra_pixel_photography_48mp;
                    this.mOpenTipString = resources.getString(R.string.ultra_pixel_photography_48mp_open_tip);
                    this.mCloseTipString = resources.getString(R.string.ultra_pixel_photography_48mp_close_tip);
                    this.mMenuString = resources.getString(R.string.pref_menu_ultra_pixel_photography_48mp);
                    return;
                default:
                    String str2 = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Unknown ultra pixel size: ");
                    sb.append(str);
                    Log.d(str2, sb.toString());
                    return;
            }
        }
        c = 65535;
        switch (c) {
            case 0:
                break;
            case 1:
                break;
        }
    }

    @UltraPixelSupport
    public String getCurrentSupportUltraPixel() {
        return ((ComponentDataItem) this.mItems.get(1)).mValue;
    }

    @NonNull
    public String getDefaultValue(int i) {
        return "OFF";
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public List<ComponentDataItem> getItems() {
        return this.mItems;
    }

    public String getKey(int i) {
        return "pref_ultra_pixel";
    }

    @DrawableRes
    public int getMenuDrawable() {
        return this.mMenuDrawable;
    }

    public String getMenuString() {
        return this.mMenuString;
    }

    public String getUltraPixelCloseTip() {
        return this.mCloseTipString;
    }

    public String getUltraPixelOpenTip() {
        return this.mOpenTipString;
    }

    public boolean isClosed() {
        return this.mIsClosed;
    }

    public boolean isFront32MPSwitchOn() {
        return ULTRA_PIXEL_ON_FRONT_32M.equals(getComponentValue(160));
    }

    public boolean isRear48MPSwitchOn() {
        return ULTRA_PIXEL_ON_REAR_48M.equals(getComponentValue(160));
    }

    public boolean isSwitchOn() {
        if (isClosed()) {
            return false;
        }
        return !"OFF".equals(getComponentValue(160));
    }

    public void reInit(int i, int i2, CameraCapabilities cameraCapabilities) {
        if (this.mItems == null) {
            this.mItems = new ArrayList();
        } else {
            this.mItems.clear();
        }
        if (cameraCapabilities != null) {
            if (i == 163 || i == 165) {
                if (i2 == 0 && !DataRepository.dataItemFeature().gA()) {
                    int gb = DataRepository.dataItemFeature().gb();
                    if (gb > 0 && gb == 48000000) {
                        this.mItems.add(new ComponentDataItem(R.drawable.ic_menu_ultra_pixel_photography_48mp, R.drawable.ic_menu_ultra_pixel_photography_48mp, R.string.pref_menu_ultra_pixel_photography_48mp, "OFF"));
                        this.mItems.add(new ComponentDataItem(R.drawable.ic_menu_ultra_pixel_photography_48mp, R.drawable.ic_menu_ultra_pixel_photography_48mp, R.string.pref_menu_ultra_pixel_photography_48mp, ULTRA_PIXEL_ON_REAR_48M));
                        initUltraPixelResource(ULTRA_PIXEL_ON_REAR_48M);
                    }
                } else if (i2 == 1) {
                    int gd = DataRepository.dataItemFeature().gd();
                    if (gd > 0 && cameraCapabilities.isUltraPixelPhotographySupported(gd) && gd == 32275200) {
                        this.mItems.add(new ComponentDataItem(R.drawable.ic_menu_ultra_pixel_photography_32mp, R.drawable.ic_menu_ultra_pixel_photography_32mp, R.string.pref_menu_ultra_pixel_photography_32mp, "OFF"));
                        this.mItems.add(new ComponentDataItem(R.drawable.ic_menu_ultra_pixel_photography_32mp, R.drawable.ic_menu_ultra_pixel_photography_32mp, R.string.pref_menu_ultra_pixel_photography_32mp, ULTRA_PIXEL_ON_FRONT_32M));
                        initUltraPixelResource(ULTRA_PIXEL_ON_FRONT_32M);
                    }
                }
            } else if (i != 167) {
                if (i == 175 && i2 == 0) {
                    int gb2 = DataRepository.dataItemFeature().gb();
                    if (gb2 > 0 && gb2 == 48000000) {
                        this.mItems.add(new ComponentDataItem(R.drawable.ic_menu_ultra_pixel_photography_48mp, R.drawable.ic_menu_ultra_pixel_photography_48mp, R.string.pref_menu_ultra_pixel_photography_48mp, "OFF"));
                        this.mItems.add(new ComponentDataItem(R.drawable.ic_menu_ultra_pixel_photography_48mp, R.drawable.ic_menu_ultra_pixel_photography_48mp, R.string.pref_menu_ultra_pixel_photography_48mp, ULTRA_PIXEL_ON_REAR_48M));
                        initUltraPixelResource(ULTRA_PIXEL_ON_REAR_48M);
                    }
                }
            } else if (i2 == 0) {
                int gb3 = DataRepository.dataItemFeature().gb();
                if (gb3 > 0 && cameraCapabilities.isUltraPixelPhotographySupported(gb3)) {
                    this.mItems.add(new ComponentDataItem(R.drawable.ic_ultra_pixel_photography_48mp, R.drawable.ic_ultra_pixel_photography_48mp_highlight, R.string.pref_menu_ultra_pixel_photography_48mp, "OFF"));
                    this.mItems.add(new ComponentDataItem(R.drawable.ic_ultra_pixel_photography_48mp, R.drawable.ic_ultra_pixel_photography_48mp_highlight, R.string.pref_menu_ultra_pixel_photography_48mp, ULTRA_PIXEL_ON_REAR_48M));
                    initUltraPixelResource(ULTRA_PIXEL_ON_REAR_48M);
                }
            }
        }
    }

    public void setClosed(boolean z) {
        this.mIsClosed = z;
    }

    public void switchOff() {
        setComponentValue(160, "OFF");
    }

    public void switchOn(@UltraPixelSupport String str) {
        setClosed(false);
        setComponentValue(160, str);
    }

    public void switchOnCurrentSupported(int i, int i2, CameraCapabilities cameraCapabilities) {
        if (isEmpty()) {
            reInit(i, i2, cameraCapabilities);
        }
        if (isEmpty()) {
            Log.e("UltraPixel:", "CameraCapabilities not supported");
        } else {
            setComponentValue(160, getCurrentSupportUltraPixel());
        }
    }
}
