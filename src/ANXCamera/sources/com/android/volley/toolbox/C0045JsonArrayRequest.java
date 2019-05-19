package com.android.volley.toolbox;

import com.android.volley.C0021NetworkResponse;
import com.android.volley.C0023ParseError;
import com.android.volley.C0026Response;
import com.android.volley.C0026Response.ErrorListener;
import com.android.volley.C0026Response.Listener;
import java.io.UnsupportedEncodingException;
import org.json.JSONArray;
import org.json.JSONException;

/* renamed from: com.android.volley.toolbox.JsonArrayRequest reason: case insensitive filesystem */
public class C0045JsonArrayRequest extends C0047JsonRequest<JSONArray> {
    public C0045JsonArrayRequest(String url, Listener<JSONArray> listener, ErrorListener errorListener) {
        super(0, url, null, listener, errorListener);
    }

    /* access modifiers changed from: protected */
    public C0026Response<JSONArray> parseNetworkResponse(C0021NetworkResponse response) {
        try {
            return C0026Response.success(new JSONArray(new String(response.data, C0040HttpHeaderParser.parseCharset(response.headers))), C0040HttpHeaderParser.parseCacheHeaders(response));
        } catch (UnsupportedEncodingException e) {
            return C0026Response.error(new C0023ParseError((Throwable) e));
        } catch (JSONException je) {
            return C0026Response.error(new C0023ParseError((Throwable) je));
        }
    }
}
