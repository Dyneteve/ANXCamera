package com.bumptech.glide.load.engine;

import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.support.v4.util.Pools.Pool;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.request.g;
import com.bumptech.glide.util.a.a.c;
import com.bumptech.glide.util.k;
import java.util.ArrayList;
import java.util.List;

class EngineJob<R> implements a<R>, c {
    private static final EngineResourceFactory gq = new EngineResourceFactory();
    private static final Handler gr = new Handler(Looper.getMainLooper(), new a());
    private static final int gs = 1;
    private static final int gt = 2;
    private static final int gu = 3;
    private final com.bumptech.glide.load.engine.b.a aB;
    private final com.bumptech.glide.load.engine.b.a av;
    private final com.bumptech.glide.load.engine.b.a aw;
    private DataSource dataSource;
    private boolean eC;
    private p<?> eD;
    private volatile boolean ea;
    private final com.bumptech.glide.util.a.c fc;
    private final Pool<EngineJob<?>> fd;
    private boolean fl;
    private GlideException gA;
    private boolean gB;
    private List<g> gC;
    private k<?> gD;
    private DecodeJob<R> gE;
    private final com.bumptech.glide.load.engine.b.a gj;
    private final h gk;
    private final List<g> gv;
    private final EngineResourceFactory gw;
    private boolean gx;
    private boolean gy;
    private boolean gz;
    private com.bumptech.glide.load.c key;

    @VisibleForTesting
    static class EngineResourceFactory {
        EngineResourceFactory() {
        }

        public <R> k<R> a(p<R> pVar, boolean z) {
            return new k<>(pVar, z, true);
        }
    }

    private static class a implements Callback {
        a() {
        }

        public boolean handleMessage(Message message) {
            EngineJob engineJob = (EngineJob) message.obj;
            switch (message.what) {
                case 1:
                    engineJob.ba();
                    break;
                case 2:
                    engineJob.bc();
                    break;
                case 3:
                    engineJob.bb();
                    break;
                default:
                    StringBuilder sb = new StringBuilder();
                    sb.append("Unrecognized message: ");
                    sb.append(message.what);
                    throw new IllegalStateException(sb.toString());
            }
            return true;
        }
    }

    EngineJob(com.bumptech.glide.load.engine.b.a aVar, com.bumptech.glide.load.engine.b.a aVar2, com.bumptech.glide.load.engine.b.a aVar3, com.bumptech.glide.load.engine.b.a aVar4, h hVar, Pool<EngineJob<?>> pool) {
        this(aVar, aVar2, aVar3, aVar4, hVar, pool, gq);
    }

    @VisibleForTesting
    EngineJob(com.bumptech.glide.load.engine.b.a aVar, com.bumptech.glide.load.engine.b.a aVar2, com.bumptech.glide.load.engine.b.a aVar3, com.bumptech.glide.load.engine.b.a aVar4, h hVar, Pool<EngineJob<?>> pool, EngineResourceFactory engineResourceFactory) {
        this.gv = new ArrayList(2);
        this.fc = com.bumptech.glide.util.a.c.eS();
        this.aw = aVar;
        this.av = aVar2;
        this.gj = aVar3;
        this.aB = aVar4;
        this.gk = hVar;
        this.fd = pool;
        this.gw = engineResourceFactory;
    }

    private com.bumptech.glide.load.engine.b.a aZ() {
        return this.gx ? this.gj : this.gy ? this.aB : this.av;
    }

    private void c(g gVar) {
        if (this.gC == null) {
            this.gC = new ArrayList(2);
        }
        if (!this.gC.contains(gVar)) {
            this.gC.add(gVar);
        }
    }

    private boolean d(g gVar) {
        return this.gC != null && this.gC.contains(gVar);
    }

    private void release(boolean z) {
        k.eL();
        this.gv.clear();
        this.key = null;
        this.gD = null;
        this.eD = null;
        if (this.gC != null) {
            this.gC.clear();
        }
        this.gB = false;
        this.ea = false;
        this.gz = false;
        this.gE.release(z);
        this.gE = null;
        this.gA = null;
        this.dataSource = null;
        this.fd.release(this);
    }

    public void a(GlideException glideException) {
        this.gA = glideException;
        gr.obtainMessage(2, this).sendToTarget();
    }

    /* access modifiers changed from: 0000 */
    public void a(g gVar) {
        k.eL();
        this.fc.eT();
        if (this.gz) {
            gVar.c(this.gD, this.dataSource);
        } else if (this.gB) {
            gVar.a(this.gA);
        } else {
            this.gv.add(gVar);
        }
    }

    @NonNull
    public com.bumptech.glide.util.a.c aQ() {
        return this.fc;
    }

    /* access modifiers changed from: 0000 */
    public boolean aY() {
        return this.fl;
    }

    public void b(DecodeJob<?> decodeJob) {
        aZ().execute(decodeJob);
    }

    /* access modifiers changed from: 0000 */
    public void b(g gVar) {
        k.eL();
        this.fc.eT();
        if (this.gz || this.gB) {
            c(gVar);
            return;
        }
        this.gv.remove(gVar);
        if (this.gv.isEmpty()) {
            cancel();
        }
    }

    /* access modifiers changed from: 0000 */
    public void ba() {
        this.fc.eT();
        if (this.ea) {
            this.eD.recycle();
            release(false);
        } else if (this.gv.isEmpty()) {
            throw new IllegalStateException("Received a resource without any callbacks to notify");
        } else if (!this.gz) {
            this.gD = this.gw.a(this.eD, this.eC);
            this.gz = true;
            this.gD.acquire();
            this.gk.a(this, this.key, this.gD);
            int size = this.gv.size();
            for (int i = 0; i < size; i++) {
                g gVar = (g) this.gv.get(i);
                if (!d(gVar)) {
                    this.gD.acquire();
                    gVar.c(this.gD, this.dataSource);
                }
            }
            this.gD.release();
            release(false);
        } else {
            throw new IllegalStateException("Already have resource");
        }
    }

    /* access modifiers changed from: 0000 */
    public void bb() {
        this.fc.eT();
        if (this.ea) {
            this.gk.a(this, this.key);
            release(false);
            return;
        }
        throw new IllegalStateException("Not cancelled");
    }

    /* access modifiers changed from: 0000 */
    public void bc() {
        this.fc.eT();
        if (this.ea) {
            release(false);
        } else if (this.gv.isEmpty()) {
            throw new IllegalStateException("Received an exception without any callbacks to notify");
        } else if (!this.gB) {
            this.gB = true;
            this.gk.a(this, this.key, null);
            for (g gVar : this.gv) {
                if (!d(gVar)) {
                    gVar.a(this.gA);
                }
            }
            release(false);
        } else {
            throw new IllegalStateException("Already failed once");
        }
    }

    public void c(DecodeJob<R> decodeJob) {
        this.gE = decodeJob;
        (decodeJob.aH() ? this.aw : aZ()).execute(decodeJob);
    }

    public void c(p<R> pVar, DataSource dataSource2) {
        this.eD = pVar;
        this.dataSource = dataSource2;
        gr.obtainMessage(1, this).sendToTarget();
    }

    /* access modifiers changed from: 0000 */
    public void cancel() {
        if (!this.gB && !this.gz && !this.ea) {
            this.ea = true;
            this.gE.cancel();
            this.gk.a(this, this.key);
        }
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public EngineJob<R> init(com.bumptech.glide.load.c cVar, boolean z, boolean z2, boolean z3, boolean z4) {
        this.key = cVar;
        this.eC = z;
        this.gx = z2;
        this.gy = z3;
        this.fl = z4;
        return this;
    }

    /* access modifiers changed from: 0000 */
    public boolean isCancelled() {
        return this.ea;
    }
}
