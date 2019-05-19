package com.android.volley;

/* renamed from: com.android.volley.RetryPolicy reason: case insensitive filesystem */
public interface C0028RetryPolicy {
    int getCurrentRetryCount();

    int getCurrentTimeout();

    void retry(C0031VolleyError volleyError) throws C0031VolleyError;
}
