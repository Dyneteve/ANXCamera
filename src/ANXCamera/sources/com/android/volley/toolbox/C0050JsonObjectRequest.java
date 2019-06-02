package com.android.volley.toolbox;

import com.android.volley.C0025NetworkResponse;
import com.android.volley.C0027ParseError;
import com.android.volley.C0030Response;
import com.android.volley.C0030Response.ErrorListener;
import com.android.volley.C0030Response.Listener;
import java.io.UnsupportedEncodingException;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.android.volley.toolbox.JsonObjectRequest reason: case insensitive filesystem */
public class C0050JsonObjectRequest extends C0051JsonRequest<JSONObject> {
    public C0050JsonObjectRequest(int i, String str, JSONObject jSONObject, Listener<JSONObject> listener, ErrorListener errorListener) {
        super(i, str, jSONObject == null ? null : jSONObject.toString(), listener, errorListener);
    }

    public C0050JsonObjectRequest(String str, JSONObject jSONObject, Listener<JSONObject> listener, ErrorListener errorListener) {
        this(jSONObject == null ? 0 : 1, str, jSONObject, listener, errorListener);
    }

    /* access modifiers changed from: protected */
    public C0030Response<JSONObject> parseNetworkResponse(C0025NetworkResponse networkResponse) {
        try {
            return C0030Response.success(new JSONObject(new String(networkResponse.data, C0044HttpHeaderParser.parseCharset(networkResponse.headers))), C0044HttpHeaderParser.parseCacheHeaders(networkResponse));
        } catch (UnsupportedEncodingException e) {
            return C0030Response.error(new C0027ParseError((Throwable) e));
        } catch (JSONException e2) {
            return C0030Response.error(new C0027ParseError((Throwable) e2));
        }
    }
}
