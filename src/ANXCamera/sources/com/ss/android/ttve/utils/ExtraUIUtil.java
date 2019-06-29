package com.ss.android.ttve.utils;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.WindowManager;

public class ExtraUIUtil {
    public static final float DEFAULT_SURFACE_SCALE_HEIGHT = 16.0f;
    public static final float DEFAULT_SURFACE_SCALE_WIDTH = 9.0f;
    public static final int SURFACE_LOCATION_HEIGHT_INDEX = 3;
    public static final int SURFACE_LOCATION_WIDTH_INDEX = 2;
    public static final int SURFACE_LOCATION_X_INDEX = 0;
    public static final int SURFACE_LOCATION_Y_INDEX = 1;
    public static final String TAG = "ExtraUIUtil";

    public static float[] calScreenSurfaceLocation(Context context, int i, int i2, int i3, int i4, int i5) {
        int i6;
        int i7;
        int i8 = i;
        int i9 = i5;
        if (i9 == 90 || i9 == 270) {
            i6 = i3;
            i7 = i4;
        } else {
            i7 = i3;
            i6 = i4;
        }
        float f = (float) i7;
        float f2 = (float) i6;
        float[] fArr = {0.0f, 0.0f, f, f2};
        if (context == null) {
            Log.e(TAG, "Context is null while calculating surface location!");
            return fArr;
        }
        if (f * 16.0f > f2 * 9.0f) {
            float f3 = (float) i8;
            fArr[2] = f3;
            fArr[3] = ((1.0f * f2) * f3) / f;
            int i10 = i2;
        } else {
            float f4 = (float) i2;
            fArr[3] = f4;
            fArr[2] = (9.0f * f4) / 16.0f;
            float f5 = (float) i8;
            fArr[0] = (f5 - fArr[2]) / 2.0f;
            if (fArr[0] > 0.0f) {
                fArr[0] = 0.0f;
                fArr[2] = f5;
                fArr[3] = ((1.0f * f2) * f5) / f;
            }
        }
        Log.d(TAG, String.format("video[%d, %d], max[%d, %d], screen[%d, %d], surface[%f, %f, %f, %f]", new Object[]{Integer.valueOf(i7), Integer.valueOf(i6), Integer.valueOf(i), Integer.valueOf(i2), Integer.valueOf(UIUtils.getScreenWidth(context)), Integer.valueOf(UIUtils.getScreenHeight(context)), Float.valueOf(fArr[0]), Float.valueOf(fArr[1]), Float.valueOf(fArr[2]), Float.valueOf(fArr[3])}));
        return fArr;
    }

    public static int getNavigationBarHeight(Context context) {
        int i = 0;
        if (context == null) {
            return 0;
        }
        int identifier = context.getResources().getIdentifier("navigation_bar_height", "dimen", "android");
        if (identifier > 0) {
            i = context.getResources().getDimensionPixelSize(identifier);
        }
        return i;
    }

    @TargetApi(17)
    public static int getRealDisplayHeight(Context context) {
        int i;
        if (context == null) {
            return 0;
        }
        DisplayMetrics displayMetrics = new DisplayMetrics();
        try {
            ((WindowManager) context.getSystemService("window")).getDefaultDisplay().getRealMetrics(displayMetrics);
            i = displayMetrics.heightPixels;
        } catch (Exception e) {
            i = UIUtils.getScreenHeight(context);
        }
        return i;
    }
}
