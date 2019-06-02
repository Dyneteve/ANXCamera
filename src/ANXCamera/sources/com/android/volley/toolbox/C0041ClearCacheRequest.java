package com.android.volley.toolbox;

import android.os.Handler;
import android.os.Looper;
import com.android.volley.C0018Cache;
import com.android.volley.C0025NetworkResponse;
import com.android.volley.C0028Request;
import com.android.volley.C0028Request.Priority;
import com.android.volley.C0030Response;

/* renamed from: com.android.volley.toolbox.ClearCacheRequest reason: case insensitive filesystem */
public class C0041ClearCacheRequest extends C0028Request<Object> {
    private final C0018Cache mCache;
    private final Runnable mCallback;

    public C0041ClearCacheRequest(C0018Cache cache, Runnable runnable) {
        super(0, null, null);
        this.mCache = cache;
        this.mCallback = runnable;
    }

    /* access modifiers changed from: protected */
    public void deliverResponse(Object obj) {
    }

    public Priority getPriority() {
        return Priority.IMMEDIATE;
    }

    public boolean isCanceled() {
        this.mCache.clear();
        if (this.mCallback != null) {
            new Handler(Looper.getMainLooper()).postAtFrontOfQueue(this.mCallback);
        }
        return true;
    }

    /* access modifiers changed from: protected */
    public C0030Response<Object> parseNetworkResponse(C0025NetworkResponse networkResponse) {
        return null;
    }
}
