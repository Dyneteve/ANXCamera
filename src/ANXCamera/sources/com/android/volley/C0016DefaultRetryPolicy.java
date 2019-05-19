package com.android.volley;

/* renamed from: com.android.volley.DefaultRetryPolicy reason: case insensitive filesystem */
public class C0016DefaultRetryPolicy implements C0028RetryPolicy {
    public static final float DEFAULT_BACKOFF_MULT = 1.0f;
    public static final int DEFAULT_MAX_RETRIES = 1;
    public static final int DEFAULT_TIMEOUT_MS = 2500;
    private final float mBackoffMultiplier;
    private int mCurrentRetryCount;
    private int mCurrentTimeoutMs;
    private final int mMaxNumRetries;

    public C0016DefaultRetryPolicy() {
        this(2500, 1, 1.0f);
    }

    public C0016DefaultRetryPolicy(int initialTimeoutMs, int maxNumRetries, float backoffMultiplier) {
        this.mCurrentTimeoutMs = initialTimeoutMs;
        this.mMaxNumRetries = maxNumRetries;
        this.mBackoffMultiplier = backoffMultiplier;
    }

    public int getCurrentTimeout() {
        return this.mCurrentTimeoutMs;
    }

    public int getCurrentRetryCount() {
        return this.mCurrentRetryCount;
    }

    public void retry(C0031VolleyError error) throws C0031VolleyError {
        this.mCurrentRetryCount++;
        this.mCurrentTimeoutMs = (int) (((float) this.mCurrentTimeoutMs) + (((float) this.mCurrentTimeoutMs) * this.mBackoffMultiplier));
        if (!hasAttemptRemaining()) {
            throw error;
        }
    }

    /* access modifiers changed from: protected */
    public boolean hasAttemptRemaining() {
        return this.mCurrentRetryCount <= this.mMaxNumRetries;
    }
}
