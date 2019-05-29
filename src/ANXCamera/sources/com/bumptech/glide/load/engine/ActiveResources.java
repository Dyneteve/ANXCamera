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
    private static final int ew = 1;
    private final boolean aD;
    private final Handler aE = new Handler(Looper.getMainLooper(), new Callback() {
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
    private volatile boolean eA;
    @Nullable
    private volatile DequeuedResourceCallback eB;
    private a ex;
    @Nullable
    private ReferenceQueue<k<?>> ey;
    @Nullable
    private Thread ez;

    @VisibleForTesting
    interface DequeuedResourceCallback {
        void ar();
    }

    @VisibleForTesting
    static final class ResourceWeakReference extends WeakReference<k<?>> {
        final boolean eD;
        @Nullable
        p<?> eE;
        final c key;

        ResourceWeakReference(@NonNull c cVar, @NonNull k<?> kVar, @NonNull ReferenceQueue<? super k<?>> referenceQueue, boolean z) {
            super(kVar, referenceQueue);
            this.key = (c) i.checkNotNull(cVar);
            p<?> pVar = (!kVar.be() || !z) ? null : (p) i.checkNotNull(kVar.bd());
            this.eE = pVar;
            this.eD = kVar.be();
        }

        /* access modifiers changed from: 0000 */
        public void reset() {
            this.eE = null;
            clear();
        }
    }

    ActiveResources(boolean z) {
        this.aD = z;
    }

    private ReferenceQueue<k<?>> ap() {
        if (this.ey == null) {
            this.ey = new ReferenceQueue<>();
            this.ez = new Thread(new Runnable() {
                public void run() {
                    Process.setThreadPriority(10);
                    ActiveResources.this.aq();
                }
            }, "glide-active-resources");
            this.ez.start();
        }
        return this.ey;
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
        ResourceWeakReference resourceWeakReference = (ResourceWeakReference) this.activeEngineResources.put(cVar, new ResourceWeakReference(cVar, kVar, ap(), this.aD));
        if (resourceWeakReference != null) {
            resourceWeakReference.reset();
        }
    }

    /* access modifiers changed from: 0000 */
    public void a(@NonNull ResourceWeakReference resourceWeakReference) {
        k.eL();
        this.activeEngineResources.remove(resourceWeakReference.key);
        if (resourceWeakReference.eD && resourceWeakReference.eE != null) {
            k kVar = new k(resourceWeakReference.eE, true, false);
            kVar.a(resourceWeakReference.key, this.ex);
            this.ex.b(resourceWeakReference.key, kVar);
        }
    }

    /* access modifiers changed from: 0000 */
    public void a(a aVar) {
        this.ex = aVar;
    }

    /* access modifiers changed from: 0000 */
    public void aq() {
        while (!this.eA) {
            try {
                this.aE.obtainMessage(1, (ResourceWeakReference) this.ey.remove()).sendToTarget();
                DequeuedResourceCallback dequeuedResourceCallback = this.eB;
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
        this.eB = dequeuedResourceCallback;
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public void shutdown() {
        this.eA = true;
        if (this.ez != null) {
            this.ez.interrupt();
            try {
                this.ez.join(TimeUnit.SECONDS.toMillis(5));
                if (this.ez.isAlive()) {
                    throw new RuntimeException("Failed to join in time");
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }
}
