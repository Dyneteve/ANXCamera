package com.bumptech.glide.load.engine;

import android.os.Build.VERSION;
import android.support.annotation.NonNull;
import android.support.v4.util.Pools.Pool;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.Registry.NoResultEncoderAvailableException;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.EncodeStrategy;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.h;
import com.bumptech.glide.load.i;
import com.bumptech.glide.load.resource.bitmap.n;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

class DecodeJob<R> implements com.bumptech.glide.load.engine.d.a, com.bumptech.glide.util.a.a.c, Comparable<DecodeJob<?>>, Runnable {
    private static final String TAG = "DecodeJob";
    private com.bumptech.glide.e bp;
    private Object cy;
    private com.bumptech.glide.load.c fP;
    private f fR;
    private final d fU;
    private Priority fY;
    private g fZ;
    private volatile boolean fc;
    private final e<R> gc = new e<>();
    private final List<Throwable> gd = new ArrayList();
    private final com.bumptech.glide.util.a.c ge = com.bumptech.glide.util.a.c.fu();
    private final Pool<DecodeJob<?>> gf;
    private final c<?> gg = new c<>();
    private final e gh = new e();
    private i gi;
    private a<R> gj;
    private Stage gk;
    private RunReason gl;
    private long gm;
    private boolean gn;
    private Thread go;
    private com.bumptech.glide.load.c gp;
    private com.bumptech.glide.load.c gq;
    private Object gr;
    private DataSource gs;
    private com.bumptech.glide.load.a.d<?> gt;
    private volatile d gu;
    private volatile boolean gv;
    private int height;
    private int order;
    private int width;

    private enum RunReason {
        INITIALIZE,
        SWITCH_TO_SOURCE_SERVICE,
        DECODE_DATA
    }

    private enum Stage {
        INITIALIZE,
        RESOURCE_CACHE,
        DATA_CACHE,
        SOURCE,
        ENCODE,
        FINISHED
    }

    interface a<R> {
        void a(GlideException glideException);

        void b(DecodeJob<?> decodeJob);

        void c(p<R> pVar, DataSource dataSource);
    }

    private final class b<Z> implements a<Z> {
        private final DataSource dataSource;

        b(DataSource dataSource2) {
            this.dataSource = dataSource2;
        }

        @NonNull
        public p<Z> c(@NonNull p<Z> pVar) {
            return DecodeJob.this.a(this.dataSource, pVar);
        }
    }

    private static class c<Z> {
        private h<Z> gA;
        private o<Z> gB;
        private com.bumptech.glide.load.c key;

        c() {
        }

        /* access modifiers changed from: 0000 */
        public <X> void a(com.bumptech.glide.load.c cVar, h<X> hVar, o<X> oVar) {
            this.key = cVar;
            this.gA = hVar;
            this.gB = oVar;
        }

        /* access modifiers changed from: 0000 */
        public void a(d dVar, f fVar) {
            com.bumptech.glide.util.a.b.beginSection("DecodeJob.encode");
            try {
                dVar.aW().a(this.key, new c(this.gA, this.gB, fVar));
            } finally {
                this.gB.unlock();
                com.bumptech.glide.util.a.b.endSection();
            }
        }

        /* access modifiers changed from: 0000 */
        public boolean br() {
            return this.gB != null;
        }

        /* access modifiers changed from: 0000 */
        public void clear() {
            this.key = null;
            this.gA = null;
            this.gB = null;
        }
    }

    interface d {
        com.bumptech.glide.load.engine.a.a aW();
    }

    private static class e {
        private boolean gC;
        private boolean gD;
        private boolean gE;

        e() {
        }

        private boolean f(boolean z) {
            return (this.gE || z || this.gD) && this.gC;
        }

        /* access modifiers changed from: 0000 */
        public synchronized boolean bt() {
            this.gD = true;
            return f(false);
        }

        /* access modifiers changed from: 0000 */
        public synchronized boolean bu() {
            this.gE = true;
            return f(false);
        }

        /* access modifiers changed from: 0000 */
        public synchronized boolean e(boolean z) {
            this.gC = true;
            return f(z);
        }

        /* access modifiers changed from: 0000 */
        public synchronized void reset() {
            this.gD = false;
            this.gC = false;
            this.gE = false;
        }
    }

    DecodeJob(d dVar, Pool<DecodeJob<?>> pool) {
        this.fU = dVar;
        this.gf = pool;
    }

    private Stage a(Stage stage) {
        switch (stage) {
            case RESOURCE_CACHE:
                return this.fZ.bw() ? Stage.DATA_CACHE : a(Stage.DATA_CACHE);
            case DATA_CACHE:
                return this.gn ? Stage.FINISHED : Stage.SOURCE;
            case SOURCE:
            case FINISHED:
                return Stage.FINISHED;
            case INITIALIZE:
                return this.fZ.bv() ? Stage.RESOURCE_CACHE : a(Stage.RESOURCE_CACHE);
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("Unrecognized stage: ");
                sb.append(stage);
                throw new IllegalArgumentException(sb.toString());
        }
    }

    private <Data> p<R> a(com.bumptech.glide.load.a.d<?> dVar, Data data, DataSource dataSource) throws GlideException {
        if (data == null) {
            dVar.cleanup();
            return null;
        }
        try {
            long fm = com.bumptech.glide.util.e.fm();
            p<R> a2 = a(data, dataSource);
            if (Log.isLoggable(TAG, 2)) {
                StringBuilder sb = new StringBuilder();
                sb.append("Decoded result ");
                sb.append(a2);
                b(sb.toString(), fm);
            }
            return a2;
        } finally {
            dVar.cleanup();
        }
    }

    private <Data> p<R> a(Data data, DataSource dataSource) throws GlideException {
        return a(data, dataSource, this.gc.e(data.getClass()));
    }

    private <Data, ResourceType> p<R> a(Data data, DataSource dataSource, n<Data, ResourceType, R> nVar) throws GlideException {
        f a2 = a(dataSource);
        com.bumptech.glide.load.a.e h = this.bp.R().h(data);
        try {
            return nVar.a(h, a2, this.width, this.height, new b(dataSource));
        } finally {
            h.cleanup();
        }
    }

    @NonNull
    private f a(DataSource dataSource) {
        f fVar = this.fR;
        if (VERSION.SDK_INT < 26 || fVar.a(n.mq) != null) {
            return fVar;
        }
        if (dataSource == DataSource.RESOURCE_DISK_CACHE || this.gc.be()) {
            fVar = new f();
            fVar.a(this.fR);
            fVar.a(n.mq, Boolean.valueOf(true));
        }
        return fVar;
    }

    private void a(p<R> pVar, DataSource dataSource) {
        bo();
        this.gj.c(pVar, dataSource);
    }

    private void a(String str, long j, String str2) {
        String str3;
        String str4 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(" in ");
        sb.append(com.bumptech.glide.util.e.f(j));
        sb.append(", load key: ");
        sb.append(this.gi);
        if (str2 != null) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(", ");
            sb2.append(str2);
            str3 = sb2.toString();
        } else {
            str3 = "";
        }
        sb.append(str3);
        sb.append(", thread: ");
        sb.append(Thread.currentThread().getName());
        Log.v(str4, sb.toString());
    }

    /* JADX INFO: finally extract failed */
    /* JADX WARNING: type inference failed for: r3v1, types: [com.bumptech.glide.load.engine.p] */
    /* JADX WARNING: type inference failed for: r3v7, types: [com.bumptech.glide.load.engine.o] */
    /* JADX WARNING: type inference failed for: r3v8 */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Unknown variable types count: 1 */
    private void b(p<R> pVar, DataSource dataSource) {
        if (pVar instanceof l) {
            ((l) pVar).initialize();
        }
        o oVar = 0;
        if (this.gg.br()) {
            r3 = o.f(pVar);
            oVar = r3;
            pVar = r3;
        }
        a((p<R>) pVar, dataSource);
        this.gk = Stage.ENCODE;
        try {
            if (this.gg.br()) {
                this.gg.a(this.fU, this.fR);
            }
            if (oVar != 0) {
                oVar.unlock();
            }
            bi();
        } catch (Throwable th) {
            if (oVar != 0) {
                oVar.unlock();
            }
            throw th;
        }
    }

    private void b(String str, long j) {
        a(str, j, (String) null);
    }

    private void bi() {
        if (this.gh.bt()) {
            bk();
        }
    }

    private void bj() {
        if (this.gh.bu()) {
            bk();
        }
    }

    private void bk() {
        this.gh.reset();
        this.gg.clear();
        this.gc.clear();
        this.gv = false;
        this.bp = null;
        this.fP = null;
        this.fR = null;
        this.fY = null;
        this.gi = null;
        this.gj = null;
        this.gk = null;
        this.gu = null;
        this.go = null;
        this.gp = null;
        this.gr = null;
        this.gs = null;
        this.gt = null;
        this.gm = 0;
        this.fc = false;
        this.cy = null;
        this.gd.clear();
        this.gf.release(this);
    }

    private void bl() {
        switch (this.gl) {
            case INITIALIZE:
                this.gk = a(Stage.INITIALIZE);
                this.gu = bm();
                bn();
                return;
            case SWITCH_TO_SOURCE_SERVICE:
                bn();
                return;
            case DECODE_DATA:
                bp();
                return;
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("Unrecognized run reason: ");
                sb.append(this.gl);
                throw new IllegalStateException(sb.toString());
        }
    }

    private d bm() {
        switch (this.gk) {
            case RESOURCE_CACHE:
                return new q(this.gc, this);
            case DATA_CACHE:
                return new a(this.gc, this);
            case SOURCE:
                return new t(this.gc, this);
            case FINISHED:
                return null;
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("Unrecognized stage: ");
                sb.append(this.gk);
                throw new IllegalStateException(sb.toString());
        }
    }

    private void bn() {
        this.go = Thread.currentThread();
        this.gm = com.bumptech.glide.util.e.fm();
        boolean z = false;
        while (!this.fc && this.gu != null) {
            z = this.gu.aS();
            if (z) {
                break;
            }
            this.gk = a(this.gk);
            this.gu = bm();
            if (this.gk == Stage.SOURCE) {
                aV();
                return;
            }
        }
        if ((this.gk == Stage.FINISHED || this.fc) && !z) {
            notifyFailed();
        }
    }

    private void bo() {
        this.ge.fv();
        if (!this.gv) {
            this.gv = true;
            return;
        }
        throw new IllegalStateException("Already notified");
    }

    private void bp() {
        if (Log.isLoggable(TAG, 2)) {
            long j = this.gm;
            StringBuilder sb = new StringBuilder();
            sb.append("data: ");
            sb.append(this.gr);
            sb.append(", cache key: ");
            sb.append(this.gp);
            sb.append(", fetcher: ");
            sb.append(this.gt);
            a("Retrieved data", j, sb.toString());
        }
        p pVar = null;
        try {
            pVar = a(this.gt, (Data) this.gr, this.gs);
        } catch (GlideException e2) {
            e2.a(this.gq, this.gs);
            this.gd.add(e2);
        }
        if (pVar != null) {
            b(pVar, this.gs);
        } else {
            bn();
        }
    }

    private int getPriority() {
        return this.fY.ordinal();
    }

    private void notifyFailed() {
        bo();
        this.gj.a(new GlideException("Failed to load resource", (List<Throwable>) new ArrayList<Throwable>(this.gd)));
        bj();
    }

    /* renamed from: a */
    public int compareTo(@NonNull DecodeJob<?> decodeJob) {
        int priority = getPriority() - decodeJob.getPriority();
        return priority == 0 ? this.order - decodeJob.order : priority;
    }

    /* access modifiers changed from: 0000 */
    public DecodeJob<R> a(com.bumptech.glide.e eVar, Object obj, i iVar, com.bumptech.glide.load.c cVar, int i, int i2, Class<?> cls, Class<R> cls2, Priority priority, g gVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, boolean z3, f fVar, a<R> aVar, int i3) {
        this.gc.a(eVar, obj, cVar, i, i2, gVar, cls, cls2, priority, fVar, map, z, z2, this.fU);
        this.bp = eVar;
        this.fP = cVar;
        this.fY = priority;
        this.gi = iVar;
        this.width = i;
        this.height = i2;
        this.fZ = gVar;
        this.gn = z3;
        this.fR = fVar;
        this.gj = aVar;
        this.order = i3;
        this.gl = RunReason.INITIALIZE;
        this.cy = obj;
        return this;
    }

    /* JADX WARNING: type inference failed for: r12v6, types: [com.bumptech.glide.load.engine.b] */
    /* access modifiers changed from: 0000 */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Unknown variable types count: 1 */
    @NonNull
    public <Z> p<Z> a(DataSource dataSource, @NonNull p<Z> pVar) {
        i iVar;
        p<Z> pVar2;
        EncodeStrategy encodeStrategy;
        r rVar;
        Class cls = pVar.get().getClass();
        h hVar = null;
        if (dataSource != DataSource.RESOURCE_DISK_CACHE) {
            i f = this.gc.f(cls);
            iVar = f;
            pVar2 = f.transform(this.bp, pVar, this.width, this.height);
        } else {
            pVar2 = pVar;
            iVar = null;
        }
        if (!pVar.equals(pVar2)) {
            pVar.recycle();
        }
        if (this.gc.a(pVar2)) {
            hVar = this.gc.b(pVar2);
            encodeStrategy = hVar.b(this.fR);
        } else {
            encodeStrategy = EncodeStrategy.NONE;
        }
        h hVar2 = hVar;
        if (!this.fZ.a(!this.gc.c(this.gp), dataSource, encodeStrategy)) {
            return pVar2;
        }
        if (hVar2 != null) {
            switch (encodeStrategy) {
                case SOURCE:
                    rVar = new b(this.gp, this.fP);
                    break;
                case TRANSFORMED:
                    r rVar2 = new r(this.gc.L(), this.gp, this.fP, this.width, this.height, iVar, cls, this.fR);
                    rVar = rVar2;
                    break;
                default:
                    StringBuilder sb = new StringBuilder();
                    sb.append("Unknown strategy: ");
                    sb.append(encodeStrategy);
                    throw new IllegalArgumentException(sb.toString());
            }
            o f2 = o.f(pVar2);
            this.gg.a(rVar, hVar2, f2);
            return f2;
        }
        throw new NoResultEncoderAvailableException(pVar2.get().getClass());
    }

    public void a(com.bumptech.glide.load.c cVar, Exception exc, com.bumptech.glide.load.a.d<?> dVar, DataSource dataSource) {
        dVar.cleanup();
        GlideException glideException = new GlideException("Fetching data failed", (Throwable) exc);
        glideException.a(cVar, dataSource, dVar.aJ());
        this.gd.add(glideException);
        if (Thread.currentThread() != this.go) {
            this.gl = RunReason.SWITCH_TO_SOURCE_SERVICE;
            this.gj.b(this);
            return;
        }
        bn();
    }

    public void a(com.bumptech.glide.load.c cVar, Object obj, com.bumptech.glide.load.a.d<?> dVar, DataSource dataSource, com.bumptech.glide.load.c cVar2) {
        this.gp = cVar;
        this.gr = obj;
        this.gt = dVar;
        this.gs = dataSource;
        this.gq = cVar2;
        if (Thread.currentThread() != this.go) {
            this.gl = RunReason.DECODE_DATA;
            this.gj.b(this);
            return;
        }
        com.bumptech.glide.util.a.b.beginSection("DecodeJob.decodeFromRetrievedData");
        try {
            bp();
        } finally {
            com.bumptech.glide.util.a.b.endSection();
        }
    }

    public void aV() {
        this.gl = RunReason.SWITCH_TO_SOURCE_SERVICE;
        this.gj.b(this);
    }

    /* access modifiers changed from: 0000 */
    public boolean bh() {
        Stage a2 = a(Stage.INITIALIZE);
        return a2 == Stage.RESOURCE_CACHE || a2 == Stage.DATA_CACHE;
    }

    @NonNull
    public com.bumptech.glide.util.a.c bq() {
        return this.ge;
    }

    public void cancel() {
        this.fc = true;
        d dVar = this.gu;
        if (dVar != null) {
            dVar.cancel();
        }
    }

    /* access modifiers changed from: 0000 */
    public void release(boolean z) {
        if (this.gh.e(z)) {
            bk();
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x001c, code lost:
        if (r0 != null) goto L_0x001e;
     */
    public void run() {
        com.bumptech.glide.util.a.b.b("DecodeJob#run(model=%s)", this.cy);
        com.bumptech.glide.load.a.d<?> dVar = this.gt;
        try {
            if (this.fc) {
                notifyFailed();
                if (dVar != null) {
                    dVar.cleanup();
                }
                com.bumptech.glide.util.a.b.endSection();
                return;
            }
            bl();
        } catch (Throwable th) {
            if (dVar != null) {
                dVar.cleanup();
            }
            com.bumptech.glide.util.a.b.endSection();
            throw th;
        }
    }
}
