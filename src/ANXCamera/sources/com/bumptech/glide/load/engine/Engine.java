package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.support.v4.util.Pools.Pool;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.e;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.a.a.C0003a;
import com.bumptech.glide.load.engine.a.j;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.i;
import com.bumptech.glide.request.g;
import com.bumptech.glide.util.a.a.C0011a;
import com.bumptech.glide.util.k;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;

public class Engine implements com.bumptech.glide.load.engine.a.j.a, h, a {
    private static final String TAG = "Engine";
    private static final int fX = 150;
    private static final boolean fY = Log.isLoggable(TAG, 2);
    private final m fZ;
    private final j ga;
    private final j gb;
    private final EngineJobFactory gc;
    private final s gd;
    private final a ge;
    private final DecodeJobFactory gf;
    private final ActiveResources gg;

    @VisibleForTesting
    static class DecodeJobFactory {
        final d eS;
        final Pool<DecodeJob<?>> fd = com.bumptech.glide.util.a.a.a(150, (C0011a<T>) new C0011a<DecodeJob<?>>() {
            /* renamed from: aW */
            public DecodeJob<?> create() {
                return new DecodeJob<>(DecodeJobFactory.this.eS, DecodeJobFactory.this.fd);
            }
        });
        private int gh;

        DecodeJobFactory(d dVar) {
            this.eS = dVar;
        }

        /* access modifiers changed from: 0000 */
        public <R> DecodeJob<R> a(e eVar, Object obj, i iVar, c cVar, int i, int i2, Class<?> cls, Class<R> cls2, Priority priority, g gVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, boolean z3, f fVar, a<R> aVar) {
            DecodeJob decodeJob = (DecodeJob) com.bumptech.glide.util.i.checkNotNull((DecodeJob) this.fd.acquire());
            int i3 = this.gh;
            this.gh = i3 + 1;
            return decodeJob.a(eVar, obj, iVar, cVar, i, i2, cls, cls2, priority, gVar, map, z, z2, z3, fVar, aVar, i3);
        }
    }

    @VisibleForTesting
    static class EngineJobFactory {
        final com.bumptech.glide.load.engine.b.a aB;
        final com.bumptech.glide.load.engine.b.a av;
        final com.bumptech.glide.load.engine.b.a aw;
        final Pool<EngineJob<?>> fd = com.bumptech.glide.util.a.a.a(150, (C0011a<T>) new C0011a<EngineJob<?>>() {
            /* renamed from: aX */
            public EngineJob<?> create() {
                EngineJob engineJob = new EngineJob(EngineJobFactory.this.aw, EngineJobFactory.this.av, EngineJobFactory.this.gj, EngineJobFactory.this.aB, EngineJobFactory.this.gk, EngineJobFactory.this.fd);
                return engineJob;
            }
        });
        final com.bumptech.glide.load.engine.b.a gj;
        final h gk;

        EngineJobFactory(com.bumptech.glide.load.engine.b.a aVar, com.bumptech.glide.load.engine.b.a aVar2, com.bumptech.glide.load.engine.b.a aVar3, com.bumptech.glide.load.engine.b.a aVar4, h hVar) {
            this.aw = aVar;
            this.av = aVar2;
            this.gj = aVar3;
            this.aB = aVar4;
            this.gk = hVar;
        }

        private static void a(ExecutorService executorService) {
            executorService.shutdown();
            try {
                if (!executorService.awaitTermination(5, TimeUnit.SECONDS)) {
                    executorService.shutdownNow();
                    if (!executorService.awaitTermination(5, TimeUnit.SECONDS)) {
                        throw new RuntimeException("Failed to shutdown");
                    }
                }
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }

        /* access modifiers changed from: 0000 */
        public <R> EngineJob<R> a(c cVar, boolean z, boolean z2, boolean z3, boolean z4) {
            return ((EngineJob) com.bumptech.glide.util.i.checkNotNull((EngineJob) this.fd.acquire())).init(cVar, z, z2, z3, z4);
        }

        /* access modifiers changed from: 0000 */
        @VisibleForTesting
        public void shutdown() {
            a(this.aw);
            a(this.av);
            a(this.gj);
            a(this.aB);
        }
    }

    private static class a implements d {
        private final C0003a gm;
        private volatile com.bumptech.glide.load.engine.a.a gn;

        a(C0003a aVar) {
            this.gm = aVar;
        }

        public com.bumptech.glide.load.engine.a.a aw() {
            if (this.gn == null) {
                synchronized (this) {
                    if (this.gn == null) {
                        this.gn = this.gm.bz();
                    }
                    if (this.gn == null) {
                        this.gn = new com.bumptech.glide.load.engine.a.b();
                    }
                }
            }
            return this.gn;
        }

        /* access modifiers changed from: 0000 */
        @VisibleForTesting
        public synchronized void clearDiskCacheIfCreated() {
            if (this.gn != null) {
                this.gn.clear();
            }
        }
    }

    public static class b {
        private final EngineJob<?> go;
        private final g gp;

        b(g gVar, EngineJob<?> engineJob) {
            this.gp = gVar;
            this.go = engineJob;
        }

        public void cancel() {
            this.go.b(this.gp);
        }
    }

    @VisibleForTesting
    Engine(j jVar, C0003a aVar, com.bumptech.glide.load.engine.b.a aVar2, com.bumptech.glide.load.engine.b.a aVar3, com.bumptech.glide.load.engine.b.a aVar4, com.bumptech.glide.load.engine.b.a aVar5, m mVar, j jVar2, ActiveResources activeResources, EngineJobFactory engineJobFactory, DecodeJobFactory decodeJobFactory, s sVar, boolean z) {
        j jVar3 = jVar;
        this.gb = jVar3;
        this.ge = new a(aVar);
        ActiveResources activeResources2 = activeResources == null ? new ActiveResources(z) : activeResources;
        this.gg = activeResources2;
        activeResources2.a((a) this);
        this.ga = jVar2 == null ? new j() : jVar2;
        this.fZ = mVar == null ? new m() : mVar;
        this.gc = engineJobFactory == null ? new EngineJobFactory(aVar2, aVar3, aVar4, aVar5, this) : engineJobFactory;
        this.gf = decodeJobFactory == null ? new DecodeJobFactory(this.ge) : decodeJobFactory;
        this.gd = sVar == null ? new s() : sVar;
        jVar3.a(this);
    }

    public Engine(j jVar, C0003a aVar, com.bumptech.glide.load.engine.b.a aVar2, com.bumptech.glide.load.engine.b.a aVar3, com.bumptech.glide.load.engine.b.a aVar4, com.bumptech.glide.load.engine.b.a aVar5, boolean z) {
        this(jVar, aVar, aVar2, aVar3, aVar4, aVar5, null, null, null, null, null, null, z);
    }

    @Nullable
    private k<?> a(c cVar, boolean z) {
        if (!z) {
            return null;
        }
        k<?> b2 = this.gg.b(cVar);
        if (b2 != null) {
            b2.acquire();
        }
        return b2;
    }

    private static void a(String str, long j, c cVar) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(" in ");
        sb.append(com.bumptech.glide.util.e.f(j));
        sb.append("ms, key: ");
        sb.append(cVar);
        Log.v(str2, sb.toString());
    }

    private k<?> b(c cVar, boolean z) {
        if (!z) {
            return null;
        }
        k<?> d = d(cVar);
        if (d != null) {
            d.acquire();
            this.gg.a(cVar, d);
        }
        return d;
    }

    private k<?> d(c cVar) {
        p g = this.gb.g(cVar);
        if (g == null) {
            return null;
        }
        return g instanceof k ? (k) g : new k(g, true, true);
    }

    public <R> b a(e eVar, Object obj, c cVar, int i, int i2, Class<?> cls, Class<R> cls2, Priority priority, g gVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, f fVar, boolean z3, boolean z4, boolean z5, boolean z6, g gVar2) {
        boolean z7 = z3;
        g gVar3 = gVar2;
        k.eL();
        long eK = fY ? com.bumptech.glide.util.e.eK() : 0;
        i a2 = this.ga.a(obj, cVar, i, i2, map, cls, cls2, fVar);
        k a3 = a((c) a2, z7);
        if (a3 != null) {
            gVar3.c(a3, DataSource.MEMORY_CACHE);
            if (fY) {
                a("Loaded resource from active resources", eK, (c) a2);
            }
            return null;
        }
        k b2 = b((c) a2, z7);
        if (b2 != null) {
            gVar3.c(b2, DataSource.MEMORY_CACHE);
            if (fY) {
                a("Loaded resource from cache", eK, (c) a2);
            }
            return null;
        }
        boolean z8 = z6;
        EngineJob c = this.fZ.c(a2, z8);
        if (c != null) {
            c.a(gVar3);
            if (fY) {
                a("Added to existing load", eK, (c) a2);
            }
            return new b(gVar3, c);
        }
        EngineJob a4 = this.gc.a(a2, z7, z4, z5, z8);
        DecodeJob a5 = this.gf.a(eVar, obj, a2, cVar, i, i2, cls, cls2, priority, gVar, map, z, z2, z6, fVar, a4);
        this.fZ.a(a2, a4);
        a4.a(gVar3);
        a4.c(a5);
        if (fY) {
            a("Started new load", eK, (c) a2);
        }
        return new b(gVar3, a4);
    }

    public void a(EngineJob<?> engineJob, c cVar) {
        k.eL();
        this.fZ.b(cVar, engineJob);
    }

    public void a(EngineJob<?> engineJob, c cVar, k<?> kVar) {
        k.eL();
        if (kVar != null) {
            kVar.a(cVar, this);
            if (kVar.be()) {
                this.gg.a(cVar, kVar);
            }
        }
        this.fZ.b(cVar, engineJob);
    }

    public void b(c cVar, k<?> kVar) {
        k.eL();
        this.gg.a(cVar);
        if (kVar.be()) {
            this.gb.b(cVar, kVar);
        } else {
            this.gd.h(kVar);
        }
    }

    public void d(p<?> pVar) {
        k.eL();
        if (pVar instanceof k) {
            ((k) pVar).release();
            return;
        }
        throw new IllegalArgumentException("Cannot release anything but an EngineResource");
    }

    public void e(@NonNull p<?> pVar) {
        k.eL();
        this.gd.h(pVar);
    }

    public void p() {
        this.ge.aw().clear();
    }

    @VisibleForTesting
    public void shutdown() {
        this.gc.shutdown();
        this.ge.clearDiskCacheIfCreated();
        this.gg.shutdown();
    }
}
