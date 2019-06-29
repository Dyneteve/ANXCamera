package com.ss.android.ugc.effectmanager.common;

import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.util.HashMap;
import java.util.Map;

public class EffectRequest {
    public static final String DEFAULT_PARAMS_ENCODING = "UTF-8";
    protected boolean isCancel = false;
    private Map<String, Object> mBodyParams = new HashMap();
    private String mContentType = HttpRequest.CONTENT_TYPE_FORM;
    private Map<String, String> mHeaders = new HashMap();
    String mHttpMethod = "GET";
    private String mUrl = "";

    public EffectRequest(String str, String str2) {
        this.mHttpMethod = str;
        this.mUrl = str2;
    }

    public void cancel() {
        this.isCancel = true;
    }

    public String getBodyContentType() {
        StringBuilder sb = new StringBuilder();
        sb.append("application/x-www-form-urlencoded; charset=");
        sb.append(getParamsEncoding());
        return sb.toString();
    }

    public String getContentType() {
        return this.mContentType;
    }

    public Map<String, String> getHeaders() {
        return this.mHeaders;
    }

    public String getHttpMethod() {
        return this.mHttpMethod;
    }

    public Map<String, Object> getParams() {
        return this.mBodyParams;
    }

    /* access modifiers changed from: protected */
    public String getParamsEncoding() {
        return "UTF-8";
    }

    public String getUrl() {
        return this.mUrl;
    }

    public boolean isCanceled() {
        return this.isCancel;
    }

    public void setBodyParams(Map<String, Object> map) {
        this.mBodyParams = map;
    }

    public void setContentType(String str) {
        this.mContentType = str;
    }

    public void setHeaders(Map<String, String> map) {
        this.mHeaders = map;
    }
}
