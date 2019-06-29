package com.android.camera;

import android.graphics.Rect;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.mi.config.b;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Locale;
import java.util.Map;
import java.util.Scanner;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

public class HybridZoomingSystem {
    private static final String DEFAULT_OPTICAL_ZOOM_RATIO_COMBINATION = (b.isSupportedOpticalZoom() ? "1.0:2.0" : "1.0");
    public static final float FLOAT_MICRO_SCENE_ZOOM_MAX = 1.0f;
    public static final float FLOAT_MOON_MODE_ZOOM_MAX = 20.0f;
    public static final float FLOAT_MOON_MODE_ZOOM_MIN = 1.0f;
    public static final float FLOAT_STEP_FOR_ZOOM_RATIO_CHANGE = 0.1f;
    public static final float FLOAT_ULTRA_WIDE_ZOOM_MAX = 6.0f;
    public static final float FLOAT_ZOOM_RATIO_FOLD = 5.0f;
    public static final float FLOAT_ZOOM_RATIO_NONE = 1.0f;
    public static final float FLOAT_ZOOM_RATIO_TELE = (IS_3_SAT ? sSupportedOpticalZoomRatios[2] : 2.0f);
    public static final float FLOAT_ZOOM_RATIO_ULTR = (IS_3_SAT ? sSupportedOpticalZoomRatios[0] : 0.6f);
    public static final float FLOAT_ZOOM_RATIO_WIDE;
    public static final boolean IS_2_OR_MORE_SAT = OPTICAL_ZOOM_RATIO_COMBINATION.matches("^\\d+\\.\\d+\\s*:\\s*\\d+\\.\\d+(\\s*:\\s*\\d+\\.\\d+)*$");
    public static final boolean IS_2_SAT = OPTICAL_ZOOM_RATIO_COMBINATION.matches("^\\d+\\.\\d+\\s*:\\s*\\d+\\.\\d+$");
    public static final boolean IS_3_OR_MORE_SAT = OPTICAL_ZOOM_RATIO_COMBINATION.matches("^\\d+\\.\\d+\\s*:\\s*\\d+\\.\\d+\\s*:\\s*\\d+\\.\\d+(\\s*:\\s*\\d+\\.\\d+)*$");
    public static final boolean IS_3_SAT = OPTICAL_ZOOM_RATIO_COMBINATION.matches("^\\d+\\.\\d+\\s*:\\s*\\d+\\.\\d+\\s*:\\s*\\d+\\.\\d+$");
    private static final String OPTICAL_ZOOM_RATIO_COMBINATION = DataRepository.dataItemFeature().L(DEFAULT_OPTICAL_ZOOM_RATIO_COMBINATION);
    private static final String STANDALONE_MACRO_OPTICAL_ZOOM_RATIO_COMBINATION = DataRepository.dataItemFeature().M(DEFAULT_OPTICAL_ZOOM_RATIO_COMBINATION);
    public static final String STRING_ZOOM_RATIO_NONE = "1.0";
    public static final String STRING_ZOOM_RATIO_TELE = String.format(Locale.US, "%.1fx", new Object[]{Float.valueOf(FLOAT_ZOOM_RATIO_TELE)});
    public static final String STRING_ZOOM_RATIO_ULTR = String.format(Locale.US, "%.1fx", new Object[]{Float.valueOf(FLOAT_ZOOM_RATIO_ULTR)});
    public static final String STRING_ZOOM_RATIO_WIDE = String.format(Locale.US, "%.1fx", new Object[]{Float.valueOf(FLOAT_ZOOM_RATIO_WIDE)});
    private static final String TAG = "HybridZoomingSystem";
    public static final float TOLERANCE_FOR_ZOOM_RATIO_CHANGED = 0.01f;
    private static int sDefaultOpticalZoomRatioIndex;
    public static float sDefaultStandaloneMacroOpticalZoomRatio = 1.0f;
    private static int sDefaultStandaloneMacroOpticalZoomRatioIndex;
    private static float[] sStandaloneMacroSupportedOpticalZoomRatios;
    private static float[] sSupportedOpticalZoomRatios;
    private static final Map<Integer, String> sZoomRatioHistory = new ConcurrentHashMap();
    private static final AtomicInteger sZoomingSourceIdentity = new AtomicInteger(0);

    private static /* synthetic */ void $closeResource(Throwable th, AutoCloseable autoCloseable) {
        if (th != null) {
            try {
                autoCloseable.close();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
        } else {
            autoCloseable.close();
        }
    }

    static {
        Throwable th;
        Throwable th2;
        sDefaultOpticalZoomRatioIndex = -1;
        sDefaultStandaloneMacroOpticalZoomRatioIndex = -1;
        float f = 1.0f;
        ArrayList<String> arrayList = new ArrayList<>();
        Scanner scanner = new Scanner(OPTICAL_ZOOM_RATIO_COMBINATION);
        try {
            scanner.useDelimiter("\\s*[:,]\\s*");
            int i = -1;
            while (scanner.hasNext()) {
                String next = scanner.next();
                if (next != null && next.length() > 0) {
                    arrayList.add(next);
                    i++;
                    if (next.equals("1.0") && sDefaultOpticalZoomRatioIndex == -1) {
                        sDefaultOpticalZoomRatioIndex = i;
                    }
                }
            }
            $closeResource(null, scanner);
            if (sDefaultOpticalZoomRatioIndex < 0 || arrayList.size() < 1) {
                throw new IllegalStateException("The supported optical zoom ratios are probably not configured correctly");
            }
            sSupportedOpticalZoomRatios = new float[arrayList.size()];
            int i2 = 0;
            for (String parseFloat : arrayList) {
                int i3 = i2 + 1;
                sSupportedOpticalZoomRatios[i2] = Float.parseFloat(parseFloat);
                i2 = i3;
            }
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append(Arrays.toString(sSupportedOpticalZoomRatios));
            sb.append("[");
            sb.append(sDefaultOpticalZoomRatioIndex);
            sb.append("]");
            Log.d(str, sb.toString());
            if (DataRepository.dataItemFeature().hu()) {
                arrayList.clear();
                Scanner scanner2 = new Scanner(STANDALONE_MACRO_OPTICAL_ZOOM_RATIO_COMBINATION);
                try {
                    scanner2.useDelimiter("\\s*[:,]\\s*");
                    int i4 = -1;
                    while (scanner2.hasNext()) {
                        String next2 = scanner2.next();
                        if (next2 != null && next2.length() > 0) {
                            arrayList.add(next2);
                            i4++;
                            if (next2.equals("1.0") && sDefaultStandaloneMacroOpticalZoomRatioIndex == -1) {
                                sDefaultStandaloneMacroOpticalZoomRatioIndex = i4;
                            }
                        }
                    }
                    $closeResource(null, scanner2);
                    if (sDefaultStandaloneMacroOpticalZoomRatioIndex < 0 || arrayList.size() < 1) {
                        throw new IllegalStateException("The supported optical zoom ratios are probably not configured correctly");
                    }
                    sStandaloneMacroSupportedOpticalZoomRatios = new float[arrayList.size()];
                    int i5 = 0;
                    for (String parseFloat2 : arrayList) {
                        int i6 = i5 + 1;
                        sStandaloneMacroSupportedOpticalZoomRatios[i5] = Float.parseFloat(parseFloat2);
                        i5 = i6;
                    }
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(Arrays.toString(sStandaloneMacroSupportedOpticalZoomRatios));
                    sb2.append("[");
                    sb2.append(sDefaultStandaloneMacroOpticalZoomRatioIndex);
                    sb2.append("]");
                    Log.d(str2, sb2.toString());
                } catch (Throwable th3) {
                    $closeResource(th2, scanner2);
                    throw th3;
                }
            }
            if (IS_3_SAT) {
                f = sSupportedOpticalZoomRatios[1];
            }
            FLOAT_ZOOM_RATIO_WIDE = f;
        } catch (Throwable th4) {
            $closeResource(th, scanner);
            throw th4;
        }
    }

    private HybridZoomingSystem() {
    }

    public static float add(float f, float f2) {
        return ((float) (((int) (f * 10.0f)) + ((int) (f2 * 10.0f)))) / 10.0f;
    }

    public static float clamp(float f, float f2, float f3) {
        return f > f3 ? f3 : f < f2 ? f2 : f;
    }

    public static void clearZoomRatioHistory() {
        Log.d(TAG, "clearZoomRatioHistory()");
        sZoomRatioHistory.clear();
        sZoomingSourceIdentity.set(0);
    }

    public static int getDefaultOpticalZoomRatioIndex() {
        return sDefaultOpticalZoomRatioIndex;
    }

    public static int getDefaultStandaloneMacroOpticalZoomRatioIndex() {
        return sDefaultStandaloneMacroOpticalZoomRatioIndex;
    }

    public static float getMaximumOpticalZoomRatio() {
        return sSupportedOpticalZoomRatios[sSupportedOpticalZoomRatios.length - 1];
    }

    public static float getMaximumStandaloneOpticalZoomRatio() {
        return sStandaloneMacroSupportedOpticalZoomRatios[sStandaloneMacroSupportedOpticalZoomRatios.length - 1];
    }

    public static float getMinimumOpticalZoomRatio() {
        return sSupportedOpticalZoomRatios[0];
    }

    public static float getMinimumStandaloneOpticalZoomRatio() {
        return sStandaloneMacroSupportedOpticalZoomRatios[0];
    }

    public static float getOpticalZoomRatioAt(int i) {
        int length = sSupportedOpticalZoomRatios.length;
        if (i >= 0 && i < length) {
            return sSupportedOpticalZoomRatios[i];
        }
        StringBuilder sb = new StringBuilder();
        sb.append("The given index must be in range [0, ");
        sb.append(length);
        sb.append(")");
        throw new ArrayIndexOutOfBoundsException(sb.toString());
    }

    public static int getOpticalZoomRatioIndex(float f) {
        for (int length = sSupportedOpticalZoomRatios.length - 1; length >= 0; length--) {
            if (f >= sSupportedOpticalZoomRatios[length]) {
                return length;
            }
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Illegal zoom ratio: ");
        sb.append(f);
        throw new IllegalArgumentException(sb.toString());
    }

    public static float getStandaloneMacroOpticalZoomRatioAt(int i) {
        int length = sStandaloneMacroSupportedOpticalZoomRatios.length;
        if (i >= 0 && i < length) {
            return sStandaloneMacroSupportedOpticalZoomRatios[i];
        }
        StringBuilder sb = new StringBuilder();
        sb.append("The given index must be in range [0, ");
        sb.append(length);
        sb.append(")");
        throw new ArrayIndexOutOfBoundsException(sb.toString());
    }

    public static int getStandaloneMacroOpticalZoomRatioIndex(float f) {
        int i = -1;
        float f2 = 0.0f;
        for (int length = sStandaloneMacroSupportedOpticalZoomRatios.length - 1; length >= 0; length--) {
            if (f >= sStandaloneMacroSupportedOpticalZoomRatios[length]) {
                return length;
            }
            if (f2 >= sStandaloneMacroSupportedOpticalZoomRatios[length]) {
                f2 = sStandaloneMacroSupportedOpticalZoomRatios[length];
            }
            if (f2 >= sStandaloneMacroSupportedOpticalZoomRatios[length]) {
                i = length;
            }
        }
        if (f2 < f) {
            return i;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Illegal zoom ratio: ");
        sb.append(f);
        throw new IllegalArgumentException(sb.toString());
    }

    public static float[] getStandaloneMacroSupportedOpticalZoomRatios() {
        return sStandaloneMacroSupportedOpticalZoomRatios;
    }

    public static float[] getSupportedOpticalZoomRatios() {
        return sSupportedOpticalZoomRatios;
    }

    public static String getZoomRatioHistory(int i, String str) {
        String str2 = (String) sZoomRatioHistory.get(Integer.valueOf(i));
        return str2 != null ? str2 : str;
    }

    public static int getZoomingSourceIdentity() {
        return sZoomingSourceIdentity.get();
    }

    public static boolean isOpticalZoomRatio(float f) {
        return Arrays.binarySearch(sSupportedOpticalZoomRatios, f) >= 0;
    }

    static void preload() {
        Log.d(TAG, "preload");
    }

    public static void setZoomRatioHistory(int i, String str) {
        sZoomRatioHistory.put(Integer.valueOf(i), str);
    }

    public static void setZoomingSourceIdentity(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setZoomingSourceIdentity(): ");
        sb.append(i);
        Log.d(str, sb.toString());
        sZoomingSourceIdentity.set(i);
    }

    public static float sub(float f, float f2) {
        return ((float) (((int) (f * 10.0f)) - ((int) (f2 * 10.0f)))) / 10.0f;
    }

    public static Rect toCropRegion(float f, Rect rect) {
        if (f <= 0.0f) {
            throw new IllegalArgumentException("Zoom ratio must be greater than 0.0f");
        } else if (rect != null) {
            int width = rect.width() / 2;
            int height = rect.height() / 2;
            float f2 = 2.0f * f;
            int width2 = (int) (((float) rect.width()) / f2);
            int height2 = (int) (((float) rect.height()) / f2);
            Rect rect2 = new Rect();
            rect2.set(width - width2, height - height2, width + width2, height + height2);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("toCropRegion(): zoom ratio = ");
            sb.append(f);
            sb.append(", crop region = ");
            sb.append(rect2);
            Log.d(str, sb.toString());
            return rect2;
        } else {
            throw new IllegalArgumentException("activeArraySize must be non null");
        }
    }

    public static float toDecimal(float f) {
        return ((float) ((int) (f * 10.0f))) / 10.0f;
    }

    public static float toFloat(String str, float f) {
        try {
            return Float.parseFloat(str);
        } catch (Exception e) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Invalid zoom: ");
            sb.append(str);
            Log.e(str2, sb.toString());
            return f;
        }
    }

    public static String toString(float f) {
        if (FLOAT_ZOOM_RATIO_ULTR == f) {
            return STRING_ZOOM_RATIO_ULTR;
        }
        if (FLOAT_ZOOM_RATIO_WIDE == f) {
            return STRING_ZOOM_RATIO_WIDE;
        }
        if (FLOAT_ZOOM_RATIO_TELE == f) {
            return STRING_ZOOM_RATIO_TELE;
        }
        return String.format(Locale.US, "%.1fx", new Object[]{Float.valueOf(toDecimal(f))});
    }
}
