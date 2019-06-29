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
    private static final int fx = 1;
    @VisibleForTesting
    final Map<c, ResourceWeakReference> activeEngineResources = new HashMap();
    private final boolean bE;
    private final Handler bF = new Handler(Looper.getMainLooper(), new Callback() {
        public boolean handleMessage(Message message) {
            if (message.what != 1) {
                return false;
            }
            ActiveResources.this.a((ResourceWeakReference) message.obj);
            return true;
        }
    });
    @Nullable
    private Thread fA;
    private volatile boolean fB;
    @Nullable
    private volatile DequeuedResourceCallback fC;
    private a fy;
    @Nullable
    private ReferenceQueue<k<?>> fz;

    @VisibleForTesting
    interface DequeuedResourceCallback {
        void aR();
    }

    @VisibleForTesting
    static final class ResourceWeakReference extends WeakReference<k<?>> {
        final boolean fE;
        @Nullable
        p<?> fF;
        final c key;

        ResourceWeakReference(@NonNull c cVar, @NonNull k<?> kVar, @NonNull ReferenceQueue<? super k<?>> referenceQueue, boolean z) {
            super(kVar, referenceQueue);
            this.key = (c) i.checkNotNull(cVar);
            this.fF = (!kVar.bF() || !z) ? null : (p) i.checkNotNull(kVar.bE());
            this.fE = kVar.bF();
        }

        /* access modifiers changed from: 0000 */
        public void reset() {
            this.fF = null;
            clear();
        }
    }

    ActiveResources(boolean z) {
        this.bE = z;
    }

    private ReferenceQueue<k<?>> aP() {
        if (this.fz == null) {
            this.fz = new ReferenceQueue<>();
            this.fA = new Thread(new Runnable() {
                public void run() {
                    Process.setThreadPriority(10);
                    ActiveResources.this.aQ();
                }
            }, "glide-active-resources");
            this.fA.start();
        }
        return this.fz;
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
        ResourceWeakReference resourceWeakReference = (ResourceWeakReference) this.activeEngineResources.put(cVar, new ResourceWeakReference(cVar, kVar, aP(), this.bE));
        if (resourceWeakReference != null) {
            resourceWeakReference.reset();
        }
    }

    /* access modifiers changed from: 0000 */
    public void a(@NonNull ResourceWeakReference resourceWeakReference) {
        k.fn();
        this.activeEngineResources.remove(resourceWeakReference.key);
        if (resourceWeakReference.fE && resourceWeakReference.fF != null) {
            k kVar = new k(resourceWeakReference.fF, true, false);
            kVar.a(resourceWeakReference.key, this.fy);
            this.fy.b(resourceWeakReference.key, kVar);
        }
    }

    /* access modifiers changed from: 0000 */
    public void a(a aVar) {
        this.fy = aVar;
    }

    /* access modifiers changed from: 0000 */
    public void aQ() {
        while (!this.fB) {
            try {
                this.bF.obtainMessage(1, (ResourceWeakReference) this.fz.remove()).sendToTarget();
                DequeuedResourceCallback dequeuedResourceCallback = this.fC;
                if (dequeuedResourceCallback != null) {
                    dequeuedResourceCallback.aR();
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
        this.fC = dequeuedResourceCallback;
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public void shutdown() {
        this.fB = true;
        if (this.fA != null) {
            this.fA.interrupt();
            try {
                this.fA.join(TimeUnit.SECONDS.toMillis(5));
                if (this.fA.isAlive()) {
                    throw new RuntimeException("Failed to join in time");
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }
}
