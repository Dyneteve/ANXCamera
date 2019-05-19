package com.miui.extravideo.interpolation;

import java.lang.reflect.Array;
import java.nio.ByteBuffer;

class MediaInterpolator {
    private ByteBuffer[][] mBuffers = ((ByteBuffer[][]) Array.newInstance(ByteBuffer.class, new int[]{3, 2}));
    private int mCurrentInterpolationTimes = 0;
    private final int mHeight;
    private int mInterpolationSize = 1;
    private InterpolatorJNI mInterpolatorJNI;
    private final int[] mResultImageIndex = new int[2];
    private byte[] mSrc;
    private final int mWidth;

    public MediaInterpolator(int i, int i2, int i3) {
        this.mWidth = i;
        this.mHeight = i2;
        this.mInterpolatorJNI = new InterpolatorJNI();
        this.mInterpolatorJNI.initialize(this.mWidth, this.mHeight, this.mWidth, this.mHeight, i3);
        this.mInterpolatorJNI.start();
        for (int i4 = 0; i4 < this.mBuffers.length; i4++) {
            this.mBuffers[i4][0] = this.mInterpolatorJNI.getImageBuffer(i4, 0);
            this.mBuffers[i4][1] = this.mInterpolatorJNI.getImageBuffer(i4, 1);
        }
    }

    public void configInterpolationSize(int i, byte[] bArr) {
        this.mInterpolationSize = i;
        this.mCurrentInterpolationTimes = 0;
        this.mSrc = bArr;
    }

    public boolean hasNext() {
        return this.mCurrentInterpolationTimes < this.mInterpolationSize;
    }

    public void nextByteBuffer(byte[] bArr) {
        this.mInterpolatorJNI.process(this.mCurrentInterpolationTimes == 0 ? this.mSrc : null, this.mCurrentInterpolationTimes, this.mInterpolationSize, false);
        this.mInterpolatorJNI.getImageIndex(this.mResultImageIndex);
        this.mBuffers[this.mResultImageIndex[1]][1].position(0);
        this.mBuffers[this.mResultImageIndex[1]][1].get(bArr);
        this.mCurrentInterpolationTimes++;
    }

    public void release() {
        this.mSrc = null;
        this.mBuffers = null;
        this.mInterpolatorJNI.finish();
    }
}
