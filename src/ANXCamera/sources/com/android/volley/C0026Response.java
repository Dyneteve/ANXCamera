package com.android.volley;

import com.android.volley.C0014Cache.Entry;

/* renamed from: com.android.volley.Response reason: case insensitive filesystem */
public class C0026Response<T> {
    public final Entry cacheEntry;
    public final C0031VolleyError error;
    public boolean intermediate;
    public final T result;

    /* renamed from: com.android.volley.Response$ErrorListener */
    public interface ErrorListener {
        void onErrorResponse(C0031VolleyError volleyError);
    }

    /* renamed from: com.android.volley.Response$Listener */
    public interface Listener<T> {
        void onResponse(T t);
    }

    public static <T> C0026Response<T> success(T result2, Entry cacheEntry2) {
        return new C0026Response<>(result2, cacheEntry2);
    }

    public static <T> C0026Response<T> error(C0031VolleyError error2) {
        return new C0026Response<>(error2);
    }

    public boolean isSuccess() {
        return this.error == null;
    }

    private C0026Response(T result2, Entry cacheEntry2) {
        this.intermediate = false;
        this.result = result2;
        this.cacheEntry = cacheEntry2;
        this.error = null;
    }

    private C0026Response(C0031VolleyError error2) {
        this.intermediate = false;
        this.result = null;
        this.cacheEntry = null;
        this.error = error2;
    }
}
