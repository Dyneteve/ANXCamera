package com.android.volley;

import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.TextUtils;
import com.android.volley.C0018Cache.Entry;
import com.android.volley.C0030Response.ErrorListener;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.Map;

/* renamed from: com.android.volley.Request reason: case insensitive filesystem */
public abstract class C0028Request<T> implements Comparable<C0028Request<T>> {
    private static final String DEFAULT_PARAMS_ENCODING = "UTF-8";
    private static final long SLOW_REQUEST_THRESHOLD_MS = 3000;
    private Entry mCacheEntry;
    private boolean mCanceled;
    private final int mDefaultTrafficStatsTag;
    private final ErrorListener mErrorListener;
    private final MarkerLog mEventLog;
    private final int mMethod;
    private long mRequestBirthTime;
    private C0029RequestQueue mRequestQueue;
    private boolean mResponseDelivered;
    private C0032RetryPolicy mRetryPolicy;
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

    public C0028Request(int i, String str, ErrorListener errorListener) {
        this.mEventLog = MarkerLog.ENABLED ? new MarkerLog() : null;
        this.mShouldCache = true;
        this.mCanceled = false;
        this.mResponseDelivered = false;
        this.mRequestBirthTime = 0;
        this.mCacheEntry = null;
        this.mMethod = i;
        this.mUrl = str;
        this.mErrorListener = errorListener;
        setRetryPolicy(new C0020DefaultRetryPolicy());
        this.mDefaultTrafficStatsTag = findDefaultTrafficStatsTag(str);
    }

    @Deprecated
    public C0028Request(String str, ErrorListener errorListener) {
        this(-1, str, errorListener);
    }

    private byte[] encodeParameters(Map<String, String> map, String str) {
        StringBuilder sb = new StringBuilder();
        try {
            for (Map.Entry entry : map.entrySet()) {
                sb.append(URLEncoder.encode((String) entry.getKey(), str));
                sb.append('=');
                sb.append(URLEncoder.encode((String) entry.getValue(), str));
                sb.append('&');
            }
            return sb.toString().getBytes(str);
        } catch (UnsupportedEncodingException e) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Encoding not supported: ");
            sb2.append(str);
            throw new RuntimeException(sb2.toString(), e);
        }
    }

    private static int findDefaultTrafficStatsTag(String str) {
        if (!TextUtils.isEmpty(str)) {
            Uri parse = Uri.parse(str);
            if (parse != null) {
                String host = parse.getHost();
                if (host != null) {
                    return host.hashCode();
                }
            }
        }
        return 0;
    }

    public void addMarker(String str) {
        if (MarkerLog.ENABLED) {
            this.mEventLog.add(str, Thread.currentThread().getId());
        } else if (this.mRequestBirthTime == 0) {
            this.mRequestBirthTime = SystemClock.elapsedRealtime();
        }
    }

    public void cancel() {
        this.mCanceled = true;
    }

    public int compareTo(C0028Request<T> request) {
        int ordinal;
        int ordinal2;
        Priority priority = getPriority();
        Priority priority2 = request.getPriority();
        if (priority == priority2) {
            ordinal = this.mSequence.intValue();
            ordinal2 = request.mSequence.intValue();
        } else {
            ordinal = priority2.ordinal();
            ordinal2 = priority.ordinal();
        }
        return ordinal - ordinal2;
    }

    public void deliverError(C0035VolleyError volleyError) {
        if (this.mErrorListener != null) {
            this.mErrorListener.onErrorResponse(volleyError);
        }
    }

    public abstract void deliverResponse(T t);

    /* access modifiers changed from: 0000 */
    public void finish(final String str) {
        if (this.mRequestQueue != null) {
            this.mRequestQueue.finish(this);
        }
        if (MarkerLog.ENABLED) {
            final long id = Thread.currentThread().getId();
            if (Looper.myLooper() != Looper.getMainLooper()) {
                new Handler(Looper.getMainLooper()).post(new Runnable() {
                    public void run() {
                        C0028Request.this.mEventLog.add(str, id);
                        C0028Request.this.mEventLog.finish(toString());
                    }
                });
            } else {
                this.mEventLog.add(str, id);
                this.mEventLog.finish(toString());
            }
        } else {
            long elapsedRealtime = SystemClock.elapsedRealtime() - this.mRequestBirthTime;
            if (elapsedRealtime >= SLOW_REQUEST_THRESHOLD_MS) {
                C0036VolleyLog.d("%d ms: %s", Long.valueOf(elapsedRealtime), toString());
            }
        }
    }

    public byte[] getBody() throws C0017AuthFailureError {
        Map params = getParams();
        if (params == null || params.size() <= 0) {
            return null;
        }
        return encodeParameters(params, getParamsEncoding());
    }

    public String getBodyContentType() {
        StringBuilder sb = new StringBuilder();
        sb.append("application/x-www-form-urlencoded; charset=");
        sb.append(getParamsEncoding());
        return sb.toString();
    }

    public Entry getCacheEntry() {
        return this.mCacheEntry;
    }

    public String getCacheKey() {
        return getUrl();
    }

    public Map<String, String> getHeaders() throws C0017AuthFailureError {
        return Collections.emptyMap();
    }

    public int getMethod() {
        return this.mMethod;
    }

    /* access modifiers changed from: protected */
    public Map<String, String> getParams() throws C0017AuthFailureError {
        return null;
    }

    /* access modifiers changed from: protected */
    public String getParamsEncoding() {
        return "UTF-8";
    }

    @Deprecated
    public byte[] getPostBody() throws C0017AuthFailureError {
        Map postParams = getPostParams();
        if (postParams == null || postParams.size() <= 0) {
            return null;
        }
        return encodeParameters(postParams, getPostParamsEncoding());
    }

    @Deprecated
    public String getPostBodyContentType() {
        return getBodyContentType();
    }

    /* access modifiers changed from: protected */
    @Deprecated
    public Map<String, String> getPostParams() throws C0017AuthFailureError {
        return getParams();
    }

    /* access modifiers changed from: protected */
    @Deprecated
    public String getPostParamsEncoding() {
        return getParamsEncoding();
    }

    public Priority getPriority() {
        return Priority.NORMAL;
    }

    public C0032RetryPolicy getRetryPolicy() {
        return this.mRetryPolicy;
    }

    public final int getSequence() {
        if (this.mSequence != null) {
            return this.mSequence.intValue();
        }
        throw new IllegalStateException("getSequence called before setSequence");
    }

    public Object getTag() {
        return this.mTag;
    }

    public final int getTimeoutMs() {
        return this.mRetryPolicy.getCurrentTimeout();
    }

    public int getTrafficStatsTag() {
        return this.mDefaultTrafficStatsTag;
    }

    public String getUrl() {
        return this.mUrl;
    }

    public boolean hasHadResponseDelivered() {
        return this.mResponseDelivered;
    }

    public boolean isCanceled() {
        return this.mCanceled;
    }

    public void markDelivered() {
        this.mResponseDelivered = true;
    }

    /* access modifiers changed from: protected */
    public C0035VolleyError parseNetworkError(C0035VolleyError volleyError) {
        return volleyError;
    }

    public abstract C0030Response<T> parseNetworkResponse(C0025NetworkResponse networkResponse);

    public C0028Request<?> setCacheEntry(Entry entry) {
        this.mCacheEntry = entry;
        return this;
    }

    public C0028Request<?> setRequestQueue(C0029RequestQueue requestQueue) {
        this.mRequestQueue = requestQueue;
        return this;
    }

    public C0028Request<?> setRetryPolicy(C0032RetryPolicy retryPolicy) {
        this.mRetryPolicy = retryPolicy;
        return this;
    }

    public final C0028Request<?> setSequence(int i) {
        this.mSequence = Integer.valueOf(i);
        return this;
    }

    public final C0028Request<?> setShouldCache(boolean z) {
        this.mShouldCache = z;
        return this;
    }

    public C0028Request<?> setTag(Object obj) {
        this.mTag = obj;
        return this;
    }

    public final boolean shouldCache() {
        return this.mShouldCache;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("0x");
        sb.append(Integer.toHexString(getTrafficStatsTag()));
        String sb2 = sb.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append(this.mCanceled ? "[X] " : "[ ] ");
        sb3.append(getUrl());
        sb3.append(" ");
        sb3.append(sb2);
        sb3.append(" ");
        sb3.append(getPriority());
        sb3.append(" ");
        sb3.append(this.mSequence);
        return sb3.toString();
    }
}
