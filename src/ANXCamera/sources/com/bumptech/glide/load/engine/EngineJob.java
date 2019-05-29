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
    private static final EngineResourceFactory gr = new EngineResourceFactory();
    private static final Handler gs = new Handler(Looper.getMainLooper(), new a());
    private static final int gt = 1;
    private static final int gu = 2;
    private static final int gv = 3;
    private final com.bumptech.glide.load.engine.b.a aC;
    private final com.bumptech.glide.load.engine.b.a aw;
    private final com.bumptech.glide.load.engine.b.a ax;
    private DataSource dataSource;
    private boolean eD;
    private p<?> eE;
    private volatile boolean eb;
    private final com.bumptech.glide.util.a.c fd;
    private final Pool<EngineJob<?>> fe;
    private boolean fm;
    private boolean gA;
    private GlideException gB;
    private boolean gC;
    private List<g> gD;
    private k<?> gE;
    private DecodeJob<R> gF;
    private final com.bumptech.glide.load.engine.b.a gk;
    private final h gl;
    private final List<g> gw;
    private final EngineResourceFactory gx;
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
        this(aVar, aVar2, aVar3, aVar4, hVar, pool, gr);
    }

    @VisibleForTesting
    EngineJob(com.bumptech.glide.load.engine.b.a aVar, com.bumptech.glide.load.engine.b.a aVar2, com.bumptech.glide.load.engine.b.a aVar3, com.bumptech.glide.load.engine.b.a aVar4, h hVar, Pool<EngineJob<?>> pool, EngineResourceFactory engineResourceFactory) {
        this.gw = new ArrayList(2);
        this.fd = com.bumptech.glide.util.a.c.eS();
        this.ax = aVar;
        this.aw = aVar2;
        this.gk = aVar3;
        this.aC = aVar4;
        this.gl = hVar;
        this.fe = pool;
        this.gx = engineResourceFactory;
    }

    private com.bumptech.glide.load.engine.b.a aZ() {
        return this.gy ? this.gk : this.gz ? this.aC : this.aw;
    }

    private void c(g gVar) {
        if (this.gD == null) {
            this.gD = new ArrayList(2);
        }
        if (!this.gD.contains(gVar)) {
            this.gD.add(gVar);
        }
    }

    private boolean d(g gVar) {
        return this.gD != null && this.gD.contains(gVar);
    }

    private void release(boolean z) {
        k.eL();
        this.gw.clear();
        this.key = null;
        this.gE = null;
        this.eE = null;
        if (this.gD != null) {
            this.gD.clear();
        }
        this.gC = false;
        this.eb = false;
        this.gA = false;
        this.gF.release(z);
        this.gF = null;
        this.gB = null;
        this.dataSource = null;
        this.fe.release(this);
    }

    public void a(GlideException glideException) {
        this.gB = glideException;
        gs.obtainMessage(2, this).sendToTarget();
    }

    /* access modifiers changed from: 0000 */
    public void a(g gVar) {
        k.eL();
        this.fd.eT();
        if (this.gA) {
            gVar.c(this.gE, this.dataSource);
        } else if (this.gC) {
            gVar.a(this.gB);
        } else {
            this.gw.add(gVar);
        }
    }

    @NonNull
    public com.bumptech.glide.util.a.c aQ() {
        return this.fd;
    }

    /* access modifiers changed from: 0000 */
    public boolean aY() {
        return this.fm;
    }

    public void b(DecodeJob<?> decodeJob) {
        aZ().execute(decodeJob);
    }

    /* access modifiers changed from: 0000 */
    public void b(g gVar) {
        k.eL();
        this.fd.eT();
        if (this.gA || this.gC) {
            c(gVar);
            return;
        }
        this.gw.remove(gVar);
        if (this.gw.isEmpty()) {
            cancel();
        }
    }

    /* access modifiers changed from: 0000 */
    public void ba() {
        this.fd.eT();
        if (this.eb) {
            this.eE.recycle();
            release(false);
        } else if (this.gw.isEmpty()) {
            throw new IllegalStateException("Received a resource without any callbacks to notify");
        } else if (!this.gA) {
            this.gE = this.gx.a(this.eE, this.eD);
            this.gA = true;
            this.gE.acquire();
            this.gl.a(this, this.key, this.gE);
            int size = this.gw.size();
            for (int i = 0; i < size; i++) {
                g gVar = (g) this.gw.get(i);
                if (!d(gVar)) {
                    this.gE.acquire();
                    gVar.c(this.gE, this.dataSource);
                }
            }
            this.gE.release();
            release(false);
        } else {
            throw new IllegalStateException("Already have resource");
        }
    }

    /* access modifiers changed from: 0000 */
    public void bb() {
        this.fd.eT();
        if (this.eb) {
            this.gl.a(this, this.key);
            release(false);
            return;
        }
        throw new IllegalStateException("Not cancelled");
    }

    /* access modifiers changed from: 0000 */
    public void bc() {
        this.fd.eT();
        if (this.eb) {
            release(false);
        } else if (this.gw.isEmpty()) {
            throw new IllegalStateException("Received an exception without any callbacks to notify");
        } else if (!this.gC) {
            this.gC = true;
            this.gl.a(this, this.key, null);
            for (g gVar : this.gw) {
                if (!d(gVar)) {
                    gVar.a(this.gB);
                }
            }
            release(false);
        } else {
            throw new IllegalStateException("Already failed once");
        }
    }

    public void c(DecodeJob<R> decodeJob) {
        this.gF = decodeJob;
        (decodeJob.aH() ? this.ax : aZ()).execute(decodeJob);
    }

    public void c(p<R> pVar, DataSource dataSource2) {
        this.eE = pVar;
        this.dataSource = dataSource2;
        gs.obtainMessage(1, this).sendToTarget();
    }

    /* access modifiers changed from: 0000 */
    public void cancel() {
        if (!this.gC && !this.gA && !this.eb) {
            this.eb = true;
            this.gF.cancel();
            this.gl.a(this, this.key);
        }
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public EngineJob<R> init(com.bumptech.glide.load.c cVar, boolean z, boolean z2, boolean z3, boolean z4) {
        this.key = cVar;
        this.eD = z;
        this.gy = z2;
        this.gz = z3;
        this.fm = z4;
        return this;
    }

    /* access modifiers changed from: 0000 */
    public boolean isCancelled() {
        return this.eb;
    }
}
