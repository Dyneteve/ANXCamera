package com.android.volley.toolbox;

import com.android.volley.C0025NetworkResponse;
import com.android.volley.C0028Request;
import com.android.volley.C0030Response;
import com.android.volley.C0030Response.ErrorListener;
import com.android.volley.C0030Response.Listener;
import com.android.volley.C0036VolleyLog;
import java.io.UnsupportedEncodingException;

/* renamed from: com.android.volley.toolbox.JsonRequest reason: case insensitive filesystem */
public abstract class C0051JsonRequest<T> extends C0028Request<T> {
    private static final String PROTOCOL_CHARSET = "utf-8";
    private static final String PROTOCOL_CONTENT_TYPE = String.format("application/json; charset=%s", new Object[]{"utf-8"});
    private final Listener<T> mListener;
    private final String mRequestBody;

    public C0051JsonRequest(int i, String str, String str2, Listener<T> listener, ErrorListener errorListener) {
        super(i, str, errorListener);
        this.mListener = listener;
        this.mRequestBody = str2;
    }

    public C0051JsonRequest(String str, String str2, Listener<T> listener, ErrorListener errorListener) {
        this(-1, str, str2, listener, errorListener);
    }

    /* access modifiers changed from: protected */
    public void deliverResponse(T t) {
        this.mListener.onResponse(t);
    }

    public byte[] getBody() {
        byte[] bArr = null;
        try {
            if (this.mRequestBody != null) {
                bArr = this.mRequestBody.getBytes("utf-8");
            }
            return bArr;
        } catch (UnsupportedEncodingException e) {
            C0036VolleyLog.wtf("Unsupported Encoding while trying to get the bytes of %s using %s", this.mRequestBody, "utf-8");
            return null;
        }
    }

    public String getBodyContentType() {
        return PROTOCOL_CONTENT_TYPE;
    }

    public byte[] getPostBody() {
        return getBody();
    }

    public String getPostBodyContentType() {
        return getBodyContentType();
    }

    public abstract C0030Response<T> parseNetworkResponse(C0025NetworkResponse networkResponse);
}
