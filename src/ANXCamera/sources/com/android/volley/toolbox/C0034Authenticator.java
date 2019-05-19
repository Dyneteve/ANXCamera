package com.android.volley.toolbox;

import com.android.volley.C0013AuthFailureError;

/* renamed from: com.android.volley.toolbox.Authenticator reason: case insensitive filesystem */
public interface C0034Authenticator {
    String getAuthToken() throws C0013AuthFailureError;

    void invalidateAuthToken(String str);
}
