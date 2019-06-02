package com.android.volley.toolbox;

import com.android.volley.C0025NetworkResponse;
import com.android.volley.C0027ParseError;
import com.android.volley.C0030Response;
import com.android.volley.C0030Response.ErrorListener;
import com.android.volley.C0030Response.Listener;
import java.io.UnsupportedEncodingException;
import org.json.JSONArray;
import org.json.JSONException;

/* renamed from: com.android.volley.toolbox.JsonArrayRequest reason: case insensitive filesystem */
public class C0049JsonArrayRequest extends C0051JsonRequest<JSONArray> {
    public C0049JsonArrayRequest(String str, Listener<JSONArray> listener, ErrorListener errorListener) {
        super(0, str, null, listener, errorListener);
    }

    /* access modifiers changed from: protected */
    public C0030Response<JSONArray> parseNetworkResponse(C0025NetworkResponse networkResponse) {
        try {
            return C0030Response.success(new JSONArray(new String(networkResponse.data, C0044HttpHeaderParser.parseCharset(networkResponse.headers))), C0044HttpHeaderParser.parseCacheHeaders(networkResponse));
        } catch (UnsupportedEncodingException e) {
            return C0030Response.error(new C0027ParseError((Throwable) e));
        } catch (JSONException e2) {
            return C0030Response.error(new C0027ParseError((Throwable) e2));
        }
    }
}
