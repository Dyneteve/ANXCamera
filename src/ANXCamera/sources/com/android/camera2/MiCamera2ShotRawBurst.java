package com.android.camera2;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.TotalCaptureResult;
import android.media.Image;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
import android.view.Surface;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.arcsoft.supernight.SuperNightProcess;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ParallelCallback;
import com.xiaomi.camera.core.ParallelTaskData;
import java.util.ArrayList;
import java.util.Iterator;

public class MiCamera2ShotRawBurst extends MiCamera2Shot<ParallelTaskData> {
    private static final String TAG = "SuperNightRawBurst";
    private static final int[] sEvList = {0, 0, 0, 0, 0, 0, -12, -24};
    /* access modifiers changed from: private */
    public ParallelTaskData mCurrentParallelTaskData;
    /* access modifiers changed from: private */
    public Handler mReprocessHandler;
    private HandlerThread mReprocessThread;

    private static class ReprocessHandler extends Handler {
        public static final int MSG_DATA = 16;
        public static final int MSG_EXIT = 19;
        public static final int MSG_INIT = 18;
        public static final int MSG_META = 17;
        /* access modifiers changed from: private */
        public final MiCamera2ShotRawBurst mCamera2ShotRawBurst;
        /* access modifiers changed from: private */
        public final MiCamera2 mCameraDevice;
        private final int mMaxInputImageCount;
        private final Handler mReprocessCallbackHandler;
        private final SuperNightProcess mSuperNightProcess;
        private final ArrayList<Image> mUnprocessedData = new ArrayList<>();
        private final ArrayList<TotalCaptureResult> mUnprocessedMeta = new ArrayList<>();

        public ReprocessHandler(Looper looper, int i, MiCamera2 miCamera2, MiCamera2ShotRawBurst miCamera2ShotRawBurst, Handler handler) {
            super(looper);
            this.mMaxInputImageCount = i;
            this.mCameraDevice = miCamera2;
            this.mCamera2ShotRawBurst = miCamera2ShotRawBurst;
            this.mReprocessCallbackHandler = handler;
            this.mSuperNightProcess = new SuperNightProcess();
        }

        private CaptureCallback generateReprocessCaptureCallback() {
            return new CaptureCallback() {
                public void onCaptureBufferLost(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull Surface surface, long j) {
                    super.onCaptureBufferLost(cameraCaptureSession, captureRequest, surface, j);
                    String str = MiCamera2ShotRawBurst.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("onCaptureBufferLost:<JPEG>: frameNumber = ");
                    sb.append(j);
                    Log.e(str, sb.toString());
                    if (ModuleManager.isSuperNightScene()) {
                        ReprocessHandler.this.mCameraDevice.setAWBLock(false);
                    }
                    ReprocessHandler.this.mCameraDevice.onCapturePictureFinished(false, ReprocessHandler.this.mCamera2ShotRawBurst);
                    ReprocessHandler.this.mCameraDevice.setCaptureEnable(true);
                }

                public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                    String str = MiCamera2ShotRawBurst.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("onCaptureCompleted:<JPEG>: ");
                    sb.append(totalCaptureResult.getFrameNumber());
                    Log.d(str, sb.toString());
                    if (ModuleManager.isSuperNightScene()) {
                        ReprocessHandler.this.mCameraDevice.setAWBLock(false);
                    }
                    ReprocessHandler.this.mCameraDevice.onCapturePictureFinished(true, ReprocessHandler.this.mCamera2ShotRawBurst);
                    ReprocessHandler.this.mCameraDevice.setCaptureEnable(true);
                }

                public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
                    super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
                    String str = MiCamera2ShotRawBurst.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("onCaptureFailed:<JPEG>: reason = ");
                    sb.append(captureFailure.getReason());
                    Log.e(str, sb.toString());
                    if (ModuleManager.isSuperNightScene()) {
                        ReprocessHandler.this.mCameraDevice.setAWBLock(false);
                    }
                    ReprocessHandler.this.mCameraDevice.onCapturePictureFinished(false, ReprocessHandler.this.mCamera2ShotRawBurst);
                    ReprocessHandler.this.mCameraDevice.setCaptureEnable(true);
                }

                public void onCaptureStarted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, long j, long j2) {
                    String str = MiCamera2ShotRawBurst.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("onCaptureStarted:<JPEG>: ");
                    sb.append(j2);
                    Log.d(str, sb.toString());
                    super.onCaptureStarted(cameraCaptureSession, captureRequest, j, j2);
                }
            };
        }

        private void releaseCachedDataAndMeta() {
            this.mUnprocessedMeta.clear();
            Iterator it = this.mUnprocessedData.iterator();
            while (it.hasNext()) {
                ((Image) it.next()).close();
            }
        }

        private void sendReprocessRequest() {
            if (this.mUnprocessedData.size() == this.mMaxInputImageCount && this.mUnprocessedMeta.size() == this.mMaxInputImageCount && this.mSuperNightProcess != null) {
                Log.d(MiCamera2ShotRawBurst.TAG, "sendReprocessRequest:<SNP>: E");
                this.mSuperNightProcess.init(1793, ((Image) this.mUnprocessedData.get(0)).getWidth(), ((Image) this.mUnprocessedData.get(0)).getHeight(), ((Image) this.mUnprocessedData.get(0)).getPlanes()[0].getRowStride());
                this.mSuperNightProcess.addAllInputInfo(this.mUnprocessedData, this.mUnprocessedMeta, SuperNightProcess.ASVL_PAF_RAW12_BGGR_16B);
                this.mSuperNightProcess.unInit();
                Log.d(MiCamera2ShotRawBurst.TAG, "sendReprocessRequest:<SNP>: X");
                Image image = (Image) this.mUnprocessedData.get(0);
                TotalCaptureResult totalCaptureResult = (TotalCaptureResult) this.mUnprocessedMeta.get(3);
                try {
                    Log.d(MiCamera2ShotRawBurst.TAG, "sendReprocessRequest:<CAM>: E");
                    this.mCameraDevice.getRawImageWriter().queueInputImage(image);
                    Builder createReprocessCaptureRequest = this.mCameraDevice.getCameraDevice().createReprocessCaptureRequest(totalCaptureResult);
                    createReprocessCaptureRequest.addTarget(this.mCameraDevice.getPhotoImageReader().getSurface());
                    this.mCameraDevice.getCaptureSession().capture(createReprocessCaptureRequest.build(), generateReprocessCaptureCallback(), this.mReprocessCallbackHandler);
                    Log.d(MiCamera2ShotRawBurst.TAG, "sendReprocessRequest:<CAM>: X");
                } catch (Exception e) {
                    Log.d(MiCamera2ShotRawBurst.TAG, "sendReprocessRequest:<CAM>", e);
                } catch (Throwable th) {
                    releaseCachedDataAndMeta();
                    throw th;
                }
                releaseCachedDataAndMeta();
            }
        }

        public void handleMessage(Message message) {
            switch (message.what) {
                case 16:
                    this.mUnprocessedData.add((Image) message.obj);
                    sendReprocessRequest();
                    return;
                case 17:
                    this.mUnprocessedMeta.add((TotalCaptureResult) message.obj);
                    sendReprocessRequest();
                    return;
                case 18:
                    releaseCachedDataAndMeta();
                    return;
                case 19:
                    releaseCachedDataAndMeta();
                    Looper.myLooper().quitSafely();
                    return;
                default:
                    return;
            }
        }
    }

    public MiCamera2ShotRawBurst(MiCamera2 miCamera2) {
        super(miCamera2);
        this.mCurrentParallelTaskData = null;
        this.mReprocessThread = null;
        this.mReprocessHandler = null;
        this.mReprocessThread = new HandlerThread("SNReprocessThread");
        this.mReprocessThread.start();
        ReprocessHandler reprocessHandler = new ReprocessHandler(this.mReprocessThread.getLooper(), sEvList.length, this.mMiCamera, this, this.mCameraHandler);
        this.mReprocessHandler = reprocessHandler;
    }

    /* access modifiers changed from: protected */
    public CaptureCallback generateCaptureCallback() {
        return new CaptureCallback() {
            public void onCaptureBufferLost(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull Surface surface, long j) {
                super.onCaptureBufferLost(cameraCaptureSession, captureRequest, surface, j);
                String str = MiCamera2ShotRawBurst.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureBufferLost:<RAW>: frameNumber = ");
                sb.append(j);
                Log.e(str, sb.toString());
                if (ModuleManager.isSuperNightScene()) {
                    MiCamera2ShotRawBurst.this.mMiCamera.setAWBLock(false);
                }
                MiCamera2ShotRawBurst.this.mMiCamera.onCapturePictureFinished(false, MiCamera2ShotRawBurst.this);
                MiCamera2ShotRawBurst.this.mMiCamera.setCaptureEnable(true);
            }

            public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                String str = MiCamera2ShotRawBurst.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureCompleted:<RAW>: ");
                sb.append(totalCaptureResult.getFrameNumber());
                Log.d(str, sb.toString());
                if (MiCamera2ShotRawBurst.this.mDeparted) {
                    Log.d(MiCamera2ShotRawBurst.TAG, "onCaptureCompleted:<RAW>: ignored as has departed");
                } else {
                    MiCamera2ShotRawBurst.this.mReprocessHandler.obtainMessage(17, totalCaptureResult).sendToTarget();
                }
            }

            public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
                super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
                String str = MiCamera2ShotRawBurst.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureFailed:<RAW>: reason = ");
                sb.append(captureFailure.getReason());
                Log.e(str, sb.toString());
                if (ModuleManager.isSuperNightScene()) {
                    MiCamera2ShotRawBurst.this.mMiCamera.setAWBLock(false);
                }
                MiCamera2ShotRawBurst.this.mMiCamera.onCapturePictureFinished(false, MiCamera2ShotRawBurst.this);
                MiCamera2ShotRawBurst.this.mMiCamera.setCaptureEnable(true);
            }

            public void onCaptureStarted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, long j, long j2) {
                String str = MiCamera2ShotRawBurst.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureStarted:<RAW>: ");
                sb.append(j2);
                Log.d(str, sb.toString());
                super.onCaptureStarted(cameraCaptureSession, captureRequest, j, j2);
                if (!CameraSettings.isSupportedZslShutter() && !CameraSettings.getPlayToneOnCaptureStart()) {
                    MiCamera2ShotRawBurst.this.mMiCamera.getPictureCallback().onCaptureShutter(false);
                }
                if (0 == MiCamera2ShotRawBurst.this.mCurrentParallelTaskData.getTimestamp()) {
                    MiCamera2ShotRawBurst.this.mCurrentParallelTaskData.setTimestamp(j);
                }
            }
        };
    }

    /* access modifiers changed from: protected */
    public Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException {
        Builder createCaptureRequest = this.mMiCamera.getCameraDevice().createCaptureRequest(2);
        createCaptureRequest.addTarget(this.mMiCamera.getRawImageReader().getSurface());
        createCaptureRequest.set(CaptureRequest.CONTROL_AF_MODE, (Integer) this.mMiCamera.getPreviewRequestBuilder().get(CaptureRequest.CONTROL_AF_MODE));
        this.mMiCamera.applySettingsForCapture(createCaptureRequest, 3);
        return createCaptureRequest;
    }

    /* access modifiers changed from: protected */
    public void makeClobber() {
        super.makeClobber();
        this.mReprocessHandler.obtainMessage(19).sendToTarget();
    }

    /* access modifiers changed from: protected */
    public void notifyResultData(ParallelTaskData parallelTaskData) {
        ParallelCallback parallelCallback = this.mMiCamera.getParallelCallback();
        if (parallelCallback != null) {
            long currentTimeMillis = System.currentTimeMillis();
            this.mCurrentParallelTaskData.setPreviewThumbnailHash(this.mPreviewThumbnailHash);
            parallelCallback.onParallelProcessFinish(this.mCurrentParallelTaskData);
            long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("mJpegCallbackFinishTime = ");
            sb.append(currentTimeMillis2);
            sb.append("ms");
            Log.d(str, sb.toString());
        }
    }

    /* access modifiers changed from: protected */
    public void onImageReceived(Image image, int i) {
        PictureCallback pictureCallback = this.mMiCamera.getPictureCallback();
        if (pictureCallback == null || this.mCurrentParallelTaskData == null || this.mDeparted) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("something wrong happened when image received: callback = ");
            sb.append(pictureCallback);
            sb.append(" mCurrentParallelTaskData = ");
            sb.append(this.mCurrentParallelTaskData);
            Log.w(str, sb.toString());
            image.close();
            return;
        }
        if (i == 0) {
            Log.w(TAG, "onImageReceived:<JPEG>");
            if (0 == this.mCurrentParallelTaskData.getTimestamp()) {
                Log.w(TAG, "onImageReceived<JPEG>: image arrived first");
                this.mCurrentParallelTaskData.setTimestamp(image.getTimestamp());
            }
            byte[] firstPlane = Util.getFirstPlane(image);
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("onImageReceived:<JPEG>: size = ");
            sb2.append(firstPlane == null ? 0 : firstPlane.length);
            sb2.append(", timeStamp = ");
            sb2.append(image.getTimestamp());
            Log.d(str2, sb2.toString());
            image.close();
            this.mCurrentParallelTaskData.fillJpegData(firstPlane, i);
            if (this.mCurrentParallelTaskData.isJpegDataReady()) {
                pictureCallback.onPictureTakenFinished(true);
                notifyResultData(this.mCurrentParallelTaskData);
            }
        } else if (i == 3) {
            Log.w(TAG, "onImageReceived:<RAW>");
            this.mReprocessHandler.obtainMessage(16, image).sendToTarget();
        } else {
            StringBuilder sb3 = new StringBuilder();
            sb3.append("Unknown image result type: ");
            sb3.append(i);
            throw new IllegalArgumentException(sb3.toString());
        }
    }

    /* access modifiers changed from: protected */
    public void prepare() {
        this.mReprocessHandler.obtainMessage(18).sendToTarget();
        if (ModuleManager.isSuperNightScene()) {
            this.mMiCamera.setAWBLock(true);
        }
    }

    /* access modifiers changed from: protected */
    public void startSessionCapture() {
        try {
            this.mCurrentParallelTaskData = generateParallelTaskData(0);
            if (this.mCurrentParallelTaskData == null) {
                Log.w(TAG, "startSessionCapture: null task data");
                return;
            }
            this.mCurrentParallelTaskData.setShot2Gallery(this.mMiCamera.getCameraConfigs().isShot2Gallery());
            CaptureCallback generateCaptureCallback = generateCaptureCallback();
            Builder generateRequestBuilder = generateRequestBuilder();
            ArrayList arrayList = new ArrayList();
            for (int valueOf : sEvList) {
                generateRequestBuilder.set(CaptureRequest.CONTROL_AE_EXPOSURE_COMPENSATION, Integer.valueOf(valueOf));
                arrayList.add(generateRequestBuilder.build());
            }
            PerformanceTracker.trackPictureCapture(0);
            Log.d(TAG, "start capture burst");
            this.mMiCamera.getCaptureSession().captureBurst(arrayList, generateCaptureCallback, this.mCameraHandler);
        } catch (CameraAccessException e) {
            e.printStackTrace();
            Log.e(TAG, "Cannot capture a still picture");
            this.mMiCamera.notifyOnError(e.getReason());
        } catch (IllegalStateException e2) {
            Log.e(TAG, "Failed to capture a still picture, IllegalState", e2);
            this.mMiCamera.notifyOnError(256);
        }
    }
}
