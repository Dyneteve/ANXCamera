package com.android.volley;

/* renamed from: com.android.volley.VolleyError reason: case insensitive filesystem */
public class C0031VolleyError extends Exception {
    public final C0021NetworkResponse networkResponse;

    public C0031VolleyError() {
        this.networkResponse = null;
    }

    public C0031VolleyError(C0021NetworkResponse response) {
        this.networkResponse = response;
    }

    public C0031VolleyError(String exceptionMessage) {
        super(exceptionMessage);
        this.networkResponse = null;
    }

    public C0031VolleyError(String exceptionMessage, Throwable reason) {
        super(exceptionMessage, reason);
        this.networkResponse = null;
    }

    public C0031VolleyError(Throwable cause) {
        super(cause);
        this.networkResponse = null;
    }
}
