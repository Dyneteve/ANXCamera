package com.android.zxing;

import android.media.Image;
import com.android.camera.log.Log;
import io.reactivex.FlowableEmitter;
import io.reactivex.disposables.Disposable;
import java.util.concurrent.atomic.AtomicInteger;

public abstract class Decoder {
    static long DECODE_AUTO_INTERVAL = 1000;
    static int DECODE_MAX_COUNT = 15;
    public static final String TAG = "Decoder";
    Disposable mDecodeDisposable;
    FlowableEmitter<PreviewImage> mDecodeFlowableEmitter;
    volatile boolean mDecoding;
    AtomicInteger mDecodingCount = new AtomicInteger(0);
    boolean mEnable = false;
    long mLastDecodeTime;

    public abstract void init(int i);

    public boolean needPreviewFrame() {
        if (!this.mEnable || !this.mDecoding || this.mDecodingCount.get() >= DECODE_MAX_COUNT) {
            return false;
        }
        long currentTimeMillis = System.currentTimeMillis();
        if (currentTimeMillis - this.mLastDecodeTime < DECODE_AUTO_INTERVAL) {
            return false;
        }
        this.mLastDecodeTime = currentTimeMillis;
        this.mDecodingCount.getAndIncrement();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("preview frame buffer received... mDecodingCount = ");
        sb.append(this.mDecodingCount.get());
        Log.v(str, sb.toString());
        return true;
    }

    public abstract void onPreviewFrame(Image image, int i, int i2, int i3);

    public void quit() {
        this.mEnable = false;
    }

    public abstract void reset();

    public void setEnable(boolean z) {
        this.mEnable = z;
    }

    public abstract void startDecode();

    public void stopDecode() {
        Log.d(TAG, "Stop decode.");
        if (this.mDecodeDisposable != null && !this.mDecodeDisposable.isDisposed()) {
            this.mDecodeDisposable.dispose();
        }
        this.mDecoding = false;
    }

    public void updatePreviewSize(int i, int i2) {
    }
}
