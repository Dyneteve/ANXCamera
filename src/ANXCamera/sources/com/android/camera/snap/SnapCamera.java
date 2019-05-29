package com.android.camera.snap;

import android.annotation.TargetApi;
import android.content.ContentValues;
import android.content.Context;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraDevice.StateCallback;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.location.Location;
import android.media.CamcorderProfile;
import android.media.Image;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.media.MediaRecorder;
import android.media.MediaRecorder.OnErrorListener;
import android.media.MediaRecorder.OnInfoListener;
import android.net.Uri;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import android.os.ParcelFileDescriptor;
import android.os.Process;
import android.provider.MediaStore.Video.Media;
import android.provider.MiuiSettings.Key;
import android.provider.MiuiSettings.ScreenEffect;
import android.provider.Settings.Secure;
import android.provider.Settings.System;
import android.support.annotation.NonNull;
import android.view.OrientationEventListener;
import android.view.Surface;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.Exif;
import com.android.camera.FileCompat;
import com.android.camera.LocationManager;
import com.android.camera.PictureSizeManager;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.android.camera.module.VideoModule;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.storage.MediaProviderUtil;
import com.android.camera.storage.Storage;
import com.android.camera2.CameraCapabilities;
import com.mi.config.b;
import com.xiaomi.camera.core.PictureInfo;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

@TargetApi(26)
public class SnapCamera implements OnErrorListener, OnInfoListener {
    private static final int MSG_FOCUS_TIMEOUT = 1;
    private static final String SUFFIX = "_SNAP";
    /* access modifiers changed from: private */
    public static final String TAG = SnapCamera.class.getSimpleName();
    /* access modifiers changed from: private */
    public Handler mBackgroundHandler;
    private HandlerThread mBackgroundThread;
    private CameraCapabilities mCameraCapabilities;
    /* access modifiers changed from: private */
    public CameraDevice mCameraDevice;
    /* access modifiers changed from: private */
    public Handler mCameraHandler;
    private int mCameraId;
    private StateCallback mCameraStateCallback = new StateCallback() {
        public void onDisconnected(@NonNull CameraDevice cameraDevice) {
            Log.w(SnapCamera.TAG, "onDisconnected");
            SnapCamera.this.release();
        }

        public void onError(@NonNull CameraDevice cameraDevice, int i) {
            String access$100 = SnapCamera.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onError: ");
            sb.append(i);
            Log.e(access$100, sb.toString());
            SnapCamera.this.release();
        }

        public void onOpened(@NonNull CameraDevice cameraDevice) {
            synchronized (SnapCamera.this) {
                SnapCamera.this.mCameraDevice = cameraDevice;
            }
            if (SnapCamera.this.mStatusListener != null) {
                SnapCamera.this.mStatusListener.onCameraOpened();
            }
        }
    };
    private final CaptureCallback mCaptureCallback = new CaptureCallback() {
        private void process(CaptureResult captureResult) {
            if (SnapCamera.this.mCameraDevice != null && !SnapCamera.this.mFocused && captureResult.get(CaptureResult.CONTROL_AF_STATE) != null) {
                Integer num = (Integer) captureResult.get(CaptureResult.CONTROL_AF_STATE);
                String access$100 = SnapCamera.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("process: afState=");
                sb.append(num);
                sb.append(" aeState=");
                sb.append(captureResult.get(CaptureResult.CONTROL_AE_STATE));
                sb.append(" mFocused=");
                sb.append(SnapCamera.this.mFocused);
                Log.d(access$100, sb.toString());
                if (2 == num.intValue()) {
                    SnapCamera.this.mFocused = true;
                    SnapCamera.this.mCameraHandler.removeMessages(1);
                }
            }
        }

        public void onCaptureCompleted(CameraCaptureSession cameraCaptureSession, CaptureRequest captureRequest, TotalCaptureResult totalCaptureResult) {
            process(totalCaptureResult);
        }

        public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
            super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
            Log.e(SnapCamera.TAG, "onCaptureFailed");
        }
    };
    /* access modifiers changed from: private */
    public CameraCaptureSession mCaptureSession;
    private ContentValues mContentValues = null;
    private Context mContext;
    /* access modifiers changed from: private */
    public volatile boolean mFocused = false;
    private HandlerThread mHandlerThread;
    private int mHeight;
    private boolean mIsCamcorder = false;
    private Handler mMainHandler;
    /* access modifiers changed from: private */
    public MediaRecorder mMediaRecorder;
    /* access modifiers changed from: private */
    public int mOrientation = 0;
    private OrientationEventListener mOrientationListener;
    private final OnImageAvailableListener mPhotoAvailableListener = new OnImageAvailableListener() {
        public void onImageAvailable(ImageReader imageReader) {
            Image acquireNextImage;
            try {
                acquireNextImage = imageReader.acquireNextImage();
                if (acquireNextImage == null) {
                    if (acquireNextImage != null) {
                        acquireNextImage.close();
                    }
                    return;
                }
                byte[] firstPlane = Util.getFirstPlane(acquireNextImage);
                if (firstPlane != null) {
                    SnapCamera.this.onPictureTaken(firstPlane);
                }
                if (acquireNextImage != null) {
                    acquireNextImage.close();
                }
                return;
            } catch (Exception e) {
                Log.e(SnapCamera.TAG, e.getMessage(), e);
            } catch (Throwable th) {
                r0.addSuppressed(th);
            }
            throw th;
        }
    };
    private ImageReader mPhotoImageReader;
    private Builder mPreviewRequestBuilder;
    private Surface mPreviewSurface;
    private CamcorderProfile mProfile;
    /* access modifiers changed from: private */
    public boolean mRecording = false;
    private CameraCaptureSession.StateCallback mSessionCallback = new CameraCaptureSession.StateCallback() {
        public void onConfigureFailed(@NonNull CameraCaptureSession cameraCaptureSession) {
            Log.e(SnapCamera.TAG, "sessionCb: onConfigureFailed");
        }

        public void onConfigured(@NonNull CameraCaptureSession cameraCaptureSession) {
            synchronized (SnapCamera.this) {
                if (SnapCamera.this.mCameraDevice == null) {
                    Log.e(SnapCamera.TAG, "onConfigured: CameraDevice was already closed.");
                    cameraCaptureSession.close();
                    return;
                }
                SnapCamera.this.mCaptureSession = cameraCaptureSession;
                SnapCamera.this.startPreview();
                SnapCamera.this.capture();
            }
        }
    };
    /* access modifiers changed from: private */
    public SnapStatusListener mStatusListener;
    private SurfaceTexture mSurfaceTexture;
    /* access modifiers changed from: private */
    public Builder mVideoRequestBuilder;
    private int mWidth;

    public interface SnapStatusListener {
        void onCameraOpened();

        void onDone(Uri uri);

        void onSkipCapture();
    }

    public SnapCamera(Context context, SnapStatusListener snapStatusListener) {
        try {
            LocationManager.instance().recordLocation(CameraSettings.isRecordLocation());
            this.mStatusListener = snapStatusListener;
            this.mContext = context;
            initHandler();
            initSnapType();
            initOrientationListener();
            initCamera();
        } catch (Exception e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("init failed ");
            sb.append(e.getMessage());
            Log.e(str, sb.toString());
        }
    }

    private void applySettingsForPreview(Builder builder) {
        builder.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(1));
        builder.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(4));
        builder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
        builder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(0));
        builder.set(CaptureRequest.CONTROL_AWB_MODE, Integer.valueOf(1));
    }

    /* access modifiers changed from: private */
    public synchronized void capture() {
        if (this.mFocused) {
            try {
                Builder createCaptureRequest = this.mCameraDevice.createCaptureRequest(2);
                createCaptureRequest.addTarget(this.mPhotoImageReader.getSurface());
                int jpegRotation = Util.getJpegRotation(this.mCameraId, this.mOrientation);
                createCaptureRequest.set(CaptureRequest.JPEG_ORIENTATION, Integer.valueOf(jpegRotation));
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("orientation=");
                sb.append(jpegRotation);
                Log.d(str, sb.toString());
                Location currentLocation = LocationManager.instance().getCurrentLocation();
                if (currentLocation != null) {
                    createCaptureRequest.set(CaptureRequest.JPEG_GPS_LOCATION, currentLocation);
                }
                createCaptureRequest.set(CaptureRequest.CONTROL_AF_MODE, (Integer) this.mPreviewRequestBuilder.get(CaptureRequest.CONTROL_AF_MODE));
                this.mCaptureSession.capture(createCaptureRequest.build(), this.mCaptureCallback, this.mCameraHandler);
            } catch (CameraAccessException e) {
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("takeSnap: ");
                sb2.append(e.getMessage());
                Log.e(str2, sb2.toString(), e);
            }
        } else if (this.mStatusListener != null) {
            this.mStatusListener.onSkipCapture();
        }
    }

    private PictureInfo getPictureInfo() {
        PictureInfo pictureInfo = new PictureInfo();
        pictureInfo.setSensorType(this.mCameraId == Camera2DataContainer.getInstance().getFrontCameraId());
        return pictureInfo;
    }

    private void initCamera() {
        this.mCameraId = 0;
        if (System.getInt(this.mContext.getContentResolver(), "persist.camera.snap.auto_switch", 0) == 1) {
            this.mCameraId = CameraSettings.readPreferredCameraId();
        }
        CameraManager cameraManager = (CameraManager) this.mContext.getSystemService("camera");
        try {
            String valueOf = String.valueOf(this.mCameraId);
            cameraManager.openCamera(valueOf, this.mCameraStateCallback, this.mMainHandler);
            this.mCameraCapabilities = new CameraCapabilities(cameraManager.getCameraCharacteristics(valueOf), this.mCameraId);
            if (isCamcorder()) {
                int preferVideoQuality = CameraSettings.getPreferVideoQuality(this.mCameraId, 162);
                if (CamcorderProfile.hasProfile(this.mCameraId, preferVideoQuality)) {
                    this.mProfile = CamcorderProfile.get(this.mCameraId, preferVideoQuality);
                } else {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("invalid camcorder profile ");
                    sb.append(preferVideoQuality);
                    Log.w(str, sb.toString());
                    this.mProfile = CamcorderProfile.get(this.mCameraId, 5);
                }
            } else {
                PictureSizeManager.initialize(this.mCameraCapabilities.getSupportedOutputSize(256), 0, 163, this.mCameraId);
                CameraSize bestPictureSize = PictureSizeManager.getBestPictureSize(Util.getRatio(CameraSettings.getPictureSizeRatioString()));
                CameraSize optimalPreviewSize = Util.getOptimalPreviewSize(163, this.mCameraId, this.mCameraCapabilities.getSupportedOutputSize(SurfaceTexture.class), (double) CameraSettings.getPreviewAspectRatio(bestPictureSize.width, bestPictureSize.height));
                this.mSurfaceTexture = new SurfaceTexture(false);
                this.mSurfaceTexture.setDefaultBufferSize(optimalPreviewSize.width, optimalPreviewSize.height);
                this.mPreviewSurface = new Surface(this.mSurfaceTexture);
                preparePhotoImageReader(bestPictureSize);
                this.mWidth = bestPictureSize.width;
                this.mHeight = bestPictureSize.height;
            }
        } catch (CameraAccessException | SecurityException e) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("initCamera: ");
            sb2.append(e.getMessage());
            Log.e(str2, sb2.toString(), e);
        }
    }

    private void initHandler() {
        this.mHandlerThread = new HandlerThread("SnapCameraThread");
        this.mHandlerThread.start();
        this.mMainHandler = new Handler();
        this.mCameraHandler = new Handler(this.mHandlerThread.getLooper()) {
            public void handleMessage(Message message) {
                if (1 == message.what) {
                    SnapCamera.this.mFocused = true;
                }
            }
        };
    }

    private void initOrientationListener() {
        this.mOrientationListener = new OrientationEventListener(this.mContext, b.iF() ? 2 : 3) {
            public void onOrientationChanged(int i) {
                SnapCamera.this.mOrientation = Util.roundOrientation(i, SnapCamera.this.mOrientation);
            }
        };
        if (this.mOrientationListener.canDetectOrientation()) {
            Log.d(TAG, "Can detect orientation");
            this.mOrientationListener.enable();
            return;
        }
        Log.d(TAG, "Cannot detect orientation");
        this.mOrientationListener.disable();
    }

    private void initSnapType() {
        String string = Secure.getString(this.mContext.getContentResolver(), Key.LONG_PRESS_VOLUME_DOWN);
        if (string.equals(Key.LONG_PRESS_VOLUME_DOWN_STREET_SNAP_PICTURE)) {
            this.mIsCamcorder = false;
        } else if (string.equals(Key.LONG_PRESS_VOLUME_DOWN_STREET_SNAP_MOVIE)) {
            this.mIsCamcorder = true;
        } else {
            this.mIsCamcorder = false;
        }
    }

    public static boolean isSnapEnabled(Context context) {
        String string = DataRepository.dataItemGlobal().getString(CameraSettings.KEY_CAMERA_SNAP, null);
        if (string != null) {
            Secure.putString(context.getContentResolver(), Key.LONG_PRESS_VOLUME_DOWN, CameraSettings.getMiuiSettingsKeyForStreetSnap(string));
            DataRepository.dataItemGlobal().editor().remove(CameraSettings.KEY_CAMERA_SNAP).apply();
        }
        String string2 = Secure.getString(context.getContentResolver(), Key.LONG_PRESS_VOLUME_DOWN);
        return !Key.LONG_PRESS_VOLUME_DOWN_PAY.equals(string2) && !"none".equals(string2);
    }

    /* access modifiers changed from: private */
    public void onPictureTaken(byte[] bArr) {
        try {
            StringBuilder sb = new StringBuilder();
            sb.append(Util.createJpegName(System.currentTimeMillis()));
            sb.append(SUFFIX);
            Uri addImageForSnapCamera = Storage.addImageForSnapCamera(this.mContext, sb.toString(), System.currentTimeMillis(), LocationManager.instance().getCurrentLocation(), Exif.getOrientation(bArr), bArr, this.mWidth, this.mHeight, false, false, false, null, getPictureInfo());
            if (this.mStatusListener != null) {
                this.mStatusListener.onDone(addImageForSnapCamera);
            }
        } catch (Exception e) {
            String str = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("save picture failed ");
            sb2.append(e.getMessage());
            Log.e(str, sb2.toString());
        }
    }

    private void preparePhotoImageReader(@NonNull CameraSize cameraSize) {
        if (this.mPhotoImageReader != null) {
            this.mPhotoImageReader.close();
        }
        this.mPhotoImageReader = ImageReader.newInstance(cameraSize.getWidth(), cameraSize.getHeight(), 256, 2);
        this.mPhotoImageReader.setOnImageAvailableListener(this.mPhotoAvailableListener, this.mCameraHandler);
    }

    private void setRecorderOrientationHint() {
        int sensorOrientation = this.mCameraCapabilities.getSensorOrientation();
        if (this.mOrientation != -1) {
            sensorOrientation = this.mCameraCapabilities.getFacing() == 0 ? ((sensorOrientation - this.mOrientation) + ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT : (sensorOrientation + this.mOrientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setOrientationHint: ");
        sb.append(sensorOrientation);
        Log.d(str, sb.toString());
        this.mMediaRecorder.setOrientationHint(sensorOrientation);
    }

    private void setupMediaRecorder() {
        ParcelFileDescriptor parcelFileDescriptor;
        this.mMediaRecorder = new MediaRecorder();
        this.mMediaRecorder.setAudioSource(5);
        this.mMediaRecorder.setVideoSource(2);
        this.mProfile.duration = SnapTrigger.MAX_VIDEO_DURATION;
        this.mMediaRecorder.setProfile(this.mProfile);
        this.mMediaRecorder.setMaxDuration(this.mProfile.duration);
        Location currentLocation = LocationManager.instance().getCurrentLocation();
        if (currentLocation != null) {
            this.mMediaRecorder.setLocation((float) currentLocation.getLatitude(), (float) currentLocation.getLongitude());
        }
        String format = new SimpleDateFormat(this.mContext.getString(R.string.video_file_name_format), Locale.ENGLISH).format(Long.valueOf(System.currentTimeMillis()));
        StringBuilder sb = new StringBuilder();
        sb.append(format);
        sb.append(SUFFIX);
        sb.append(Util.convertOutputFormatToFileExt(this.mProfile.fileFormat));
        String sb2 = sb.toString();
        String convertOutputFormatToMimeType = Util.convertOutputFormatToMimeType(this.mProfile.fileFormat);
        StringBuilder sb3 = new StringBuilder();
        sb3.append(Storage.DIRECTORY);
        sb3.append('/');
        sb3.append(sb2);
        String sb4 = sb3.toString();
        this.mContentValues = new ContentValues(7);
        this.mContentValues.put("title", format);
        this.mContentValues.put("_display_name", sb2);
        this.mContentValues.put("mime_type", convertOutputFormatToMimeType);
        this.mContentValues.put("_data", sb4);
        StringBuilder sb5 = new StringBuilder();
        sb5.append(Integer.toString(this.mProfile.videoFrameWidth));
        sb5.append("x");
        sb5.append(Integer.toString(this.mProfile.videoFrameHeight));
        this.mContentValues.put("resolution", sb5.toString());
        if (currentLocation != null) {
            this.mContentValues.put("latitude", Double.valueOf(currentLocation.getLatitude()));
            this.mContentValues.put("longitude", Double.valueOf(currentLocation.getLongitude()));
        }
        long availableSpace = Storage.getAvailableSpace() - Storage.LOW_STORAGE_THRESHOLD;
        if (VideoModule.VIDEO_MAX_SINGLE_FILE_SIZE < availableSpace && DataRepository.dataItemFeature().ft()) {
            String str = TAG;
            StringBuilder sb6 = new StringBuilder();
            sb6.append("need reduce , now maxFileSize = ");
            sb6.append(availableSpace);
            Log.d(str, sb6.toString());
            availableSpace = 3670016000L;
        }
        if (availableSpace < VideoModule.VIDEO_MIN_SINGLE_FILE_SIZE) {
            availableSpace = VideoModule.VIDEO_MIN_SINGLE_FILE_SIZE;
        }
        try {
            this.mMediaRecorder.setMaxFileSize(availableSpace);
        } catch (RuntimeException e) {
        }
        setRecorderOrientationHint();
        this.mMediaRecorder.setOnErrorListener(this);
        this.mMediaRecorder.setOnInfoListener(this);
        ParcelFileDescriptor parcelFileDescriptor2 = null;
        try {
            String str2 = TAG;
            StringBuilder sb7 = new StringBuilder();
            sb7.append("save to ");
            sb7.append(sb4);
            Log.d(str2, sb7.toString());
            if (!Storage.isUseDocumentMode()) {
                this.mMediaRecorder.setOutputFile(sb4);
            } else {
                ParcelFileDescriptor parcelFileDescriptor3 = FileCompat.getParcelFileDescriptor(sb4, true);
                try {
                    this.mMediaRecorder.setOutputFile(parcelFileDescriptor3.getFileDescriptor());
                    parcelFileDescriptor2 = parcelFileDescriptor3;
                } catch (IOException e2) {
                    ParcelFileDescriptor parcelFileDescriptor4 = parcelFileDescriptor3;
                    e = e2;
                    parcelFileDescriptor = parcelFileDescriptor4;
                    try {
                        String str3 = TAG;
                        StringBuilder sb8 = new StringBuilder();
                        sb8.append("prepare failed for ");
                        sb8.append(sb4);
                        Log.e(str3, sb8.toString(), e);
                        Util.closeSilently(parcelFileDescriptor2);
                    } catch (Throwable th) {
                        th = th;
                        Util.closeSilently(parcelFileDescriptor);
                        throw th;
                    }
                } catch (Throwable th2) {
                    ParcelFileDescriptor parcelFileDescriptor5 = parcelFileDescriptor3;
                    th = th2;
                    parcelFileDescriptor = parcelFileDescriptor5;
                    Util.closeSilently(parcelFileDescriptor);
                    throw th;
                }
            }
            this.mMediaRecorder.prepare();
        } catch (IOException e3) {
            e = e3;
        }
        Util.closeSilently(parcelFileDescriptor2);
    }

    private void startBackgroundThread() {
        this.mBackgroundThread = new HandlerThread("CameraBackground");
        this.mBackgroundThread.start();
        Process.setThreadPriority(-16);
        this.mBackgroundHandler = new Handler(this.mBackgroundThread.getLooper());
    }

    /* access modifiers changed from: private */
    public synchronized void startPreview() {
        if (this.mCameraDevice == null) {
            Log.e(TAG, "startPreview: CameraDevice was already closed");
            return;
        } else if (this.mCaptureSession == null) {
            Log.e(TAG, "startPreview: null capture session");
            return;
        } else {
            try {
                this.mPreviewRequestBuilder = this.mCameraDevice.createCaptureRequest(1);
                this.mPreviewRequestBuilder.addTarget(this.mPreviewSurface);
                applySettingsForPreview(this.mPreviewRequestBuilder);
                this.mCaptureSession.setRepeatingRequest(this.mPreviewRequestBuilder.build(), this.mCaptureCallback, this.mCameraHandler);
                this.mCameraHandler.sendEmptyMessageDelayed(1, 3000);
            } catch (CameraAccessException e) {
                Log.e(TAG, e.getMessage());
            }
        }
        return;
    }

    private void stopBackgroundThread() {
        this.mBackgroundThread.quitSafely();
        try {
            this.mBackgroundThread.join();
            this.mBackgroundThread = null;
            this.mBackgroundHandler = null;
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Removed duplicated region for block: B:58:0x0104 A[Catch:{ Exception -> 0x0012 }] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void stopCamcorder() {
        ParcelFileDescriptor parcelFileDescriptor;
        ParcelFileDescriptor parcelFileDescriptor2;
        ParcelFileDescriptor parcelFileDescriptor3;
        long j;
        if (this.mMediaRecorder != null) {
            if (this.mRecording) {
                try {
                    this.mMediaRecorder.stop();
                } catch (Exception e) {
                    this.mRecording = false;
                    Log.w(TAG, "mMediaRecorder stop failed", e);
                }
            }
            this.mMediaRecorder.reset();
            this.mMediaRecorder.release();
            Uri uri = null;
            this.mMediaRecorder = null;
            stopBackgroundThread();
            if (this.mRecording) {
                String str = (String) this.mContentValues.get("_data");
                try {
                    long length = new File(str).length();
                    if (length > 0) {
                        if (!Storage.isUseDocumentMode()) {
                            j = Util.getDuration(str);
                            if (j == 0) {
                                new File(str).delete();
                            }
                            parcelFileDescriptor2 = null;
                        } else {
                            ParcelFileDescriptor parcelFileDescriptor4 = FileCompat.getParcelFileDescriptor(str, false);
                            try {
                                long duration = Util.getDuration(parcelFileDescriptor4.getFileDescriptor());
                                if (0 == duration) {
                                    FileCompat.deleteFile(str);
                                }
                                parcelFileDescriptor2 = parcelFileDescriptor4;
                                j = duration;
                            } catch (Exception e2) {
                                e = e2;
                                parcelFileDescriptor3 = parcelFileDescriptor4;
                                try {
                                    e.printStackTrace();
                                    String str2 = TAG;
                                    StringBuilder sb = new StringBuilder();
                                    sb.append("Failed to write MediaStore ");
                                    sb.append(e);
                                    Log.e(str2, sb.toString());
                                    Util.closeSilently(parcelFileDescriptor2);
                                    if (this.mStatusListener != null) {
                                    }
                                    this.mRecording = false;
                                } catch (Throwable th) {
                                    th = th;
                                }
                            } catch (Throwable th2) {
                                th = th2;
                                parcelFileDescriptor = parcelFileDescriptor4;
                                Util.closeSilently(parcelFileDescriptor);
                                throw th;
                            }
                        }
                        if (j > 0) {
                            try {
                                this.mContentValues.put("datetaken", Long.valueOf(System.currentTimeMillis()));
                                this.mContentValues.put("_size", Long.valueOf(length));
                                this.mContentValues.put("duration", Long.valueOf(j));
                                Uri insert = this.mContext.getContentResolver().insert(Media.EXTERNAL_CONTENT_URI, this.mContentValues);
                                if (insert == null) {
                                    String str3 = TAG;
                                    StringBuilder sb2 = new StringBuilder();
                                    sb2.append("insert MediaProvider failed, attempt to find uri by path, ");
                                    sb2.append(str);
                                    Log.d(str3, sb2.toString());
                                    uri = MediaProviderUtil.getContentUriFromPath(this.mContext, str);
                                } else {
                                    uri = insert;
                                }
                            } catch (Exception e3) {
                                e = e3;
                                e.printStackTrace();
                                String str22 = TAG;
                                StringBuilder sb3 = new StringBuilder();
                                sb3.append("Failed to write MediaStore ");
                                sb3.append(e);
                                Log.e(str22, sb3.toString());
                                Util.closeSilently(parcelFileDescriptor2);
                                if (this.mStatusListener != null) {
                                }
                                this.mRecording = false;
                            }
                        }
                    } else {
                        parcelFileDescriptor2 = null;
                    }
                } catch (Exception e4) {
                    e = e4;
                    parcelFileDescriptor3 = null;
                    e.printStackTrace();
                    String str222 = TAG;
                    StringBuilder sb32 = new StringBuilder();
                    sb32.append("Failed to write MediaStore ");
                    sb32.append(e);
                    Log.e(str222, sb32.toString());
                    Util.closeSilently(parcelFileDescriptor2);
                    if (this.mStatusListener != null) {
                    }
                    this.mRecording = false;
                } catch (Throwable th3) {
                    th = th3;
                    parcelFileDescriptor = null;
                    Util.closeSilently(parcelFileDescriptor);
                    throw th;
                }
                Util.closeSilently(parcelFileDescriptor2);
                if (this.mStatusListener != null) {
                    this.mStatusListener.onDone(uri);
                }
            }
            this.mRecording = false;
        }
    }

    public boolean isCamcorder() {
        return this.mIsCamcorder;
    }

    public void onError(MediaRecorder mediaRecorder, int i, int i2) {
        stopCamcorder();
    }

    public void onInfo(MediaRecorder mediaRecorder, int i, int i2) {
        if (i == 800 || i == 801) {
            Log.d(TAG, "duration or file size reach MAX");
            stopCamcorder();
        }
    }

    public synchronized void release() {
        Log.d(TAG, "release(): E");
        try {
            this.mOrientation = 0;
            LocationManager.instance().recordLocation(false);
            if (this.mOrientationListener != null) {
                this.mOrientationListener.disable();
                this.mOrientationListener = null;
            }
        } catch (Exception e) {
            Log.e(TAG, e.getMessage(), e);
        }
        try {
            stopCamcorder();
        } catch (Exception e2) {
            Log.e(TAG, e2.getMessage(), e2);
        }
        try {
            if (this.mSurfaceTexture != null) {
                this.mSurfaceTexture.release();
                this.mSurfaceTexture = null;
            }
        } catch (Exception e3) {
            Log.e(TAG, e3.getMessage(), e3);
        }
        if (this.mCameraHandler != null) {
            this.mCameraHandler.removeCallbacksAndMessages(null);
        }
        if (this.mHandlerThread != null) {
            this.mHandlerThread.quitSafely();
        }
        if (this.mCaptureSession != null) {
            this.mCaptureSession.close();
            this.mCaptureSession = null;
        }
        if (this.mCameraDevice != null) {
            this.mCameraDevice.close();
            this.mCameraDevice = null;
        }
        Log.d(TAG, "release(): X");
        return;
    }

    public synchronized void startCamcorder() {
        if (this.mCameraDevice == null) {
            Log.e(TAG, "startCamcorder: CameraDevice is opening or was already closed");
            return;
        }
        startBackgroundThread();
        setupMediaRecorder();
        List asList = Arrays.asList(new Surface[]{this.mMediaRecorder.getSurface()});
        try {
            this.mVideoRequestBuilder = this.mCameraDevice.createCaptureRequest(3);
            this.mVideoRequestBuilder.addTarget(this.mMediaRecorder.getSurface());
            this.mCameraDevice.createCaptureSession(asList, new CameraCaptureSession.StateCallback() {
                public void onConfigureFailed(@NonNull CameraCaptureSession cameraCaptureSession) {
                    Log.e(SnapCamera.TAG, "videoSessionCb::onConfigureFailed");
                    SnapCamera.this.stopCamcorder();
                }

                public void onConfigured(@NonNull CameraCaptureSession cameraCaptureSession) {
                    try {
                        cameraCaptureSession.setRepeatingRequest(SnapCamera.this.mVideoRequestBuilder.build(), new CaptureCallback() {
                            public void onCaptureStarted(CameraCaptureSession cameraCaptureSession, CaptureRequest captureRequest, long j, long j2) {
                                if (!SnapCamera.this.mRecording) {
                                    try {
                                        SnapCamera.this.mMediaRecorder.start();
                                    } catch (Exception e) {
                                        String access$100 = SnapCamera.TAG;
                                        StringBuilder sb = new StringBuilder();
                                        sb.append("failed to start media recorder: ");
                                        sb.append(e.getMessage());
                                        Log.e(access$100, sb.toString(), e);
                                        e.printStackTrace();
                                        SnapCamera.this.stopCamcorder();
                                    }
                                    SnapCamera.this.mRecording = true;
                                }
                            }
                        }, SnapCamera.this.mBackgroundHandler);
                    } catch (CameraAccessException e) {
                        String access$100 = SnapCamera.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("videoSessionCb::onConfigured: ");
                        sb.append(e.getMessage());
                        Log.e(access$100, sb.toString(), e);
                    }
                }
            }, this.mCameraHandler);
        } catch (CameraAccessException e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("failed to startCamcorder: ");
            sb.append(e.getMessage());
            Log.e(str, sb.toString(), e);
        }
        return;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:19:0x0051, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void takeSnap() {
        if (this.mCameraDevice == null) {
            Log.e(TAG, "takeSnap: CameraDevice is opening or was already closed.");
        } else if (this.mCaptureSession == null) {
            try {
                this.mCameraDevice.createCaptureSession(Arrays.asList(new Surface[]{this.mPreviewSurface, this.mPhotoImageReader.getSurface()}), this.mSessionCallback, this.mCameraHandler);
            } catch (CameraAccessException e) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("takeSnap: ");
                sb.append(e.getMessage());
                Log.e(str, sb.toString(), e);
            }
        } else {
            capture();
        }
    }
}
