package com.xiaomi.camera.imagecodec;

import android.content.Context;
import android.content.res.Resources.NotFoundException;
import android.util.Log;
import com.xiaomi.camera.imagecodec.impl.HardwareCodecReprocessor;
import com.xiaomi.camera.imagecodec.impl.SoftwareCodecReprocessor;
import com.xiaomi.camera.imagecodec.impl.VirtualCameraReprocessor;

public class ReprocessorFactory {
    private static final String TAG = "ReprocessorFactory";
    private static ReprocessingType sReprocessorType = null;

    public enum ReprocessingType {
        VIRTUAL_CAMERA,
        HARDWARE_CODEC,
        SOFTWARE_CODEC
    }

    private ReprocessorFactory() {
    }

    public static synchronized Reprocessor getReprocessor() {
        synchronized (ReprocessorFactory.class) {
            if (sReprocessorType != null) {
                switch (sReprocessorType) {
                    case HARDWARE_CODEC:
                        Reprocessor reprocessor = (Reprocessor) HardwareCodecReprocessor.sInstance.get();
                        return reprocessor;
                    case SOFTWARE_CODEC:
                        Reprocessor reprocessor2 = (Reprocessor) SoftwareCodecReprocessor.sInstance.get();
                        return reprocessor2;
                    default:
                        Reprocessor reprocessor3 = (Reprocessor) VirtualCameraReprocessor.sInstance.get();
                        return reprocessor3;
                }
            }
            throw new IllegalStateException("The global reprocessingType is not defined yet, make sure #setPreferredReprocessingType is called");
        }
    }

    public static synchronized void setPreferredReprocessorType(Context context) {
        ReprocessingType reprocessingType;
        synchronized (ReprocessorFactory.class) {
            ReprocessingType reprocessingType2 = ReprocessingType.VIRTUAL_CAMERA;
            try {
                reprocessingType = ReprocessingType.values()[context.getResources().getInteger(R.integer.preferred_image_reprocessor_type)];
            } catch (NotFoundException | ArrayIndexOutOfBoundsException e) {
                Log.d(TAG, "Failed to find the preferred reprocessor, use default (VIRTUAL_CAMERA) instead", e);
                reprocessingType = reprocessingType2;
            }
            if (sReprocessorType == null) {
                sReprocessorType = reprocessingType;
            } else if (sReprocessorType != reprocessingType) {
                throw new IllegalStateException("The type of preferred reprocessor is not allowed to be changed.");
            }
        }
    }
}
