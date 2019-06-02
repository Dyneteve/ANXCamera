package com.android.camera.module.loader;

import android.graphics.Rect;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.LocationManager;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.module.BaseModule;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.MainContentProtocol;
import io.reactivex.Scheduler;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.annotations.NonNull;

public class FunctionUISetup extends Func1Base<BaseModule, BaseModule> {
    private boolean mNeedNotifyUI;

    public FunctionUISetup(int i, boolean z) {
        super(i);
        this.mNeedNotifyUI = z;
    }

    public NullHolder<BaseModule> apply(@NonNull NullHolder<BaseModule> nullHolder) throws Exception {
        if (!nullHolder.isPresent()) {
            return nullHolder;
        }
        BaseModule baseModule = (BaseModule) nullHolder.get();
        if (baseModule.isDeparted()) {
            return NullHolder.ofNullable(baseModule, 225);
        }
        if (!baseModule.isCreated()) {
            return nullHolder;
        }
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        int i = this.mTargetMode;
        int i2 = 3;
        if (i != 163) {
            if (i == 171 && !baseModule.getActivity().isNewBieAlive(1) && dataItemGlobal.isNormalIntent() && dataItemGlobal.getBoolean("pref_camera_first_portrait_use_hint_shown_key", true)) {
                baseModule.getActivity().showNewBie(1);
                dataItemGlobal.editor().putBoolean("pref_camera_first_portrait_use_hint_shown_key", false).apply();
            }
        } else if (DataRepository.dataItemFeature().isSupportUltraWide()) {
            if (!baseModule.getActivity().isNewBieAlive(4) && dataItemGlobal.getBoolean("pref_camera_first_ultra_wide_use_hint_shown_key", true)) {
                baseModule.getActivity().showNewBie(4);
            }
        } else if (!baseModule.getActivity().isNewBieAlive(3) && dataItemGlobal.getBoolean("pref_camera_first_ai_scene_use_hint_shown_key", true) && DataRepository.dataItemFeature().fj()) {
            baseModule.getActivity().showNewBie(3);
        }
        Rect previewRect = Util.getPreviewRect(CameraAppImpl.getAndroidContext());
        baseModule.onPreviewLayoutChanged(previewRect);
        baseModule.onPreviewSizeChanged(previewRect.width(), previewRect.height());
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        int lastCameraId = DataRepository.dataItemGlobal().getLastCameraId();
        int currentCameraId = DataRepository.dataItemGlobal().getCurrentCameraId();
        int uiStyle = DataRepository.dataItemRunning().getUiStyle();
        if (lastCameraId != currentCameraId) {
            i2 = 2;
        } else if (DataRepository.dataItemRunning().getLastUiStyle() == uiStyle) {
            i2 = 1;
        }
        baseModule.setDisplayRectAndUIStyle(previewRect, uiStyle);
        if (this.mNeedNotifyUI && baseDelegate != null) {
            baseDelegate.getAnimationComposite().notifyDataChanged(i2, this.mTargetMode);
        }
        LocationManager.instance().recordLocation(CameraSettings.isRecordLocation());
        CameraSize previewSize = baseModule.getPreviewSize();
        if (previewSize != null) {
            ((MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166)).setPreviewAspectRatio(CameraSettings.getPreviewAspectRatio(previewSize.width, previewSize.height));
        }
        return nullHolder;
    }

    public Scheduler getWorkThread() {
        return AndroidSchedulers.mainThread();
    }
}
