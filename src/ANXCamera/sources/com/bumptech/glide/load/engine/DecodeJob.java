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
    private com.bumptech.glide.e ao;
    private Object bu;
    private com.bumptech.glide.load.c eO;
    private f eQ;
    private final d eT;
    private Priority eX;
    private g eY;
    private volatile boolean eb;
    private final e<R> fb = new e<>();
    private final List<Throwable> fc = new ArrayList();
    private final com.bumptech.glide.util.a.c fd = com.bumptech.glide.util.a.c.eS();
    private final Pool<DecodeJob<?>> fe;
    private final c<?> ff = new c<>();
    private final e fg = new e();
    private i fh;
    private a<R> fi;
    private Stage fj;
    private RunReason fk;
    private long fl;
    private boolean fm;
    private Thread fn;
    private com.bumptech.glide.load.c fo;
    private com.bumptech.glide.load.c fp;
    private Object fq;
    private DataSource fr;
    private com.bumptech.glide.load.a.d<?> fs;
    private volatile d ft;
    private volatile boolean fu;
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
        private o<Z> fA;
        private h<Z> fz;
        private com.bumptech.glide.load.c key;

        c() {
        }

        /* access modifiers changed from: 0000 */
        public <X> void a(com.bumptech.glide.load.c cVar, h<X> hVar, o<X> oVar) {
            this.key = cVar;
            this.fz = hVar;
            this.fA = oVar;
        }

        /* access modifiers changed from: 0000 */
        public void a(d dVar, f fVar) {
            com.bumptech.glide.util.a.b.beginSection("DecodeJob.encode");
            try {
                dVar.aw().a(this.key, new c(this.fz, this.fA, fVar));
            } finally {
                this.fA.unlock();
                com.bumptech.glide.util.a.b.endSection();
            }
        }

        /* access modifiers changed from: 0000 */
        public boolean aR() {
            return this.fA != null;
        }

        /* access modifiers changed from: 0000 */
        public void clear() {
            this.key = null;
            this.fz = null;
            this.fA = null;
        }
    }

    interface d {
        com.bumptech.glide.load.engine.a.a aw();
    }

    private static class e {
        private boolean fB;
        private boolean fC;
        private boolean fD;

        e() {
        }

        private boolean f(boolean z) {
            return (this.fD || z || this.fC) && this.fB;
        }

        /* access modifiers changed from: 0000 */
        public synchronized boolean aS() {
            this.fC = true;
            return f(false);
        }

        /* access modifiers changed from: 0000 */
        public synchronized boolean aT() {
            this.fD = true;
            return f(false);
        }

        /* access modifiers changed from: 0000 */
        public synchronized boolean e(boolean z) {
            this.fB = true;
            return f(z);
        }

        /* access modifiers changed from: 0000 */
        public synchronized void reset() {
            this.fC = false;
            this.fB = false;
            this.fD = false;
        }
    }

    DecodeJob(d dVar, Pool<DecodeJob<?>> pool) {
        this.eT = dVar;
        this.fe = pool;
    }

    private Stage a(Stage stage) {
        switch (stage) {
            case RESOURCE_CACHE:
                return this.eY.aV() ? Stage.DATA_CACHE : a(Stage.DATA_CACHE);
            case DATA_CACHE:
                return this.fm ? Stage.FINISHED : Stage.SOURCE;
            case SOURCE:
            case FINISHED:
                return Stage.FINISHED;
            case INITIALIZE:
                return this.eY.aU() ? Stage.RESOURCE_CACHE : a(Stage.RESOURCE_CACHE);
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
        return a(data, dataSource, this.fb.d(data.getClass()));
    }

    private <Data, ResourceType> p<R> a(Data data, DataSource dataSource, n<Data, ResourceType, R> nVar) throws GlideException {
        f a2 = a(dataSource);
        com.bumptech.glide.load.a.e e2 = this.ao.r().e(data);
        try {
            return nVar.a(e2, a2, this.width, this.height, new b(dataSource));
        } finally {
            e2.cleanup();
        }
    }

    @NonNull
    private f a(DataSource dataSource) {
        f fVar = this.eQ;
        if (VERSION.SDK_INT < 26 || fVar.a(n.lq) != null) {
            return fVar;
        }
        if (dataSource == DataSource.RESOURCE_DISK_CACHE || this.fb.aE()) {
            fVar = new f();
            fVar.a(this.eQ);
            fVar.a(n.lq, Boolean.valueOf(true));
        }
        return fVar;
    }

    private void a(p<R> pVar, DataSource dataSource) {
        aO();
        this.fi.c(pVar, dataSource);
    }

    private void a(String str, long j, String str2) {
        String str3;
        String str4 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(" in ");
        sb.append(com.bumptech.glide.util.e.f(j));
        sb.append(", load key: ");
        sb.append(this.fh);
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
        if (this.fg.aS()) {
            aK();
        }
    }

    private void aJ() {
        if (this.fg.aT()) {
            aK();
        }
    }

    private void aK() {
        this.fg.reset();
        this.ff.clear();
        this.fb.clear();
        this.fu = false;
        this.ao = null;
        this.eO = null;
        this.eQ = null;
        this.eX = null;
        this.fh = null;
        this.fi = null;
        this.fj = null;
        this.ft = null;
        this.fn = null;
        this.fo = null;
        this.fq = null;
        this.fr = null;
        this.fs = null;
        this.fl = 0;
        this.eb = false;
        this.bu = null;
        this.fc.clear();
        this.fe.release(this);
    }

    private void aL() {
        switch (this.fk) {
            case INITIALIZE:
                this.fj = a(Stage.INITIALIZE);
                this.ft = aM();
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
                sb.append(this.fk);
                throw new IllegalStateException(sb.toString());
        }
    }

    private d aM() {
        switch (this.fj) {
            case RESOURCE_CACHE:
                return new q(this.fb, this);
            case DATA_CACHE:
                return new a(this.fb, this);
            case SOURCE:
                return new t(this.fb, this);
            case FINISHED:
                return null;
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("Unrecognized stage: ");
                sb.append(this.fj);
                throw new IllegalStateException(sb.toString());
        }
    }

    private void aN() {
        this.fn = Thread.currentThread();
        this.fl = com.bumptech.glide.util.e.eK();
        boolean z = false;
        while (!this.eb && this.ft != null) {
            z = this.ft.as();
            if (z) {
                break;
            }
            this.fj = a(this.fj);
            this.ft = aM();
            if (this.fj == Stage.SOURCE) {
                av();
                return;
            }
        }
        if ((this.fj == Stage.FINISHED || this.eb) && !z) {
            notifyFailed();
        }
    }

    private void aO() {
        this.fd.eT();
        if (!this.fu) {
            this.fu = true;
            return;
        }
        throw new IllegalStateException("Already notified");
    }

    private void aP() {
        if (Log.isLoggable(TAG, 2)) {
            long j = this.fl;
            StringBuilder sb = new StringBuilder();
            sb.append("data: ");
            sb.append(this.fq);
            sb.append(", cache key: ");
            sb.append(this.fo);
            sb.append(", fetcher: ");
            sb.append(this.fs);
            a("Retrieved data", j, sb.toString());
        }
        p pVar = null;
        try {
            pVar = a(this.fs, (Data) this.fq, this.fr);
        } catch (GlideException e2) {
            e2.a(this.fp, this.fr);
            this.fc.add(e2);
        }
        if (pVar != null) {
            b(pVar, this.fr);
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
        if (this.ff.aR()) {
            r3 = o.f(pVar);
            oVar = r3;
            pVar = r3;
        }
        a((p<R>) pVar, dataSource);
        this.fj = Stage.ENCODE;
        try {
            if (this.ff.aR()) {
                this.ff.a(this.eT, this.eQ);
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
        return this.eX.ordinal();
    }

    private void notifyFailed() {
        aO();
        this.fi.a(new GlideException("Failed to load resource", (List<Throwable>) new ArrayList<Throwable>(this.fc)));
        aJ();
    }

    /* renamed from: a */
    public int compareTo(@NonNull DecodeJob<?> decodeJob) {
        int priority = getPriority() - decodeJob.getPriority();
        return priority == 0 ? this.order - decodeJob.order : priority;
    }

    /* access modifiers changed from: 0000 */
    public DecodeJob<R> a(com.bumptech.glide.e eVar, Object obj, i iVar, com.bumptech.glide.load.c cVar, int i, int i2, Class<?> cls, Class<R> cls2, Priority priority, g gVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, boolean z3, f fVar, a<R> aVar, int i3) {
        this.fb.a(eVar, obj, cVar, i, i2, gVar, cls, cls2, priority, fVar, map, z, z2, this.eT);
        this.ao = eVar;
        this.eO = cVar;
        this.eX = priority;
        this.fh = iVar;
        this.width = i;
        this.height = i2;
        this.eY = gVar;
        this.fm = z3;
        this.eQ = fVar;
        this.fi = aVar;
        this.order = i3;
        this.fk = RunReason.INITIALIZE;
        this.bu = obj;
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
            i e2 = this.fb.e(cls);
            iVar = e2;
            pVar2 = e2.transform(this.ao, pVar, this.width, this.height);
        } else {
            pVar2 = pVar;
            iVar = null;
        }
        if (!pVar.equals(pVar2)) {
            pVar.recycle();
        }
        if (this.fb.a(pVar2)) {
            hVar = this.fb.b(pVar2);
            encodeStrategy = hVar.b(this.eQ);
        } else {
            encodeStrategy = EncodeStrategy.NONE;
        }
        h hVar2 = hVar;
        if (!this.eY.a(!this.fb.c(this.fo), dataSource, encodeStrategy)) {
            return pVar2;
        }
        if (hVar2 != null) {
            switch (encodeStrategy) {
                case SOURCE:
                    rVar = new b(this.fo, this.eO);
                    break;
                case TRANSFORMED:
                    r rVar2 = new r(this.fb.l(), this.fo, this.eO, this.width, this.height, iVar, cls, this.eQ);
                    rVar = rVar2;
                    break;
                default:
                    StringBuilder sb = new StringBuilder();
                    sb.append("Unknown strategy: ");
                    sb.append(encodeStrategy);
                    throw new IllegalArgumentException(sb.toString());
            }
            o f = o.f(pVar2);
            this.ff.a(rVar, hVar2, f);
            return f;
        }
        throw new NoResultEncoderAvailableException(pVar2.get().getClass());
    }

    public void a(com.bumptech.glide.load.c cVar, Exception exc, com.bumptech.glide.load.a.d<?> dVar, DataSource dataSource) {
        dVar.cleanup();
        GlideException glideException = new GlideException("Fetching data failed", (Throwable) exc);
        glideException.a(cVar, dataSource, dVar.aj());
        this.fc.add(glideException);
        if (Thread.currentThread() != this.fn) {
            this.fk = RunReason.SWITCH_TO_SOURCE_SERVICE;
            this.fi.b(this);
            return;
        }
        aN();
    }

    public void a(com.bumptech.glide.load.c cVar, Object obj, com.bumptech.glide.load.a.d<?> dVar, DataSource dataSource, com.bumptech.glide.load.c cVar2) {
        this.fo = cVar;
        this.fq = obj;
        this.fs = dVar;
        this.fr = dataSource;
        this.fp = cVar2;
        if (Thread.currentThread() != this.fn) {
            this.fk = RunReason.DECODE_DATA;
            this.fi.b(this);
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
        return this.fd;
    }

    public void av() {
        this.fk = RunReason.SWITCH_TO_SOURCE_SERVICE;
        this.fi.b(this);
    }

    public void cancel() {
        this.eb = true;
        d dVar = this.ft;
        if (dVar != null) {
            dVar.cancel();
        }
    }

    /* access modifiers changed from: 0000 */
    public void release(boolean z) {
        if (this.fg.e(z)) {
            aK();
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x001c, code lost:
        if (r0 != null) goto L_0x001e;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void run() {
        com.bumptech.glide.util.a.b.b("DecodeJob#run(model=%s)", this.bu);
        com.bumptech.glide.load.a.d<?> dVar = this.fs;
        try {
            if (this.eb) {
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
