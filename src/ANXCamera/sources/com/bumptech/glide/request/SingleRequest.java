package com.bumptech.glide.request;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.Pools.Pool;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.e;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.Engine.b;
import com.bumptech.glide.load.engine.GlideException;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.request.a.g;
import com.bumptech.glide.request.target.m;
import com.bumptech.glide.request.target.n;
import com.bumptech.glide.util.a.a;
import com.bumptech.glide.util.a.a.C0013a;
import com.bumptech.glide.util.a.a.c;
import com.bumptech.glide.util.k;

public final class SingleRequest<R> implements c, g, m, c {
    private static final String TAG = "Request";
    private static final Pool<SingleRequest<?>> gR = a.a(150, (C0013a<T>) new C0013a<SingleRequest<?>>() {
        /* renamed from: er */
        public SingleRequest<?> create() {
            return new SingleRequest<>();
        }
    });
    private static final String oF = "Glide";
    private static final boolean oH = Log.isLoggable(TAG, 2);
    private Engine al;
    private e ap;
    private Class<R> bs;
    private f bt;
    @Nullable
    private Object bv;
    private e<R> bw;
    private Context context;
    private p<R> eF;
    private Priority eY;
    private final com.bumptech.glide.util.a.c fe;
    private int height;
    private Drawable oA;
    private boolean oG;
    @Nullable
    private e<R> oI;
    private d oJ;
    private n<R> oK;
    private g<? super R> oL;
    private b oM;
    private Status oN;
    private Drawable oO;
    private Drawable ov;
    private int ox;
    private int oy;
    private long startTime;
    @Nullable
    private final String tag;
    private int width;

    private enum Status {
        PENDING,
        RUNNING,
        WAITING_FOR_SIZE,
        COMPLETE,
        FAILED,
        CANCELLED,
        CLEARED,
        PAUSED
    }

    SingleRequest() {
        this.tag = oH ? String.valueOf(super.hashCode()) : null;
        this.fe = com.bumptech.glide.util.a.c.eS();
    }

    private void F(String str) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(" this: ");
        sb.append(this.tag);
        Log.v(str2, sb.toString());
    }

    private Drawable T(@DrawableRes int i) {
        return com.bumptech.glide.load.resource.b.a.a((Context) this.ap, i, this.bt.getTheme() != null ? this.bt.getTheme() : this.context.getTheme());
    }

    private static int a(int i, float f) {
        return i == Integer.MIN_VALUE ? i : Math.round(f * ((float) i));
    }

    public static <R> SingleRequest<R> a(Context context2, e eVar, Object obj, Class<R> cls, f fVar, int i, int i2, Priority priority, n<R> nVar, e<R> eVar2, e<R> eVar3, d dVar, Engine engine, g<? super R> gVar) {
        SingleRequest<R> singleRequest = (SingleRequest) gR.acquire();
        if (singleRequest == null) {
            singleRequest = new SingleRequest<>();
        }
        singleRequest.b(context2, eVar, obj, cls, fVar, i, i2, priority, nVar, eVar2, eVar3, dVar, engine, gVar);
        return singleRequest;
    }

    /* JADX INFO: finally extract failed */
    private void a(GlideException glideException, int i) {
        this.fe.eT();
        int logLevel = this.ap.getLogLevel();
        if (logLevel <= i) {
            String str = oF;
            StringBuilder sb = new StringBuilder();
            sb.append("Load failed for ");
            sb.append(this.bv);
            sb.append(" with size [");
            sb.append(this.width);
            sb.append("x");
            sb.append(this.height);
            sb.append("]");
            Log.w(str, sb.toString(), glideException);
            if (logLevel <= 4) {
                glideException.s(oF);
            }
        }
        this.oM = null;
        this.oN = Status.FAILED;
        this.oG = true;
        try {
            if ((this.bw == null || !this.bw.a(glideException, this.bv, this.oK, eo())) && (this.oI == null || !this.oI.a(glideException, this.bv, this.oK, eo()))) {
                ek();
            }
            this.oG = false;
            eq();
        } catch (Throwable th) {
            this.oG = false;
            throw th;
        }
    }

    /* JADX INFO: finally extract failed */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x0092, code lost:
        if (r7.oI.a(r9, r7.bv, r7.oK, r10, r6) == false) goto L_0x0094;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:8:0x007f, code lost:
        if (r7.bw.a(r9, r7.bv, r7.oK, r10, r6) == false) goto L_0x0081;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void a(p<R> pVar, R r, DataSource dataSource) {
        boolean eo = eo();
        this.oN = Status.COMPLETE;
        this.eF = pVar;
        if (this.ap.getLogLevel() <= 3) {
            String str = oF;
            StringBuilder sb = new StringBuilder();
            sb.append("Finished loading ");
            sb.append(r.getClass().getSimpleName());
            sb.append(" from ");
            sb.append(dataSource);
            sb.append(" for ");
            sb.append(this.bv);
            sb.append(" with size [");
            sb.append(this.width);
            sb.append("x");
            sb.append(this.height);
            sb.append("] in ");
            sb.append(com.bumptech.glide.util.e.f(this.startTime));
            sb.append(" ms");
            Log.d(str, sb.toString());
        }
        this.oG = true;
        try {
            if (this.bw != null) {
            }
            if (this.oI != null) {
            }
            this.oK.a(r, this.oL.a(dataSource, eo));
            this.oG = false;
            ep();
        } catch (Throwable th) {
            this.oG = false;
            throw th;
        }
    }

    private void b(Context context2, e eVar, Object obj, Class<R> cls, f fVar, int i, int i2, Priority priority, n<R> nVar, e<R> eVar2, e<R> eVar3, d dVar, Engine engine, g<? super R> gVar) {
        this.context = context2;
        this.ap = eVar;
        this.bv = obj;
        this.bs = cls;
        this.bt = fVar;
        this.oy = i;
        this.ox = i2;
        this.eY = priority;
        this.oK = nVar;
        this.oI = eVar2;
        this.bw = eVar3;
        this.oJ = dVar;
        this.al = engine;
        this.oL = gVar;
        this.oN = Status.PENDING;
    }

    private Drawable dW() {
        if (this.ov == null) {
            this.ov = this.bt.dW();
            if (this.ov == null && this.bt.dV() > 0) {
                this.ov = T(this.bt.dV());
            }
        }
        return this.ov;
    }

    private Drawable dY() {
        if (this.oA == null) {
            this.oA = this.bt.dY();
            if (this.oA == null && this.bt.dX() > 0) {
                this.oA = T(this.bt.dX());
            }
        }
        return this.oA;
    }

    private void ei() {
        if (this.oG) {
            throw new IllegalStateException("You can't start or clear loads in RequestListener or Target callbacks. If you're trying to start a fallback request when a load fails, use RequestBuilder#error(RequestBuilder). Otherwise consider posting your into() or clear() calls to the main thread using a Handler instead.");
        }
    }

    private Drawable ej() {
        if (this.oO == null) {
            this.oO = this.bt.dT();
            if (this.oO == null && this.bt.dU() > 0) {
                this.oO = T(this.bt.dU());
            }
        }
        return this.oO;
    }

    private void ek() {
        if (en()) {
            Drawable drawable = null;
            if (this.bv == null) {
                drawable = dY();
            }
            if (drawable == null) {
                drawable = ej();
            }
            if (drawable == null) {
                drawable = dW();
            }
            this.oK.f(drawable);
        }
    }

    private boolean el() {
        return this.oJ == null || this.oJ.d(this);
    }

    private boolean em() {
        return this.oJ == null || this.oJ.f(this);
    }

    private boolean en() {
        return this.oJ == null || this.oJ.e(this);
    }

    private boolean eo() {
        return this.oJ == null || !this.oJ.dn();
    }

    private void ep() {
        if (this.oJ != null) {
            this.oJ.h(this);
        }
    }

    private void eq() {
        if (this.oJ != null) {
            this.oJ.i(this);
        }
    }

    private void m(p<?> pVar) {
        this.al.d(pVar);
        this.eF = null;
    }

    public void a(GlideException glideException) {
        a(glideException, 5);
    }

    @NonNull
    public com.bumptech.glide.util.a.c aQ() {
        return this.fe;
    }

    public void begin() {
        ei();
        this.fe.eT();
        this.startTime = com.bumptech.glide.util.e.eK();
        if (this.bv == null) {
            if (k.s(this.oy, this.ox)) {
                this.width = this.oy;
                this.height = this.ox;
            }
            a(new GlideException("Received null model"), dY() == null ? 5 : 3);
        } else if (this.oN == Status.RUNNING) {
            throw new IllegalArgumentException("Cannot restart a running request");
        } else if (this.oN == Status.COMPLETE) {
            c(this.eF, DataSource.MEMORY_CACHE);
        } else {
            this.oN = Status.WAITING_FOR_SIZE;
            if (k.s(this.oy, this.ox)) {
                p(this.oy, this.ox);
            } else {
                this.oK.a(this);
            }
            if ((this.oN == Status.RUNNING || this.oN == Status.WAITING_FOR_SIZE) && en()) {
                this.oK.e(dW());
            }
            if (oH) {
                StringBuilder sb = new StringBuilder();
                sb.append("finished run method in ");
                sb.append(com.bumptech.glide.util.e.f(this.startTime));
                F(sb.toString());
            }
        }
    }

    public void c(p<?> pVar, DataSource dataSource) {
        this.fe.eT();
        this.oM = null;
        if (pVar == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("Expected to receive a Resource<R> with an object of ");
            sb.append(this.bs);
            sb.append(" inside, but instead got null.");
            a(new GlideException(sb.toString()));
            return;
        }
        Object obj = pVar.get();
        if (obj == null || !this.bs.isAssignableFrom(obj.getClass())) {
            m(pVar);
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Expected to receive an object of ");
            sb2.append(this.bs);
            sb2.append(" but instead got ");
            sb2.append(obj != null ? obj.getClass() : "");
            sb2.append("{");
            sb2.append(obj);
            sb2.append("} inside Resource{");
            sb2.append(pVar);
            sb2.append("}.");
            sb2.append(obj != null ? "" : " To indicate failure return a null Resource object, rather than a Resource object containing null data.");
            a(new GlideException(sb2.toString()));
        } else if (!el()) {
            m(pVar);
            this.oN = Status.COMPLETE;
        } else {
            a(pVar, obj, dataSource);
        }
    }

    public boolean c(c cVar) {
        boolean z = false;
        if (!(cVar instanceof SingleRequest)) {
            return false;
        }
        SingleRequest singleRequest = (SingleRequest) cVar;
        if (this.oy == singleRequest.oy && this.ox == singleRequest.ox && k.d(this.bv, singleRequest.bv) && this.bs.equals(singleRequest.bs) && this.bt.equals(singleRequest.bt) && this.eY == singleRequest.eY && (this.bw == null ? singleRequest.bw == null : singleRequest.bw != null)) {
            z = true;
        }
        return z;
    }

    /* access modifiers changed from: 0000 */
    public void cancel() {
        ei();
        this.fe.eT();
        this.oK.b(this);
        this.oN = Status.CANCELLED;
        if (this.oM != null) {
            this.oM.cancel();
            this.oM = null;
        }
    }

    public void clear() {
        k.eL();
        ei();
        this.fe.eT();
        if (this.oN != Status.CLEARED) {
            cancel();
            if (this.eF != null) {
                m(this.eF);
            }
            if (em()) {
                this.oK.d(dW());
            }
            this.oN = Status.CLEARED;
        }
    }

    public boolean dj() {
        return isComplete();
    }

    public boolean isCancelled() {
        return this.oN == Status.CANCELLED || this.oN == Status.CLEARED;
    }

    public boolean isComplete() {
        return this.oN == Status.COMPLETE;
    }

    public boolean isFailed() {
        return this.oN == Status.FAILED;
    }

    public boolean isPaused() {
        return this.oN == Status.PAUSED;
    }

    public boolean isRunning() {
        return this.oN == Status.RUNNING || this.oN == Status.WAITING_FOR_SIZE;
    }

    public void p(int i, int i2) {
        this.fe.eT();
        if (oH) {
            StringBuilder sb = new StringBuilder();
            sb.append("Got onSizeReady in ");
            sb.append(com.bumptech.glide.util.e.f(this.startTime));
            F(sb.toString());
        }
        if (this.oN == Status.WAITING_FOR_SIZE) {
            this.oN = Status.RUNNING;
            float ee = this.bt.ee();
            this.width = a(i, ee);
            this.height = a(i2, ee);
            if (oH) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("finished setup for calling load in ");
                sb2.append(com.bumptech.glide.util.e.f(this.startTime));
                F(sb2.toString());
            }
            b a = this.al.a(this.ap, this.bv, this.bt.aA(), this.width, this.height, this.bt.bf(), this.bs, this.eY, this.bt.ax(), this.bt.dR(), this.bt.dS(), this.bt.aE(), this.bt.az(), this.bt.dZ(), this.bt.ef(), this.bt.eg(), this.bt.eh(), this);
            this.oM = a;
            if (this.oN != Status.RUNNING) {
                this.oM = null;
            }
            if (oH) {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("finished onSizeReady in ");
                sb3.append(com.bumptech.glide.util.e.f(this.startTime));
                F(sb3.toString());
            }
        }
    }

    public void pause() {
        clear();
        this.oN = Status.PAUSED;
    }

    public void recycle() {
        ei();
        this.context = null;
        this.ap = null;
        this.bv = null;
        this.bs = null;
        this.bt = null;
        this.oy = -1;
        this.ox = -1;
        this.oK = null;
        this.bw = null;
        this.oI = null;
        this.oJ = null;
        this.oL = null;
        this.oM = null;
        this.oO = null;
        this.ov = null;
        this.oA = null;
        this.width = -1;
        this.height = -1;
        gR.release(this);
    }
}
