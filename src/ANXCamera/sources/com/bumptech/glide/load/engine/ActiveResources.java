package com.bumptech.glide.load.engine;

import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.os.Process;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.load.c;
import com.bumptech.glide.util.i;
import com.bumptech.glide.util.k;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

final class ActiveResources {
    private static final int ev = 1;
    private final boolean aC;
    private final Handler aD = new Handler(Looper.getMainLooper(), new Callback() {
        public boolean handleMessage(Message message) {
            if (message.what != 1) {
                return false;
            }
            ActiveResources.this.a((ResourceWeakReference) message.obj);
            return true;
        }
    });
    @VisibleForTesting
    final Map<c, ResourceWeakReference> activeEngineResources = new HashMap();
    @Nullable
    private volatile DequeuedResourceCallback eA;
    private a ew;
    @Nullable
    private ReferenceQueue<k<?>> ex;
    @Nullable
    private Thread ey;
    private volatile boolean ez;

    @VisibleForTesting
    interface DequeuedResourceCallback {
        void ar();
    }

    @VisibleForTesting
    static final class ResourceWeakReference extends WeakReference<k<?>> {
        final boolean eC;
        @Nullable
        p<?> eD;
        final c key;

        ResourceWeakReference(@NonNull c cVar, @NonNull k<?> kVar, @NonNull ReferenceQueue<? super k<?>> referenceQueue, boolean z) {
            super(kVar, referenceQueue);
            this.key = (c) i.checkNotNull(cVar);
            p<?> pVar = (!kVar.be() || !z) ? null : (p) i.checkNotNull(kVar.bd());
            this.eD = pVar;
            this.eC = kVar.be();
        }

        /* access modifiers changed from: 0000 */
        public void reset() {
            this.eD = null;
            clear();
        }
    }

    ActiveResources(boolean z) {
        this.aC = z;
    }

    private ReferenceQueue<k<?>> ap() {
        if (this.ex == null) {
            this.ex = new ReferenceQueue<>();
            this.ey = new Thread(new Runnable() {
                public void run() {
                    Process.setThreadPriority(10);
                    ActiveResources.this.aq();
                }
            }, "glide-active-resources");
            this.ey.start();
        }
        return this.ex;
    }

    /* access modifiers changed from: 0000 */
    public void a(c cVar) {
        ResourceWeakReference resourceWeakReference = (ResourceWeakReference) this.activeEngineResources.remove(cVar);
        if (resourceWeakReference != null) {
            resourceWeakReference.reset();
        }
    }

    /* access modifiers changed from: 0000 */
    public void a(c cVar, k<?> kVar) {
        ResourceWeakReference resourceWeakReference = (ResourceWeakReference) this.activeEngineResources.put(cVar, new ResourceWeakReference(cVar, kVar, ap(), this.aC));
        if (resourceWeakReference != null) {
            resourceWeakReference.reset();
        }
    }

    /* access modifiers changed from: 0000 */
    public void a(@NonNull ResourceWeakReference resourceWeakReference) {
        k.eL();
        this.activeEngineResources.remove(resourceWeakReference.key);
        if (resourceWeakReference.eC && resourceWeakReference.eD != null) {
            k kVar = new k(resourceWeakReference.eD, true, false);
            kVar.a(resourceWeakReference.key, this.ew);
            this.ew.b(resourceWeakReference.key, kVar);
        }
    }

    /* access modifiers changed from: 0000 */
    public void a(a aVar) {
        this.ew = aVar;
    }

    /* access modifiers changed from: 0000 */
    public void aq() {
        while (!this.ez) {
            try {
                this.aD.obtainMessage(1, (ResourceWeakReference) this.ex.remove()).sendToTarget();
                DequeuedResourceCallback dequeuedResourceCallback = this.eA;
                if (dequeuedResourceCallback != null) {
                    dequeuedResourceCallback.ar();
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }

    /* access modifiers changed from: 0000 */
    @Nullable
    public k<?> b(c cVar) {
        ResourceWeakReference resourceWeakReference = (ResourceWeakReference) this.activeEngineResources.get(cVar);
        if (resourceWeakReference == null) {
            return null;
        }
        k<?> kVar = (k) resourceWeakReference.get();
        if (kVar == null) {
            a(resourceWeakReference);
        }
        return kVar;
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public void setDequeuedResourceCallback(DequeuedResourceCallback dequeuedResourceCallback) {
        this.eA = dequeuedResourceCallback;
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public void shutdown() {
        this.ez = true;
        if (this.ey != null) {
            this.ey.interrupt();
            try {
                this.ey.join(TimeUnit.SECONDS.toMillis(5));
                if (this.ey.isAlive()) {
                    throw new RuntimeException("Failed to join in time");
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }
}
