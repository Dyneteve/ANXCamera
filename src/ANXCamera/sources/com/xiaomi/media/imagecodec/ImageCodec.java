package com.xiaomi.media.imagecodec;

import android.os.Handler;
import android.support.annotation.NonNull;
import android.util.Log;
import android.view.Surface;
import java.lang.ref.WeakReference;
import java.util.Objects;

public final class ImageCodec {
    private static final String TAG = ImageCodec.class.getSimpleName();
    private final int mInputImageFormat;
    private final int mInputImageHeight;
    private final int mInputImageWidth;
    private final Surface mInputSurface;
    private boolean mIsCodecValid;
    private final int mMaxInputImageCount;
    private long mNativeContext;

    static {
        System.loadLibrary("jni_imagecodec");
        nativeClassInit();
    }

    private ImageCodec(int i, int i2, int i3, int i4, Handler handler) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("ctor(): E ");
        sb.append(hashCode());
        Log.d(str, sb.toString());
        if (i < 1 || i2 < 1) {
            throw new IllegalArgumentException("The image dimensions must be positive");
        } else if (i4 < 1) {
            throw new IllegalArgumentException("Maximum input image count must be at least 1");
        } else if (i3 == 35) {
            this.mInputImageWidth = i;
            this.mInputImageHeight = i2;
            this.mInputImageFormat = i3;
            this.mMaxInputImageCount = i4;
            nativeCreate(new WeakReference(this), i, i2, i3, i4);
            this.mInputSurface = nativeGetInputSurface();
            this.mIsCodecValid = true;
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("ctor(): X ");
            sb2.append(hashCode());
            Log.d(str2, sb2.toString());
        } else {
            throw new IllegalArgumentException("Currently only YUV_420_888 is supported");
        }
    }

    public static ImageCodec create(int i, int i2, int i3, int i4) {
        ImageCodec imageCodec = new ImageCodec(i, i2, i3, i4, null);
        return imageCodec;
    }

    private static native void nativeClassInit();

    private native synchronized void nativeCreate(Object obj, int i, int i2, int i3, int i4);

    private native synchronized void nativeDestroy();

    private native synchronized Surface nativeGetInputSurface();

    private native synchronized void nativeSetCodecQuality(int i);

    private native synchronized void nativeSetFlipFlag(int i);

    private native synchronized void nativeSetOutputSurface(Surface surface);

    public int getHeight() {
        return this.mInputImageHeight;
    }

    public int getImageFormat() {
        return this.mInputImageFormat;
    }

    @NonNull
    public Surface getInputSurface() {
        return this.mInputSurface;
    }

    public int getMaxImages() {
        return this.mMaxInputImageCount;
    }

    public int getWidth() {
        return this.mInputImageWidth;
    }

    public void release() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("release(): E ");
        sb.append(hashCode());
        Log.d(str, sb.toString());
        if (this.mInputSurface != null) {
            this.mInputSurface.release();
        }
        if (this.mIsCodecValid) {
            this.mIsCodecValid = false;
            nativeDestroy();
        }
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("release(): X ");
        sb2.append(hashCode());
        Log.d(str2, sb2.toString());
    }

    public void setFlip(boolean z) {
        nativeSetFlipFlag(z ? 1 : 0);
    }

    public void setOutputSurface(@NonNull Surface surface) {
        Objects.requireNonNull(surface, "The given surface must not be null");
        nativeSetOutputSurface(surface);
    }

    public void setQuality(int i) {
        if (i < 0 || i > 100) {
            throw new IllegalArgumentException("quality must be 0..100");
        }
        nativeSetCodecQuality(i);
    }
}
