package com.android.volley.toolbox;

import com.android.volley.C0028Request;
import com.android.volley.C0030Response.ErrorListener;
import com.android.volley.C0030Response.Listener;
import com.android.volley.C0035VolleyError;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/* renamed from: com.android.volley.toolbox.RequestFuture reason: case insensitive filesystem */
public class C0055RequestFuture<T> implements Future<T>, Listener<T>, ErrorListener {
    private C0035VolleyError mException;
    private C0028Request<?> mRequest;
    private T mResult;
    private boolean mResultReceived = false;

    private C0055RequestFuture() {
    }

    private synchronized T doGet(Long l) throws InterruptedException, ExecutionException, TimeoutException {
        if (this.mException != null) {
            throw new ExecutionException(this.mException);
        } else if (this.mResultReceived) {
            return this.mResult;
        } else {
            if (l == null) {
                wait(0);
            } else if (l.longValue() > 0) {
                wait(l.longValue());
            }
            if (this.mException != null) {
                throw new ExecutionException(this.mException);
            } else if (this.mResultReceived) {
                return this.mResult;
            } else {
                throw new TimeoutException();
            }
        }
    }

    public static <E> C0055RequestFuture<E> newFuture() {
        return new C0055RequestFuture<>();
    }

    public synchronized boolean cancel(boolean z) {
        if (this.mRequest == null) {
            return false;
        }
        if (isDone()) {
            return false;
        }
        this.mRequest.cancel();
        return true;
    }

    public T get() throws InterruptedException, ExecutionException {
        try {
            return doGet(null);
        } catch (TimeoutException e) {
            throw new AssertionError(e);
        }
    }

    public T get(long j, TimeUnit timeUnit) throws InterruptedException, ExecutionException, TimeoutException {
        return doGet(Long.valueOf(TimeUnit.MILLISECONDS.convert(j, timeUnit)));
    }

    public boolean isCancelled() {
        if (this.mRequest == null) {
            return false;
        }
        return this.mRequest.isCanceled();
    }

    public synchronized boolean isDone() {
        boolean z;
        z = this.mResultReceived || this.mException != null || isCancelled();
        return z;
    }

    public synchronized void onErrorResponse(C0035VolleyError volleyError) {
        this.mException = volleyError;
        notifyAll();
    }

    public synchronized void onResponse(T t) {
        this.mResultReceived = true;
        this.mResult = t;
        notifyAll();
    }

    public void setRequest(C0028Request<?> request) {
        this.mRequest = request;
    }
}
