package com.android.camera;

import android.app.Activity;
import android.miui.R;
import android.os.AsyncTask;
import android.os.Build.VERSION;
import android.os.PowerManager;
import android.provider.Settings.System;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.Spline;
import android.view.WindowManager.LayoutParams;
import com.android.camera.log.Log;
import com.android.internal.R.array;
import com.android.internal.R.bool;
import com.android.internal.R.integer;
import com.mi.config.b;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.ref.WeakReference;
import miui.reflect.Field;
import miui.reflect.NoSuchFieldException;
import miui.util.ReflectionUtils;

public class CameraBrightness implements CameraBrightnessCallback {
    private static final String TAG = "CameraBrightness";
    private int mBrightness;
    private AsyncTask<Void, Void, Integer> mCameraBrightnessTask;
    private Activity mCurrentActivity;
    private boolean mFirstFocusChanged = false;
    private boolean mPaused;
    private boolean mUseDefaultValue = true;

    private static class CameraBrightnessTask extends AsyncTask<Void, Void, Integer> {
        private final float ADJUST_RATIO_BASE = 0.1f;
        private final float ADJUST_RATIO_RANGE = 0.3f;
        private final boolean DEBUG = false;
        private WeakReference<Activity> mActivityWeakReference;
        private WeakReference<CameraBrightnessCallback> mCallbackWeakReference;
        private boolean mPaused;
        private Spline mPositiveScreenManualBrightnessSpline;
        private Spline mScreenManualBrightnessSpline;
        private boolean mUseDefaultValue;

        public CameraBrightnessTask(Activity activity, CameraBrightnessCallback cameraBrightnessCallback, boolean z, boolean z2) {
            this.mActivityWeakReference = new WeakReference<>(activity);
            this.mCallbackWeakReference = new WeakReference<>(cameraBrightnessCallback);
            this.mPaused = z2;
            this.mUseDefaultValue = z;
        }

        private Spline createManualBrightnessSpline(int[] iArr, int[] iArr2) {
            try {
                int length = iArr.length;
                float[] fArr = new float[length];
                float[] fArr2 = new float[length];
                for (int i = 0; i < length; i++) {
                    fArr[i] = (float) iArr[i];
                    fArr2[i] = (float) iArr2[i];
                }
                return new MonotoneCubicSpline(fArr, fArr2);
            } catch (IllegalArgumentException e) {
                Log.e(CameraBrightness.TAG, "Could not create manual-brightness spline.", e);
                return null;
            }
        }

        private void createSpline() {
            if ((this.mScreenManualBrightnessSpline == null || this.mPositiveScreenManualBrightnessSpline == null) && getAndroidBoolRes("config_manual_spline_available", true)) {
                int[] androidArrayRes = getAndroidArrayRes("config_manualBrightnessRemapIn");
                int[] androidArrayRes2 = getAndroidArrayRes("config_manualBrightnessRemapOut");
                this.mScreenManualBrightnessSpline = createManualBrightnessSpline(androidArrayRes2, androidArrayRes);
                this.mPositiveScreenManualBrightnessSpline = createManualBrightnessSpline(androidArrayRes, androidArrayRes2);
                if (this.mScreenManualBrightnessSpline == null || this.mPositiveScreenManualBrightnessSpline == null) {
                    Log.e(CameraBrightness.TAG, "Error to create manual brightness spline");
                }
            }
        }

        private String execCommand(String str) {
            long currentTimeMillis = System.currentTimeMillis();
            String str2 = "";
            try {
                Process exec = Runtime.getRuntime().exec(str);
                if (exec.waitFor() != 0) {
                    String str3 = CameraBrightness.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("exit value = ");
                    sb.append(exec.exitValue());
                    Log.e(str3, sb.toString());
                    return str2;
                }
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(exec.getInputStream()));
                StringBuffer stringBuffer = new StringBuffer();
                while (true) {
                    String readLine = bufferedReader.readLine();
                    if (readLine == null) {
                        break;
                    }
                    stringBuffer.append(readLine);
                }
                bufferedReader.close();
                String stringBuffer2 = stringBuffer.toString();
                String str4 = CameraBrightness.TAG;
                try {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("execCommand lcd value=");
                    sb2.append(stringBuffer2);
                    sb2.append(" cost=");
                    sb2.append(System.currentTimeMillis() - currentTimeMillis);
                    Log.v(str4, sb2.toString());
                    str2 = stringBuffer2;
                } catch (InterruptedException e) {
                    str2 = stringBuffer2;
                    e = e;
                    Log.e(CameraBrightness.TAG, "execCommand InterruptedException");
                    e.printStackTrace();
                    return str2;
                } catch (IOException e2) {
                    str2 = stringBuffer2;
                    e = e2;
                    Log.e(CameraBrightness.TAG, "execCommand IOException");
                    e.printStackTrace();
                    return str2;
                }
                return str2;
            } catch (InterruptedException e3) {
                e = e3;
                Log.e(CameraBrightness.TAG, "execCommand InterruptedException");
                e.printStackTrace();
                return str2;
            } catch (IOException e4) {
                e = e4;
                Log.e(CameraBrightness.TAG, "execCommand IOException");
                e.printStackTrace();
                return str2;
            }
        }

        private int[] getAndroidArrayRes(String str) {
            try {
                return CameraAppImpl.getAndroidContext().getResources().getIntArray(Field.of(array.class, str, Field.INT_SIGNATURE_PRIMITIVE).getInt(null));
            } catch (NoSuchFieldException e) {
                Log.e(CameraBrightness.TAG, e.getMessage());
                try {
                    return CameraAppImpl.getAndroidContext().getResources().getIntArray(Field.of(R.array.class, str, Field.INT_SIGNATURE_PRIMITIVE).getInt(null));
                } catch (NoSuchFieldException e2) {
                    Log.e(CameraBrightness.TAG, e2.getMessage());
                    return new int[]{0, 255};
                } catch (IllegalArgumentException e3) {
                    Log.e(CameraBrightness.TAG, e3.getMessage());
                    return new int[]{0, 255};
                }
            } catch (IllegalArgumentException e4) {
                Log.e(CameraBrightness.TAG, e4.getMessage());
                return CameraAppImpl.getAndroidContext().getResources().getIntArray(Field.of(R.array.class, str, Field.INT_SIGNATURE_PRIMITIVE).getInt(null));
            }
        }

        private boolean getAndroidBoolRes(String str, boolean z) {
            try {
                return CameraAppImpl.getAndroidContext().getResources().getBoolean(Field.of(bool.class, str, Field.INT_SIGNATURE_PRIMITIVE).getInt(null));
            } catch (NoSuchFieldException e) {
                Log.e(CameraBrightness.TAG, e.getMessage());
                try {
                    return CameraAppImpl.getAndroidContext().getResources().getBoolean(Field.of(R.bool.class, str, Field.INT_SIGNATURE_PRIMITIVE).getInt(null));
                } catch (NoSuchFieldException e2) {
                    Log.e(CameraBrightness.TAG, e2.getMessage());
                    return z;
                } catch (IllegalArgumentException e3) {
                    Log.e(CameraBrightness.TAG, e3.getMessage());
                    return z;
                }
            } catch (IllegalArgumentException e4) {
                Log.e(CameraBrightness.TAG, e4.getMessage());
                return CameraAppImpl.getAndroidContext().getResources().getBoolean(Field.of(R.bool.class, str, Field.INT_SIGNATURE_PRIMITIVE).getInt(null));
            }
        }

        private int getAndroidIntResource(String str) {
            try {
                return CameraAppImpl.getAndroidContext().getResources().getInteger(Field.of(integer.class, str, Field.INT_SIGNATURE_PRIMITIVE).getInt(null));
            } catch (NoSuchFieldException e) {
                Log.e(CameraBrightness.TAG, e.getMessage());
                return 0;
            } catch (IllegalArgumentException e2) {
                Log.e(CameraBrightness.TAG, e2.getMessage());
                return 0;
            }
        }

        @Nullable
        private Integer getBrightIsAndroidP(LayoutParams layoutParams, Activity activity) {
            try {
                int i = ReflectionUtils.findField(PowerManager.class, "BRIGHTNESS_ON").getInt(PowerManager.class);
                int i2 = System.getInt(activity.getContentResolver(), "screen_brightness");
                String str = CameraBrightness.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("android P -> current back light -> ");
                sb.append(i2);
                Log.d(str, sb.toString());
                float enLargeBrightness = (float) toEnLargeBrightness((int) Math.ceil((double) (((float) (i2 * 256)) / ((float) (i + 1)))));
                if (layoutParams.screenBrightness <= 0.0f || enLargeBrightness != ((float) ((int) (layoutParams.screenBrightness * 255.0f)))) {
                    return Integer.valueOf((int) enLargeBrightness);
                }
                Log.v(CameraBrightness.TAG, "android P -> doInBackground brightness unchanged");
                return null;
            } catch (Exception e) {
                Log.e(CameraBrightness.TAG, e.toString());
                return null;
            }
        }

        @Nullable
        private Integer getBrightNotAndroidP(LayoutParams layoutParams) {
            int currentBackLight = getCurrentBackLight();
            String str = CameraBrightness.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("current back light -> ");
            sb.append(currentBackLight);
            Log.d(str, sb.toString());
            if (currentBackLight <= 0) {
                return null;
            }
            createSpline();
            if (layoutParams.screenBrightness > 0.0f) {
                float f = layoutParams.screenBrightness * 255.0f;
                if (Math.abs((this.mPositiveScreenManualBrightnessSpline != null ? Math.round(this.mPositiveScreenManualBrightnessSpline.interpolate(f)) : Math.round(f)) - currentBackLight) <= 1) {
                    Log.v(CameraBrightness.TAG, "doInBackground brightness unchanged");
                    return null;
                }
            }
            if (this.mScreenManualBrightnessSpline != null) {
                currentBackLight = (int) this.mScreenManualBrightnessSpline.interpolate((float) currentBackLight);
            }
            return Integer.valueOf(toEnLargeBrightness(currentBackLight));
        }

        private int getCurrentBackLight() {
            String str = null;
            int i = 0;
            while (true) {
                if (("0".equals(str) || str == null) && i < 3 && !isCancelled()) {
                    str = execCommand("cat sys/class/backlight/panel0-backlight/brightness");
                    if ("0".equals(str) || str == null) {
                        try {
                            Thread.sleep(300);
                        } catch (InterruptedException e) {
                            Log.e(CameraBrightness.TAG, e.getMessage());
                        }
                        i++;
                    }
                }
            }
            String str2 = CameraBrightness.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("getCurrentBackLight currentSetting=");
            sb.append(str);
            Log.v(str2, sb.toString());
            if (TextUtils.isEmpty(str)) {
                return -1;
            }
            int androidIntResource = getAndroidIntResource("config_backlightBits");
            if (androidIntResource <= 0) {
                androidIntResource = getMiuiIntResource("config_backlightBit");
            }
            int parseFloat = (int) Float.parseFloat(str);
            if (androidIntResource <= 8) {
                return -1;
            }
            int i2 = androidIntResource - 8;
            int i3 = 1;
            if (parseFloat >= (1 << i2)) {
                i3 = parseFloat >> i2;
            }
            String str3 = CameraBrightness.TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("getCurrentBackLight convert to ");
            sb2.append(i3);
            Log.v(str3, sb2.toString());
            return i3;
        }

        private int getMiuiIntResource(String str) {
            try {
                return CameraAppImpl.getAndroidContext().getResources().getInteger(Field.of(R.integer.class, str, Field.INT_SIGNATURE_PRIMITIVE).getInt(null));
            } catch (NoSuchFieldException e) {
                Log.e(CameraBrightness.TAG, e.getMessage());
                return 0;
            } catch (IllegalArgumentException e2) {
                Log.e(CameraBrightness.TAG, e2.getMessage());
                return 0;
            }
        }

        private int toEnLargeBrightness(int i) {
            return Integer.valueOf(Util.clamp((int) (((double) i) * (1.0d + ((double) (0.1f + ((((float) Util.clamp(i, 0, 185)) / 185.0f) * 0.3f))))), 0, 255)).intValue();
        }

        private void updateBrightness(int i) {
            Activity activity = (Activity) this.mActivityWeakReference.get();
            if (activity != null && (i != -1 || this.mUseDefaultValue || this.mPaused)) {
                LayoutParams attributes = activity.getWindow().getAttributes();
                if (this.mUseDefaultValue || this.mPaused) {
                    attributes.screenBrightness = -1.0f;
                } else {
                    attributes.screenBrightness = ((float) i) / 255.0f;
                }
                String str = CameraBrightness.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("updateBrightness setting=");
                sb.append(i);
                sb.append(" useDefaultValue=");
                sb.append(this.mUseDefaultValue);
                sb.append(" screenBrightness=");
                sb.append(attributes.screenBrightness);
                Log.v(str, sb.toString());
                activity.getWindow().setAttributes(attributes);
                CameraBrightnessCallback cameraBrightnessCallback = (CameraBrightnessCallback) this.mCallbackWeakReference.get();
                if (cameraBrightnessCallback != null) {
                    cameraBrightnessCallback.setBrightness(i);
                }
            }
        }

        /* access modifiers changed from: protected */
        public Integer doInBackground(Void... voidArr) {
            String str = CameraBrightness.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("doInBackground useDefaultValue=");
            sb.append(this.mUseDefaultValue);
            sb.append(" paused=");
            sb.append(this.mPaused);
            Log.v(str, sb.toString());
            Activity activity = (Activity) this.mActivityWeakReference.get();
            if (activity == null || this.mUseDefaultValue || this.mPaused) {
                return Integer.valueOf(-1);
            }
            LayoutParams attributes = activity.getWindow().getAttributes();
            return VERSION.SDK_INT >= 28 ? getBrightIsAndroidP(attributes, activity) : getBrightNotAndroidP(attributes);
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Integer num) {
            if (!isCancelled() && num != null) {
                updateBrightness(num.intValue());
            }
        }
    }

    public static class MonotoneCubicSpline extends Spline {
        private float[] mM;
        private float[] mX;
        private float[] mY;

        public MonotoneCubicSpline(float[] fArr, float[] fArr2) {
            if (fArr == null || fArr2 == null || fArr.length != fArr2.length || fArr.length < 2) {
                throw new IllegalArgumentException("There must be at least two control points and the arrays must be of equal length.");
            }
            int length = fArr.length;
            int i = length - 1;
            float[] fArr3 = new float[i];
            float[] fArr4 = new float[length];
            int i2 = 0;
            while (i2 < i) {
                int i3 = i2 + 1;
                float f = fArr[i3] - fArr[i2];
                if (f > 0.0f) {
                    fArr3[i2] = (fArr2[i3] - fArr2[i2]) / f;
                    i2 = i3;
                } else {
                    throw new IllegalArgumentException("The control points must all have strictly increasing X values.");
                }
            }
            fArr4[0] = fArr3[0];
            for (int i4 = 1; i4 < i; i4++) {
                fArr4[i4] = (fArr3[i4 - 1] + fArr3[i4]) * 0.5f;
            }
            fArr4[i] = fArr3[length - 2];
            for (int i5 = 0; i5 < i; i5++) {
                if (fArr3[i5] == 0.0f) {
                    fArr4[i5] = 0.0f;
                    fArr4[i5 + 1] = 0.0f;
                } else {
                    float f2 = fArr4[i5] / fArr3[i5];
                    int i6 = i5 + 1;
                    float f3 = fArr4[i6] / fArr3[i5];
                    if (f2 < 0.0f || f3 < 0.0f) {
                        throw new IllegalArgumentException("The control points must have monotonic Y values.");
                    }
                    float hypot = (float) Math.hypot((double) f2, (double) f3);
                    if (hypot > 9.0f) {
                        float f4 = 3.0f / hypot;
                        fArr4[i5] = f2 * f4 * fArr3[i5];
                        fArr4[i6] = f4 * f3 * fArr3[i5];
                    }
                }
            }
            this.mX = fArr;
            this.mY = fArr2;
            this.mM = fArr4;
        }

        public float interpolate(float f) {
            int length = this.mX.length;
            if (Float.isNaN(f)) {
                return f;
            }
            int i = 0;
            if (f <= this.mX[0]) {
                return this.mY[0];
            }
            int i2 = length - 1;
            if (f >= this.mX[i2]) {
                return this.mY[i2];
            }
            while (true) {
                int i3 = i + 1;
                if (f < this.mX[i3]) {
                    float f2 = this.mX[i3] - this.mX[i];
                    float f3 = (f - this.mX[i]) / f2;
                    float f4 = 2.0f * f3;
                    float f5 = (this.mY[i] * (1.0f + f4)) + (this.mM[i] * f2 * f3);
                    float f6 = 1.0f - f3;
                    return (f5 * f6 * f6) + (((this.mY[i3] * (3.0f - f4)) + (f2 * this.mM[i3] * (f3 - 1.0f))) * f3 * f3);
                } else if (f == this.mX[i3]) {
                    return this.mY[i3];
                } else {
                    i = i3;
                }
            }
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            int length = this.mX.length;
            sb.append("MonotoneCubicSpline{[");
            for (int i = 0; i < length; i++) {
                if (i != 0) {
                    sb.append(", ");
                }
                sb.append("(");
                sb.append(this.mX[i]);
                sb.append(", ");
                sb.append(this.mY[i]);
                sb.append(": ");
                sb.append(this.mM[i]);
                sb.append(")");
            }
            sb.append("]}");
            return sb.toString();
        }
    }

    public CameraBrightness(Activity activity) {
        this.mCurrentActivity = activity;
    }

    private void adjustBrightness() {
        if (this.mCurrentActivity != null && b.gW()) {
            cancelLastTask();
            this.mCameraBrightnessTask = new CameraBrightnessTask(this.mCurrentActivity, this, this.mUseDefaultValue, this.mPaused).execute(new Void[0]);
        }
    }

    private void cancelLastTask() {
        if (this.mCameraBrightnessTask != null) {
            this.mCameraBrightnessTask.cancel(true);
            this.mCameraBrightnessTask = null;
        }
    }

    public void adjustBrightnessInAutoMode(float f) {
    }

    public int getCurrentBrightness() {
        return this.mBrightness;
    }

    public float getCurrentBrightnessAuto() {
        return (float) this.mBrightness;
    }

    public int getCurrentBrightnessManual() {
        return this.mBrightness;
    }

    public void onPause() {
        this.mFirstFocusChanged = false;
        this.mPaused = true;
        cancelLastTask();
    }

    public void onResume() {
        this.mUseDefaultValue = this.mCurrentActivity instanceof BasePreferenceActivity;
        this.mPaused = false;
        Log.v(TAG, "onResume adjustBrightness");
        adjustBrightness();
    }

    public void onWindowFocusChanged(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onWindowFocusChanged hasFocus=");
        sb.append(z);
        sb.append(" mFirstFocusChanged=");
        sb.append(this.mFirstFocusChanged);
        Log.v(str, sb.toString());
        boolean z2 = true;
        if (!this.mFirstFocusChanged && z) {
            this.mFirstFocusChanged = true;
        } else if (!this.mPaused) {
            if (!(this.mCurrentActivity instanceof BasePreferenceActivity) && z) {
                z2 = false;
            }
            this.mUseDefaultValue = z2;
            adjustBrightness();
        }
    }

    public void setBrightness(int i) {
        this.mBrightness = i;
    }
}
