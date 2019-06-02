package com.android.camera.data.data.runing;

import com.android.camera.CameraSettings;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.DataItemBase;
import com.android.camera.data.data.config.ComponentConfigFilter;
import com.android.camera.data.data.config.ComponentRunningMacroMode;
import com.android.camera.data.data.config.ComponentRunningUltraPixel;
import com.android.camera.log.Log;
import com.android.camera2.CameraCapabilities;
import com.mi.config.b;

public class DataItemRunning extends DataItemBase {
    public static final String DATA_RUNING_HAND_GESTURE = "pref_hand_gesture";
    public static final String DATA_RUNING_HAND_GESTURE_STATUS = "pref_hand_gesture_status";
    public static final String DATA_RUNNING_AUTO_ZOOM = "pref_camera_auto_zoom";
    public static final String DATA_RUNNING_EYE_LIGHT_TYPE = "pref_eye_light_type_key";
    public static final String DATA_RUNNING_FILTER_INDEX = "pref_camera_shader_coloreffect_key";
    public static final String DATA_RUNNING_FOCUS_PEAK = "pref_camera_peak_key";
    public static final String DATA_RUNNING_GENDER_AGE = "pref_camera_show_gender_age_key";
    public static final String DATA_RUNNING_GRADIENTER = "pref_camera_gradienter_key";
    public static final String DATA_RUNNING_GROUP_SELFIES = "pref_camera_groupshot_mode_key";
    public static final String DATA_RUNNING_HHT = "pref_camera_hand_night_key";
    public static final String DATA_RUNNING_LIVE_CONFIG_IS_NEED_RESTORE = "pref_live_config_is_need_restore";
    public static final String DATA_RUNNING_LIVE_MUSIC_FIRST_REQUEST_TIME = "pref_key_live_music_first_request_time";
    public static final String DATA_RUNNING_LIVE_SHOT = "pref_live_shot_enabled";
    public static final String DATA_RUNNING_MAGIC_FOCUS = "pref_camera_ubifocus_key";
    public static final String DATA_RUNNING_MAGIC_MIRROR = "pref_camera_magic_mirror_key";
    public static final String DATA_RUNNING_MANUALLY = "pref_camera_manual_mode_key";
    public static final String DATA_RUNNING_PANORAMA_MOVE_DIRECTION = "pref_panorana_move_direction_key";
    public static final String DATA_RUNNING_PORTRAIT_LIGHTING = "pref_portrait_lighting";
    public static final String DATA_RUNNING_PORTRAIT_MODE = "pref_camera_portrait_mode_key";
    public static final String DATA_RUNNING_SCENE = "pref_camera_scenemode_setting_key";
    public static final String DATA_RUNNING_SCENE_VALUE = "pref_camera_scenemode_key";
    public static final String DATA_RUNNING_SQUARE_MODE = "pref_camera_square_mode_key";
    public static final String DATA_RUNNING_STEREO_MODE = "pref_camera_stereo_mode_key";
    public static final String DATA_RUNNING_SUPER_RESOLUTION = "pref_camera_super_resolution_key";
    public static final String DATA_RUNNING_TILT = "pref_camera_tilt_shift_mode";
    public static final String DATA_RUNNING_TILT_VALUE = "pref_camera_tilt_shift_key";
    public static final String DATA_RUNNING_TIMER = "pref_delay_capture_mode";
    public static final String DATA_RUNNING_ULTRA_PIXEL = "pref_ultra_pixel";
    public static final String DATA_RUNNING_ULTRA_WIDE_BOKEH = "pref_ultra_wide_bokeh_enabled";
    public static final String DATA_RUNNING_VIDEO_FAST = "pref_video_speed_fast_key";
    public static final String DATA_RUNNING_VIDEO_HFR = "pref_video_speed_hfr_key";
    public static final String DATA_RUNNING_VIDEO_SLOW = "pref_video_speed_slow_key";
    private static final String KEY = "camera_running";
    private ComponentRunningTiltValue componentRunningTiltValue;
    private ComponentConfigFilter mComponentConfigFilter;
    private ComponentRunningAutoZoom mComponentRunningAutoZoom;
    private ComponentRunningLighting mComponentRunningLighting;
    private ComponentRunningLiveShot mComponentRunningLiveShot;
    private ComponentRunningMacroMode mComponentRunningMacroMode;
    private ComponentRunningSceneValue mComponentRunningSceneValue;
    private ComponentRunningShine mComponentRunningShine = new ComponentRunningShine(this);
    private ComponentRunningTimer mComponentRunningTimer;
    private ComponentRunningUltraPixel mComponentUltraPixel = new ComponentRunningUltraPixel(this);
    private int mLastUiStyle;
    private int[] mRecordingClosedElements;
    private boolean mSupportHandGesture;
    private boolean mSupportMacroMode;
    private int mUiStyle;

    public ComponentConfigFilter getComponentConfigFilter() {
        if (this.mComponentConfigFilter == null) {
            this.mComponentConfigFilter = new ComponentConfigFilter(this);
        }
        return this.mComponentConfigFilter;
    }

    public ComponentRunningAutoZoom getComponentRunningAutoZoom() {
        if (this.mComponentRunningAutoZoom == null) {
            this.mComponentRunningAutoZoom = new ComponentRunningAutoZoom(this);
        }
        return this.mComponentRunningAutoZoom;
    }

    public ComponentRunningLighting getComponentRunningLighting() {
        if (this.mComponentRunningLighting == null) {
            this.mComponentRunningLighting = new ComponentRunningLighting(this);
        }
        return this.mComponentRunningLighting;
    }

    public ComponentRunningLiveShot getComponentRunningLiveShot() {
        if (this.mComponentRunningLiveShot == null) {
            this.mComponentRunningLiveShot = new ComponentRunningLiveShot(this);
        }
        return this.mComponentRunningLiveShot;
    }

    public ComponentRunningMacroMode getComponentRunningMacroMode() {
        if (this.mComponentRunningMacroMode == null) {
            this.mComponentRunningMacroMode = new ComponentRunningMacroMode(this);
        }
        return this.mComponentRunningMacroMode;
    }

    public ComponentRunningSceneValue getComponentRunningSceneValue() {
        if (this.mComponentRunningSceneValue == null) {
            this.mComponentRunningSceneValue = new ComponentRunningSceneValue(this);
        }
        return this.mComponentRunningSceneValue;
    }

    public ComponentRunningShine getComponentRunningShine() {
        return this.mComponentRunningShine;
    }

    public ComponentRunningTiltValue getComponentRunningTiltValue() {
        if (this.componentRunningTiltValue == null) {
            this.componentRunningTiltValue = new ComponentRunningTiltValue(this);
        }
        return this.componentRunningTiltValue;
    }

    public ComponentRunningTimer getComponentRunningTimer() {
        if (this.mComponentRunningTimer == null) {
            this.mComponentRunningTimer = new ComponentRunningTimer(this);
        }
        return this.mComponentRunningTimer;
    }

    public ComponentRunningUltraPixel getComponentUltraPixel() {
        return this.mComponentUltraPixel;
    }

    public boolean getHandGestureRunning() {
        return getBoolean("pref_hand_gesture_status", false);
    }

    public int getLastUiStyle() {
        return this.mLastUiStyle;
    }

    public boolean getLiveConfigIsNeedRestore() {
        return getBoolean("pref_live_config_is_need_restore", false);
    }

    public long getLiveMusicFirstRequestTime() {
        return getLong("pref_key_live_music_first_request_time", -1);
    }

    public int[] getRecordingClosedElements() {
        return this.mRecordingClosedElements;
    }

    public int getUiStyle() {
        return this.mUiStyle;
    }

    public String getVideoSpeed() {
        return isSwitchOn("pref_video_speed_fast_key") ? CameraSettings.VIDEO_SPEED_FAST : isSwitchOn("pref_video_speed_slow_key") ? CameraSettings.VIDEO_SPEED_SLOW : isSwitchOn("pref_video_speed_hfr_key") ? CameraSettings.VIDEO_SPEED_HFR : "normal";
    }

    public boolean isSwitchOn(String str) {
        return getBoolean(str, false);
    }

    public boolean isTransient() {
        return true;
    }

    public String provideKey() {
        return KEY;
    }

    public void reInitComponent(int i, int i2, CameraCapabilities cameraCapabilities) {
        reInitSupport(i, i2, cameraCapabilities);
        this.mComponentUltraPixel.reInit(i, i2, cameraCapabilities);
        this.mComponentRunningShine.reInit(i, i2, cameraCapabilities);
        getComponentRunningMacroMode().reInit(i2, DataRepository.dataItemGlobal().isNormalIntent());
        getComponentRunningAutoZoom().reInit(i2, DataRepository.dataItemGlobal().isNormalIntent());
    }

    public void reInitSupport(int i, int i2, CameraCapabilities cameraCapabilities) {
        this.mSupportHandGesture = false;
        this.mSupportMacroMode = false;
        if (i2 == 1 && ((i == 163 || i == 165 || i == 171) && b.gg())) {
            this.mSupportHandGesture = true;
        }
        if (!DataRepository.dataItemFeature().isSupportMacroMode()) {
            return;
        }
        if (163 == i || 165 == i || 162 == i || 169 == i) {
            this.mSupportMacroMode = true;
        }
    }

    public void setHandGestureRunning(boolean z) {
        putBoolean("pref_hand_gesture_status", z);
    }

    public void setLiveConfigIsNeedRestore(boolean z) {
        putBoolean("pref_live_config_is_need_restore", z);
    }

    public void setLiveMusicFirstRequestTime(long j) {
        putLong("pref_key_live_music_first_request_time", j);
    }

    public void setRecordingClosedElements(int[] iArr) {
        this.mRecordingClosedElements = iArr;
    }

    public void setUiStyle(int i) {
        StringBuilder sb = new StringBuilder();
        sb.append("setUiStyle: ");
        sb.append(i);
        Log.d("DataItemRunning", sb.toString());
        this.mLastUiStyle = this.mUiStyle;
        this.mUiStyle = i;
    }

    public boolean supportHandGesture() {
        return this.mSupportHandGesture;
    }

    public boolean supportMacroMode() {
        return this.mSupportMacroMode;
    }

    public boolean supportPopShineEntry() {
        return this.mComponentRunningShine.supportPopUpEntry();
    }

    public boolean supportTopShineEntry() {
        return this.mComponentRunningShine.supportTopConfigEntry();
    }

    public boolean supportUltraPixel() {
        return !this.mComponentUltraPixel.isEmpty();
    }

    public void switchOff(String str) {
        putBoolean(str, false);
    }

    public void switchOn(String str) {
        putBoolean(str, true);
    }

    public boolean triggerSwitchAndGet(String str) {
        if (isSwitchOn(str)) {
            switchOff(str);
            return false;
        }
        switchOn(str);
        return true;
    }
}
