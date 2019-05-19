package com.android.volley;

import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.TextUtils;
import com.android.volley.C0014Cache.Entry;
import com.android.volley.C0026Response.ErrorListener;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.Map;

/* renamed from: com.android.volley.Request reason: case insensitive filesystem */
public abstract class C0024Request<T> implements Comparable<C0024Request<T>> {
    private static final String DEFAULT_PARAMS_ENCODING = "UTF-8";
    private static final long SLOW_REQUEST_THRESHOLD_MS = 3000;
    private Entry mCacheEntry;
    private boolean mCanceled;
    private final int mDefaultTrafficStatsTag;
    private final ErrorListener mErrorListener;
    private final MarkerLog mEventLog;
    private final int mMethod;
    private long mRequestBirthTime;
    private C0025RequestQueue mRequestQueue;
    private boolean mResponseDelivered;
    private C0028RetryPolicy mRetryPolicy;
    private Integer mSequence;
    private boolean mShouldCache;
    private Object mTag;
    private final String mUrl;

    /* renamed from: com.android.volley.Request$Method */
    public interface Method {
        public static final int DELETE = 3;
        public static final int DEPRECATED_GET_OR_POST = -1;
        public static final int GET = 0;
        public static final int HEAD = 4;
        public static final int OPTIONS = 5;
        public static final int PATCH = 7;
        public static final int POST = 1;
        public static final int PUT = 2;
        public static final int TRACE = 6;
    }

    /* renamed from: com.android.volley.Request$Priority */
    public enum Priority {
        LOW,
        NORMAL,
        HIGH,
        IMMEDIATE
    }

    public abstract void deliverResponse(T t);

    public abstract C0026Response<T> parseNetworkResponse(C0021NetworkResponse networkResponse);

    @Deprecated
    public C0024Request(String url, ErrorListener listener) {
        this(-1, url, listener);
    }

    public C0024Request(int method, String url, ErrorListener listener) {
        this.mEventLog = MarkerLog.ENABLED ? new MarkerLog() : null;
        this.mShouldCache = true;
        this.mCanceled = false;
        this.mResponseDelivered = false;
        this.mRequestBirthTime = 0;
        this.mCacheEntry = null;
        this.mMethod = method;
        this.mUrl = url;
        this.mErrorListener = listener;
        setRetryPolicy(new C0016DefaultRetryPolicy());
        this.mDefaultTrafficStatsTag = findDefaultTrafficStatsTag(url);
    }

    public int getMethod() {
        return this.mMethod;
    }

    public C0024Request<?> setTag(Object tag) {
        this.mTag = tag;
        return this;
    }

    public Object getTag() {
        return this.mTag;
    }

    public int getTrafficStatsTag() {
        return this.mDefaultTrafficStatsTag;
    }

    private static int findDefaultTrafficStatsTag(String url) {
        if (!TextUtils.isEmpty(url)) {
            Uri uri = Uri.parse(url);
            if (uri != null) {
                String host = uri.getHost();
                if (host != null) {
                    return host.hashCode();
                }
            }
        }
        return 0;
    }

    public C0024Request<?> setRetryPolicy(C0028RetryPolicy retryPolicy) {
        this.mRetryPolicy = retryPolicy;
        return this;
    }

    public void addMarker(String tag) {
        if (MarkerLog.ENABLED) {
            this.mEventLog.add(tag, Thread.currentThread().getId());
        } else if (this.mRequestBirthTime == 0) {
            this.mRequestBirthTime = SystemClock.elapsedRealtime();
        }
    }

    /* access modifiers changed from: 0000 */
    public void finish(final String tag) {
        if (this.mRequestQueue != null) {
            this.mRequestQueue.finish(this);
        }
        if (MarkerLog.ENABLED) {
            final long threadId = Thread.currentThread().getId();
            if (Looper.myLooper() != Looper.getMainLooper()) {
                new Handler(Looper.getMainLooper()).post(new Runnable() {
                    public void run() {
                        C0024Request.this.mEventLog.add(str, id);
                        C0024Request.this.mEventLog.finish(toString());
                    }
                });
            } else {
                this.mEventLog.add(tag, threadId);
                this.mEventLog.finish(toString());
            }
        } else {
            long requestTime = SystemClock.elapsedRealtime() - this.mRequestBirthTime;
            if (requestTime >= SLOW_REQUEST_THRESHOLD_MS) {
                C0032VolleyLog.d("%d ms: %s", Long.valueOf(requestTime), toString());
            }
        }
    }

    public C0024Request<?> setRequestQueue(C0025RequestQueue requestQueue) {
        this.mRequestQueue = requestQueue;
        return this;
    }

    public final C0024Request<?> setSequence(int sequence) {
        this.mSequence = Integer.valueOf(sequence);
        return this;
    }

    public final int getSequence() {
        if (this.mSequence != null) {
            return this.mSequence.intValue();
        }
        throw new IllegalStateException("getSequence called before setSequence");
    }

    public String getUrl() {
        return this.mUrl;
    }

    public String getCacheKey() {
        return getUrl();
    }

    public C0024Request<?> setCacheEntry(Entry entry) {
        this.mCacheEntry = entry;
        return this;
    }

    public Entry getCacheEntry() {
        return this.mCacheEntry;
    }

    public void cancel() {
        this.mCanceled = true;
    }

    public boolean isCanceled() {
        return this.mCanceled;
    }

    public Map<String, String> getHeaders() throws C0013AuthFailureError {
        return Collections.emptyMap();
    }

    /* access modifiers changed from: protected */
    @Deprecated
    public Map<String, String> getPostParams() throws C0013AuthFailureError {
        return getParams();
    }

    /* access modifiers changed from: protected */
    @Deprecated
    public String getPostParamsEncoding() {
        return getParamsEncoding();
    }

    @Deprecated
    public String getPostBodyContentType() {
        return getBodyContentType();
    }

    @Deprecated
    public byte[] getPostBody() throws C0013AuthFailureError {
        Map<String, String> postParams = getPostParams();
        if (postParams == null || postParams.size() <= 0) {
            return null;
        }
        return encodeParameters(postParams, getPostParamsEncoding());
    }

    /* access modifiers changed from: protected */
    public Map<String, String> getParams() throws C0013AuthFailureError {
        return null;
    }

    /* access modifiers changed from: protected */
    public String getParamsEncoding() {
        return "UTF-8";
    }

    public String getBodyContentType() {
        StringBuilder sb = new StringBuilder();
        sb.append("application/x-www-form-urlencoded; charset=");
        sb.append(getParamsEncoding());
        return sb.toString();
    }

    public byte[] getBody() throws C0013AuthFailureError {
        Map<String, String> params = getParams();
        if (params == null || params.size() <= 0) {
            return null;
        }
        return encodeParameters(params, getParamsEncoding());
    }

    private byte[] encodeParameters(Map<String, String> params, String paramsEncoding) {
        StringBuilder encodedParams = new StringBuilder();
        try {
            for (Map.Entry<String, String> entry : params.entrySet()) {
                encodedParams.append(URLEncoder.encode((String) entry.getKey(), paramsEncoding));
                encodedParams.append('=');
                encodedParams.append(URLEncoder.encode((String) entry.getValue(), paramsEncoding));
                encodedParams.append('&');
            }
            return encodedParams.toString().getBytes(paramsEncoding);
        } catch (UnsupportedEncodingException uee) {
            StringBuilder sb = new StringBuilder();
            sb.append("Encoding not supported: ");
            sb.append(paramsEncoding);
            throw new RuntimeException(sb.toString(), uee);
        }
    }

    public final C0024Request<?> setShouldCache(boolean shouldCache) {
        this.mShouldCache = shouldCache;
        return this;
    }

    public final boolean shouldCache() {
        return this.mShouldCache;
    }

    public Priority getPriority() {
        return Priority.NORMAL;
    }

    public final int getTimeoutMs() {
        return this.mRetryPolicy.getCurrentTimeout();
    }

    public C0028RetryPolicy getRetryPolicy() {
        return this.mRetryPolicy;
    }

    public void markDelivered() {
        this.mResponseDelivered = true;
    }

    public boolean hasHadResponseDelivered() {
        return this.mResponseDelivered;
    }

    /* access modifiers changed from: protected */
    public C0031VolleyError parseNetworkError(C0031VolleyError volleyError) {
        return volleyError;
    }

    public void deliverError(C0031VolleyError error) {
        if (this.mErrorListener != null) {
            this.mErrorListener.onErrorResponse(error);
        }
    }

    public int compareTo(C0024Request<T> other) {
        int ordinal;
        int ordinal2;
        Priority left = getPriority();
        Priority right = other.getPriority();
        if (left == right) {
            ordinal = this.mSequence.intValue();
            ordinal2 = other.mSequence.intValue();
        } else {
            ordinal = right.ordinal();
            ordinal2 = left.ordinal();
        }
        return ordinal - ordinal2;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("0x");
        sb.append(Integer.toHexString(getTrafficStatsTag()));
        String trafficStatsTag = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.mCanceled ? "[X] " : "[ ] ");
        sb2.append(getUrl());
        sb2.append(" ");
        sb2.append(trafficStatsTag);
        sb2.append(" ");
        sb2.append(getPriority());
        sb2.append(" ");
        sb2.append(this.mSequence);
        return sb2.toString();
    }
}
