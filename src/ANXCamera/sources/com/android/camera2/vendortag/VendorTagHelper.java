package com.android.camera2.vendortag;

import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraCharacteristics.Key;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureResult;
import android.util.Log;
import com.android.camera.CameraAppImpl;
import com.android.camera.R;

public class VendorTagHelper {
    private static final int RETHROW = 51966;
    private static final String TAG = "VendorTagHelper";
    private static final int WARNING = 47806;
    private static int sPreferredAction = -1;

    private static int getPreferredAction() {
        if (sPreferredAction == -1) {
            sPreferredAction = (Log.isLoggable("VENDOR_TAG_NFE_RETHROW", 3) || !CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.rethrow_vendor_tag_not_found_exception)) ? WARNING : RETHROW;
        }
        return sPreferredAction;
    }

    public static <T> T getValue(CameraCharacteristics cameraCharacteristics, VendorTag<Key<T>> vendorTag) {
        return tryGetValue(cameraCharacteristics, vendorTag, getPreferredAction());
    }

    public static <T> T getValue(Builder builder, VendorTag<CaptureRequest.Key<T>> vendorTag) {
        return tryGetValue(builder, vendorTag, getPreferredAction());
    }

    public static <T> T getValue(CaptureResult captureResult, VendorTag<CaptureResult.Key<T>> vendorTag) {
        return tryGetValue(captureResult, vendorTag, getPreferredAction());
    }

    public static <T> T getValueQuietly(CameraCharacteristics cameraCharacteristics, VendorTag<Key<T>> vendorTag) {
        return tryGetValue(cameraCharacteristics, vendorTag, (int) WARNING);
    }

    public static <T> T getValueQuietly(Builder builder, VendorTag<CaptureRequest.Key<T>> vendorTag) {
        return tryGetValue(builder, vendorTag, (int) WARNING);
    }

    public static <T> T getValueQuietly(CaptureResult captureResult, VendorTag<CaptureResult.Key<T>> vendorTag) {
        return tryGetValue(captureResult, vendorTag, (int) WARNING);
    }

    public static <T> void setValue(Builder builder, VendorTag<CaptureRequest.Key<T>> vendorTag, T t) {
        trySetValue(builder, vendorTag, t, getPreferredAction());
    }

    public static <T> void setValueQuietly(Builder builder, VendorTag<CaptureRequest.Key<T>> vendorTag, T t) {
        trySetValue(builder, vendorTag, t, WARNING);
    }

    private static <T> T tryGetValue(CameraCharacteristics cameraCharacteristics, VendorTag<Key<T>> vendorTag, int i) {
        if (cameraCharacteristics == null || vendorTag == null || vendorTag.getKey() == null) {
            Log.w(TAG, "caution: failed to try get value from camera characteristics: <NULL>");
            return null;
        }
        try {
            return cameraCharacteristics.get((Key) vendorTag.getKey());
        } catch (Exception e) {
            if (i != RETHROW) {
                Log.w(TAG, "caution: failed to try get value from camera characteristics: <VTNF>", e);
                return null;
            }
            throw new VendorTagNotFoundException((Throwable) e);
        }
    }

    private static <T> T tryGetValue(Builder builder, VendorTag<CaptureRequest.Key<T>> vendorTag, int i) {
        if (builder == null || vendorTag == null || vendorTag.getKey() == null) {
            Log.w(TAG, "caution: failed to try get value from capture request: <NULL>");
            return null;
        }
        try {
            return builder.get((CaptureRequest.Key) vendorTag.getKey());
        } catch (Exception e) {
            if (i != RETHROW) {
                Log.w(TAG, "caution: failed to try get value from capture request: <VTNF>", e);
                return null;
            }
            throw new VendorTagNotFoundException((Throwable) e);
        }
    }

    private static <T> T tryGetValue(CaptureResult captureResult, VendorTag<CaptureResult.Key<T>> vendorTag, int i) {
        if (captureResult == null || vendorTag == null || vendorTag.getKey() == null) {
            Log.w(TAG, "caution: failed to try get value from capture result: <NULL>");
            return null;
        }
        try {
            return captureResult.get((CaptureResult.Key) vendorTag.getKey());
        } catch (Exception e) {
            if (i != RETHROW) {
                Log.w(TAG, "caution: failed to try get value from capture result: <VTNF>", e);
                return null;
            }
            throw new VendorTagNotFoundException((Throwable) e);
        }
    }

    private static <T> void trySetValue(Builder builder, VendorTag<CaptureRequest.Key<T>> vendorTag, T t, int i) {
        if (builder == null || vendorTag == null || vendorTag.getKey() == null) {
            Log.w(TAG, "caution: failed to update capture request: <NULL>");
            return;
        }
        try {
            builder.set((CaptureRequest.Key) vendorTag.getKey(), t);
        } catch (Exception e) {
            if (i != RETHROW) {
                Log.w(TAG, "caution: failed to update capture request: <VTNF>", e);
            } else {
                throw new VendorTagNotFoundException((Throwable) e);
            }
        }
    }
}
