package com.android.volley;

import android.content.Intent;

/* renamed from: com.android.volley.AuthFailureError reason: case insensitive filesystem */
public class C0017AuthFailureError extends C0035VolleyError {
    private Intent mResolutionIntent;

    public C0017AuthFailureError() {
    }

    public C0017AuthFailureError(Intent intent) {
        this.mResolutionIntent = intent;
    }

    public C0017AuthFailureError(C0025NetworkResponse networkResponse) {
        super(networkResponse);
    }

    public C0017AuthFailureError(String str) {
        super(str);
    }

    public C0017AuthFailureError(String str, Exception exc) {
        super(str, exc);
    }

    public String getMessage() {
        return this.mResolutionIntent != null ? "User needs to (re)enter credentials." : super.getMessage();
    }

    public Intent getResolutionIntent() {
        return this.mResolutionIntent;
    }
}
