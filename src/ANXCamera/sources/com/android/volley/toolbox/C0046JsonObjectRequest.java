package com.android.volley.toolbox;

import com.android.volley.C0021NetworkResponse;
import com.android.volley.C0023ParseError;
import com.android.volley.C0026Response;
import com.android.volley.C0026Response.ErrorListener;
import com.android.volley.C0026Response.Listener;
import java.io.UnsupportedEncodingException;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.android.volley.toolbox.JsonObjectRequest reason: case insensitive filesystem */
public class C0046JsonObjectRequest extends C0047JsonRequest<JSONObject> {
    public C0046JsonObjectRequest(int method, String url, JSONObject jsonRequest, Listener<JSONObject> listener, ErrorListener errorListener) {
        super(method, url, jsonRequest == null ? null : jsonRequest.toString(), listener, errorListener);
    }

    public C0046JsonObjectRequest(String url, JSONObject jsonRequest, Listener<JSONObject> listener, ErrorListener errorListener) {
        this(jsonRequest == null ? 0 : 1, url, jsonRequest, listener, errorListener);
    }

    /* access modifiers changed from: protected */
    public C0026Response<JSONObject> parseNetworkResponse(C0021NetworkResponse response) {
        try {
            return C0026Response.success(new JSONObject(new String(response.data, C0040HttpHeaderParser.parseCharset(response.headers))), C0040HttpHeaderParser.parseCacheHeaders(response));
        } catch (UnsupportedEncodingException e) {
            return C0026Response.error(new C0023ParseError((Throwable) e));
        } catch (JSONException je) {
            return C0026Response.error(new C0023ParseError((Throwable) je));
        }
    }
}
