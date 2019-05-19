package com.android.camera.panorama;

import android.annotation.SuppressLint;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.util.Range;
import com.android.camera.log.Log;
import java.util.Locale;

@SuppressLint({"NewApi"})
public class RoundDetector implements SensorEventListener {
    protected static final float DETECT_DIRECTION_MARGIN_DEGREE = 20.0f;
    private static final int MATRIX_SIZE = 16;
    public static final Object SynchronizedObject = new Object();
    public static final String TAG = "RoundDetector";
    protected boolean isLandscape;
    private float[] mAccelerometerValues = new float[0];
    protected int mCurrentDegreeLandscape;
    protected int mCurrentDegreePortrait;
    protected int mDirection = 1;
    private LoopRange mEndDegreeRange = emptyRange();
    private float[] mI = new float[16];
    private float[] mInR = new float[16];
    protected boolean mIsEndOk;
    private float[] mMagneticValues = new float[0];
    private float[] mOutR = new float[16];
    private int mStartDegree;

    private class LoopRange {
        protected Range<Integer> mRange;
        protected boolean[] mRangePassed = new boolean[2];
        protected Range<Integer> mRangeSecond;

        public LoopRange(int i, int i2, int i3) {
            if (i <= i2) {
                this.mRange = new Range<>(Integer.valueOf(i), Integer.valueOf(i2));
                this.mRangeSecond = new Range<>(Integer.valueOf(-1), Integer.valueOf(-1));
                this.mRangePassed[0] = false;
                this.mRangePassed[1] = true;
                return;
            }
            this.mRange = new Range<>(Integer.valueOf(0), Integer.valueOf(Math.max(5, i2)));
            this.mRangeSecond = new Range<>(Integer.valueOf(Math.min(i, i3 - 5)), Integer.valueOf(i3));
            this.mRangePassed[0] = false;
            this.mRangePassed[1] = false;
        }

        public boolean contains(int i) {
            if (!this.mRangePassed[0]) {
                this.mRangePassed[0] = this.mRange.contains(Integer.valueOf(i));
            }
            if (!this.mRangePassed[1]) {
                this.mRangePassed[1] = this.mRangeSecond.contains(Integer.valueOf(i));
            }
            if (this.mRangeSecond.contains(Integer.valueOf(i)) && this.mRangePassed[0]) {
                this.mRangePassed[0] = false;
            }
            return this.mRangePassed[0] && this.mRangePassed[1];
        }

        public String toString() {
            if (((Integer) this.mRangeSecond.getUpper()).intValue() < 0) {
                return this.mRange.toString();
            }
            return String.format("%s, %s", new Object[]{this.mRangeSecond.toString(), this.mRange.toString()});
        }
    }

    private class LoopRangeLeft extends LoopRange {
        public LoopRangeLeft(int i, int i2, int i3) {
            super(i, i2, i3);
            if (i > i2) {
                this.mRange = new Range(Integer.valueOf(Math.min(i, i3 - 5)), Integer.valueOf(i3));
                this.mRangeSecond = new Range(Integer.valueOf(0), Integer.valueOf(Math.max(5, i2)));
            }
        }

        public String toString() {
            if (((Integer) this.mRangeSecond.getUpper()).intValue() < 0) {
                return this.mRange.toString();
            }
            return String.format("%s, %s", new Object[]{this.mRange.toString(), this.mRangeSecond.toString()});
        }
    }

    private static int correctionCircleDegree(int i) {
        return i < 0 ? i + 360 : 360 < i ? i - 360 : i;
    }

    private LoopRange emptyRange() {
        return new LoopRange(-1, -1, 360);
    }

    protected static int radianToDegree(float f) {
        return (int) Math.floor(Math.toDegrees((double) f));
    }

    public int currentDegree() {
        return this.isLandscape ? this.mCurrentDegreeLandscape : this.mCurrentDegreePortrait;
    }

    public int currentDegree0Base() {
        int currentDegree = currentDegree();
        return this.mDirection != 0 ? 360 - currentDegree : currentDegree;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:13:0x001a, code lost:
        return r2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x0026, code lost:
        return r2;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean detect() {
        synchronized (SynchronizedObject) {
            boolean z = false;
            if (!this.mIsEndOk) {
                return false;
            }
            if (this.mDirection == 0) {
                if (this.mStartDegree >= currentDegree()) {
                    z = true;
                }
            } else if (this.mStartDegree <= currentDegree()) {
                z = true;
            }
        }
    }

    public void onAccuracyChanged(Sensor sensor, int i) {
    }

    public void onSensorChanged(SensorEvent sensorEvent) {
        switch (sensorEvent.sensor.getType()) {
            case 1:
                this.mAccelerometerValues = (float[]) sensorEvent.values.clone();
                break;
            case 2:
                this.mMagneticValues = (float[]) sensorEvent.values.clone();
                break;
            default:
                return;
        }
        if (this.mMagneticValues.length > 0 && this.mAccelerometerValues.length > 0) {
            SensorManager.getRotationMatrix(this.mInR, this.mI, this.mAccelerometerValues, this.mMagneticValues);
            float[] fArr = new float[3];
            SensorManager.remapCoordinateSystem(this.mInR, 3, 129, this.mOutR);
            SensorManager.getOrientation(this.mOutR, fArr);
            int radianToDegree = radianToDegree(fArr[0]);
            if (radianToDegree < 0) {
                radianToDegree += 360;
            }
            SensorManager.remapCoordinateSystem(this.mInR, 1, 3, this.mOutR);
            SensorManager.getOrientation(this.mOutR, fArr);
            int radianToDegree2 = radianToDegree(fArr[0]);
            if (radianToDegree2 < 0) {
                radianToDegree2 += 360;
            }
            synchronized (SynchronizedObject) {
                this.mCurrentDegreeLandscape = radianToDegree;
                this.mCurrentDegreePortrait = radianToDegree2;
                this.mIsEndOk = this.mEndDegreeRange.contains(currentDegree());
            }
        }
    }

    public void setStartPosition(int i, int i2, float f, float f2, boolean z) {
        int i3;
        int i4;
        boolean z2 = i == 0 || i == 180;
        this.isLandscape = z2;
        int i5 = this.isLandscape ? (int) f : (int) f2;
        synchronized (SynchronizedObject) {
            if (z) {
                try {
                    i3 = currentDegree();
                } catch (Throwable th) {
                    throw th;
                }
            } else {
                i3 = i2 == 0 ? correctionCircleDegree(currentDegree() + (i5 - 20)) : correctionCircleDegree(currentDegree() - (i5 - 20));
            }
            switch (i2) {
                case 0:
                    i4 = i3 + i5;
                    break;
                case 1:
                    i4 = i3 - ((i5 * 3) / 2);
                    break;
                default:
                    this.mIsEndOk = false;
                    this.mEndDegreeRange = emptyRange();
                    Log.e(TAG, "Unsupported Direction.");
                    return;
            }
            int i6 = (i5 / 2) + i4;
            int correctionCircleDegree = correctionCircleDegree(i4);
            int correctionCircleDegree2 = correctionCircleDegree(i6);
            if (i2 == 0) {
                if (correctionCircleDegree < i3) {
                    correctionCircleDegree = 360;
                }
                this.mEndDegreeRange = new LoopRangeLeft(correctionCircleDegree, correctionCircleDegree2, 360);
            } else {
                if (i3 < correctionCircleDegree2) {
                    correctionCircleDegree2 = 0;
                }
                this.mEndDegreeRange = new LoopRange(correctionCircleDegree, correctionCircleDegree2, 360);
            }
            this.mDirection = i2;
            this.mStartDegree = i3;
            this.mIsEndOk = false;
            Log.d(TAG, String.format(Locale.US, "%s, start:%d(>>%d)", new Object[]{this.mEndDegreeRange.toString(), Integer.valueOf(currentDegree()), Integer.valueOf(this.mStartDegree)}));
        }
    }

    public void stop() {
    }
}
