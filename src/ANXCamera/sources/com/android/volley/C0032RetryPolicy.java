package com.android.volley;

/* renamed from: com.android.volley.RetryPolicy reason: case insensitive filesystem */
public interface C0032RetryPolicy {
    int getCurrentRetryCount();

    int getCurrentTimeout();

    void retry(C0035VolleyError volleyError) throws C0035VolleyError;
}
