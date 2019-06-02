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
    private static final EngineResourceFactory gs = new EngineResourceFactory();
    private static final Handler gt = new Handler(Looper.getMainLooper(), new a());
    private static final int gu = 1;
    private static final int gv = 2;
    private static final int gw = 3;
    private final com.bumptech.glide.load.engine.b.a aD;
    private final com.bumptech.glide.load.engine.b.a ax;
    private final com.bumptech.glide.load.engine.b.a ay;
    private DataSource dataSource;
    private boolean eE;
    private p<?> eF;
    private volatile boolean ec;
    private final com.bumptech.glide.util.a.c fe;
    private final Pool<EngineJob<?>> ff;
    private boolean fn;
    private boolean gA;
    private boolean gB;
    private GlideException gC;
    private boolean gD;
    private List<g> gE;
    private k<?> gF;
    private DecodeJob<R> gG;
    private final com.bumptech.glide.load.engine.b.a gl;
    private final h gm;
    private final List<g> gx;
    private final EngineResourceFactory gy;
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
        this(aVar, aVar2, aVar3, aVar4, hVar, pool, gs);
    }

    @VisibleForTesting
    EngineJob(com.bumptech.glide.load.engine.b.a aVar, com.bumptech.glide.load.engine.b.a aVar2, com.bumptech.glide.load.engine.b.a aVar3, com.bumptech.glide.load.engine.b.a aVar4, h hVar, Pool<EngineJob<?>> pool, EngineResourceFactory engineResourceFactory) {
        this.gx = new ArrayList(2);
        this.fe = com.bumptech.glide.util.a.c.eS();
        this.ay = aVar;
        this.ax = aVar2;
        this.gl = aVar3;
        this.aD = aVar4;
        this.gm = hVar;
        this.ff = pool;
        this.gy = engineResourceFactory;
    }

    private com.bumptech.glide.load.engine.b.a aZ() {
        return this.gz ? this.gl : this.gA ? this.aD : this.ax;
    }

    private void c(g gVar) {
        if (this.gE == null) {
            this.gE = new ArrayList(2);
        }
        if (!this.gE.contains(gVar)) {
            this.gE.add(gVar);
        }
    }

    private boolean d(g gVar) {
        return this.gE != null && this.gE.contains(gVar);
    }

    private void release(boolean z) {
        k.eL();
        this.gx.clear();
        this.key = null;
        this.gF = null;
        this.eF = null;
        if (this.gE != null) {
            this.gE.clear();
        }
        this.gD = false;
        this.ec = false;
        this.gB = false;
        this.gG.release(z);
        this.gG = null;
        this.gC = null;
        this.dataSource = null;
        this.ff.release(this);
    }

    public void a(GlideException glideException) {
        this.gC = glideException;
        gt.obtainMessage(2, this).sendToTarget();
    }

    /* access modifiers changed from: 0000 */
    public void a(g gVar) {
        k.eL();
        this.fe.eT();
        if (this.gB) {
            gVar.c(this.gF, this.dataSource);
        } else if (this.gD) {
            gVar.a(this.gC);
        } else {
            this.gx.add(gVar);
        }
    }

    @NonNull
    public com.bumptech.glide.util.a.c aQ() {
        return this.fe;
    }

    /* access modifiers changed from: 0000 */
    public boolean aY() {
        return this.fn;
    }

    public void b(DecodeJob<?> decodeJob) {
        aZ().execute(decodeJob);
    }

    /* access modifiers changed from: 0000 */
    public void b(g gVar) {
        k.eL();
        this.fe.eT();
        if (this.gB || this.gD) {
            c(gVar);
            return;
        }
        this.gx.remove(gVar);
        if (this.gx.isEmpty()) {
            cancel();
        }
    }

    /* access modifiers changed from: 0000 */
    public void ba() {
        this.fe.eT();
        if (this.ec) {
            this.eF.recycle();
            release(false);
        } else if (this.gx.isEmpty()) {
            throw new IllegalStateException("Received a resource without any callbacks to notify");
        } else if (!this.gB) {
            this.gF = this.gy.a(this.eF, this.eE);
            this.gB = true;
            this.gF.acquire();
            this.gm.a(this, this.key, this.gF);
            int size = this.gx.size();
            for (int i = 0; i < size; i++) {
                g gVar = (g) this.gx.get(i);
                if (!d(gVar)) {
                    this.gF.acquire();
                    gVar.c(this.gF, this.dataSource);
                }
            }
            this.gF.release();
            release(false);
        } else {
            throw new IllegalStateException("Already have resource");
        }
    }

    /* access modifiers changed from: 0000 */
    public void bb() {
        this.fe.eT();
        if (this.ec) {
            this.gm.a(this, this.key);
            release(false);
            return;
        }
        throw new IllegalStateException("Not cancelled");
    }

    /* access modifiers changed from: 0000 */
    public void bc() {
        this.fe.eT();
        if (this.ec) {
            release(false);
        } else if (this.gx.isEmpty()) {
            throw new IllegalStateException("Received an exception without any callbacks to notify");
        } else if (!this.gD) {
            this.gD = true;
            this.gm.a(this, this.key, null);
            for (g gVar : this.gx) {
                if (!d(gVar)) {
                    gVar.a(this.gC);
                }
            }
            release(false);
        } else {
            throw new IllegalStateException("Already failed once");
        }
    }

    public void c(DecodeJob<R> decodeJob) {
        this.gG = decodeJob;
        (decodeJob.aH() ? this.ay : aZ()).execute(decodeJob);
    }

    public void c(p<R> pVar, DataSource dataSource2) {
        this.eF = pVar;
        this.dataSource = dataSource2;
        gt.obtainMessage(1, this).sendToTarget();
    }

    /* access modifiers changed from: 0000 */
    public void cancel() {
        if (!this.gD && !this.gB && !this.ec) {
            this.ec = true;
            this.gG.cancel();
            this.gm.a(this, this.key);
        }
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public EngineJob<R> init(com.bumptech.glide.load.c cVar, boolean z, boolean z2, boolean z3, boolean z4) {
        this.key = cVar;
        this.eE = z;
        this.gz = z2;
        this.gA = z3;
        this.fn = z4;
        return this;
    }

    /* access modifiers changed from: 0000 */
    public boolean isCancelled() {
        return this.ec;
    }
}
