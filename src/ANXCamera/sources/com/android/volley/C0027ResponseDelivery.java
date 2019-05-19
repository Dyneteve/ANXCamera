package com.android.volley;

/* renamed from: com.android.volley.ResponseDelivery reason: case insensitive filesystem */
public interface C0027ResponseDelivery {
    void postError(C0024Request<?> request, C0031VolleyError volleyError);

    void postResponse(C0024Request<?> request, C0026Response<?> response);

    void postResponse(C0024Request<?> request, C0026Response<?> response, Runnable runnable);
}
