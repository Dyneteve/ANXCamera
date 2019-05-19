package com.android.camera.module.loader.camera2;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraManager;
import android.util.SparseArray;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentConfigUltraWide;
import com.android.camera.data.data.config.ComponentManuallyDualLens;
import com.android.camera.log.Log;
import com.android.camera2.CameraCapabilities;
import com.mi.config.b;
import java.util.Arrays;
import java.util.Locale;

@SuppressLint({"MissingPermission"})
@TargetApi(21)
public class Camera2DataContainer {
    public static final int BOGUS_CAMERA_ID_BACK = 0;
    public static final int BOGUS_CAMERA_ID_FRONT = 1;
    private static final int INDEX_AUX = 1;
    private static final int INDEX_BOKEH = 3;
    private static final int INDEX_INFRARED = 5;
    private static final int INDEX_MAIN = 0;
    private static final int INDEX_SAT = 2;
    private static final int INDEX_VIRTUAL = 4;
    private static final int INVALID_CAMERA_ID = -1;
    private static final int MAX_TYPES_OF_CAMERAS_OF_EACH_FACING_DIRECTION = 6;
    private static final String TAG = Camera2DataContainer.class.getSimpleName();
    private static final int TRIPLE_SAT_CAMERA_ID = 120;
    private static final int ULTRA_WIDE_BOKEH_CAMERA_ID = 63;
    private static final int ULTRA_WIDE_CAMERA_ID = 21;
    private static final Camera2DataContainer sInstance = new Camera2DataContainer();
    private volatile SparseArray<CameraCapabilities> mCapabilities = null;
    private volatile int mCurrentOpenedCameraId = -1;
    private volatile int[] mOrderedCameraIds = null;

    private Camera2DataContainer() {
    }

    private void dumpCameraIds() {
        int[] iArr = new int[6];
        int[] iArr2 = new int[6];
        for (int i = 0; i < 6; i++) {
            iArr[i] = this.mOrderedCameraIds[i];
            iArr2[i] = this.mOrderedCameraIds[(this.mOrderedCameraIds.length / 2) + i];
        }
        Log.d(TAG, "====================================================================");
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append(" BACK: [main, aux, sat, bokeh, virtual, infrared] = ");
        sb.append(Arrays.toString(iArr));
        Log.d(str, sb.toString());
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("FRONT: [main, aux, sat, bokeh, virtual, infrared] = ");
        sb2.append(Arrays.toString(iArr2));
        Log.d(str2, sb2.toString());
        Log.d(TAG, "====================================================================");
    }

    public static Camera2DataContainer getInstance() {
        synchronized (sInstance) {
            if (!sInstance.isInitialized()) {
                sInstance.init((CameraManager) CameraAppImpl.getAndroidContext().getSystemService("camera"));
            }
        }
        return sInstance;
    }

    public static Camera2DataContainer getInstance(CameraManager cameraManager) {
        synchronized (sInstance) {
            if (!sInstance.isInitialized()) {
                sInstance.init(cameraManager);
            }
        }
        return sInstance;
    }

    private void init(CameraManager cameraManager) {
        Log.d(TAG, "E: init()");
        try {
            reset();
            String[] cameraIdList = cameraManager.getCameraIdList();
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("All available camera ids: ");
            sb.append(Arrays.deepToString(cameraIdList));
            Log.d(str, sb.toString());
            int max = Math.max(6, cameraIdList.length);
            this.mOrderedCameraIds = new int[(max * 2)];
            Arrays.fill(this.mOrderedCameraIds, -1);
            this.mCapabilities = new SparseArray<>(cameraIdList.length);
            int i = max;
            int i2 = 0;
            for (String str2 : cameraIdList) {
                try {
                    int parseInt = Integer.parseInt(str2);
                    CameraCharacteristics cameraCharacteristics = cameraManager.getCameraCharacteristics(str2);
                    this.mCapabilities.put(parseInt, new CameraCapabilities(cameraCharacteristics, parseInt));
                    if (DataRepository.dataItemFeature().isSupportUltraWide()) {
                        if (21 != parseInt) {
                            if (63 == parseInt) {
                            }
                        }
                    }
                    Integer num = (Integer) cameraCharacteristics.get(CameraCharacteristics.LENS_FACING);
                    if (num == null) {
                        String str3 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Unknown facing direction of camera ");
                        sb2.append(parseInt);
                        Log.d(str3, sb2.toString());
                    } else if (num.intValue() == 1) {
                        int i3 = i2 + 1;
                        this.mOrderedCameraIds[i2] = parseInt;
                        i2 = i3;
                    } else if (num.intValue() == 0) {
                        int i4 = i + 1;
                        this.mOrderedCameraIds[i] = parseInt;
                        i = i4;
                    }
                } catch (NumberFormatException e) {
                    String str4 = TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("non-integer camera id: ");
                    sb3.append(str2);
                    Log.e(str4, sb3.toString());
                }
            }
            dumpCameraIds();
        } catch (Exception e2) {
            String str5 = TAG;
            StringBuilder sb4 = new StringBuilder();
            sb4.append("Failed to init Camera2DataContainer: ");
            sb4.append(e2);
            Log.e(str5, sb4.toString());
            reset();
        }
        Log.d(TAG, "X: init()");
    }

    private boolean isInitialized() {
        return (this.mCapabilities == null || this.mOrderedCameraIds == null) ? false : true;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:87:0x014c, code lost:
        r2 = r8;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized int getActualOpenCameraId(int i, int i2) {
        int i3;
        if (!isInitialized()) {
            Log.d(TAG, "Warning: getActualOpenCameraId(): #init() failed.");
            return i;
        }
        if (i == 0) {
            boolean z = CameraSettings.isDualCameraEnable() && (CameraSettings.isSupportedOpticalZoom() || CameraSettings.isSupportedPortrait()) && !DataRepository.dataItemGlobal().isForceMainBackCamera();
            if (z) {
                ComponentConfigUltraWide componentConfigUltraWide = DataRepository.dataItemConfig().getComponentConfigUltraWide();
                switch (i2) {
                    case 161:
                    case 162:
                    case 174:
                        if (!CameraSettings.isMacroModeEnabled(i2)) {
                            if (!CameraSettings.isAutoZoomEnabled(i2)) {
                                if (componentConfigUltraWide.isUltraWideOnInMode(i2) && !HybridZoomingSystem.IS_3_OR_MORE_SAT) {
                                    i3 = getUltraWideCameraId();
                                    break;
                                } else if (HybridZoomingSystem.IS_3_OR_MORE_SAT) {
                                    float f = HybridZoomingSystem.toFloat(HybridZoomingSystem.getZoomRatioHistory(i2, "1.0"), 1.0f);
                                    String str = TAG;
                                    StringBuilder sb = new StringBuilder();
                                    sb.append("Currently user selected zoom ratio is ");
                                    sb.append(f);
                                    Log.d(str, sb.toString());
                                    if (f < HybridZoomingSystem.FLOAT_ZOOM_RATIO_WIDE) {
                                        i3 = getUltraWideCameraId();
                                        break;
                                    }
                                }
                            } else {
                                i3 = getUltraWideCameraId();
                                break;
                            }
                        } else {
                            i3 = getUltraWideCameraId();
                            break;
                        }
                        break;
                    case 163:
                    case 165:
                        if (!CameraSettings.isMacroModeEnabled(i2)) {
                            if (!CameraSettings.isUltraPixelOn()) {
                                if (CameraSettings.isDualCameraSatEnable() && b.isSupportedOpticalZoom()) {
                                    if (componentConfigUltraWide.isUltraWideOnInMode(i2) && !HybridZoomingSystem.IS_3_OR_MORE_SAT) {
                                        i3 = getUltraWideCameraId();
                                        break;
                                    } else {
                                        i3 = getSATCameraId();
                                        break;
                                    }
                                } else if (!componentConfigUltraWide.isUltraWideOnInMode(i2)) {
                                    i3 = getMainBackCameraId();
                                    break;
                                } else {
                                    i3 = getUltraWideCameraId();
                                    break;
                                }
                            } else {
                                i3 = getMainBackCameraId();
                                break;
                            }
                        } else {
                            i3 = getUltraWideCameraId();
                            break;
                        }
                        break;
                    case 166:
                    case 167:
                        if (CameraSettings.isZoomByCameraSwitchingSupported()) {
                            String cameraLensType = CameraSettings.getCameraLensType(i2);
                            i3 = ComponentManuallyDualLens.LENS_WIDE.equals(cameraLensType) ? getMainBackCameraId() : ComponentManuallyDualLens.LENS_TELE.equals(cameraLensType) ? getAuxCameraId() : ComponentManuallyDualLens.LENS_ULTRA.equals(cameraLensType) ? getUltraWideCameraId() : i;
                            break;
                        }
                    case 171:
                        if (!DataRepository.dataItemRunning().isSwitchOn("pref_ultra_wide_bokeh_enabled") || getUltraWideBokehCameraId() == -1) {
                            if (getBokehCameraId() == -1) {
                                i3 = getSATCameraId();
                                break;
                            } else {
                                i3 = getBokehCameraId();
                                break;
                            }
                        } else {
                            i3 = getUltraWideBokehCameraId();
                            break;
                        }
                        break;
                    case 173:
                    case 175:
                        i3 = getMainBackCameraId();
                        break;
                }
            } else {
                return i;
            }
        } else {
            if (i == 1) {
                if (i2 != 171) {
                    switch (i2) {
                        case 161:
                        case 162:
                            if (CameraSettings.isVideoBokehOn() && getBokehFrontCameraId() != -1) {
                                i3 = getBokehFrontCameraId();
                                break;
                            }
                    }
                } else if (getBokehFrontCameraId() != -1) {
                    boolean isIntentAction = DataRepository.dataItemGlobal().isIntentAction();
                    if (!b.iF() || isIntentAction) {
                        i3 = getBokehFrontCameraId();
                    }
                }
            }
            i3 = i;
        }
        Log.d(TAG, String.format(Locale.US, "getActualOpenCameraId: mode=%x, id=%d->%d", new Object[]{Integer.valueOf(i2), Integer.valueOf(i), Integer.valueOf(i3)}));
        return i3;
    }

    public synchronized int getAuxCameraId() {
        if (!isInitialized()) {
            Log.d(TAG, "Warning: getAuxCameraId(): #init() failed.");
            return -1;
        }
        return this.mOrderedCameraIds[1];
    }

    public synchronized int getAuxFrontCameraId() {
        if (!isInitialized()) {
            Log.d(TAG, "Warning: getAuxFrontCameraId(): #init() failed.");
            return -1;
        }
        return this.mOrderedCameraIds[(this.mOrderedCameraIds.length / 2) + 1];
    }

    public synchronized int getBokehCameraId() {
        if (!isInitialized()) {
            Log.d(TAG, "Warning: getBokehCameraId(): #init() failed.");
            return -1;
        }
        return this.mOrderedCameraIds[3];
    }

    public synchronized int getBokehFrontCameraId() {
        if (!isInitialized()) {
            Log.d(TAG, "Warning: getBokehFrontCameraId(): #init() failed.");
            return -1;
        }
        return this.mOrderedCameraIds[(this.mOrderedCameraIds.length / 2) + 3];
    }

    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0032, code lost:
        return r0;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized CameraCapabilities getCapabilities(int i) {
        if (!isInitialized()) {
            Log.d(TAG, "Warning: getCapabilities(): #init() failed.");
            return null;
        }
        CameraCapabilities cameraCapabilities = (CameraCapabilities) this.mCapabilities.get(i);
        if (cameraCapabilities == null) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Warning: getCapabilities(): return null for camera: ");
            sb.append(i);
            Log.d(str, sb.toString());
        }
    }

    public synchronized CameraCapabilities getCapabilitiesByBogusCameraId(int i, int i2) {
        return getCapabilities(getActualOpenCameraId(i, i2));
    }

    public synchronized CameraCapabilities getCurrentCameraCapabilities() {
        if (this.mCurrentOpenedCameraId == -1) {
            Log.d(TAG, "Warning: getCurrentCameraCapabilities(): mCurrentOpenedCameraId is invalid.");
        }
        return getCapabilities(this.mCurrentOpenedCameraId);
    }

    public synchronized int getFrontCameraId() {
        if (!isInitialized()) {
            Log.d(TAG, "Warning: getFrontCameraId(): #init() failed.");
            return -1;
        }
        return this.mOrderedCameraIds[(this.mOrderedCameraIds.length / 2) + 0];
    }

    public synchronized int getMainBackCameraId() {
        if (!isInitialized()) {
            Log.d(TAG, "Warning: getMainBackCameraId(): #init() failed.");
            return -1;
        }
        return this.mOrderedCameraIds[0];
    }

    public synchronized int getSATCameraId() {
        if (!isInitialized()) {
            Log.d(TAG, "Warning: getSATCameraId(): #init() failed.");
            return -1;
        } else if (HybridZoomingSystem.IS_3_SAT) {
            return 120;
        } else {
            return this.mOrderedCameraIds[2];
        }
    }

    public synchronized int getSATFrontCameraId() {
        if (!isInitialized()) {
            Log.d(TAG, "Warning: getSATFrontCameraId(): #init() failed.");
            return -1;
        }
        return this.mOrderedCameraIds[(this.mOrderedCameraIds.length / 2) + 2];
    }

    public synchronized int getUltraWideBokehCameraId() {
        if (isInitialized()) {
            return 63;
        }
        Log.d(TAG, "Warning: getUltraWideBokehCameraId(): #init() failed.");
        return -1;
    }

    public synchronized int getUltraWideCameraId() {
        if (isInitialized()) {
            return 21;
        }
        Log.d(TAG, "Warning: getUltraWideCameraId(): #init() failed.");
        return -1;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:13:0x001c, code lost:
        return r1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized boolean hasBokehCamera() {
        boolean z = false;
        if (!isInitialized()) {
            Log.d(TAG, "Warning: hasBokehCamera(): #init() failed.");
            return false;
        } else if (this.mOrderedCameraIds[3] != -1) {
            z = true;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:13:0x001c, code lost:
        return r1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized boolean hasSATCamera() {
        boolean z = false;
        if (!isInitialized()) {
            Log.d(TAG, "Warning: hasSATCamera(): #init() failed.");
            return false;
        } else if (this.mOrderedCameraIds[2] != -1) {
            z = true;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:12:0x001a, code lost:
        return r0;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized boolean isFrontCameraId(int i) {
        CameraCapabilities capabilities = getCapabilities(i);
        boolean z = false;
        if (capabilities == null) {
            Log.d(TAG, "Warning: isFrontCameraId(): #init() failed.");
            return false;
        } else if (capabilities.getFacing() == 0) {
            z = true;
        }
    }

    public synchronized void reset() {
        Log.d(TAG, "E: reset()");
        this.mCurrentOpenedCameraId = -1;
        this.mCapabilities = null;
        this.mOrderedCameraIds = null;
        Log.d(TAG, "X: reset()");
    }

    public synchronized void setCurrentOpenedCameraId(int i) {
        this.mCurrentOpenedCameraId = i;
    }
}
