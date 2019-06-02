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
    private static final int ex = 1;
    private final boolean aE;
    private final Handler aF = new Handler(Looper.getMainLooper(), new Callback() {
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
    private Thread eA;
    private volatile boolean eB;
    @Nullable
    private volatile DequeuedResourceCallback eC;
    private a ey;
    @Nullable
    private ReferenceQueue<k<?>> ez;

    @VisibleForTesting
    interface DequeuedResourceCallback {
        void ar();
    }

    @VisibleForTesting
    static final class ResourceWeakReference extends WeakReference<k<?>> {
        final boolean eE;
        @Nullable
        p<?> eF;
        final c key;

        ResourceWeakReference(@NonNull c cVar, @NonNull k<?> kVar, @NonNull ReferenceQueue<? super k<?>> referenceQueue, boolean z) {
            super(kVar, referenceQueue);
            this.key = (c) i.checkNotNull(cVar);
            p<?> pVar = (!kVar.be() || !z) ? null : (p) i.checkNotNull(kVar.bd());
            this.eF = pVar;
            this.eE = kVar.be();
        }

        /* access modifiers changed from: 0000 */
        public void reset() {
            this.eF = null;
            clear();
        }
    }

    ActiveResources(boolean z) {
        this.aE = z;
    }

    private ReferenceQueue<k<?>> ap() {
        if (this.ez == null) {
            this.ez = new ReferenceQueue<>();
            this.eA = new Thread(new Runnable() {
                public void run() {
                    Process.setThreadPriority(10);
                    ActiveResources.this.aq();
                }
            }, "glide-active-resources");
            this.eA.start();
        }
        return this.ez;
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
        ResourceWeakReference resourceWeakReference = (ResourceWeakReference) this.activeEngineResources.put(cVar, new ResourceWeakReference(cVar, kVar, ap(), this.aE));
        if (resourceWeakReference != null) {
            resourceWeakReference.reset();
        }
    }

    /* access modifiers changed from: 0000 */
    public void a(@NonNull ResourceWeakReference resourceWeakReference) {
        k.eL();
        this.activeEngineResources.remove(resourceWeakReference.key);
        if (resourceWeakReference.eE && resourceWeakReference.eF != null) {
            k kVar = new k(resourceWeakReference.eF, true, false);
            kVar.a(resourceWeakReference.key, this.ey);
            this.ey.b(resourceWeakReference.key, kVar);
        }
    }

    /* access modifiers changed from: 0000 */
    public void a(a aVar) {
        this.ey = aVar;
    }

    /* access modifiers changed from: 0000 */
    public void aq() {
        while (!this.eB) {
            try {
                this.aF.obtainMessage(1, (ResourceWeakReference) this.ez.remove()).sendToTarget();
                DequeuedResourceCallback dequeuedResourceCallback = this.eC;
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
        this.eC = dequeuedResourceCallback;
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public void shutdown() {
        this.eB = true;
        if (this.eA != null) {
            this.eA.interrupt();
            try {
                this.eA.join(TimeUnit.SECONDS.toMillis(5));
                if (this.eA.isAlive()) {
                    throw new RuntimeException("Failed to join in time");
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }
}
