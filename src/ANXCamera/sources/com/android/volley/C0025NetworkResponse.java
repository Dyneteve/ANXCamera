package com.android.volley;

import java.util.Collections;
import java.util.Map;

/* renamed from: com.android.volley.NetworkResponse reason: case insensitive filesystem */
public class C0025NetworkResponse {
    public final byte[] data;
    public final Map<String, String> headers;
    public final boolean notModified;
    public final int statusCode;

    public C0025NetworkResponse(int i, byte[] bArr, Map<String, String> map, boolean z) {
        this.statusCode = i;
        this.data = bArr;
        this.headers = map;
        this.notModified = z;
    }

    public C0025NetworkResponse(byte[] bArr) {
        this(200, bArr, Collections.emptyMap(), false);
    }

    public C0025NetworkResponse(byte[] bArr, Map<String, String> map) {
        this(200, bArr, map, false);
    }
}
