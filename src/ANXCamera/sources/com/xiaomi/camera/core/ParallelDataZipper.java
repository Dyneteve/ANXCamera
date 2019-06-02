package com.xiaomi.camera.core;

import android.annotation.SuppressLint;
import android.media.Image;
import android.os.Handler;
import android.os.HandlerThread;
import android.support.annotation.NonNull;
import android.util.Log;
import android.util.LongSparseArray;
import com.xiaomi.camera.core.CaptureData.CaptureDataBean;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import miui.os.Build;

public class ParallelDataZipper {
    /* access modifiers changed from: private */
    public static final String TAG = ParallelDataZipper.class.getSimpleName();
    /* access modifiers changed from: private */
    @SuppressLint({"UseSparseArrays"})
    public final Map<Long, CaptureData> mCaptureDataArray;
    /* access modifiers changed from: private */
    public LongSparseArray<CaptureDataBean> mCaptureDataBeanArray;
    private Handler mHandler;
    private HandlerThread mWorkThread;

    public interface DataListener {
        void onParallelDataAbandoned(CaptureData captureData);

        void onParallelDataAvailable(CaptureData captureData);
    }

    static class InstanceHolder {
        static ParallelDataZipper INSTANCE = new ParallelDataZipper();

        InstanceHolder() {
        }
    }

    private ParallelDataZipper() {
        this.mCaptureDataBeanArray = new LongSparseArray<>(4);
        this.mCaptureDataArray = new HashMap(4);
        this.mWorkThread = new HandlerThread("ParallelDataZipperThread");
        this.mWorkThread.start();
        this.mHandler = new Handler(this.mWorkThread.getLooper());
    }

    private long getFirstFrameTimestamp(long j) {
        if (this.mCaptureDataArray.containsKey(Long.valueOf(j))) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("getFirstFrameTimestamp: return current timestamp: ");
            sb.append(j);
            Log.d(str, sb.toString());
            return j;
        }
        int i = 0;
        Long[] lArr = (Long[]) this.mCaptureDataArray.keySet().toArray(new Long[0]);
        if (!(lArr == null || lArr.length == 0)) {
            Arrays.sort(lArr);
            if (lArr.length == 1) {
                return lArr[0].longValue();
            }
            while (i <= lArr.length - 2) {
                if (j > lArr[i].longValue() && j < lArr[i + 1].longValue()) {
                    return lArr[i].longValue();
                }
                i++;
            }
            if (j > lArr[lArr.length - 1].longValue()) {
                return lArr[lArr.length - 1].longValue();
            }
        }
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("getFirstFrameTimestamp: return an error result with timestamp: ");
        sb2.append(j);
        Log.e(str2, sb2.toString());
        return 0;
    }

    public static ParallelDataZipper getInstance() {
        return InstanceHolder.INSTANCE;
    }

    /* access modifiers changed from: private */
    public int getStreamNumberByTimestamp(long j) {
        CaptureData captureData = (CaptureData) this.mCaptureDataArray.get(Long.valueOf(getFirstFrameTimestamp(j)));
        if (captureData != null) {
            return captureData.getStreamNum();
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("getStreamNumberByTimestamp: returned an error result with timestamp: ");
        sb.append(j);
        Log.e(str, sb.toString());
        return 0;
    }

    /* access modifiers changed from: private */
    public void tryToCallback(CaptureDataBean captureDataBean) {
        Integer valueOf = Integer.valueOf(captureDataBean.getResult().getSequenceId());
        long timeStamp = captureDataBean.getResult().getTimeStamp();
        long firstFrameTimestamp = getFirstFrameTimestamp(timeStamp);
        CaptureData captureData = (CaptureData) this.mCaptureDataArray.get(Long.valueOf(firstFrameTimestamp));
        if (captureData != null) {
            captureData.putCaptureDataBean(captureDataBean);
            if (captureData.isDataReady()) {
                DataListener dataListener = captureData.getDataListener();
                if (dataListener != null) {
                    if (!captureData.isAbandoned()) {
                        dataListener.onParallelDataAvailable(captureData);
                    } else {
                        dataListener.onParallelDataAbandoned(captureData);
                    }
                }
                this.mCaptureDataArray.remove(Long.valueOf(timeStamp));
                return;
            }
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("No task found with sequenceId: ");
        sb.append(valueOf);
        sb.append(" timestamp: ");
        sb.append(timeStamp);
        sb.append("|");
        sb.append(firstFrameTimestamp);
        String sb2 = sb.toString();
        Log.e(TAG, sb2, new RuntimeException(sb2));
        captureDataBean.close();
        if (Build.IS_DEBUGGABLE) {
            throw new RuntimeException(sb2);
        }
    }

    public synchronized void join(final Image image, final int i) {
        if (!this.mWorkThread.isAlive() || this.mHandler == null) {
            throw new RuntimeException("Thread already die!");
        }
        this.mHandler.post(new Runnable() {
            public void run() {
                long timestamp = image.getTimestamp();
                CaptureDataBean captureDataBean = (CaptureDataBean) ParallelDataZipper.this.mCaptureDataBeanArray.get(timestamp);
                if (captureDataBean == null) {
                    CaptureDataBean captureDataBean2 = new CaptureDataBean(ParallelDataZipper.this.getStreamNumberByTimestamp(timestamp));
                    ParallelDataZipper.this.mCaptureDataBeanArray.append(timestamp, captureDataBean2);
                    captureDataBean = captureDataBean2;
                }
                String access$100 = ParallelDataZipper.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("setImage: timestamp=");
                sb.append(timestamp);
                sb.append(" streamNum=");
                sb.append(captureDataBean.getStreamNum());
                Log.d(access$100, sb.toString());
                captureDataBean.setImage(image, i);
                if (captureDataBean.isDataReady()) {
                    ParallelDataZipper.this.mCaptureDataBeanArray.remove(timestamp);
                    ParallelDataZipper.this.tryToCallback(captureDataBean);
                }
            }
        });
    }

    public synchronized void join(@NonNull final ICustomCaptureResult iCustomCaptureResult, final boolean z) {
        if (!this.mWorkThread.isAlive() || this.mHandler == null) {
            throw new RuntimeException("Thread already die!");
        }
        this.mHandler.post(new Runnable() {
            public void run() {
                long timeStamp = iCustomCaptureResult.getTimeStamp();
                int sequenceId = iCustomCaptureResult.getSequenceId();
                int access$300 = ParallelDataZipper.this.getStreamNumberByTimestamp(timeStamp);
                CaptureDataBean captureDataBean = (CaptureDataBean) ParallelDataZipper.this.mCaptureDataBeanArray.get(timeStamp);
                if (captureDataBean == null) {
                    captureDataBean = new CaptureDataBean(access$300);
                    ParallelDataZipper.this.mCaptureDataBeanArray.append(timeStamp, captureDataBean);
                }
                if (!(captureDataBean.getStreamNum() == access$300 || access$300 == 0)) {
                    String access$100 = ParallelDataZipper.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("setResult: update stream number with :");
                    sb.append(access$300);
                    Log.d(access$100, sb.toString());
                    captureDataBean.setStreamNum(access$300);
                }
                captureDataBean.setCaptureResult(iCustomCaptureResult, z);
                String access$1002 = ParallelDataZipper.TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("setResult: timestamp=");
                sb2.append(timeStamp);
                sb2.append(" sequenceId=");
                sb2.append(sequenceId);
                sb2.append(" streamNum=");
                sb2.append(captureDataBean.getStreamNum());
                sb2.append(" isFirst=");
                sb2.append(z);
                Log.d(access$1002, sb2.toString());
                if (captureDataBean.isDataReady()) {
                    ParallelDataZipper.this.mCaptureDataBeanArray.remove(timeStamp);
                    ParallelDataZipper.this.tryToCallback(captureDataBean);
                }
            }
        });
    }

    public synchronized void startTask(@NonNull final CaptureData captureData) {
        if (!this.mWorkThread.isAlive() || this.mHandler == null) {
            throw new RuntimeException("Thread already die!");
        }
        this.mHandler.post(new Runnable() {
            public void run() {
                String access$100 = ParallelDataZipper.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("startTask: ");
                sb.append(captureData);
                Log.d(access$100, sb.toString());
                ParallelDataZipper.this.mCaptureDataArray.put(Long.valueOf(captureData.getCaptureTimestamp()), captureData);
            }
        });
    }
}
