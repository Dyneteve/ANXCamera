package com.android.camera.fragment.beauty;

import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MiBeautyProtocol;
import com.android.camera.protocol.ModeProtocol.OnFaceBeautyChangedProtocol;

public class BeautyHelper {
    public static void clearBeauty() {
        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
        if (miBeautyProtocol != null) {
            miBeautyProtocol.clearBeauty();
        }
    }

    public static void onBeautyChanged() {
        OnFaceBeautyChangedProtocol onFaceBeautyChangedProtocol = (OnFaceBeautyChangedProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(199);
        if (onFaceBeautyChangedProtocol != null) {
            onFaceBeautyChangedProtocol.onBeautyChanged(false);
        }
    }

    public static void resetBeauty() {
        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
        if (miBeautyProtocol != null) {
            miBeautyProtocol.resetBeauty();
        }
    }
}
