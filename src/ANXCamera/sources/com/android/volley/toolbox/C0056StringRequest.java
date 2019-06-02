package com.android.volley.toolbox;

import com.android.volley.C0025NetworkResponse;
import com.android.volley.C0028Request;
import com.android.volley.C0030Response;
import com.android.volley.C0030Response.ErrorListener;
import com.android.volley.C0030Response.Listener;
import java.io.UnsupportedEncodingException;

/* renamed from: com.android.volley.toolbox.StringRequest reason: case insensitive filesystem */
public class C0056StringRequest extends C0028Request<String> {
    private final Listener<String> mListener;

    public C0056StringRequest(int i, String str, Listener<String> listener, ErrorListener errorListener) {
        super(i, str, errorListener);
        this.mListener = listener;
    }

    public C0056StringRequest(String str, Listener<String> listener, ErrorListener errorListener) {
        this(0, str, listener, errorListener);
    }

    /* access modifiers changed from: protected */
    public void deliverResponse(String str) {
        this.mListener.onResponse(str);
    }

    /* access modifiers changed from: protected */
    public C0030Response<String> parseNetworkResponse(C0025NetworkResponse networkResponse) {
        String str;
        try {
            str = new String(networkResponse.data, C0044HttpHeaderParser.parseCharset(networkResponse.headers));
        } catch (UnsupportedEncodingException e) {
            str = new String(networkResponse.data);
        }
        return C0030Response.success(str, C0044HttpHeaderParser.parseCacheHeaders(networkResponse));
    }
}
