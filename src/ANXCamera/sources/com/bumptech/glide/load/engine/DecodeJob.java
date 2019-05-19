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
    private com.bumptech.glide.e an;
    private Object bt;
    private com.bumptech.glide.load.c eN;
    private f eP;
    private final d eS;
    private Priority eW;
    private g eX;
    private volatile boolean ea;
    private final e<R> fa = new e<>();
    private final List<Throwable> fb = new ArrayList();
    private final com.bumptech.glide.util.a.c fc = com.bumptech.glide.util.a.c.eS();
    private final Pool<DecodeJob<?>> fd;
    private final c<?> fe = new c<>();
    private final e ff = new e();
    private i fg;
    private a<R> fh;
    private Stage fi;
    private RunReason fj;
    private long fk;
    private boolean fl;
    private Thread fm;
    private com.bumptech.glide.load.c fn;
    private com.bumptech.glide.load.c fo;
    private Object fp;
    private DataSource fq;
    private com.bumptech.glide.load.a.d<?> fr;
    private volatile d fs;
    private volatile boolean ft;
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
        private h<Z> fy;
        private o<Z> fz;
        private com.bumptech.glide.load.c key;

        c() {
        }

        /* access modifiers changed from: 0000 */
        public <X> void a(com.bumptech.glide.load.c cVar, h<X> hVar, o<X> oVar) {
            this.key = cVar;
            this.fy = hVar;
            this.fz = oVar;
        }

        /* access modifiers changed from: 0000 */
        public void a(d dVar, f fVar) {
            com.bumptech.glide.util.a.b.beginSection("DecodeJob.encode");
            try {
                dVar.aw().a(this.key, new c(this.fy, this.fz, fVar));
            } finally {
                this.fz.unlock();
                com.bumptech.glide.util.a.b.endSection();
            }
        }

        /* access modifiers changed from: 0000 */
        public boolean aR() {
            return this.fz != null;
        }

        /* access modifiers changed from: 0000 */
        public void clear() {
            this.key = null;
            this.fy = null;
            this.fz = null;
        }
    }

    interface d {
        com.bumptech.glide.load.engine.a.a aw();
    }

    private static class e {
        private boolean fA;
        private boolean fB;
        private boolean fC;

        e() {
        }

        private boolean f(boolean z) {
            return (this.fC || z || this.fB) && this.fA;
        }

        /* access modifiers changed from: 0000 */
        public synchronized boolean aS() {
            this.fB = true;
            return f(false);
        }

        /* access modifiers changed from: 0000 */
        public synchronized boolean aT() {
            this.fC = true;
            return f(false);
        }

        /* access modifiers changed from: 0000 */
        public synchronized boolean e(boolean z) {
            this.fA = true;
            return f(z);
        }

        /* access modifiers changed from: 0000 */
        public synchronized void reset() {
            this.fB = false;
            this.fA = false;
            this.fC = false;
        }
    }

    DecodeJob(d dVar, Pool<DecodeJob<?>> pool) {
        this.eS = dVar;
        this.fd = pool;
    }

    private Stage a(Stage stage) {
        switch (stage) {
            case RESOURCE_CACHE:
                return this.eX.aV() ? Stage.DATA_CACHE : a(Stage.DATA_CACHE);
            case DATA_CACHE:
                return this.fl ? Stage.FINISHED : Stage.SOURCE;
            case SOURCE:
            case FINISHED:
                return Stage.FINISHED;
            case INITIALIZE:
                return this.eX.aU() ? Stage.RESOURCE_CACHE : a(Stage.RESOURCE_CACHE);
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
        return a(data, dataSource, this.fa.d(data.getClass()));
    }

    private <Data, ResourceType> p<R> a(Data data, DataSource dataSource, n<Data, ResourceType, R> nVar) throws GlideException {
        f a2 = a(dataSource);
        com.bumptech.glide.load.a.e e2 = this.an.r().e(data);
        try {
            return nVar.a(e2, a2, this.width, this.height, new b(dataSource));
        } finally {
            e2.cleanup();
        }
    }

    @NonNull
    private f a(DataSource dataSource) {
        f fVar = this.eP;
        if (VERSION.SDK_INT < 26 || fVar.a(n.lp) != null) {
            return fVar;
        }
        if (dataSource == DataSource.RESOURCE_DISK_CACHE || this.fa.aE()) {
            fVar = new f();
            fVar.a(this.eP);
            fVar.a(n.lp, Boolean.valueOf(true));
        }
        return fVar;
    }

    private void a(p<R> pVar, DataSource dataSource) {
        aO();
        this.fh.c(pVar, dataSource);
    }

    private void a(String str, long j, String str2) {
        String str3;
        String str4 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(" in ");
        sb.append(com.bumptech.glide.util.e.f(j));
        sb.append(", load key: ");
        sb.append(this.fg);
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
        if (this.ff.aS()) {
            aK();
        }
    }

    private void aJ() {
        if (this.ff.aT()) {
            aK();
        }
    }

    private void aK() {
        this.ff.reset();
        this.fe.clear();
        this.fa.clear();
        this.ft = false;
        this.an = null;
        this.eN = null;
        this.eP = null;
        this.eW = null;
        this.fg = null;
        this.fh = null;
        this.fi = null;
        this.fs = null;
        this.fm = null;
        this.fn = null;
        this.fp = null;
        this.fq = null;
        this.fr = null;
        this.fk = 0;
        this.ea = false;
        this.bt = null;
        this.fb.clear();
        this.fd.release(this);
    }

    private void aL() {
        switch (this.fj) {
            case INITIALIZE:
                this.fi = a(Stage.INITIALIZE);
                this.fs = aM();
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
                sb.append(this.fj);
                throw new IllegalStateException(sb.toString());
        }
    }

    private d aM() {
        switch (this.fi) {
            case RESOURCE_CACHE:
                return new q(this.fa, this);
            case DATA_CACHE:
                return new a(this.fa, this);
            case SOURCE:
                return new t(this.fa, this);
            case FINISHED:
                return null;
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("Unrecognized stage: ");
                sb.append(this.fi);
                throw new IllegalStateException(sb.toString());
        }
    }

    private void aN() {
        this.fm = Thread.currentThread();
        this.fk = com.bumptech.glide.util.e.eK();
        boolean z = false;
        while (!this.ea && this.fs != null) {
            z = this.fs.as();
            if (z) {
                break;
            }
            this.fi = a(this.fi);
            this.fs = aM();
            if (this.fi == Stage.SOURCE) {
                av();
                return;
            }
        }
        if ((this.fi == Stage.FINISHED || this.ea) && !z) {
            notifyFailed();
        }
    }

    private void aO() {
        this.fc.eT();
        if (!this.ft) {
            this.ft = true;
            return;
        }
        throw new IllegalStateException("Already notified");
    }

    private void aP() {
        if (Log.isLoggable(TAG, 2)) {
            long j = this.fk;
            StringBuilder sb = new StringBuilder();
            sb.append("data: ");
            sb.append(this.fp);
            sb.append(", cache key: ");
            sb.append(this.fn);
            sb.append(", fetcher: ");
            sb.append(this.fr);
            a("Retrieved data", j, sb.toString());
        }
        p pVar = null;
        try {
            pVar = a(this.fr, (Data) this.fp, this.fq);
        } catch (GlideException e2) {
            e2.a(this.fo, this.fq);
            this.fb.add(e2);
        }
        if (pVar != null) {
            b(pVar, this.fq);
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
        if (this.fe.aR()) {
            r3 = o.f(pVar);
            oVar = r3;
            pVar = r3;
        }
        a((p<R>) pVar, dataSource);
        this.fi = Stage.ENCODE;
        try {
            if (this.fe.aR()) {
                this.fe.a(this.eS, this.eP);
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
        return this.eW.ordinal();
    }

    private void notifyFailed() {
        aO();
        this.fh.a(new GlideException("Failed to load resource", (List<Throwable>) new ArrayList<Throwable>(this.fb)));
        aJ();
    }

    /* renamed from: a */
    public int compareTo(@NonNull DecodeJob<?> decodeJob) {
        int priority = getPriority() - decodeJob.getPriority();
        return priority == 0 ? this.order - decodeJob.order : priority;
    }

    /* access modifiers changed from: 0000 */
    public DecodeJob<R> a(com.bumptech.glide.e eVar, Object obj, i iVar, com.bumptech.glide.load.c cVar, int i, int i2, Class<?> cls, Class<R> cls2, Priority priority, g gVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, boolean z3, f fVar, a<R> aVar, int i3) {
        this.fa.a(eVar, obj, cVar, i, i2, gVar, cls, cls2, priority, fVar, map, z, z2, this.eS);
        this.an = eVar;
        this.eN = cVar;
        this.eW = priority;
        this.fg = iVar;
        this.width = i;
        this.height = i2;
        this.eX = gVar;
        this.fl = z3;
        this.eP = fVar;
        this.fh = aVar;
        this.order = i3;
        this.fj = RunReason.INITIALIZE;
        this.bt = obj;
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
            i e2 = this.fa.e(cls);
            iVar = e2;
            pVar2 = e2.transform(this.an, pVar, this.width, this.height);
        } else {
            pVar2 = pVar;
            iVar = null;
        }
        if (!pVar.equals(pVar2)) {
            pVar.recycle();
        }
        if (this.fa.a(pVar2)) {
            hVar = this.fa.b(pVar2);
            encodeStrategy = hVar.b(this.eP);
        } else {
            encodeStrategy = EncodeStrategy.NONE;
        }
        h hVar2 = hVar;
        if (!this.eX.a(!this.fa.c(this.fn), dataSource, encodeStrategy)) {
            return pVar2;
        }
        if (hVar2 != null) {
            switch (encodeStrategy) {
                case SOURCE:
                    rVar = new b(this.fn, this.eN);
                    break;
                case TRANSFORMED:
                    r rVar2 = new r(this.fa.l(), this.fn, this.eN, this.width, this.height, iVar, cls, this.eP);
                    rVar = rVar2;
                    break;
                default:
                    StringBuilder sb = new StringBuilder();
                    sb.append("Unknown strategy: ");
                    sb.append(encodeStrategy);
                    throw new IllegalArgumentException(sb.toString());
            }
            o f = o.f(pVar2);
            this.fe.a(rVar, hVar2, f);
            return f;
        }
        throw new NoResultEncoderAvailableException(pVar2.get().getClass());
    }

    public void a(com.bumptech.glide.load.c cVar, Exception exc, com.bumptech.glide.load.a.d<?> dVar, DataSource dataSource) {
        dVar.cleanup();
        GlideException glideException = new GlideException("Fetching data failed", (Throwable) exc);
        glideException.a(cVar, dataSource, dVar.aj());
        this.fb.add(glideException);
        if (Thread.currentThread() != this.fm) {
            this.fj = RunReason.SWITCH_TO_SOURCE_SERVICE;
            this.fh.b(this);
            return;
        }
        aN();
    }

    public void a(com.bumptech.glide.load.c cVar, Object obj, com.bumptech.glide.load.a.d<?> dVar, DataSource dataSource, com.bumptech.glide.load.c cVar2) {
        this.fn = cVar;
        this.fp = obj;
        this.fr = dVar;
        this.fq = dataSource;
        this.fo = cVar2;
        if (Thread.currentThread() != this.fm) {
            this.fj = RunReason.DECODE_DATA;
            this.fh.b(this);
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
        return this.fc;
    }

    public void av() {
        this.fj = RunReason.SWITCH_TO_SOURCE_SERVICE;
        this.fh.b(this);
    }

    public void cancel() {
        this.ea = true;
        d dVar = this.fs;
        if (dVar != null) {
            dVar.cancel();
        }
    }

    /* access modifiers changed from: 0000 */
    public void release(boolean z) {
        if (this.ff.e(z)) {
            aK();
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x001c, code lost:
        if (r0 != null) goto L_0x001e;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void run() {
        com.bumptech.glide.util.a.b.b("DecodeJob#run(model=%s)", this.bt);
        com.bumptech.glide.load.a.d<?> dVar = this.fr;
        try {
            if (this.ea) {
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
