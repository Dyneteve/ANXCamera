package com.android.camera.network.net.base;

import android.text.TextUtils;
import java.util.HashMap;
import java.util.Map;

public abstract class BaseRequest<T> implements ResponseErrorHandler {
    private static ResponseErrorHandler mAppResponseErrorHandler;
    protected long mCacheExpires = -1;
    protected long mCacheSoftTtl = -1;
    private ResponseDispatcher mListenerDispatcher = null;
    protected Map<String, String> mParams;
    protected RequestError mRequestError;
    protected Object[] mResponse;
    private Object mTag = null;
    private boolean mUseCache = false;

    public static void setAppResponseErrorHandler(ResponseErrorHandler responseErrorHandler) {
        mAppResponseErrorHandler = responseErrorHandler;
    }

    public final BaseRequest<T> addParam(String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            return this;
        }
        if (this.mParams == null) {
            this.mParams = new HashMap();
        }
        if (str2 == null) {
            str2 = "";
        }
        this.mParams.put(str, str2);
        return this;
    }

    public abstract void cancel();

    /* access modifiers changed from: protected */
    public void deliverError(ErrorCode errorCode, String str, Object obj) {
        this.mRequestError = new RequestError(errorCode, str, obj);
        if (this.mListenerDispatcher != null) {
            this.mListenerDispatcher.onResponseError(errorCode, str, obj);
        }
        if (mAppResponseErrorHandler != null) {
            mAppResponseErrorHandler.onRequestError(errorCode, str, obj);
        }
    }

    /* access modifiers changed from: protected */
    public void deliverResponse(Object... objArr) {
        this.mResponse = objArr;
        if (this.mListenerDispatcher != null) {
            this.mListenerDispatcher.onResponse(objArr);
        }
    }

    public abstract void execute();

    public final void execute(ResponseListener responseListener) {
        setOnResponseListener(responseListener);
        execute();
    }

    public abstract Object[] executeSync() throws RequestError;

    public RequestError getRequestError() {
        return this.mRequestError;
    }

    public Object[] getResponse() {
        return this.mResponse;
    }

    public Object getTag() {
        return this.mTag;
    }

    /* access modifiers changed from: protected */
    public final boolean isUseCache() {
        return this.mUseCache;
    }

    public abstract void onRequestError(ErrorCode errorCode, String str, Object obj);

    /* access modifiers changed from: protected */
    public abstract void onRequestSuccess(T t) throws Exception;

    public final BaseRequest<T> setCacheExpires(long j) {
        this.mCacheExpires = j;
        return this;
    }

    public final BaseRequest<T> setCacheSoftTtl(long j) {
        this.mCacheSoftTtl = j;
        return this;
    }

    public final BaseRequest<T> setOnResponseListener(ResponseListener responseListener) {
        this.mListenerDispatcher = new ResponseDispatcher(responseListener);
        return this;
    }

    public BaseRequest<T> setTag(Object obj) {
        this.mTag = obj;
        return this;
    }

    public final BaseRequest<T> setUseCache(boolean z) {
        this.mUseCache = z;
        return this;
    }

    public final <T> T simpleExecuteSync() throws RequestError {
        T[] executeSync = executeSync();
        if (executeSync == null || executeSync.length <= 0) {
            return null;
        }
        return executeSync[0];
    }
}
