package com.android.camera2;

import android.annotation.TargetApi;
import android.graphics.Rect;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraCharacteristics.Key;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.params.HighSpeedVideoConfiguration;
import android.hardware.camera2.params.ReprocessFormatsMap;
import android.hardware.camera2.params.StreamConfiguration;
import android.hardware.camera2.params.StreamConfigurationDuration;
import android.hardware.camera2.params.StreamConfigurationMap;
import android.util.Range;
import android.util.Rational;
import android.util.Size;
import android.util.SizeF;
import android.util.SparseArray;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.Util;
import com.android.camera.constant.DurationConstant;
import com.android.camera.constant.MiCameraCharacteristics;
import com.android.camera.constant.MiCaptureResult;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera2.compat.MiCameraCompat;
import com.android.camera2.compat.MiCameraCompatBaseImpl;
import com.mi.config.b;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@TargetApi(21)
public class CameraCapabilities {
    public static final int CAMERA_ILLEGALSTATE_EXCEPTION = 256;
    private static final float DEFAULT_VIEW_ANGLE = 51.5f;
    private static final int HAL_PIXEL_FORMAT_BLOB = 33;
    /* access modifiers changed from: private */
    public static final Key<StreamConfiguration[]> LIMIT_STREAM_CONFIGURATIONS = MiCameraCharacteristics.SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS;
    private static final Key<Rect> QCFA_ACTIVE_ARRAY_SIZE = new Key<>("org.codeaurora.qcamera3.quadra_cfa.activeArraySize", Rect.class);
    /* access modifiers changed from: private */
    public static final Key<StreamConfiguration[]> QCFA_STREAM_CONFIGURATIONS = new Key<>("org.codeaurora.qcamera3.quadra_cfa.availableStreamConfigurations", StreamConfiguration[].class);
    public static final int SESSION_OPERATION_MODE_ALGO_UP_DUAL_BOKEH = 36864;
    public static final int SESSION_OPERATION_MODE_ALGO_UP_HD = 36868;
    public static final int SESSION_OPERATION_MODE_ALGO_UP_NORMAL = 36869;
    public static final int SESSION_OPERATION_MODE_ALGO_UP_QCFA = 36865;
    public static final int SESSION_OPERATION_MODE_ALGO_UP_SAT = 36866;
    public static final int SESSION_OPERATION_MODE_ALGO_UP_SINGLE_BOKEH = 36867;
    public static final int SESSION_OPERATION_MODE_AUTO_ZOOM = 33012;
    public static final int SESSION_OPERATION_MODE_FOVC = 61456;
    public static final int SESSION_OPERATION_MODE_FRONT_PORTRAIT = 33009;
    public static final int SESSION_OPERATION_MODE_HFR_120 = 32888;
    public static final int SESSION_OPERATION_MODE_HSR_60 = 32828;
    public static final int SESSION_OPERATION_MODE_MANUAL = 32771;
    public static final int SESSION_OPERATION_MODE_MCTF = 32816;
    public static final int SESSION_OPERATION_MODE_MIMOJI = 32779;
    public static final int SESSION_OPERATION_MODE_MIUI_BACK = 32769;
    public static final int SESSION_OPERATION_MODE_MIUI_FRONT = 32773;
    public static final int SESSION_OPERATION_MODE_NORMAL = 0;
    public static final int SESSION_OPERATION_MODE_NORMAL_ULTRA_PIXEL_PHOTOGRAPHY = 33011;
    public static final int SESSION_OPERATION_MODE_PANORMA = 32776;
    public static final int SESSION_OPERATION_MODE_PORTRAIT = 32770;
    public static final int SESSION_OPERATION_MODE_PROFESSIONAL_ULTRA_PIXEL_PHOTOGRAPHY = 33013;
    public static final int SESSION_OPERATION_MODE_QCFA = 32775;
    public static final int SESSION_OPERATION_MODE_SUPER_NIGHT = 32778;
    public static final int SESSION_OPERATION_MODE_VIDEO = 32772;
    public static final int SESSION_OPERATION_MODE_VIDEO_BEAUTY = 32777;
    private static final String TAG = CameraCapabilities.class.getSimpleName();
    public static final int ULTRA_PIXEL_FRONT_32M = 32275200;
    public static final int ULTRA_PIXEL_REAR_48M = 48000000;
    public static final Map<Integer, Size> ULTRA_PIXEL_SIZE_LIST = new HashMap<Integer, Size>() {
        {
            put(Integer.valueOf(CameraCapabilities.ULTRA_PIXEL_FRONT_32M), new Size(6560, 4920));
            put(Integer.valueOf(CameraCapabilities.ULTRA_PIXEL_REAR_48M), new Size(BaseModule.LENS_DIRTY_DETECT_HINT_DURATION, DurationConstant.DURATION_LANDSCAPE_HINT));
        }
    };
    private static final List<Key<StreamConfiguration[]>> ULTRA_PIXEL_STREAM_CONFIGURATIONS_VENDOR_KEYS = new ArrayList<Key<StreamConfiguration[]>>(3) {
        {
            add(CameraCapabilities.QCFA_STREAM_CONFIGURATIONS);
            add(CameraCapabilities.LIMIT_STREAM_CONFIGURATIONS);
            add(MiCameraCharacteristics.XIAOMI_SCALER_AVAILABLE_SR_STREAM_CONFIGURATIONS);
        }
    };
    private final int mCameraId;
    private final HashSet<String> mCaptureRequestVendorKeys;
    private final CameraCharacteristics mCharacteristics;
    private int mOperatingMode;
    private SparseArray<StreamConfigurationMap> mStreamConfigurationMap;

    @Retention(RetentionPolicy.SOURCE)
    public @interface OperatingMode {
    }

    public CameraCapabilities(CameraCharacteristics cameraCharacteristics, int i) {
        if (cameraCharacteristics != null) {
            this.mCharacteristics = cameraCharacteristics;
            this.mCameraId = i;
            if (((Integer) this.mCharacteristics.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL)).intValue() == 2) {
                this.mCaptureRequestVendorKeys = new HashSet<>();
                return;
            }
            ArrayList<CaptureRequest.Key> allVendorKeys = this.mCharacteristics.getNativeCopy().getAllVendorKeys(CaptureRequest.Key.class);
            this.mCaptureRequestVendorKeys = new HashSet<>(allVendorKeys.size());
            for (CaptureRequest.Key name : allVendorKeys) {
                this.mCaptureRequestVendorKeys.add(name.getName());
            }
            return;
        }
        throw new IllegalArgumentException("Null CameraCharacteristics");
    }

    private void addStreamConfigurationToList(List<StreamConfiguration> list, Key<StreamConfiguration[]> key) {
        StreamConfiguration[] streamConfigurationArr = (StreamConfiguration[]) this.mCharacteristics.get(key);
        if (streamConfigurationArr != null) {
            list.addAll(Arrays.asList(streamConfigurationArr));
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("addStreamConfigurationToList: ");
            sb.append(key.getName());
            sb.append(": size = ");
            sb.append(streamConfigurationArr.length);
            Log.d(str, sb.toString());
            return;
        }
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("addStreamConfigurationToList: ");
        sb2.append(key.getName());
        sb2.append("'s configurations is null!");
        Log.w(str2, sb2.toString());
    }

    private List<CameraSize> convertToPictureSize(Size[] sizeArr) {
        ArrayList arrayList = new ArrayList();
        if (sizeArr != null) {
            for (Size size : sizeArr) {
                arrayList.add(new CameraSize(size.getWidth(), size.getHeight()));
            }
        }
        return arrayList;
    }

    public static int getBurstShootCount() {
        return b.getBurstShootCount();
    }

    private List<MiHighSpeedVideoConfiguration> getExtraHighSpeedVideoConfiguration() {
        try {
            Integer num = (Integer) this.mCharacteristics.get(MiCameraCharacteristics.EXTRA_HIGH_SPEED_VIDEO_NUMBER);
            if (num != null && num.intValue() > 0) {
                return MiHighSpeedVideoConfiguration.unmarshal((int[]) this.mCharacteristics.get(MiCameraCharacteristics.EXTRA_HIGH_SPEED_VIDEO_CONFIGURATIONS), num.intValue());
            }
        } catch (IllegalArgumentException e) {
            Log.e(TAG, e.getMessage());
        }
        return null;
    }

    private StreamConfigurationMap getStreamConfigurationMap() {
        if (this.mStreamConfigurationMap == null) {
            this.mStreamConfigurationMap = new SparseArray<>(5);
        }
        if (this.mStreamConfigurationMap.get(this.mOperatingMode) == null) {
            List streamConfigurations = getStreamConfigurations();
            if (streamConfigurations.size() == 0) {
                this.mStreamConfigurationMap.put(this.mOperatingMode, (StreamConfigurationMap) this.mCharacteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP));
            } else {
                SparseArray<StreamConfigurationMap> sparseArray = this.mStreamConfigurationMap;
                int i = this.mOperatingMode;
                StreamConfigurationMap streamConfigurationMap = new StreamConfigurationMap((StreamConfiguration[]) streamConfigurations.toArray(new StreamConfiguration[0]), (StreamConfigurationDuration[]) this.mCharacteristics.get(CameraCharacteristics.SCALER_AVAILABLE_MIN_FRAME_DURATIONS), (StreamConfigurationDuration[]) this.mCharacteristics.get(CameraCharacteristics.SCALER_AVAILABLE_STALL_DURATIONS), (StreamConfiguration[]) this.mCharacteristics.get(CameraCharacteristics.DEPTH_AVAILABLE_DEPTH_STREAM_CONFIGURATIONS), (StreamConfigurationDuration[]) this.mCharacteristics.get(CameraCharacteristics.DEPTH_AVAILABLE_DEPTH_MIN_FRAME_DURATIONS), (StreamConfigurationDuration[]) this.mCharacteristics.get(CameraCharacteristics.DEPTH_AVAILABLE_DEPTH_STALL_DURATIONS), (HighSpeedVideoConfiguration[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AVAILABLE_HIGH_SPEED_VIDEO_CONFIGURATIONS), (ReprocessFormatsMap) this.mCharacteristics.get(CameraCharacteristics.SCALER_AVAILABLE_INPUT_OUTPUT_FORMATS_MAP), true);
                sparseArray.put(i, streamConfigurationMap);
            }
        }
        return (StreamConfigurationMap) this.mStreamConfigurationMap.get(this.mOperatingMode);
    }

    private List<StreamConfiguration> getStreamConfigurations() {
        ArrayList arrayList = new ArrayList();
        boolean contains = this.mCaptureRequestVendorKeys.contains(MiCameraCharacteristics.SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS.getName());
        boolean contains2 = this.mCaptureRequestVendorKeys.contains(MiCameraCharacteristics.XIAOMI_SCALER_AVAILABLE_SR_STREAM_CONFIGURATIONS.getName());
        boolean contains3 = this.mCaptureRequestVendorKeys.contains(QCFA_STREAM_CONFIGURATIONS.getName());
        if (isSupportedQcfa() && contains2 && isUltraPixelPhotographyMode()) {
            addStreamConfigurationToList(arrayList, MiCameraCharacteristics.XIAOMI_SCALER_AVAILABLE_SR_STREAM_CONFIGURATIONS);
            return arrayList;
        } else if (!isSupportedQcfa() || !contains3 || (!isQcfaMode() && ((contains || isSupportedAndroidScalerStream()) && !isUltraPixelPhotographyMode()))) {
            if (contains) {
                addStreamConfigurationToList(arrayList, MiCameraCharacteristics.SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS);
            }
            return arrayList;
        } else {
            if (this.mOperatingMode != 36867) {
                addStreamConfigurationToList(arrayList, QCFA_STREAM_CONFIGURATIONS);
            }
            if (contains) {
                addStreamConfigurationToList(arrayList, MiCameraCharacteristics.SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS);
            } else {
                addStreamConfigurationToList(arrayList, MiCameraCharacteristics.SCALER_AVAILABLE_STREAM_CONFIGURATIONS);
            }
            return arrayList;
        }
    }

    private boolean isQcfaMode() {
        return this.mOperatingMode == 32775 || this.mOperatingMode == 36865 || DataRepository.dataItemFeature().q(CameraSettings.isFrontCamera());
    }

    private boolean isSupportedAndroidScalerStream() {
        return (b.rL || b.rN) && getFacing() == 1;
    }

    private boolean isUltraPixelPhotographyMode() {
        return this.mOperatingMode == 33011 || this.mOperatingMode == 36868 || this.mOperatingMode == 33013;
    }

    public Rect getActiveArraySize() {
        return (!isSupportedQcfa() || !this.mCaptureRequestVendorKeys.contains(QCFA_ACTIVE_ARRAY_SIZE.getName())) ? (Rect) this.mCharacteristics.get(CameraCharacteristics.SENSOR_INFO_ACTIVE_ARRAY_SIZE) : (Rect) this.mCharacteristics.get(QCFA_ACTIVE_ARRAY_SIZE);
    }

    public int getBeautyVersion() {
        if (this.mCaptureRequestVendorKeys != null && this.mCaptureRequestVendorKeys.contains(MiCameraCharacteristics.BEAUTY_VERSION.getName())) {
            return ((Byte) this.mCharacteristics.get(MiCameraCharacteristics.BEAUTY_VERSION)).byteValue();
        }
        return -1;
    }

    public byte[] getCameraCalibrationData() {
        return (byte[]) this.mCharacteristics.get(MiCameraCharacteristics.CAM_CALIBRATION_DATA);
    }

    public <T> T getCameraCharacteristic(Key<T> key) {
        return this.mCharacteristics.get(key);
    }

    public int getCameraId() {
        return this.mCameraId;
    }

    public HashSet<String> getCaptureRequestVendorKeys() {
        return this.mCaptureRequestVendorKeys;
    }

    public Range<Integer> getExposureCompensationRange() {
        return (Range) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_COMPENSATION_RANGE);
    }

    public Rational getExposureCompensationRational() {
        return (Rational) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_COMPENSATION_STEP);
    }

    public float getExposureCompensationStep() {
        Rational rational = (Rational) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_COMPENSATION_STEP);
        if (rational != null) {
            return rational.floatValue();
        }
        return 1.0f;
    }

    public Range<Long> getExposureTimeRange() {
        return (Range) this.mCharacteristics.get(CameraCharacteristics.SENSOR_INFO_EXPOSURE_TIME_RANGE);
    }

    public int getFacing() {
        Integer num = (Integer) this.mCharacteristics.get(CameraCharacteristics.LENS_FACING);
        if (num != null) {
            return num.intValue();
        }
        return 1;
    }

    public Range<Integer> getIsoRange() {
        return (Range) this.mCharacteristics.get(CameraCharacteristics.SENSOR_INFO_SENSITIVITY_RANGE);
    }

    public int getMaxExposureCompensation() {
        Range exposureCompensationRange = getExposureCompensationRange();
        if (exposureCompensationRange == null) {
            return 0;
        }
        return ((Integer) exposureCompensationRange.getUpper()).intValue();
    }

    public int getMaxFaceCount() {
        Integer num = (Integer) this.mCharacteristics.get(CameraCharacteristics.STATISTICS_INFO_MAX_FACE_COUNT);
        if (num != null) {
            return num.intValue();
        }
        return 0;
    }

    public int getMaxIso() {
        Range isoRange = getIsoRange();
        if (isoRange == null) {
            return 0;
        }
        return ((Integer) isoRange.getUpper()).intValue();
    }

    public float getMaxZoomRatio() {
        Float f = (Float) this.mCharacteristics.get(CameraCharacteristics.SCALER_AVAILABLE_MAX_DIGITAL_ZOOM);
        if (f != null) {
            return f.floatValue();
        }
        return 1.0f;
    }

    public float getMinimumFocusDistance() {
        Float f = (Float) this.mCharacteristics.get(CameraCharacteristics.LENS_INFO_MINIMUM_FOCUS_DISTANCE);
        if (f != null) {
            return f.floatValue();
        }
        return 0.0f;
    }

    public int getOperatingMode() {
        return this.mOperatingMode;
    }

    public int getScreenLightBrightness() {
        if (this.mCaptureRequestVendorKeys == null || !this.mCaptureRequestVendorKeys.contains(MiCameraCharacteristics.SCREEN_LIGHT_BRIGHTNESS.getName())) {
            return -1;
        }
        int intValue = ((Integer) this.mCharacteristics.get(MiCameraCharacteristics.SCREEN_LIGHT_BRIGHTNESS)).intValue();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("Screen light brightness: ");
        sb.append(intValue);
        Log.d(str, sb.toString());
        return intValue;
    }

    public int getSensorInfoTimestampSource() {
        return ((Integer) this.mCharacteristics.get(CameraCharacteristics.SENSOR_INFO_TIMESTAMP_SOURCE)).intValue();
    }

    public int getSensorOrientation() {
        Integer num = (Integer) this.mCharacteristics.get(CameraCharacteristics.SENSOR_ORIENTATION);
        if (num != null) {
            return num.intValue();
        }
        return 0;
    }

    public int[] getSupportedAWBModes() {
        return (int[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AWB_AVAILABLE_MODES);
    }

    public int[] getSupportedAntiBandingModes() {
        return (int[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_AVAILABLE_ANTIBANDING_MODES);
    }

    public int[] getSupportedColorEffects() {
        return (int[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AVAILABLE_EFFECTS);
    }

    public List<MiCustomFpsRange> getSupportedCustomFpsRange() {
        try {
            return MiCustomFpsRange.unmarshal((int[]) this.mCharacteristics.get(MiCameraCharacteristics.CUSTOM_HFR_FPS_TABLE));
        } catch (IllegalArgumentException e) {
            Log.e(TAG, e.getMessage());
            return null;
        }
    }

    public int[] getSupportedFlashModes() {
        return (int[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_AVAILABLE_MODES);
    }

    public int[] getSupportedFocusModes() {
        return (int[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AF_AVAILABLE_MODES);
    }

    public Range<Integer>[] getSupportedFpsRange() {
        return (Range[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES);
    }

    public List<Integer> getSupportedHFRVideoFPSList(Size size) {
        ArrayList arrayList = new ArrayList();
        Range[] supportedHighSpeedVideoFPSRange = getSupportedHighSpeedVideoFPSRange(size);
        int length = supportedHighSpeedVideoFPSRange.length;
        for (int i = 0; i < length; i++) {
            Range range = supportedHighSpeedVideoFPSRange[i];
            if (((Integer) range.getUpper()).equals(range.getLower()) && !arrayList.contains(range.getUpper())) {
                arrayList.add((Integer) range.getUpper());
            }
        }
        return arrayList;
    }

    public int getSupportedHardwareLevel() {
        return ((Integer) this.mCharacteristics.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL)).intValue();
    }

    public List<CameraSize> getSupportedHighResolutionOutputSize(int i) {
        StreamConfigurationMap streamConfigurationMap = getStreamConfigurationMap();
        return streamConfigurationMap != null ? convertToPictureSize(streamConfigurationMap.getHighResolutionOutputSizes(i)) : new ArrayList(0);
    }

    public Range<Integer>[] getSupportedHighSpeedVideoFPSRange(Size size) {
        Range<Integer>[] highSpeedVideoFpsRangesFor = ((StreamConfigurationMap) this.mCharacteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP)).getHighSpeedVideoFpsRangesFor(size);
        if (!isSupportExtraHighSpeedVideoConfiguration()) {
            return highSpeedVideoFpsRangesFor;
        }
        List<MiHighSpeedVideoConfiguration> extraHighSpeedVideoConfiguration = getExtraHighSpeedVideoConfiguration();
        if (extraHighSpeedVideoConfiguration == null) {
            return highSpeedVideoFpsRangesFor;
        }
        ArrayList arrayList = new ArrayList();
        for (MiHighSpeedVideoConfiguration miHighSpeedVideoConfiguration : extraHighSpeedVideoConfiguration) {
            if (size != null && size.equals(miHighSpeedVideoConfiguration.getSize())) {
                arrayList.add(miHighSpeedVideoConfiguration.getFpsRange());
            }
        }
        if (highSpeedVideoFpsRangesFor != null) {
            for (Range<Integer> add : highSpeedVideoFpsRangesFor) {
                arrayList.add(add);
            }
        }
        return (Range[]) arrayList.toArray(new Range[arrayList.size()]);
    }

    public Size[] getSupportedHighSpeedVideoSize() {
        Size[] highSpeedVideoSizes = ((StreamConfigurationMap) this.mCharacteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP)).getHighSpeedVideoSizes();
        if (!isSupportExtraHighSpeedVideoConfiguration()) {
            return highSpeedVideoSizes;
        }
        List<MiHighSpeedVideoConfiguration> extraHighSpeedVideoConfiguration = getExtraHighSpeedVideoConfiguration();
        if (extraHighSpeedVideoConfiguration == null) {
            return highSpeedVideoSizes;
        }
        ArrayList arrayList = new ArrayList();
        for (MiHighSpeedVideoConfiguration size : extraHighSpeedVideoConfiguration) {
            Size size2 = size.getSize();
            if (!arrayList.contains(size2)) {
                arrayList.add(size2);
            }
        }
        if (highSpeedVideoSizes != null) {
            for (Size size3 : highSpeedVideoSizes) {
                if (!arrayList.contains(size3)) {
                    arrayList.add(size3);
                }
            }
        }
        return (Size[]) arrayList.toArray(new Size[0]);
    }

    public List<CameraSize> getSupportedOutputSize(int i) {
        StreamConfigurationMap streamConfigurationMap = getStreamConfigurationMap();
        return streamConfigurationMap != null ? convertToPictureSize(streamConfigurationMap.getOutputSizes(i)) : new ArrayList(0);
    }

    public List<CameraSize> getSupportedOutputSize(Class cls) {
        StreamConfigurationMap streamConfigurationMap = getStreamConfigurationMap();
        return streamConfigurationMap != null ? convertToPictureSize(streamConfigurationMap.getOutputSizes(cls)) : new ArrayList(0);
    }

    public int[] getSupportedSceneModes() {
        return (int[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AVAILABLE_SCENE_MODES);
    }

    public List<CameraSize> getSupportedThumbnailSizes() {
        return convertToPictureSize((Size[]) this.mCharacteristics.get(CameraCharacteristics.JPEG_AVAILABLE_THUMBNAIL_SIZES));
    }

    public float getViewAngle(boolean z) {
        float[] fArr = (float[]) this.mCharacteristics.get(CameraCharacteristics.LENS_INFO_AVAILABLE_FOCAL_LENGTHS);
        if (fArr != null && fArr.length > 0) {
            float f = fArr[0];
            SizeF sizeF = (SizeF) this.mCharacteristics.get(CameraCharacteristics.SENSOR_INFO_PHYSICAL_SIZE);
            if (sizeF != null) {
                float height = z ? sizeF.getHeight() : sizeF.getWidth();
                if (height > 0.0f) {
                    float degrees = (float) (2.0d * Math.toDegrees(Math.atan((0.5d * ((double) height)) / ((double) f))));
                    String str = TAG;
                    Locale locale = Locale.US;
                    String str2 = "%s view angle: %.2f, size = %s, focalLength = %.4f";
                    Object[] objArr = new Object[4];
                    objArr[0] = z ? "vertical" : "horizontal";
                    objArr[1] = Float.valueOf(degrees);
                    objArr[2] = sizeF;
                    objArr[3] = Float.valueOf(f);
                    Log.d(str, String.format(locale, str2, objArr));
                    return degrees;
                }
            }
        }
        String str3 = TAG;
        Locale locale2 = Locale.US;
        String str4 = "failed to get %s view angle";
        Object[] objArr2 = new Object[1];
        objArr2[0] = z ? "vertical" : "horizontal";
        Log.e(str3, String.format(locale2, str4, objArr2));
        return DEFAULT_VIEW_ANGLE;
    }

    @TargetApi(23)
    public boolean isAELockSupported() {
        Boolean bool = (Boolean) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_LOCK_AVAILABLE);
        return bool != null && bool.booleanValue();
    }

    public boolean isAERegionSupported() {
        Integer num = (Integer) this.mCharacteristics.get(CameraCharacteristics.CONTROL_MAX_REGIONS_AE);
        return num != null && num.intValue() > 0;
    }

    public boolean isAFRegionSupported() {
        Float f = (Float) this.mCharacteristics.get(CameraCharacteristics.LENS_INFO_MINIMUM_FOCUS_DISTANCE);
        return f != null && f.floatValue() > 0.0f;
    }

    @TargetApi(23)
    public boolean isAWBLockSupported() {
        Boolean bool = (Boolean) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AWB_LOCK_AVAILABLE);
        return bool != null && bool.booleanValue();
    }

    public boolean isAdaptiveSnapshotSizeInSatModeSupported() {
        boolean z = false;
        if (this.mCameraId != Camera2DataContainer.getInstance().getSATCameraId()) {
            Log.d(TAG, "isAdaptiveSnapshotSizeInSatModeSupported(): false");
            return false;
        } else if (this.mCaptureRequestVendorKeys == null) {
            Log.d(TAG, "isAdaptiveSnapshotSizeInSatModeSupported(): false");
            return false;
        } else if (!this.mCaptureRequestVendorKeys.contains(MiCameraCharacteristics.ADAPTIVE_SNAPSHOT_SIZE_IN_SAT_MODE_SUPPORTED.getName())) {
            Log.d(TAG, "isAdaptiveSnapshotSizeInSatModeSupported(): false");
            return false;
        } else {
            Boolean bool = (Boolean) this.mCharacteristics.get(MiCameraCharacteristics.ADAPTIVE_SNAPSHOT_SIZE_IN_SAT_MODE_SUPPORTED);
            if (bool != null && bool.booleanValue()) {
                z = true;
            }
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("isAdaptiveSnapshotSizeInSatModeSupported(): ");
            sb.append(z);
            Log.d(str, sb.toString());
            return z;
        }
    }

    public boolean isAutoFocusSupported() {
        return Util.isSupported(1, getSupportedFocusModes());
    }

    public boolean isBackwardCaptureSupported() {
        return this.mCaptureRequestVendorKeys != null && this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.XIAOMI_BACKWARD_CAPTURE_HINT.getName());
    }

    public boolean isEISPreviewSupported() {
        boolean z = false;
        if (this.mCaptureRequestVendorKeys == null || !this.mCaptureRequestVendorKeys.contains(MiCameraCharacteristics.EIS_PREVIEW_SUPPORTED.getName())) {
            return false;
        }
        Byte b = (Byte) this.mCharacteristics.get(MiCameraCharacteristics.EIS_PREVIEW_SUPPORTED);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("isEISPreviewSupported: ");
        sb.append(b);
        Log.d(str, sb.toString());
        if (b != null && b.byteValue() == 1) {
            z = true;
        }
        return z;
    }

    public boolean isFaceDetectionSupported() {
        int[] iArr = (int[]) this.mCharacteristics.get(CameraCharacteristics.STATISTICS_INFO_AVAILABLE_FACE_DETECT_MODES);
        if (iArr != null) {
            for (int i : iArr) {
                if (i == 1) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean isFixedFocus() {
        return getMinimumFocusDistance() > 0.0f;
    }

    public boolean isFlashSupported() {
        Boolean bool = (Boolean) this.mCharacteristics.get(CameraCharacteristics.FLASH_INFO_AVAILABLE);
        return bool != null && bool.booleanValue();
    }

    public boolean isFovcSupported() {
        boolean z = false;
        if (this.mCaptureRequestVendorKeys == null || !this.mCaptureRequestVendorKeys.contains(MiCameraCharacteristics.FOVC_SUPPORTED.getName())) {
            return false;
        }
        Byte b = (Byte) this.mCharacteristics.get(MiCameraCharacteristics.FOVC_SUPPORTED);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("isFovcSupported: ");
        sb.append(b);
        Log.d(str, sb.toString());
        if (b != null && b.byteValue() == 1) {
            z = true;
        }
        return z;
    }

    public boolean isMFNRBokehSupported() {
        boolean z = false;
        if (this.mCaptureRequestVendorKeys == null || !this.mCaptureRequestVendorKeys.contains(MiCameraCharacteristics.MFNR_BOKEH_SUPPORTED.getName())) {
            return false;
        }
        Byte b = (Byte) this.mCharacteristics.get(MiCameraCharacteristics.MFNR_BOKEH_SUPPORTED);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("isMFNRBokehSupported: ");
        sb.append(b);
        Log.d(str, sb.toString());
        if (b != null && b.byteValue() == 1) {
            z = true;
        }
        return z;
    }

    public boolean isPartialMetadataSupported() {
        Integer num = (Integer) this.mCharacteristics.get(CameraCharacteristics.REQUEST_PARTIAL_RESULT_COUNT);
        return num != null && num.intValue() > 1;
    }

    public boolean isRemosaicDetecedSupported() {
        return this.mCaptureRequestVendorKeys != null && this.mCaptureRequestVendorKeys.contains(MiCaptureResult.REMOSAIC_DETECTED.getName());
    }

    public boolean isSensorHdrSupported() {
        return this.mCaptureRequestVendorKeys != null && this.mCaptureRequestVendorKeys.contains(MiCameraCharacteristics.SENSOR_HDR_SUPPORTED.getName());
    }

    public boolean isSupportAutoHdr() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.HDR_CHECKER_ENABLE.getName());
    }

    public boolean isSupportBeauty() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.BEAUTY_LEVEL.getName());
    }

    public boolean isSupportBeautyMakeup() {
        boolean z = false;
        if (this.mCaptureRequestVendorKeys == null || !this.mCaptureRequestVendorKeys.contains(MiCameraCharacteristics.BEAUTY_MAKEUP.getName())) {
            return false;
        }
        Boolean bool = (Boolean) this.mCharacteristics.get(MiCameraCharacteristics.BEAUTY_MAKEUP);
        if (bool != null && bool.booleanValue()) {
            z = true;
        }
        return z;
    }

    public boolean isSupportBeautyType(String str) {
        return MiCameraCompat.supportBeautyType(this.mCaptureRequestVendorKeys, str);
    }

    public boolean isSupportBokehAdjust() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.BOKEH_F_NUMBER.getName());
    }

    public boolean isSupportBurstFps() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.BURST_SHOOT_FPS.getName());
    }

    public boolean isSupportBurstHint() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.BURST_CAPTURE_HINT.getName());
    }

    public boolean isSupportCameraAi30() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.CAMERA_AI_30.getName());
    }

    public boolean isSupportContrast() {
        return MiCameraCompat.supportContrast(this.mCaptureRequestVendorKeys);
    }

    public boolean isSupportDepurple() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.DEPURPLE_TAG.getName());
    }

    public boolean isSupportDeviceOrientation() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.DEVICE_ORIENTATION.getName());
    }

    public boolean isSupportExtraHighSpeedVideoConfiguration() {
        return MiCameraCompat.supportExtraHighSpeedVideoConfiguration(this.mCaptureRequestVendorKeys);
    }

    public boolean isSupportEyeLight() {
        return MiCameraCompat.supportEyeLight(this.mCaptureRequestVendorKeys);
    }

    public boolean isSupportFaceAgeAnalyze() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.FACE_AGE_ANALYZE_ENABLED.getName());
    }

    public boolean isSupportFaceScore() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.FACE_SCORE_ENABLED.getName());
    }

    public boolean isSupportFastZoomIn() {
        return this.mCaptureRequestVendorKeys.contains(CaptureResultParser.FAST_ZOOM_RESULT.getName());
    }

    public boolean isSupportFrontMirror() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.FRONT_MIRROR.getName());
    }

    public boolean isSupportHFRDeflicker() {
        if (this.mCaptureRequestVendorKeys == null) {
            return false;
        }
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.DEFLICKER_ENABLED.getName());
    }

    public boolean isSupportHHT() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.HHT_ENABLED.getName());
    }

    public boolean isSupportHdr() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.HDR_ENABLED.getName());
    }

    public boolean isSupportLensDirtyDetect() {
        return MiCameraCompat.supportLensDirtyDetect(this.mCaptureRequestVendorKeys);
    }

    public boolean isSupportMacroMode() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.KEY_MACRO_MODE.getName());
    }

    public boolean isSupportMfnr() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.MFNR_ENABLED.getName());
    }

    public boolean isSupportMiBokeh() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.FRONT_SINGLE_CAMERA_BOKEH.getName());
    }

    public boolean isSupportNormalWideLDC() {
        if (this.mCaptureRequestVendorKeys == null || !this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.NORMAL_WIDE_LENS_DISTORTION_CORRECTION_LEVEL.getName())) {
            Log.d(TAG, "isSupportNormalWideLDC: false");
            return false;
        }
        Log.d(TAG, "isSupportNormalWideLDC: true");
        return true;
    }

    public boolean isSupportOIS() {
        int[] iArr = (int[]) this.mCharacteristics.get(CameraCharacteristics.LENS_INFO_AVAILABLE_OPTICAL_STABILIZATION);
        if (iArr == null || iArr.length == 0) {
            return false;
        }
        return (iArr.length == 1 && iArr[0] == 0) ? false : true;
    }

    public boolean isSupportParallel() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.PARALLEL_ENABLED.getName());
    }

    public boolean isSupportPortraitLighting() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.PORTRAIT_LIGHTING.getName());
    }

    public boolean isSupportRearBokeh() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.REAR_BOKEH_ENABLE.getName());
    }

    public boolean isSupportSnapShotTorch() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.SNAP_SHOT_TORCH.getName());
    }

    public boolean isSupportSuperNight() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.SUPER_NIGHT_SCENE_ENABLED.getName());
    }

    public boolean isSupportSuperResolution() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.SUPER_RESOLUTION_ENABLED.getName());
    }

    public boolean isSupportSwMfnr() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.SW_MFNR_ENABLED.getName());
    }

    public boolean isSupportUltraWideLDC() {
        if (this.mCaptureRequestVendorKeys == null || !this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.ULTRA_WIDE_LENS_DISTORTION_CORRECTION_LEVEL.getName())) {
            Log.d(TAG, "isSupportUltraWideLDC: false");
            return false;
        }
        Log.d(TAG, "isSupportUltraWideLDC: true");
        return true;
    }

    public boolean isSupportVideoBeauty() {
        boolean z = false;
        if (this.mCaptureRequestVendorKeys == null || !this.mCaptureRequestVendorKeys.contains(MiCameraCharacteristics.VIDEO_BEAUTY.getName())) {
            return false;
        }
        Boolean bool = (Boolean) this.mCharacteristics.get(MiCameraCharacteristics.VIDEO_BEAUTY);
        if (bool != null && bool.booleanValue()) {
            z = true;
        }
        return z;
    }

    public boolean isSupportWatermark() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.WATERMARK_APPLIEDTYPE.getName());
    }

    public boolean isSupportedQcfa() {
        boolean z = false;
        if (this.mCaptureRequestVendorKeys == null || !this.mCaptureRequestVendorKeys.contains(MiCameraCharacteristics.IS_QCFA_SENSOR.getName())) {
            return false;
        }
        Byte b = (Byte) this.mCharacteristics.get(MiCameraCharacteristics.IS_QCFA_SENSOR);
        if (b != null && b.byteValue() == 1) {
            z = true;
        }
        return z;
    }

    public boolean isUltraPixelPhotographySupported(int i) {
        Size size = (Size) ULTRA_PIXEL_SIZE_LIST.get(Integer.valueOf(i));
        if (size == null || !isSupportedQcfa()) {
            return false;
        }
        for (Key key : ULTRA_PIXEL_STREAM_CONFIGURATIONS_VENDOR_KEYS) {
            if (this.mCaptureRequestVendorKeys.contains(key.getName())) {
                StreamConfiguration[] streamConfigurationArr = (StreamConfiguration[]) this.mCharacteristics.get(key);
                if (streamConfigurationArr == null) {
                    continue;
                } else if (streamConfigurationArr.length > 0) {
                    int length = streamConfigurationArr.length;
                    for (int i2 = 0; i2 < length; i2++) {
                        StreamConfiguration streamConfiguration = streamConfigurationArr[i2];
                        if (streamConfiguration.getFormat() == 33 && streamConfiguration.getWidth() == size.getWidth() && streamConfiguration.getHeight() == size.getHeight()) {
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }

    public boolean isZoomSupported() {
        return getMaxZoomRatio() > 1.0f;
    }

    public void setOperatingMode(int i) {
        this.mOperatingMode = i;
    }
}
