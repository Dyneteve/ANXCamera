package com.android.volley;

import com.android.volley.C0018Cache.Entry;

/* renamed from: com.android.volley.Response reason: case insensitive filesystem */
public class C0030Response<T> {
    public final Entry cacheEntry;
    public final C0035VolleyError error;
    public boolean intermediate;
    public final T result;

    /* renamed from: com.android.volley.Response$ErrorListener */
    public interface ErrorListener {
        void onErrorResponse(C0035VolleyError volleyError);
    }

    /* renamed from: com.android.volley.Response$Listener */
    public interface Listener<T> {
        void onResponse(T t);
    }

    private C0030Response(C0035VolleyError volleyError) {
        this.intermediate = false;
        this.result = null;
        this.cacheEntry = null;
        this.error = volleyError;
    }

    private C0030Response(T t, Entry entry) {
        this.intermediate = false;
        this.result = t;
        this.cacheEntry = entry;
        this.error = null;
    }

    public static <T> C0030Response<T> error(C0035VolleyError volleyError) {
        return new C0030Response<>(volleyError);
    }

    public static <T> C0030Response<T> success(T t, Entry entry) {
        return new C0030Response<>(t, entry);
    }

    public boolean isSuccess() {
        return this.error == null;
    }
}
