package com.android.volley;

import android.annotation.TargetApi;
import android.net.TrafficStats;
import android.os.Build.VERSION;
import android.os.Process;
import java.util.concurrent.BlockingQueue;

/* renamed from: com.android.volley.NetworkDispatcher reason: case insensitive filesystem */
public class C0023NetworkDispatcher extends Thread {
    private final C0018Cache mCache;
    private final C0031ResponseDelivery mDelivery;
    private final C0022Network mNetwork;
    private final BlockingQueue<C0028Request<?>> mQueue;
    private volatile boolean mQuit = false;

    public C0023NetworkDispatcher(BlockingQueue<C0028Request<?>> blockingQueue, C0022Network network, C0018Cache cache, C0031ResponseDelivery responseDelivery) {
        this.mQueue = blockingQueue;
        this.mNetwork = network;
        this.mCache = cache;
        this.mDelivery = responseDelivery;
    }

    @TargetApi(14)
    private void addTrafficStatsTag(C0028Request<?> request) {
        if (VERSION.SDK_INT >= 14) {
            TrafficStats.setThreadStatsTag(request.getTrafficStatsTag());
        }
    }

    private void parseAndDeliverNetworkError(C0028Request<?> request, C0035VolleyError volleyError) {
        this.mDelivery.postError(request, request.parseNetworkError(volleyError));
    }

    public void quit() {
        this.mQuit = true;
        interrupt();
    }

    public void run() {
        Process.setThreadPriority(10);
        while (true) {
            try {
                C0028Request request = (C0028Request) this.mQueue.take();
                try {
                    request.addMarker("network-queue-take");
                    if (request.isCanceled()) {
                        request.finish("network-discard-cancelled");
                    } else {
                        addTrafficStatsTag(request);
                        C0025NetworkResponse performRequest = this.mNetwork.performRequest(request);
                        request.addMarker("network-http-complete");
                        if (!performRequest.notModified || !request.hasHadResponseDelivered()) {
                            C0030Response parseNetworkResponse = request.parseNetworkResponse(performRequest);
                            request.addMarker("network-parse-complete");
                            if (request.shouldCache() && parseNetworkResponse.cacheEntry != null) {
                                this.mCache.put(request.getCacheKey(), parseNetworkResponse.cacheEntry);
                                request.addMarker("network-cache-written");
                            }
                            request.markDelivered();
                            this.mDelivery.postResponse(request, parseNetworkResponse);
                        } else {
                            request.finish("not-modified");
                        }
                    }
                } catch (C0035VolleyError e) {
                    parseAndDeliverNetworkError(request, e);
                } catch (Exception e2) {
                    C0036VolleyLog.e(e2, "Unhandled exception %s", e2.toString());
                    this.mDelivery.postError(request, new C0035VolleyError((Throwable) e2));
                }
            } catch (InterruptedException e3) {
                if (this.mQuit) {
                    return;
                }
            }
        }
    }
}
