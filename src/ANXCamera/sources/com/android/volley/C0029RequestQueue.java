package com.android.volley;

import android.os.Handler;
import android.os.Looper;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.atomic.AtomicInteger;

/* renamed from: com.android.volley.RequestQueue reason: case insensitive filesystem */
public class C0029RequestQueue {
    private static final int DEFAULT_NETWORK_THREAD_POOL_SIZE = 4;
    private final C0018Cache mCache;
    private C0019CacheDispatcher mCacheDispatcher;
    private final PriorityBlockingQueue<C0028Request<?>> mCacheQueue;
    private final Set<C0028Request<?>> mCurrentRequests;
    private final C0031ResponseDelivery mDelivery;
    private C0023NetworkDispatcher[] mDispatchers;
    private final C0022Network mNetwork;
    private final PriorityBlockingQueue<C0028Request<?>> mNetworkQueue;
    private AtomicInteger mSequenceGenerator;
    private final Map<String, Queue<C0028Request<?>>> mWaitingRequests;

    /* renamed from: com.android.volley.RequestQueue$RequestFilter */
    public interface RequestFilter {
        boolean apply(C0028Request<?> request);
    }

    public C0029RequestQueue(C0018Cache cache, C0022Network network) {
        this(cache, network, 4);
    }

    public C0029RequestQueue(C0018Cache cache, C0022Network network, int i) {
        this(cache, network, i, new C0021ExecutorDelivery(new Handler(Looper.getMainLooper())));
    }

    public C0029RequestQueue(C0018Cache cache, C0022Network network, int i, C0031ResponseDelivery responseDelivery) {
        this.mSequenceGenerator = new AtomicInteger();
        this.mWaitingRequests = new HashMap();
        this.mCurrentRequests = new HashSet();
        this.mCacheQueue = new PriorityBlockingQueue<>();
        this.mNetworkQueue = new PriorityBlockingQueue<>();
        this.mCache = cache;
        this.mNetwork = network;
        this.mDispatchers = new C0023NetworkDispatcher[i];
        this.mDelivery = responseDelivery;
    }

    public <T> C0028Request<T> add(C0028Request<T> request) {
        request.setRequestQueue(this);
        synchronized (this.mCurrentRequests) {
            this.mCurrentRequests.add(request);
        }
        request.setSequence(getSequenceNumber());
        request.addMarker("add-to-queue");
        if (!request.shouldCache()) {
            this.mNetworkQueue.add(request);
            return request;
        }
        synchronized (this.mWaitingRequests) {
            String cacheKey = request.getCacheKey();
            if (this.mWaitingRequests.containsKey(cacheKey)) {
                Queue queue = (Queue) this.mWaitingRequests.get(cacheKey);
                if (queue == null) {
                    queue = new LinkedList();
                }
                queue.add(request);
                this.mWaitingRequests.put(cacheKey, queue);
                if (C0036VolleyLog.DEBUG) {
                    C0036VolleyLog.v("Request for cacheKey=%s is in flight, putting on hold.", cacheKey);
                }
            } else {
                this.mWaitingRequests.put(cacheKey, null);
                this.mCacheQueue.add(request);
            }
        }
        return request;
    }

    public void cancelAll(RequestFilter requestFilter) {
        synchronized (this.mCurrentRequests) {
            for (C0028Request request : this.mCurrentRequests) {
                if (requestFilter.apply(request)) {
                    request.cancel();
                }
            }
        }
    }

    public void cancelAll(final Object obj) {
        if (obj != null) {
            cancelAll((RequestFilter) new RequestFilter() {
                public boolean apply(C0028Request<?> request) {
                    return request.getTag() == obj;
                }
            });
            return;
        }
        throw new IllegalArgumentException("Cannot cancelAll with a null tag");
    }

    /* access modifiers changed from: 0000 */
    public void finish(C0028Request<?> request) {
        synchronized (this.mCurrentRequests) {
            this.mCurrentRequests.remove(request);
        }
        if (request.shouldCache()) {
            synchronized (this.mWaitingRequests) {
                String cacheKey = request.getCacheKey();
                Queue queue = (Queue) this.mWaitingRequests.remove(cacheKey);
                if (queue != null) {
                    if (C0036VolleyLog.DEBUG) {
                        C0036VolleyLog.v("Releasing %d waiting requests for cacheKey=%s.", Integer.valueOf(queue.size()), cacheKey);
                    }
                    this.mCacheQueue.addAll(queue);
                }
            }
        }
    }

    public C0018Cache getCache() {
        return this.mCache;
    }

    public int getSequenceNumber() {
        return this.mSequenceGenerator.incrementAndGet();
    }

    public void start() {
        stop();
        this.mCacheDispatcher = new C0019CacheDispatcher(this.mCacheQueue, this.mNetworkQueue, this.mCache, this.mDelivery);
        this.mCacheDispatcher.start();
        for (int i = 0; i < this.mDispatchers.length; i++) {
            C0023NetworkDispatcher networkDispatcher = new C0023NetworkDispatcher(this.mNetworkQueue, this.mNetwork, this.mCache, this.mDelivery);
            this.mDispatchers[i] = networkDispatcher;
            networkDispatcher.start();
        }
    }

    public void stop() {
        if (this.mCacheDispatcher != null) {
            this.mCacheDispatcher.quit();
        }
        for (int i = 0; i < this.mDispatchers.length; i++) {
            if (this.mDispatchers[i] != null) {
                this.mDispatchers[i].quit();
            }
        }
    }
}
