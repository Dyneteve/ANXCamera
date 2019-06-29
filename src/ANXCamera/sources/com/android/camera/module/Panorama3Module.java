package com.android.camera.module;

import android.annotation.TargetApi;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.SurfaceTexture;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.hardware.camera2.CameraCaptureSession;
import android.location.Location;
import android.media.Image;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.AsyncTask.Status;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.os.ParcelFileDescriptor;
import android.os.SystemClock;
import android.os.SystemProperties;
import android.provider.MiuiSettings.ScreenEffect;
import android.text.format.DateFormat;
import android.util.Size;
import android.view.KeyEvent;
import android.view.Surface;
import android.view.View;
import com.android.camera.AutoLockManager;
import com.android.camera.Camera;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraIntentManager;
import com.android.camera.CameraPreferenceActivity;
import com.android.camera.CameraScreenNail;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.ExifHelper;
import com.android.camera.FileCompat;
import com.android.camera.LocationManager;
import com.android.camera.OnClickAttr;
import com.android.camera.PictureSizeManager;
import com.android.camera.R;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.constant.UpdateConstant;
import com.android.camera.constant.UpdateConstant.UpdateType;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentManuallyDualLens;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.log.Log;
import com.android.camera.panorama.AttachRunnable;
import com.android.camera.panorama.Camera1Image;
import com.android.camera.panorama.Camera2Image;
import com.android.camera.panorama.CaptureImage;
import com.android.camera.panorama.DirectionFunction;
import com.android.camera.panorama.DownDirectionFunction;
import com.android.camera.panorama.GyroscopeRoundDetector;
import com.android.camera.panorama.InputSave;
import com.android.camera.panorama.LeftDirectionFunction;
import com.android.camera.panorama.MorphoPanoramaGP3;
import com.android.camera.panorama.MorphoPanoramaGP3.GalleryInfoData;
import com.android.camera.panorama.MorphoPanoramaGP3.InitParam;
import com.android.camera.panorama.MorphoSensorFusion.SensorData;
import com.android.camera.panorama.PanoramaGP3ImageFormat;
import com.android.camera.panorama.PanoramaSetting;
import com.android.camera.panorama.PanoramaState;
import com.android.camera.panorama.PositionDetector;
import com.android.camera.panorama.RightDirectionFunction;
import com.android.camera.panorama.RoundDetector;
import com.android.camera.panorama.SensorFusion;
import com.android.camera.panorama.SensorInfoManager;
import com.android.camera.panorama.UpDirectionFunction;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BackStack;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.PanoramaProtocol;
import com.android.camera.protocol.ModeProtocol.RecordState;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.storage.MediaProviderUtil;
import com.android.camera.storage.Storage;
import com.android.camera2.Camera2Proxy.CameraPreviewCallback;
import com.android.camera2.Camera2Proxy.PictureCallbackWrapper;
import com.mi.config.b;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

@TargetApi(21)
public class Panorama3Module extends BaseModule implements SensorEventListener, CameraAction, CameraPreviewCallback {
    public static final boolean DUMP_YUV = SystemProperties.getBoolean("camera.debug.panorama", false);
    private static final int MIN_SHOOTING_TIME = 600;
    private static final int PREVIEW_SKIP_COUNT = 1;
    /* access modifiers changed from: private */
    public static final String TAG = Panorama3Module.class.getSimpleName();
    public static final Object mEngineLock = new Object();
    /* access modifiers changed from: private */
    public static final Object mPreviewImageLock = new Object();
    /* access modifiers changed from: private */
    public static final CaptureImage sAttachExit = new Camera1Image(null, 0, 0);
    private Sensor mAccelerometer = null;
    /* access modifiers changed from: private */
    public final LinkedBlockingQueue<CaptureImage> mAttachImageQueue = new LinkedBlockingQueue<>();
    private int mAttachPosOffsetX;
    /* access modifiers changed from: private */
    public int mAttachPosOffsetY;
    /* access modifiers changed from: private */
    public int mCameraOrientation = 0;
    /* access modifiers changed from: private */
    public volatile boolean mCanSavePanorama;
    /* access modifiers changed from: private */
    public boolean mCaptureOrientationDecided = false;
    /* access modifiers changed from: private */
    public SensorInfoManager mCurrentSensorInfoManager;
    private final Object mDeviceLock = new Object();
    private int mDeviceOrientationAtCapture;
    /* access modifiers changed from: private */
    public int mDirection;
    /* access modifiers changed from: private */
    public DirectionFunction mDirectionFunction;
    /* access modifiers changed from: private */
    public Bitmap mDispPreviewImage;
    /* access modifiers changed from: private */
    public Canvas mDispPreviewImageCanvas;
    /* access modifiers changed from: private */
    public Paint mDispPreviewImagePaint;
    /* access modifiers changed from: private */
    public final ExecutorService mExecutor;
    private int mGoalAngle = 280;
    private float[] mGravities;
    private Sensor mGyroscope = null;
    private Sensor mGyroscopeUncalibrated = null;
    /* access modifiers changed from: private */
    public String mImageFormat = PanoramaGP3ImageFormat.YVU420_SEMIPLANAR;
    /* access modifiers changed from: private */
    public InitParam mInitParam = new InitParam();
    private volatile boolean mIsRegisterGravitySensor = false;
    /* access modifiers changed from: private */
    public boolean mIsSensorAverage;
    /* access modifiers changed from: private */
    public volatile boolean mIsShooting = false;
    private Location mLocation;
    /* access modifiers changed from: private */
    public float mLongSideCropRatio = 0.8766f;
    private Sensor mMagnetic;
    /* access modifiers changed from: private */
    public int mMaxHeight;
    /* access modifiers changed from: private */
    public int mMaxWidth;
    /* access modifiers changed from: private */
    public MorphoPanoramaGP3 mMorphoPanoramaGP3;
    private PanoramaSetting mPanoramaSetting;
    private long mPanoramaShootingStartTime;
    /* access modifiers changed from: private */
    public PanoramaState mPanoramaState;
    /* access modifiers changed from: private */
    public int mPictureHeight;
    /* access modifiers changed from: private */
    public int mPictureWidth;
    /* access modifiers changed from: private */
    public Bitmap mPreviewImage;
    /* access modifiers changed from: private */
    public int mPreviewRefY;
    /* access modifiers changed from: private */
    public volatile boolean mRequestStop;
    private Sensor mRotationVector = null;
    /* access modifiers changed from: private */
    public RoundDetector mRoundDetector;
    private SaveOutputImageTask mSaveOutputImageTask;
    private int mSensorCnt;
    private SensorFusion mSensorFusion = null;
    private int mSensorFusionMode;
    private ArrayList<SensorInfoManager> mSensorInfoManagerList;
    private SensorManager mSensorManager;
    private HandlerThread mSensorThread = null;
    private String mShutterEndTime;
    private String mShutterStartTime;
    /* access modifiers changed from: private */
    public int mSmallPreviewHeight;
    private int mSnapshotFocusMode = 1;
    private int mTargetFocusMode = 4;
    /* access modifiers changed from: private */
    public long mTimeTaken;
    /* access modifiers changed from: private */
    public float mViewAngleH = 71.231476f;
    /* access modifiers changed from: private */
    public float mViewAngleV = 56.49462f;

    private class DecideDirection extends PanoramaState {
        private boolean mHasSubmit;

        private class DecideDirectionAttach extends AttachRunnable {

            private class DecideRunnable implements Runnable {
                private DecideRunnable() {
                }

                public void run() {
                    Panorama3Module.this.unregisterGravitySensorListener();
                    if (Panorama3Module.this.mRequestStop) {
                        Log.w(Panorama3Module.TAG, "DecideRunnable exit request stop");
                        return;
                    }
                    Log.d(Panorama3Module.TAG, "go to PanoramaPreview in DecideRunnable");
                    synchronized (Panorama3Module.mEngineLock) {
                        if (Panorama3Module.this.mMorphoPanoramaGP3 == null) {
                            Log.w(Panorama3Module.TAG, "DecideRunnable exit due to mMorphoPanoramaGP3 is null");
                            return;
                        }
                        Panorama3Module.this.mPanoramaState = new PanoramaPreview(Panorama3Module.this);
                        Panorama3Module.this.mPanoramaState.setPanoramaStateEventListener(DecideDirection.this.listener);
                        DecideDirection.this.clearListener();
                    }
                }
            }

            private DecideDirectionAttach() {
            }

            private void createDirection(int i) {
                if (Panorama3Module.this.mInitParam.output_rotation == 90 || Panorama3Module.this.mInitParam.output_rotation == 270) {
                    switch (i) {
                        case 3:
                            Log.i(Panorama3Module.TAG, "direction : VERTICAL_UP");
                            int scaleV = getScaleV();
                            if (Panorama3Module.this.mCameraOrientation == 90) {
                                Panorama3Module panorama3Module = Panorama3Module.this;
                                RightDirectionFunction rightDirectionFunction = new RightDirectionFunction(Panorama3Module.this.mPictureWidth, Panorama3Module.this.mPictureHeight, Panorama3Module.this.mMaxWidth, Panorama3Module.this.mMaxHeight, scaleV, Panorama3Module.this.mInitParam.output_rotation);
                                panorama3Module.mDirectionFunction = rightDirectionFunction;
                                return;
                            }
                            Panorama3Module panorama3Module2 = Panorama3Module.this;
                            LeftDirectionFunction leftDirectionFunction = new LeftDirectionFunction(Panorama3Module.this.mPictureWidth, Panorama3Module.this.mPictureHeight, Panorama3Module.this.mMaxWidth, Panorama3Module.this.mMaxHeight, scaleV, Panorama3Module.this.mInitParam.output_rotation);
                            panorama3Module2.mDirectionFunction = leftDirectionFunction;
                            return;
                        case 4:
                            Log.i(Panorama3Module.TAG, "direction : VERTICAL_DOWN");
                            int scaleV2 = getScaleV();
                            if (Panorama3Module.this.mCameraOrientation == 90) {
                                Panorama3Module panorama3Module3 = Panorama3Module.this;
                                LeftDirectionFunction leftDirectionFunction2 = new LeftDirectionFunction(Panorama3Module.this.mPictureWidth, Panorama3Module.this.mPictureHeight, Panorama3Module.this.mMaxWidth, Panorama3Module.this.mMaxHeight, scaleV2, Panorama3Module.this.mInitParam.output_rotation);
                                panorama3Module3.mDirectionFunction = leftDirectionFunction2;
                                return;
                            }
                            Panorama3Module panorama3Module4 = Panorama3Module.this;
                            RightDirectionFunction rightDirectionFunction2 = new RightDirectionFunction(Panorama3Module.this.mPictureWidth, Panorama3Module.this.mPictureHeight, Panorama3Module.this.mMaxWidth, Panorama3Module.this.mMaxHeight, scaleV2, Panorama3Module.this.mInitParam.output_rotation);
                            panorama3Module4.mDirectionFunction = rightDirectionFunction2;
                            return;
                        default:
                            return;
                    }
                } else {
                    switch (i) {
                        case 3:
                            Log.i(Panorama3Module.TAG, "direction : VERTICAL_UP");
                            int scaleH = getScaleH();
                            if (Panorama3Module.this.mCameraOrientation == 90) {
                                Panorama3Module panorama3Module5 = Panorama3Module.this;
                                UpDirectionFunction upDirectionFunction = new UpDirectionFunction(Panorama3Module.this.mPictureWidth, Panorama3Module.this.mPictureHeight, Panorama3Module.this.mMaxWidth, Panorama3Module.this.mMaxHeight, scaleH, Panorama3Module.this.mInitParam.output_rotation);
                                panorama3Module5.mDirectionFunction = upDirectionFunction;
                                return;
                            }
                            Panorama3Module panorama3Module6 = Panorama3Module.this;
                            DownDirectionFunction downDirectionFunction = new DownDirectionFunction(Panorama3Module.this.mPictureWidth, Panorama3Module.this.mPictureHeight, Panorama3Module.this.mMaxWidth, Panorama3Module.this.mMaxHeight, scaleH, Panorama3Module.this.mInitParam.output_rotation);
                            panorama3Module6.mDirectionFunction = downDirectionFunction;
                            return;
                        case 4:
                            Log.i(Panorama3Module.TAG, "direction : VERTICAL_DOWN");
                            int scaleH2 = getScaleH();
                            if (Panorama3Module.this.mCameraOrientation == 90) {
                                Panorama3Module panorama3Module7 = Panorama3Module.this;
                                DownDirectionFunction downDirectionFunction2 = new DownDirectionFunction(Panorama3Module.this.mPictureWidth, Panorama3Module.this.mPictureHeight, Panorama3Module.this.mMaxWidth, Panorama3Module.this.mMaxHeight, scaleH2, Panorama3Module.this.mInitParam.output_rotation);
                                panorama3Module7.mDirectionFunction = downDirectionFunction2;
                                return;
                            }
                            Panorama3Module panorama3Module8 = Panorama3Module.this;
                            UpDirectionFunction upDirectionFunction2 = new UpDirectionFunction(Panorama3Module.this.mPictureWidth, Panorama3Module.this.mPictureHeight, Panorama3Module.this.mMaxWidth, Panorama3Module.this.mMaxHeight, scaleH2, Panorama3Module.this.mInitParam.output_rotation);
                            panorama3Module8.mDirectionFunction = upDirectionFunction2;
                            return;
                        default:
                            return;
                    }
                }
            }

            private int getScaleH() {
                return Math.max(1, (Panorama3Module.this.mMaxHeight / Util.sWindowHeight) * 2);
            }

            private int getScaleV() {
                return (int) Math.max(1.0f, (((float) Panorama3Module.this.mMaxHeight) / (((float) Panorama3Module.this.mSmallPreviewHeight) / Panorama3Module.this.mLongSideCropRatio)) - 1.0f);
            }

            private boolean isUnDecideDirection(int i) {
                return i == -1 || i == 0 || i == 2 || i == 1;
            }

            /* JADX WARNING: Code restructure failed: missing block: B:24:0x00c5, code lost:
                if (r5 != false) goto L_0x00df;
             */
            /* JADX WARNING: Code restructure failed: missing block: B:25:0x00c7, code lost:
                r5 = com.android.camera.module.Panorama3Module.access$000();
                r6 = new java.lang.StringBuilder();
                r6.append("DecideDirectionAttach error ret:");
                r6.append(r0);
                com.android.camera.log.Log.e(r5, r6.toString());
             */
            /* JADX WARNING: Code restructure failed: missing block: B:26:0x00df, code lost:
                com.android.camera.log.Log.e(com.android.camera.module.Panorama3Module.access$000(), java.lang.String.format(java.util.Locale.US, "attach error ret:0x%08X", new java.lang.Object[]{java.lang.Integer.valueOf(r0)}));
             */
            /* JADX WARNING: Code restructure failed: missing block: B:29:?, code lost:
                closeSrc();
             */
            /* JADX WARNING: Code restructure failed: missing block: B:30:0x00fa, code lost:
                return;
             */
            /* JADX WARNING: Code restructure failed: missing block: B:38:?, code lost:
                closeSrc();
             */
            /* JADX WARNING: Code restructure failed: missing block: B:52:?, code lost:
                closeSrc();
                com.android.camera.module.Panorama3Module.access$3502(r1.this$1.this$0, r0);
                createDirection(r0);
             */
            /* JADX WARNING: Code restructure failed: missing block: B:53:0x01d5, code lost:
                if (com.android.camera.module.Panorama3Module.access$3600(r1.this$1.this$0).enabled() == false) goto L_0x0002;
             */
            public void run() {
                int i;
                while (true) {
                    try {
                        CaptureImage captureImage = (CaptureImage) Panorama3Module.this.mAttachImageQueue.take();
                        if (captureImage == Panorama3Module.sAttachExit) {
                            break;
                        }
                        try {
                            setImage(captureImage);
                            synchronized (Panorama3Module.mEngineLock) {
                                if (Panorama3Module.this.mMorphoPanoramaGP3.getAttachCount() % 5 == 0) {
                                    Panorama3Module.this.setInitialRotationByGravity();
                                    Panorama3Module.this.mIsSensorAverage = true;
                                }
                                Panorama3Module.this.setSensorFusionValue(captureImage);
                                if (Panorama3Module.this.mRequestStop) {
                                    Log.e(Panorama3Module.TAG, "DecideDirectionAttach request stop");
                                    closeSrc();
                                    return;
                                }
                                Log.d(Panorama3Module.TAG, "DecideDirectionAttach attach start");
                                int attach = Panorama3Module.this.mMorphoPanoramaGP3.attach(this.byteBuffer[0], this.byteBuffer[1], this.byteBuffer[2], this.rowStride[0], this.rowStride[1], this.rowStride[2], this.pixelStride[0], this.pixelStride[1], this.pixelStride[2], Panorama3Module.this.mCurrentSensorInfoManager, null, Panorama3Module.this.getActivity().getApplicationContext());
                                Log.d(Panorama3Module.TAG, "DecideDirectionAttach attach end");
                                boolean z = attach == -1073741823;
                                if (attach != 0) {
                                    break;
                                }
                                if (isUnDecideDirection(Panorama3Module.this.mInitParam.direction)) {
                                    i = Panorama3Module.this.mMorphoPanoramaGP3.getDirection();
                                    if (i == Panorama3Module.this.mInitParam.direction) {
                                    }
                                } else {
                                    i = Panorama3Module.this.mInitParam.direction;
                                }
                                String access$000 = Panorama3Module.TAG;
                                StringBuilder sb = new StringBuilder();
                                sb.append("getDirection = ");
                                sb.append(i);
                                Log.d(access$000, sb.toString());
                                int[] iArr = new int[2];
                                int outputImageSize = Panorama3Module.this.mMorphoPanoramaGP3.getOutputImageSize(iArr);
                                if (outputImageSize != 0) {
                                    Log.e(Panorama3Module.TAG, String.format(Locale.US, "getOutputImageSize error ret:0x%08X", new Object[]{Integer.valueOf(outputImageSize)}));
                                    closeSrc();
                                    return;
                                }
                                Panorama3Module.this.mMaxWidth = iArr[0];
                                Panorama3Module.this.mMaxHeight = iArr[1];
                                String access$0002 = Panorama3Module.TAG;
                                StringBuilder sb2 = new StringBuilder();
                                sb2.append("mMaxWidth = ");
                                sb2.append(Panorama3Module.this.mMaxWidth);
                                sb2.append(", mMaxHeight = ");
                                sb2.append(Panorama3Module.this.mMaxHeight);
                                Log.d(access$0002, sb2.toString());
                            }
                        } catch (Throwable th) {
                            closeSrc();
                            throw th;
                        }
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
                Panorama3Module.this.getActivity().runOnUiThread(new DecideRunnable());
                Log.d(Panorama3Module.TAG, "DecideDirectionAttach end");
            }
        }

        private DecideDirection() {
            this.mHasSubmit = false;
        }

        public boolean onSaveImage(CaptureImage captureImage) {
            Panorama3Module.this.addAttachQueue(captureImage);
            if (!this.mHasSubmit) {
                Log.d(Panorama3Module.TAG, "submit DecideDirectionAttach");
                Panorama3Module.this.mExecutor.submit(new DecideDirectionAttach());
                this.mHasSubmit = true;
            }
            return true;
        }
    }

    private class MainHandler extends Handler {
        public MainHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            if (message.what == 45) {
                Log.d(Panorama3Module.TAG, "onMessage MSG_ABANDON_HANDLER setActivity null");
                Panorama3Module.this.setActivity(null);
            }
            if (!Panorama3Module.this.isCreated()) {
                removeCallbacksAndMessages(null);
            } else if (Panorama3Module.this.getActivity() != null) {
                int i = message.what;
                if (i != 2) {
                    if (i == 17) {
                        Panorama3Module.this.mHandler.removeMessages(17);
                        Panorama3Module.this.mHandler.removeMessages(2);
                        Panorama3Module.this.getWindow().addFlags(128);
                        Panorama3Module.this.mHandler.sendEmptyMessageDelayed(2, (long) Panorama3Module.this.getScreenDelay());
                    } else if (i != 51) {
                        switch (i) {
                            case 9:
                                int uIStyleByPreview = CameraSettings.getUIStyleByPreview(Panorama3Module.this.mPreviewSize.width, Panorama3Module.this.mPreviewSize.height);
                                if (uIStyleByPreview != Panorama3Module.this.mUIStyle) {
                                    Panorama3Module.this.mUIStyle = uIStyleByPreview;
                                }
                                Panorama3Module.this.registerGravitySensorListener();
                                Panorama3Module.this.initPreviewLayout();
                                break;
                            case 10:
                                Panorama3Module.this.mOpenCameraFail = true;
                                Panorama3Module.this.onCameraException();
                                break;
                            default:
                                if (!BaseModule.DEBUG) {
                                    String access$000 = Panorama3Module.TAG;
                                    StringBuilder sb = new StringBuilder();
                                    sb.append("no consumer for this message: ");
                                    sb.append(message.what);
                                    Log.e(access$000, sb.toString());
                                    break;
                                } else {
                                    StringBuilder sb2 = new StringBuilder();
                                    sb2.append("no consumer for this message: ");
                                    sb2.append(message.what);
                                    throw new RuntimeException(sb2.toString());
                                }
                        }
                    } else if (Panorama3Module.this.mActivity != null && !Panorama3Module.this.mActivity.isActivityPaused()) {
                        Panorama3Module.this.mOpenCameraFail = true;
                        Panorama3Module.this.onCameraException();
                    }
                }
                Panorama3Module.this.getWindow().clearFlags(128);
            }
        }
    }

    private class PanoramaFirst extends PanoramaState {
        private PanoramaFirst() {
        }

        public boolean onSaveImage(CaptureImage captureImage) {
            captureImage.close();
            Panorama3Module.this.setNullDirectionFunction();
            if (Panorama3Module.this.mRequestStop) {
                Log.e(Panorama3Module.TAG, "PanoramaFirst.onSaveImage request stop");
                return false;
            }
            Panorama3Module.this.configMorphoPanoramaGP3();
            int start = Panorama3Module.this.mMorphoPanoramaGP3.start(Panorama3Module.this.mPictureWidth, Panorama3Module.this.mPictureHeight);
            if (start != 0) {
                String access$000 = Panorama3Module.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("start error resultCode:");
                sb.append(start);
                Log.e(access$000, sb.toString());
                return false;
            }
            Panorama3Module.this.mPanoramaState = new DecideDirection();
            Panorama3Module.this.mPanoramaState.setPanoramaStateEventListener(this.listener);
            clearListener();
            return true;
        }
    }

    private class PanoramaInit extends PanoramaState {
        private PanoramaInit() {
        }

        public boolean onSaveImage(CaptureImage captureImage) {
            Panorama3Module.this.mImageFormat = captureImage.getImageFormat();
            String access$000 = Panorama3Module.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("PanoramaInit onSaveImage start, ImageFormat :");
            sb.append(Panorama3Module.this.mImageFormat);
            Log.d(access$000, sb.toString());
            if (Panorama3Module.this.mRequestStop) {
                Log.w(Panorama3Module.TAG, "mRequestStop when PanoramaInit");
                captureImage.close();
                return false;
            }
            synchronized (Panorama3Module.mEngineLock) {
                if (Panorama3Module.this.createEngine()) {
                    int inputImageFormat = Panorama3Module.this.mMorphoPanoramaGP3.setInputImageFormat(Panorama3Module.this.mImageFormat);
                    if (inputImageFormat != 0) {
                        String access$0002 = Panorama3Module.TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("setInputImageFormat error resultCode:");
                        sb2.append(inputImageFormat);
                        Log.e(access$0002, sb2.toString());
                    }
                    Panorama3Module.this.mPanoramaState = new PanoramaFirst();
                    Panorama3Module.this.mPanoramaState.setPanoramaStateEventListener(this.listener);
                    clearListener();
                    Panorama3Module.this.mPanoramaState.onSaveImage(captureImage);
                    Log.d(Panorama3Module.TAG, "PanoramaInit onSaveImage end");
                    return true;
                }
                captureImage.close();
                return true;
            }
        }
    }

    private class PanoramaPreview extends PanoramaState {
        /* access modifiers changed from: private */
        public PositionDetector mDetector;
        private boolean mHasSubmit;
        private int mPreviewImgHeight = 0;
        private int mPreviewImgWidth = 0;
        /* access modifiers changed from: private */
        public final UiUpdateRunnable mUiUpdateRunnable = new UiUpdateRunnable();
        final /* synthetic */ Panorama3Module this$0;

        private class PreviewAttach extends AttachRunnable {
            private InputSave mInputSave;
            private boolean mIsAttachEnd;
            private final PostAttachRunnable mPostAttachRunnable;
            private int mResultCode;

            private class PostAttachRunnable implements Runnable {
                private PostAttachRunnable() {
                }

                public void run() {
                    if (!PanoramaPreview.this.this$0.mPaused && !PanoramaPreview.this.this$0.mRequestStop) {
                        PanoramaPreview.this.this$0.onPreviewMoving();
                        if (!PanoramaPreview.this.this$0.mCaptureOrientationDecided) {
                            PanoramaPreview.this.this$0.onCaptureOrientationDecided();
                        }
                        PanoramaProtocol panoramaProtocol = (PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
                        synchronized (Panorama3Module.mPreviewImageLock) {
                            if (panoramaProtocol != null) {
                                try {
                                    if (PanoramaPreview.this.this$0.mDispPreviewImage != null) {
                                        panoramaProtocol.setDisplayPreviewBitmap(PanoramaPreview.this.this$0.mDispPreviewImage);
                                    }
                                } finally {
                                }
                            }
                        }
                    }
                }
            }

            private PreviewAttach() {
                this.mIsAttachEnd = false;
                this.mPostAttachRunnable = new PostAttachRunnable();
                this.mInputSave = new InputSave();
            }

            private void checkAttachEnd(double[] dArr) {
                int detect = PanoramaPreview.this.mDetector.detect(dArr[0], dArr[1]);
                String access$000 = Panorama3Module.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("checkAttachEnd detect_result = ");
                sb.append(detect);
                Log.v(access$000, sb.toString());
                if (detect != 1) {
                    switch (detect) {
                        case -2:
                        case -1:
                            break;
                    }
                }
                this.mResultCode = 0;
                this.mIsAttachEnd = true;
                PanoramaPreview.this.mUiUpdateRunnable.setDetectResult(detect);
                PanoramaPreview.this.this$0.getActivity().runOnUiThread(PanoramaPreview.this.mUiUpdateRunnable);
                if (!this.mIsAttachEnd) {
                }
            }

            /* JADX WARNING: Code restructure failed: missing block: B:25:0x01fc, code lost:
                return;
             */
            private void updatePreviewImage() {
                Bitmap bitmap;
                synchronized (Panorama3Module.mPreviewImageLock) {
                    int updatePreviewImage = PanoramaPreview.this.this$0.mMorphoPanoramaGP3.updatePreviewImage(PanoramaPreview.this.this$0.mPreviewImage);
                    if (updatePreviewImage != 0) {
                        String access$000 = Panorama3Module.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("updatePreviewImage error ret:");
                        sb.append(updatePreviewImage);
                        Log.e(access$000, sb.toString());
                    } else if (PanoramaPreview.this.this$0.mPreviewImage == null) {
                        Log.w(Panorama3Module.TAG, "mPreviewImage is null when updatePreviewImage");
                    } else {
                        int i = 90;
                        if (PanoramaPreview.this.this$0.mInitParam.output_rotation % 180 == 90) {
                            if (PanoramaPreview.this.this$0.mInitParam.output_rotation == 270) {
                                Matrix matrix = new Matrix();
                                matrix.postRotate((float) 180);
                                bitmap = Bitmap.createBitmap(PanoramaPreview.this.this$0.mPreviewImage, 0, 0, PanoramaPreview.this.this$0.mPreviewImage.getWidth(), PanoramaPreview.this.this$0.mPreviewImage.getHeight(), matrix, true);
                            } else {
                                bitmap = PanoramaPreview.this.this$0.mPreviewImage;
                            }
                            int width = bitmap.getWidth();
                            int round = Math.round(((float) bitmap.getHeight()) * PanoramaPreview.this.this$0.mLongSideCropRatio);
                            int width2 = PanoramaPreview.this.this$0.mDispPreviewImage.getWidth();
                            int height = PanoramaPreview.this.this$0.mDispPreviewImage.getHeight();
                            Rect rect = new Rect(0, 0, width2, height);
                            int i2 = (int) (((float) width) / (((float) width2) / ((float) height)));
                            int height2 = ((int) ((((float) bitmap.getHeight()) * (1.0f - PanoramaPreview.this.this$0.mLongSideCropRatio)) / 2.0f)) + ((i2 - round) / 2);
                            Rect rect2 = new Rect(0, height2, width, i2 + height2);
                            String access$0002 = Panorama3Module.TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("src ");
                            sb2.append(rect2);
                            sb2.append(", dst = ");
                            sb2.append(rect);
                            Log.v(access$0002, sb2.toString());
                            PanoramaPreview.this.this$0.mDispPreviewImageCanvas.drawBitmap(bitmap, rect2, rect, PanoramaPreview.this.this$0.mDispPreviewImagePaint);
                        } else {
                            if (PanoramaPreview.this.this$0.mInitParam.output_rotation == 180) {
                                i = -90;
                            }
                            Matrix matrix2 = new Matrix();
                            matrix2.postRotate((float) i);
                            Bitmap createBitmap = Bitmap.createBitmap(PanoramaPreview.this.this$0.mPreviewImage, 0, 0, PanoramaPreview.this.this$0.mPreviewImage.getWidth(), PanoramaPreview.this.this$0.mPreviewImage.getHeight(), matrix2, true);
                            int width3 = createBitmap.getWidth();
                            int round2 = Math.round(((float) createBitmap.getHeight()) * PanoramaPreview.this.this$0.mLongSideCropRatio);
                            int width4 = PanoramaPreview.this.this$0.mDispPreviewImage.getWidth();
                            int height3 = PanoramaPreview.this.this$0.mDispPreviewImage.getHeight();
                            Rect rect3 = new Rect(0, 0, width4, height3);
                            int i3 = (int) (((float) width3) / (((float) width4) / ((float) height3)));
                            int height4 = ((int) ((((float) createBitmap.getHeight()) * (1.0f - PanoramaPreview.this.this$0.mLongSideCropRatio)) / 2.0f)) + ((i3 - round2) / 2);
                            Rect rect4 = new Rect(0, height4, width3, i3 + height4);
                            String access$0003 = Panorama3Module.TAG;
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("src ");
                            sb3.append(rect4);
                            sb3.append(", dst = ");
                            sb3.append(rect3);
                            Log.v(access$0003, sb3.toString());
                            PanoramaPreview.this.this$0.mDispPreviewImageCanvas.drawBitmap(createBitmap, rect4, rect3, PanoramaPreview.this.this$0.mDispPreviewImagePaint);
                        }
                    }
                }
            }

            /* JADX WARNING: Code restructure failed: missing block: B:33:?, code lost:
                r1.this$1.this$0.getActivity().runOnUiThread(r1.mPostAttachRunnable);
                r0 = r18;
                checkAttachEnd(r0);
             */
            /* JADX WARNING: Code restructure failed: missing block: B:34:0x010b, code lost:
                if (r1.mIsAttachEnd == false) goto L_0x0117;
             */
            /* JADX WARNING: Code restructure failed: missing block: B:35:0x010d, code lost:
                com.android.camera.log.Log.d(com.android.camera.module.Panorama3Module.access$000(), "preview attach end");
             */
            /* JADX WARNING: Code restructure failed: missing block: B:37:?, code lost:
                closeSrc();
             */
            /* JADX WARNING: Code restructure failed: missing block: B:45:0x0123, code lost:
                r0 = th;
             */
            /* JADX WARNING: Removed duplicated region for block: B:58:0x0147  */
            /* JADX WARNING: Removed duplicated region for block: B:60:0x0161  */
            /* JADX WARNING: Unknown top exception splitter block from list: {B:27:0x00b9=Splitter:B:27:0x00b9, B:49:0x0129=Splitter:B:49:0x0129} */
            public void run() {
                int i;
                double[] dArr;
                Log.d(Panorama3Module.TAG, "PreviewAttach.run start");
                char c = 2;
                double[] dArr2 = new double[2];
                while (true) {
                    try {
                        CaptureImage captureImage = (CaptureImage) PanoramaPreview.this.this$0.mAttachImageQueue.take();
                        if (captureImage == Panorama3Module.sAttachExit) {
                            break;
                        }
                        try {
                            setImage(captureImage);
                            if (Panorama3Module.DUMP_YUV) {
                                this.mInputSave.onSaveImage(captureImage, PanoramaPreview.this.this$0.mImageFormat);
                            }
                            synchronized (Panorama3Module.mEngineLock) {
                                try {
                                    if (PanoramaPreview.this.this$0.mRequestStop) {
                                        Log.w(Panorama3Module.TAG, "PreviewAttach request stop");
                                        closeSrc();
                                        return;
                                    }
                                    Log.v(Panorama3Module.TAG, "PreviewAttach attach start");
                                    PanoramaPreview.this.this$0.setSensorFusionValue(captureImage);
                                    double[] dArr3 = dArr2;
                                    double[] dArr4 = dArr2;
                                    i = -1;
                                    try {
                                        if (PanoramaPreview.this.this$0.mMorphoPanoramaGP3.attach(this.byteBuffer[0], this.byteBuffer[1], this.byteBuffer[c], this.rowStride[0], this.rowStride[1], this.rowStride[c], this.pixelStride[0], this.pixelStride[1], this.pixelStride[c], PanoramaPreview.this.this$0.mCurrentSensorInfoManager, dArr3, PanoramaPreview.this.this$0.getActivity()) != 0) {
                                            Log.e(Panorama3Module.TAG, "PreviewAttach attach error.");
                                            this.mResultCode = -1;
                                        } else {
                                            Log.v(Panorama3Module.TAG, "PreviewAttach attach end");
                                            PanoramaPreview.this.this$0.mCanSavePanorama = true;
                                            updatePreviewImage();
                                            String access$000 = Panorama3Module.TAG;
                                            StringBuilder sb = new StringBuilder();
                                            sb.append("mCenter = ");
                                            sb.append(dArr4[0]);
                                            sb.append(", ");
                                            sb.append(dArr4[1]);
                                            Log.v(access$000, sb.toString());
                                        }
                                    } catch (Throwable th) {
                                        th = th;
                                        throw th;
                                    }
                                } catch (Throwable th2) {
                                    th = th2;
                                    i = -1;
                                    throw th;
                                }
                            }
                        } catch (Throwable th3) {
                            th = th3;
                            i = -1;
                            closeSrc();
                            throw th;
                        }
                        dArr2 = dArr;
                        c = 2;
                    } catch (InterruptedException e) {
                        e = e;
                        i = -1;
                        Log.w(Panorama3Module.TAG, "PreviewAttach interrupted", e);
                        this.mResultCode = i;
                        if (!PanoramaPreview.this.this$0.mRequestStop) {
                        }
                    }
                }
                try {
                    closeSrc();
                } catch (InterruptedException e2) {
                    e = e2;
                }
                if (!PanoramaPreview.this.this$0.mRequestStop) {
                    PanoramaPreview.this.this$0.getActivity().runOnUiThread(new Runnable() {
                        public void run() {
                            PanoramaPreview.this.this$0.registerGravitySensorListener();
                        }
                    });
                    Log.d(Panorama3Module.TAG, "PreviewAttach exit. (request exit)");
                    return;
                }
                final int i2 = this.mResultCode;
                PanoramaPreview.this.this$0.getActivity().runOnUiThread(new Runnable() {
                    public void run() {
                        PanoramaPreview.this.attachEnd(i2);
                    }
                });
                Log.d(Panorama3Module.TAG, "PreviewAttach exit.");
            }
        }

        private class UiUpdateRunnable implements Runnable {
            private int mDetectResult;

            private UiUpdateRunnable() {
            }

            /* JADX WARNING: Code restructure failed: missing block: B:20:0x0088, code lost:
                com.android.camera.module.Panorama3Module.access$6202(r5.this$1.this$0, java.lang.Math.min(r3, r4) / 2);
                r0 = (com.android.camera.protocol.ModeProtocol.PanoramaProtocol) com.android.camera.protocol.ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
             */
            /* JADX WARNING: Code restructure failed: missing block: B:21:0x00a1, code lost:
                if (r0 == null) goto L_0x00bd;
             */
            /* JADX WARNING: Code restructure failed: missing block: B:22:0x00a3, code lost:
                r0.setDirectionPosition(r2, com.android.camera.module.Panorama3Module.access$6200(r5.this$1.this$0));
             */
            /* JADX WARNING: Code restructure failed: missing block: B:23:0x00b0, code lost:
                if (r5.mDetectResult == 2) goto L_0x00b7;
             */
            /* JADX WARNING: Code restructure failed: missing block: B:24:0x00b2, code lost:
                r0.setDirectionTooFast(false, 0);
             */
            /* JADX WARNING: Code restructure failed: missing block: B:25:0x00b7, code lost:
                r0.setDirectionTooFast(true, com.android.camera.constant.DurationConstant.DURATION_LANDSCAPE_HINT);
             */
            /* JADX WARNING: Code restructure failed: missing block: B:26:0x00bd, code lost:
                return;
             */
            public void run() {
                if (this.mDetectResult == -2 || this.mDetectResult == -1 || this.mDetectResult == 1) {
                    if (this.mDetectResult != 1) {
                        String access$000 = Panorama3Module.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("stopPanoramaShooting due to detect result ");
                        sb.append(this.mDetectResult);
                        Log.w(access$000, sb.toString());
                    }
                    PanoramaPreview.this.this$0.stopPanoramaShooting(true);
                    return;
                }
                RectF frameRect = PanoramaPreview.this.mDetector.getFrameRect();
                String access$0002 = Panorama3Module.TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("frame_rect = ");
                sb2.append(frameRect);
                Log.v(access$0002, sb2.toString());
                Point point = new Point();
                if (PanoramaPreview.this.this$0.mDirection == 3) {
                    point.x = (int) frameRect.right;
                } else {
                    point.x = (int) frameRect.left;
                }
                point.y = (int) frameRect.centerY();
                synchronized (Panorama3Module.mPreviewImageLock) {
                    if (PanoramaPreview.this.this$0.mDispPreviewImage == null) {
                        Log.w(Panorama3Module.TAG, "mPreviewImage is null in UiUpdateRunnable");
                    } else {
                        int width = PanoramaPreview.this.this$0.mDispPreviewImage.getWidth();
                        int height = PanoramaPreview.this.this$0.mDispPreviewImage.getHeight();
                    }
                }
            }

            public void setDetectResult(int i) {
                this.mDetectResult = i;
            }
        }

        @TargetApi(21)
        public PanoramaPreview(Panorama3Module panorama3Module) {
            Panorama3Module panorama3Module2 = panorama3Module;
            this.this$0 = panorama3Module2;
            int scale = panorama3Module.mDirectionFunction.getScale();
            Size previewSize = panorama3Module.mDirectionFunction.getPreviewSize();
            Log.d(Panorama3Module.TAG, String.format(Locale.US, "previewSize %dx%d, scale %d", new Object[]{Integer.valueOf(previewSize.getWidth()), Integer.valueOf(previewSize.getHeight()), Integer.valueOf(scale)}));
            this.mPreviewImgWidth = previewSize.getWidth();
            this.mPreviewImgHeight = previewSize.getHeight();
            String access$000 = Panorama3Module.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("mPreviewImgWidth = ");
            sb.append(this.mPreviewImgWidth);
            sb.append(", mPreviewImgHeight = ");
            sb.append(this.mPreviewImgHeight);
            Log.d(access$000, sb.toString());
            int previewImage = panorama3Module.mMorphoPanoramaGP3.setPreviewImage(this.mPreviewImgWidth, this.mPreviewImgHeight);
            if (previewImage != 0) {
                Log.e(Panorama3Module.TAG, String.format(Locale.US, "setPreviewImage error ret:0x%08X", new Object[]{Integer.valueOf(previewImage)}));
            }
            PanoramaProtocol panoramaProtocol = (PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
            if (panoramaProtocol != null) {
                PositionDetector positionDetector = new PositionDetector(panorama3Module.mInitParam, panoramaProtocol.getPreivewContainer(), false, panorama3Module2.mCameraDisplayOrientation, panorama3Module.mPictureWidth, panorama3Module.mPictureHeight, panorama3Module.mDirectionFunction.getDirection(), panorama3Module.mMaxWidth, panorama3Module.mMaxHeight);
                this.mDetector = positionDetector;
                panorama3Module.mRoundDetector.setStartPosition(panorama3Module.mInitParam.output_rotation, 1, panorama3Module.mViewAngleH, panorama3Module.mViewAngleV, false);
                allocateDisplayBuffers();
            }
        }

        private void allocateDisplayBuffers() {
            synchronized (Panorama3Module.mPreviewImageLock) {
                if (!(this.this$0.mPreviewImage == null || (this.this$0.mPreviewImage.getWidth() == this.mPreviewImgWidth && this.this$0.mPreviewImage.getHeight() == this.mPreviewImgHeight))) {
                    this.this$0.mPreviewImage.recycle();
                    this.this$0.mPreviewImage = null;
                    this.this$0.mDispPreviewImage.recycle();
                    this.this$0.mDispPreviewImage = null;
                }
                if (this.this$0.mPreviewImage == null) {
                    this.this$0.mPreviewImage = Bitmap.createBitmap(this.mPreviewImgWidth, this.mPreviewImgHeight, Config.ARGB_8888);
                    this.this$0.mDispPreviewImage = Bitmap.createBitmap(Util.sWindowWidth, this.this$0.mSmallPreviewHeight, Config.ARGB_8888);
                    this.this$0.mAttachPosOffsetY = ((this.this$0.mDispPreviewImage.getWidth() * this.this$0.mPictureWidth) / this.this$0.mPictureHeight) / 2;
                    String access$000 = Panorama3Module.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("mAttachPosOffsetY = ");
                    sb.append(this.this$0.mAttachPosOffsetY);
                    Log.d(access$000, sb.toString());
                    this.this$0.mDispPreviewImageCanvas = new Canvas(this.this$0.mDispPreviewImage);
                    this.this$0.mDispPreviewImagePaint = new Paint();
                    this.this$0.mDispPreviewImagePaint.setXfermode(new PorterDuffXfermode(Mode.SRC));
                }
            }
        }

        /* access modifiers changed from: private */
        public void attachEnd(int i) {
            this.this$0.initAttachQueue();
            this.this$0.registerGravitySensorListener();
            this.listener.requestEnd(this, i);
            if (i == 0) {
                this.this$0.stopPanoramaShooting(true);
            }
        }

        public boolean onSaveImage(CaptureImage captureImage) {
            this.this$0.addAttachQueue(captureImage);
            if (!this.mHasSubmit) {
                Log.d(Panorama3Module.TAG, "submit PreviewAttach");
                this.this$0.mExecutor.submit(new PreviewAttach());
                this.mHasSubmit = true;
            }
            return true;
        }
    }

    private class SaveOutputImageTask extends AsyncTask<Void, Integer, Integer> {
        private boolean mSaveImage;
        private long start_time;

        SaveOutputImageTask(boolean z) {
            this.mSaveImage = z;
        }

        private void savePanoramaPicture() {
            Log.d(Panorama3Module.TAG, "savePanoramaPicture start");
            synchronized (Panorama3Module.mEngineLock) {
                try {
                    Log.d(Panorama3Module.TAG, "savePanoramaPicture enter mEngineLock");
                    if (Panorama3Module.this.mMorphoPanoramaGP3 == null) {
                        Log.w(Panorama3Module.TAG, "savePanoramaPicture while mMorphoPanoramaGP3 is null");
                        Panorama3Module.this.finishEngine();
                    } else if (!this.mSaveImage) {
                        Log.w(Panorama3Module.TAG, String.format("savePanoramaPicture, don't save image", new Object[0]));
                        int end = Panorama3Module.this.mMorphoPanoramaGP3.end(1, (double) Panorama3Module.this.mRoundDetector.currentDegree0Base());
                        if (end != 0) {
                            Log.e(Panorama3Module.TAG, String.format("savePanoramaPicture, end() -> 0x%x", new Object[]{Integer.valueOf(end)}));
                        }
                        Panorama3Module.this.finishEngine();
                    } else {
                        int noiseReductionParam = Panorama3Module.this.mMorphoPanoramaGP3.setNoiseReductionParam(0);
                        if (noiseReductionParam != 0) {
                            String access$000 = Panorama3Module.TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("setNoiseReductionParam error ret:");
                            sb.append(noiseReductionParam);
                            Log.e(access$000, sb.toString());
                        }
                        int unsharpStrength = Panorama3Module.this.mMorphoPanoramaGP3.setUnsharpStrength(1536);
                        if (unsharpStrength != 0) {
                            Log.e(Panorama3Module.TAG, String.format(Locale.US, "setUnsharpStrength error ret:0x%08X", new Object[]{Integer.valueOf(unsharpStrength)}));
                        }
                        int end2 = Panorama3Module.this.mMorphoPanoramaGP3.end(1, (double) Panorama3Module.this.mRoundDetector.currentDegree0Base());
                        if (end2 != 0) {
                            Log.e(Panorama3Module.TAG, String.format("savePanoramaPicture, end() -> 0x%x", new Object[]{Integer.valueOf(end2)}));
                            Panorama3Module.this.finishEngine();
                            return;
                        }
                        Rect rect = new Rect();
                        int clippingRect = Panorama3Module.this.mMorphoPanoramaGP3.getClippingRect(rect);
                        if (clippingRect != 0) {
                            Log.e(Panorama3Module.TAG, String.format("getClippingRect() -> 0x%x", new Object[]{Integer.valueOf(clippingRect)}));
                            Panorama3Module.this.finishEngine();
                            return;
                        }
                        int width = rect.width();
                        int height = rect.height();
                        if (width != 0) {
                            if (height != 0) {
                                int createOutputImage = Panorama3Module.this.mMorphoPanoramaGP3.createOutputImage(rect);
                                if (createOutputImage != 0) {
                                    String access$0002 = Panorama3Module.TAG;
                                    StringBuilder sb2 = new StringBuilder();
                                    sb2.append("createOutputImage error ret:");
                                    sb2.append(createOutputImage);
                                    Log.e(access$0002, sb2.toString());
                                    Panorama3Module.this.finishEngine();
                                    return;
                                }
                                String access$800 = Panorama3Module.this.createNameString(Panorama3Module.this.mTimeTaken);
                                String generateFilepath = Storage.generateFilepath(access$800);
                                if (!Panorama3Module.this.savePanoramaFile(generateFilepath, width, height)) {
                                    Panorama3Module.this.finishEngine();
                                    return;
                                }
                                Panorama3Module.this.addImageAsApplication(generateFilepath, access$800, width, height, Panorama3Module.this.calibrateRotation(1));
                                Panorama3Module.this.finishEngine();
                                Log.d(Panorama3Module.TAG, "savePanoramaPicture end");
                                return;
                            }
                        }
                        String access$0003 = Panorama3Module.TAG;
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("getClippingRect() ");
                        sb3.append(rect);
                        Log.e(access$0003, sb3.toString());
                        Panorama3Module.this.finishEngine();
                    }
                } catch (Throwable th) {
                    Panorama3Module.this.finishEngine();
                    throw th;
                }
            }
        }

        /* access modifiers changed from: protected */
        public Integer doInBackground(Void... voidArr) {
            Log.v(Panorama3Module.TAG, "doInBackground>>");
            savePanoramaPicture();
            return null;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Integer num) {
            Log.d(Panorama3Module.TAG, "PanoramaFinish done");
            Camera camera = Panorama3Module.this.mActivity;
            if (camera != null) {
                AutoLockManager.getInstance(camera).hibernateDelayed();
            }
            if (Panorama3Module.this.mPaused) {
                Panorama3Module.this.mIsShooting = false;
                Log.w(Panorama3Module.TAG, "panorama mode has been paused");
                return;
            }
            if (Panorama3Module.this.mDispPreviewImage != null) {
                Panorama3Module.this.mDispPreviewImage.eraseColor(0);
            }
            if (camera != null) {
                camera.getThumbnailUpdater().updateThumbnailView(true);
            }
            Panorama3Module.this.onSaveFinish();
            Panorama3Module.this.mHandler.post(new Runnable() {
                public void run() {
                    Panorama3Module.this.handlePendingScreenSlide();
                }
            });
            Panorama3Module.this.mIsShooting = false;
            Log.d(Panorama3Module.TAG, String.format(Locale.ENGLISH, "[MORTIME] PanoramaFinish time = %d", new Object[]{Long.valueOf(System.currentTimeMillis() - this.start_time)}));
        }

        /* access modifiers changed from: protected */
        public void onPreExecute() {
            this.start_time = System.currentTimeMillis();
        }
    }

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

    public Panorama3Module() {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(1, 1, 0, TimeUnit.MILLISECONDS, new LinkedBlockingQueue(), new ThreadFactory() {
            public Thread newThread(Runnable runnable) {
                return new Thread(runnable, "PanoramaThread");
            }
        }, new RejectedExecutionHandler() {
            public void rejectedExecution(Runnable runnable, ThreadPoolExecutor threadPoolExecutor) {
                String access$000 = Panorama3Module.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("rejectedExecution ");
                sb.append(runnable);
                Log.w(access$000, sb.toString());
            }
        });
        this.mExecutor = threadPoolExecutor;
        this.mCanSavePanorama = false;
        this.mRequestStop = false;
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x004d  */
    public void addAttachQueue(CaptureImage captureImage) {
        boolean z;
        Throwable th;
        if (captureImage == null) {
            Log.w(TAG, "addAttachQueue failed due to image is null");
            return;
        }
        try {
            if (this.mRequestStop) {
                Log.w(TAG, "addAttachQueue failed due to request stop");
                captureImage.close();
                return;
            }
            z = this.mAttachImageQueue.offer(captureImage);
            while (this.mAttachImageQueue.size() > 1) {
                try {
                    CaptureImage captureImage2 = (CaptureImage) this.mAttachImageQueue.poll();
                    if (captureImage2 != null) {
                        captureImage2.close();
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (!z) {
                        captureImage.close();
                    }
                    throw th;
                }
            }
            if (!z) {
                captureImage.close();
            }
            Log.v(TAG, "addAttachQueue");
        } catch (Throwable th3) {
            Throwable th4 = th3;
            z = false;
            th = th4;
            if (!z) {
            }
            throw th;
        }
    }

    /* access modifiers changed from: private */
    public void addImageAsApplication(String str, String str2, int i, int i2, int i3) {
        ParcelFileDescriptor parcelFileDescriptor;
        Throwable th;
        String str3 = str;
        int i4 = i3;
        Location currentLocation = LocationManager.instance().getCurrentLocation();
        if (!Storage.isUseDocumentMode()) {
            ExifHelper.writeExifByFilePath(str3, i4, currentLocation, this.mTimeTaken);
        } else {
            try {
                parcelFileDescriptor = FileCompat.getParcelFileDescriptor(str3, true);
                ExifHelper.writeExifByFd(parcelFileDescriptor.getFileDescriptor(), i4, currentLocation, this.mTimeTaken);
                if (parcelFileDescriptor != null) {
                    $closeResource(null, parcelFileDescriptor);
                }
            } catch (Exception e) {
                String str4 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("open file failed, filePath ");
                sb.append(str3);
                Log.e(str4, sb.toString(), e);
            } catch (Throwable th2) {
                if (parcelFileDescriptor != null) {
                    $closeResource(th, parcelFileDescriptor);
                }
                throw th2;
            }
        }
        boolean z = currentLocation != null;
        Uri addImageForGroupOrPanorama = Storage.addImageForGroupOrPanorama(CameraAppImpl.getAndroidContext(), str3, i4, this.mTimeTaken, this.mLocation, i, i2);
        if (addImageForGroupOrPanorama == null) {
            String str5 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("insert MediaProvider failed, attempt to find uri by path, ");
            sb2.append(str3);
            Log.w(str5, sb2.toString());
            addImageForGroupOrPanorama = MediaProviderUtil.getContentUriFromPath(CameraAppImpl.getAndroidContext(), str3);
        }
        Uri uri = addImageForGroupOrPanorama;
        String str6 = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("addImageAsApplication uri = ");
        sb3.append(uri);
        sb3.append(", path = ");
        sb3.append(str3);
        Log.d(str6, sb3.toString());
        trackGeneralInfo(1, false);
        trackPictureTaken(1, false, z, null, false, false);
        Camera camera = this.mActivity;
        if (isCreated() && camera != null) {
            camera.getScreenHint().updateHint();
            if (uri != null) {
                camera.onNewUriArrived(uri, str2);
                Thumbnail createThumbnailFromUri = Thumbnail.createThumbnailFromUri(camera.getContentResolver(), uri, false);
                Util.broadcastNewPicture(camera, uri);
                camera.getThumbnailUpdater().setThumbnail(createThumbnailFromUri, false, false);
            }
        }
    }

    /* access modifiers changed from: private */
    public int calibrateRotation(int i) {
        if (!(i == 0 || i == 90 || i == 180 || i == 270)) {
            i = 0;
        }
        return (i + this.mDeviceOrientationAtCapture) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
    }

    /* access modifiers changed from: private */
    public boolean configMorphoPanoramaGP3() {
        Log.d(TAG, "configMorphoPanoramaGP3 start");
        this.mMorphoPanoramaGP3.setAttachEnabled(true);
        this.mMorphoPanoramaGP3.disableSaveInputImages();
        int shrinkRatio = this.mMorphoPanoramaGP3.setShrinkRatio((double) this.mPanoramaSetting.getShrink_ratio());
        if (shrinkRatio != 0) {
            Log.e(TAG, String.format(Locale.US, "setShrinkRatio error ret:0x%08X", new Object[]{Integer.valueOf(shrinkRatio)}));
        }
        int calcseamPixnum = this.mMorphoPanoramaGP3.setCalcseamPixnum(this.mPanoramaSetting.getCalcseam_pixnum());
        if (calcseamPixnum != 0) {
            Log.e(TAG, String.format(Locale.US, "setCalcseamPixnum error ret:0x%08X", new Object[]{Integer.valueOf(calcseamPixnum)}));
        }
        int useDeform = this.mMorphoPanoramaGP3.setUseDeform(this.mPanoramaSetting.isUse_deform());
        if (useDeform != 0) {
            Log.e(TAG, String.format(Locale.US, "setUseDeform error ret:0x%08X", new Object[]{Integer.valueOf(useDeform)}));
        }
        int useLuminanceCorrection = this.mMorphoPanoramaGP3.setUseLuminanceCorrection(this.mPanoramaSetting.isUse_luminance_correction());
        if (useLuminanceCorrection != 0) {
            Log.e(TAG, String.format(Locale.US, "setUseLuminanceCorrection error ret:0x%08X", new Object[]{Integer.valueOf(useLuminanceCorrection)}));
        }
        int seamsearchRatio = this.mMorphoPanoramaGP3.setSeamsearchRatio(this.mPanoramaSetting.getSeamsearch_ratio());
        if (seamsearchRatio != 0) {
            Log.e(TAG, String.format(Locale.US, "setSeamsearchRatio error ret:0x%08X", new Object[]{Integer.valueOf(seamsearchRatio)}));
        }
        int zrotationCoeff = this.mMorphoPanoramaGP3.setZrotationCoeff(this.mPanoramaSetting.getZrotation_coeff());
        if (zrotationCoeff != 0) {
            Log.e(TAG, String.format(Locale.US, "setZrotationCoeff error ret:0x%08X", new Object[]{Integer.valueOf(zrotationCoeff)}));
        }
        int drawThreshold = this.mMorphoPanoramaGP3.setDrawThreshold(this.mPanoramaSetting.getDraw_threshold());
        if (drawThreshold != 0) {
            Log.e(TAG, String.format(Locale.US, "setDrawThreshold error ret:0x%08X", new Object[]{Integer.valueOf(drawThreshold)}));
        }
        int aovGain = this.mMorphoPanoramaGP3.setAovGain(this.mPanoramaSetting.getAov_gain());
        if (aovGain != 0) {
            Log.e(TAG, String.format(Locale.US, "setAovGain error ret:0x%08X", new Object[]{Integer.valueOf(aovGain)}));
        }
        int distortionCorrectionParam = this.mMorphoPanoramaGP3.setDistortionCorrectionParam(this.mPanoramaSetting.getDistortion_k1(), this.mPanoramaSetting.getDistortion_k2(), this.mPanoramaSetting.getDistortion_k3(), this.mPanoramaSetting.getDistortion_k4());
        if (distortionCorrectionParam != 0) {
            Log.e(TAG, String.format(Locale.US, "setDistortionCorrectionParam error ret:0x%08X", new Object[]{Integer.valueOf(distortionCorrectionParam)}));
        }
        int rotationRatio = this.mMorphoPanoramaGP3.setRotationRatio(this.mPanoramaSetting.getRotation_ratio());
        if (rotationRatio != 0) {
            Log.e(TAG, String.format(Locale.US, "setRotationRatio error ret:0x%08X", new Object[]{Integer.valueOf(rotationRatio)}));
        }
        int sensorUseMode = this.mMorphoPanoramaGP3.setSensorUseMode(0);
        if (sensorUseMode != 0) {
            Log.e(TAG, String.format(Locale.US, "setSensorUseMode error ret:0x%08X", new Object[]{Integer.valueOf(sensorUseMode)}));
        }
        int projectionMode = this.mMorphoPanoramaGP3.setProjectionMode(0);
        if (projectionMode != 0) {
            Log.e(TAG, String.format(Locale.US, "setProjectionMode error ret:0x%08X", new Object[]{Integer.valueOf(projectionMode)}));
        }
        int motionDetectionMode = this.mMorphoPanoramaGP3.setMotionDetectionMode(0);
        if (motionDetectionMode != 0) {
            Log.e(TAG, String.format(Locale.US, "setMotionDetectionMode error ret:0x%08X", new Object[]{Integer.valueOf(motionDetectionMode)}));
        }
        Log.d(TAG, "configMorphoPanoramaGP3 end");
        return true;
    }

    public static String createDateStringForAppSeg(long j) {
        Date date = new Date(j);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
        return simpleDateFormat.format(date);
    }

    /* access modifiers changed from: private */
    public boolean createEngine() {
        if (this.mMorphoPanoramaGP3 != null) {
            Log.w(TAG, "finish prior Engine");
            finishEngine();
        }
        this.mMorphoPanoramaGP3 = new MorphoPanoramaGP3();
        if (PanoramaGP3ImageFormat.YUV420_PLANAR.equals(this.mImageFormat)) {
            this.mInitParam.input_format = this.mImageFormat;
            this.mInitParam.output_format = PanoramaGP3ImageFormat.YUV420_SEMIPLANAR;
        } else {
            this.mInitParam.input_format = this.mImageFormat;
            this.mInitParam.output_format = this.mImageFormat;
        }
        this.mInitParam.input_width = this.mPictureWidth;
        this.mInitParam.input_height = this.mPictureHeight;
        this.mInitParam.aovx = (double) this.mViewAngleH;
        this.mInitParam.aovy = (double) this.mViewAngleV;
        this.mInitParam.direction = CameraSettings.getPanoramaMoveDirection(this.mActivity);
        int displayRotation = Util.getDisplayRotation(this.mActivity);
        if (this.mOrientation == -1) {
            this.mInitParam.output_rotation = ((this.mCameraOrientation + displayRotation) + ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
        } else {
            this.mInitParam.output_rotation = (((this.mCameraOrientation + displayRotation) + this.mOrientation) + ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
        }
        String cameraLensType = CameraSettings.getCameraLensType(166);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("lensType ");
        sb.append(cameraLensType);
        Log.d(str, sb.toString());
        if (ComponentManuallyDualLens.LENS_WIDE.equals(cameraLensType)) {
            this.mInitParam.goal_angle = (double) this.mGoalAngle;
        } else if (Build.DEVICE.equals("cepheus")) {
            this.mInitParam.goal_angle = 152.18d;
        } else {
            this.mInitParam.goal_angle = ((double) this.mGoalAngle) * 0.6265d;
        }
        int i = this.mCameraOrientation;
        int i2 = i != 90 ? i != 180 ? i != 270 ? 0 : 3 : 2 : 1;
        int rotation = this.mSensorFusion.setRotation(i2);
        if (rotation != 0) {
            Log.e(TAG, String.format(Locale.US, "SensorFusion.setRotation error ret:0x%08X", new Object[]{Integer.valueOf(rotation)}));
        }
        initializeEngine(this.mMorphoPanoramaGP3, this.mInitParam);
        return true;
    }

    /* access modifiers changed from: private */
    public String createNameString(long j) {
        return DateFormat.format(getString(R.string.pano_file_name_format), j).toString();
    }

    private void doLaterReleaseIfNeed() {
        if (this.mActivity != null && this.mActivity.isActivityPaused()) {
            this.mActivity.pause();
            this.mActivity.releaseAll(true, true);
        }
    }

    /* access modifiers changed from: private */
    public void finishEngine() {
        if (this.mMorphoPanoramaGP3 != null) {
            Log.d(TAG, "finishEngine start");
            this.mMorphoPanoramaGP3.deleteNativeOutputInfo();
            int finish = this.mMorphoPanoramaGP3.finish(true);
            if (finish != 0) {
                Log.e(TAG, String.format(Locale.US, "finish error ret:0x%08X", new Object[]{Integer.valueOf(finish)}));
            }
            Log.d(TAG, "finishEngine end");
            this.mMorphoPanoramaGP3 = null;
        }
    }

    /* access modifiers changed from: private */
    public void initAttachQueue() {
        while (this.mAttachImageQueue.size() > 0) {
            CaptureImage captureImage = (CaptureImage) this.mAttachImageQueue.poll();
            if (captureImage != null) {
                captureImage.close();
            }
        }
        Log.d(TAG, "initAttachQueue");
    }

    /* access modifiers changed from: private */
    public void initPreviewLayout() {
        if (isAlive()) {
            this.mActivity.getCameraScreenNail().setPreviewSize(this.mPreviewSize.width, this.mPreviewSize.height);
            CameraScreenNail cameraScreenNail = this.mActivity.getCameraScreenNail();
            int width = cameraScreenNail.getWidth();
            int height = (int) (((float) cameraScreenNail.getHeight()) * this.mLongSideCropRatio);
            int dimensionPixelSize = this.mActivity.getResources().getDimensionPixelSize(R.dimen.pano_preview_hint_frame_height);
            ((PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).initPreviewLayout((width * dimensionPixelSize) / height, dimensionPixelSize, this.mPreviewSize.width, this.mPreviewSize.height);
        }
    }

    private boolean initializeEngine(MorphoPanoramaGP3 morphoPanoramaGP3, InitParam initParam) {
        Log.d(TAG, "initializeEngine start");
        int createNativeOutputInfo = morphoPanoramaGP3.createNativeOutputInfo();
        if (createNativeOutputInfo != 0) {
            Log.e(TAG, String.format(Locale.US, "createNativeOutputInfo error ret:0x%08X", new Object[]{Integer.valueOf(createNativeOutputInfo)}));
        }
        int initialize = morphoPanoramaGP3.initialize(initParam);
        if (initialize != 0) {
            Log.e(TAG, String.format(Locale.US, "initialize error ret:0x%08X", new Object[]{Integer.valueOf(initialize)}));
            return false;
        }
        Log.e(TAG, "initializeEngine end");
        return true;
    }

    private boolean isProcessingFinishTask() {
        return (this.mSaveOutputImageTask == null || this.mSaveOutputImageTask.getStatus() == Status.FINISHED) ? false : true;
    }

    private boolean isShootingTooShort() {
        return SystemClock.elapsedRealtime() - this.mPanoramaShootingStartTime < 600;
    }

    private boolean isZslMode() {
        return true;
    }

    private void keepScreenOnAwhile() {
        if (this.mHandler != null) {
            this.mHandler.sendEmptyMessageDelayed(17, 1000);
        }
    }

    /* access modifiers changed from: private */
    public void onCaptureOrientationDecided() {
        Log.d(TAG, "onCaptureOrientationDecided");
        ((PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).onCaptureOrientationDecided(this.mDirection, this.mAttachPosOffsetX, this.mAttachPosOffsetY);
        this.mCaptureOrientationDecided = true;
    }

    /* access modifiers changed from: private */
    public void onPreviewMoving() {
        ((PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).onPreviewMoving();
    }

    /* access modifiers changed from: private */
    public void onSaveFinish() {
        if (isAlive() && this.mCamera2Device != null) {
            enableCameraControls(true);
            if (this.mAeLockSupported) {
                this.mCamera2Device.setAELock(false);
            }
            if (this.mAwbLockSupported) {
                this.mCamera2Device.setAWBLock(false);
            }
            this.mCamera2Device.setFocusMode(this.mTargetFocusMode);
            startPreview();
            RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
            if (recordState != null) {
                recordState.onPostSavingFinish();
            }
        }
    }

    private void onStopShooting(boolean z) {
        RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
        if (recordState == null) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onStopShooting recordState is null, succeed = ");
            sb.append(z);
            Log.w(str, sb.toString());
            return;
        }
        if (z) {
            recordState.onPostSavingStart();
        } else {
            recordState.onFailed();
        }
    }

    /* access modifiers changed from: private */
    public void registerGravitySensorListener() {
        if (!this.mIsRegisterGravitySensor) {
            Log.d(TAG, "registerGravitySensorListener");
            this.mIsSensorAverage = false;
            this.mSensorCnt = 0;
            this.mGravities = new float[3];
            if (this.mSensorManager != null) {
                List sensorList = this.mSensorManager.getSensorList(9);
                if (sensorList.size() > 0) {
                    this.mSensorManager.registerListener(this, (Sensor) sensorList.get(0), 2);
                }
            }
            this.mIsRegisterGravitySensor = true;
        }
    }

    private void requestStopShoot() {
        addAttachQueue(sAttachExit);
        this.mRequestStop = true;
    }

    private void resetScreenOn() {
        this.mHandler.removeMessages(17);
        this.mHandler.removeMessages(2);
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x006c  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x0076  */
    public boolean savePanoramaFile(String str, int i, int i2) {
        int i3;
        ParcelFileDescriptor parcelFileDescriptor;
        Throwable th;
        String str2 = str;
        GalleryInfoData galleryInfoData = new GalleryInfoData();
        if (Storage.isUseDocumentMode()) {
            try {
                parcelFileDescriptor = FileCompat.getParcelFileDescriptor(str2, true);
                i3 = this.mMorphoPanoramaGP3.savePanorama360(i, i2, parcelFileDescriptor.getFileDescriptor(), this.mShutterStartTime, this.mShutterEndTime, false, galleryInfoData, false);
                if (parcelFileDescriptor != null) {
                    try {
                        $closeResource(null, parcelFileDescriptor);
                    } catch (Exception e) {
                        e = e;
                    }
                }
            } catch (Exception e2) {
                e = e2;
                i3 = -1;
                String str3 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("open file failed, filePath ");
                sb.append(str2);
                Log.e(str3, sb.toString(), e);
                if (i3 != 0) {
                }
            } catch (Throwable th2) {
                if (parcelFileDescriptor != null) {
                    $closeResource(th, parcelFileDescriptor);
                }
                throw th2;
            }
        } else {
            i3 = this.mMorphoPanoramaGP3.savePanorama360(i, i2, str2, this.mShutterStartTime, this.mShutterEndTime, false, galleryInfoData, false);
        }
        if (i3 != 0) {
            Log.d(TAG, galleryInfoData.toString());
            return true;
        }
        Log.e(TAG, String.format("savePanorama360() -> 0x%x", new Object[]{Integer.valueOf(i3)}));
        return false;
    }

    /* access modifiers changed from: private */
    public void setInitialRotationByGravity() {
        if (this.mMorphoPanoramaGP3 != null && this.mSensorCnt > 0) {
            float f = this.mGravities[0] / ((float) this.mSensorCnt);
            float f2 = this.mGravities[1] / ((float) this.mSensorCnt);
            float f3 = this.mGravities[2] / ((float) this.mSensorCnt);
            Log.d(TAG, String.format(Locale.US, "Gravity Sensor Value X=%f Y=%f Z=%f cnt=%d", new Object[]{Float.valueOf(f), Float.valueOf(f2), Float.valueOf(f3), Integer.valueOf(this.mSensorCnt)}));
            int initialRotationByGravity = this.mMorphoPanoramaGP3.setInitialRotationByGravity((double) f, (double) f2, (double) f3);
            if (initialRotationByGravity != 0) {
                Log.e(TAG, String.format(Locale.US, "MorphoPanoramaGP3.setInitialRotationByGravity error ret:0x%08X", new Object[]{Integer.valueOf(initialRotationByGravity)}));
            }
        }
    }

    /* access modifiers changed from: private */
    public void setSensorFusionValue(CaptureImage captureImage) {
        if (this.mMorphoPanoramaGP3 != null && this.mSensorFusion != null) {
            int[] iArr = new int[4];
            int sensorMatrix = this.mSensorFusion.getSensorMatrix(null, null, null, iArr);
            if (sensorMatrix != 0) {
                Log.e(TAG, String.format(Locale.US, "SensorFusion.getSensorMatrix error ret:0x%08X", new Object[]{Integer.valueOf(sensorMatrix)}));
            }
            ArrayList stockData = this.mSensorFusion.getStockData();
            SensorInfoManager sensorInfoManager = new SensorInfoManager(4);
            sensorInfoManager.g_ix = iArr[0];
            sensorInfoManager.r_ix = iArr[3];
            sensorInfoManager.a_ix = iArr[1];
            sensorInfoManager.img_ix = this.mMorphoPanoramaGP3.getAttachCount();
            sensorInfoManager.timeMillis = System.currentTimeMillis();
            sensorInfoManager.imageTimeStamp = captureImage.getTimestamp();
            sensorInfoManager.sensitivity = captureImage.getSensitivity();
            sensorInfoManager.exposureTime = captureImage.getExposureTime();
            sensorInfoManager.rollingShutterSkew = captureImage.getRollingShutterSkew();
            sensorInfoManager.sensorTimeStamp = captureImage.getSensorTimeStamp();
            sensorInfoManager.sensorData[0] = (ArrayList) ((ArrayList) stockData.get(0)).clone();
            sensorInfoManager.sensorData[3] = (ArrayList) ((ArrayList) stockData.get(3)).clone();
            sensorInfoManager.sensorData[1] = (ArrayList) ((ArrayList) stockData.get(1)).clone();
            if (sensorInfoManager.sensorData[0].isEmpty()) {
                int size = this.mSensorInfoManagerList.size();
                if (size > 0) {
                    SensorInfoManager sensorInfoManager2 = (SensorInfoManager) this.mSensorInfoManagerList.get(size - 1);
                    sensorInfoManager.g_ix = sensorInfoManager2.g_ix;
                    sensorInfoManager.sensorData[0] = sensorInfoManager2.sensorData[0];
                }
            }
            if (sensorInfoManager.sensorData[3].isEmpty()) {
                int size2 = this.mSensorInfoManagerList.size();
                if (size2 > 0) {
                    SensorInfoManager sensorInfoManager3 = (SensorInfoManager) this.mSensorInfoManagerList.get(size2 - 1);
                    sensorInfoManager.r_ix = sensorInfoManager3.r_ix;
                    sensorInfoManager.sensorData[3] = sensorInfoManager3.sensorData[3];
                }
            }
            if (sensorInfoManager.sensorData[1].isEmpty()) {
                int size3 = this.mSensorInfoManagerList.size();
                if (size3 > 0) {
                    SensorInfoManager sensorInfoManager4 = (SensorInfoManager) this.mSensorInfoManagerList.get(size3 - 1);
                    sensorInfoManager.a_ix = sensorInfoManager4.a_ix;
                    sensorInfoManager.sensorData[1] = sensorInfoManager4.sensorData[1];
                }
            }
            this.mCurrentSensorInfoManager = sensorInfoManager;
            this.mSensorInfoManagerList.add(sensorInfoManager);
            long attachCount = this.mMorphoPanoramaGP3.getAttachCount();
            int size4 = ((ArrayList) stockData.get(0)).size();
            if (size4 > 0 && attachCount > 0) {
                int gyroscopeData = this.mMorphoPanoramaGP3.setGyroscopeData((SensorData[]) ((ArrayList) stockData.get(0)).toArray(new SensorData[size4]));
                if (gyroscopeData != 0) {
                    Log.e(TAG, String.format(Locale.US, "setGyroscopeData error ret:0x%08X", new Object[]{Integer.valueOf(gyroscopeData)}));
                }
            }
            this.mSensorFusion.clearStockData();
        }
    }

    private void setupCaptureParams() {
        if (this.mCamera2Device == null) {
            Log.e(TAG, "camera device is not ready");
            return;
        }
        this.mCamera2Device.setFocusMode(this.mTargetFocusMode);
        this.mCamera2Device.setZoomRatio(1.0f);
        this.mCamera2Device.setFlashMode(0);
        String antiBanding = CameraSettings.getAntiBanding();
        this.mCamera2Device.setAntiBanding(Integer.valueOf(antiBanding).intValue());
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("antiBanding=");
        sb.append(antiBanding);
        Log.d(str, sb.toString());
        this.mCamera2Device.setEnableZsl(true);
        this.mCamera2Device.setHHT(false);
        this.mCamera2Device.setEnableOIS(false);
        this.mCamera2Device.setTimeWaterMarkEnable(false);
        this.mCamera2Device.setFaceWaterMarkEnable(false);
    }

    /* access modifiers changed from: private */
    public void stopPanoramaShooting(boolean z) {
        stopPanoramaShooting(z, false);
    }

    private void stopPanoramaShooting(boolean z, boolean z2) {
        if (!this.mIsShooting) {
            Log.w(TAG, "stopPanoramaShooting while not shooting");
            return;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("stopPanoramaShooting: saveImage=");
        sb.append(z);
        sb.append(", isRelease=");
        sb.append(z2);
        Log.v(str, sb.toString());
        requestStopShoot();
        keepScreenOnAwhile();
        this.mRoundDetector.stop();
        synchronized (this.mDeviceLock) {
            if (this.mCamera2Device != null) {
                if (z2) {
                    PanoramaProtocol panoramaProtocol = (PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
                    if (panoramaProtocol != null) {
                        Log.d(TAG, "onPause setDisplayPreviewBitmap null");
                        panoramaProtocol.setDisplayPreviewBitmap(null);
                    }
                } else {
                    this.mCamera2Device.captureAbortBurst();
                }
                this.mCamera2Device.stopPreviewCallback(z2);
            }
        }
        boolean z3 = z && this.mCanSavePanorama;
        this.mShutterEndTime = createDateStringForAppSeg(System.currentTimeMillis());
        this.mSaveOutputImageTask = new SaveOutputImageTask(z3);
        this.mSaveOutputImageTask.execute(new Void[0]);
        onStopShooting(z3);
    }

    /* access modifiers changed from: private */
    public void unregisterGravitySensorListener() {
        if (this.mIsRegisterGravitySensor) {
            Log.d(TAG, "unregisterGravitySensorListener");
            if (this.mSensorManager != null) {
                this.mSensorManager.unregisterListener(this);
            }
            this.mIsRegisterGravitySensor = false;
        }
    }

    private void updatePictureAndPreviewSize() {
        CameraSize bestPanoPictureSize = getBestPanoPictureSize(this.mCameraCapabilities.getSupportedOutputSize(256));
        this.mPreviewSize = Util.getOptimalPreviewSize(this.mModuleIndex, this.mBogusCameraId, this.mCameraCapabilities.getSupportedOutputSize(SurfaceTexture.class), (double) CameraSettings.getPreviewAspectRatio(bestPanoPictureSize.width, bestPanoPictureSize.height));
        this.mPictureSize = bestPanoPictureSize;
        this.mPictureWidth = this.mPictureSize.width;
        this.mPictureHeight = this.mPictureSize.height;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("pictureSize= ");
        sb.append(bestPanoPictureSize.width);
        sb.append("X");
        sb.append(bestPanoPictureSize.height);
        sb.append(" previewSize=");
        sb.append(this.mPreviewSize.width);
        sb.append("X");
        sb.append(this.mPreviewSize.height);
        Log.d(str, sb.toString());
        updateCameraScreenNailSize(this.mPreviewSize.width, this.mPreviewSize.height);
    }

    public void closeCamera() {
        Log.d(TAG, "closeCamera: start");
        synchronized (this.mDeviceLock) {
            setCameraState(0);
            if (this.mCamera2Device != null) {
                this.mCamera2Device.setErrorCallback(null);
                this.mCamera2Device.stopPreviewCallback(true);
                this.mCamera2Device = null;
            }
        }
        Log.d(TAG, "closeCamera: end");
    }

    public void consumePreference(@UpdateType int... iArr) {
        for (int i : iArr) {
            if (i == 1) {
                updatePictureAndPreviewSize();
            } else if (i == 24) {
                applyZoomRatio();
            } else if (i == 32) {
                setupCaptureParams();
            } else if (i != 55) {
                switch (i) {
                    case 46:
                    case 47:
                        continue;
                    default:
                        if (!DEBUG) {
                            String str = TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("no consumer for this updateType: ");
                            sb.append(i);
                            Log.w(str, sb.toString());
                            break;
                        } else {
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("no consumer for this updateType: ");
                            sb2.append(i);
                            throw new RuntimeException(sb2.toString());
                        }
                }
            } else {
                updateModuleRelated();
            }
        }
    }

    /* access modifiers changed from: protected */
    public CameraSize getBestPanoPictureSize(List<CameraSize> list) {
        PictureSizeManager.initialize(list, 0, this.mModuleIndex, this.mBogusCameraId);
        return PictureSizeManager.getBestPanoPictureSize();
    }

    /* access modifiers changed from: protected */
    public int getOperatingMode() {
        return 32776;
    }

    public boolean isDoingAction() {
        return isProcessingFinishTask();
    }

    public boolean isRecording() {
        return this.mIsShooting;
    }

    public boolean isUnInterruptable() {
        this.mUnInterruptableReason = null;
        if (this.mIsShooting) {
            this.mUnInterruptableReason = "shooting";
        }
        return this.mUnInterruptableReason != null;
    }

    /* access modifiers changed from: protected */
    public boolean isZoomEnabled() {
        return false;
    }

    /* access modifiers changed from: protected */
    public void keepScreenOn() {
        this.mHandler.removeMessages(17);
        this.mHandler.removeMessages(2);
        getWindow().addFlags(128);
    }

    public void onAccuracyChanged(Sensor sensor, int i) {
    }

    public boolean onBackPressed() {
        if (!this.mIsShooting) {
            return false;
        }
        if (!isProcessingFinishTask()) {
            playCameraSound(3);
            stopPanoramaShooting(true);
        }
        return true;
    }

    /* access modifiers changed from: protected */
    public void onCameraOpened() {
        super.onCameraOpened();
        checkDisplayOrientation();
        updatePreferenceTrampoline(UpdateConstant.PANORAMA_TYPES_INIT);
        startSession();
        this.mHandler.sendEmptyMessage(9);
        Log.v(TAG, "SetupCameraThread done");
        this.mViewAngleH = this.mCameraCapabilities.getViewAngle(false);
        this.mViewAngleV = this.mCameraCapabilities.getViewAngle(true);
        if (b.rp.equals("lavender") && this.mViewAngleH > 50.0f) {
            this.mGoalAngle = 291;
        }
        this.mCameraOrientation = this.mCameraCapabilities.getSensorOrientation();
    }

    public void onCreate(int i, int i2) {
        super.onCreate(i, i2);
        this.mHandler = new MainHandler(this.mActivity.getMainLooper());
        this.mGoalAngle = DataRepository.dataItemFeature().gr();
        this.mLongSideCropRatio = DataRepository.dataItemFeature().gs();
        this.mSmallPreviewHeight = (int) this.mActivity.getResources().getDimension(R.dimen.pano_preview_hint_frame_height);
        EffectController.getInstance().setEffect(FilterInfo.FILTER_ID_NONE);
        onCameraOpened();
        this.mSensorManager = (SensorManager) getActivity().getSystemService("sensor");
        for (Sensor sensor : this.mSensorManager.getSensorList(-1)) {
            if (sensor.getType() == 4) {
                this.mGyroscope = this.mSensorManager.getDefaultSensor(4);
            }
            if (sensor.getType() == 16) {
                this.mGyroscopeUncalibrated = this.mSensorManager.getDefaultSensor(16);
            }
            if (sensor.getType() == 1) {
                this.mAccelerometer = this.mSensorManager.getDefaultSensor(1);
            }
            if (sensor.getType() == 2) {
                this.mMagnetic = sensor;
            }
            if (sensor.getType() == 15) {
                this.mRotationVector = this.mSensorManager.getDefaultSensor(15);
            }
        }
        this.mRoundDetector = new RoundDetector();
        this.mPanoramaSetting = new PanoramaSetting(this.mActivity.getApplicationContext());
        this.mSensorFusion = new SensorFusion(true);
        this.mSensorFusionMode = 1;
        int mode = this.mSensorFusion.setMode(this.mSensorFusionMode);
        if (mode != 0) {
            Log.e(TAG, String.format(Locale.US, "SensorFusion.setMode error ret:0x%08X", new Object[]{Integer.valueOf(mode)}));
        }
        int offsetMode = this.mSensorFusion.setOffsetMode(0);
        if (offsetMode != 0) {
            Log.e(TAG, String.format(Locale.US, "SensorFusion.setOffsetMode error ret:0x%08X", new Object[]{Integer.valueOf(offsetMode)}));
        }
        int appState = this.mSensorFusion.setAppState(1);
        if (appState != 0) {
            Log.e(TAG, String.format(Locale.US, "SensorFusion.setAppState error ret:0x%08X", new Object[]{Integer.valueOf(appState)}));
        }
        this.mSensorInfoManagerList = new ArrayList<>();
    }

    public void onDestroy() {
        super.onDestroy();
        this.mHandler.sendEmptyMessage(45);
        this.mExecutor.shutdown();
    }

    public void onHostStopAndNotifyActionStop() {
        playCameraSound(3);
        stopPanoramaShooting(true, true);
        synchronized (mPreviewImageLock) {
            if (this.mPreviewImage != null) {
                this.mPreviewImage.recycle();
                this.mPreviewImage = null;
            }
            if (this.mDispPreviewImage != null) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onPause recycle bitmap ");
                sb.append(this.mDispPreviewImage);
                Log.d(str, sb.toString());
                this.mDispPreviewImage.recycle();
                this.mDispPreviewImage = null;
            }
        }
        doLaterReleaseIfNeed();
    }

    /* JADX WARNING: Removed duplicated region for block: B:21:0x003e A[RETURN] */
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (this.mPaused) {
            return true;
        }
        boolean z = false;
        if (!isFrameAvailable()) {
            return false;
        }
        if (i == 27 || i == 66) {
            if (keyEvent.getRepeatCount() == 0) {
                if (!Util.isFingerPrintKeyEvent(keyEvent)) {
                    onShutterButtonClick(40);
                } else if (CameraSettings.isFingerprintCaptureEnable()) {
                    onShutterButtonClick(30);
                }
                return true;
            }
        } else if (i != 700) {
            switch (i) {
                case 23:
                    if (keyEvent.getRepeatCount() == 0) {
                        onShutterButtonClick(50);
                        return true;
                    }
                    break;
                case 24:
                case 25:
                    z = true;
                    if (handleVolumeKeyEvent(z, true, keyEvent.getRepeatCount(), keyEvent.getDevice().isExternal())) {
                    }
                    break;
                default:
                    switch (i) {
                        case 87:
                        case 88:
                            break;
                    }
                    if (i == 24 || i == 88) {
                        z = true;
                    }
                    if (handleVolumeKeyEvent(z, true, keyEvent.getRepeatCount(), keyEvent.getDevice().isExternal())) {
                        return true;
                    }
                    break;
            }
        } else if (this.mIsShooting) {
            stopPanoramaShooting(true);
        }
        return super.onKeyDown(i, keyEvent);
    }

    public boolean onKeyUp(int i, KeyEvent keyEvent) {
        if (this.mPaused) {
            return true;
        }
        if (i != 4) {
            if (i == 27 || i == 66) {
                return true;
            }
        } else if (((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromKeyBack()) {
            return true;
        }
        return super.onKeyUp(i, keyEvent);
    }

    public void onPause() {
        super.onPause();
        unregisterGravitySensorListener();
        if (this.mSensorManager != null) {
            this.mSensorManager.unregisterListener(this.mSensorFusion);
            this.mSensorManager.unregisterListener(this.mRoundDetector);
        }
        if (this.mSensorThread != null) {
            this.mSensorThread.quit();
            this.mSensorThread = null;
        }
        this.mHandler.removeCallbacksAndMessages(null);
        closeCamera();
        resetScreenOn();
    }

    public void onPreviewLayoutChanged(Rect rect) {
        this.mActivity.onLayoutChange(rect);
    }

    public void onPreviewSessionClosed(CameraCaptureSession cameraCaptureSession) {
    }

    public void onPreviewSessionFailed(CameraCaptureSession cameraCaptureSession) {
        if (!isTextureExpired() || !retryOnceIfCameraError(this.mHandler)) {
            this.mHandler.sendEmptyMessage(51);
        } else {
            Log.d(TAG, "sessionFailed due to surfaceTexture expired, retry");
        }
    }

    public void onPreviewSessionSuccess(CameraCaptureSession cameraCaptureSession) {
        if (cameraCaptureSession != null && isAlive()) {
            setCameraState(1);
            updatePreferenceInWorkThread(UpdateConstant.PANORAMA_ON_PREVIEW_SUCCESS);
        }
    }

    public void onPreviewSizeChanged(int i, int i2) {
    }

    public void onResume() {
        super.onResume();
        keepScreenOnAwhile();
        registerGravitySensorListener();
        this.mSensorThread = new HandlerThread("SensorThread");
        this.mSensorThread.start();
        Handler handler = new Handler(this.mSensorThread.getLooper());
        this.mRoundDetector = new GyroscopeRoundDetector();
        if (this.mGyroscope != null) {
            this.mSensorManager.registerListener(this.mSensorFusion, this.mGyroscope, 0, handler);
        }
        if (this.mGyroscopeUncalibrated != null) {
            this.mSensorManager.registerListener(this.mSensorFusion, this.mGyroscopeUncalibrated, 0, handler);
        }
        if (this.mRotationVector != null) {
            this.mSensorManager.registerListener(this.mSensorFusion, this.mRotationVector, 0, handler);
        }
        if (this.mAccelerometer != null) {
            this.mSensorManager.registerListener(this.mSensorFusion, this.mAccelerometer, 0, handler);
        }
    }

    public void onReviewCancelClicked() {
    }

    public void onReviewDoneClicked() {
    }

    public void onSensorChanged(SensorEvent sensorEvent) {
        if (this.mIsSensorAverage) {
            float[] fArr = this.mGravities;
            fArr[0] = fArr[0] + sensorEvent.values[0];
            float[] fArr2 = this.mGravities;
            fArr2[1] = fArr2[1] + sensorEvent.values[1];
            float[] fArr3 = this.mGravities;
            fArr3[2] = fArr3[2] + sensorEvent.values[2];
            this.mSensorCnt++;
            return;
        }
        this.mGravities[0] = sensorEvent.values[0];
        this.mGravities[1] = sensorEvent.values[1];
        this.mGravities[2] = sensorEvent.values[2];
        this.mSensorCnt = 1;
    }

    public void onShutterButtonClick(int i) {
        if (!this.mPaused && getCameraState() != 0 && !isIgnoreTouchEvent()) {
            if (isFrontCamera() && this.mActivity.isScreenSlideOff()) {
                return;
            }
            if (isDoingAction()) {
                Log.w(TAG, "onShutterButtonClick return, isDoingAction");
                return;
            }
            setTriggerMode(i);
            if (!this.mIsShooting) {
                this.mActivity.getScreenHint().updateHint();
                if (Storage.isLowStorageAtLastPoint()) {
                    ((RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212)).onFailed();
                    return;
                }
                this.mPanoramaState = new PanoramaInit();
                initAttachQueue();
                playCameraSound(2);
                startPanoramaShooting();
            } else if (isShootingTooShort()) {
                Log.w(TAG, "panorama shooting is too short, ignore this click");
            } else {
                playCameraSound(3);
                stopPanoramaShooting(true, false);
            }
        }
    }

    public void onShutterButtonFocus(boolean z, int i) {
    }

    public boolean onShutterButtonLongClick() {
        return false;
    }

    public void onShutterButtonLongClickCancel(boolean z) {
        onShutterButtonFocus(false, 2);
    }

    public void onStop() {
        super.onStop();
    }

    @OnClickAttr
    public void onThumbnailClicked(View view) {
        if (!this.mPaused && !isProcessingFinishTask() && this.mActivity.getThumbnailUpdater().getThumbnail() != null) {
            this.mActivity.gotoGallery();
        }
    }

    public void onUserInteraction() {
        super.onUserInteraction();
        if (!this.mPaused && !this.mIsShooting) {
            keepScreenOnAwhile();
        }
    }

    /* access modifiers changed from: protected */
    public void openSettingActivity() {
        Intent intent = new Intent();
        intent.setClass(this.mActivity, CameraPreferenceActivity.class);
        intent.putExtra(CameraPreferenceActivity.FROM_WHERE, 166);
        intent.putExtra(":miui:starting_window_label", getResources().getString(R.string.pref_camera_settings_category));
        if (this.mActivity.startFromKeyguard()) {
            intent.putExtra(CameraIntentManager.EXTRA_START_WHEN_LOCKED, true);
        }
        this.mActivity.startActivity(intent);
        this.mActivity.setJumpFlag(2);
        CameraStatUtil.trackGotoSettings(this.mModuleIndex);
    }

    public void pausePreview() {
        Log.v(TAG, "pausePreview");
        this.mCamera2Device.pausePreview();
        setCameraState(0);
    }

    /* access modifiers changed from: protected */
    public void performVolumeKeyClicked(String str, int i, boolean z) {
        if (i == 0 && z) {
            onShutterButtonClick(20);
        }
    }

    public void registerProtocol() {
        super.registerProtocol();
        ModeCoordinatorImpl.getInstance().attachProtocol(161, this);
        getActivity().getImplFactory().initAdditional(getActivity(), 174, 164, 212);
    }

    public void requestRender() {
        PanoramaProtocol panoramaProtocol = (PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
        if (panoramaProtocol != null) {
            panoramaProtocol.requestRender();
        }
    }

    public void resumePreview() {
        Log.v(TAG, "resumePreview");
        this.mCamera2Device.resumePreview();
        setCameraState(1);
    }

    /* access modifiers changed from: protected */
    public void sendOpenFailMessage() {
        this.mHandler.sendEmptyMessage(10);
    }

    public void setFrameAvailable(boolean z) {
        super.setFrameAvailable(z);
        if (z && CameraSettings.isCameraSoundOpen()) {
            Camera camera = this.mActivity;
            if (camera != null) {
                camera.loadCameraSound(2);
                camera.loadCameraSound(3);
            }
        }
    }

    public void setNullDirectionFunction() {
        DirectionFunction directionFunction = new DirectionFunction(this.mPictureWidth, this.mPictureHeight, 1, 1, 1, 0);
        this.mDirectionFunction = directionFunction;
    }

    public boolean shouldReleaseLater() {
        return isRecording();
    }

    public void startPanoramaShooting() {
        if (isProcessingFinishTask()) {
            Log.e(TAG, "previous save task is on going");
            return;
        }
        RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
        recordState.onPrepare();
        Log.v(TAG, "startPanoramaShooting");
        this.mCaptureOrientationDecided = false;
        this.mDirection = this.mInitParam.direction;
        this.mTimeTaken = System.currentTimeMillis();
        this.mDeviceOrientationAtCapture = this.mOrientationCompensation;
        this.mIsShooting = true;
        this.mCanSavePanorama = false;
        this.mRequestStop = false;
        this.mShutterStartTime = createDateStringForAppSeg(System.currentTimeMillis());
        this.mShutterEndTime = "";
        synchronized (this.mDeviceLock) {
            if (this.mAeLockSupported) {
                this.mCamera2Device.setAELock(true);
            }
            if (this.mAwbLockSupported) {
                this.mCamera2Device.setAWBLock(true);
            }
            this.mLocation = LocationManager.instance().getCurrentLocation();
            this.mCamera2Device.setGpsLocation(this.mLocation);
            this.mCamera2Device.setFocusMode(this.mSnapshotFocusMode);
            this.mCamera2Device.setJpegQuality(getJpegQuality(false));
            this.mCamera2Device.setJpegThumbnailSize(getJpegThumbnailSize());
            this.mCamera2Device.setEnableZsl(true);
            this.mCamera2Device.setNeedPausePreview(false);
            this.mCamera2Device.setShotType(3);
            this.mCamera2Device.captureBurstPictures(100, new PictureCallbackWrapper() {
                public void onPictureTakenFinished(boolean z) {
                    String access$000 = Panorama3Module.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("onPictureBurstFinished success = ");
                    sb.append(z);
                    Log.d(access$000, sb.toString());
                }

                public boolean onPictureTakenImageConsumed(Image image) {
                    String access$000 = Panorama3Module.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("onPictureTaken>>image=");
                    sb.append(image);
                    Log.v(access$000, sb.toString());
                    if (Panorama3Module.this.mCamera2Device == null) {
                        image.close();
                        return true;
                    }
                    if (!Panorama3Module.this.mPanoramaState.onSaveImage(new Camera2Image(image))) {
                        Log.w(Panorama3Module.TAG, "set mPanoramaState PanoramaState");
                        Panorama3Module.this.mPanoramaState = new PanoramaState();
                    }
                    return true;
                }
            }, null);
        }
        keepScreenOnAwhile();
        recordState.onStart();
        this.mPanoramaShootingStartTime = SystemClock.elapsedRealtime();
        keepScreenOn();
        AutoLockManager.getInstance(this.mActivity).removeMessage();
    }

    public void startPreview() {
        synchronized (this.mDeviceLock) {
            if (this.mCamera2Device == null) {
                Log.e(TAG, "startPreview: camera has been closed");
                return;
            }
            checkDisplayOrientation();
            this.mCamera2Device.setDisplayOrientation(this.mCameraDisplayOrientation);
            if (this.mAeLockSupported) {
                this.mCamera2Device.setAELock(false);
            }
            if (this.mAwbLockSupported) {
                this.mCamera2Device.setAWBLock(false);
            }
            this.mCamera2Device.setFocusMode(this.mTargetFocusMode);
            this.mCamera2Device.resumePreview();
            setCameraState(1);
        }
    }

    public void startSession() {
        if (this.mCamera2Device == null) {
            Log.e(TAG, "startPreview: camera has been closed");
            return;
        }
        this.mCamera2Device.setDualCamWaterMarkEnable(false);
        this.mCamera2Device.setErrorCallback(this.mErrorCallback);
        this.mCamera2Device.setPreviewSize(this.mPreviewSize);
        this.mCamera2Device.setAlgorithmPreviewSize(this.mPreviewSize);
        this.mCamera2Device.setPictureSize(this.mPictureSize);
        this.mCamera2Device.setPictureMaxImages(3);
        this.mCamera2Device.setPictureFormat(35);
        this.mSurfaceCreatedTimestamp = this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp();
        this.mCamera2Device.startPreviewSession(new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture()), true, false, false, getOperatingMode(), false, this);
    }

    /* access modifiers changed from: protected */
    public void trackModeCustomInfo(int i) {
        CameraStatUtil.trackPictureTakenInPanorama(this.mActivity, i);
    }

    public void unRegisterProtocol() {
        super.unRegisterProtocol();
        ModeCoordinatorImpl.getInstance().detachProtocol(161, this);
        Camera camera = this.mActivity;
        if (camera != null) {
            camera.getImplFactory().detachAdditional();
        }
    }
}
