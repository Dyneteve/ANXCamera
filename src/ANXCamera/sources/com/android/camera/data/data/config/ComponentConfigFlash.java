package com.android.camera.data.data.config;

import android.annotation.TargetApi;
import android.text.TextUtils;
import android.util.SparseArray;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.ThermalDetector;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera2.CameraCapabilities;
import com.mi.config.b;
import java.util.ArrayList;
import java.util.List;

@TargetApi(21)
public class ComponentConfigFlash extends ComponentData {
    public static final String FLASH_VALUE_AUTO = "3";
    public static final String FLASH_VALUE_OFF = "0";
    public static final String FLASH_VALUE_ON = "1";
    public static final String FLASH_VALUE_SCREEN_LIGHT_AUTO = "103";
    public static final String FLASH_VALUE_SCREEN_LIGHT_ON = "101";
    public static final String FLASH_VALUE_TORCH = "2";
    private SparseArray<String> mFlashValuesForSceneMode;
    private boolean mIsClosed;
    private boolean mIsHardwareSupported;

    public ComponentConfigFlash(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
        this.mFlashValuesForSceneMode = new SparseArray<>();
        this.mItems = new ArrayList();
        this.mItems.add(new ComponentDataItem(getFlashOffRes(), getFlashOffRes(), R.string.pref_camera_flashmode_entry_off, "0"));
    }

    private String getComponentValueInternal(int i) {
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        if (dataItemRunning.isSwitchOn("pref_camera_scenemode_setting_key")) {
            String flashModeByScene = CameraSettings.getFlashModeByScene(dataItemRunning.getComponentRunningSceneValue().getComponentValue(i));
            if (!TextUtils.isEmpty(flashModeByScene)) {
                return flashModeByScene;
            }
        }
        return super.getComponentValue(i);
    }

    private int getFlashAutoRes() {
        return R.drawable.ic_new_config_flash_auto;
    }

    private int getFlashOffRes() {
        return R.drawable.ic_new_config_flash_off;
    }

    private int getFlashOnRes() {
        return R.drawable.ic_new_config_flash_on;
    }

    private int getFlashTorchRes() {
        return R.drawable.ic_new_config_flash_torch;
    }

    public void clearClosed() {
        this.mIsClosed = false;
    }

    public boolean disableUpdate() {
        return ThermalDetector.getInstance().thermalConstrained() && isHardwareSupported();
    }

    public String getComponentValue(int i) {
        return isClosed() ? "0" : isEmpty() ? "0" : getComponentValueInternal(i);
    }

    public String getDefaultValue(int i) {
        return "0";
    }

    public int getDisableReasonString() {
        return CameraSettings.isFrontCamera() ? R.string.close_front_flash_toast : R.string.close_back_flash_toast;
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_flashmode_title;
    }

    public List<ComponentDataItem> getItems() {
        return this.mItems;
    }

    public String getKey(int i) {
        if (!(i == 172 || i == 174)) {
            switch (i) {
                case 160:
                    throw new RuntimeException("unspecified flash");
                case 161:
                case 162:
                    break;
                default:
                    switch (i) {
                        case 168:
                        case 169:
                        case 170:
                            break;
                        default:
                            return CameraSettings.KEY_FLASH_MODE;
                    }
            }
        }
        return CameraSettings.KEY_VIDEOCAMERA_FLASH_MODE;
    }

    public int getValueSelectedDrawableIgnoreClose(int i) {
        String componentValue = getComponentValue(i);
        if ("1".equals(componentValue)) {
            return getFlashOnRes();
        }
        if ("3".equals(componentValue)) {
            return getFlashAutoRes();
        }
        if ("0".equals(componentValue)) {
            return getFlashOffRes();
        }
        if ("2".equals(componentValue)) {
            return CameraSettings.isFrontCamera() ? getFlashOnRes() : getFlashTorchRes();
        } else if (FLASH_VALUE_SCREEN_LIGHT_AUTO.equals(componentValue)) {
            return getFlashAutoRes();
        } else {
            if (FLASH_VALUE_SCREEN_LIGHT_ON.equals(componentValue)) {
                return getFlashOnRes();
            }
            return -1;
        }
    }

    public int getValueSelectedStringIdIgnoreClose(int i) {
        String componentValue = getComponentValue(i);
        boolean equals = "1".equals(componentValue);
        int i2 = R.string.accessibility_flash_on;
        if (equals) {
            return R.string.accessibility_flash_on;
        }
        if ("3".equals(componentValue)) {
            return R.string.accessibility_flash_auto;
        }
        if ("0".equals(componentValue)) {
            return R.string.accessibility_flash_off;
        }
        if ("2".equals(componentValue)) {
            if (!CameraSettings.isFrontCamera()) {
                i2 = R.string.accessibility_flash_torch;
            }
            return i2;
        } else if (FLASH_VALUE_SCREEN_LIGHT_AUTO.equals(componentValue)) {
            return R.string.accessibility_flash_auto;
        } else {
            if (FLASH_VALUE_SCREEN_LIGHT_ON.equals(componentValue)) {
                return R.string.accessibility_flash_on;
            }
            return -1;
        }
    }

    public boolean isClosed() {
        return this.mIsClosed;
    }

    public boolean isHardwareSupported() {
        return this.mIsHardwareSupported;
    }

    public boolean isValidFlashValue(String str) {
        return str.matches("^[0-9]+$");
    }

    public List<ComponentDataItem> reInit(int i, int i2, CameraCapabilities cameraCapabilities, ComponentConfigUltraWide componentConfigUltraWide) {
        if (this.mItems == null) {
            this.mItems = new ArrayList();
        } else {
            this.mItems.clear();
        }
        if ((i == 166 || i == 171 || i == 173) && i2 == 0) {
            return this.mItems;
        }
        this.mIsHardwareSupported = cameraCapabilities.isFlashSupported();
        if (!this.mIsHardwareSupported) {
            if (i2 == 1 && b.it()) {
                if (i == 163 || i == 165 || i == 171) {
                    this.mItems.add(new ComponentDataItem(getFlashOffRes(), getFlashOffRes(), R.string.pref_camera_flashmode_entry_off, "0"));
                    this.mItems.add(new ComponentDataItem(getFlashAutoRes(), getFlashAutoRes(), R.string.pref_camera_flashmode_entry_auto, FLASH_VALUE_SCREEN_LIGHT_AUTO));
                    this.mItems.add(new ComponentDataItem(getFlashOnRes(), getFlashOnRes(), R.string.pref_camera_flashmode_entry_on, FLASH_VALUE_SCREEN_LIGHT_ON));
                }
                if (i == 177) {
                    this.mItems.add(new ComponentDataItem(getFlashOffRes(), getFlashOffRes(), R.string.pref_camera_flashmode_entry_off, "0"));
                    this.mItems.add(new ComponentDataItem(getFlashOnRes(), getFlashOnRes(), R.string.pref_camera_flashmode_entry_on, FLASH_VALUE_SCREEN_LIGHT_ON));
                }
            }
            return this.mItems;
        }
        this.mItems.add(new ComponentDataItem(getFlashOffRes(), getFlashOffRes(), R.string.pref_camera_flashmode_entry_off, "0"));
        if (!(i == 172 || i == 174)) {
            if (i != 177) {
                switch (i) {
                    case 161:
                    case 162:
                        break;
                    default:
                        switch (i) {
                            case 168:
                            case 169:
                            case 170:
                                break;
                            default:
                                this.mItems.add(new ComponentDataItem(getFlashAutoRes(), getFlashAutoRes(), R.string.pref_camera_flashmode_entry_auto, "3"));
                                if (CameraSettings.isBackCamera()) {
                                    this.mItems.add(new ComponentDataItem(getFlashOnRes(), getFlashOnRes(), R.string.pref_camera_flashmode_entry_on, "1"));
                                }
                                if (!CameraSettings.isFrontCamera() || !b.in()) {
                                    if (b.hw()) {
                                        this.mItems.add(new ComponentDataItem(getFlashTorchRes(), getFlashTorchRes(), R.string.pref_camera_flashmode_entry_torch, "2"));
                                        break;
                                    }
                                } else {
                                    this.mItems.add(new ComponentDataItem(getFlashOnRes(), getFlashOnRes(), R.string.pref_camera_flashmode_entry_on, "2"));
                                    break;
                                }
                                break;
                        }
                }
            } else {
                if (CameraSettings.isBackCamera()) {
                    this.mItems.add(new ComponentDataItem(getFlashOnRes(), getFlashOnRes(), R.string.pref_camera_flashmode_entry_on, "1"));
                }
                if (CameraSettings.isFrontCamera() && b.in()) {
                    this.mItems.add(new ComponentDataItem(getFlashOnRes(), getFlashOnRes(), R.string.pref_camera_flashmode_entry_on, "2"));
                } else if (b.hw()) {
                    this.mItems.add(new ComponentDataItem(getFlashTorchRes(), getFlashTorchRes(), R.string.pref_camera_flashmode_entry_torch, "2"));
                }
            }
            return this.mItems;
        }
        this.mItems.add(new ComponentDataItem(getFlashTorchRes(), getFlashTorchRes(), R.string.pref_camera_flashmode_entry_torch, "2"));
        return this.mItems;
    }

    public void setClosed(boolean z) {
        this.mIsClosed = z;
    }

    public void setComponentValue(int i, String str) {
        setClosed(false);
        super.setComponentValue(i, str);
    }

    public void setSceneModeFlashValue(int i, String str) {
        this.mFlashValuesForSceneMode.put(i, str);
    }
}
