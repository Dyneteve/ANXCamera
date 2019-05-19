package com.android.volley;

import android.annotation.TargetApi;
import android.net.TrafficStats;
import android.os.Build.VERSION;
import android.os.Process;
import java.util.concurrent.BlockingQueue;

/* renamed from: com.android.volley.NetworkDispatcher reason: case insensitive filesystem */
public class C0019NetworkDispatcher extends Thread {
    private final C0014Cache mCache;
    private final C0027ResponseDelivery mDelivery;
    private final C0018Network mNetwork;
    private final BlockingQueue<C0024Request<?>> mQueue;
    private volatile boolean mQuit = false;

    public C0019NetworkDispatcher(BlockingQueue<C0024Request<?>> queue, C0018Network network, C0014Cache cache, C0027ResponseDelivery delivery) {
        this.mQueue = queue;
        this.mNetwork = network;
        this.mCache = cache;
        this.mDelivery = delivery;
    }

    public void quit() {
        this.mQuit = true;
        interrupt();
    }

    @TargetApi(14)
    private void addTrafficStatsTag(C0024Request<?> request) {
        if (VERSION.SDK_INT >= 14) {
            TrafficStats.setThreadStatsTag(request.getTrafficStatsTag());
        }
    }

    public void run() {
        Process.setThreadPriority(10);
        while (true) {
            try {
                C0024Request request = (C0024Request) this.mQueue.take();
                try {
                    request.addMarker("network-queue-take");
                    if (request.isCanceled()) {
                        request.finish("network-discard-cancelled");
                    } else {
                        addTrafficStatsTag(request);
                        C0021NetworkResponse networkResponse = this.mNetwork.performRequest(request);
                        request.addMarker("network-http-complete");
                        if (!networkResponse.notModified || !request.hasHadResponseDelivered()) {
                            C0026Response<?> response = request.parseNetworkResponse(networkResponse);
                            request.addMarker("network-parse-complete");
                            if (request.shouldCache() && response.cacheEntry != null) {
                                this.mCache.put(request.getCacheKey(), response.cacheEntry);
                                request.addMarker("network-cache-written");
                            }
                            request.markDelivered();
                            this.mDelivery.postResponse(request, response);
                        } else {
                            request.finish("not-modified");
                        }
                    }
                } catch (C0031VolleyError volleyError) {
                    parseAndDeliverNetworkError(request, volleyError);
                } catch (Exception e) {
                    C0032VolleyLog.e(e, "Unhandled exception %s", e.toString());
                    this.mDelivery.postError(request, new C0031VolleyError((Throwable) e));
                }
            } catch (InterruptedException e2) {
                if (this.mQuit) {
                    return;
                }
            }
        }
    }

    private void parseAndDeliverNetworkError(C0024Request<?> request, C0031VolleyError error) {
        this.mDelivery.postError(request, request.parseNetworkError(error));
    }
}
