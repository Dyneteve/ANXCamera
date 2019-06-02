package com.xiaomi.camera.base;

import android.content.Context;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraCharacteristics.Key;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.CaptureResult;
import android.os.Parcelable;
import com.android.camera.log.Log;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public final class CameraDeviceUtil {
    private static final String TAG = CameraDeviceUtil.class.getSimpleName();

    private CameraDeviceUtil() {
    }

    /* JADX WARNING: Code restructure failed: missing block: B:19:0x0022, code lost:
        return 769;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x0025, code lost:
        return 513;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x0027, code lost:
        return 2;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static int getCameraCombinationMode(int i) {
        if (i == 40) {
            return 18;
        }
        switch (i) {
            case 0:
                return 1;
            case 1:
                return 17;
            case 2:
                break;
            case 3:
                break;
            case 4:
                break;
            default:
                switch (i) {
                    case 20:
                        break;
                    case 21:
                        return 3;
                    default:
                        switch (i) {
                            case 60:
                                break;
                            case 61:
                                break;
                            case 62:
                                return 514;
                            case 63:
                                return 770;
                            default:
                                switch (i) {
                                    case 80:
                                        return 515;
                                    case 81:
                                        return 771;
                                    default:
                                        return 0;
                                }
                        }
                }
        }
    }

    public static ICustomCaptureResult getCustomCaptureResult(CaptureResult captureResult) {
        try {
            Method method = captureResult.getClass().getMethod("getNativeCopy", new Class[0]);
            method.setAccessible(true);
            Parcelable parcelable = (Parcelable) method.invoke(captureResult, new Object[0]);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("getCustomCaptureResult: cameraMetadataNative =");
            sb.append(parcelable);
            Log.d(str, sb.toString());
            ICustomCaptureResult iCustomCaptureResult = new ICustomCaptureResult();
            iCustomCaptureResult.setFrameNumber(captureResult.getFrameNumber());
            iCustomCaptureResult.setRequest(captureResult.getRequest());
            iCustomCaptureResult.setSequenceId(captureResult.getSequenceId());
            iCustomCaptureResult.setResults(parcelable);
            Long l = (Long) captureResult.get(CaptureResult.SENSOR_TIMESTAMP);
            if (l != null) {
                iCustomCaptureResult.setTimeStamp(l.longValue());
            }
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("getCustomCaptureResult: ");
            sb2.append(iCustomCaptureResult);
            Log.d(str2, sb2.toString());
            return iCustomCaptureResult;
        } catch (Exception e) {
            Log.e(TAG, "getCustomCaptureResult: getCustomCaptureResult", e);
            return null;
        }
    }

    public static void prepareCalibrationDataForAlgo(Context context, String str) {
        try {
            CameraCharacteristics cameraCharacteristics = ((CameraManager) context.getSystemService("camera")).getCameraCharacteristics(str);
            Integer num = (Integer) cameraCharacteristics.get(CameraCharacteristics.LENS_FACING);
            if (num != null) {
                boolean z = num.intValue() == 0;
                try {
                    byte[] bArr = (byte[]) cameraCharacteristics.get((Key) Class.forName("android.hardware.camera2.CameraCharacteristics$Key").getDeclaredConstructor(new Class[]{String.class, Class.class}).newInstance(new Object[]{"com.xiaomi.camera.algoup.dualCalibrationData", byte[].class}));
                    if (bArr != null) {
                        CommonUtil.saveCameraCalibrationToFile(context, bArr, z);
                    }
                } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | NoSuchMethodException | InvocationTargetException e) {
                    Log.e(TAG, "prepareCalibrationDataForAlgo: call reflect method failed!", e);
                    throw new RuntimeException("getCameraCharacteristics's dualCalibrationData failed");
                }
            }
        } catch (CameraAccessException e2) {
            Log.e(TAG, "prepareCalibrationDataForAlgo: get getCameraCharacteristics failed!", e2);
        }
    }
}
