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
import com.bumptech.glide.load.engine.a.a.C0005a;
import com.bumptech.glide.load.engine.a.j;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.i;
import com.bumptech.glide.request.g;
import com.bumptech.glide.util.a.a.C0013a;
import com.bumptech.glide.util.k;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;

public class Engine implements com.bumptech.glide.load.engine.a.j.a, h, a {
    private static final String TAG = "Engine";
    private static final int fZ = 150;
    private static final boolean ga = Log.isLoggable(TAG, 2);
    private final m gb;
    private final j gc;
    private final j gd;
    private final EngineJobFactory ge;
    private final s gf;
    private final a gg;
    private final DecodeJobFactory gh;
    private final ActiveResources gi;

    @VisibleForTesting
    static class DecodeJobFactory {
        final d eU;
        final Pool<DecodeJob<?>> ff = com.bumptech.glide.util.a.a.a(150, (C0013a<T>) new C0013a<DecodeJob<?>>() {
            /* renamed from: aW */
            public DecodeJob<?> create() {
                return new DecodeJob<>(DecodeJobFactory.this.eU, DecodeJobFactory.this.ff);
            }
        });
        private int gj;

        DecodeJobFactory(d dVar) {
            this.eU = dVar;
        }

        /* access modifiers changed from: 0000 */
        public <R> DecodeJob<R> a(e eVar, Object obj, i iVar, c cVar, int i, int i2, Class<?> cls, Class<R> cls2, Priority priority, g gVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, boolean z3, f fVar, a<R> aVar) {
            DecodeJob decodeJob = (DecodeJob) com.bumptech.glide.util.i.checkNotNull((DecodeJob) this.ff.acquire());
            int i3 = this.gj;
            this.gj = i3 + 1;
            return decodeJob.a(eVar, obj, iVar, cVar, i, i2, cls, cls2, priority, gVar, map, z, z2, z3, fVar, aVar, i3);
        }
    }

    @VisibleForTesting
    static class EngineJobFactory {
        final com.bumptech.glide.load.engine.b.a aD;
        final com.bumptech.glide.load.engine.b.a ax;
        final com.bumptech.glide.load.engine.b.a ay;
        final Pool<EngineJob<?>> ff = com.bumptech.glide.util.a.a.a(150, (C0013a<T>) new C0013a<EngineJob<?>>() {
            /* renamed from: aX */
            public EngineJob<?> create() {
                EngineJob engineJob = new EngineJob(EngineJobFactory.this.ay, EngineJobFactory.this.ax, EngineJobFactory.this.gl, EngineJobFactory.this.aD, EngineJobFactory.this.gm, EngineJobFactory.this.ff);
                return engineJob;
            }
        });
        final com.bumptech.glide.load.engine.b.a gl;
        final h gm;

        EngineJobFactory(com.bumptech.glide.load.engine.b.a aVar, com.bumptech.glide.load.engine.b.a aVar2, com.bumptech.glide.load.engine.b.a aVar3, com.bumptech.glide.load.engine.b.a aVar4, h hVar) {
            this.ay = aVar;
            this.ax = aVar2;
            this.gl = aVar3;
            this.aD = aVar4;
            this.gm = hVar;
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
            return ((EngineJob) com.bumptech.glide.util.i.checkNotNull((EngineJob) this.ff.acquire())).init(cVar, z, z2, z3, z4);
        }

        /* access modifiers changed from: 0000 */
        @VisibleForTesting
        public void shutdown() {
            a(this.ay);
            a(this.ax);
            a(this.gl);
            a(this.aD);
        }
    }

    private static class a implements d {
        private final C0005a go;
        private volatile com.bumptech.glide.load.engine.a.a gp;

        a(C0005a aVar) {
            this.go = aVar;
        }

        public com.bumptech.glide.load.engine.a.a aw() {
            if (this.gp == null) {
                synchronized (this) {
                    if (this.gp == null) {
                        this.gp = this.go.bz();
                    }
                    if (this.gp == null) {
                        this.gp = new com.bumptech.glide.load.engine.a.b();
                    }
                }
            }
            return this.gp;
        }

        /* access modifiers changed from: 0000 */
        @VisibleForTesting
        public synchronized void clearDiskCacheIfCreated() {
            if (this.gp != null) {
                this.gp.clear();
            }
        }
    }

    public static class b {
        private final EngineJob<?> gq;
        private final g gr;

        b(g gVar, EngineJob<?> engineJob) {
            this.gr = gVar;
            this.gq = engineJob;
        }

        public void cancel() {
            this.gq.b(this.gr);
        }
    }

    @VisibleForTesting
    Engine(j jVar, C0005a aVar, com.bumptech.glide.load.engine.b.a aVar2, com.bumptech.glide.load.engine.b.a aVar3, com.bumptech.glide.load.engine.b.a aVar4, com.bumptech.glide.load.engine.b.a aVar5, m mVar, j jVar2, ActiveResources activeResources, EngineJobFactory engineJobFactory, DecodeJobFactory decodeJobFactory, s sVar, boolean z) {
        j jVar3 = jVar;
        this.gd = jVar3;
        this.gg = new a(aVar);
        ActiveResources activeResources2 = activeResources == null ? new ActiveResources(z) : activeResources;
        this.gi = activeResources2;
        activeResources2.a((a) this);
        this.gc = jVar2 == null ? new j() : jVar2;
        this.gb = mVar == null ? new m() : mVar;
        this.ge = engineJobFactory == null ? new EngineJobFactory(aVar2, aVar3, aVar4, aVar5, this) : engineJobFactory;
        this.gh = decodeJobFactory == null ? new DecodeJobFactory(this.gg) : decodeJobFactory;
        this.gf = sVar == null ? new s() : sVar;
        jVar3.a(this);
    }

    public Engine(j jVar, C0005a aVar, com.bumptech.glide.load.engine.b.a aVar2, com.bumptech.glide.load.engine.b.a aVar3, com.bumptech.glide.load.engine.b.a aVar4, com.bumptech.glide.load.engine.b.a aVar5, boolean z) {
        this(jVar, aVar, aVar2, aVar3, aVar4, aVar5, null, null, null, null, null, null, z);
    }

    @Nullable
    private k<?> a(c cVar, boolean z) {
        if (!z) {
            return null;
        }
        k<?> b2 = this.gi.b(cVar);
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
            this.gi.a(cVar, d);
        }
        return d;
    }

    private k<?> d(c cVar) {
        p g = this.gd.g(cVar);
        if (g == null) {
            return null;
        }
        return g instanceof k ? (k) g : new k(g, true, true);
    }

    public <R> b a(e eVar, Object obj, c cVar, int i, int i2, Class<?> cls, Class<R> cls2, Priority priority, g gVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, f fVar, boolean z3, boolean z4, boolean z5, boolean z6, g gVar2) {
        boolean z7 = z3;
        g gVar3 = gVar2;
        k.eL();
        long eK = ga ? com.bumptech.glide.util.e.eK() : 0;
        i a2 = this.gc.a(obj, cVar, i, i2, map, cls, cls2, fVar);
        k a3 = a((c) a2, z7);
        if (a3 != null) {
            gVar3.c(a3, DataSource.MEMORY_CACHE);
            if (ga) {
                a("Loaded resource from active resources", eK, (c) a2);
            }
            return null;
        }
        k b2 = b((c) a2, z7);
        if (b2 != null) {
            gVar3.c(b2, DataSource.MEMORY_CACHE);
            if (ga) {
                a("Loaded resource from cache", eK, (c) a2);
            }
            return null;
        }
        boolean z8 = z6;
        EngineJob c = this.gb.c(a2, z8);
        if (c != null) {
            c.a(gVar3);
            if (ga) {
                a("Added to existing load", eK, (c) a2);
            }
            return new b(gVar3, c);
        }
        EngineJob a4 = this.ge.a(a2, z7, z4, z5, z8);
        DecodeJob a5 = this.gh.a(eVar, obj, a2, cVar, i, i2, cls, cls2, priority, gVar, map, z, z2, z6, fVar, a4);
        this.gb.a(a2, a4);
        a4.a(gVar3);
        a4.c(a5);
        if (ga) {
            a("Started new load", eK, (c) a2);
        }
        return new b(gVar3, a4);
    }

    public void a(EngineJob<?> engineJob, c cVar) {
        k.eL();
        this.gb.b(cVar, engineJob);
    }

    public void a(EngineJob<?> engineJob, c cVar, k<?> kVar) {
        k.eL();
        if (kVar != null) {
            kVar.a(cVar, this);
            if (kVar.be()) {
                this.gi.a(cVar, kVar);
            }
        }
        this.gb.b(cVar, engineJob);
    }

    public void b(c cVar, k<?> kVar) {
        k.eL();
        this.gi.a(cVar);
        if (kVar.be()) {
            this.gd.b(cVar, kVar);
        } else {
            this.gf.h(kVar);
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
        this.gf.h(pVar);
    }

    public void p() {
        this.gg.aw().clear();
    }

    @VisibleForTesting
    public void shutdown() {
        this.ge.shutdown();
        this.gg.clearDiskCacheIfCreated();
        this.gi.shutdown();
    }
}
