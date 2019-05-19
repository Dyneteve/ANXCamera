package com.android.volley.toolbox;

import com.android.volley.C0021NetworkResponse;
import com.android.volley.C0024Request;
import com.android.volley.C0026Response;
import com.android.volley.C0026Response.ErrorListener;
import com.android.volley.C0026Response.Listener;
import com.android.volley.C0032VolleyLog;
import java.io.UnsupportedEncodingException;

/* renamed from: com.android.volley.toolbox.JsonRequest reason: case insensitive filesystem */
public abstract class C0047JsonRequest<T> extends C0024Request<T> {
    private static final String PROTOCOL_CHARSET = "utf-8";
    private static final String PROTOCOL_CONTENT_TYPE = String.format("application/json; charset=%s", new Object[]{"utf-8"});
    private final Listener<T> mListener;
    private final String mRequestBody;

    public abstract C0026Response<T> parseNetworkResponse(C0021NetworkResponse networkResponse);

    public C0047JsonRequest(String url, String requestBody, Listener<T> listener, ErrorListener errorListener) {
        this(-1, url, requestBody, listener, errorListener);
    }

    public C0047JsonRequest(int method, String url, String requestBody, Listener<T> listener, ErrorListener errorListener) {
        super(method, url, errorListener);
        this.mListener = listener;
        this.mRequestBody = requestBody;
    }

    /* access modifiers changed from: protected */
    public void deliverResponse(T response) {
        this.mListener.onResponse(response);
    }

    public String getPostBodyContentType() {
        return getBodyContentType();
    }

    public byte[] getPostBody() {
        return getBody();
    }

    public String getBodyContentType() {
        return PROTOCOL_CONTENT_TYPE;
    }

    public byte[] getBody() {
        byte[] bArr = null;
        try {
            if (this.mRequestBody != null) {
                bArr = this.mRequestBody.getBytes("utf-8");
            }
            return bArr;
        } catch (UnsupportedEncodingException e) {
            C0032VolleyLog.wtf("Unsupported Encoding while trying to get the bytes of %s using %s", this.mRequestBody, "utf-8");
            return null;
        }
    }
}
