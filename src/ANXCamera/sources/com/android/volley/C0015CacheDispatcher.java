package com.android.volley;

import android.os.Process;
import com.android.volley.C0014Cache.Entry;
import java.util.concurrent.BlockingQueue;

/* renamed from: com.android.volley.CacheDispatcher reason: case insensitive filesystem */
public class C0015CacheDispatcher extends Thread {
    private static final boolean DEBUG = C0032VolleyLog.DEBUG;
    private final C0014Cache mCache;
    private final BlockingQueue<C0024Request<?>> mCacheQueue;
    private final C0027ResponseDelivery mDelivery;
    private final BlockingQueue<C0024Request<?>> mNetworkQueue;
    private volatile boolean mQuit = false;

    public C0015CacheDispatcher(BlockingQueue<C0024Request<?>> cacheQueue, BlockingQueue<C0024Request<?>> networkQueue, C0014Cache cache, C0027ResponseDelivery delivery) {
        this.mCacheQueue = cacheQueue;
        this.mNetworkQueue = networkQueue;
        this.mCache = cache;
        this.mDelivery = delivery;
    }

    public void quit() {
        this.mQuit = true;
        interrupt();
    }

    public void run() {
        if (DEBUG) {
            C0032VolleyLog.v("start new dispatcher", new Object[0]);
        }
        Process.setThreadPriority(10);
        this.mCache.initialize();
        while (true) {
            try {
                final C0024Request<?> request = (C0024Request) this.mCacheQueue.take();
                request.addMarker("cache-queue-take");
                if (request.isCanceled()) {
                    request.finish("cache-discard-canceled");
                } else {
                    Entry entry = this.mCache.get(request.getCacheKey());
                    if (entry == null) {
                        request.addMarker("cache-miss");
                        this.mNetworkQueue.put(request);
                    } else if (entry.isExpired()) {
                        request.addMarker("cache-hit-expired");
                        request.setCacheEntry(entry);
                        this.mNetworkQueue.put(request);
                    } else {
                        request.addMarker("cache-hit");
                        C0026Response<?> response = request.parseNetworkResponse(new C0021NetworkResponse(entry.data, entry.responseHeaders));
                        request.addMarker("cache-hit-parsed");
                        if (!entry.refreshNeeded()) {
                            this.mDelivery.postResponse(request, response);
                        } else {
                            request.addMarker("cache-hit-refresh-needed");
                            request.setCacheEntry(entry);
                            response.intermediate = true;
                            this.mDelivery.postResponse(request, response, new Runnable() {
                                public void run() {
                                    try {
                                        C0015CacheDispatcher.access$000(C0015CacheDispatcher.this).put(request);
                                    } catch (InterruptedException e) {
                                    }
                                }
                            });
                        }
                    }
                }
            } catch (InterruptedException e) {
                if (this.mQuit) {
                    return;
                }
            }
        }
    }
}
