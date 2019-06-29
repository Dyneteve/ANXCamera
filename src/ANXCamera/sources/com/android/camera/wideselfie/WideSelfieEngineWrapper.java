package com.android.camera.wideselfie;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Point;
import android.graphics.Rect;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraManager;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import android.util.SizeF;
import com.android.camera.R;
import com.android.camera.constant.DurationConstant;
import com.android.camera.log.Log;
import com.arcsoft.camera.wideselfie.AwsInitParameter;
import com.arcsoft.camera.wideselfie.ProcessResult;
import com.arcsoft.camera.wideselfie.WideSelfieCallback;
import com.arcsoft.camera.wideselfie.WideSelfieEngine;
import java.lang.ref.WeakReference;
import java.util.concurrent.atomic.AtomicInteger;

public class WideSelfieEngineWrapper {
    private static final int AWS_STATE_CAPTURING = 8194;
    private static final int AWS_STATE_PREVIEW = 8193;
    private static final int AWS_STATE_STITCHING = 8195;
    public static final int DIRECTION_MOVE_LEFT = 1;
    public static final int DIRECTION_MOVE_RIGHT = 0;
    public static final int DIRECTION_NONE = -1;
    private static final String TAG = "WideSelfieEngine";
    private SizeF mAngleSize;
    private volatile boolean mCanStopCapture = false;
    private Context mContext = null;
    /* access modifiers changed from: private */
    public volatile boolean mEngineInitialized = false;
    private int mFullImageHeight = 0;
    private int mFullImageWidth = 0;
    /* access modifiers changed from: private */
    @SuppressLint({"HandlerLeak"})
    public Handler mHandle = new Handler(Looper.getMainLooper()) {
        /* JADX WARNING: Removed duplicated region for block: B:25:0x0106  */
        /* JADX WARNING: Removed duplicated region for block: B:27:0x010c  */
        /* JADX WARNING: Removed duplicated region for block: B:30:0x0124  */
        public void handleMessage(Message message) {
            int i;
            ProcessResult processResult = (ProcessResult) message.obj;
            int i2 = message.arg1;
            int i3 = message.arg2;
            if (i2 != 0) {
                String str = WideSelfieEngineWrapper.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("ProcessResult resultCode ");
                sb.append(i2);
                Log.w(str, sb.toString());
            }
            WideSelfStateCallback wideSelfStateCallback = (WideSelfStateCallback) WideSelfieEngineWrapper.this.mWideSelfCallbackRef.get();
            if (i3 == 0) {
                Rect rect = WideSelfieEngineWrapper.this.mWideSelfieOrientation % 180 == 90 ? new Rect(processResult.progressBarThumbOffset.x, WideSelfieEngineWrapper.this.mPreviewRect.top + processResult.progressBarThumbOffset.y, WideSelfieEngineWrapper.this.mPreviewRect.width() + processResult.progressBarThumbOffset.x, WideSelfieEngineWrapper.this.mPreviewRect.height() + WideSelfieEngineWrapper.this.mPreviewRect.top + processResult.progressBarThumbOffset.y) : new Rect(WideSelfieEngineWrapper.this.mPreviewRect.left + processResult.progressBarThumbOffset.x, -processResult.progressBarThumbOffset.y, WideSelfieEngineWrapper.this.mPreviewRect.width() + WideSelfieEngineWrapper.this.mPreviewRect.left + processResult.progressBarThumbOffset.x, WideSelfieEngineWrapper.this.mPreviewRect.height() - processResult.progressBarThumbOffset.y);
                if (wideSelfStateCallback != null) {
                    int i4 = WideSelfieEngineWrapper.this.mWideSelfieOrientation % 180 == 90 ? processResult.progressBarThumbOffset.y : -processResult.progressBarThumbOffset.x;
                    if (i4 > 0) {
                        if (i4 > WideSelfieEngineWrapper.this.mPreviewRect.top) {
                            i = i4 - WideSelfieEngineWrapper.this.mPreviewRect.top;
                            int i5 = WideSelfieEngineWrapper.this.mWideSelfieOrientation % 180 == 90 ? processResult.progressBarThumbOffset.x : -processResult.progressBarThumbOffset.y;
                            wideSelfStateCallback.onPreviewUpdate(processResult.progressBarThumbArray, processResult.progressBarThumbImageWidth, processResult.progressBarThumbImageHeight, processResult.progressBarThumbRect, rect);
                            wideSelfStateCallback.onMove(processResult.direction, processResult.progress, new Point(i, i5), processResult.progressBarThumbOffset, processResult.progress != 100 || i2 == 28679);
                        }
                    } else if ((-i4) > WideSelfieEngineWrapper.this.mPreviewRect.top) {
                        i = i4 + WideSelfieEngineWrapper.this.mPreviewRect.top;
                        int i52 = WideSelfieEngineWrapper.this.mWideSelfieOrientation % 180 == 90 ? processResult.progressBarThumbOffset.x : -processResult.progressBarThumbOffset.y;
                        wideSelfStateCallback.onPreviewUpdate(processResult.progressBarThumbArray, processResult.progressBarThumbImageWidth, processResult.progressBarThumbImageHeight, processResult.progressBarThumbRect, rect);
                        wideSelfStateCallback.onMove(processResult.direction, processResult.progress, new Point(i, i52), processResult.progressBarThumbOffset, processResult.progress != 100 || i2 == 28679);
                    }
                    i = 0;
                    int i522 = WideSelfieEngineWrapper.this.mWideSelfieOrientation % 180 == 90 ? processResult.progressBarThumbOffset.x : -processResult.progressBarThumbOffset.y;
                    wideSelfStateCallback.onPreviewUpdate(processResult.progressBarThumbArray, processResult.progressBarThumbImageWidth, processResult.progressBarThumbImageHeight, processResult.progressBarThumbRect, rect);
                    wideSelfStateCallback.onMove(processResult.direction, processResult.progress, new Point(i, i522), processResult.progressBarThumbOffset, processResult.progress != 100 || i2 == 28679);
                }
            } else if (i3 == 2) {
                WideSelfieEngineWrapper.this.mWideSelfieCurrentCommand = -1;
                if (wideSelfStateCallback == null || processResult.resultImageArray == null) {
                    String str2 = WideSelfieEngineWrapper.TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("not save, callback ");
                    sb2.append(wideSelfStateCallback);
                    sb2.append(", resultImageArray = ");
                    sb2.append(processResult.resultImageArray);
                    Log.w(str2, sb2.toString());
                } else {
                    wideSelfStateCallback.onNv21Available(processResult.resultImageArray, processResult.resultImageWidth, processResult.resultImageHeight, WideSelfieEngineWrapper.this.mStitchResult);
                }
                WideSelfieEngine.getSingleInstance().uninit();
                WideSelfieEngineWrapper.this.mEngineInitialized = false;
                Log.d(WideSelfieEngineWrapper.TAG, "WideSelfieEngine uninit");
            }
        }
    };
    private int mPreviewHeight = 0;
    /* access modifiers changed from: private */
    public Rect mPreviewRect;
    private int mPreviewWidth = 0;
    private Sensor mSensor;
    private SensorEventListener mSensorEventListener = new SensorEventListener() {
        public void onAccuracyChanged(Sensor sensor, int i) {
        }

        public void onSensorChanged(SensorEvent sensorEvent) {
            if (!(sensorEvent.sensor == null || sensorEvent.accuracy == 0 || sensorEvent.sensor.getType() != 4)) {
                WideSelfieEngine.getSingleInstance().setSensorData(sensorEvent.values, sensorEvent.timestamp, sensorEvent.sensor.getType());
            }
        }
    };
    private SensorManager mSensorManager;
    private AtomicInteger mState = new AtomicInteger(AWS_STATE_PREVIEW);
    /* access modifiers changed from: private */
    public int mStitchResult = 0;
    private int mThumbBgWidth;
    /* access modifiers changed from: private */
    public WeakReference<WideSelfStateCallback> mWideSelfCallbackRef;
    private final WideSelfieCallback mWideSelfieCallback = new WideSelfieCallback() {
        public void onProcessCallback(int i, ProcessResult processResult) {
            if (processResult != null) {
                Message obtainMessage = WideSelfieEngineWrapper.this.mHandle.obtainMessage();
                obtainMessage.obj = processResult;
                obtainMessage.arg1 = i;
                obtainMessage.arg2 = WideSelfieEngineWrapper.this.mWideSelfieCurrentCommand;
                WideSelfieEngineWrapper.this.mHandle.sendMessage(obtainMessage);
            }
        }
    };
    /* access modifiers changed from: private */
    public int mWideSelfieCurrentCommand;
    /* access modifiers changed from: private */
    public int mWideSelfieOrientation = 90;
    private int nThumbnailHeight = 0;
    private int nThumbnailWidth = 0;

    public interface WideSelfStateCallback {
        void onMove(int i, int i2, Point point, Point point2, boolean z);

        void onNv21Available(byte[] bArr, int i, int i2, int i3);

        void onPreviewUpdate(byte[] bArr, int i, int i2, Rect rect, Rect rect2);

        void onWideSelfCompleted();
    }

    public WideSelfieEngineWrapper(Context context, WideSelfStateCallback wideSelfStateCallback) {
        this.mContext = context;
        this.mWideSelfCallbackRef = new WeakReference<>(wideSelfStateCallback);
        this.mSensorManager = (SensorManager) context.getSystemService("sensor");
        this.mSensor = this.mSensorManager.getDefaultSensor(4);
        this.mThumbBgWidth = this.mContext.getResources().getDimensionPixelSize(R.dimen.wide_selfie_progress_thumbnail_background_width);
    }

    private SizeF getAngleValue(CameraCharacteristics cameraCharacteristics) {
        SizeF sizeF = (SizeF) cameraCharacteristics.get(CameraCharacteristics.SENSOR_INFO_PHYSICAL_SIZE);
        float[] fArr = (float[]) cameraCharacteristics.get(CameraCharacteristics.LENS_INFO_AVAILABLE_FOCAL_LENGTHS);
        if (fArr == null || fArr.length <= 0) {
            return null;
        }
        return new SizeF((float) Math.toDegrees(StrictMath.atan((double) (sizeF.getWidth() / (fArr[0] * 2.0f))) * 2.0d), (float) Math.toDegrees(2.0d * StrictMath.atan((double) (sizeF.getHeight() / (2.0f * fArr[0])))));
    }

    public void onBurstCapture(byte[] bArr) {
        if (!this.mEngineInitialized) {
            Log.w(TAG, "onBurstCapture mEngineInitialized false");
            return;
        }
        if (this.mState.get() == 8194) {
            Log.d(TAG, "onBurstCapture AWS_STATE_CAPTURING");
            this.mWideSelfieCurrentCommand = 0;
            WideSelfieEngine.getSingleInstance().process(0, bArr);
            if (!this.mCanStopCapture) {
                this.mCanStopCapture = true;
            }
        } else if (this.mState.compareAndSet(AWS_STATE_STITCHING, AWS_STATE_PREVIEW)) {
            Log.d(TAG, "onBurstCapture STITCHING E");
            byte[] bArr2 = new byte[1];
            WideSelfStateCallback wideSelfStateCallback = (WideSelfStateCallback) this.mWideSelfCallbackRef.get();
            if (wideSelfStateCallback != null) {
                wideSelfStateCallback.onWideSelfCompleted();
            }
            this.mWideSelfieCurrentCommand = 1;
            this.mStitchResult = WideSelfieEngine.getSingleInstance().process(1, bArr2);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onBurstCapture mStitchResult ");
            sb.append(this.mStitchResult);
            Log.d(str, sb.toString());
            this.mWideSelfieCurrentCommand = 2;
            WideSelfieEngine.getSingleInstance().process(2, bArr2);
            Log.d(TAG, "onBurstCapture STITCHING X");
            this.mCanStopCapture = false;
        }
    }

    public void onDestroy() {
        this.mHandle.removeCallbacksAndMessages(null);
    }

    public void pause() {
        this.mSensorManager.unregisterListener(this.mSensorEventListener);
    }

    public void resume() {
        this.mSensorManager.registerListener(this.mSensorEventListener, this.mSensor, DurationConstant.DURATION_VIDEO_RECORDING_CIRCLE);
    }

    public void setCameraParameter(String str, int i, int i2, int i3, int i4) {
        if (!TextUtils.isEmpty(str)) {
            this.mPreviewWidth = i;
            this.mPreviewHeight = i2;
            this.mFullImageWidth = i3;
            this.mFullImageHeight = i4;
            float dimensionPixelSize = ((float) i) / ((float) this.mContext.getResources().getDimensionPixelSize(R.dimen.wide_selfie_progress_thumbnail_background_height));
            this.nThumbnailWidth = (int) (((float) this.mPreviewWidth) / dimensionPixelSize);
            this.nThumbnailHeight = (int) (((float) this.mPreviewHeight) / dimensionPixelSize);
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("mFullImageWidth = ");
            sb.append(this.mFullImageWidth);
            sb.append(", mFullImageHeight = ");
            sb.append(this.mFullImageHeight);
            Log.d(str2, sb.toString());
            try {
                this.mAngleSize = getAngleValue(((CameraManager) this.mContext.getSystemService("camera")).getCameraCharacteristics(str));
            } catch (CameraAccessException e) {
                e.printStackTrace();
            }
        }
    }

    public void setOrientation(int i) {
        this.mWideSelfieOrientation = i;
    }

    public int startCapture() {
        int i;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("startCapture orientation = ");
        sb.append(this.mWideSelfieOrientation);
        Log.d(str, sb.toString());
        AwsInitParameter defaultInitParams = AwsInitParameter.getDefaultInitParams(this.mFullImageWidth, this.mFullImageHeight, 2050, this.mWideSelfieOrientation);
        WideSelfieConfig instance = WideSelfieConfig.getInstance(this.mContext);
        if (this.mWideSelfieOrientation % 180 == 90) {
            i = (this.mFullImageHeight * (instance.getThumbBgWidth() - 2)) / instance.getStillPreviewWidth();
            int i2 = (this.mThumbBgWidth - this.nThumbnailHeight) / 2;
            this.mPreviewRect = new Rect(0, i2, this.nThumbnailWidth, this.nThumbnailHeight + i2);
        } else {
            i = (this.mFullImageWidth * (instance.getThumbBgHeightVertical() - 2)) / instance.getStillPreviewHeight();
            int i3 = (this.mThumbBgWidth - this.nThumbnailWidth) / 2;
            this.mPreviewRect = new Rect(i3, 0, this.nThumbnailWidth + i3, this.nThumbnailHeight);
        }
        int i4 = (this.mThumbBgWidth - this.nThumbnailHeight) / 2;
        this.mPreviewRect = new Rect(0, i4, this.nThumbnailWidth, this.nThumbnailHeight + i4);
        defaultInitParams.maxResultWidth = i;
        defaultInitParams.progressBarThumbHeight = this.mWideSelfieOrientation % 180 == 90 ? this.nThumbnailWidth : this.nThumbnailHeight;
        defaultInitParams.thumbnailWidth = this.mFullImageWidth;
        defaultInitParams.thumbnailHeight = this.mFullImageHeight;
        defaultInitParams.guideStopBarThumbHeight = 0;
        defaultInitParams.cameraViewAngleForWidth = this.mAngleSize.getWidth();
        defaultInitParams.cameraViewAngleForHeight = this.mAngleSize.getHeight();
        Log.d(TAG, String.format("startCapture maxResultWidth = %d, progressBarThumbHeight = %d, thumbnailWidth = %d, thumbnailHeight = %d,  guideStopBarThumbHeight = %d", new Object[]{Integer.valueOf(i), Integer.valueOf(defaultInitParams.progressBarThumbHeight), Integer.valueOf(defaultInitParams.thumbnailWidth), Integer.valueOf(defaultInitParams.thumbnailHeight), Integer.valueOf(defaultInitParams.guideStopBarThumbHeight)}));
        int init = WideSelfieEngine.getSingleInstance().init(defaultInitParams);
        this.mEngineInitialized = true;
        Log.d(TAG, "WideSelfieEngine init");
        WideSelfieEngine.getSingleInstance().setOnCallback(this.mWideSelfieCallback);
        this.mState.set(8194);
        return init;
    }

    public boolean stopCapture() {
        Log.d(TAG, "stopCapture E");
        if (!this.mCanStopCapture) {
            Log.w(TAG, "stopCapture failed, can't stop");
            return false;
        } else if (!this.mState.compareAndSet(8194, AWS_STATE_STITCHING)) {
            Log.w(TAG, "stopCapture failed, error state");
            return false;
        } else {
            Log.d(TAG, "stopCapture X");
            return true;
        }
    }
}
