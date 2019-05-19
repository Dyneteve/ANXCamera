package com.xiaomi.camera.core;

import android.media.Image;
import android.os.Handler;
import android.os.HandlerThread;
import android.support.annotation.NonNull;
import android.util.Log;
import android.util.LongSparseArray;
import android.util.SparseLongArray;
import com.xiaomi.camera.core.CaptureData.CaptureDataBean;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.util.Locale;

public class ParallelDataZipper {
    /* access modifiers changed from: private */
    public static final String TAG = ParallelDataZipper.class.getSimpleName();
    private final LongSparseArray<CaptureData> mCaptureDataArray;
    /* access modifiers changed from: private */
    public LongSparseArray<CaptureDataBean> mCaptureDataBeanArray;
    /* access modifiers changed from: private */
    public DataListener mDataListener;
    private Handler mHandler;
    /* access modifiers changed from: private */
    public final SparseLongArray mSequenceIdToTimestampMap;
    private HandlerThread mWorkThread;

    public interface DataListener {
        void onParallelDataAvailable(CaptureData captureData);

        void onParallelDataUnmatched(CaptureDataBean captureDataBean);
    }

    static class InstanceHolder {
        static ParallelDataZipper INSTANCE = new ParallelDataZipper();

        InstanceHolder() {
        }
    }

    private ParallelDataZipper() {
        this.mCaptureDataBeanArray = new LongSparseArray<>(4);
        this.mCaptureDataArray = new LongSparseArray<>(4);
        this.mSequenceIdToTimestampMap = new SparseLongArray(4);
        this.mWorkThread = new HandlerThread("ParallelDataZipperThread");
        this.mWorkThread.start();
        this.mHandler = new Handler(this.mWorkThread.getLooper());
    }

    public static ParallelDataZipper getInstance() {
        return InstanceHolder.INSTANCE;
    }

    /* access modifiers changed from: private */
    public int getStreamNumberBySequenceId(int i) {
        long j = this.mSequenceIdToTimestampMap.get(i);
        if (0 == j) {
            return 0;
        }
        return getStreamNumberByTimestamp(j);
    }

    /* access modifiers changed from: private */
    public int getStreamNumberByTimestamp(long j) {
        CaptureData captureData = (CaptureData) this.mCaptureDataArray.get(j);
        if (captureData == null) {
            return 0;
        }
        return captureData.getStreamNum();
    }

    /* access modifiers changed from: private */
    public void tryToCallback(CaptureDataBean captureDataBean) {
        Integer valueOf = Integer.valueOf(captureDataBean.getResult().getSequenceId());
        long timeStamp = captureDataBean.getResult().getTimeStamp();
        CaptureData captureData = (CaptureData) this.mCaptureDataArray.get(timeStamp);
        if (captureData == null) {
            long j = this.mSequenceIdToTimestampMap.get(valueOf.intValue());
            CaptureData captureData2 = (CaptureData) this.mCaptureDataArray.get(j);
            if (captureData2 == null) {
                StringBuilder sb = new StringBuilder();
                sb.append("no task found with sequenceId: ");
                sb.append(valueOf);
                sb.append(" timestamp: ");
                sb.append(timeStamp);
                sb.append("|");
                sb.append(j);
                String sb2 = sb.toString();
                Log.e(TAG, sb2, new RuntimeException(sb2));
                if (this.mDataListener != null) {
                    this.mDataListener.onParallelDataUnmatched(captureDataBean);
                } else {
                    captureDataBean.close();
                }
                return;
            }
            timeStamp = j;
            captureData = captureData2;
        }
        captureData.putCaptureDataBean(captureDataBean);
        if (captureData.isDataReady()) {
            if (this.mDataListener != null) {
                this.mDataListener.onParallelDataAvailable(captureData);
            } else {
                String str = TAG;
                StringBuilder sb3 = new StringBuilder();
                sb3.append("tryToCallback: no callback. sequenceId: ");
                sb3.append(valueOf);
                sb3.append(" timestamp: ");
                sb3.append(timeStamp);
                Log.w(str, sb3.toString());
                for (CaptureDataBean captureDataBean2 : captureData.getCaptureDataBeanList()) {
                    if (captureDataBean2 != null) {
                        captureDataBean2.close();
                    }
                }
            }
            this.mCaptureDataArray.remove(timeStamp);
            this.mSequenceIdToTimestampMap.delete(valueOf.intValue());
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
                String access$500 = ParallelDataZipper.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("setImage: timestamp=");
                sb.append(timestamp);
                sb.append(" streamNum=");
                sb.append(captureDataBean.getStreamNum());
                Log.d(access$500, sb.toString());
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
                if (z && ParallelDataZipper.this.mSequenceIdToTimestampMap.indexOfKey(sequenceId) < 0) {
                    ParallelDataZipper.this.mSequenceIdToTimestampMap.put(sequenceId, timeStamp);
                }
                CaptureDataBean captureDataBean = (CaptureDataBean) ParallelDataZipper.this.mCaptureDataBeanArray.get(timeStamp);
                if (captureDataBean == null) {
                    CaptureDataBean captureDataBean2 = new CaptureDataBean(ParallelDataZipper.this.getStreamNumberByTimestamp(timeStamp));
                    ParallelDataZipper.this.mCaptureDataBeanArray.put(timeStamp, captureDataBean2);
                    captureDataBean = captureDataBean2;
                }
                if (captureDataBean.getStreamNum() == 0) {
                    captureDataBean.setStreamNum(ParallelDataZipper.this.getStreamNumberBySequenceId(sequenceId));
                }
                if (captureDataBean.getStreamNum() == 0) {
                    String access$500 = ParallelDataZipper.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("no task found with sequence id: ");
                    sb.append(sequenceId);
                    sb.append(" timestamp: ");
                    sb.append(timeStamp);
                    Log.w(access$500, sb.toString());
                    ParallelDataZipper.this.mCaptureDataBeanArray.remove(timeStamp);
                    if (ParallelDataZipper.this.mDataListener != null) {
                        ParallelDataZipper.this.mDataListener.onParallelDataUnmatched(captureDataBean);
                    } else {
                        captureDataBean.close();
                    }
                } else {
                    String access$5002 = ParallelDataZipper.TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("setResult: timestamp=");
                    sb2.append(timeStamp);
                    sb2.append(" sequenceId=");
                    sb2.append(sequenceId);
                    sb2.append(" streamNum=");
                    sb2.append(captureDataBean.getStreamNum());
                    sb2.append(" isFirst=");
                    sb2.append(z);
                    Log.d(access$5002, sb2.toString());
                    captureDataBean.setCaptureResult(iCustomCaptureResult, z);
                    if (captureDataBean.isDataReady()) {
                        ParallelDataZipper.this.mCaptureDataBeanArray.remove(timeStamp);
                        ParallelDataZipper.this.tryToCallback(captureDataBean);
                    }
                }
            }
        });
    }

    public void setDataListener(DataListener dataListener) {
        this.mDataListener = dataListener;
    }

    public synchronized void startTask(int i, int i2, int i3, long j) {
        Log.d(TAG, String.format(Locale.ENGLISH, "startTask: algo=%d streamNum=%d burstNum=%d timestamp=%d", new Object[]{Integer.valueOf(i), Integer.valueOf(i2), Integer.valueOf(i3), Long.valueOf(j)}));
        CaptureData captureData = new CaptureData(i, i2, i3, j);
        this.mCaptureDataArray.put(j, captureData);
    }
}
