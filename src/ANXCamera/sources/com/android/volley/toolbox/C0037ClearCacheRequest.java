package com.android.volley.toolbox;

import android.os.Handler;
import android.os.Looper;
import com.android.volley.C0014Cache;
import com.android.volley.C0021NetworkResponse;
import com.android.volley.C0024Request;
import com.android.volley.C0024Request.Priority;
import com.android.volley.C0026Response;

/* renamed from: com.android.volley.toolbox.ClearCacheRequest reason: case insensitive filesystem */
public class C0037ClearCacheRequest extends C0024Request<Object> {
    private final C0014Cache mCache;
    private final Runnable mCallback;

    public C0037ClearCacheRequest(C0014Cache cache, Runnable callback) {
        super(0, null, null);
        this.mCache = cache;
        this.mCallback = callback;
    }

    public boolean isCanceled() {
        this.mCache.clear();
        if (this.mCallback != null) {
            new Handler(Looper.getMainLooper()).postAtFrontOfQueue(this.mCallback);
        }
        return true;
    }

    public Priority getPriority() {
        return Priority.IMMEDIATE;
    }

    /* access modifiers changed from: protected */
    public C0026Response<Object> parseNetworkResponse(C0021NetworkResponse response) {
        return null;
    }

    /* access modifiers changed from: protected */
    public void deliverResponse(Object response) {
    }
}
