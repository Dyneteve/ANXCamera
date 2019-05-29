package com.xiaomi.camera.imagecodec;

import android.annotation.SuppressLint;
import android.content.Context;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.StateCallback;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.TotalCaptureResult;
import android.hardware.camera2.params.InputConfiguration;
import android.media.Image;
import android.media.Image.Plane;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.media.ImageWriter;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.AnyThread;
import android.support.annotation.NonNull;
import android.support.annotation.WorkerThread;
import android.util.Log;
import android.view.Surface;
import com.android.camera.data.data.config.ComponentConfigFlash;
import com.xiaomi.camera.imagecodec.ImagePool.ImageFormat;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.lang.reflect.Field;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

public class JpegEncoder {
    private static String BACK_VT_CAMERA_ID_DEFAULT = "100";
    private static String FRONT_VT_CAMERA_ID_DEFAULT = ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_ON;
    private static final int MAX_IMAGE_BUFFER_SIZE = 2;
    /* access modifiers changed from: private */
    public static final String TAG = JpegEncoder.class.getSimpleName();
    private String mBackVtCameraId;
    /* access modifiers changed from: private */
    public final Object mCameraLock;
    private CameraManager mCameraManager;
    private Handler mCameraOperationHandler;
    private HandlerThread mCameraOperationThread;
    /* access modifiers changed from: private */
    public volatile boolean mCreatingReprocessSession;
    /* access modifiers changed from: private */
    public ReprocessData mCurrentProcessingData;
    /* access modifiers changed from: private */
    public int mCurrentSessionId;
    /* access modifiers changed from: private */
    public final Object mDataLock;
    private String mFrontVtCameraId;
    private boolean mInitialized;
    private InputConfiguration mInputConfiguration;
    private ImageReader mJpegImageReader;
    private OutputConfiguration mJpegOutputConfiguration;
    /* access modifiers changed from: private */
    public boolean mNeedReopenCamera;
    private Handler mReprocessHandler;
    /* access modifiers changed from: private */
    public ImageWriter mReprocessImageWriter;
    /* access modifiers changed from: private */
    public long mReprocessStartTime;
    private HandlerThread mReprocessThread;
    /* access modifiers changed from: private */
    public LinkedList<ReprocessData> mTaskDataList;
    /* access modifiers changed from: private */
    public CameraDevice mVTCameraDevice;
    /* access modifiers changed from: private */
    public CameraCaptureSession mVTCaptureSession;
    private ImageReader mYuvImageReader;
    private OutputConfiguration mYuvOutputConfiguration;

    static class JpegEncoderHolder {
        static JpegEncoder sInstance = new JpegEncoder();

        JpegEncoderHolder() {
        }
    }

    private class ReprocessHandler extends Handler {
        private static final int MSG_CLOSE_VT_CAMERA = 2;
        private static final int MSG_REPROCESS_IMG = 1;

        ReprocessHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    Log.d(JpegEncoder.TAG, "recv MSG_REPROCESS_IMG");
                    if (JpegEncoder.this.checkConditionIsReady()) {
                        JpegEncoder.this.reprocessImage();
                        return;
                    }
                    return;
                case 2:
                    Log.d(JpegEncoder.TAG, "recv MSG_CLOSE_VT_CAMERA");
                    synchronized (JpegEncoder.this.mCameraLock) {
                        if (JpegEncoder.this.mVTCameraDevice != null) {
                            String access$100 = JpegEncoder.TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("close current VtCamera: ");
                            sb.append(JpegEncoder.this.mVTCameraDevice);
                            Log.d(access$100, sb.toString());
                            JpegEncoder.this.mVTCameraDevice.close();
                            JpegEncoder.this.mVTCameraDevice = null;
                        }
                    }
                    return;
                default:
                    super.handleMessage(message);
                    return;
            }
        }
    }

    private JpegEncoder() {
        this.mBackVtCameraId = BACK_VT_CAMERA_ID_DEFAULT;
        this.mFrontVtCameraId = FRONT_VT_CAMERA_ID_DEFAULT;
        this.mCurrentSessionId = -1;
        this.mCameraLock = new Object();
        this.mTaskDataList = new LinkedList<>();
        this.mDataLock = new Object();
        this.mYuvOutputConfiguration = new OutputConfiguration(0, 0, 35);
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:10:0x001b, code lost:
        if (r1 != null) goto L_0x0025;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:11:0x001d, code lost:
        android.util.Log.w(TAG, "checkConditionIsReady: ignore null request!");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x0024, code lost:
        return false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x002b, code lost:
        return !createCaptureSessionIfNeed(r1);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @WorkerThread
    public boolean checkConditionIsReady() {
        synchronized (this.mDataLock) {
            if (this.mCurrentProcessingData != null) {
                Log.d(TAG, "checkConditionIsReady: processor is busy!");
                return false;
            }
            ReprocessData reprocessData = (ReprocessData) this.mTaskDataList.peek();
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:27:0x009f, code lost:
        return true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:76:0x0175, code lost:
        return r4;
     */
    /* JADX WARNING: Removed duplicated region for block: B:15:0x004d  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x00a0  */
    /* JADX WARNING: Removed duplicated region for block: B:65:0x0153  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @WorkerThread
    private boolean createCaptureSessionIfNeed(@NonNull ReprocessData reprocessData) {
        boolean z;
        Image yuvImage = reprocessData.getYuvImage();
        InputConfiguration inputConfiguration = new InputConfiguration(yuvImage.getWidth(), yuvImage.getHeight(), yuvImage.getFormat());
        OutputConfiguration outputConfiguration = new OutputConfiguration(reprocessData.getOutputWidth(), reprocessData.getOutputHeight(), reprocessData.getOutputFormat());
        String str = reprocessData.isFrontCamera() ? this.mFrontVtCameraId : this.mBackVtCameraId;
        synchronized (this.mCameraLock) {
            boolean z2 = 0;
            if (this.mVTCameraDevice != null) {
                if (str.equals(this.mVTCameraDevice.getId())) {
                    z = false;
                    if (z) {
                        boolean z3 = 256 == outputConfiguration.mFormat;
                        OutputConfiguration outputConfiguration2 = z3 ? this.mJpegOutputConfiguration : this.mYuvOutputConfiguration;
                        if (this.mVTCaptureSession != null) {
                            if (!inputConfiguration.equals(this.mInputConfiguration) || !outputConfiguration.equals(outputConfiguration2)) {
                                String str2 = TAG;
                                String str3 = "recreate session. in: %dx%d->%dx%d %sOut: %dx%d->%dx%d";
                                Object[] objArr = new Object[9];
                                objArr[0] = Integer.valueOf(this.mInputConfiguration == null ? 0 : this.mInputConfiguration.getWidth());
                                objArr[1] = Integer.valueOf(this.mInputConfiguration == null ? 0 : this.mInputConfiguration.getHeight());
                                objArr[2] = Integer.valueOf(inputConfiguration.getWidth());
                                objArr[3] = Integer.valueOf(inputConfiguration.getHeight());
                                objArr[4] = z3 ? "jpeg" : "yuv";
                                objArr[5] = Integer.valueOf(outputConfiguration2 == null ? 0 : outputConfiguration2.getWidth());
                                if (outputConfiguration2 != null) {
                                    z2 = outputConfiguration2.getHeight();
                                }
                                objArr[6] = Integer.valueOf(z2);
                                objArr[7] = Integer.valueOf(outputConfiguration.getWidth());
                                objArr[8] = Integer.valueOf(outputConfiguration.getHeight());
                                Log.d(str2, String.format(str3, objArr));
                            }
                            if (z2 != 0) {
                                if (this.mCreatingReprocessSession) {
                                    Log.d(TAG, "creating reprocess session...");
                                    return true;
                                }
                                this.mCreatingReprocessSession = true;
                                this.mInputConfiguration = inputConfiguration;
                                if (z3) {
                                    this.mJpegOutputConfiguration = outputConfiguration;
                                } else {
                                    this.mYuvOutputConfiguration = outputConfiguration;
                                }
                                createReprocessSession(this.mInputConfiguration, this.mYuvOutputConfiguration, this.mJpegOutputConfiguration);
                            }
                        }
                        z2 = 1;
                        if (z2 != 0) {
                        }
                    } else if (this.mCreatingReprocessSession) {
                        Log.d(TAG, "creating reprocess session...");
                        return true;
                    } else {
                        this.mCreatingReprocessSession = true;
                        if (this.mVTCameraDevice == null) {
                            openVTCamera(str);
                        } else if (!str.equals(this.mVTCameraDevice.getId())) {
                            String str4 = TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("createCaptureSessionIfNeed: expected device changed. oldId=");
                            sb.append(this.mVTCameraDevice.getId());
                            sb.append(" newId=");
                            sb.append(str);
                            Log.d(str4, sb.toString());
                            this.mVTCameraDevice.close();
                            this.mVTCameraDevice = null;
                            this.mNeedReopenCamera = true;
                        }
                    }
                }
            }
            z = true;
            if (z) {
            }
        }
    }

    @WorkerThread
    private void createReprocessSession(@NonNull InputConfiguration inputConfiguration, @NonNull OutputConfiguration outputConfiguration, @NonNull OutputConfiguration outputConfiguration2) {
        List list;
        Log.d(TAG, String.format(Locale.ENGLISH, "createReprocessSession>>input[%dx%d] output[%dx%d]", new Object[]{Integer.valueOf(inputConfiguration.getWidth()), Integer.valueOf(inputConfiguration.getHeight()), Integer.valueOf(outputConfiguration2.getWidth()), Integer.valueOf(outputConfiguration2.getHeight())}));
        initYuvImageReader(outputConfiguration.getWidth(), outputConfiguration.getHeight());
        initJpegImageReader(outputConfiguration2.getWidth(), outputConfiguration2.getHeight());
        try {
            if (outputConfiguration.getWidth() <= 0 || this.mYuvImageReader == null) {
                list = Arrays.asList(new Surface[]{this.mJpegImageReader.getSurface()});
            } else {
                list = Arrays.asList(new Surface[]{this.mJpegImageReader.getSurface(), this.mYuvImageReader.getSurface()});
            }
            this.mVTCameraDevice.createReprocessableCaptureSession(new InputConfiguration(inputConfiguration.getWidth(), inputConfiguration.getHeight(), inputConfiguration.getFormat()), list, new StateCallback() {
                public void onConfigureFailed(@NonNull CameraCaptureSession cameraCaptureSession) {
                    Log.d(JpegEncoder.TAG, "onConfigureFailed");
                    synchronized (JpegEncoder.this.mCameraLock) {
                        JpegEncoder.this.mCreatingReprocessSession = false;
                        JpegEncoder.this.mVTCaptureSession = null;
                        JpegEncoder.this.mReprocessImageWriter = null;
                    }
                }

                public void onConfigured(@NonNull CameraCaptureSession cameraCaptureSession) {
                    Log.d(JpegEncoder.TAG, "onConfigured>>");
                    synchronized (JpegEncoder.this.mCameraLock) {
                        if (JpegEncoder.this.mVTCameraDevice == null) {
                            Log.e(JpegEncoder.TAG, "onConfigured: null camera device");
                            JpegEncoder.this.mCreatingReprocessSession = false;
                            return;
                        }
                        JpegEncoder.this.mVTCaptureSession = cameraCaptureSession;
                        JpegEncoder.this.mCurrentSessionId = JpegEncoder.this.mCurrentSessionId + 1;
                        int access$1200 = JpegEncoder.getSessionId(cameraCaptureSession);
                        Log.d(JpegEncoder.TAG, String.format("sessionId: %d %d", new Object[]{Integer.valueOf(JpegEncoder.this.mCurrentSessionId), Integer.valueOf(access$1200)}));
                        if (!(access$1200 == -1 || JpegEncoder.this.mCurrentSessionId == access$1200)) {
                            Log.w(JpegEncoder.TAG, String.format("sessionId: %d->%d", new Object[]{Integer.valueOf(JpegEncoder.this.mCurrentSessionId), Integer.valueOf(access$1200)}));
                            JpegEncoder.this.mCurrentSessionId = access$1200;
                        }
                        if (JpegEncoder.this.mReprocessImageWriter != null) {
                            JpegEncoder.this.mReprocessImageWriter.close();
                        }
                        JpegEncoder.this.mReprocessImageWriter = ImageWriter.newInstance(cameraCaptureSession.getInputSurface(), 2);
                        JpegEncoder.this.mCreatingReprocessSession = false;
                        JpegEncoder.this.sendReprocessRequest();
                        Log.d(JpegEncoder.TAG, "onConfigured<<");
                    }
                }
            }, this.mCameraOperationHandler);
        } catch (CameraAccessException e) {
            e.printStackTrace();
        }
        Log.d(TAG, "createReprocessSession<<");
    }

    /* access modifiers changed from: private */
    public static byte[] getJpegData(Image image) {
        Plane[] planes = image.getPlanes();
        if (planes.length <= 0) {
            return null;
        }
        ByteBuffer buffer = planes[0].getBuffer();
        byte[] bArr = new byte[buffer.remaining()];
        buffer.get(bArr);
        return bArr;
    }

    /* access modifiers changed from: private */
    public static int getSessionId(CameraCaptureSession cameraCaptureSession) {
        if (cameraCaptureSession != null) {
            try {
                Field declaredField = Class.forName("android.hardware.camera2.impl.CameraCaptureSessionImpl").getDeclaredField("mId");
                declaredField.setAccessible(true);
                return declaredField.getInt(cameraCaptureSession);
            } catch (ClassNotFoundException | IllegalAccessException | NoSuchFieldException e) {
                Log.w(TAG, "getSessionId: failed!", e);
            }
        }
        return -1;
    }

    @WorkerThread
    private void initJpegImageReader(int i, int i2) {
        Log.d(TAG, "initJpegImageReader>>");
        if (!(this.mJpegImageReader == null || (this.mJpegImageReader.getWidth() == i && this.mJpegImageReader.getHeight() == i2))) {
            Log.d(TAG, "closing obsolete reprocess reader");
            this.mJpegImageReader.close();
        }
        this.mJpegImageReader = ImageReader.newInstance(i, i2, 256, 2);
        this.mJpegImageReader.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                String access$100 = JpegEncoder.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onImageAvailable: received reprocessed image");
                sb.append(acquireNextImage);
                Log.d(access$100, sb.toString());
                byte[] access$1400 = JpegEncoder.getJpegData(acquireNextImage);
                acquireNextImage.close();
                synchronized (JpegEncoder.this.mDataLock) {
                    JpegEncoder.this.mCurrentProcessingData.getResultListener().onJpegAvailable(access$1400, JpegEncoder.this.mCurrentProcessingData.getImageTag());
                    Log.d(JpegEncoder.TAG, String.format("jpeg return for %s. cost=%d", new Object[]{JpegEncoder.this.mCurrentProcessingData.getImageTag(), Long.valueOf(System.currentTimeMillis() - JpegEncoder.this.mReprocessStartTime)}));
                    JpegEncoder.this.mCurrentProcessingData = null;
                }
                JpegEncoder.this.sendReprocessRequest();
            }
        }, this.mCameraOperationHandler);
        Log.d(TAG, "initJpegImageReader<<");
    }

    @WorkerThread
    private void initYuvImageReader(int i, int i2) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("initYuvImageReader>>");
        sb.append(i);
        sb.append("x");
        sb.append(i2);
        Log.d(str, sb.toString());
        if (!(this.mYuvImageReader == null || (this.mYuvImageReader.getWidth() == i && this.mYuvImageReader.getHeight() == i2))) {
            Log.d(TAG, "closing obsolete yuv reader");
            this.mYuvImageReader.close();
            this.mYuvImageReader = null;
        }
        if (i > 0 && i2 > 0) {
            this.mYuvImageReader = ImageReader.newInstance(i, i2, 35, 2);
            this.mYuvImageReader.setOnImageAvailableListener(new OnImageAvailableListener() {
                public void onImageAvailable(ImageReader imageReader) {
                    Image acquireNextImage = imageReader.acquireNextImage();
                    long timeStamp = JpegEncoder.this.mCurrentProcessingData.getTotalCaptureResult().getTimeStamp();
                    acquireNextImage.setTimestamp(timeStamp);
                    ImagePool.getInstance().queueImage(acquireNextImage);
                    Image image = ImagePool.getInstance().getImage(timeStamp);
                    String access$100 = JpegEncoder.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("receive yuv image: ");
                    sb.append(image);
                    sb.append(" | ");
                    sb.append(timeStamp);
                    Log.d(access$100, sb.toString());
                    ImagePool.getInstance().holdImage(image);
                    synchronized (JpegEncoder.this.mDataLock) {
                        JpegEncoder.this.mCurrentProcessingData.getResultListener().onYuvAvailable(image, JpegEncoder.this.mCurrentProcessingData.getImageTag());
                        Log.d(JpegEncoder.TAG, String.format("yuv return for %s. cost=%d", new Object[]{JpegEncoder.this.mCurrentProcessingData.getImageTag(), Long.valueOf(System.currentTimeMillis() - JpegEncoder.this.mReprocessStartTime)}));
                        JpegEncoder.this.mCurrentProcessingData = null;
                    }
                    JpegEncoder.this.sendReprocessRequest();
                }
            }, this.mCameraOperationHandler);
            Log.d(TAG, "initYuvImageReader<<");
        }
    }

    @AnyThread
    public static JpegEncoder instance() {
        return JpegEncoderHolder.sInstance;
    }

    @WorkerThread
    @SuppressLint({"MissingPermission"})
    private void openVTCamera(String str) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("openVTCamera: ");
        sb.append(str);
        Log.d(str2, sb.toString());
        try {
            this.mCameraManager.openCamera(str, new CameraDevice.StateCallback() {
                public void onClosed(@NonNull CameraDevice cameraDevice) {
                    synchronized (JpegEncoder.this.mCameraLock) {
                        String access$100 = JpegEncoder.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("onClosed>>id=");
                        sb.append(cameraDevice.getId());
                        Log.d(access$100, sb.toString());
                        JpegEncoder.this.mCreatingReprocessSession = false;
                        if (cameraDevice == JpegEncoder.this.mVTCameraDevice) {
                            String access$1002 = JpegEncoder.TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("onClosed: ");
                            sb2.append(JpegEncoder.this.mVTCameraDevice);
                            Log.d(access$1002, sb2.toString());
                            JpegEncoder.this.mVTCameraDevice = null;
                        }
                        if (JpegEncoder.this.mNeedReopenCamera) {
                            JpegEncoder.this.sendReprocessRequest();
                            JpegEncoder.this.mNeedReopenCamera = false;
                        }
                        Log.d(JpegEncoder.TAG, "onClosed<<");
                    }
                }

                public void onDisconnected(@NonNull CameraDevice cameraDevice) {
                    synchronized (JpegEncoder.this.mCameraLock) {
                        String access$100 = JpegEncoder.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("onDisconnected>>id=");
                        sb.append(cameraDevice.getId());
                        Log.d(access$100, sb.toString());
                        cameraDevice.close();
                        JpegEncoder.this.mCreatingReprocessSession = false;
                        if (cameraDevice == JpegEncoder.this.mVTCameraDevice) {
                            String access$1002 = JpegEncoder.TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("onDisconnected: ");
                            sb2.append(JpegEncoder.this.mVTCameraDevice);
                            Log.d(access$1002, sb2.toString());
                            JpegEncoder.this.mVTCameraDevice = null;
                        }
                        Log.d(JpegEncoder.TAG, "onDisconnected<<");
                    }
                }

                public void onError(@NonNull CameraDevice cameraDevice, int i) {
                    synchronized (JpegEncoder.this.mCameraLock) {
                        String access$100 = JpegEncoder.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("onError>>id=");
                        sb.append(cameraDevice.getId());
                        Log.e(access$100, sb.toString());
                        cameraDevice.close();
                        JpegEncoder.this.mCreatingReprocessSession = false;
                        if (cameraDevice == JpegEncoder.this.mVTCameraDevice) {
                            String access$1002 = JpegEncoder.TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("onError: ");
                            sb2.append(JpegEncoder.this.mVTCameraDevice);
                            Log.d(access$1002, sb2.toString());
                            JpegEncoder.this.mVTCameraDevice = null;
                        }
                        Log.e(JpegEncoder.TAG, "onError<<");
                    }
                }

                public void onOpened(@NonNull CameraDevice cameraDevice) {
                    synchronized (JpegEncoder.this.mCameraLock) {
                        String access$100 = JpegEncoder.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("onOpened>>id=");
                        sb.append(cameraDevice.getId());
                        Log.d(access$100, sb.toString());
                        JpegEncoder.this.mVTCameraDevice = cameraDevice;
                        String access$1002 = JpegEncoder.TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("onOpened: ");
                        sb2.append(JpegEncoder.this.mVTCameraDevice);
                        Log.d(access$1002, sb2.toString());
                        JpegEncoder.this.mCurrentSessionId = -1;
                        JpegEncoder.this.mVTCaptureSession = null;
                        JpegEncoder.this.mCreatingReprocessSession = false;
                        JpegEncoder.this.sendReprocessRequest();
                        Log.d(JpegEncoder.TAG, "onOpened<<");
                    }
                }
            }, this.mCameraOperationHandler);
        } catch (CameraAccessException e) {
            Log.e(TAG, "openVTCamera: open camera failed! No permission Exception.", e);
        }
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:10:0x005b, code lost:
        r8.mReprocessStartTime = java.lang.System.currentTimeMillis();
        r5 = r8.mCameraLock;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0063, code lost:
        monitor-enter(r5);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:13:?, code lost:
        r0 = r8.mVTCameraDevice.createReprocessCaptureRequest(r1);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x006c, code lost:
        if (256 != r3) goto L_0x0081;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:15:0x006e, code lost:
        r0.addTarget(r8.mJpegImageReader.getSurface());
        r0.set(android.hardware.camera2.CaptureRequest.JPEG_QUALITY, java.lang.Byte.valueOf(r2));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:16:0x0081, code lost:
        r0.addTarget(r8.mYuvImageReader.getSurface());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:17:0x008a, code lost:
        r1 = TAG;
        r2 = new java.lang.StringBuilder();
        r2.append("reprocessImage: ");
        r2.append(r4);
        r2.append(" | ");
        r2.append(r4.getTimestamp());
        android.util.Log.d(r1, r2.toString());
        r8.mReprocessImageWriter.queueInputImage(r4);
        com.xiaomi.camera.imagecodec.ImagePool.getInstance().releaseImage(r4);
        r8.mVTCaptureSession.capture(r0.build(), new com.xiaomi.camera.imagecodec.JpegEncoder.AnonymousClass1(r8), r8.mCameraOperationHandler);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x00cb, code lost:
        r0 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:?, code lost:
        r0.printStackTrace();
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @WorkerThread
    public void reprocessImage() {
        Object obj;
        Log.d(TAG, "reprocessImage>>");
        synchronized (this.mDataLock) {
            this.mCurrentProcessingData = (ReprocessData) this.mTaskDataList.poll();
            TotalCaptureResult totalCaptureResult = ICustomCaptureResult.toTotalCaptureResult(this.mCurrentProcessingData.getTotalCaptureResult(), this.mCurrentSessionId);
            if (totalCaptureResult == null) {
                Log.wtf(TAG, "reprocessImage<<null metadata!");
                return;
            }
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("reprocessImage: tag=");
            sb.append(this.mCurrentProcessingData.getImageTag());
            Log.d(str, sb.toString());
            byte jpegQuality = (byte) this.mCurrentProcessingData.getJpegQuality();
            int outputFormat = this.mCurrentProcessingData.getOutputFormat();
            Image yuvImage = this.mCurrentProcessingData.getYuvImage();
        }
        Log.d(TAG, "reprocessImage<<");
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0024, code lost:
        r1 = r5.mDataLock;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x0026, code lost:
        monitor-enter(r1);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:17:0x002e, code lost:
        if (r5.mTaskDataList.isEmpty() == false) goto L_0x0040;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x0030, code lost:
        android.util.Log.d(TAG, "sendReprocessRequest: idle. Try to close device 30s later.");
        r5.mReprocessHandler.sendEmptyMessageDelayed(2, 30000);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x003e, code lost:
        monitor-exit(r1);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x003f, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:22:0x0046, code lost:
        if (r5.mReprocessHandler.hasMessages(2) == false) goto L_0x004d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x0048, code lost:
        r5.mReprocessHandler.removeMessages(2);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:24:0x004d, code lost:
        monitor-exit(r1);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:26:0x0055, code lost:
        if (r5.mReprocessHandler.hasMessages(1) == false) goto L_0x005f;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:27:0x0057, code lost:
        android.util.Log.d(TAG, "sendReprocessRequest: busy");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:28:0x005f, code lost:
        android.util.Log.d(TAG, "sendReprocessRequest: send MSG_REPROCESS_IMG");
        r5.mReprocessHandler.sendEmptyMessageDelayed(1, 0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:29:0x006d, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @AnyThread
    public void sendReprocessRequest() {
        Log.i(TAG, "=============================================================");
        if (!this.mInitialized) {
            Log.w(TAG, "sendReprocessRequest: NOT initialized!");
            return;
        }
        synchronized (this.mCameraLock) {
            if (this.mCreatingReprocessSession) {
                Log.d(TAG, "sendReprocessRequest: creating session...");
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x001b, code lost:
        monitor-enter(r2);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x001e, code lost:
        if (r3.mVTCaptureSession == null) goto L_0x002d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x0020, code lost:
        r3.mVTCaptureSession.close();
        r3.mVTCaptureSession = null;
        r3.mJpegImageReader = null;
        r3.mYuvImageReader = null;
        r3.mReprocessImageWriter = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:16:0x002f, code lost:
        if (r3.mVTCameraDevice == null) goto L_0x0038;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:17:0x0031, code lost:
        r3.mVTCameraDevice.close();
        r3.mVTCameraDevice = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x0038, code lost:
        monitor-exit(r2);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x003b, code lost:
        if (r3.mCameraOperationThread == null) goto L_0x0050;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x003d, code lost:
        r3.mCameraOperationThread.quitSafely();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:?, code lost:
        r3.mCameraOperationThread.join();
        r3.mCameraOperationThread = null;
        r3.mCameraOperationHandler = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:24:0x004c, code lost:
        r0 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:25:0x004d, code lost:
        r0.printStackTrace();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x0019, code lost:
        r2 = r3.mCameraLock;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @AnyThread
    public void deInit() {
        Log.d(TAG, "deInit>>");
        synchronized (this.mDataLock) {
            if (this.mInitialized) {
                this.mInitialized = false;
                this.mCameraManager = null;
                this.mCurrentProcessingData = null;
            } else {
                return;
            }
        }
        if (this.mReprocessThread != null) {
            this.mReprocessThread.quitSafely();
            try {
                this.mReprocessThread.join();
                this.mReprocessThread = null;
                this.mReprocessHandler = null;
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        Log.d(TAG, "deInit<<");
        Log.d(TAG, "deInit<<");
    }

    @AnyThread
    public void doReprocess(ReprocessData reprocessData) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("doReprocess: ");
        sb.append(reprocessData.getImageTag());
        Log.d(str, sb.toString());
        if (reprocessData.getResultListener() == null) {
            Log.d(TAG, "doReprocess: drop this request due to no callback was provided!");
        } else if (this.mInitialized) {
            if (!reprocessData.isImageFromPool()) {
                Image yuvImage = reprocessData.getYuvImage();
                ImageFormat imageQueueKey = ImagePool.getInstance().toImageQueueKey(yuvImage);
                if (ImagePool.getInstance().isImageQueueFull(imageQueueKey, 2)) {
                    Log.w(TAG, "doReprocess: wait image pool>>");
                    ImagePool.getInstance().waitIfImageQueueFull(imageQueueKey, 2, 0);
                    Log.w(TAG, "doReprocess: wait image pool<<");
                }
                long timestamp = yuvImage.getTimestamp();
                ImagePool.getInstance().queueImage(yuvImage);
                Image image = ImagePool.getInstance().getImage(timestamp);
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("doReprocess: image: ");
                sb2.append(image);
                sb2.append(" | ");
                sb2.append(timestamp);
                Log.d(str2, sb2.toString());
                reprocessData.setYuvImage(image);
                ImagePool.getInstance().holdImage(image);
            }
            synchronized (this.mDataLock) {
                this.mTaskDataList.add(reprocessData);
            }
            sendReprocessRequest();
        } else {
            throw new RuntimeException("NOT initialized. Call init() first!");
        }
    }

    @AnyThread
    public void init(Context context) {
        Log.d(TAG, "init>>");
        synchronized (this.mDataLock) {
            if (!this.mInitialized) {
                this.mCameraManager = (CameraManager) context.getSystemService("camera");
                this.mCameraOperationThread = new HandlerThread("CameraOperationThread");
                this.mCameraOperationThread.start();
                this.mCameraOperationHandler = new Handler(this.mCameraOperationThread.getLooper());
                this.mReprocessThread = new HandlerThread("JpegEncoderThread");
                this.mReprocessThread.start();
                this.mReprocessHandler = new ReprocessHandler(this.mReprocessThread.getLooper());
                this.mInitialized = true;
            }
        }
        Log.d(TAG, "init<<");
    }

    public void setJpegOutputSize(int i, int i2) {
        if (this.mJpegOutputConfiguration == null) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("setJpegOutputSize: ");
            sb.append(i);
            sb.append("x");
            sb.append(i2);
            Log.d(str, sb.toString());
            this.mJpegOutputConfiguration = new OutputConfiguration(i, i2, 256);
        }
    }

    @AnyThread
    public void setVTCameraIds(@NonNull String str, @NonNull String str2) {
        Log.d(TAG, String.format("setVTCameraIds: backId=%s frontId=%s", new Object[]{str, str2}));
        this.mBackVtCameraId = str;
        this.mFrontVtCameraId = str2;
    }
}
