package com.android.volley;

/* renamed from: com.android.volley.DefaultRetryPolicy reason: case insensitive filesystem */
public class C0020DefaultRetryPolicy implements C0032RetryPolicy {
    public static final float DEFAULT_BACKOFF_MULT = 1.0f;
    public static final int DEFAULT_MAX_RETRIES = 1;
    public static final int DEFAULT_TIMEOUT_MS = 2500;
    private final float mBackoffMultiplier;
    private int mCurrentRetryCount;
    private int mCurrentTimeoutMs;
    private final int mMaxNumRetries;

    public C0020DefaultRetryPolicy() {
        this(2500, 1, 1.0f);
    }

    public C0020DefaultRetryPolicy(int i, int i2, float f) {
        this.mCurrentTimeoutMs = i;
        this.mMaxNumRetries = i2;
        this.mBackoffMultiplier = f;
    }

    public int getCurrentRetryCount() {
        return this.mCurrentRetryCount;
    }

    public int getCurrentTimeout() {
        return this.mCurrentTimeoutMs;
    }

    /* access modifiers changed from: protected */
    public boolean hasAttemptRemaining() {
        return this.mCurrentRetryCount <= this.mMaxNumRetries;
    }

    public void retry(C0035VolleyError volleyError) throws C0035VolleyError {
        this.mCurrentRetryCount++;
        this.mCurrentTimeoutMs = (int) (((float) this.mCurrentTimeoutMs) + (((float) this.mCurrentTimeoutMs) * this.mBackoffMultiplier));
        if (!hasAttemptRemaining()) {
            throw volleyError;
        }
    }
}
