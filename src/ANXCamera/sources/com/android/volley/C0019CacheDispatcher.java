package com.android.volley;

import android.os.Process;
import com.android.volley.C0018Cache.Entry;
import java.util.concurrent.BlockingQueue;

/* renamed from: com.android.volley.CacheDispatcher reason: case insensitive filesystem */
public class C0019CacheDispatcher extends Thread {
    private static final boolean DEBUG = C0036VolleyLog.DEBUG;
    private final C0018Cache mCache;
    private final BlockingQueue<C0028Request<?>> mCacheQueue;
    private final C0031ResponseDelivery mDelivery;
    private final BlockingQueue<C0028Request<?>> mNetworkQueue;
    private volatile boolean mQuit = false;

    public C0019CacheDispatcher(BlockingQueue<C0028Request<?>> blockingQueue, BlockingQueue<C0028Request<?>> blockingQueue2, C0018Cache cache, C0031ResponseDelivery responseDelivery) {
        this.mCacheQueue = blockingQueue;
        this.mNetworkQueue = blockingQueue2;
        this.mCache = cache;
        this.mDelivery = responseDelivery;
    }

    public void quit() {
        this.mQuit = true;
        interrupt();
    }

    public void run() {
        if (DEBUG) {
            C0036VolleyLog.v("start new dispatcher", new Object[0]);
        }
        Process.setThreadPriority(10);
        this.mCache.initialize();
        while (true) {
            try {
                final C0028Request request = (C0028Request) this.mCacheQueue.take();
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
                        C0030Response parseNetworkResponse = request.parseNetworkResponse(new C0025NetworkResponse(entry.data, entry.responseHeaders));
                        request.addMarker("cache-hit-parsed");
                        if (!entry.refreshNeeded()) {
                            this.mDelivery.postResponse(request, parseNetworkResponse);
                        } else {
                            request.addMarker("cache-hit-refresh-needed");
                            request.setCacheEntry(entry);
                            parseNetworkResponse.intermediate = true;
                            this.mDelivery.postResponse(request, parseNetworkResponse, new Runnable() {
                                public void run() {
                                    try {
                                        C0019CacheDispatcher.access$000(C0019CacheDispatcher.this).put(request);
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
