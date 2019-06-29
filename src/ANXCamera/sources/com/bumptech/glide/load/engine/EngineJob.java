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
    private static final EngineResourceFactory hs = new EngineResourceFactory();
    private static final Handler ht = new Handler(Looper.getMainLooper(), new a());
    private static final int hu = 1;
    private static final int hv = 2;
    private static final int hw = 3;
    private final com.bumptech.glide.load.engine.b.a bD;
    private final com.bumptech.glide.load.engine.b.a bx;
    private final com.bumptech.glide.load.engine.b.a by;
    private DataSource dataSource;
    private boolean fE;
    private p<?> fF;
    private volatile boolean fc;
    private final com.bumptech.glide.util.a.c ge;
    private final Pool<EngineJob<?>> gf;
    private boolean gn;
    private boolean hA;
    private boolean hB;
    private GlideException hC;
    private boolean hD;
    private List<g> hE;
    private k<?> hF;
    private DecodeJob<R> hG;
    private final com.bumptech.glide.load.engine.b.a hl;
    private final h hm;
    private final List<g> hx;
    private final EngineResourceFactory hy;
    private boolean hz;
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
                    engineJob.bB();
                    break;
                case 2:
                    engineJob.bD();
                    break;
                case 3:
                    engineJob.bC();
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
        this(aVar, aVar2, aVar3, aVar4, hVar, pool, hs);
    }

    @VisibleForTesting
    EngineJob(com.bumptech.glide.load.engine.b.a aVar, com.bumptech.glide.load.engine.b.a aVar2, com.bumptech.glide.load.engine.b.a aVar3, com.bumptech.glide.load.engine.b.a aVar4, h hVar, Pool<EngineJob<?>> pool, EngineResourceFactory engineResourceFactory) {
        this.hx = new ArrayList(2);
        this.ge = com.bumptech.glide.util.a.c.fu();
        this.by = aVar;
        this.bx = aVar2;
        this.hl = aVar3;
        this.bD = aVar4;
        this.hm = hVar;
        this.gf = pool;
        this.hy = engineResourceFactory;
    }

    private com.bumptech.glide.load.engine.b.a bA() {
        return this.hz ? this.hl : this.hA ? this.bD : this.bx;
    }

    private void c(g gVar) {
        if (this.hE == null) {
            this.hE = new ArrayList(2);
        }
        if (!this.hE.contains(gVar)) {
            this.hE.add(gVar);
        }
    }

    private boolean d(g gVar) {
        return this.hE != null && this.hE.contains(gVar);
    }

    private void release(boolean z) {
        k.fn();
        this.hx.clear();
        this.key = null;
        this.hF = null;
        this.fF = null;
        if (this.hE != null) {
            this.hE.clear();
        }
        this.hD = false;
        this.fc = false;
        this.hB = false;
        this.hG.release(z);
        this.hG = null;
        this.hC = null;
        this.dataSource = null;
        this.gf.release(this);
    }

    public void a(GlideException glideException) {
        this.hC = glideException;
        ht.obtainMessage(2, this).sendToTarget();
    }

    /* access modifiers changed from: 0000 */
    public void a(g gVar) {
        k.fn();
        this.ge.fv();
        if (this.hB) {
            gVar.c(this.hF, this.dataSource);
        } else if (this.hD) {
            gVar.a(this.hC);
        } else {
            this.hx.add(gVar);
        }
    }

    public void b(DecodeJob<?> decodeJob) {
        bA().execute(decodeJob);
    }

    /* access modifiers changed from: 0000 */
    public void b(g gVar) {
        k.fn();
        this.ge.fv();
        if (this.hB || this.hD) {
            c(gVar);
            return;
        }
        this.hx.remove(gVar);
        if (this.hx.isEmpty()) {
            cancel();
        }
    }

    /* access modifiers changed from: 0000 */
    public void bB() {
        this.ge.fv();
        if (this.fc) {
            this.fF.recycle();
            release(false);
        } else if (this.hx.isEmpty()) {
            throw new IllegalStateException("Received a resource without any callbacks to notify");
        } else if (!this.hB) {
            this.hF = this.hy.a(this.fF, this.fE);
            this.hB = true;
            this.hF.acquire();
            this.hm.a(this, this.key, this.hF);
            int size = this.hx.size();
            for (int i = 0; i < size; i++) {
                g gVar = (g) this.hx.get(i);
                if (!d(gVar)) {
                    this.hF.acquire();
                    gVar.c(this.hF, this.dataSource);
                }
            }
            this.hF.release();
            release(false);
        } else {
            throw new IllegalStateException("Already have resource");
        }
    }

    /* access modifiers changed from: 0000 */
    public void bC() {
        this.ge.fv();
        if (this.fc) {
            this.hm.a(this, this.key);
            release(false);
            return;
        }
        throw new IllegalStateException("Not cancelled");
    }

    /* access modifiers changed from: 0000 */
    public void bD() {
        this.ge.fv();
        if (this.fc) {
            release(false);
        } else if (this.hx.isEmpty()) {
            throw new IllegalStateException("Received an exception without any callbacks to notify");
        } else if (!this.hD) {
            this.hD = true;
            this.hm.a(this, this.key, null);
            for (g gVar : this.hx) {
                if (!d(gVar)) {
                    gVar.a(this.hC);
                }
            }
            release(false);
        } else {
            throw new IllegalStateException("Already failed once");
        }
    }

    @NonNull
    public com.bumptech.glide.util.a.c bq() {
        return this.ge;
    }

    /* access modifiers changed from: 0000 */
    public boolean bz() {
        return this.gn;
    }

    public void c(DecodeJob<R> decodeJob) {
        this.hG = decodeJob;
        (decodeJob.bh() ? this.by : bA()).execute(decodeJob);
    }

    public void c(p<R> pVar, DataSource dataSource2) {
        this.fF = pVar;
        this.dataSource = dataSource2;
        ht.obtainMessage(1, this).sendToTarget();
    }

    /* access modifiers changed from: 0000 */
    public void cancel() {
        if (!this.hD && !this.hB && !this.fc) {
            this.fc = true;
            this.hG.cancel();
            this.hm.a(this, this.key);
        }
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public EngineJob<R> init(com.bumptech.glide.load.c cVar, boolean z, boolean z2, boolean z3, boolean z4) {
        this.key = cVar;
        this.fE = z;
        this.hz = z2;
        this.hA = z3;
        this.gn = z4;
        return this;
    }

    /* access modifiers changed from: 0000 */
    public boolean isCancelled() {
        return this.fc;
    }
}
