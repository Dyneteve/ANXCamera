package com.android.camera.network.net.json;

import com.android.camera.network.net.base.Cacheable;
import com.android.volley.C0013AuthFailureError;
import com.android.volley.C0021NetworkResponse;
import com.android.volley.C0023ParseError;
import com.android.volley.C0024Request;
import com.android.volley.C0026Response;
import com.android.volley.C0026Response.ErrorListener;
import com.android.volley.C0026Response.Listener;
import com.android.volley.toolbox.C0040HttpHeaderParser;
import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class JsonObjectRequest extends C0024Request<JSONObject> implements Cacheable {
    private String mCacheKey = null;
    private volatile byte[] mData = null;
    private Map<String, String> mHeaders = null;
    private volatile boolean mIsFromCache = false;
    private Listener<JSONObject> mListener;
    private Map<String, String> mParams = null;

    public JsonObjectRequest(int i, String str, Listener<JSONObject> listener, ErrorListener errorListener) {
        super(i, str, errorListener);
        this.mListener = listener;
    }

    public static String parseCharset(Map<String, String> map, String str) {
        String str2 = (String) map.get("Content-Type");
        if (str2 != null) {
            String[] split = str2.split(";");
            for (int i = 1; i < split.length; i++) {
                String[] split2 = split[i].trim().split("=");
                if (split2.length == 2 && split2[0].equals(HttpRequest.PARAM_CHARSET)) {
                    return split2[1];
                }
            }
        }
        return str;
    }

    /* access modifiers changed from: protected */
    public void deliverResponse(JSONObject jSONObject) {
        if (this.mListener != null) {
            this.mListener.onResponse(jSONObject);
        }
    }

    public String getCacheKey() {
        return this.mCacheKey == null ? super.getCacheKey() : this.mCacheKey;
    }

    public byte[] getData() {
        return this.mData;
    }

    public Map<String, String> getHeaders() throws C0013AuthFailureError {
        return this.mHeaders != null ? this.mHeaders : super.getHeaders();
    }

    public Map<String, String> getParams() throws C0013AuthFailureError {
        return this.mParams != null ? this.mParams : super.getParams();
    }

    public boolean isFromCache() {
        return this.mIsFromCache;
    }

    /* access modifiers changed from: protected */
    public C0026Response<JSONObject> parseNetworkResponse(C0021NetworkResponse networkResponse) {
        try {
            this.mIsFromCache = networkResponse.headers.containsKey(Cacheable.HEADER_FROM_CACHE);
            this.mData = networkResponse.data;
            return C0026Response.success(new JSONObject(new String(networkResponse.data, parseCharset(networkResponse.headers, "utf-8"))), C0040HttpHeaderParser.parseCacheHeaders(networkResponse));
        } catch (UnsupportedEncodingException e) {
            return C0026Response.error(new C0023ParseError((Throwable) e));
        } catch (JSONException e2) {
            return C0026Response.error(new C0023ParseError((Throwable) e2));
        }
    }

    public void setCacheKey(String str) {
        this.mCacheKey = str;
    }

    public void setHeaders(Map<String, String> map) {
        this.mHeaders = map;
    }

    public void setParams(Map<String, String> map) {
        this.mParams = map;
    }
}
