package com.android.volley;

import java.util.Collections;
import java.util.Map;

/* renamed from: com.android.volley.NetworkResponse reason: case insensitive filesystem */
public class C0021NetworkResponse {
    public final byte[] data;
    public final Map<String, String> headers;
    public final boolean notModified;
    public final int statusCode;

    public C0021NetworkResponse(int statusCode2, byte[] data2, Map<String, String> headers2, boolean notModified2) {
        this.statusCode = statusCode2;
        this.data = data2;
        this.headers = headers2;
        this.notModified = notModified2;
    }

    public C0021NetworkResponse(byte[] data2) {
        this(200, data2, Collections.emptyMap(), false);
    }

    public C0021NetworkResponse(byte[] data2, Map<String, String> headers2) {
        this(200, data2, headers2, false);
    }
}
