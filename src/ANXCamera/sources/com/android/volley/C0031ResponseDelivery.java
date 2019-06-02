package com.android.volley;

/* renamed from: com.android.volley.ResponseDelivery reason: case insensitive filesystem */
public interface C0031ResponseDelivery {
    void postError(C0028Request<?> request, C0035VolleyError volleyError);

    void postResponse(C0028Request<?> request, C0030Response<?> response);

    void postResponse(C0028Request<?> request, C0030Response<?> response, Runnable runnable);
}
