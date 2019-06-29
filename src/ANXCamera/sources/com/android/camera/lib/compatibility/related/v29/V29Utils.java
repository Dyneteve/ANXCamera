package com.android.camera.lib.compatibility.related.v29;

import android.content.Context;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.params.HighSpeedVideoConfiguration;
import android.hardware.camera2.params.ReprocessFormatsMap;
import android.hardware.camera2.params.StreamConfiguration;
import android.hardware.camera2.params.StreamConfigurationDuration;
import android.hardware.camera2.params.StreamConfigurationMap;
import android.view.IWindowManager;
import java.util.List;

public class V29Utils {
    private static final String TAG = "V29Utils";

    public static StreamConfigurationMap createStreamConfigMap(List<StreamConfiguration> list, CameraCharacteristics cameraCharacteristics) {
        StreamConfigurationMap streamConfigurationMap = new StreamConfigurationMap((StreamConfiguration[]) list.toArray(new StreamConfiguration[0]), (StreamConfigurationDuration[]) cameraCharacteristics.get(CameraCharacteristics.SCALER_AVAILABLE_MIN_FRAME_DURATIONS), (StreamConfigurationDuration[]) cameraCharacteristics.get(CameraCharacteristics.SCALER_AVAILABLE_STALL_DURATIONS), (StreamConfiguration[]) cameraCharacteristics.get(CameraCharacteristics.DEPTH_AVAILABLE_DEPTH_STREAM_CONFIGURATIONS), (StreamConfigurationDuration[]) cameraCharacteristics.get(CameraCharacteristics.DEPTH_AVAILABLE_DEPTH_MIN_FRAME_DURATIONS), (StreamConfigurationDuration[]) cameraCharacteristics.get(CameraCharacteristics.DEPTH_AVAILABLE_DEPTH_STALL_DURATIONS), (HighSpeedVideoConfiguration[]) cameraCharacteristics.get(CameraCharacteristics.CONTROL_AVAILABLE_HIGH_SPEED_VIDEO_CONFIGURATIONS), (ReprocessFormatsMap) cameraCharacteristics.get(CameraCharacteristics.SCALER_AVAILABLE_INPUT_OUTPUT_FORMATS_MAP), true);
        return streamConfigurationMap;
    }

    public static boolean hasNavigationBar(Context context, IWindowManager iWindowManager) {
        try {
            return iWindowManager.hasNavigationBar();
        } catch (Exception e) {
            return false;
        }
    }
}
