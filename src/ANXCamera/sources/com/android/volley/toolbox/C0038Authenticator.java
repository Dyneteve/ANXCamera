package com.android.volley.toolbox;

import com.android.volley.C0017AuthFailureError;

/* renamed from: com.android.volley.toolbox.Authenticator reason: case insensitive filesystem */
public interface C0038Authenticator {
    String getAuthToken() throws C0017AuthFailureError;

    void invalidateAuthToken(String str);
}
