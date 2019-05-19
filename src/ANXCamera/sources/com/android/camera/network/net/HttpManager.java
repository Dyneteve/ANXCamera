package com.android.camera.network.net;

import android.content.Context;
import com.android.camera.network.NetworkDependencies;
import com.android.camera.network.threadpool.ThreadManager;
import com.android.camera.sticker.FileUtils;
import com.android.volley.C0017ExecutorDelivery;
import com.android.volley.C0024Request;
import com.android.volley.C0025RequestQueue;
import com.android.volley.toolbox.BaseHttpStack;
import com.android.volley.toolbox.C0035BasicNetwork;
import com.android.volley.toolbox.C0042HurlStack;

public class HttpManager {
    private static final int CACHE_DISK_USAGE_BYTES = 5242880;
    private static final int NETWORK_THREAD_POOL_SIZE = 2;
    private static HttpManager instance;
    private Context mContext;
    private GalleryCache mRequestCache;
    private C0025RequestQueue mRequestQueue;

    public static synchronized HttpManager getInstance() {
        HttpManager httpManager;
        synchronized (HttpManager.class) {
            if (instance == null) {
                instance = new HttpManager();
            }
            httpManager = instance;
        }
        return httpManager;
    }

    public <T> void addToRequestQueue(C0024Request<T> request) {
        this.mRequestQueue.add(request);
    }

    public void cancelAll(String str) {
        this.mRequestQueue.cancelAll((Object) str);
    }

    /* JADX WARNING: type inference failed for: r2v0, types: [com.android.volley.toolbox.BaseHttpStack, com.android.volley.toolbox.HurlStack] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v0, types: [com.android.volley.toolbox.BaseHttpStack, com.android.volley.toolbox.HurlStack]
  assigns: [com.android.volley.toolbox.HurlStack]
  uses: [com.android.volley.toolbox.BaseHttpStack]
  mth insns count: 14
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void initRequestQueue(Context context) {
        this.mContext = context;
        this.mRequestCache = new GalleryCache(NetworkDependencies.getRequestCache(context), CACHE_DISK_USAGE_BYTES);
        this.mRequestQueue = new C0025RequestQueue(this.mRequestCache, new C0035BasicNetwork((BaseHttpStack) new C0042HurlStack()), 2, new C0017ExecutorDelivery(ThreadManager.getRequestThreadHandler()));
        this.mRequestQueue.start();
    }

    public void putDefaultCache(String str, String str2) {
        if (!this.mRequestCache.isCacheValid(str)) {
            FileUtils.copyFileIfNeed(this.mContext, this.mRequestCache.getFileForKey(str), str2);
            this.mRequestCache.initialize();
        }
    }

    public void putToCache(String str, byte[] bArr, long j, long j2) {
        this.mRequestCache.put(str, bArr, j, j2);
    }
}
