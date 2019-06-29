package com.xiaomi.camera.liveshot.encoder;

import android.media.MediaCodec;
import android.media.MediaFormat;
import android.opengl.EGLContext;
import android.os.Handler;
import android.provider.MiuiSettings.System;
import android.view.Surface;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.log.Log;
import com.xiaomi.camera.liveshot.LivePhotoResult;
import com.xiaomi.camera.liveshot.encoder.CircularMediaEncoder.Snapshot;
import com.xiaomi.camera.liveshot.gles.RenderThread;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Queue;
import java.util.concurrent.TimeUnit;

public class CircularVideoEncoder extends CircularMediaEncoder {
    private static final boolean DEBUG_FPS = true;
    private static final String TAG = CircularVideoEncoder.class.getSimpleName();
    protected long mFirstPresentationTimeUs;
    private int mFpsOutputInterval = System.SCREEN_KEY_LONG_PRESS_TIMEOUT_DEFAULT;
    private long mFrameStartTimestampNs = 0;
    private int mFramesRendered = 0;
    private Surface mInputSurface;
    protected long mLastPresentationTimeUs;
    private long mMinFrameRenderPeriodNs;
    private long mNextFrameTimestampNs;
    private final int mPreviewHeight;
    private final int mPreviewWidth;
    private RenderThread mRenderThread;
    private EGLContext mSharedEGLContext;

    public CircularVideoEncoder(MediaFormat mediaFormat, EGLContext eGLContext, long j, long j2, Queue<LivePhotoResult> queue) {
        super(mediaFormat, j, j2, queue);
        float f = this.mDesiredMediaFormat.getFloat("i-frame-interval");
        long millis = TimeUnit.MICROSECONDS.toMillis(this.mBufferingDurationUs);
        float f2 = f * 1000.0f * 2.0f;
        if (((float) millis) < f2) {
            StringBuilder sb = new StringBuilder();
            sb.append("Requested time span is too short: ");
            sb.append(millis);
            sb.append(" vs. ");
            sb.append(f2);
            throw new IllegalArgumentException(sb.toString());
        } else if (eGLContext != null) {
            this.mSharedEGLContext = eGLContext;
            int integer = this.mDesiredMediaFormat.getInteger("width");
            int integer2 = this.mDesiredMediaFormat.getInteger("height");
            this.mPreviewWidth = Math.min(integer, integer2);
            this.mPreviewHeight = Math.max(integer, integer2);
            try {
                this.mMediaCodec = MediaCodec.createEncoderByType(this.mDesiredMediaFormat.getString("mime"));
                this.mIsInitialized = true;
            } catch (IOException e) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Failed to configure MediaCodec: ");
                sb2.append(e);
                throw new IllegalStateException(sb2.toString());
            }
        } else {
            throw new IllegalArgumentException("The shared EGLContext must not be null");
        }
    }

    public void doRelease() {
        if (this.mIsInitialized) {
            super.doRelease();
            this.mIsInitialized = false;
        }
    }

    public void doStart() {
        Log.d(TAG, "start(): E");
        if (!this.mIsInitialized) {
            Log.d(TAG, "start(): not initialized yet");
        } else if (this.mIsBuffering) {
            Log.d(TAG, "start(): encoder is already running");
        } else {
            this.mCyclicBuffer.clear();
            this.mMediaCodec.configure(this.mDesiredMediaFormat, null, null, 1);
            this.mInputSurface = this.mMediaCodec.createInputSurface();
            RenderThread renderThread = new RenderThread(TAG, this.mPreviewWidth, this.mPreviewHeight, this.mSharedEGLContext, this.mInputSurface, true);
            this.mRenderThread = renderThread;
            this.mRenderThread.start();
            this.mRenderThread.waitUntilReady();
            this.mMediaCodec.setCallback(this, new Handler(this.mEncodingThread.getLooper()));
            this.mCurrentPresentationTimeUs = 0;
            this.mFirstPresentationTimeUs = 0;
            this.mLastPresentationTimeUs = 0;
            super.doStart();
            this.mIsBuffering = true;
            Log.d(TAG, "start(): X");
        }
    }

    public synchronized void doStop() {
        Log.d(TAG, "stop(): E");
        if (this.mIsInitialized) {
            if (this.mIsBuffering) {
                this.mIsBuffering = false;
                if (this.mRenderThread != null) {
                    this.mRenderThread.quit();
                    this.mRenderThread = null;
                }
                if (this.mInputSurface != null) {
                    this.mInputSurface.release();
                    this.mInputSurface = null;
                }
                super.doStop();
                Log.d(TAG, "clear pending snapshot requests: E");
                ArrayList<Snapshot> arrayList = new ArrayList<>();
                synchronized (this.mSnapshots) {
                    arrayList.addAll(this.mSnapshots);
                    this.mSnapshots.clear();
                }
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("cleared ");
                sb.append(arrayList.size());
                sb.append(" snapshot requests.");
                Log.d(str, sb.toString());
                for (Snapshot putEos : arrayList) {
                    try {
                        putEos.putEos();
                    } catch (InterruptedException e) {
                        String str2 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Failed to putEos: ");
                        sb2.append(e);
                        Log.d(str2, sb2.toString());
                    }
                }
                Log.d(TAG, "clear pending snapshot requests: X");
                Log.d(TAG, "stop(): X");
            }
        }
    }

    /* access modifiers changed from: protected */
    public long getNextPresentationTimeUs(long j) {
        if (this.mFirstPresentationTimeUs == 0) {
            this.mFirstPresentationTimeUs = j;
            return 0;
        }
        long j2 = j - this.mFirstPresentationTimeUs;
        if (this.mLastPresentationTimeUs >= j2) {
            this.mLastPresentationTimeUs += 9643;
            return this.mLastPresentationTimeUs;
        }
        this.mLastPresentationTimeUs = j2;
        return j2;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:29:0x0083, code lost:
        return;
     */
    public synchronized void onSurfaceTextureUpdated(DrawExtTexAttribute drawExtTexAttribute) {
        if (this.mIsInitialized) {
            if (this.mIsBuffering) {
                if (this.mMinFrameRenderPeriodNs > 0) {
                    long nanoTime = System.nanoTime();
                    if (nanoTime < this.mNextFrameTimestampNs) {
                        Log.d(TAG, "Dropping frame - fps reduction is active.");
                        return;
                    } else {
                        this.mNextFrameTimestampNs += this.mMinFrameRenderPeriodNs;
                        this.mNextFrameTimestampNs = Math.max(this.mNextFrameTimestampNs, nanoTime);
                    }
                }
                this.mRenderThread.draw(drawExtTexAttribute);
                long millis = TimeUnit.NANOSECONDS.toMillis(System.nanoTime());
                if (this.mFrameStartTimestampNs > 0) {
                    long j = millis - this.mFrameStartTimestampNs;
                    this.mFramesRendered++;
                    if (j > ((long) this.mFpsOutputInterval)) {
                        double d = ((double) (this.mFramesRendered * 1000)) / ((double) j);
                        String str = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("onSurfaceTextureUpdated(): ");
                        sb.append(d);
                        Log.d(str, sb.toString());
                        this.mFrameStartTimestampNs = millis;
                        this.mFramesRendered = 0;
                    }
                } else {
                    this.mFrameStartTimestampNs = millis;
                }
            }
        }
    }

    public synchronized void setFilterId(int i) {
        if (this.mIsInitialized) {
            if (this.mIsBuffering) {
                this.mRenderThread.setFilterId(i);
            }
        }
    }

    public void setFpsReduction(float f) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setFpsReduction: ");
        sb.append(f);
        Log.d(str, sb.toString());
        if (f <= 0.0f) {
            this.mMinFrameRenderPeriodNs = Long.MAX_VALUE;
        } else {
            this.mMinFrameRenderPeriodNs = (long) (((float) TimeUnit.SECONDS.toNanos(1)) / f);
        }
    }
}
