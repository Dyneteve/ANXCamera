package com.android.camera.network.net.base;

import android.os.Looper;
import com.android.camera.network.net.HttpManager;
import com.android.camera.network.threadpool.ThreadManager;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import java.util.concurrent.CountDownLatch;

public abstract class VolleyRequest<T, E> extends BaseRequest<E> implements ErrorListener, Listener<T> {
    private Request<T> mRequest;
    private CountDownLatch mSyncExecuteLock = null;

    private void releaseSyncExecuteLock() {
        if (this.mSyncExecuteLock != null) {
            this.mSyncExecuteLock.countDown();
            this.mSyncExecuteLock = null;
        }
    }

    public final void cancel() {
        releaseSyncExecuteLock();
        setOnResponseListener(null);
        if (this.mRequest != null) {
            this.mRequest.cancel();
        }
    }

    /* access modifiers changed from: protected */
    public abstract Request<T> createVolleyRequest(Listener<T> listener, ErrorListener errorListener);

    public void execute() {
        this.mRequest = createVolleyRequest(this, this);
        if (this.mRequest != null) {
            this.mRequest.setRetryPolicy(new DefaultRetryPolicy(10000, 1, 1.0f));
            this.mRequest.setShouldCache(isUseCache());
            Object tag = getTag();
            if (this.mRequest.getTag() == null && tag != null) {
                this.mRequest.setTag(tag);
            }
            HttpManager.getInstance().addToRequestQueue(this.mRequest);
        }
    }

    public Object[] executeSync() throws RequestError {
        if (Looper.myLooper() == Looper.getMainLooper() || Looper.myLooper() == ThreadManager.getRequestThreadLooper()) {
            throw new RuntimeException("executeSync could not call on main thread or request thread.");
        }
        this.mSyncExecuteLock = new CountDownLatch(1);
        execute();
        try {
            this.mSyncExecuteLock.await();
        } catch (InterruptedException e) {
        }
        if (this.mRequestError == null) {
            return this.mResponse;
        }
        throw this.mRequestError;
    }

    /* access modifiers changed from: protected */
    public final void handleError(ErrorCode errorCode, String str, Object obj) {
        this.mCacheExpires = -1;
        onRequestError(errorCode, str, obj);
    }

    /* access modifiers changed from: protected */
    public abstract void handleResponse(T t);

    /* JADX WARNING: type inference failed for: r1v1, types: [java.lang.Throwable] */
    /* JADX WARNING: type inference failed for: r3v1, types: [java.lang.Throwable, java.lang.Object] */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Unknown variable types count: 1 */
    public final void onErrorResponse(VolleyError volleyError) {
        ErrorCode errorCode = ErrorCode.NET_ERROR;
        if (volleyError instanceof RequestError) {
            errorCode = ((RequestError) volleyError).getErrorCode();
        }
        ? cause = volleyError.getCause();
        if (cause != 0) {
            volleyError = cause;
        }
        handleError(errorCode, volleyError.getMessage(), volleyError);
        releaseSyncExecuteLock();
    }

    public final void onResponse(T t) {
        handleResponse(t);
        releaseSyncExecuteLock();
        if (this.mRequest instanceof Cacheable) {
            Cacheable cacheable = (Cacheable) this.mRequest;
            if (this.mCacheExpires > 0 && !cacheable.isFromCache()) {
                HttpManager.getInstance().putToCache(this.mRequest.getCacheKey(), cacheable.getData(), this.mCacheExpires, this.mCacheSoftTtl);
            }
        }
    }
}
