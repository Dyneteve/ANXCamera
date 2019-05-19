package com.android.volley;

import android.content.Intent;

/* renamed from: com.android.volley.AuthFailureError reason: case insensitive filesystem */
public class C0013AuthFailureError extends C0031VolleyError {
    private Intent mResolutionIntent;

    public C0013AuthFailureError() {
    }

    public C0013AuthFailureError(Intent intent) {
        this.mResolutionIntent = intent;
    }

    public C0013AuthFailureError(C0021NetworkResponse response) {
        super(response);
    }

    public C0013AuthFailureError(String message) {
        super(message);
    }

    public C0013AuthFailureError(String message, Exception reason) {
        super(message, reason);
    }

    public Intent getResolutionIntent() {
        return this.mResolutionIntent;
    }

    public String getMessage() {
        if (this.mResolutionIntent != null) {
            return "User needs to (re)enter credentials.";
        }
        return super.getMessage();
    }
}
