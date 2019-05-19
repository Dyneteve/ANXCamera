package com.xiaomi.camera.core;

import android.media.Image;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import com.android.camera.log.Log;
import com.xiaomi.camera.core.CaptureData.CaptureDataBean;
import com.xiaomi.camera.imagecodec.JpegEncoder;
import com.xiaomi.camera.imagecodec.ReprocessData;
import com.xiaomi.camera.imagecodec.ReprocessData.OnDataAvailableListener;
import com.xiaomi.camera.processor.ClearShotProcessor;
import com.xiaomi.camera.processor.GroupShotProcessor;
import com.xiaomi.camera.processor.ProcessResultListener;
import java.io.File;
import miui.os.Build;

public class MultiFrameProcessor {
    private static final int REPROCESS_TIMEOUT_MS = 8000;
    /* access modifiers changed from: private */
    public static final String TAG = MultiFrameProcessor.class.getSimpleName();
    private final int MSG_PROCESS_DATA;
    private Handler mHandler;
    /* access modifiers changed from: private */
    public final Object mObjLock;
    private ProcessResultListener mProcessResultListener;
    /* access modifiers changed from: private */
    public long mReprocessStartTime;
    /* access modifiers changed from: private */
    public boolean mReprocessing;
    private HandlerThread mWorkThread;

    static class MultiFrameProcessorHolder {
        static MultiFrameProcessor INSTANCE = new MultiFrameProcessor();

        MultiFrameProcessorHolder() {
        }
    }

    private class WorkerHandler extends Handler {
        public WorkerHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            if (message.what != 1) {
                String access$100 = MultiFrameProcessor.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("unexpected message ");
                sb.append(message.what);
                Log.w(access$100, sb.toString());
                return;
            }
            MultiFrameProcessor.this.doProcess((CaptureData) message.obj);
        }
    }

    private MultiFrameProcessor() {
        this.mObjLock = new Object();
        this.mProcessResultListener = new ProcessResultListener() {
            public void onProcessFinished(CaptureData captureData, boolean z) {
                String access$100 = MultiFrameProcessor.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onProcessFinished: doReprocess = ");
                sb.append(z);
                Log.d(access$100, sb.toString());
                CaptureDataListener captureDataListener = captureData.getCaptureDataListener();
                if (captureDataListener == null) {
                    Log.w(MultiFrameProcessor.TAG, "onProcessFinished: null CaptureDataListener!");
                    CaptureDataBean multiFrameProcessResult = captureData.getMultiFrameProcessResult();
                    if (multiFrameProcessResult != null) {
                        multiFrameProcessResult.close();
                    }
                    for (CaptureDataBean captureDataBean : captureData.getCaptureDataBeanList()) {
                        if (captureDataBean != null) {
                            captureDataBean.close();
                        }
                    }
                    return;
                }
                if (z) {
                    MultiFrameProcessor.this.reprocessImage(captureData.getMultiFrameProcessResult(), captureData.isCapturedByFrontCamera());
                }
                Log.d(MultiFrameProcessor.TAG, "onProcessFinished: dispatch image to algorithm engine");
                captureDataListener.onCaptureDataAvailable(captureData);
            }
        };
        this.MSG_PROCESS_DATA = 1;
        this.mWorkThread = new HandlerThread("MultiFrameProcessorThread");
        this.mWorkThread.start();
        this.mHandler = new WorkerHandler(this.mWorkThread.getLooper());
    }

    /* access modifiers changed from: private */
    public void doProcess(CaptureData captureData) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("doProcess: start process task: ");
        sb.append(captureData.getCaptureTimestamp());
        Log.d(str, sb.toString());
        int algoType = captureData.getAlgoType();
        if (algoType == 2) {
            new ClearShotProcessor().doProcess(captureData, this.mProcessResultListener);
        } else if (algoType == 5) {
            new GroupShotProcessor().doProcess(captureData, this.mProcessResultListener);
        } else {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("unknown multi-frame process algorithm type: ");
            sb2.append(algoType);
            throw new RuntimeException(sb2.toString());
        }
    }

    public static MultiFrameProcessor getInstance() {
        return MultiFrameProcessorHolder.INSTANCE;
    }

    /* access modifiers changed from: private */
    public void reprocessImage(final CaptureDataBean captureDataBean, boolean z) {
        AnonymousClass2 r8 = new OnDataAvailableListener() {
            public void onError(String str, String str2) {
                synchronized (MultiFrameProcessor.this.mObjLock) {
                    String access$100 = MultiFrameProcessor.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("onError>>tag=");
                    sb.append(str2);
                    sb.append(" reason=");
                    sb.append(str);
                    Log.v(access$100, sb.toString());
                    if (!Build.IS_DEBUGGABLE) {
                        MultiFrameProcessor.this.mReprocessing = false;
                        MultiFrameProcessor.this.mObjLock.notify();
                        String access$1002 = MultiFrameProcessor.TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("onError<<cost=");
                        sb2.append(System.currentTimeMillis() - MultiFrameProcessor.this.mReprocessStartTime);
                        Log.v(access$1002, sb2.toString());
                    } else {
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("reprocessImage failed image = ");
                        sb3.append(str2);
                        sb3.append(" reason = ");
                        sb3.append(str);
                        throw new RuntimeException(sb3.toString());
                    }
                }
            }

            public void onJpegAvailable(byte[] bArr, String str) {
            }

            public void onYuvAvailable(Image image, String str) {
                synchronized (MultiFrameProcessor.this.mObjLock) {
                    String access$100 = MultiFrameProcessor.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("onYuvAvailable>>tag=");
                    sb.append(str);
                    Log.v(access$100, sb.toString());
                    MultiFrameProcessor.this.mReprocessing = false;
                    captureDataBean.setMainImage(image);
                    MultiFrameProcessor.this.mObjLock.notify();
                    String access$1002 = MultiFrameProcessor.TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("onYuvAvailable<<cost=");
                    sb2.append(System.currentTimeMillis() - MultiFrameProcessor.this.mReprocessStartTime);
                    Log.v(access$1002, sb2.toString());
                }
            }
        };
        Image mainImage = captureDataBean.getMainImage();
        StringBuilder sb = new StringBuilder();
        sb.append(captureDataBean.getResult().getTimeStamp());
        sb.append(File.separator);
        sb.append(0);
        String sb2 = sb.toString();
        int width = mainImage.getWidth();
        int height = mainImage.getHeight();
        String str = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("reprocessImage: timestamp = ");
        sb3.append(mainImage.getTimestamp());
        Log.d(str, sb3.toString());
        synchronized (this.mObjLock) {
            this.mReprocessStartTime = System.currentTimeMillis();
            this.mReprocessing = true;
            ReprocessData reprocessData = new ReprocessData(mainImage, sb2, captureDataBean.getResult(), z, width, height, 35, r8);
            reprocessData.setImageFromPool(true);
            JpegEncoder.instance().doReprocess(reprocessData);
            while (this.mReprocessing) {
                try {
                    this.mObjLock.wait(8000);
                } catch (IllegalArgumentException | InterruptedException e) {
                    this.mReprocessing = false;
                    Log.e(TAG, e.getMessage(), e);
                }
            }
        }
    }

    public void processData(CaptureData captureData) {
        if (captureData.getBurstNum() != captureData.getCaptureDataBeanList().size()) {
            StringBuilder sb = new StringBuilder();
            sb.append("Loss some capture data, burstNum is: ");
            sb.append(captureData.getBurstNum());
            sb.append("; but data bean list size is: ");
            sb.append(captureData.getCaptureDataBeanList().size());
            throw new RuntimeException(sb.toString());
        } else if (!this.mWorkThread.isAlive() || this.mHandler == null) {
            Log.w(TAG, "processData: sync mode");
            doProcess(captureData);
        } else {
            String str = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("processData: queue task: ");
            sb2.append(captureData.getCaptureTimestamp());
            Log.v(str, sb2.toString());
            this.mHandler.obtainMessage(1, captureData).sendToTarget();
        }
    }
}
