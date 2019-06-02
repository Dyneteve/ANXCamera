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
    private com.bumptech.glide.e ap;
    private Object bv;
    private com.bumptech.glide.load.c eP;
    private f eR;
    private final d eU;
    private Priority eY;
    private g eZ;
    private volatile boolean ec;
    private final e<R> fc = new e<>();
    private final List<Throwable> fd = new ArrayList();
    private final com.bumptech.glide.util.a.c fe = com.bumptech.glide.util.a.c.eS();
    private final Pool<DecodeJob<?>> ff;
    private final c<?> fg = new c<>();
    private final e fh = new e();
    private i fi;
    private a<R> fj;
    private Stage fk;
    private RunReason fl;
    private long fm;
    private boolean fn;
    private Thread fo;
    private com.bumptech.glide.load.c fp;
    private com.bumptech.glide.load.c fq;
    private Object fr;
    private DataSource fs;
    private com.bumptech.glide.load.a.d<?> ft;
    private volatile d fu;
    private volatile boolean fv;
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
        private h<Z> fA;
        private o<Z> fB;
        private com.bumptech.glide.load.c key;

        c() {
        }

        /* access modifiers changed from: 0000 */
        public <X> void a(com.bumptech.glide.load.c cVar, h<X> hVar, o<X> oVar) {
            this.key = cVar;
            this.fA = hVar;
            this.fB = oVar;
        }

        /* access modifiers changed from: 0000 */
        public void a(d dVar, f fVar) {
            com.bumptech.glide.util.a.b.beginSection("DecodeJob.encode");
            try {
                dVar.aw().a(this.key, new c(this.fA, this.fB, fVar));
            } finally {
                this.fB.unlock();
                com.bumptech.glide.util.a.b.endSection();
            }
        }

        /* access modifiers changed from: 0000 */
        public boolean aR() {
            return this.fB != null;
        }

        /* access modifiers changed from: 0000 */
        public void clear() {
            this.key = null;
            this.fA = null;
            this.fB = null;
        }
    }

    interface d {
        com.bumptech.glide.load.engine.a.a aw();
    }

    private static class e {
        private boolean fC;
        private boolean fD;
        private boolean fE;

        e() {
        }

        private boolean f(boolean z) {
            return (this.fE || z || this.fD) && this.fC;
        }

        /* access modifiers changed from: 0000 */
        public synchronized boolean aS() {
            this.fD = true;
            return f(false);
        }

        /* access modifiers changed from: 0000 */
        public synchronized boolean aT() {
            this.fE = true;
            return f(false);
        }

        /* access modifiers changed from: 0000 */
        public synchronized boolean e(boolean z) {
            this.fC = true;
            return f(z);
        }

        /* access modifiers changed from: 0000 */
        public synchronized void reset() {
            this.fD = false;
            this.fC = false;
            this.fE = false;
        }
    }

    DecodeJob(d dVar, Pool<DecodeJob<?>> pool) {
        this.eU = dVar;
        this.ff = pool;
    }

    private Stage a(Stage stage) {
        switch (stage) {
            case RESOURCE_CACHE:
                return this.eZ.aV() ? Stage.DATA_CACHE : a(Stage.DATA_CACHE);
            case DATA_CACHE:
                return this.fn ? Stage.FINISHED : Stage.SOURCE;
            case SOURCE:
            case FINISHED:
                return Stage.FINISHED;
            case INITIALIZE:
                return this.eZ.aU() ? Stage.RESOURCE_CACHE : a(Stage.RESOURCE_CACHE);
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
            long eK = com.bumptech.glide.util.e.eK();
            p<R> a2 = a(data, dataSource);
            if (Log.isLoggable(TAG, 2)) {
                StringBuilder sb = new StringBuilder();
                sb.append("Decoded result ");
                sb.append(a2);
                b(sb.toString(), eK);
            }
            return a2;
        } finally {
            dVar.cleanup();
        }
    }

    private <Data> p<R> a(Data data, DataSource dataSource) throws GlideException {
        return a(data, dataSource, this.fc.d(data.getClass()));
    }

    private <Data, ResourceType> p<R> a(Data data, DataSource dataSource, n<Data, ResourceType, R> nVar) throws GlideException {
        f a2 = a(dataSource);
        com.bumptech.glide.load.a.e e2 = this.ap.r().e(data);
        try {
            return nVar.a(e2, a2, this.width, this.height, new b(dataSource));
        } finally {
            e2.cleanup();
        }
    }

    @NonNull
    private f a(DataSource dataSource) {
        f fVar = this.eR;
        if (VERSION.SDK_INT < 26 || fVar.a(n.lr) != null) {
            return fVar;
        }
        if (dataSource == DataSource.RESOURCE_DISK_CACHE || this.fc.aE()) {
            fVar = new f();
            fVar.a(this.eR);
            fVar.a(n.lr, Boolean.valueOf(true));
        }
        return fVar;
    }

    private void a(p<R> pVar, DataSource dataSource) {
        aO();
        this.fj.c(pVar, dataSource);
    }

    private void a(String str, long j, String str2) {
        String str3;
        String str4 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(" in ");
        sb.append(com.bumptech.glide.util.e.f(j));
        sb.append(", load key: ");
        sb.append(this.fi);
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

    private void aI() {
        if (this.fh.aS()) {
            aK();
        }
    }

    private void aJ() {
        if (this.fh.aT()) {
            aK();
        }
    }

    private void aK() {
        this.fh.reset();
        this.fg.clear();
        this.fc.clear();
        this.fv = false;
        this.ap = null;
        this.eP = null;
        this.eR = null;
        this.eY = null;
        this.fi = null;
        this.fj = null;
        this.fk = null;
        this.fu = null;
        this.fo = null;
        this.fp = null;
        this.fr = null;
        this.fs = null;
        this.ft = null;
        this.fm = 0;
        this.ec = false;
        this.bv = null;
        this.fd.clear();
        this.ff.release(this);
    }

    private void aL() {
        switch (this.fl) {
            case INITIALIZE:
                this.fk = a(Stage.INITIALIZE);
                this.fu = aM();
                aN();
                return;
            case SWITCH_TO_SOURCE_SERVICE:
                aN();
                return;
            case DECODE_DATA:
                aP();
                return;
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("Unrecognized run reason: ");
                sb.append(this.fl);
                throw new IllegalStateException(sb.toString());
        }
    }

    private d aM() {
        switch (this.fk) {
            case RESOURCE_CACHE:
                return new q(this.fc, this);
            case DATA_CACHE:
                return new a(this.fc, this);
            case SOURCE:
                return new t(this.fc, this);
            case FINISHED:
                return null;
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("Unrecognized stage: ");
                sb.append(this.fk);
                throw new IllegalStateException(sb.toString());
        }
    }

    private void aN() {
        this.fo = Thread.currentThread();
        this.fm = com.bumptech.glide.util.e.eK();
        boolean z = false;
        while (!this.ec && this.fu != null) {
            z = this.fu.as();
            if (z) {
                break;
            }
            this.fk = a(this.fk);
            this.fu = aM();
            if (this.fk == Stage.SOURCE) {
                av();
                return;
            }
        }
        if ((this.fk == Stage.FINISHED || this.ec) && !z) {
            notifyFailed();
        }
    }

    private void aO() {
        this.fe.eT();
        if (!this.fv) {
            this.fv = true;
            return;
        }
        throw new IllegalStateException("Already notified");
    }

    private void aP() {
        if (Log.isLoggable(TAG, 2)) {
            long j = this.fm;
            StringBuilder sb = new StringBuilder();
            sb.append("data: ");
            sb.append(this.fr);
            sb.append(", cache key: ");
            sb.append(this.fp);
            sb.append(", fetcher: ");
            sb.append(this.ft);
            a("Retrieved data", j, sb.toString());
        }
        p pVar = null;
        try {
            pVar = a(this.ft, (Data) this.fr, this.fs);
        } catch (GlideException e2) {
            e2.a(this.fq, this.fs);
            this.fd.add(e2);
        }
        if (pVar != null) {
            b(pVar, this.fs);
        } else {
            aN();
        }
    }

    /* JADX INFO: finally extract failed */
    /* JADX WARNING: type inference failed for: r3v1, types: [com.bumptech.glide.load.engine.p] */
    /* JADX WARNING: type inference failed for: r3v7, types: [com.bumptech.glide.load.engine.o] */
    /* JADX WARNING: type inference failed for: r3v8 */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Unknown variable types count: 1 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void b(p<R> pVar, DataSource dataSource) {
        if (pVar instanceof l) {
            ((l) pVar).initialize();
        }
        o oVar = 0;
        if (this.fg.aR()) {
            r3 = o.f(pVar);
            oVar = r3;
            pVar = r3;
        }
        a((p<R>) pVar, dataSource);
        this.fk = Stage.ENCODE;
        try {
            if (this.fg.aR()) {
                this.fg.a(this.eU, this.eR);
            }
            if (oVar != 0) {
                oVar.unlock();
            }
            aI();
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

    private int getPriority() {
        return this.eY.ordinal();
    }

    private void notifyFailed() {
        aO();
        this.fj.a(new GlideException("Failed to load resource", (List<Throwable>) new ArrayList<Throwable>(this.fd)));
        aJ();
    }

    /* renamed from: a */
    public int compareTo(@NonNull DecodeJob<?> decodeJob) {
        int priority = getPriority() - decodeJob.getPriority();
        return priority == 0 ? this.order - decodeJob.order : priority;
    }

    /* access modifiers changed from: 0000 */
    public DecodeJob<R> a(com.bumptech.glide.e eVar, Object obj, i iVar, com.bumptech.glide.load.c cVar, int i, int i2, Class<?> cls, Class<R> cls2, Priority priority, g gVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, boolean z3, f fVar, a<R> aVar, int i3) {
        this.fc.a(eVar, obj, cVar, i, i2, gVar, cls, cls2, priority, fVar, map, z, z2, this.eU);
        this.ap = eVar;
        this.eP = cVar;
        this.eY = priority;
        this.fi = iVar;
        this.width = i;
        this.height = i2;
        this.eZ = gVar;
        this.fn = z3;
        this.eR = fVar;
        this.fj = aVar;
        this.order = i3;
        this.fl = RunReason.INITIALIZE;
        this.bv = obj;
        return this;
    }

    /* JADX WARNING: type inference failed for: r12v6, types: [com.bumptech.glide.load.engine.b] */
    /* access modifiers changed from: 0000 */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Unknown variable types count: 1 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @NonNull
    public <Z> p<Z> a(DataSource dataSource, @NonNull p<Z> pVar) {
        i iVar;
        p<Z> pVar2;
        EncodeStrategy encodeStrategy;
        r rVar;
        Class cls = pVar.get().getClass();
        h hVar = null;
        if (dataSource != DataSource.RESOURCE_DISK_CACHE) {
            i e2 = this.fc.e(cls);
            iVar = e2;
            pVar2 = e2.transform(this.ap, pVar, this.width, this.height);
        } else {
            pVar2 = pVar;
            iVar = null;
        }
        if (!pVar.equals(pVar2)) {
            pVar.recycle();
        }
        if (this.fc.a(pVar2)) {
            hVar = this.fc.b(pVar2);
            encodeStrategy = hVar.b(this.eR);
        } else {
            encodeStrategy = EncodeStrategy.NONE;
        }
        h hVar2 = hVar;
        if (!this.eZ.a(!this.fc.c(this.fp), dataSource, encodeStrategy)) {
            return pVar2;
        }
        if (hVar2 != null) {
            switch (encodeStrategy) {
                case SOURCE:
                    rVar = new b(this.fp, this.eP);
                    break;
                case TRANSFORMED:
                    r rVar2 = new r(this.fc.l(), this.fp, this.eP, this.width, this.height, iVar, cls, this.eR);
                    rVar = rVar2;
                    break;
                default:
                    StringBuilder sb = new StringBuilder();
                    sb.append("Unknown strategy: ");
                    sb.append(encodeStrategy);
                    throw new IllegalArgumentException(sb.toString());
            }
            o f = o.f(pVar2);
            this.fg.a(rVar, hVar2, f);
            return f;
        }
        throw new NoResultEncoderAvailableException(pVar2.get().getClass());
    }

    public void a(com.bumptech.glide.load.c cVar, Exception exc, com.bumptech.glide.load.a.d<?> dVar, DataSource dataSource) {
        dVar.cleanup();
        GlideException glideException = new GlideException("Fetching data failed", (Throwable) exc);
        glideException.a(cVar, dataSource, dVar.aj());
        this.fd.add(glideException);
        if (Thread.currentThread() != this.fo) {
            this.fl = RunReason.SWITCH_TO_SOURCE_SERVICE;
            this.fj.b(this);
            return;
        }
        aN();
    }

    public void a(com.bumptech.glide.load.c cVar, Object obj, com.bumptech.glide.load.a.d<?> dVar, DataSource dataSource, com.bumptech.glide.load.c cVar2) {
        this.fp = cVar;
        this.fr = obj;
        this.ft = dVar;
        this.fs = dataSource;
        this.fq = cVar2;
        if (Thread.currentThread() != this.fo) {
            this.fl = RunReason.DECODE_DATA;
            this.fj.b(this);
            return;
        }
        com.bumptech.glide.util.a.b.beginSection("DecodeJob.decodeFromRetrievedData");
        try {
            aP();
        } finally {
            com.bumptech.glide.util.a.b.endSection();
        }
    }

    /* access modifiers changed from: 0000 */
    public boolean aH() {
        Stage a2 = a(Stage.INITIALIZE);
        return a2 == Stage.RESOURCE_CACHE || a2 == Stage.DATA_CACHE;
    }

    @NonNull
    public com.bumptech.glide.util.a.c aQ() {
        return this.fe;
    }

    public void av() {
        this.fl = RunReason.SWITCH_TO_SOURCE_SERVICE;
        this.fj.b(this);
    }

    public void cancel() {
        this.ec = true;
        d dVar = this.fu;
        if (dVar != null) {
            dVar.cancel();
        }
    }

    /* access modifiers changed from: 0000 */
    public void release(boolean z) {
        if (this.fh.e(z)) {
            aK();
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x001c, code lost:
        if (r0 != null) goto L_0x001e;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void run() {
        com.bumptech.glide.util.a.b.b("DecodeJob#run(model=%s)", this.bv);
        com.bumptech.glide.load.a.d<?> dVar = this.ft;
        try {
            if (this.ec) {
                notifyFailed();
                if (dVar != null) {
                    dVar.cleanup();
                }
                com.bumptech.glide.util.a.b.endSection();
                return;
            }
            aL();
        } catch (Throwable th) {
            if (dVar != null) {
                dVar.cleanup();
            }
            com.bumptech.glide.util.a.b.endSection();
            throw th;
        }
    }
}
