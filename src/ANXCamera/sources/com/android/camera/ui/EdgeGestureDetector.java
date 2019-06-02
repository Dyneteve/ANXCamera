package com.android.camera.ui;

import android.os.SystemProperties;
import android.support.v4.view.MotionEventCompat;
import android.view.MotionEvent;
import android.view.MotionEvent.PointerCoords;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.bytedance.frameworks.core.monitor.MonitorCommonConstants;
import java.util.ArrayList;
import java.util.Locale;

public class EdgeGestureDetector {
    private static final String TAG = "EdgeGestureDetector";
    private final int TAP_TIMEOUT = SystemProperties.getInt("tap_timeout", MonitorCommonConstants.MAX_COUNT_UPLOAD_SINGLE_TIME);
    private final int TAP_TO_TOUCH_TIME = SystemProperties.getInt("tap_to_touch_min_time", 100);
    private final int TOUCH_SLOP_SQUARE = SystemProperties.getInt("edgetouch_slop_quare", Util.dpToPixel(66.67f) * Util.dpToPixel(66.67f));
    private boolean mCurDown;
    private int mCurNumPointers;
    private EdgeGestureListener mEdgeGestureListener;
    private long mLastTapEvent;
    private int mMaxNumPointers;
    private final ArrayList<PointerState> mPointers = new ArrayList<>();
    private boolean mPrintCoords = true;
    private final PointerCoords mTempCoords = new PointerCoords();
    private final FasterStringBuilder mText = new FasterStringBuilder();

    public interface EdgeGestureListener {
        boolean onEdgeTap(int i, int i2);

        boolean onEdgeTouch(int i, int i2);
    }

    private static final class FasterStringBuilder {
        private char[] mChars = new char[64];
        private int mLength;

        private int reserve(int i) {
            int i2 = this.mLength;
            int i3 = this.mLength + i;
            char[] cArr = this.mChars;
            int length = cArr.length;
            if (i3 > length) {
                char[] cArr2 = new char[(length * 2)];
                System.arraycopy(cArr, 0, cArr2, 0, i2);
                this.mChars = cArr2;
            }
            return i2;
        }

        public FasterStringBuilder append(float f, int i) {
            int i2 = 1;
            for (int i3 = 0; i3 < i; i3++) {
                i2 *= 10;
            }
            float f2 = (float) i2;
            float rint = (float) (Math.rint((double) (f * f2)) / ((double) i2));
            append((int) rint);
            if (i != 0) {
                append(".");
                double abs = (double) Math.abs(rint);
                append((int) (((float) (abs - Math.floor(abs))) * f2), i);
            }
            return this;
        }

        public FasterStringBuilder append(int i) {
            return append(i, 0);
        }

        public FasterStringBuilder append(int i, int i2) {
            int i3;
            boolean z = i < 0;
            if (z) {
                i = -i;
                if (i < 0) {
                    append("-2147483648");
                    return this;
                }
            }
            int reserve = reserve(11);
            char[] cArr = this.mChars;
            if (i == 0) {
                cArr[reserve] = '0';
                this.mLength++;
                return this;
            }
            if (z) {
                i3 = reserve + 1;
                cArr[reserve] = '-';
            } else {
                i3 = reserve;
            }
            int i4 = 1000000000;
            int i5 = i3;
            int i6 = 10;
            while (i < i4) {
                i4 /= 10;
                i6--;
                if (i6 < i2) {
                    int i7 = i5 + 1;
                    cArr[i5] = '0';
                    i5 = i7;
                }
            }
            while (true) {
                int i8 = i / i4;
                i -= i8 * i4;
                i4 /= 10;
                int i9 = i5 + 1;
                cArr[i5] = (char) (i8 + 48);
                if (i4 == 0) {
                    this.mLength = i9;
                    return this;
                }
                i5 = i9;
            }
        }

        public FasterStringBuilder append(String str) {
            int length = str.length();
            str.getChars(0, length, this.mChars, reserve(length));
            this.mLength += length;
            return this;
        }

        public FasterStringBuilder clear() {
            this.mLength = 0;
            return this;
        }

        public String toString() {
            return new String(this.mChars, 0, this.mLength);
        }
    }

    public static class PointerState {
        /* access modifiers changed from: private */
        public PointerCoords mCoords = new PointerCoords();
        /* access modifiers changed from: private */
        public boolean mCurDown;
        /* access modifiers changed from: private */
        public float mDownFocusX;
        /* access modifiers changed from: private */
        public float mDownFocusY;
        /* access modifiers changed from: private */
        public long mDownTime;
        /* access modifiers changed from: private */
        public boolean mHandleDown;
        /* access modifiers changed from: private */
        public boolean mMoving;

        public String toString() {
            return String.format(Locale.ENGLISH, "PointerState mDownFocusX=%f mDownFocusY=%f mDownTime=%d mCurDown=%b mHandleDown=%b  mMoving=%b", new Object[]{Float.valueOf(this.mDownFocusX), Float.valueOf(this.mDownFocusY), Long.valueOf(this.mDownTime), Boolean.valueOf(this.mCurDown), Boolean.valueOf(this.mHandleDown), Boolean.valueOf(this.mMoving)});
        }
    }

    public EdgeGestureDetector(EdgeGestureListener edgeGestureListener) {
        this.mEdgeGestureListener = edgeGestureListener;
    }

    private void detectMoving(float f, float f2, PointerState pointerState) {
        if (!pointerState.mMoving) {
            int access$100 = (int) (f - pointerState.mDownFocusX);
            int access$200 = (int) (f2 - pointerState.mDownFocusY);
            int i = (access$100 * access$100) + (access$200 * access$200);
            if (i > this.TOUCH_SLOP_SQUARE) {
                Log.v(TAG, String.format(Locale.ENGLISH, "detectMoving success currentX=%f currentY=%f distance=%d ps=%s TOUCH_SLOP_SQUARE=%d", new Object[]{Float.valueOf(f), Float.valueOf(f2), Integer.valueOf(i), pointerState, Integer.valueOf(this.TOUCH_SLOP_SQUARE)}));
                pointerState.mMoving = true;
            }
        }
    }

    private void detectTap(float f, float f2, long j, PointerState pointerState) {
        Log.v(TAG, String.format(Locale.ENGLISH, "detectTap currentX=%f currentY=%f upTime=%d ps=%s TAP_TIMEOUT=%d", new Object[]{Float.valueOf(f), Float.valueOf(f2), Long.valueOf(j), pointerState, Integer.valueOf(this.TAP_TIMEOUT)}));
        if (!pointerState.mHandleDown && !pointerState.mMoving && pointerState.mCurDown) {
            if (!Util.isTimeout(j, pointerState.mDownTime, (long) this.TAP_TIMEOUT)) {
                Log.v(TAG, "detectTap sucess");
                if (this.mEdgeGestureListener.onEdgeTap((int) f, (int) f2)) {
                    this.mLastTapEvent = j;
                }
            }
        }
    }

    private void detectTouch(float f, float f2, long j, PointerState pointerState) {
        Log.v(TAG, String.format(Locale.ENGLISH, "detectTouch currentX=%f currentY=%f ps=%s eventTime=%d mLastTapEvent=%d", new Object[]{Float.valueOf(f), Float.valueOf(f2), pointerState, Long.valueOf(j), Long.valueOf(this.mLastTapEvent)}));
        if (pointerState.mCurDown) {
            if (Util.isTimeout(j, this.mLastTapEvent, (long) this.TAP_TO_TOUCH_TIME)) {
                pointerState.mHandleDown = this.mEdgeGestureListener.onEdgeTouch((int) f, (int) f2);
            }
        }
    }

    private void logCoords(String str, int i, int i2, PointerCoords pointerCoords, int i3, MotionEvent motionEvent) {
        String str2;
        int toolType = motionEvent.getToolType(i2);
        int buttonState = motionEvent.getButtonState();
        switch (i & 255) {
            case 0:
                str2 = "DOWN";
                break;
            case 1:
                str2 = "UP";
                break;
            case 2:
                str2 = "MOVE";
                break;
            case 3:
                str2 = "CANCEL";
                break;
            case 4:
                str2 = "OUTSIDE";
                break;
            case 5:
                if (i2 != ((i & MotionEventCompat.ACTION_POINTER_INDEX_MASK) >> 8)) {
                    str2 = "MOVE";
                    break;
                } else {
                    str2 = "DOWN";
                    break;
                }
            case 6:
                if (i2 != ((i & MotionEventCompat.ACTION_POINTER_INDEX_MASK) >> 8)) {
                    str2 = "MOVE";
                    break;
                } else {
                    str2 = "UP";
                    break;
                }
            case 7:
                str2 = "HOVER MOVE";
                break;
            case 8:
                str2 = "SCROLL";
                break;
            case 9:
                str2 = "HOVER ENTER";
                break;
            case 10:
                str2 = "HOVER EXIT";
                break;
            default:
                str2 = Integer.toString(i);
                break;
        }
        Log.i(TAG, this.mText.clear().append(str).append(" id ").append(i3 + 1).append(": ").append(str2).append(" (").append(pointerCoords.x, 3).append(", ").append(pointerCoords.y, 3).append(") Pressure=").append(pointerCoords.pressure, 3).append(" Size=").append(pointerCoords.size, 3).append(" TouchMajor=").append(pointerCoords.touchMajor, 3).append(" TouchMinor=").append(pointerCoords.touchMinor, 3).append(" ToolMajor=").append(pointerCoords.toolMajor, 3).append(" ToolMinor=").append(pointerCoords.toolMinor, 3).append(" Orientation=").append((float) (((double) (pointerCoords.orientation * 180.0f)) / 3.141592653589793d), 1).append("deg").append(" Tilt=").append((float) (((double) (pointerCoords.getAxisValue(25) * 180.0f)) / 3.141592653589793d), 1).append("deg").append(" Distance=").append(pointerCoords.getAxisValue(24), 1).append(" VScroll=").append(pointerCoords.getAxisValue(9), 1).append(" HScroll=").append(pointerCoords.getAxisValue(10), 1).append(" BoundingBox=[(").append(motionEvent.getAxisValue(32), 3).append(", ").append(motionEvent.getAxisValue(33), 3).append(")").append(", (").append(motionEvent.getAxisValue(34), 3).append(", ").append(motionEvent.getAxisValue(35), 3).append(")]").append(" ToolType=").append(MotionEvent.toolTypeToString(toolType)).append(" ButtonState=").append(MotionEvent.buttonStateToString(buttonState)).toString());
    }

    public void onTouchEvent(MotionEvent motionEvent) {
        int i;
        PointerCoords pointerCoords;
        int i2;
        int i3;
        int i4;
        PointerCoords pointerCoords2;
        PointerState pointerState;
        MotionEvent motionEvent2 = motionEvent;
        int action = motionEvent.getAction();
        int size = this.mPointers.size();
        int i5 = 1;
        if (action == 0 || (action & 255) == 5) {
            int i6 = (action & MotionEventCompat.ACTION_POINTER_INDEX_MASK) >> 8;
            if (action == 0) {
                for (int i7 = 0; i7 < size; i7++) {
                    ((PointerState) this.mPointers.get(i7)).mCurDown = false;
                }
                this.mCurDown = true;
                this.mCurNumPointers = 0;
                this.mMaxNumPointers = 0;
            }
            this.mCurNumPointers++;
            if (this.mMaxNumPointers < this.mCurNumPointers) {
                this.mMaxNumPointers = this.mCurNumPointers;
            }
            int pointerId = motionEvent2.getPointerId(i6);
            while (size <= pointerId) {
                this.mPointers.add(new PointerState());
                size++;
            }
            PointerState pointerState2 = (PointerState) this.mPointers.get(pointerId);
            pointerState2.mCurDown = true;
            pointerState2.mMoving = false;
            pointerState2.mHandleDown = false;
            pointerState2.mDownTime = motionEvent.getEventTime();
            pointerState2.mDownFocusX = motionEvent2.getX(i6);
            pointerState2.mDownFocusY = motionEvent2.getY(i6);
            PointerState pointerState3 = pointerState2;
            int i8 = i6;
            int i9 = pointerId;
            i = 0;
            detectTouch(motionEvent2.getX(i6), motionEvent2.getY(i6), motionEvent.getEventTime(), pointerState3);
            Log.v(TAG, String.format(Locale.ENGLISH, "new TouchDown event ps=%s mMaxNumPointers=%d mCurNumPointers=%d action=%d index=%d id=%d", new Object[]{pointerState3, Integer.valueOf(this.mMaxNumPointers), Integer.valueOf(this.mCurNumPointers), Integer.valueOf(action), Integer.valueOf(i8), Integer.valueOf(i9)}));
        } else {
            i = 0;
        }
        int pointerCount = motionEvent.getPointerCount();
        int historySize = motionEvent.getHistorySize();
        int i10 = i;
        while (i10 < historySize) {
            int i11 = i;
            while (i11 < pointerCount) {
                int pointerId2 = motionEvent2.getPointerId(i11);
                if (pointerId2 >= this.mPointers.size()) {
                    i3 = i11;
                    i2 = i10;
                    i4 = i5;
                } else {
                    PointerState pointerState4 = this.mCurDown ? (PointerState) this.mPointers.get(pointerId2) : null;
                    PointerCoords access$600 = pointerState4 != null ? pointerState4.mCoords : this.mTempCoords;
                    motionEvent2.getHistoricalPointerCoords(i11, i10, access$600);
                    if (this.mPrintCoords) {
                        pointerCoords2 = access$600;
                        pointerState = pointerState4;
                        i3 = i11;
                        i2 = i10;
                        i4 = i5;
                        logCoords("Pointer", action, i11, pointerCoords2, pointerId2, motionEvent2);
                    } else {
                        pointerCoords2 = access$600;
                        pointerState = pointerState4;
                        i3 = i11;
                        i2 = i10;
                        i4 = i5;
                    }
                    if (pointerState != null) {
                        PointerCoords pointerCoords3 = pointerCoords2;
                        detectMoving(pointerCoords3.x, pointerCoords3.y, pointerState);
                    }
                }
                i11 = i3 + 1;
                i5 = i4;
                i10 = i2;
            }
            int i12 = i5;
            i10++;
            i = 0;
        }
        int i13 = i5;
        for (int i14 = 0; i14 < pointerCount; i14++) {
            int pointerId3 = motionEvent2.getPointerId(i14);
            if (pointerId3 < this.mPointers.size()) {
                PointerState pointerState5 = this.mCurDown ? (PointerState) this.mPointers.get(pointerId3) : null;
                PointerCoords access$6002 = pointerState5 != null ? pointerState5.mCoords : this.mTempCoords;
                motionEvent2.getPointerCoords(i14, access$6002);
                if (this.mPrintCoords) {
                    pointerCoords = access$6002;
                    logCoords("Pointer", action, i14, access$6002, pointerId3, motionEvent2);
                } else {
                    pointerCoords = access$6002;
                }
                if (pointerState5 != null) {
                    detectMoving(pointerCoords.x, pointerCoords.y, pointerState5);
                }
            }
        }
        if (action == i13 || action == 3 || (action & 255) == 6) {
            int i15 = (65280 & action) >> 8;
            int pointerId4 = motionEvent2.getPointerId(i15);
            if (pointerId4 < this.mPointers.size()) {
                PointerState pointerState6 = (PointerState) this.mPointers.get(pointerId4);
                String str = TAG;
                Object[] objArr = new Object[6];
                objArr[0] = pointerState6;
                objArr[i13] = Integer.valueOf(this.mMaxNumPointers);
                objArr[2] = Integer.valueOf(this.mCurNumPointers);
                objArr[3] = Integer.valueOf(action);
                objArr[4] = Integer.valueOf(i15);
                objArr[5] = Integer.valueOf(pointerId4);
                Log.v(str, String.format(Locale.ENGLISH, "new TouchUp event ps=%s mMaxNumPointers=%d mCurNumPointers=%d action=%d index=%d id=%d", objArr));
                detectTap(motionEvent2.getX(i15), motionEvent2.getY(i15), motionEvent.getEventTime(), pointerState6);
                pointerState6.mCurDown = false;
            }
            if (action == i13 || action == 3) {
                this.mCurDown = false;
                this.mCurNumPointers = 0;
            } else if (pointerId4 < this.mPointers.size()) {
                this.mCurNumPointers -= i13;
            }
        }
    }
}
