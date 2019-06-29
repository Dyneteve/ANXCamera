package com.android.zxing;

import android.media.Image;
import com.android.camera.log.Log;
import io.reactivex.disposables.Disposable;
import io.reactivex.subjects.PublishSubject;
import java.util.concurrent.atomic.AtomicInteger;

public abstract class Decoder {
    public static final String TAG = "Decoder";
    long mDecodeAutoInterval = 1000;
    Disposable mDecodeDisposable;
    int mDecodeMaxCount = 15;
    volatile boolean mDecoding;
    AtomicInteger mDecodingCount = new AtomicInteger(0);
    boolean mEnable = false;
    private long mLastDecodeTime;
    PublishSubject<PreviewImage> mSubjects;

    public abstract void init(int i);

    /* access modifiers changed from: protected */
    public boolean isNeedImage() {
        return false;
    }

    public boolean needPreviewFrame() {
        if (!this.mEnable || !this.mDecoding || this.mDecodingCount.get() >= this.mDecodeMaxCount) {
            return false;
        }
        long currentTimeMillis = System.currentTimeMillis();
        if (currentTimeMillis - this.mLastDecodeTime < this.mDecodeAutoInterval) {
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

    public void onPreviewFrame(Image image) {
    }

    public abstract void onPreviewFrame(PreviewImage previewImage);

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
}
