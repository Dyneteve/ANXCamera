package com.android.camera;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.os.SystemProperties;
import com.android.camera.log.Log;

public class SensorStateManager {
    private static final int ACCELEROMETER = 8;
    private static final double ACCELEROMETER_GAP_TOLERANCE = 0.8999999761581421d;
    private static final int ACCELEROMETER_THRESHOLD = 16;
    /* access modifiers changed from: private */
    public static final int CAPTURE_POSTURE_DEGREE = SystemProperties.getInt("capture_degree", 45);
    private static final long EVENT_PROCESS_INTERVAL = 100000000;
    private static final long EVENT_TIME_OUT = 1000000000;
    private static final int GAME_ROTATION = 64;
    private static final int GRAVITY = 32;
    private static final int GYROSCOPE = 2;
    private static final double GYROSCOPE_FOCUS_THRESHOLD = 1.0471975511965976d;
    private static final double GYROSCOPE_IGNORE_THRESHOLD = 0.05000000074505806d;
    /* access modifiers changed from: private */
    public static final double GYROSCOPE_MOVING_THRESHOLD = ((double) (((float) SystemProperties.getInt("camera_moving_threshold", 15)) / 10.0f));
    private static final double GYROSCOPE_STABLE_THRESHOLD = ((double) (((float) SystemProperties.getInt("camera_stable_threshold", 9)) / 10.0f));
    public static final int LEFT_CAPTURE_POSTURE = 1;
    private static final int LINEAR_ACCELEROMETER = 1;
    private static final int LYING_HYSTERESIS = 5;
    private static final int MAX_LYING_BOUND = 153;
    private static final int MIN_LYING_BOUND = 26;
    private static final int MSG_DEVICE_BECOME_STABLE = 1;
    private static final int MSG_UPDATE = 2;
    private static final float NS2S = 1.0E-9f;
    private static final int ORIENTATION = 4;
    public static final int ORIENTATION_UNKNOWN = -1;
    public static final int PORTRAIT_CAPTURE_POSTURE = 0;
    public static final int RIGHT_CAPTURE_POSTURE = 2;
    private static final int ROTATION_VECTOR = 16;
    public static final int SENSOR_ALL = 127;
    private static final String TAG = "SensorStateManager";
    private final Sensor mAccelerometerSensor;
    private SensorEventListener mAccelerometerSensorEventListenerImpl = new SensorEventListener() {
        private static final float CLEAR_FILTER_THRESHOLD = 3.0f;
        private static final int _DATA_X = 0;
        private static final int _DATA_Y = 1;
        private static final int _DATA_Z = 2;
        private static final float finalAlpha = 0.7f;
        private static final float firstAlpha = 0.8f;
        private float[] finalFilter = new float[3];
        private float[] firstFilter = new float[3];

        private void clearFilter() {
            for (int i = 0; i < this.firstFilter.length; i++) {
                this.firstFilter[i] = 0.0f;
                this.finalFilter[i] = 0.0f;
            }
        }

        public void onAccuracyChanged(Sensor sensor, int i) {
            String str = SensorStateManager.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onAccuracyChanged accuracy=");
            sb.append(i);
            Log.v(str, sb.toString());
        }

        public void onSensorChanged(SensorEvent sensorEvent) {
            SensorStateListener access$000 = SensorStateManager.this.getSensorStateListener();
            if (access$000 != null) {
                this.firstFilter[0] = (this.firstFilter[0] * firstAlpha) + (sensorEvent.values[0] * 0.19999999f);
                this.firstFilter[1] = (this.firstFilter[1] * firstAlpha) + (sensorEvent.values[1] * 0.19999999f);
                this.firstFilter[2] = (firstAlpha * this.firstFilter[2]) + (0.19999999f * sensorEvent.values[2]);
                this.finalFilter[0] = (this.finalFilter[0] * 0.7f) + (this.firstFilter[0] * 0.3f);
                this.finalFilter[1] = (this.finalFilter[1] * 0.7f) + (this.firstFilter[1] * 0.3f);
                this.finalFilter[2] = (0.7f * this.finalFilter[2]) + (0.3f * this.firstFilter[2]);
                String str = SensorStateManager.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("finalFilter=");
                sb.append(this.finalFilter[0]);
                sb.append(" ");
                sb.append(this.finalFilter[1]);
                sb.append(" ");
                sb.append(this.finalFilter[2]);
                sb.append(" event.values=");
                sb.append(sensorEvent.values[0]);
                sb.append(" ");
                sb.append(sensorEvent.values[1]);
                sb.append(" ");
                sb.append(sensorEvent.values[2]);
                Log.v(str, sb.toString());
                float f = -1.0f;
                float f2 = -this.finalFilter[0];
                float f3 = -this.finalFilter[1];
                float f4 = -this.finalFilter[2];
                if (((f2 * f2) + (f3 * f3)) * 4.0f >= f4 * f4) {
                    f = SensorStateManager.this.normalizeDegree((float) (90 - Math.round(((float) Math.atan2((double) (-f3), (double) f2)) * 57.29578f)));
                }
                if (f != SensorStateManager.this.mOrientation) {
                    if (Math.abs(SensorStateManager.this.mOrientation - f) > 3.0f) {
                        clearFilter();
                    }
                    SensorStateManager.this.mOrientation = f;
                    String str2 = SensorStateManager.TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("SensorEventListenerImpl TYPE_ACCELEROMETER mOrientation=");
                    sb2.append(SensorStateManager.this.mOrientation);
                    sb2.append(" mIsLyingForGradienter=");
                    sb2.append(SensorStateManager.this.mIsLyingForGradienter);
                    Log.v(str2, sb2.toString());
                    access$000.onDeviceOrientationChanged(SensorStateManager.this.mOrientation, SensorStateManager.this.mIsLyingForGradienter);
                }
                if (access$000.isWorking()) {
                    access$000.onSensorChanged(sensorEvent);
                }
            }
        }
    };
    /* access modifiers changed from: private */
    public long mAccelerometerTimeStamp = 0;
    /* access modifiers changed from: private */
    public double[] mAngleSpeed = {GYROSCOPE_STABLE_THRESHOLD, GYROSCOPE_STABLE_THRESHOLD, GYROSCOPE_STABLE_THRESHOLD, GYROSCOPE_STABLE_THRESHOLD, GYROSCOPE_STABLE_THRESHOLD};
    /* access modifiers changed from: private */
    public int mAngleSpeedIndex = -1;
    /* access modifiers changed from: private */
    public double mAngleTotal = 0.0d;
    private int mCapturePosture = 0;
    private boolean mEdgeTouchEnabled;
    private boolean mFocusSensorEnabled;
    private final Sensor mGameRotationSensor;
    private SensorEventListener mGameRotationSensorListener = new SensorEventListener() {
        public void onAccuracyChanged(Sensor sensor, int i) {
        }

        public void onSensorChanged(SensorEvent sensorEvent) {
            SensorStateListener access$000 = SensorStateManager.this.getSensorStateListener();
            if (access$000 != null && access$000.isWorking()) {
                access$000.onSensorChanged(sensorEvent);
            }
        }
    };
    /* access modifiers changed from: private */
    public boolean mGradienterEnabled;
    private final Sensor mGravitySensor;
    private SensorEventListener mGravitySensorListener = new SensorEventListener() {
        public void onAccuracyChanged(Sensor sensor, int i) {
        }

        public void onSensorChanged(SensorEvent sensorEvent) {
            SensorStateListener access$000 = SensorStateManager.this.getSensorStateListener();
            if (access$000 != null && access$000.isWorking()) {
                access$000.onSensorChanged(sensorEvent);
            }
        }
    };
    private final Sensor mGyroscope;
    private boolean mGyroscopeEnabled;
    private SensorEventListener mGyroscopeListener = new SensorEventListener() {
        public void onAccuracyChanged(Sensor sensor, int i) {
        }

        public void onSensorChanged(SensorEvent sensorEvent) {
            SensorStateListener access$000 = SensorStateManager.this.getSensorStateListener();
            if (access$000 != null && access$000.isWorking()) {
                long abs = Math.abs(sensorEvent.timestamp - SensorStateManager.this.mGyroscopeTimeStamp);
                if (abs >= SensorStateManager.EVENT_PROCESS_INTERVAL) {
                    if (SensorStateManager.this.mGyroscopeTimeStamp == 0 || abs > SensorStateManager.EVENT_TIME_OUT) {
                        SensorStateManager.this.mGyroscopeTimeStamp = sensorEvent.timestamp;
                        return;
                    }
                    float f = ((float) abs) * SensorStateManager.NS2S;
                    double sqrt = Math.sqrt((double) ((sensorEvent.values[0] * sensorEvent.values[0]) + (sensorEvent.values[1] * sensorEvent.values[1]) + (sensorEvent.values[2] * sensorEvent.values[2])));
                    SensorStateManager.this.mGyroscopeTimeStamp = sensorEvent.timestamp;
                    if (SensorStateManager.GYROSCOPE_MOVING_THRESHOLD < sqrt) {
                        SensorStateManager.this.deviceBeginMoving();
                    }
                    SensorStateManager.this.mAngleSpeedIndex = SensorStateManager.access$404(SensorStateManager.this) % SensorStateManager.this.mAngleSpeed.length;
                    SensorStateManager.this.mAngleSpeed[SensorStateManager.this.mAngleSpeedIndex] = sqrt;
                    if (sqrt >= SensorStateManager.GYROSCOPE_IGNORE_THRESHOLD) {
                        SensorStateManager.access$618(SensorStateManager.this, sqrt * ((double) f));
                        if (SensorStateManager.this.mAngleTotal > SensorStateManager.GYROSCOPE_FOCUS_THRESHOLD) {
                            SensorStateManager.this.mAngleTotal = 0.0d;
                            SensorStateManager.this.deviceKeepMoving(10000.0d);
                        }
                        if (access$000.isWorking()) {
                            access$000.onSensorChanged(sensorEvent);
                        }
                    }
                }
            }
        }
    };
    /* access modifiers changed from: private */
    public long mGyroscopeTimeStamp = 0;
    private Handler mHandler;
    /* access modifiers changed from: private */
    public boolean mIsLyingForGradienter = false;
    /* access modifiers changed from: private */
    public boolean mIsLyingForLie = false;
    /* access modifiers changed from: private */
    public boolean mLieFlagEnabled;
    private SensorEventListener mLinearAccelerationListener = new SensorEventListener() {
        public void onAccuracyChanged(Sensor sensor, int i) {
        }

        public void onSensorChanged(SensorEvent sensorEvent) {
            SensorStateListener access$000 = SensorStateManager.this.getSensorStateListener();
            if (access$000 != null && access$000.isWorking()) {
                long abs = Math.abs(sensorEvent.timestamp - SensorStateManager.this.mAccelerometerTimeStamp);
                if (abs >= SensorStateManager.EVENT_PROCESS_INTERVAL) {
                    if (SensorStateManager.this.mAccelerometerTimeStamp == 0 || abs > SensorStateManager.EVENT_TIME_OUT) {
                        SensorStateManager.this.mAccelerometerTimeStamp = sensorEvent.timestamp;
                        return;
                    }
                    double sqrt = Math.sqrt((double) ((sensorEvent.values[0] * sensorEvent.values[0]) + (sensorEvent.values[1] * sensorEvent.values[1]) + (sensorEvent.values[2] * sensorEvent.values[2])));
                    SensorStateManager.this.mAccelerometerTimeStamp = sensorEvent.timestamp;
                    if (sqrt > SensorStateManager.ACCELEROMETER_GAP_TOLERANCE) {
                        SensorStateManager.this.deviceKeepMoving(sqrt);
                    }
                }
            }
        }
    };
    private final Sensor mLinearAccelerometer;
    /* access modifiers changed from: private */
    public float mOrientation = -1.0f;
    private final Sensor mOrientationSensor;
    private SensorEventListener mOrientationSensorEventListener;
    private int mRate;
    private SensorEventListener mRoatationSensorListener = new SensorEventListener() {
        public void onAccuracyChanged(Sensor sensor, int i) {
        }

        public void onSensorChanged(SensorEvent sensorEvent) {
            SensorStateListener access$000 = SensorStateManager.this.getSensorStateListener();
            if (access$000 != null && access$000.isWorking() && sensorEvent.values != null && sensorEvent.values.length >= 4) {
                access$000.onDeviceRotationChanged(new float[]{sensorEvent.values[0], sensorEvent.values[1], sensorEvent.values[2], sensorEvent.values[3]});
            }
        }
    };
    private final Sensor mRotationVecotrSensor;
    private boolean mRotationVectorFlagEnabled;
    private HandlerThread mSensorListenerThread;
    private final SensorManager mSensorManager;
    private int mSensorRegister;
    private SensorStateListener mSensorStateListener;
    private boolean mTTARFlagEnabled;
    private Handler mThreadHandler;

    private class MainHandler extends Handler {
        public MainHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    SensorStateManager.this.deviceBecomeStable();
                    return;
                case 2:
                    SensorStateManager sensorStateManager = SensorStateManager.this;
                    int i = message.arg1;
                    boolean z = true;
                    if (message.arg2 != 1) {
                        z = false;
                    }
                    sensorStateManager.update(i, z);
                    return;
                default:
                    return;
            }
        }
    }

    class OrientationSensorEventListenerImpl implements SensorEventListener {
        OrientationSensorEventListenerImpl() {
        }

        public void onAccuracyChanged(Sensor sensor, int i) {
            String str = SensorStateManager.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onAccuracyChanged accuracy=");
            sb.append(i);
            Log.v(str, sb.toString());
        }

        public void onSensorChanged(SensorEvent sensorEvent) {
            SensorStateListener access$000 = SensorStateManager.this.getSensorStateListener();
            if (access$000 != null) {
                int i = 1;
                float f = sensorEvent.values[1];
                float f2 = sensorEvent.values[2];
                float abs = Math.abs(f);
                float abs2 = Math.abs(f2);
                int i2 = 5;
                if (SensorStateManager.this.mLieFlagEnabled) {
                    int i3 = SensorStateManager.this.mIsLyingForLie ? 5 : 0;
                    int i4 = 10 + i3;
                    int i5 = 170 - i3;
                    float f3 = (float) i4;
                    boolean z = (abs <= f3 || abs >= ((float) i5)) && (abs2 <= f3 || abs2 >= ((float) i5));
                    if (z != SensorStateManager.this.mIsLyingForLie) {
                        SensorStateManager.this.mIsLyingForLie = z;
                        String str = SensorStateManager.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("SensorEventListenerImpl TYPE_ORIENTATION mIsLyingForLie=");
                        sb.append(SensorStateManager.this.mIsLyingForLie);
                        Log.v(str, sb.toString());
                        access$000.onDeviceLieChanged(SensorStateManager.this.mIsLyingForLie);
                    }
                }
                if (SensorStateManager.this.mGradienterEnabled) {
                    if (!SensorStateManager.this.mIsLyingForGradienter) {
                        i2 = 0;
                    }
                    int i6 = 26 + i2;
                    int i7 = 153 - i2;
                    float f4 = (float) i6;
                    boolean z2 = (abs <= f4 || abs >= ((float) i7)) && (abs2 <= f4 || abs2 >= ((float) i7));
                    if (z2 != SensorStateManager.this.mIsLyingForGradienter) {
                        SensorStateManager.this.mIsLyingForGradienter = z2;
                        String str2 = SensorStateManager.TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("SensorEventListenerImpl TYPE_ORIENTATION mIsLyingForGradienter=");
                        sb2.append(SensorStateManager.this.mIsLyingForGradienter);
                        sb2.append("mOrientation=");
                        sb2.append(SensorStateManager.this.mOrientation);
                        Log.v(str2, sb2.toString());
                        access$000.onDeviceOrientationChanged(SensorStateManager.this.mOrientation, SensorStateManager.this.mIsLyingForGradienter);
                    }
                }
                if (Math.abs(abs2 - 90.0f) < ((float) SensorStateManager.CAPTURE_POSTURE_DEGREE)) {
                    SensorStateManager sensorStateManager = SensorStateManager.this;
                    if (f2 >= 0.0f) {
                        i = 2;
                    }
                    sensorStateManager.changeCapturePosture(i);
                } else {
                    SensorStateManager.this.changeCapturePosture(0);
                }
            }
        }
    }

    public interface SensorStateListener {
        boolean isWorking();

        void notifyDevicePostureChanged();

        void onDeviceBecomeStable();

        void onDeviceBeginMoving();

        void onDeviceKeepMoving(double d);

        void onDeviceKeepStable();

        void onDeviceLieChanged(boolean z);

        void onDeviceOrientationChanged(float f, boolean z);

        void onDeviceRotationChanged(float[] fArr);

        void onSensorChanged(SensorEvent sensorEvent);
    }

    public SensorStateManager(Context context, Looper looper) {
        this.mSensorManager = (SensorManager) context.getApplicationContext().getSystemService("sensor");
        this.mLinearAccelerometer = this.mSensorManager.getDefaultSensor(10);
        this.mGyroscope = this.mSensorManager.getDefaultSensor(4);
        this.mOrientationSensor = this.mSensorManager.getDefaultSensor(3);
        this.mAccelerometerSensor = this.mSensorManager.getDefaultSensor(1);
        this.mRotationVecotrSensor = this.mSensorManager.getDefaultSensor(11);
        this.mGravitySensor = this.mSensorManager.getDefaultSensor(9);
        this.mGameRotationSensor = this.mSensorManager.getDefaultSensor(15);
        this.mHandler = new MainHandler(looper);
        this.mRate = 30000;
        if (canDetectOrientation()) {
            this.mOrientationSensorEventListener = new OrientationSensorEventListenerImpl();
        }
        this.mSensorListenerThread = new HandlerThread("SensorListenerThread");
        this.mSensorListenerThread.start();
    }

    static /* synthetic */ int access$404(SensorStateManager sensorStateManager) {
        int i = sensorStateManager.mAngleSpeedIndex + 1;
        sensorStateManager.mAngleSpeedIndex = i;
        return i;
    }

    static /* synthetic */ double access$618(SensorStateManager sensorStateManager, double d) {
        double d2 = sensorStateManager.mAngleTotal + d;
        sensorStateManager.mAngleTotal = d2;
        return d2;
    }

    /* access modifiers changed from: private */
    public void changeCapturePosture(int i) {
        if (this.mCapturePosture != i) {
            this.mCapturePosture = i;
            SensorStateListener sensorStateListener = getSensorStateListener();
            if (sensorStateListener != null) {
                sensorStateListener.notifyDevicePostureChanged();
            }
        }
    }

    /* access modifiers changed from: private */
    public void deviceBecomeStable() {
        if (this.mFocusSensorEnabled) {
            SensorStateListener sensorStateListener = getSensorStateListener();
            if (sensorStateListener != null) {
                sensorStateListener.onDeviceBecomeStable();
            }
        }
    }

    /* access modifiers changed from: private */
    public void deviceBeginMoving() {
        SensorStateListener sensorStateListener = getSensorStateListener();
        if (sensorStateListener != null) {
            sensorStateListener.onDeviceBeginMoving();
        }
    }

    /* access modifiers changed from: private */
    public void deviceKeepMoving(double d) {
        if (this.mFocusSensorEnabled) {
            SensorStateListener sensorStateListener = getSensorStateListener();
            if (sensorStateListener != null) {
                sensorStateListener.onDeviceKeepMoving(d);
            }
        }
    }

    private void deviceKeepStable() {
        SensorStateListener sensorStateListener = getSensorStateListener();
        if (sensorStateListener != null) {
            sensorStateListener.onDeviceKeepStable();
        }
    }

    private int filterUnregisterSensor(int i) {
        if (this.mEdgeTouchEnabled) {
            i = i & -3 & -5;
        }
        if (this.mLieFlagEnabled) {
            i &= -5;
        }
        if (this.mFocusSensorEnabled) {
            i = i & -2 & -3;
        }
        return this.mGradienterEnabled ? i & -9 & -5 : i;
    }

    /* access modifiers changed from: private */
    public synchronized SensorStateListener getSensorStateListener() {
        return this.mSensorStateListener;
    }

    private boolean isContains(int i, int i2) {
        return (i & i2) == i2;
    }

    private boolean isPartialContains(int i, int i2) {
        return (i & i2) != 0;
    }

    /* access modifiers changed from: private */
    public float normalizeDegree(float f) {
        while (f >= 360.0f) {
            f -= 360.0f;
        }
        while (f < 0.0f) {
            f += 360.0f;
        }
        return f;
    }

    /* access modifiers changed from: private */
    public void update(int i, boolean z) {
        if (!z && isPartialContains(this.mSensorRegister, i)) {
            unregister(i);
        } else if (z && !isContains(this.mSensorRegister, i)) {
            register(i);
        }
    }

    public boolean canDetectOrientation() {
        return this.mOrientationSensor != null;
    }

    public int getCapturePosture() {
        return this.mCapturePosture;
    }

    public boolean isDeviceLying() {
        return this.mIsLyingForGradienter;
    }

    public boolean isStable() {
        boolean z = true;
        if (this.mAngleSpeedIndex >= 0) {
            double d = 0.0d;
            for (double d2 : this.mAngleSpeed) {
                d += d2;
            }
            double length = d / ((double) this.mAngleSpeed.length);
            double d3 = this.mAngleSpeed[Util.clamp(this.mAngleSpeedIndex, 0, this.mAngleSpeed.length - 1)];
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("isStable mAngleSpeed=");
            sb.append(length);
            sb.append(" lastSpeed=");
            sb.append(d3);
            sb.append(" threshold=");
            sb.append(GYROSCOPE_STABLE_THRESHOLD);
            Log.v(str, sb.toString());
            if (length > GYROSCOPE_STABLE_THRESHOLD || d3 > GYROSCOPE_STABLE_THRESHOLD) {
                z = false;
            }
            return z;
        }
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("isStable return true for mAngleSpeedIndex=");
        sb2.append(this.mAngleSpeedIndex);
        sb2.append(" threshold=");
        sb2.append(GYROSCOPE_STABLE_THRESHOLD);
        Log.v(str2, sb2.toString());
        return true;
    }

    public void onDestroy() {
        this.mSensorListenerThread.quit();
    }

    public void register() {
        int i = this.mFocusSensorEnabled ? 3 : 0;
        if (this.mEdgeTouchEnabled) {
            i = i | 2 | 4;
        }
        if (this.mGradienterEnabled) {
            i = i | 8 | 4;
        }
        if (this.mLieFlagEnabled) {
            i |= 4;
        }
        if (this.mRotationVectorFlagEnabled) {
            i |= 16;
        }
        if (this.mTTARFlagEnabled) {
            i = i | 8 | 2 | 64 | 32;
        }
        if (this.mGyroscopeEnabled) {
            i |= 2;
        }
        register(i);
    }

    public void register(int i) {
        if (!isContains(this.mSensorRegister, i)) {
            if (this.mThreadHandler == null && isPartialContains(i, 12)) {
                this.mThreadHandler = new Handler(this.mSensorListenerThread.getLooper());
            }
            if (this.mFocusSensorEnabled) {
                i = i | 1 | 2;
                this.mHandler.removeMessages(2);
            }
            if (isContains(i, 2) && !isContains(this.mSensorRegister, 2)) {
                this.mSensorManager.registerListener(this.mGyroscopeListener, this.mGyroscope, 2);
                this.mSensorRegister |= 2;
            }
            if (isContains(i, 1) && !isContains(this.mSensorRegister, 1)) {
                this.mSensorManager.registerListener(this.mLinearAccelerationListener, this.mLinearAccelerometer, 2);
                this.mSensorRegister = 1 | this.mSensorRegister;
            }
            if (canDetectOrientation() && isContains(i, 4) && !isContains(this.mSensorRegister, 4) && this.mSensorListenerThread != null && this.mSensorListenerThread.isAlive()) {
                this.mSensorManager.registerListener(this.mOrientationSensorEventListener, this.mOrientationSensor, this.mRate, this.mThreadHandler);
                this.mSensorRegister = 4 | this.mSensorRegister;
            }
            if (isContains(i, 8) && !isContains(this.mSensorRegister, 8) && this.mSensorListenerThread != null && this.mSensorListenerThread.isAlive()) {
                this.mSensorManager.registerListener(this.mAccelerometerSensorEventListenerImpl, this.mAccelerometerSensor, this.mRate, this.mThreadHandler);
                this.mSensorRegister = 8 | this.mSensorRegister;
            }
            if (isContains(i, 16) && !isContains(this.mSensorRegister, 16) && this.mSensorListenerThread != null && this.mSensorListenerThread.isAlive()) {
                this.mSensorManager.registerListener(this.mRoatationSensorListener, this.mRotationVecotrSensor, this.mRate, this.mThreadHandler);
                this.mSensorRegister = 16 | this.mSensorRegister;
            }
            if (isContains(i, 32) && !isContains(this.mSensorRegister, 32) && this.mSensorListenerThread != null && this.mSensorListenerThread.isAlive()) {
                this.mSensorManager.registerListener(this.mGravitySensorListener, this.mGravitySensor, this.mRate, this.mThreadHandler);
                this.mSensorRegister = 32 | this.mSensorRegister;
            }
            if (isContains(i, 64) && !isContains(this.mSensorRegister, 64) && this.mSensorListenerThread != null && this.mSensorListenerThread.isAlive()) {
                this.mSensorManager.registerListener(this.mGameRotationSensorListener, this.mGameRotationSensor, this.mRate, this.mThreadHandler);
                this.mSensorRegister |= 64;
            }
        }
    }

    public void reset() {
        this.mHandler.removeMessages(1);
        this.mAngleTotal = 0.0d;
    }

    public void setEdgeTouchEnabled(boolean z) {
        if (this.mEdgeTouchEnabled != z) {
            this.mEdgeTouchEnabled = z;
            int i = 6;
            if (!this.mEdgeTouchEnabled) {
                if (this.mGradienterEnabled) {
                    i = 2;
                }
                if (this.mFocusSensorEnabled) {
                    i &= -3;
                }
            }
            update(i, this.mEdgeTouchEnabled);
        }
    }

    public void setFocusSensorEnabled(boolean z) {
        if (this.mFocusSensorEnabled != z) {
            this.mFocusSensorEnabled = z;
            this.mHandler.removeMessages(2);
            int i = 3;
            if (!this.mFocusSensorEnabled) {
                i = filterUnregisterSensor(3);
            }
            this.mHandler.sendMessageDelayed(this.mHandler.obtainMessage(2, i, z ? 1 : 0), 1000);
        }
    }

    public void setGradienterEnabled(boolean z) {
        if (this.mGradienterEnabled != z) {
            this.mGradienterEnabled = z;
            int i = 12;
            if (!this.mGradienterEnabled) {
                i = filterUnregisterSensor(12);
            }
            update(i, this.mGradienterEnabled);
        }
    }

    public void setGyroscopeEnabled(boolean z) {
        if (this.mGyroscopeEnabled != z) {
            this.mGyroscopeEnabled = z;
            update(2, this.mGyroscopeEnabled);
        }
    }

    public void setLieIndicatorEnabled(boolean z) {
        if (canDetectOrientation() && this.mLieFlagEnabled != z) {
            this.mLieFlagEnabled = z;
            int i = 4;
            if (!this.mLieFlagEnabled) {
                i = filterUnregisterSensor(4);
            }
            update(i, this.mLieFlagEnabled);
        }
    }

    public void setRotationVectorEnabled(boolean z) {
        if (this.mRotationVectorFlagEnabled != z) {
            this.mRotationVectorFlagEnabled = z;
            update(16, this.mRotationVectorFlagEnabled);
        }
    }

    public synchronized void setSensorStateListener(SensorStateListener sensorStateListener) {
        this.mSensorStateListener = sensorStateListener;
    }

    public void setTTARSensorEnabled(boolean z) {
        if (this.mTTARFlagEnabled != z) {
            this.mTTARFlagEnabled = z;
            update(106, this.mTTARFlagEnabled);
        }
    }

    public void unregister(int i) {
        if (this.mSensorRegister != 0) {
            if (!this.mFocusSensorEnabled || i == 127) {
                if (!this.mFocusSensorEnabled && this.mHandler.hasMessages(2)) {
                    i |= 1;
                    if (!this.mEdgeTouchEnabled) {
                        i |= 2;
                    }
                }
                reset();
                this.mHandler.removeMessages(2);
            }
            if (isContains(i, 2) && isContains(this.mSensorRegister, 2)) {
                this.mSensorManager.unregisterListener(this.mGyroscopeListener);
                this.mSensorRegister &= -3;
            }
            if (isContains(i, 1) && isContains(this.mSensorRegister, 1)) {
                this.mSensorManager.unregisterListener(this.mLinearAccelerationListener);
                this.mSensorRegister &= -2;
            }
            if (isContains(i, 4) && isContains(this.mSensorRegister, 4)) {
                this.mSensorManager.unregisterListener(this.mOrientationSensorEventListener);
                this.mSensorRegister &= -5;
                this.mIsLyingForGradienter = false;
                this.mIsLyingForLie = false;
                changeCapturePosture(0);
            }
            if (isContains(i, 8) && isContains(this.mSensorRegister, 8)) {
                this.mSensorManager.unregisterListener(this.mAccelerometerSensorEventListenerImpl);
                this.mSensorRegister &= -9;
            }
            if (isContains(i, 16) && isContains(this.mSensorRegister, 16)) {
                this.mSensorManager.unregisterListener(this.mRoatationSensorListener);
                this.mSensorRegister &= -17;
            }
            if (isContains(i, 32) && isContains(this.mSensorRegister, 32)) {
                this.mSensorManager.unregisterListener(this.mGravitySensorListener);
                this.mSensorRegister &= -33;
            }
            if (isContains(i, 64) && isContains(this.mSensorRegister, 64)) {
                this.mSensorManager.unregisterListener(this.mGameRotationSensorListener);
                this.mSensorRegister &= -65;
            }
        }
    }
}
