package com.android.volley.toolbox;

import com.android.volley.C0021NetworkResponse;
import com.android.volley.C0024Request;
import com.android.volley.C0026Response;
import com.android.volley.C0026Response.ErrorListener;
import com.android.volley.C0026Response.Listener;
import java.io.UnsupportedEncodingException;

/* renamed from: com.android.volley.toolbox.StringRequest reason: case insensitive filesystem */
public class C0052StringRequest extends C0024Request<String> {
    private final Listener<String> mListener;

    public C0052StringRequest(int method, String url, Listener<String> listener, ErrorListener errorListener) {
        super(method, url, errorListener);
        this.mListener = listener;
    }

    public C0052StringRequest(String url, Listener<String> listener, ErrorListener errorListener) {
        this(0, url, listener, errorListener);
    }

    /* access modifiers changed from: protected */
    public void deliverResponse(String response) {
        this.mListener.onResponse(response);
    }

    /* access modifiers changed from: protected */
    public C0026Response<String> parseNetworkResponse(C0021NetworkResponse response) {
        String parsed;
        try {
            parsed = new String(response.data, C0040HttpHeaderParser.parseCharset(response.headers));
        } catch (UnsupportedEncodingException e) {
            parsed = new String(response.data);
        }
        return C0026Response.success(parsed, C0040HttpHeaderParser.parseCacheHeaders(response));
    }
}
