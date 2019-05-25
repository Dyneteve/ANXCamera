package com.android.camera.module.impl.component;

import com.android.camera.ActivityBase;
import com.android.camera.CameraSettings;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.BackStack;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.MainContentProtocol;
import com.android.camera.protocol.ModeProtocol.MimojiAvatarEngine;
import com.android.camera.protocol.ModeProtocol.PanoramaProtocol;
import com.android.camera.protocol.ModeProtocol.RecordState;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.protocol.ModeProtocol.WideSelfieProtocol;
import com.oneplus.camera.R;

public class RecordingStateChangeImpl implements RecordState {
    private static final String TAG = "RecordingState";
    private ActivityBase mActivity;

    public RecordingStateChangeImpl(ActivityBase activityBase) {
        this.mActivity = activityBase;
    }

    public static RecordingStateChangeImpl create(ActivityBase activityBase) {
        return new RecordingStateChangeImpl(activityBase);
    }

    private int getCurrentModuleIndex() {
        ActivityBase activityBase = this.mActivity;
        if (activityBase == null) {
            return 160;
        }
        return activityBase.getCurrentModuleIndex();
    }

    private boolean isFPS960() {
        if (getCurrentModuleIndex() != 172 || !DataRepository.dataItemFeature().fB()) {
            return false;
        }
        return DataRepository.dataItemConfig().getComponentConfigSlowMotion().isSlowMotionFps960();
    }

    public void onFailed() {
        Log.d(TAG, "onFailed");
        onFinish();
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingFailed();
    }

    public void onFinish() {
        Log.d(TAG, "onFinish");
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        topAlert.showConfigMenu();
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        bottomPopupTips.reInitTipImage();
        if (!HybridZoomingSystem.IS_3_OR_MORE_SAT) {
            bottomPopupTips.reConfigBottomTipOfUltraWide();
        }
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingFinish();
        if (getCurrentModuleIndex() != 174) {
            topAlert.setRecordingTimeState(2);
            return;
        }
        topAlert.enableMenuItem(true, 225, 245);
        topAlert.alertMusicClose(true);
    }

    public void onMimojiCreateBack() {
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingMimojiBack();
        ((MimojiAvatarEngine) ModeCoordinatorImpl.getInstance().getAttachProtocol(217)).backToPreview(false);
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        topAlert.showConfigMenu();
        topAlert.showOrHideMimojiCreateTitle(false);
        topAlert.enableMenuItem(true, 225, 193);
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        bottomPopupTips.reInitTipImage();
        bottomPopupTips.directlyHideTips();
        ((MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166)).mimojiEnd();
    }

    public void onPause() {
        Log.d(TAG, "onPause");
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingPause();
        if (getCurrentModuleIndex() != 174) {
            topAlert.setRecordingTimeState(3);
            return;
        }
        ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).reInitTipImage();
        topAlert.disableMenuItem(true, 225, 245);
        topAlert.showConfigMenu();
    }

    public void onPostPreview() {
        Log.d(TAG, "onPostPreview");
        ((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromShutter();
        ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).hideConfigMenu();
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingWorkspace(false);
    }

    public void onPostPreviewBack() {
        Log.d(TAG, "onPostPreviewBack");
        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        if (getCurrentModuleIndex() != 177) {
            actionProcessing.processingWorkspace(true);
        } else {
            actionProcessing.processingFinish();
        }
        ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).reInitTipImage();
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        topAlert.enableMenuItem(true, 225, 245);
        topAlert.showConfigMenu();
    }

    public void onPostSavingFinish() {
        Log.d(TAG, "onPostSavingFinish");
        int currentModuleIndex = getCurrentModuleIndex();
        if (currentModuleIndex == 166) {
            PanoramaProtocol panoramaProtocol = (PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
            if (panoramaProtocol != null) {
                Log.d(TAG, "onPostExecute setDisplayPreviewBitmap null");
                panoramaProtocol.setDisplayPreviewBitmap(null);
                panoramaProtocol.showSmallPreview(false);
            }
        } else if (currentModuleIndex != 176) {
            ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
            if (actionProcessing != null) {
                actionProcessing.processingFinish();
            }
        } else {
            WideSelfieProtocol wideSelfieProtocol = (WideSelfieProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(216);
            if (wideSelfieProtocol != null) {
                wideSelfieProtocol.updatePreviewBitmap(null, null, null);
            }
        }
    }

    public void onPostSavingStart() {
        Log.d(TAG, "onPostSaving");
        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        topAlert.showConfigMenu();
        ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).reInitTipImage();
        int currentModuleIndex = getCurrentModuleIndex();
        if (currentModuleIndex == 166) {
            actionProcessing.processingFinish();
            actionProcessing.updateLoading(false);
            if (DataRepository.dataItemFeature().fV()) {
                DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
                if (dualController != null) {
                    dualController.showZoomButton();
                    if (topAlert != null) {
                        topAlert.clearAlertStatus();
                    }
                }
            }
            ((PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).resetShootUI();
        } else if (currentModuleIndex != 173) {
            switch (currentModuleIndex) {
                case 176:
                    actionProcessing.processingFinish();
                    actionProcessing.updateLoading(false);
                    ((WideSelfieProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(216)).resetShootUI();
                    return;
                case 177:
                    return;
                default:
                    topAlert.setRecordingTimeState(2);
                    actionProcessing.processingPostAction();
                    return;
            }
        } else {
            actionProcessing.processingPostAction();
            DualController dualController2 = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
            if (dualController2 != null) {
                dualController2.showZoomButton();
                if (topAlert != null) {
                    topAlert.clearAlertStatus();
                }
            }
            BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
            if (bottomPopupTips != null) {
                bottomPopupTips.hideTipImage();
            }
        }
    }

    public void onPrepare() {
        ((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromShutter();
        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        actionProcessing.processingPrepare();
        if (actionProcessing.isShowFilterView()) {
            actionProcessing.showOrHideFilterView();
        }
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        topAlert.hideConfigMenu();
        int currentModuleIndex = getCurrentModuleIndex();
        if (currentModuleIndex == 166) {
            ((PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).setShootUI();
            if (DataRepository.dataItemFeature().fV()) {
                DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
                if (dualController != null) {
                    dualController.hideZoomButton();
                    if (topAlert != null) {
                        topAlert.alertUpdateValue(2);
                    }
                }
            }
        } else if (currentModuleIndex != 176) {
            switch (currentModuleIndex) {
                case 173:
                case 174:
                    break;
                default:
                    if (!isFPS960()) {
                        topAlert.setRecordingTimeState(1);
                        break;
                    }
                    break;
            }
        } else {
            MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
            if (mainContentProtocol != null) {
                mainContentProtocol.clearIndicator(1);
            }
            WideSelfieProtocol wideSelfieProtocol = (WideSelfieProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(216);
            if (wideSelfieProtocol != null) {
                wideSelfieProtocol.setShootingUI();
            }
        }
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        bottomPopupTips.hideTipImage();
        bottomPopupTips.hideLeftTipImage();
        bottomPopupTips.hideSpeedTipImage();
        bottomPopupTips.hideCenterTipImage();
        if (HybridZoomingSystem.IS_3_OR_MORE_SAT) {
            if (HybridZoomingSystem.toFloat(HybridZoomingSystem.getZoomRatioHistory(getCurrentModuleIndex(), "1.0"), 1.0f) < 1.0f) {
                bottomPopupTips.directlyHideTips();
            }
        } else if (CameraSettings.isUltraWideConfigOpen(getCurrentModuleIndex())) {
            bottomPopupTips.directlyHideTips();
        }
        if (CameraSettings.isFPS960(getCurrentModuleIndex())) {
            bottomPopupTips.directlyHideTips();
        }
    }

    public void onResume() {
        Log.d(TAG, "onResume");
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingResume();
        if (getCurrentModuleIndex() != 174) {
            topAlert.setRecordingTimeState(4);
            return;
        }
        topAlert.hideConfigMenu();
        BackStack backStack = (BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171);
        if (backStack != null) {
            backStack.handleBackStackFromShutter();
        }
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        bottomPopupTips.hideTipImage();
        bottomPopupTips.hideLeftTipImage();
        bottomPopupTips.hideSpeedTipImage();
        bottomPopupTips.hideCenterTipImage();
    }

    public void onStart() {
        Log.d(TAG, "onStart");
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingStart();
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        int currentModuleIndex = getCurrentModuleIndex();
        if (currentModuleIndex == 174) {
            topAlert.alertMusicClose(false);
        } else if (currentModuleIndex == 176) {
            WideSelfieProtocol wideSelfieProtocol = (WideSelfieProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(216);
            if (wideSelfieProtocol != null) {
                wideSelfieProtocol.updateHintText(R.string.wideselfie_rotate_slowly);
            }
        }
    }

    public void prepareCreateMimoji() {
        ((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromShutter();
        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        actionProcessing.processingMimojiPrepare();
        if (actionProcessing.isShowFilterView()) {
            actionProcessing.showOrHideFilterView();
        }
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        topAlert.hideConfigMenu();
        topAlert.showOrHideMimojiCreateTitle(true);
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        bottomPopupTips.hideTipImage();
        bottomPopupTips.hideLeftTipImage();
        bottomPopupTips.hideSpeedTipImage();
        bottomPopupTips.hideCenterTipImage();
        bottomPopupTips.directlyHideTips();
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(212, this);
    }

    public void unRegisterProtocol() {
        this.mActivity = null;
        ModeCoordinatorImpl.getInstance().detachProtocol(212, this);
    }
}
