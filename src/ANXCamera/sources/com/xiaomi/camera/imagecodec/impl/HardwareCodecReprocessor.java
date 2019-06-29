package com.xiaomi.camera.imagecodec.impl;

import android.content.Context;
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
import android.os.PowerManager;
import android.os.PowerManager.WakeLock;
import android.support.annotation.NonNull;
import android.support.annotation.WorkerThread;
import android.util.Log;
import android.view.Surface;
import com.xiaomi.camera.imagecodec.ImagePool;
import com.xiaomi.camera.imagecodec.ImagePool.ImageFormat;
import com.xiaomi.camera.imagecodec.OutputConfiguration;
import com.xiaomi.camera.imagecodec.ReprocessData;
import com.xiaomi.camera.imagecodec.Reprocessor;
import com.xiaomi.camera.imagecodec.Reprocessor.Singleton;
import com.xiaomi.media.imagecodec.ImageCodec;
import java.nio.ByteBuffer;
import java.util.LinkedList;

public class HardwareCodecReprocessor implements Reprocessor {
    private static final int MAX_IMAGE_BUFFER_SIZE = 2;
    /* access modifiers changed from: private */
    public static final String TAG = HardwareCodecReprocessor.class.getSimpleName();
    public static final Singleton<HardwareCodecReprocessor> sInstance = new Singleton<HardwareCodecReprocessor>() {
        /* access modifiers changed from: protected */
        public HardwareCodecReprocessor create() {
            return new HardwareCodecReprocessor();
        }
    };
    /* access modifiers changed from: private */
    public final Object mCodecLock;
    private Handler mCodecOperationHandler;
    private HandlerThread mCodecOperationThread;
    /* access modifiers changed from: private */
    public ReprocessData mCurrentProcessingData;
    /* access modifiers changed from: private */
    public final Object mDataLock;
    /* access modifiers changed from: private */
    public ImageCodec mHardwareImageEncoder;
    private boolean mInitialized;
    private ImageReader mJpegImageReader;
    private OutputConfiguration mJpegOutputConfiguration;
    /* access modifiers changed from: private */
    public ImageWriter mReprocessImageWriter;
    /* access modifiers changed from: private */
    public long mReprocessStartTime;
    private Handler mRequestDispatchHandler;
    private HandlerThread mRequestDispatchThread;
    private LinkedList<ReprocessData> mTaskDataList;
    private WakeLock mWakeLock;

    private class ReprocessHandler extends Handler {
        private static final int MSG_DESTROY_ENCODER = 2;
        private static final int MSG_REPROCESS_IMAGE = 1;

        ReprocessHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    Log.d(HardwareCodecReprocessor.TAG, "recv MSG_REPROCESS_IMAGE");
                    if (HardwareCodecReprocessor.this.checkConditionIsReady()) {
                        HardwareCodecReprocessor.this.reprocessImage();
                        return;
                    }
                    return;
                case 2:
                    Log.d(HardwareCodecReprocessor.TAG, "recv MSG_DESTROY_ENCODER");
                    synchronized (HardwareCodecReprocessor.this.mCodecLock) {
                        if (HardwareCodecReprocessor.this.mHardwareImageEncoder != null) {
                            String access$100 = HardwareCodecReprocessor.TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("release current codec: ");
                            sb.append(HardwareCodecReprocessor.this.mHardwareImageEncoder);
                            Log.d(access$100, sb.toString());
                            HardwareCodecReprocessor.this.mHardwareImageEncoder.release();
                            HardwareCodecReprocessor.this.mHardwareImageEncoder = null;
                        }
                    }
                    HardwareCodecReprocessor.this.releaseWakeLock();
                    return;
                default:
                    super.handleMessage(message);
                    return;
            }
        }
    }

    private HardwareCodecReprocessor() {
        this.mCodecLock = new Object();
        this.mDataLock = new Object();
        this.mTaskDataList = new LinkedList<>();
    }

    private void acquireWakeLock() {
        if (!this.mWakeLock.isHeld()) {
            Log.d(TAG, "acquireWakeLock");
            this.mWakeLock.acquire();
        }
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:10:0x001a, code lost:
        if (r1 != null) goto L_0x0024;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:11:0x001c, code lost:
        android.util.Log.w(TAG, "checkConditionIsReady: ignore null request!");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x0023, code lost:
        return false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x002a, code lost:
        return !createImageCodecIfNeed(r1);
     */
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

    @WorkerThread
    private boolean createImageCodecIfNeed(@NonNull ReprocessData reprocessData) {
        Image yuvImage = reprocessData.getYuvImage();
        InputConfiguration inputConfiguration = new InputConfiguration(yuvImage.getWidth(), yuvImage.getHeight(), yuvImage.getFormat());
        OutputConfiguration outputConfiguration = new OutputConfiguration(reprocessData.getOutputWidth(), reprocessData.getOutputHeight(), reprocessData.getOutputFormat());
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append(" YUV  INPUT: ");
        sb.append(inputConfiguration);
        Log.d(str, sb.toString());
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append(" YUV OUTPUT: ");
        sb2.append(outputConfiguration);
        Log.d(str2, sb2.toString());
        synchronized (this.mCodecLock) {
            if (256 == outputConfiguration.getFormat()) {
                initJpegImageReader(outputConfiguration.getWidth(), outputConfiguration.getHeight());
                initImageCodec(inputConfiguration.getWidth(), inputConfiguration.getHeight(), this.mJpegImageReader.getSurface());
            }
        }
        return false;
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

    @WorkerThread
    private void initImageCodec(int i, int i2, Surface surface) {
        Log.d(TAG, "initImageCodec: E");
        if (!(this.mHardwareImageEncoder == null || (this.mHardwareImageEncoder.getWidth() == i && this.mHardwareImageEncoder.getHeight() == i2))) {
            Log.d(TAG, "closing obsolete image codec");
            this.mHardwareImageEncoder.release();
            this.mHardwareImageEncoder = null;
        }
        if (this.mHardwareImageEncoder == null) {
            Log.d(TAG, "initImageCodec: create new one");
            this.mHardwareImageEncoder = ImageCodec.create(i, i2, 35, 2);
            this.mHardwareImageEncoder.setOutputSurface(surface);
            this.mReprocessImageWriter = ImageWriter.newInstance(this.mHardwareImageEncoder.getInputSurface(), 2);
        } else {
            Log.d(TAG, "initImageCodec: reuse old one");
        }
        Log.d(TAG, "initImageCodec: X");
    }

    @WorkerThread
    private void initJpegImageReader(int i, int i2) {
        Log.d(TAG, "initJpegImageReader: E");
        if (!(this.mJpegImageReader == null || (this.mJpegImageReader.getWidth() == i && this.mJpegImageReader.getHeight() == i2))) {
            Log.d(TAG, "closing obsolete reprocess reader");
            this.mJpegImageReader.close();
            this.mJpegImageReader = null;
        }
        if (this.mJpegImageReader == null) {
            Log.d(TAG, "initJpegImageReader: create new one");
            this.mJpegImageReader = ImageReader.newInstance(i, i2, 256, 2);
            this.mJpegImageReader.setOnImageAvailableListener(new OnImageAvailableListener() {
                public void onImageAvailable(ImageReader imageReader) {
                    Image acquireNextImage = imageReader.acquireNextImage();
                    byte[] access$800 = HardwareCodecReprocessor.getJpegData(acquireNextImage);
                    String access$100 = HardwareCodecReprocessor.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("onImageAvailable: received reprocessed image: ");
                    sb.append(acquireNextImage);
                    sb.append(", size: ");
                    sb.append(access$800 == null ? 0 : access$800.length);
                    Log.d(access$100, sb.toString());
                    acquireNextImage.close();
                    synchronized (HardwareCodecReprocessor.this.mDataLock) {
                        HardwareCodecReprocessor.this.mCurrentProcessingData.getResultListener().onJpegAvailable(access$800, HardwareCodecReprocessor.this.mCurrentProcessingData.getImageTag());
                        Log.d(HardwareCodecReprocessor.TAG, String.format("jpeg return for %s. cost=%d", new Object[]{HardwareCodecReprocessor.this.mCurrentProcessingData.getImageTag(), Long.valueOf(System.currentTimeMillis() - HardwareCodecReprocessor.this.mReprocessStartTime)}));
                        HardwareCodecReprocessor.this.mCurrentProcessingData = null;
                    }
                    HardwareCodecReprocessor.this.sendReprocessRequest();
                }
            }, this.mCodecOperationHandler);
        } else {
            Log.d(TAG, "initJpegImageReader: reuse old one");
        }
        Log.d(TAG, "initJpegImageReader: X");
    }

    /* access modifiers changed from: private */
    public void releaseWakeLock() {
        if (this.mWakeLock.isHeld()) {
            Log.d(TAG, "releaseWakeLock");
            this.mWakeLock.release();
        }
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:10:0x0055, code lost:
        r6.mReprocessStartTime = java.lang.System.currentTimeMillis();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:11:0x005d, code lost:
        if (r6.mCodecOperationHandler == null) goto L_0x0069;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x005f, code lost:
        r6.mCodecOperationHandler.post(new com.xiaomi.camera.imagecodec.impl.HardwareCodecReprocessor.AnonymousClass2(r6));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0069, code lost:
        android.util.Log.d(TAG, "reprocessImage: X");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x0070, code lost:
        return;
     */
    @WorkerThread
    public void reprocessImage() {
        Log.d(TAG, "reprocessImage: E");
        synchronized (this.mDataLock) {
            this.mCurrentProcessingData = (ReprocessData) this.mTaskDataList.poll();
            if (this.mCurrentProcessingData.getTotalCaptureResult() == null) {
                Log.wtf(TAG, "reprocessImage<<null metadata!");
                return;
            }
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("reprocessImage: tag=");
            sb.append(this.mCurrentProcessingData.getImageTag());
            Log.d(str, sb.toString());
            final byte jpegQuality = (byte) this.mCurrentProcessingData.getJpegQuality();
            final int outputFormat = this.mCurrentProcessingData.getOutputFormat();
            final Image yuvImage = this.mCurrentProcessingData.getYuvImage();
        }
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:17:0x0044, code lost:
        if (r5.mRequestDispatchHandler.hasMessages(1) == false) goto L_0x004e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x0046, code lost:
        android.util.Log.d(TAG, "sendReprocessRequest: BUSY");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x004e, code lost:
        android.util.Log.d(TAG, "sendReprocessRequest: send MSG_REPROCESS_IMAGE");
        r5.mRequestDispatchHandler.sendEmptyMessageDelayed(1, 0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x005c, code lost:
        return;
     */
    public void sendReprocessRequest() {
        Log.i(TAG, "=============================================================");
        if (!this.mInitialized) {
            Log.w(TAG, "sendReprocessRequest: NOT initialized!");
            return;
        }
        synchronized (this.mDataLock) {
            if (this.mTaskDataList.isEmpty()) {
                Log.d(TAG, "sendReprocessRequest: idle. Try to close device 30s later.");
                this.mRequestDispatchHandler.sendEmptyMessageDelayed(2, 30000);
            } else if (this.mRequestDispatchHandler.hasMessages(2)) {
                this.mRequestDispatchHandler.removeMessages(2);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x0019, code lost:
        monitor-enter(r2);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:12:?, code lost:
        r3.mJpegImageReader = null;
        r3.mReprocessImageWriter = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0020, code lost:
        if (r3.mHardwareImageEncoder == null) goto L_0x0029;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x0022, code lost:
        r3.mHardwareImageEncoder.release();
        r3.mHardwareImageEncoder = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:15:0x0029, code lost:
        monitor-exit(r2);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:17:0x002c, code lost:
        if (r3.mCodecOperationThread == null) goto L_0x0041;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x002e, code lost:
        r3.mCodecOperationThread.quitSafely();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:20:?, code lost:
        r3.mCodecOperationThread.join();
        r3.mCodecOperationThread = null;
        r3.mCodecOperationHandler = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x003d, code lost:
        r0 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:22:0x003e, code lost:
        r0.printStackTrace();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x0017, code lost:
        r2 = r3.mCodecLock;
     */
    public void deInit() {
        Log.d(TAG, "deInit: E");
        synchronized (this.mDataLock) {
            if (this.mInitialized) {
                this.mInitialized = false;
                this.mCurrentProcessingData = null;
            } else {
                return;
            }
        }
        if (this.mRequestDispatchThread != null) {
            this.mRequestDispatchThread.quitSafely();
            try {
                this.mRequestDispatchThread.join();
                this.mRequestDispatchThread = null;
                this.mRequestDispatchHandler = null;
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        Log.d(TAG, "deInit: X");
        Log.d(TAG, "deInit: X");
    }

    public void init(Context context) {
        Log.d(TAG, "init: E");
        synchronized (this.mDataLock) {
            if (!this.mInitialized) {
                this.mWakeLock = ((PowerManager) context.getSystemService("power")).newWakeLock(1, TAG);
                this.mWakeLock.setReferenceCounted(false);
                this.mCodecOperationThread = new HandlerThread("ImageCodecThread");
                this.mCodecOperationThread.start();
                this.mCodecOperationHandler = new Handler(this.mCodecOperationThread.getLooper());
                this.mRequestDispatchThread = new HandlerThread("RequestDispatcher");
                this.mRequestDispatchThread.start();
                this.mRequestDispatchHandler = new ReprocessHandler(this.mRequestDispatchThread.getLooper());
                this.mInitialized = true;
            }
        }
        Log.d(TAG, "init: X");
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

    public void setVirtualCameraIds(@NonNull String str, @NonNull String str2) {
        Log.d(TAG, String.format("setVTCameraIds: backId=%s frontId=%s", new Object[]{str, str2}));
    }

    public void submit(ReprocessData reprocessData) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("submit: ");
        sb.append(reprocessData.getImageTag());
        Log.d(str, sb.toString());
        if (reprocessData.getResultListener() == null) {
            Log.d(TAG, "submit: drop this request due to no callback was provided!");
        } else if (this.mInitialized) {
            acquireWakeLock();
            if (!reprocessData.isImageFromPool()) {
                Image yuvImage = reprocessData.getYuvImage();
                ImageFormat imageQueueKey = ImagePool.getInstance().toImageQueueKey(yuvImage);
                if (ImagePool.getInstance().isImageQueueFull(imageQueueKey, 2)) {
                    Log.w(TAG, "submit: wait image pool>>");
                    ImagePool.getInstance().waitIfImageQueueFull(imageQueueKey, 2, 0);
                    Log.w(TAG, "submit: wait image pool<<");
                }
                long timestamp = yuvImage.getTimestamp();
                ImagePool.getInstance().queueImage(yuvImage);
                Image image = ImagePool.getInstance().getImage(timestamp);
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("submit: image: ");
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
}
