package com.android.camera.module.impl.component;

import android.content.Context;
import android.content.Intent;
import android.provider.MiuiSettings.System;
import android.support.annotation.StringRes;
import android.text.TextUtils;
import com.android.camera.ActivityBase;
import com.android.camera.BasePreferenceActivity;
import com.android.camera.CameraIntentManager;
import com.android.camera.CameraIntentManager.CameraMode;
import com.android.camera.CameraPreferenceActivity;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.MutexModeManager;
import com.android.camera.R;
import com.android.camera.ThermalDetector;
import com.android.camera.ToastUtils;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.config.ComponentConfigAi;
import com.android.camera.data.data.config.ComponentConfigBeauty;
import com.android.camera.data.data.config.ComponentConfigFilter;
import com.android.camera.data.data.config.ComponentConfigFlash;
import com.android.camera.data.data.config.ComponentConfigHdr;
import com.android.camera.data.data.config.ComponentConfigRatio;
import com.android.camera.data.data.config.ComponentConfigSlowMotion;
import com.android.camera.data.data.config.ComponentRunningMacroMode;
import com.android.camera.data.data.config.ComponentRunningUltraPixel;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.config.SupportedConfigFactory;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.data.data.runing.ComponentRunningLiveShot;
import com.android.camera.data.data.runing.ComponentRunningShine;
import com.android.camera.data.data.runing.ComponentRunningTiltValue;
import com.android.camera.data.data.runing.ComponentRunningTimer;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.module.Camera2Module;
import com.android.camera.module.ModuleManager;
import com.android.camera.module.VideoModule;
import com.android.camera.module.loader.StartControl;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.BokehFNumberController;
import com.android.camera.protocol.ModeProtocol.BottomMenuProtocol;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.ConfigChanges;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.FilterProtocol;
import com.android.camera.protocol.ModeProtocol.MainContentProtocol;
import com.android.camera.protocol.ModeProtocol.ManuallyAdjust;
import com.android.camera.protocol.ModeProtocol.MiBeautyProtocol;
import com.android.camera.protocol.ModeProtocol.OnFaceBeautyChangedProtocol;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.protocol.ModeProtocol.UltraWideProtocol;
import com.android.camera.protocol.ModeProtocol.VerticalProtocol;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera2.Camera2Proxy;
import java.util.HashMap;

public class ConfigChangeImpl implements ConfigChanges {
    private static final String TAG = ConfigChangeImpl.class.getSimpleName();
    private ActivityBase mActivity;
    private int[] mRecordingClosedElements;

    public ConfigChangeImpl(ActivityBase activityBase) {
        this.mActivity = activityBase;
    }

    private void applyConfig(int i, int i2) {
        switch (i) {
            case 195:
                configPortraitSwitch(i2);
                return;
            case 196:
                showOrHideShine();
                return;
            case 199:
                configFocusPeakSwitch(i2);
                return;
            case 201:
                configAiSceneSwitch(i2);
                return;
            case 202:
                configVideoHFR();
                return;
            case 203:
                showOrHideLighting(true);
                return;
            case 204:
                configFPS960();
                return;
            case 205:
                configSwitchUltraWide();
                return;
            case 206:
                configLiveShotSwitch(i2);
                return;
            case 207:
                configSwitchUltraWideBokeh();
                return;
            case 209:
                configSwitchUltraPixel(i2);
                return;
            case 210:
                configRatio();
                return;
            case 211:
                configSquare();
                return;
            case 212:
                showOrHideShine();
                return;
            case 225:
                showSetting();
                return;
            case 226:
                configTimerSwitch();
                return;
            case 228:
                configTiltSwitch(i2);
                return;
            case 229:
                configGradienterSwitch(i2);
                return;
            case 230:
                configHHTSwitch(i2);
                return;
            case 231:
                configMagicFocusSwitch();
                return;
            case 232:
                configVideoSlow();
                return;
            case 233:
                configVideoFast();
                return;
            case 234:
                beautyMutexHandle();
                configScene(i2);
                return;
            case 235:
                configGroupSwitch(i2);
                return;
            case 236:
                configMagicMirrorSwitch(i2);
                return;
            case 237:
                configRawSwitch();
                return;
            case 238:
                configGenderAgeSwitch(i2);
                return;
            case 239:
                showOrHideShine();
                return;
            case 240:
                configDualWaterMarkSwitch();
                return;
            case 241:
                configSuperResolutionSwitch(i2);
                return;
            case 243:
                configVideoBokehSwitch(i2);
                return;
            case 246:
                configMoon(true);
                return;
            case 247:
                configMoonNight();
                return;
            case 248:
                configSilhouette();
                return;
            case 249:
                configMoonBacklight();
                return;
            case 252:
                configSwitchHandGesture();
                return;
            case 253:
                configAutoZoom();
                return;
            case 255:
                configMacroMode();
                return;
            default:
                return;
        }
    }

    private void beautyMutexHandle() {
    }

    private void changeMode(int i) {
        DataRepository.dataItemGlobal().setCurrentMode(i);
        this.mActivity.onModeSelected(StartControl.create(i).setViewConfigType(2).setNeedBlurAnimation(true).setNeedReConfigureCamera(true));
    }

    private void closeVideoFast() {
        DataItemGlobal dataItemGlobal = (DataItemGlobal) DataRepository.provider().dataGlobal();
        if (dataItemGlobal.getCurrentMode() == 169) {
            DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
            dataItemGlobal.setCurrentMode(162);
            dataItemRunning.switchOff("pref_video_speed_fast_key");
        }
    }

    private void configAiSceneSwitch(int i) {
        int moduleIndex = getBaseModule().getModuleIndex();
        boolean aiSceneOpen = CameraSettings.getAiSceneOpen(moduleIndex);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("configAiSceneSwitch: ");
        sb.append(!aiSceneOpen);
        Log.d(str, sb.toString());
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        switch (i) {
            case 1:
                if (!aiSceneOpen) {
                    topAlert.alertSwitchHint(1, (int) R.string.pref_camera_front_ai_scene_entry_on);
                    CameraSettings.setAiSceneOpen(moduleIndex, true);
                    CameraStatUtil.trackPreferenceChange("pref_camera_ai_scene_mode_key", "on");
                } else {
                    topAlert.alertSwitchHint(1, (int) R.string.pref_camera_front_ai_scene_entry_off);
                    CameraSettings.setAiSceneOpen(moduleIndex, false);
                    CameraStatUtil.trackPreferenceChange("pref_camera_ai_scene_mode_key", "off");
                    BaseModule baseModule = getBaseModule();
                    if (baseModule != null && (baseModule instanceof Camera2Module)) {
                        ((Camera2Module) baseModule).checkCloseMoonMode(0, 8);
                    }
                }
                topAlert.updateConfigItem(201);
                if (CameraSettings.isGroupShotOn()) {
                    ((ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164)).configGroupSwitch(4);
                    topAlert.refreshExtraMenu();
                    break;
                }
                break;
            case 3:
                CameraSettings.setAiSceneOpen(moduleIndex, false);
                topAlert.updateConfigItem(201);
                break;
        }
        getBaseModule().updatePreferenceTrampoline(36);
        getBaseModule().getCameraDevice().resumePreview();
        if (i == 1 && CameraSettings.isUltraPixelOn()) {
            configSwitchUltraPixel(3);
        }
    }

    private void configAutoZoom() {
        BaseModule baseModule = getBaseModule();
        if (baseModule != null) {
            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            if (topAlert != null) {
                int moduleIndex = baseModule.getModuleIndex();
                boolean isAutoZoomEnabled = CameraSettings.isAutoZoomEnabled(moduleIndex);
                HybridZoomingSystem.clearZoomRatioHistory();
                if (isAutoZoomEnabled) {
                    CameraSettings.setAutoZoomEnabled(moduleIndex, false);
                    topAlert.updateConfigItem(253);
                } else {
                    CameraSettings.setAutoZoomEnabled(moduleIndex, true);
                    topAlert.updateConfigItem(253);
                    closeVideoFast();
                    resetBeautyLevel();
                }
                ComponentRunningMacroMode componentRunningMacroMode = DataRepository.dataItemRunning().getComponentRunningMacroMode();
                if (componentRunningMacroMode.isSwitchOn(moduleIndex)) {
                    componentRunningMacroMode.setSwitchOff(moduleIndex);
                }
                this.mActivity.onModeSelected(StartControl.create(162).setViewConfigType(2).setNeedBlurAnimation(true).setNeedReConfigureData(false).setNeedReConfigureCamera(true));
                BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                if (CameraSettings.isAutoZoomEnabled(moduleIndex)) {
                    topAlert.alertSwitchHint(2, (int) R.string.autozoom_hint);
                } else {
                    topAlert.alertSwitchHint(2, (int) R.string.autozoom_disabled_hint);
                }
                bottomPopupTips.updateLeftTipImage();
                bottomPopupTips.updateTipImage();
            }
        }
    }

    private void configMacroMode() {
        int moduleIndex = getBaseModule().getModuleIndex();
        boolean z = false;
        boolean z2 = 169 == moduleIndex;
        boolean isMacroModeEnabled = true ^ CameraSettings.isMacroModeEnabled(moduleIndex);
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (isMacroModeEnabled && z2) {
            DataRepository.dataItemGlobal().setCurrentMode(162);
            if (topAlert != null) {
                topAlert.refreshExtraMenu();
            }
        }
        CameraSettings.setAutoZoomEnabled(moduleIndex, false);
        if (isMacroModeEnabled && moduleIndex == 162) {
            resetBeautyLevel();
        }
        HybridZoomingSystem.clearZoomRatioHistory();
        ComponentRunningMacroMode componentRunningMacroMode = DataRepository.dataItemRunning().getComponentRunningMacroMode();
        if (isMacroModeEnabled) {
            componentRunningMacroMode.setSwitchOn(moduleIndex);
        } else {
            componentRunningMacroMode.setSwitchOff(moduleIndex);
        }
        UltraWideProtocol ultraWideProtocol = (UltraWideProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(200);
        if (ultraWideProtocol != null) {
            ultraWideProtocol.onSwitchUltraWide(false);
        }
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (isMacroModeEnabled) {
            switch (moduleIndex) {
                case 162:
                case 163:
                case 165:
                    bottomPopupTips.showTips(18, R.string.macro_mode_tip, 4, System.SCREEN_KEY_LONG_PRESS_TIMEOUT_DEFAULT);
                    break;
            }
        } else {
            bottomPopupTips.showTips(18, R.string.macro_mode_tip, 6);
        }
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
        if (isMacroModeEnabled) {
            if (bottomPopupTips != null) {
                bottomPopupTips.directHideTipImage();
                bottomPopupTips.directShowOrHideLeftTipImage(false);
            }
            if (dualController != null) {
                dualController.hideZoomButton();
                return;
            }
            return;
        }
        if (miBeautyProtocol != null) {
            z = miBeautyProtocol.isBeautyPanelShow();
        }
        if (bottomPopupTips != null && !z) {
            bottomPopupTips.reInitTipImage();
        }
        if (dualController != null && !z) {
            if (!CameraSettings.isUltraWideConfigOpen(moduleIndex)) {
                dualController.showZoomButton();
            }
            if (topAlert != null) {
                topAlert.clearAlertStatus();
            }
        }
    }

    private void configMoon(boolean z) {
        BaseModule baseModule = getBaseModule();
        if (baseModule instanceof Camera2Module) {
            ((Camera2Module) baseModule).updateMoon(z);
        }
    }

    private void configMoonBacklight() {
        BaseModule baseModule = getBaseModule();
        if (baseModule instanceof Camera2Module) {
            ((Camera2Module) baseModule).updateBacklight();
        }
    }

    private void configMoonNight() {
        BaseModule baseModule = getBaseModule();
        if (baseModule instanceof Camera2Module) {
            Camera2Module camera2Module = (Camera2Module) baseModule;
            configMoon(false);
            camera2Module.updateMoonNight();
        }
    }

    private void configSilhouette() {
        BaseModule baseModule = getBaseModule();
        if (baseModule instanceof Camera2Module) {
            ((Camera2Module) baseModule).updateSilhouette();
        }
    }

    private void configSquare() {
        DataItemGlobal dataItemGlobal = (DataItemGlobal) DataRepository.provider().dataGlobal();
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        if (getBaseModule().getModuleIndex() != 165) {
            dataItemGlobal.setTempRatioGlobal(CameraMode.SQUARE, ComponentConfigRatio.RATIO_1X1);
            closeMutexElement(SupportedConfigFactory.CLOSE_BY_SQUARE, 206, 209);
            DataRepository.dataItemRunning().setRecordingClosedElements(this.mRecordingClosedElements);
            changeMode(165);
            return;
        }
        this.mRecordingClosedElements = DataRepository.dataItemRunning().getRecordingClosedElements();
        restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_SQUARE);
        dataItemGlobal.setTempRatioGlobal(CameraMode.SQUARE, null);
        dataItemRunning.switchOff("pref_camera_square_mode_key");
        changeMode(163);
    }

    private void configSwitchHandGesture() {
        if (DataRepository.dataItemFeature().ge()) {
            BaseModule baseModule = getBaseModule();
            if (baseModule != null && (baseModule.getModuleIndex() == 163 || baseModule.getModuleIndex() == 171)) {
                boolean z = !CameraSettings.isHandGestureOpen();
                CameraSettings.setHandGestureStatus(z);
                BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                if (z) {
                    bottomPopupTips.showTips(16, R.string.hand_gesture_open_tip, 2);
                }
                ((Camera2Module) getBaseModule()).onHanGestureSwitched(z);
            }
        }
    }

    private void configSwitchUltraPixel(int i) {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert != null && this.mActivity != null) {
            BaseModule baseModule = getBaseModule();
            if (baseModule != null) {
                int moduleIndex = baseModule.getModuleIndex();
                boolean isUltraPixelOn = CameraSettings.isUltraPixelOn();
                boolean z = !isUltraPixelOn;
                ComponentRunningUltraPixel componentUltraPixel = DataRepository.dataItemRunning().getComponentUltraPixel();
                String currentSupportUltraPixel = componentUltraPixel.getCurrentSupportUltraPixel();
                boolean z2 = false;
                if (i == 1) {
                    if (CameraSettings.isUltraWideConfigOpen(moduleIndex)) {
                        CameraSettings.setUltraWideConfig(moduleIndex, false);
                        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                        bottomPopupTips.updateLeftTipImage();
                        bottomPopupTips.directlyHideTips();
                    }
                    if (z) {
                        char c = 65535;
                        int hashCode = currentSupportUltraPixel.hashCode();
                        if (hashCode != -1379357032) {
                            if (hashCode == -70723282 && currentSupportUltraPixel.equals(ComponentRunningUltraPixel.ULTRA_PIXEL_ON_REAR_48M)) {
                                c = 0;
                            }
                        } else if (currentSupportUltraPixel.equals(ComponentRunningUltraPixel.ULTRA_PIXEL_ON_FRONT_32M)) {
                            c = 1;
                        }
                        switch (c) {
                            case 0:
                                closeMutexElement(SupportedConfigFactory.CLOSE_BY_ULTRA_PIXEL, 194, 239, 201, 206);
                                break;
                            case 1:
                                closeMutexElement(SupportedConfigFactory.CLOSE_BY_ULTRA_PIXEL, 196, 201, 206);
                                break;
                        }
                        DataRepository.dataItemRunning().setRecordingClosedElements(this.mRecordingClosedElements);
                        CameraSettings.switchOnUltraPixel(currentSupportUltraPixel);
                    } else {
                        this.mRecordingClosedElements = DataRepository.dataItemRunning().getRecordingClosedElements();
                        restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_ULTRA_PIXEL);
                        CameraSettings.switchOffUltraPixel();
                    }
                    if (getBaseModule().getModuleIndex() == 165) {
                        changeMode(163);
                    } else if ((!z || DataRepository.dataItemRunning().getUiStyle() != 3) && (!isUltraPixelOn || DataRepository.dataItemRunning().getLastUiStyle() != 3)) {
                        baseModule.restartModule();
                    } else {
                        changeMode(getBaseModule().getModuleIndex());
                    }
                    if (z) {
                        topAlert.alertTopHint(0, componentUltraPixel.getUltraPixelOpenTip());
                    } else {
                        topAlert.alertTopHint(8, componentUltraPixel.getUltraPixelCloseTip());
                        topAlert.alertSwitchHint(1, componentUltraPixel.getUltraPixelCloseTip());
                    }
                } else if (i == 3 && isUltraPixelOn) {
                    CameraSettings.switchOffUltraPixel();
                    if (DataRepository.dataItemRunning().getLastUiStyle() == 3) {
                        changeMode(getBaseModule().getModuleIndex());
                    } else {
                        baseModule.restartModule();
                    }
                    topAlert.alertTopHint(8, componentUltraPixel.getUltraPixelCloseTip());
                }
                BottomPopupTips bottomPopupTips2 = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
                MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
                if (z) {
                    if (ComponentRunningUltraPixel.ULTRA_PIXEL_ON_REAR_48M.equals(currentSupportUltraPixel) && bottomPopupTips2 != null) {
                        bottomPopupTips2.directHideTipImage();
                        bottomPopupTips2.directShowOrHideLeftTipImage(false);
                    }
                    if (dualController != null) {
                        dualController.hideZoomButton();
                    }
                } else {
                    if (miBeautyProtocol != null) {
                        z2 = miBeautyProtocol.isBeautyPanelShow();
                    }
                    if (bottomPopupTips2 != null && !z2) {
                        bottomPopupTips2.reInitTipImage();
                    }
                    if (dualController != null && !z2) {
                        if (moduleIndex != 167) {
                            dualController.showZoomButton();
                        }
                        if (topAlert != null) {
                            topAlert.clearAlertStatus();
                        }
                    }
                }
            }
        }
    }

    private void configSwitchUltraWide() {
        int moduleIndex = getBaseModule().getModuleIndex();
        boolean z = 169 == moduleIndex;
        boolean z2 = !CameraSettings.isUltraWideConfigOpen(moduleIndex);
        if (z2 && z) {
            DataRepository.dataItemGlobal().setCurrentMode(162);
            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            if (topAlert != null) {
                topAlert.refreshExtraMenu();
            }
        }
        if (CameraSettings.isUltraPixelOn()) {
            CameraSettings.switchOffUltraPixel();
        }
        CameraSettings.setUltraWideConfig(moduleIndex, z2);
        UltraWideProtocol ultraWideProtocol = (UltraWideProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(200);
        if (ultraWideProtocol != null) {
            ultraWideProtocol.onSwitchUltraWide(true);
        }
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (!z2) {
            bottomPopupTips.showTips(13, R.string.ultra_wide_close_tip, 6);
        } else if (CameraSettings.shouldShowUltraWideStickyTip(moduleIndex)) {
            bottomPopupTips.showTips(13, R.string.ultra_wide_open_tip, 4, System.SCREEN_KEY_LONG_PRESS_TIMEOUT_DEFAULT);
        } else {
            bottomPopupTips.showTips(13, R.string.ultra_wide_open_tip, 7, System.SCREEN_KEY_LONG_PRESS_TIMEOUT_DEFAULT);
        }
    }

    private void configSwitchUltraWideBokeh() {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert != null && this.mActivity != null) {
            BaseModule baseModule = getBaseModule();
            if (baseModule != null) {
                if (DataRepository.dataItemRunning().isSwitchOn("pref_ultra_wide_bokeh_enabled")) {
                    DataRepository.dataItemRunning().switchOff("pref_ultra_wide_bokeh_enabled");
                    topAlert.alertSwitchHint(2, (int) R.string.ultra_wide_bokeh_close_tip);
                } else {
                    DataRepository.dataItemRunning().switchOn("pref_ultra_wide_bokeh_enabled");
                    topAlert.alertSwitchHint(2, (int) R.string.ultra_wide_bokeh_open_tip);
                }
                baseModule.restartModule();
            }
        }
    }

    private void configVideoBokehSwitch(int i) {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        boolean isSwitchOn = dataItemConfig.isSwitchOn("pref_video_bokeh_key");
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("configVideoBokehSwitch: switchOn = ");
        sb.append(!isSwitchOn);
        Log.d(str, sb.toString());
        if (!isSwitchOn) {
            dataItemConfig.switchOn("pref_video_bokeh_key");
            CameraStatUtil.trackPreferenceChange("pref_video_bokeh_key", "on");
        } else {
            dataItemConfig.switchOff("pref_video_bokeh_key");
            CameraStatUtil.trackPreferenceChange("pref_video_bokeh_key", "off");
        }
        topAlert.updateConfigItem(243);
        this.mActivity.onModeSelected(StartControl.create(getBaseModule().getModuleIndex()).setViewConfigType(2).setNeedBlurAnimation(true).setNeedReConfigureCamera(true).setNeedReConfigureData(false));
        topAlert.alertSwitchHint(2, !isSwitchOn ? R.string.pref_camera_video_bokeh_on : R.string.pref_camera_video_bokeh_off);
    }

    private void conflictWithFlashAndHdr() {
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        dataItemRunning.switchOff("pref_camera_hand_night_key");
        dataItemRunning.switchOff("pref_camera_groupshot_mode_key");
        dataItemRunning.switchOff("pref_camera_super_resolution_key");
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        int activeModuleIndex = ModuleManager.getActiveModuleIndex();
        if (CameraSettings.shouldShowUltraWideStickyTip(activeModuleIndex) && bottomPopupTips.getCurrentBottomTipMsg() == 13) {
            return;
        }
        if (CameraSettings.shouldShowUltraWideStickyTip(activeModuleIndex) && bottomPopupTips.getCurrentBottomTipMsg() == 17) {
            bottomPopupTips.showTips(13, R.string.ultra_wide_open_tip, 4);
        } else if (!CameraSettings.isMacroModeEnabled(activeModuleIndex) || bottomPopupTips.getCurrentBottomTipMsg() != 18) {
            bottomPopupTips.directlyHideTips();
        }
    }

    public static ConfigChangeImpl create(ActivityBase activityBase) {
        return new ConfigChangeImpl(activityBase);
    }

    /* access modifiers changed from: private */
    public BaseModule getBaseModule() {
        return (BaseModule) this.mActivity.getCurrentModule();
    }

    private boolean getState(int i, String str) {
        if (i == 2) {
            return DataRepository.dataItemRunning().isSwitchOn(str);
        }
        if (i != 4) {
            return DataRepository.dataItemRunning().triggerSwitchAndGet(str);
        }
        DataRepository.dataItemRunning().switchOff(str);
        return false;
    }

    private void hideTipMessage(@StringRes int i) {
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (i <= 0 || bottomPopupTips.containTips(i)) {
            bottomPopupTips.directlyHideTips();
        }
    }

    private boolean is4KQuality(int i, int i2) {
        return i >= 3840 && i2 >= 2160;
    }

    private boolean isAlive() {
        return this.mActivity != null;
    }

    private boolean isBeautyPanelShow() {
        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
        if (miBeautyProtocol != null) {
            return miBeautyProtocol.isBeautyPanelShow();
        }
        return false;
    }

    public static void preload() {
        Log.i(TAG, "preload");
    }

    private void resetBeautyLevel() {
        ComponentRunningShine componentRunningShine = DataRepository.dataItemRunning().getComponentRunningShine();
        if (componentRunningShine.supportBeautyLevel()) {
            CameraSettings.setFaceBeautyLevel(0);
        } else if (componentRunningShine.supportSmoothLevel()) {
            CameraSettings.setFaceBeautySmoothLevel(0);
        }
    }

    private void trackFocusPeakChanged(boolean z) {
        CameraStatUtil.trackConfigChange(CameraStat.KEY_MANUAL_FOCUS_PEAK_CHANGED, CameraStat.PARAM_FOCUS_PEAK, z, false, false);
    }

    private void trackGenderAgeChanged(boolean z) {
        CameraStatUtil.trackConfigChange(CameraStat.KEY_GENDER_AGE_CHANGED, CameraStat.PARAM_GENDER_AGE, z, false, true);
    }

    private void trackGotoSettings() {
        BaseModule baseModule = (BaseModule) this.mActivity.getCurrentModule();
        if (baseModule != null) {
            CameraStatUtil.trackGotoSettings(baseModule.getModuleIndex());
        }
    }

    private void trackGradienterChanged(boolean z) {
        CameraStatUtil.trackConfigChange(CameraStat.KEY_GRADIENT_CHANGED, CameraStat.PARAM_GRADIENTER, z, true, false);
    }

    private void trackGroupChanged(boolean z) {
        CameraStatUtil.trackConfigChange(CameraStat.KEY_GROUP_SHOT_CHANGED, CameraStat.PARAM_GROUP_SHOT, z, false, true);
    }

    private void trackHHTChanged(boolean z) {
        CameraStatUtil.trackConfigChange(CameraStat.KEY_HHT_CHANGED, CameraStat.PARAM_HHT, z, true, false);
    }

    private void trackMagicMirrorChanged(boolean z) {
        CameraStatUtil.trackConfigChange(CameraStat.KEY_MAGIC_MIRROR_CHANGED, CameraStat.PARAM_MAGIC_MIRROR, z, false, true);
    }

    private void trackSuperResolutionChanged(boolean z) {
        CameraStatUtil.trackConfigChange(CameraStat.KEY_SUPER_RESOLUTION_CHANGED, CameraStat.PARAM_SUPER_RESOLUTION, z, false, false);
    }

    private void updateAiScene(boolean z) {
        int currentMode = DataRepository.dataItemGlobal().getCurrentMode();
        ComponentConfigAi componentConfigAi = DataRepository.dataItemConfig().getComponentConfigAi();
        if (!componentConfigAi.isEmpty() && componentConfigAi.isClosed(currentMode) != z) {
            componentConfigAi.setClosed(z, currentMode);
            BaseModule baseModule = getBaseModule();
            if (baseModule != null && (baseModule instanceof Camera2Module) && z) {
                ((Camera2Module) baseModule).checkCloseMoonMode(0, 8);
            }
            ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateConfigItem(201);
        }
    }

    private void updateAutoZoom(boolean z) {
    }

    private void updateComponentBeauty(boolean z) {
        int currentMode = DataRepository.dataItemGlobal().getCurrentMode();
        ComponentConfigBeauty componentConfigBeauty = DataRepository.dataItemConfig().getComponentConfigBeauty();
        if (!componentConfigBeauty.isEmpty() && componentConfigBeauty.isClosed(currentMode) != z) {
            componentConfigBeauty.setClosed(z, currentMode);
            if (z) {
                MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
                if (miBeautyProtocol != null && miBeautyProtocol.isBeautyPanelShow()) {
                    miBeautyProtocol.dismiss(2);
                }
            }
            OnFaceBeautyChangedProtocol onFaceBeautyChangedProtocol = (OnFaceBeautyChangedProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(199);
            if (onFaceBeautyChangedProtocol != null) {
                onFaceBeautyChangedProtocol.onBeautyChanged(true);
            }
        }
    }

    private void updateComponentFilter(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("updateComponentFilter: close = ");
        sb.append(z);
        Log.d(str, sb.toString());
        ComponentConfigFilter componentConfigFilter = DataRepository.dataItemRunning().getComponentConfigFilter();
        int currentMode = DataRepository.dataItemGlobal().getCurrentMode();
        if (!componentConfigFilter.isEmpty() && componentConfigFilter.isClosed(currentMode) != z) {
            componentConfigFilter.setClosed(z, currentMode);
            ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateConfigItem(212);
            if (z) {
                MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
                if (miBeautyProtocol != null && miBeautyProtocol.isBeautyPanelShow()) {
                    miBeautyProtocol.dismiss(2);
                }
            }
        }
    }

    private void updateComponentFlash(String str, boolean z) {
        ComponentConfigFlash componentFlash = DataRepository.dataItemConfig().getComponentFlash();
        int currentMode = DataRepository.dataItemGlobal().getCurrentMode();
        if (!componentFlash.isEmpty() && componentFlash.isClosed() != z) {
            if (!z || !componentFlash.getComponentValue(currentMode).equals("2") || !SupportedConfigFactory.CLOSE_BY_BURST_SHOOT.equals(str)) {
                componentFlash.setClosed(z);
                ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateConfigItem(193);
            }
        }
    }

    private void updateComponentHdr(boolean z) {
        ComponentConfigHdr componentHdr = DataRepository.dataItemConfig().getComponentHdr();
        DataRepository.dataItemGlobal().getCurrentMode();
        if (!componentHdr.isEmpty() && componentHdr.isClosed() != z) {
            componentHdr.setClosed(z);
            ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateConfigItem(194);
        }
    }

    private void updateComponentShine(boolean z) {
        ComponentRunningShine componentRunningShine = DataRepository.dataItemRunning().getComponentRunningShine();
        if (!componentRunningShine.isEmpty() && componentRunningShine.isClosed() != z) {
            componentRunningShine.setClosed(z);
        }
    }

    private void updateEyeLight(boolean z) {
        if (z) {
            CameraSettings.setEyeLight("-1");
            setEyeLight("-1");
            MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
            boolean z2 = false;
            if (miBeautyProtocol != null) {
                z2 = miBeautyProtocol.isEyeLightShow();
            }
            if (z2) {
                miBeautyProtocol.closeEyeLight();
            }
        }
    }

    private void updateFlashModeAndRefreshUI(BaseModule baseModule, String str) {
        int moduleIndex = baseModule.getModuleIndex();
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("updateFlashModeAndRefreshUI flashMode = ");
        sb.append(str);
        Log.d(str2, sb.toString());
        if (!TextUtils.isEmpty(str)) {
            CameraSettings.setFlashMode(moduleIndex, str);
        }
        if ("0".equals(str)) {
            if (CameraSettings.isFrontCamera()) {
                ToastUtils.showToast((Context) this.mActivity, (int) R.string.close_front_flash_toast);
            } else {
                ToastUtils.showToast((Context) this.mActivity, (int) R.string.close_back_flash_toast);
            }
        }
        if (!baseModule.isDoingAction() || "0".equals(str)) {
            baseModule.updatePreferenceInWorkThread(10);
        } else {
            baseModule.updatePreferenceTrampoline(10);
        }
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert != null) {
            topAlert.updateConfigItem(193);
        }
    }

    private void updateLiveShot(boolean z) {
        if (DataRepository.dataItemFeature().fL()) {
            int currentMode = DataRepository.dataItemGlobal().getCurrentMode();
            if (currentMode == 163 || currentMode == 165) {
                ComponentRunningLiveShot componentRunningLiveShot = DataRepository.dataItemRunning().getComponentRunningLiveShot();
                if (componentRunningLiveShot.isClosed() != z) {
                    componentRunningLiveShot.setClosed(z);
                    ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateConfigItem(206);
                }
            }
        }
    }

    private void updateTipMessage(int i, @StringRes int i2, int i3) {
        ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).showTips(i, i2, i3);
    }

    private void updateUltraPixel(boolean z) {
        ComponentRunningUltraPixel componentUltraPixel = DataRepository.dataItemRunning().getComponentUltraPixel();
        if (!componentUltraPixel.isEmpty() && componentUltraPixel.isClosed() != z) {
            componentUltraPixel.setClosed(z);
        }
    }

    public void closeMutexElement(String str, int... iArr) {
        int[] iArr2 = new int[iArr.length];
        this.mRecordingClosedElements = iArr;
        for (int i = 0; i < iArr.length; i++) {
            switch (iArr[i]) {
                case 193:
                    updateComponentFlash(str, true);
                    iArr2[i] = 10;
                    break;
                case 194:
                    updateComponentHdr(true);
                    iArr2[i] = 11;
                    break;
                case 196:
                    updateComponentFilter(true);
                    iArr2[i] = 2;
                    break;
                case 201:
                    updateAiScene(true);
                    iArr2[i] = 36;
                    break;
                case 206:
                    updateLiveShot(true);
                    iArr2[i] = 49;
                    break;
                case 209:
                    updateUltraPixel(true);
                    iArr2[i] = 50;
                    break;
                case 212:
                    updateComponentShine(true);
                    iArr2[i] = 2;
                    break;
                case 239:
                    updateComponentBeauty(true);
                    iArr2[i] = 13;
                    break;
                case 253:
                    updateAutoZoom(true);
                    iArr2[i] = 51;
                    break;
                case 254:
                    updateEyeLight(true);
                    iArr2[i] = 45;
                    break;
                default:
                    throw new RuntimeException("unknown mutex element");
            }
        }
        BaseModule baseModule = getBaseModule();
        if (baseModule != null) {
            baseModule.updatePreferenceTrampoline(iArr2);
            baseModule.getCameraDevice().resumePreview();
        }
    }

    public void configBeautySwitch(int i) {
        boolean z;
        int moduleIndex = getBaseModule().getModuleIndex();
        if (moduleIndex != 162) {
            switch (moduleIndex) {
                case 168:
                case 169:
                case 170:
                    break;
                default:
                    z = false;
                    break;
            }
        }
        z = true;
        if (moduleIndex == 163 || moduleIndex == 165 || moduleIndex == 171 || moduleIndex == 161 || z) {
            ComponentConfigBeauty componentConfigBeauty = DataRepository.dataItemConfig().getComponentConfigBeauty();
            String nextValue = componentConfigBeauty.getNextValue(moduleIndex);
            boolean z2 = (!BeautyConstant.LEVEL_CLOSE.equals(componentConfigBeauty.getComponentValue(moduleIndex))) ^ (!BeautyConstant.LEVEL_CLOSE.equals(nextValue));
            componentConfigBeauty.setComponentValue(moduleIndex, nextValue);
            CameraStatUtil.trackBeautySwitchChanged(moduleIndex, nextValue);
            if (z2 && z) {
                if (moduleIndex != 162) {
                    DataItemGlobal dataItemGlobal = (DataItemGlobal) DataRepository.provider().dataGlobal();
                    DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
                    dataItemRunning.switchOff("pref_video_speed_fast_key");
                    dataItemRunning.switchOff("pref_video_speed_slow_key");
                    dataItemRunning.switchOff("pref_video_speed_hfr_key");
                    CameraSettings.setAutoZoomEnabled(moduleIndex, false);
                    dataItemGlobal.setCurrentMode(162);
                    DataRepository.getInstance().backUp().removeOtherVideoMode();
                    CameraStatUtil.trackVideoModeChanged("normal");
                }
                this.mActivity.onModeSelected(StartControl.create(162).setViewConfigType(2).setNeedBlurAnimation(true).setNeedReConfigureData(false).setNeedReConfigureCamera(true));
            } else if (!z2 || moduleIndex != 161) {
                getBaseModule().updatePreferenceInWorkThread(13);
            } else {
                this.mActivity.onModeSelected(StartControl.create(161).setViewConfigType(2).setNeedBlurAnimation(true).setNeedReConfigureData(false).setNeedReConfigureCamera(true));
            }
        }
    }

    public void configBokeh(String str) {
        if (str.equals("on")) {
            updateTipMessage(4, R.string.bokeh_use_hint, 2);
        } else {
            hideTipMessage(R.string.bokeh_use_hint);
        }
        BaseModule baseModule = getBaseModule();
        if (baseModule != null) {
            baseModule.updatePreferenceInWorkThread(11, 37);
        }
    }

    public void configDualWaterMarkSwitch() {
        boolean isDualCameraWaterMarkOpen = CameraSettings.isDualCameraWaterMarkOpen();
        CameraStatUtil.trackDualWaterMarkChanged(!isDualCameraWaterMarkOpen);
        if (isDualCameraWaterMarkOpen) {
            hideTipMessage(R.string.hunt_dual_water_mark);
            CameraSettings.setDualCameraWaterMarkOpen(false);
        } else {
            updateTipMessage(4, R.string.hunt_dual_water_mark, 2);
            CameraSettings.setDualCameraWaterMarkOpen(true);
        }
        getBaseModule().onSharedPreferenceChanged();
    }

    public void configFPS960() {
        ComponentConfigSlowMotion componentConfigSlowMotion = DataRepository.dataItemConfig().getComponentConfigSlowMotion();
        String nextValue = componentConfigSlowMotion.getNextValue(172);
        componentConfigSlowMotion.setComponentValue(172, nextValue);
        this.mActivity.onModeSelected(StartControl.create(172).setViewConfigType(2).setNeedBlurAnimation(true).setNeedReConfigureData(false).setNeedReConfigureCamera(true));
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.NEW_SLOW_MOTION_SWITCH_FPS, CameraStatUtil.slowMotionConfigToName(nextValue));
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_NEW_SLOW_MOTION, hashMap);
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips == null) {
            return;
        }
        if (ComponentConfigSlowMotion.DATA_CONFIG_NEW_SLOW_MOTION_960.equals(nextValue)) {
            bottomPopupTips.showTips(9, R.string.fps960_toast, 4);
        } else {
            bottomPopupTips.hideTipImage();
        }
    }

    public void configFlash(String str) {
        if (!ModuleManager.isVideoNewSlowMotion()) {
            conflictWithFlashAndHdr();
        }
        getBaseModule().updatePreferenceInWorkThread(11, 10);
    }

    public void configFocusPeakSwitch(int i) {
        boolean state = getState(i, "pref_camera_peak_key");
        if (1 == i) {
            trackFocusPeakChanged(state);
        }
        if (DataRepository.dataItemConfig().getManuallyFocus().disableUpdate()) {
            EffectController.getInstance().setDrawPeaking(false);
        } else if (!state) {
            EffectController.getInstance().setDrawPeaking(state);
        } else if ("manual".equals(CameraSettings.getFocusMode())) {
            EffectController.getInstance().setDrawPeaking(state);
        }
    }

    public void configGenderAgeSwitch(int i) {
        boolean state = getState(i, "pref_camera_show_gender_age_key");
        if (1 == i) {
            trackGenderAgeChanged(state);
        }
        ((MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166)).setShowGenderAndAge(state);
        getBaseModule().updatePreferenceInWorkThread(38);
        if (state) {
            Camera2Proxy cameraDevice = getBaseModule().getCameraDevice();
            if (cameraDevice != null) {
                String string = getBaseModule().getResources().getString(R.string.face_age_info);
                cameraDevice.setFaceWaterMarkEnable(true);
                cameraDevice.setFaceWaterMarkFormat(string);
                return;
            }
            return;
        }
        Camera2Proxy cameraDevice2 = getBaseModule().getCameraDevice();
        if (cameraDevice2 != null) {
            cameraDevice2.setFaceWaterMarkEnable(false);
        }
    }

    public void configGradienterSwitch(int i) {
        boolean state = getState(i, "pref_camera_gradienter_key");
        if (1 == i) {
            trackGradienterChanged(state);
        }
        ((Camera2Module) getBaseModule()).onGradienterSwitched(state);
        EffectController.getInstance().setDrawGradienter(state);
        ((Camera2Module) getBaseModule()).showOrHideChip(!state);
    }

    public void configGroupSwitch(int i) {
        boolean state = getState(i, "pref_camera_groupshot_mode_key");
        if (1 == i) {
            trackGroupChanged(state);
        }
        Camera2Module camera2Module = (Camera2Module) getBaseModule();
        camera2Module.showOrHideChip(!state);
        boolean isBeautyPanelShow = isBeautyPanelShow();
        if (state) {
            if (!isBeautyPanelShow) {
                updateTipMessage(17, R.string.hint_groupshot, 2);
            }
            if (CameraSettings.shouldShowUltraWideStickyTip(camera2Module.getModuleIndex()) && !isBeautyPanelShow) {
                ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).showTips(13, R.string.ultra_wide_open_tip, 4, 5000);
            }
            closeMutexElement(SupportedConfigFactory.CLOSE_BY_GROUP, 193, 194, 196, 201, 254);
        } else {
            restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_GROUP);
            hideTipMessage(R.string.hint_groupshot);
            if (CameraSettings.shouldShowUltraWideStickyTip(camera2Module.getModuleIndex()) && !isBeautyPanelShow) {
                ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).directlyShowTips(13, R.string.ultra_wide_open_tip);
            }
        }
        camera2Module.onSharedPreferenceChanged();
        getBaseModule().updatePreferenceInWorkThread(42, 34, 30);
    }

    public void configHHTSwitch(int i) {
        boolean state = getState(i, "pref_camera_hand_night_key");
        if (1 == i) {
            trackHHTChanged(state);
        }
        MutexModeManager mutexModePicker = getBaseModule().getMutexModePicker();
        if (state) {
            updateTipMessage(4, R.string.hine_hht, 2);
            closeMutexElement(SupportedConfigFactory.CLOSE_BY_HHT, 193, 194);
            mutexModePicker.setMutexModeMandatory(3);
            return;
        }
        hideTipMessage(R.string.hine_hht);
        mutexModePicker.clearMandatoryFlag();
        getBaseModule().resetMutexModeManually();
        restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_HHT);
    }

    public void configHdr(String str) {
        conflictWithFlashAndHdr();
        getBaseModule().updatePreferenceInWorkThread(11, 10, 37);
        if ("off" != str && CameraSettings.isUltraPixelRear48MPOn()) {
            configSwitchUltraPixel(3);
        }
    }

    public void configLiveShotSwitch(int i) {
        if (isAlive()) {
            BaseModule baseModule = getBaseModule();
            if (baseModule != null && baseModule.isFrameAvailable()) {
                if ((baseModule.getModuleIndex() == 163 || baseModule.getModuleIndex() == 165) && DataRepository.dataItemFeature().fL()) {
                    TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                    if (topAlert != null) {
                        Camera2Module camera2Module = (Camera2Module) baseModule;
                        if (i != 1) {
                            switch (i) {
                                case 3:
                                case 4:
                                    if (CameraSettings.isLiveShotOn()) {
                                        CameraSettings.setLiveShotOn(false);
                                        camera2Module.stopLiveShot(false);
                                        break;
                                    }
                                    break;
                            }
                        } else {
                            boolean isLiveShotOn = CameraSettings.isLiveShotOn();
                            CameraSettings.setLiveShotOn(!isLiveShotOn);
                            if (isLiveShotOn) {
                                camera2Module.stopLiveShot(false);
                                topAlert.alertSwitchHint(1, (int) R.string.camera_liveshot_off_tip);
                            } else if (CameraSettings.isUltraPixelOn()) {
                                Log.d(TAG, "Ignore #startLiveShot in ultra pixel photography mode");
                            } else if (camera2Module.getModuleIndex() == 165) {
                                configSquare();
                            } else {
                                camera2Module.startLiveShot();
                                topAlert.alertSwitchHint(1, (int) R.string.camera_liveshot_on_tip);
                            }
                        }
                        topAlert.updateConfigItem(206);
                    }
                }
            }
        }
    }

    public void configMagicFocusSwitch() {
        trackMagicMirrorChanged(DataRepository.dataItemRunning().triggerSwitchAndGet("pref_camera_ubifocus_key"));
    }

    public void configMagicMirrorSwitch(int i) {
        boolean state = getState(i, "pref_camera_magic_mirror_key");
        if (1 == i) {
            trackMagicMirrorChanged(state);
        }
        ((MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166)).setShowMagicMirror(state);
        getBaseModule().updatePreferenceInWorkThread(39);
        if (state) {
            Camera2Proxy cameraDevice = getBaseModule().getCameraDevice();
            if (cameraDevice != null) {
                String string = getBaseModule().getResources().getString(R.string.face_score_info);
                cameraDevice.setFaceWaterMarkEnable(true);
                cameraDevice.setFaceWaterMarkFormat(string);
                return;
            }
            return;
        }
        Camera2Proxy cameraDevice2 = getBaseModule().getCameraDevice();
        if (cameraDevice2 != null) {
            cameraDevice2.setFaceWaterMarkEnable(false);
        }
    }

    public void configPortraitSwitch(int i) {
        getBaseModule().onSharedPreferenceChanged();
    }

    public void configRatio() {
        BaseModule baseModule = getBaseModule();
        if (baseModule != null) {
            int moduleIndex = baseModule.getModuleIndex();
            ComponentConfigRatio componentConfigRatio = DataRepository.dataItemConfig().getComponentConfigRatio();
            String nextValue = componentConfigRatio.getNextValue(moduleIndex);
            componentConfigRatio.setComponentValue(moduleIndex, nextValue);
            int i = 163;
            char c = 65535;
            switch (nextValue.hashCode()) {
                case 50858:
                    if (nextValue.equals(ComponentConfigRatio.RATIO_1X1)) {
                        c = 4;
                        break;
                    }
                    break;
                case 53743:
                    if (nextValue.equals(ComponentConfigRatio.RATIO_4X3)) {
                        c = 0;
                        break;
                    }
                    break;
                case 1515430:
                    if (nextValue.equals(ComponentConfigRatio.RATIO_16X9)) {
                        c = 1;
                        break;
                    }
                    break;
                case 1517352:
                    if (nextValue.equals(ComponentConfigRatio.RATIO_FULL_18X9)) {
                        c = 2;
                        break;
                    }
                    break;
                case 1456894192:
                    if (nextValue.equals(ComponentConfigRatio.RATIO_FULL_195X9)) {
                        c = 3;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 4:
                    i = 165;
                    break;
            }
            if (moduleIndex != i) {
                changeMode(i);
            } else {
                getBaseModule().restartModule();
            }
        }
    }

    public void configRawSwitch() {
    }

    public void configScene(int i) {
        ManuallyAdjust manuallyAdjust = (ManuallyAdjust) ModeCoordinatorImpl.getInstance().getAttachProtocol(181);
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (getState(i, "pref_camera_scenemode_setting_key")) {
            bottomPopupTips.hideTipImage();
            manuallyAdjust.setManuallyVisible(2, 1, new ManuallyListener() {
                public void onManuallyDataChanged(ComponentData componentData, String str, String str2, boolean z) {
                    ConfigChangeImpl.this.getBaseModule().onSharedPreferenceChanged();
                    ConfigChangeImpl.this.getBaseModule().updatePreferenceInWorkThread(4);
                }
            });
        } else {
            bottomPopupTips.reInitTipImage();
            manuallyAdjust.setManuallyVisible(2, i == 1 ? 2 : 3, null);
        }
        getBaseModule().onSharedPreferenceChanged();
        getBaseModule().updatePreferenceInWorkThread(4);
    }

    public void configSuperResolutionSwitch(int i) {
        boolean state = getState(i, "pref_camera_super_resolution_key");
        if (1 == i) {
            trackSuperResolutionChanged(state);
        }
        MutexModeManager mutexModePicker = getBaseModule().getMutexModePicker();
        if (state) {
            closeMutexElement(SupportedConfigFactory.CLOSE_BY_SUPER_RESOLUTION, 193, 194);
            mutexModePicker.setMutexModeMandatory(10);
            return;
        }
        mutexModePicker.clearMandatoryFlag();
        getBaseModule().resetMutexModeManually();
        restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_SUPER_RESOLUTION);
    }

    public void configTiltSwitch(int i) {
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        boolean isSwitchOn = dataItemRunning.isSwitchOn("pref_camera_tilt_shift_mode");
        ComponentRunningTiltValue componentRunningTiltValue = dataItemRunning.getComponentRunningTiltValue();
        switch (i) {
            case 1:
                boolean z = true;
                if (!isSwitchOn) {
                    CameraStatUtil.trackTiltShiftChanged(ComponentRunningTiltValue.TILT_CIRCLE);
                    dataItemRunning.switchOn("pref_camera_tilt_shift_mode");
                    componentRunningTiltValue.setComponentValue(160, ComponentRunningTiltValue.TILT_CIRCLE);
                    isSwitchOn = true;
                } else if (ComponentRunningTiltValue.TILT_CIRCLE.equals(componentRunningTiltValue.getComponentValue(160))) {
                    CameraStatUtil.trackTiltShiftChanged(ComponentRunningTiltValue.TILT_PARALLEL);
                    componentRunningTiltValue.setComponentValue(160, ComponentRunningTiltValue.TILT_PARALLEL);
                } else {
                    CameraStatUtil.trackTiltShiftChanged("off");
                    dataItemRunning.switchOff("pref_camera_tilt_shift_mode");
                    isSwitchOn = false;
                }
                Camera2Module camera2Module = (Camera2Module) getBaseModule();
                if (isSwitchOn) {
                    z = false;
                }
                camera2Module.showOrHideChip(z);
                break;
            case 3:
                dataItemRunning.switchOff("pref_camera_tilt_shift_mode");
                isSwitchOn = false;
                break;
        }
        ((Camera2Module) getBaseModule()).onTiltShiftSwitched(isSwitchOn);
        EffectController.getInstance().setDrawTilt(isSwitchOn);
    }

    public void configTimerSwitch() {
        ComponentRunningTimer componentRunningTimer = DataRepository.dataItemRunning().getComponentRunningTimer();
        String nextValue = componentRunningTimer.getNextValue();
        CameraStatUtil.trackTimerChanged(nextValue);
        componentRunningTimer.setComponentValue(160, nextValue);
    }

    public void configVideoFast() {
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        int moduleIndex = getBaseModule().getModuleIndex();
        if (moduleIndex != 169) {
            CameraStatUtil.trackVideoModeChanged(CameraSettings.VIDEO_SPEED_FAST);
            dataItemRunning.switchOff("pref_video_speed_slow_key");
            dataItemRunning.switchOff("pref_video_speed_hfr_key");
            CameraSettings.setAutoZoomEnabled(moduleIndex, false);
            resetBeautyLevel();
            if (CameraSettings.isUltraWideConfigOpen(moduleIndex)) {
                CameraSettings.setUltraWideConfig(moduleIndex, false);
            }
            if (CameraSettings.isMacroModeEnabled(moduleIndex)) {
                DataRepository.dataItemRunning().getComponentRunningMacroMode().setSwitchOff(moduleIndex);
            }
            changeMode(169);
            updateTipMessage(4, R.string.hint_fast_motion, 2);
            return;
        }
        hideTipMessage(R.string.hint_fast_motion);
        dataItemRunning.switchOff("pref_video_speed_fast_key");
        CameraStatUtil.trackVideoModeChanged("normal");
        DataRepository.dataItemGlobal().setCurrentMode(162);
        changeMode(162);
    }

    public void configVideoHFR() {
        DataItemGlobal dataItemGlobal = (DataItemGlobal) DataRepository.provider().dataGlobal();
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        if (dataItemGlobal.getCurrentMode() != 170) {
            CameraStatUtil.trackVideoModeChanged(CameraSettings.VIDEO_SPEED_HFR);
            dataItemRunning.switchOff("pref_video_speed_fast_key");
            dataItemRunning.switchOff("pref_video_speed_slow_key");
            closeMutexElement(SupportedConfigFactory.CLOSE_BY_VIDEO, 239);
            changeMode(170);
            return;
        }
        dataItemRunning.switchOff("pref_video_speed_hfr_key");
        CameraStatUtil.trackVideoModeChanged("normal");
        changeMode(162);
    }

    public void configVideoSlow() {
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        if (getBaseModule().getModuleIndex() != 168) {
            CameraStatUtil.trackVideoModeChanged(CameraSettings.VIDEO_SPEED_SLOW);
            dataItemRunning.switchOff("pref_video_speed_fast_key");
            dataItemRunning.switchOff("pref_video_speed_hfr_key");
            closeMutexElement(SupportedConfigFactory.CLOSE_BY_VIDEO, 239);
            changeMode(168);
            updateTipMessage(4, R.string.hint_slow_motion, 2);
            return;
        }
        hideTipMessage(R.string.hint_slow_motion);
        dataItemRunning.switchOff("pref_video_speed_slow_key");
        CameraStatUtil.trackVideoModeChanged("normal");
        changeMode(162);
    }

    public void onConfigChanged(int i) {
        int[] iArr;
        if (isAlive()) {
            if (SupportedConfigFactory.isMutexConfig(i)) {
                DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
                boolean z = false;
                int i2 = 176;
                for (int i3 : SupportedConfigFactory.MUTEX_MENU_CONFIGS) {
                    if (i3 != i) {
                        if (i3 != 203) {
                            if (i3 != 206) {
                                if (i3 != 209) {
                                    if (!dataItemRunning.isSwitchOn(SupportedConfigFactory.getConfigKey(i3))) {
                                    }
                                } else if (CameraSettings.isUltraPixelOn()) {
                                    z = true;
                                }
                            } else if (CameraSettings.isLiveShotOn()) {
                                if (i == 209) {
                                    i2 = 176;
                                }
                            }
                            i2 = i3;
                        } else if (((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).isShowLightingView()) {
                            showOrHideLighting(false);
                        }
                    }
                }
                if (!z) {
                    if (i2 != 176) {
                        applyConfig(i2, 3);
                    }
                    applyConfig(i, 1);
                } else {
                    applyConfig(i, 1);
                    if (i2 != 176) {
                        applyConfig(i2, 3);
                    }
                }
            } else {
                applyConfig(i, 1);
            }
        }
    }

    public void onThermalNotification(int i) {
        if (isAlive()) {
            BaseModule baseModule = getBaseModule();
            if (baseModule == null || !baseModule.isFrameAvailable() || baseModule.isSelectingCapturedResult()) {
                Log.w(TAG, "onThermalNotification current module is null ready");
                return;
            }
            ComponentConfigFlash componentFlash = DataRepository.dataItemConfig().getComponentFlash();
            if (componentFlash.isEmpty() || !componentFlash.isHardwareSupported()) {
                Log.w(TAG, "onThermalNotification don't support hardware flash");
                return;
            }
            String str = "";
            if (ThermalDetector.thermalConstrained(i)) {
                Log.w(TAG, "thermalConstrained");
                str = "0";
            } else if (baseModule.isThermalThreshold() && ((i == 2 && CameraSettings.isFrontCamera()) || i == 3)) {
                Log.w(TAG, "recording time is up to thermal threshold");
                str = "0";
            }
            updateFlashModeAndRefreshUI(baseModule, str);
        }
    }

    public void reCheckBeauty() {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert != null && this.mActivity != null) {
            int moduleIndex = getBaseModule().getModuleIndex();
            if (moduleIndex == 162 && CameraSettings.isFaceBeautyOn(moduleIndex, null)) {
                topAlert.alertTopHint(0, R.string.video_beauty_tip, 3000);
            }
        }
    }

    public void reCheckFrontBokenTip() {
        if (DataRepository.dataItemFeature().gE() && ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)) != null && "on".equals(DataRepository.dataItemConfig().getComponentBokeh().getComponentValue(getBaseModule().getModuleIndex()))) {
            updateTipMessage(4, R.string.bokeh_use_hint, 2);
        }
    }

    public void reCheckHandGesture() {
        if (getBaseModule() != null && CameraSettings.isHandGestureOpen()) {
            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            if (topAlert != null) {
                topAlert.alertTopHint(0, (int) R.string.hand_gesture_tip);
            }
        }
    }

    public void reCheckLighting() {
        String componentValue = DataRepository.dataItemRunning().getComponentRunningLighting().getComponentValue(171);
        if (!componentValue.equals("0")) {
            ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
            if (!actionProcessing.isShowLightingView()) {
                actionProcessing.showOrHideLightingView();
            }
            setLighting(false, "0", componentValue, false);
        }
    }

    public void reCheckLiveShot() {
        BaseModule baseModule = getBaseModule();
        if (baseModule != null) {
            if ((baseModule.getModuleIndex() == 163 || baseModule.getModuleIndex() == 165) && DataRepository.dataItemFeature().fL()) {
                TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                if (topAlert != null && CameraSettings.isLiveShotOn()) {
                    topAlert.alertSwitchHint(1, (int) R.string.camera_liveshot_on_tip);
                }
            }
        }
    }

    public void reCheckMacroMode() {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert != null) {
            BaseModule baseModule = getBaseModule();
            if (baseModule != null && ((baseModule.getModuleIndex() == 163 || baseModule.getModuleIndex() == 162 || baseModule.getModuleIndex() == 165) && !topAlert.isExtraMenuShowing() && CameraSettings.isMacroModeEnabled(getBaseModule().getModuleIndex()))) {
                topAlert.alertTopHint(0, (int) R.string.macro_mode);
            }
        }
    }

    public void reCheckMutexConfigs(int i) {
        if (isAlive() && getBaseModule().isCreated()) {
            DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
            int[] iArr = SupportedConfigFactory.MUTEX_MENU_CONFIGS;
            int length = iArr.length;
            for (int i2 = 0; i2 < length; i2++) {
                int i3 = iArr[i2];
                if (i3 != 203) {
                    if (i3 != 209 && dataItemRunning.isSwitchOn(SupportedConfigFactory.getConfigKey(i3))) {
                        applyConfig(i3, 2);
                    }
                } else if (dataItemRunning.getComponentRunningLighting().isSwitchOn(i)) {
                    reCheckLighting();
                }
            }
        }
    }

    public void reCheckUltraPixel() {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (!(topAlert == null || this.mActivity == null || getBaseModule() == null || !CameraSettings.isUltraPixelOn())) {
            topAlert.alertTopHint(0, DataRepository.dataItemRunning().getComponentUltraPixel().getUltraPixelOpenTip());
        }
    }

    public void reCheckVideoUltraClearTip() {
        int moduleIndex = getBaseModule().getModuleIndex();
        if (moduleIndex == 162 || moduleIndex == 169) {
            CameraSize videoSize = ((VideoModule) getBaseModule()).getVideoSize();
            if (is4KQuality(videoSize.width, videoSize.height)) {
                TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                if (topAlert != null && !topAlert.isExtraMenuShowing()) {
                    topAlert.alertVideoUltraClear(0, R.string.video_ultra_clear_tip);
                }
            }
        }
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(164, this);
    }

    public void restoreAllMutexElement(String str) {
        if (this.mRecordingClosedElements != null) {
            int[] iArr = new int[this.mRecordingClosedElements.length];
            for (int i = 0; i < this.mRecordingClosedElements.length; i++) {
                switch (this.mRecordingClosedElements[i]) {
                    case 193:
                        updateComponentFlash(null, false);
                        iArr[i] = 10;
                        break;
                    case 194:
                        updateComponentHdr(false);
                        iArr[i] = 11;
                        break;
                    case 196:
                        updateComponentFilter(false);
                        iArr[i] = 2;
                        break;
                    case 201:
                        updateAiScene(false);
                        iArr[i] = 36;
                        break;
                    case 206:
                        updateLiveShot(false);
                        if (str != SupportedConfigFactory.CLOSE_BY_ULTRA_PIXEL && str != SupportedConfigFactory.CLOSE_BY_SQUARE) {
                            iArr[i] = 49;
                            break;
                        } else {
                            iArr[i] = 50;
                            break;
                        }
                    case 209:
                        updateUltraPixel(false);
                        iArr[i] = 50;
                        break;
                    case 212:
                        updateComponentShine(false);
                        iArr[i] = 2;
                        break;
                    case 239:
                        updateComponentBeauty(false);
                        iArr[i] = 13;
                        break;
                    case 253:
                        updateAutoZoom(false);
                        iArr[i] = 51;
                        break;
                    case 254:
                        updateEyeLight(false);
                        iArr[i] = 45;
                        break;
                    default:
                        throw new RuntimeException("unknown mutex element");
                }
            }
            this.mRecordingClosedElements = null;
            getBaseModule().updatePreferenceInWorkThread(iArr);
        }
    }

    public void restoreMutexFlash(String str) {
        if (DataRepository.dataItemConfig().getComponentFlash().isClosed()) {
            updateComponentFlash(str, false);
            getBaseModule().updatePreferenceInWorkThread(10);
        }
    }

    public void setEyeLight(String str) {
        getBaseModule().updatePreferenceInWorkThread(45);
    }

    public void setFilter(int i) {
        EffectController.getInstance().setInvertFlag(0);
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (CameraSettings.isGroupShotOn()) {
            ((ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164)).configGroupSwitch(4);
            topAlert.refreshExtraMenu();
        }
        FilterProtocol filterProtocol = (FilterProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(165);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setFilter: filterId = ");
        sb.append(i);
        sb.append(", FilterProtocol = ");
        sb.append(filterProtocol);
        Log.d(str, sb.toString());
        if (filterProtocol != null) {
            filterProtocol.onFilterChanged(FilterInfo.getCategory(i), FilterInfo.getIndex(i));
        }
        topAlert.updateConfigItem(212);
        if (CameraSettings.isUltraPixelFront32MPOn()) {
            configSwitchUltraPixel(3);
        }
    }

    public void setLighting(boolean z, String str, String str2, boolean z2) {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        VerticalProtocol verticalProtocol = (VerticalProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(198);
        if (str.equals("0") || str2.equals("0")) {
            topAlert.updateConfigItem(203);
            MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
            ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
            if (str2.equals("0")) {
                if (!z) {
                    topAlert.alertLightingTitle(true);
                }
                mainContentProtocol.lightingCancel();
            } else {
                topAlert.alertLightingTitle(false);
                mainContentProtocol.lightingStart();
                actionProcessing.setLightingViewStatus(true);
            }
        }
        bottomPopupTips.setLightingPattern(str2);
        verticalProtocol.setLightingPattern(str2);
        if (str2 == "0") {
            topAlert.alertLightingHint(-1);
            verticalProtocol.alertLightingHint(-1);
        }
        getBaseModule().updatePreferenceInWorkThread(43);
        if (z2) {
            CameraStatUtil.trackLightingChanged(171, str2);
        }
    }

    public void showCloseTip(int i, boolean z) {
        ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).showCloseTip(i, z);
    }

    public void showOrHideFilter() {
        if (((BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160)) != null) {
            ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
            boolean isShowLightingView = actionProcessing.isShowLightingView();
            boolean showOrHideFilterView = actionProcessing.showOrHideFilterView();
            BokehFNumberController bokehFNumberController = (BokehFNumberController) ModeCoordinatorImpl.getInstance().getAttachProtocol(210);
            BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
            if (showOrHideFilterView && isShowLightingView) {
                String componentValue = DataRepository.dataItemRunning().getComponentRunningLighting().getComponentValue(171);
                DataRepository.dataItemRunning().getComponentRunningLighting().setComponentValue(171, "0");
                setLighting(true, componentValue, "0", false);
                if (bottomPopupTips != null) {
                    bottomPopupTips.reInitTipImage();
                }
            }
            if (showOrHideFilterView && bokehFNumberController != null && DataRepository.dataItemGlobal().getCurrentMode() == 171) {
                bokehFNumberController.showFNumberPanel(true);
            }
            BottomPopupTips bottomPopupTips2 = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
            MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
            if (bottomPopupTips2 != null) {
                if (showOrHideFilterView) {
                    bottomPopupTips2.updateLeftTipImage();
                } else if (miBeautyProtocol == null || !miBeautyProtocol.isBeautyPanelShow()) {
                    bottomPopupTips2.updateLeftTipImage();
                }
            }
        }
    }

    public void showOrHideLighting(boolean z) {
        beautyMutexHandle();
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate != null) {
            boolean showOrHideLightingView = ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).showOrHideLightingView();
            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
            BokehFNumberController bokehFNumberController = (BokehFNumberController) ModeCoordinatorImpl.getInstance().getAttachProtocol(210);
            if (showOrHideLightingView) {
                reCheckLighting();
                DataRepository.dataItemRunning().getComponentConfigFilter().reset(getBaseModule().getModuleIndex());
                setFilter(FilterInfo.FILTER_ID_NONE);
                topAlert.alertLightingTitle(true);
                if (bokehFNumberController != null) {
                    bokehFNumberController.hideFNumberPanel(true, true);
                }
                bottomPopupTips.directHideTipImage();
                topAlert.refreshExtraMenu();
            } else {
                String componentValue = DataRepository.dataItemRunning().getComponentRunningLighting().getComponentValue(171);
                DataRepository.dataItemRunning().getComponentRunningLighting().setComponentValue(171, "0");
                setLighting(true, componentValue, "0", false);
                bottomPopupTips.reInitTipImage();
                topAlert.alertLightingTitle(false);
                if (bokehFNumberController != null) {
                    bokehFNumberController.showFNumberPanel(true);
                }
            }
            if (baseDelegate.getActiveFragment(R.id.bottom_action) == 251) {
                baseDelegate.delegateEvent(7);
            }
            if (z) {
                CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_LIGHTING_BUTTON);
            }
            BottomPopupTips bottomPopupTips2 = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
            if (bottomPopupTips2 != null) {
                if (showOrHideLightingView) {
                    bottomPopupTips2.showCloseTip(2, true);
                } else {
                    bottomPopupTips2.updateLeftTipImage();
                }
            }
        }
    }

    public void showOrHideShine() {
        boolean z;
        int moduleIndex = getBaseModule().getModuleIndex();
        boolean z2 = true;
        if (moduleIndex == 162) {
            z = false;
        } else if (moduleIndex != 169) {
            MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
            if (miBeautyProtocol != null && miBeautyProtocol.isBeautyPanelShow()) {
                z2 = false;
            }
            if (z2) {
                BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                if (bottomPopupTips != null) {
                    bottomPopupTips.directlyHideTips();
                    bottomPopupTips.setPortraitHintVisible(8);
                    bottomPopupTips.hideTipImage();
                    bottomPopupTips.hideLeftTipImage();
                    bottomPopupTips.hideSpeedTipImage();
                    bottomPopupTips.hideCenterTipImage();
                }
                DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
                if (dualController != null) {
                    dualController.hideZoomButton();
                    if (moduleIndex != 171) {
                        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                        if (topAlert != null) {
                            topAlert.alertUpdateValue(2);
                        }
                    }
                }
                if (moduleIndex == 167) {
                    ManuallyAdjust manuallyAdjust = (ManuallyAdjust) ModeCoordinatorImpl.getInstance().getAttachProtocol(181);
                    if (manuallyAdjust != null) {
                        manuallyAdjust.setManuallyLayoutVisible(false);
                    }
                } else if (moduleIndex == 171) {
                    BokehFNumberController bokehFNumberController = (BokehFNumberController) ModeCoordinatorImpl.getInstance().getAttachProtocol(210);
                    if (bokehFNumberController != null && bokehFNumberController.isFNumberVisible()) {
                        bokehFNumberController.hideFNumberPanel(false, false);
                    }
                }
                ((BottomMenuProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(197)).expandShineBottomMenu(DataRepository.dataItemRunning().getComponentRunningShine());
                if (miBeautyProtocol != null) {
                    miBeautyProtocol.show();
                } else {
                    BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
                    if (baseDelegate != null) {
                        baseDelegate.delegateEvent(2);
                    }
                }
            } else {
                miBeautyProtocol.dismiss(2);
            }
            return;
        } else {
            closeVideoFast();
            z = true;
        }
        boolean isFaceBeautyOn = true ^ CameraSettings.isFaceBeautyOn(moduleIndex, null);
        ComponentRunningShine componentRunningShine = DataRepository.dataItemRunning().getComponentRunningShine();
        if (isFaceBeautyOn) {
            DataRepository.dataItemConfig().getComponentConfigBeauty().setClosed(false, moduleIndex);
            if (CameraSettings.isAutoZoomEnabled(moduleIndex)) {
                CameraSettings.setAutoZoomEnabled(moduleIndex, false);
                BottomPopupTips bottomPopupTips2 = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                bottomPopupTips2.updateLeftTipImage();
                bottomPopupTips2.updateTipImage();
                ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).hideSwitchHint();
            }
            ComponentRunningMacroMode componentRunningMacroMode = DataRepository.dataItemRunning().getComponentRunningMacroMode();
            if (componentRunningMacroMode.isSwitchOn(moduleIndex)) {
                HybridZoomingSystem.clearZoomRatioHistory();
                componentRunningMacroMode.setSwitchOff(moduleIndex);
                hideTipMessage(R.string.macro_mode_tip);
            }
            if (componentRunningShine.supportBeautyLevel()) {
                CameraSettings.setFaceBeautyLevel(3);
            } else if (componentRunningShine.supportSmoothLevel()) {
                CameraSettings.setFaceBeautySmoothLevel(40);
            }
        } else if (componentRunningShine.supportBeautyLevel()) {
            CameraSettings.setFaceBeautyLevel(0);
        } else if (componentRunningShine.supportSmoothLevel()) {
            CameraSettings.setFaceBeautySmoothLevel(0);
        }
        if (z) {
            changeMode(162);
        } else {
            OnFaceBeautyChangedProtocol onFaceBeautyChangedProtocol = (OnFaceBeautyChangedProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(199);
            if (onFaceBeautyChangedProtocol != null) {
                onFaceBeautyChangedProtocol.onBeautyChanged(false);
            }
        }
    }

    public void showSetting() {
        ActivityBase activityBase = this.mActivity;
        if (activityBase != null) {
            Intent intent = new Intent();
            intent.setClass(activityBase, CameraPreferenceActivity.class);
            intent.putExtra(BasePreferenceActivity.FROM_WHERE, DataRepository.dataItemGlobal().getCurrentMode());
            if (DataRepository.dataItemGlobal().getIntentType() == 1) {
                intent.putExtra(CameraPreferenceActivity.IS_IMAGE_CAPTURE_INTENT, true);
            }
            intent.putExtra(":miui:starting_window_label", activityBase.getResources().getString(R.string.pref_camera_settings_category));
            if (activityBase.startFromKeyguard()) {
                intent.putExtra("StartActivityWhenLocked", true);
            }
            activityBase.getIntent().removeExtra(CameraIntentManager.EXTRAS_CAMERA_FACING);
            activityBase.startActivity(intent);
            activityBase.setJumpFlag(2);
            trackGotoSettings();
        }
    }

    public void unRegisterProtocol() {
        this.mActivity = null;
        ModeCoordinatorImpl.getInstance().detachProtocol(164, this);
    }
}
