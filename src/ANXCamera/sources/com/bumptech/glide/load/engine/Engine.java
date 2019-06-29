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
import com.bumptech.glide.load.engine.a.a.C0004a;
import com.bumptech.glide.load.engine.a.j;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.i;
import com.bumptech.glide.request.g;
import com.bumptech.glide.util.a.a.C0012a;
import com.bumptech.glide.util.k;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;

public class Engine implements com.bumptech.glide.load.engine.a.j.a, h, a {
    private static final String TAG = "Engine";
    private static final int gZ = 150;
    private static final boolean ha = Log.isLoggable(TAG, 2);
    private final m hb;
    private final j hc;
    private final j hd;
    private final EngineJobFactory he;
    private final s hf;
    private final a hg;
    private final DecodeJobFactory hh;
    private final ActiveResources hi;

    @VisibleForTesting
    static class DecodeJobFactory {
        final d fU;
        final Pool<DecodeJob<?>> gf = com.bumptech.glide.util.a.a.a(150, (C0012a<T>) new C0012a<DecodeJob<?>>() {
            /* renamed from: bx */
            public DecodeJob<?> create() {
                return new DecodeJob<>(DecodeJobFactory.this.fU, DecodeJobFactory.this.gf);
            }
        });
        private int hj;

        DecodeJobFactory(d dVar) {
            this.fU = dVar;
        }

        /* access modifiers changed from: 0000 */
        public <R> DecodeJob<R> a(e eVar, Object obj, i iVar, c cVar, int i, int i2, Class<?> cls, Class<R> cls2, Priority priority, g gVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, boolean z3, f fVar, a<R> aVar) {
            DecodeJob decodeJob = (DecodeJob) com.bumptech.glide.util.i.checkNotNull((DecodeJob) this.gf.acquire());
            int i3 = this.hj;
            this.hj = i3 + 1;
            return decodeJob.a(eVar, obj, iVar, cVar, i, i2, cls, cls2, priority, gVar, map, z, z2, z3, fVar, aVar, i3);
        }
    }

    @VisibleForTesting
    static class EngineJobFactory {
        final com.bumptech.glide.load.engine.b.a bD;
        final com.bumptech.glide.load.engine.b.a bx;
        final com.bumptech.glide.load.engine.b.a by;
        final Pool<EngineJob<?>> gf = com.bumptech.glide.util.a.a.a(150, (C0012a<T>) new C0012a<EngineJob<?>>() {
            /* renamed from: by */
            public EngineJob<?> create() {
                EngineJob engineJob = new EngineJob(EngineJobFactory.this.by, EngineJobFactory.this.bx, EngineJobFactory.this.hl, EngineJobFactory.this.bD, EngineJobFactory.this.hm, EngineJobFactory.this.gf);
                return engineJob;
            }
        });
        final com.bumptech.glide.load.engine.b.a hl;
        final h hm;

        EngineJobFactory(com.bumptech.glide.load.engine.b.a aVar, com.bumptech.glide.load.engine.b.a aVar2, com.bumptech.glide.load.engine.b.a aVar3, com.bumptech.glide.load.engine.b.a aVar4, h hVar) {
            this.by = aVar;
            this.bx = aVar2;
            this.hl = aVar3;
            this.bD = aVar4;
            this.hm = hVar;
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
            return ((EngineJob) com.bumptech.glide.util.i.checkNotNull((EngineJob) this.gf.acquire())).init(cVar, z, z2, z3, z4);
        }

        /* access modifiers changed from: 0000 */
        @VisibleForTesting
        public void shutdown() {
            a(this.by);
            a(this.bx);
            a(this.hl);
            a(this.bD);
        }
    }

    private static class a implements d {
        private final C0004a ho;
        private volatile com.bumptech.glide.load.engine.a.a hp;

        a(C0004a aVar) {
            this.ho = aVar;
        }

        public com.bumptech.glide.load.engine.a.a aW() {
            if (this.hp == null) {
                synchronized (this) {
                    if (this.hp == null) {
                        this.hp = this.ho.ca();
                    }
                    if (this.hp == null) {
                        this.hp = new com.bumptech.glide.load.engine.a.b();
                    }
                }
            }
            return this.hp;
        }

        /* access modifiers changed from: 0000 */
        @VisibleForTesting
        public synchronized void clearDiskCacheIfCreated() {
            if (this.hp != null) {
                this.hp.clear();
            }
        }
    }

    public static class b {
        private final EngineJob<?> hq;
        private final g hr;

        b(g gVar, EngineJob<?> engineJob) {
            this.hr = gVar;
            this.hq = engineJob;
        }

        public void cancel() {
            this.hq.b(this.hr);
        }
    }

    @VisibleForTesting
    Engine(j jVar, C0004a aVar, com.bumptech.glide.load.engine.b.a aVar2, com.bumptech.glide.load.engine.b.a aVar3, com.bumptech.glide.load.engine.b.a aVar4, com.bumptech.glide.load.engine.b.a aVar5, m mVar, j jVar2, ActiveResources activeResources, EngineJobFactory engineJobFactory, DecodeJobFactory decodeJobFactory, s sVar, boolean z) {
        j jVar3 = jVar;
        this.hd = jVar3;
        this.hg = new a(aVar);
        ActiveResources activeResources2 = activeResources == null ? new ActiveResources(z) : activeResources;
        this.hi = activeResources2;
        activeResources2.a((a) this);
        this.hc = jVar2 == null ? new j() : jVar2;
        this.hb = mVar == null ? new m() : mVar;
        this.he = engineJobFactory == null ? new EngineJobFactory(aVar2, aVar3, aVar4, aVar5, this) : engineJobFactory;
        this.hh = decodeJobFactory == null ? new DecodeJobFactory(this.hg) : decodeJobFactory;
        this.hf = sVar == null ? new s() : sVar;
        jVar3.a(this);
    }

    public Engine(j jVar, C0004a aVar, com.bumptech.glide.load.engine.b.a aVar2, com.bumptech.glide.load.engine.b.a aVar3, com.bumptech.glide.load.engine.b.a aVar4, com.bumptech.glide.load.engine.b.a aVar5, boolean z) {
        this(jVar, aVar, aVar2, aVar3, aVar4, aVar5, null, null, null, null, null, null, z);
    }

    @Nullable
    private k<?> a(c cVar, boolean z) {
        if (!z) {
            return null;
        }
        k<?> b2 = this.hi.b(cVar);
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
            this.hi.a(cVar, d);
        }
        return d;
    }

    private k<?> d(c cVar) {
        p g = this.hd.g(cVar);
        if (g == null) {
            return null;
        }
        return g instanceof k ? (k) g : new k(g, true, true);
    }

    public void P() {
        this.hg.aW().clear();
    }

    public <R> b a(e eVar, Object obj, c cVar, int i, int i2, Class<?> cls, Class<R> cls2, Priority priority, g gVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, f fVar, boolean z3, boolean z4, boolean z5, boolean z6, g gVar2) {
        boolean z7 = z3;
        g gVar3 = gVar2;
        k.fn();
        long fm = ha ? com.bumptech.glide.util.e.fm() : 0;
        i a2 = this.hc.a(obj, cVar, i, i2, map, cls, cls2, fVar);
        k a3 = a((c) a2, z7);
        if (a3 != null) {
            gVar3.c(a3, DataSource.MEMORY_CACHE);
            if (ha) {
                a("Loaded resource from active resources", fm, (c) a2);
            }
            return null;
        }
        k b2 = b((c) a2, z7);
        if (b2 != null) {
            gVar3.c(b2, DataSource.MEMORY_CACHE);
            if (ha) {
                a("Loaded resource from cache", fm, (c) a2);
            }
            return null;
        }
        boolean z8 = z6;
        EngineJob c = this.hb.c(a2, z8);
        if (c != null) {
            c.a(gVar3);
            if (ha) {
                a("Added to existing load", fm, (c) a2);
            }
            return new b(gVar3, c);
        }
        EngineJob a4 = this.he.a(a2, z7, z4, z5, z8);
        DecodeJob a5 = this.hh.a(eVar, obj, a2, cVar, i, i2, cls, cls2, priority, gVar, map, z, z2, z6, fVar, a4);
        this.hb.a(a2, a4);
        a4.a(gVar3);
        a4.c(a5);
        if (ha) {
            a("Started new load", fm, (c) a2);
        }
        return new b(gVar3, a4);
    }

    public void a(EngineJob<?> engineJob, c cVar) {
        k.fn();
        this.hb.b(cVar, engineJob);
    }

    public void a(EngineJob<?> engineJob, c cVar, k<?> kVar) {
        k.fn();
        if (kVar != null) {
            kVar.a(cVar, this);
            if (kVar.bF()) {
                this.hi.a(cVar, kVar);
            }
        }
        this.hb.b(cVar, engineJob);
    }

    public void b(c cVar, k<?> kVar) {
        k.fn();
        this.hi.a(cVar);
        if (kVar.bF()) {
            this.hd.b(cVar, kVar);
        } else {
            this.hf.h(kVar);
        }
    }

    public void d(p<?> pVar) {
        k.fn();
        if (pVar instanceof k) {
            ((k) pVar).release();
            return;
        }
        throw new IllegalArgumentException("Cannot release anything but an EngineResource");
    }

    public void e(@NonNull p<?> pVar) {
        k.fn();
        this.hf.h(pVar);
    }

    @VisibleForTesting
    public void shutdown() {
        this.he.shutdown();
        this.hg.clearDiskCacheIfCreated();
        this.hi.shutdown();
    }
}
