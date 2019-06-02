package com.android.volley;

/* renamed from: com.android.volley.VolleyError reason: case insensitive filesystem */
public class C0035VolleyError extends Exception {
    public final C0025NetworkResponse networkResponse;

    public C0035VolleyError() {
        this.networkResponse = null;
    }

    public C0035VolleyError(C0025NetworkResponse networkResponse2) {
        this.networkResponse = networkResponse2;
    }

    public C0035VolleyError(String str) {
        super(str);
        this.networkResponse = null;
    }

    public C0035VolleyError(String str, Throwable th) {
        super(str, th);
        this.networkResponse = null;
    }

    public C0035VolleyError(Throwable th) {
        super(th);
        this.networkResponse = null;
    }
}
