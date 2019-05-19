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
public class C0025RequestQueue {
    private static final int DEFAULT_NETWORK_THREAD_POOL_SIZE = 4;
    private final C0014Cache mCache;
    private C0015CacheDispatcher mCacheDispatcher;
    private final PriorityBlockingQueue<C0024Request<?>> mCacheQueue;
    private final Set<C0024Request<?>> mCurrentRequests;
    private final C0027ResponseDelivery mDelivery;
    private C0019NetworkDispatcher[] mDispatchers;
    private final C0018Network mNetwork;
    private final PriorityBlockingQueue<C0024Request<?>> mNetworkQueue;
    private AtomicInteger mSequenceGenerator;
    private final Map<String, Queue<C0024Request<?>>> mWaitingRequests;

    /* renamed from: com.android.volley.RequestQueue$RequestFilter */
    public interface RequestFilter {
        boolean apply(C0024Request<?> request);
    }

    public C0025RequestQueue(C0014Cache cache, C0018Network network, int threadPoolSize, C0027ResponseDelivery delivery) {
        this.mSequenceGenerator = new AtomicInteger();
        this.mWaitingRequests = new HashMap();
        this.mCurrentRequests = new HashSet();
        this.mCacheQueue = new PriorityBlockingQueue<>();
        this.mNetworkQueue = new PriorityBlockingQueue<>();
        this.mCache = cache;
        this.mNetwork = network;
        this.mDispatchers = new C0019NetworkDispatcher[threadPoolSize];
        this.mDelivery = delivery;
    }

    public C0025RequestQueue(C0014Cache cache, C0018Network network, int threadPoolSize) {
        this(cache, network, threadPoolSize, new C0017ExecutorDelivery(new Handler(Looper.getMainLooper())));
    }

    public C0025RequestQueue(C0014Cache cache, C0018Network network) {
        this(cache, network, 4);
    }

    public void start() {
        stop();
        this.mCacheDispatcher = new C0015CacheDispatcher(this.mCacheQueue, this.mNetworkQueue, this.mCache, this.mDelivery);
        this.mCacheDispatcher.start();
        for (int i = 0; i < this.mDispatchers.length; i++) {
            C0019NetworkDispatcher networkDispatcher = new C0019NetworkDispatcher(this.mNetworkQueue, this.mNetwork, this.mCache, this.mDelivery);
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

    public int getSequenceNumber() {
        return this.mSequenceGenerator.incrementAndGet();
    }

    public C0014Cache getCache() {
        return this.mCache;
    }

    public void cancelAll(RequestFilter filter) {
        synchronized (this.mCurrentRequests) {
            for (C0024Request<?> request : this.mCurrentRequests) {
                if (filter.apply(request)) {
                    request.cancel();
                }
            }
        }
    }

    public void cancelAll(final Object tag) {
        if (tag != null) {
            cancelAll((RequestFilter) new RequestFilter() {
                public boolean apply(C0024Request<?> request) {
                    return request.getTag() == obj;
                }
            });
            return;
        }
        throw new IllegalArgumentException("Cannot cancelAll with a null tag");
    }

    public <T> C0024Request<T> add(C0024Request<T> request) {
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
                if (C0032VolleyLog.DEBUG) {
                    C0032VolleyLog.v("Request for cacheKey=%s is in flight, putting on hold.", cacheKey);
                }
            } else {
                this.mWaitingRequests.put(cacheKey, null);
                this.mCacheQueue.add(request);
            }
        }
        return request;
    }

    /* access modifiers changed from: 0000 */
    public void finish(C0024Request<?> request) {
        synchronized (this.mCurrentRequests) {
            this.mCurrentRequests.remove(request);
        }
        if (request.shouldCache()) {
            synchronized (this.mWaitingRequests) {
                String cacheKey = request.getCacheKey();
                Queue<C0024Request<?>> waitingRequests = (Queue) this.mWaitingRequests.remove(cacheKey);
                if (waitingRequests != null) {
                    if (C0032VolleyLog.DEBUG) {
                        C0032VolleyLog.v("Releasing %d waiting requests for cacheKey=%s.", Integer.valueOf(waitingRequests.size()), cacheKey);
                    }
                    this.mCacheQueue.addAll(waitingRequests);
                }
            }
        }
    }
}
