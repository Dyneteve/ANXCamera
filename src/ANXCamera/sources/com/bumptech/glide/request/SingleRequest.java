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
import com.bumptech.glide.util.a.a.C0011a;
import com.bumptech.glide.util.a.a.c;
import com.bumptech.glide.util.k;

public final class SingleRequest<R> implements c, g, m, c {
    private static final String TAG = "Request";
    private static final Pool<SingleRequest<?>> gP = a.a(150, (C0011a<T>) new C0011a<SingleRequest<?>>() {
        /* renamed from: er */
        public SingleRequest<?> create() {
            return new SingleRequest<>();
        }
    });
    private static final String oD = "Glide";
    private static final boolean oF = Log.isLoggable(TAG, 2);
    private Engine aj;
    private e an;
    private Class<R> bq;
    private f br;
    @Nullable
    private Object bt;
    private e<R> bu;
    private Context context;
    private p<R> eD;
    private Priority eW;
    private final com.bumptech.glide.util.a.c fc;
    private int height;
    private boolean oE;
    @Nullable
    private e<R> oG;
    private d oH;
    private n<R> oI;
    private g<? super R> oJ;
    private b oK;
    private Status oL;
    private Drawable oM;
    private Drawable ot;
    private int ov;
    private int ow;
    private Drawable oy;
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
        this.tag = oF ? String.valueOf(super.hashCode()) : null;
        this.fc = com.bumptech.glide.util.a.c.eS();
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
        return com.bumptech.glide.load.resource.b.a.a((Context) this.an, i, this.br.getTheme() != null ? this.br.getTheme() : this.context.getTheme());
    }

    private static int a(int i, float f) {
        return i == Integer.MIN_VALUE ? i : Math.round(f * ((float) i));
    }

    public static <R> SingleRequest<R> a(Context context2, e eVar, Object obj, Class<R> cls, f fVar, int i, int i2, Priority priority, n<R> nVar, e<R> eVar2, e<R> eVar3, d dVar, Engine engine, g<? super R> gVar) {
        SingleRequest<R> singleRequest = (SingleRequest) gP.acquire();
        if (singleRequest == null) {
            singleRequest = new SingleRequest<>();
        }
        singleRequest.b(context2, eVar, obj, cls, fVar, i, i2, priority, nVar, eVar2, eVar3, dVar, engine, gVar);
        return singleRequest;
    }

    /* JADX INFO: finally extract failed */
    private void a(GlideException glideException, int i) {
        this.fc.eT();
        int logLevel = this.an.getLogLevel();
        if (logLevel <= i) {
            String str = oD;
            StringBuilder sb = new StringBuilder();
            sb.append("Load failed for ");
            sb.append(this.bt);
            sb.append(" with size [");
            sb.append(this.width);
            sb.append("x");
            sb.append(this.height);
            sb.append("]");
            Log.w(str, sb.toString(), glideException);
            if (logLevel <= 4) {
                glideException.s(oD);
            }
        }
        this.oK = null;
        this.oL = Status.FAILED;
        this.oE = true;
        try {
            if ((this.bu == null || !this.bu.a(glideException, this.bt, this.oI, eo())) && (this.oG == null || !this.oG.a(glideException, this.bt, this.oI, eo()))) {
                ek();
            }
            this.oE = false;
            eq();
        } catch (Throwable th) {
            this.oE = false;
            throw th;
        }
    }

    /* JADX INFO: finally extract failed */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x0092, code lost:
        if (r7.oG.a(r9, r7.bt, r7.oI, r10, r6) == false) goto L_0x0094;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:8:0x007f, code lost:
        if (r7.bu.a(r9, r7.bt, r7.oI, r10, r6) == false) goto L_0x0081;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void a(p<R> pVar, R r, DataSource dataSource) {
        boolean eo = eo();
        this.oL = Status.COMPLETE;
        this.eD = pVar;
        if (this.an.getLogLevel() <= 3) {
            String str = oD;
            StringBuilder sb = new StringBuilder();
            sb.append("Finished loading ");
            sb.append(r.getClass().getSimpleName());
            sb.append(" from ");
            sb.append(dataSource);
            sb.append(" for ");
            sb.append(this.bt);
            sb.append(" with size [");
            sb.append(this.width);
            sb.append("x");
            sb.append(this.height);
            sb.append("] in ");
            sb.append(com.bumptech.glide.util.e.f(this.startTime));
            sb.append(" ms");
            Log.d(str, sb.toString());
        }
        this.oE = true;
        try {
            if (this.bu != null) {
            }
            if (this.oG != null) {
            }
            this.oI.a(r, this.oJ.a(dataSource, eo));
            this.oE = false;
            ep();
        } catch (Throwable th) {
            this.oE = false;
            throw th;
        }
    }

    private void b(Context context2, e eVar, Object obj, Class<R> cls, f fVar, int i, int i2, Priority priority, n<R> nVar, e<R> eVar2, e<R> eVar3, d dVar, Engine engine, g<? super R> gVar) {
        this.context = context2;
        this.an = eVar;
        this.bt = obj;
        this.bq = cls;
        this.br = fVar;
        this.ow = i;
        this.ov = i2;
        this.eW = priority;
        this.oI = nVar;
        this.oG = eVar2;
        this.bu = eVar3;
        this.oH = dVar;
        this.aj = engine;
        this.oJ = gVar;
        this.oL = Status.PENDING;
    }

    private Drawable dW() {
        if (this.ot == null) {
            this.ot = this.br.dW();
            if (this.ot == null && this.br.dV() > 0) {
                this.ot = T(this.br.dV());
            }
        }
        return this.ot;
    }

    private Drawable dY() {
        if (this.oy == null) {
            this.oy = this.br.dY();
            if (this.oy == null && this.br.dX() > 0) {
                this.oy = T(this.br.dX());
            }
        }
        return this.oy;
    }

    private void ei() {
        if (this.oE) {
            throw new IllegalStateException("You can't start or clear loads in RequestListener or Target callbacks. If you're trying to start a fallback request when a load fails, use RequestBuilder#error(RequestBuilder). Otherwise consider posting your into() or clear() calls to the main thread using a Handler instead.");
        }
    }

    private Drawable ej() {
        if (this.oM == null) {
            this.oM = this.br.dT();
            if (this.oM == null && this.br.dU() > 0) {
                this.oM = T(this.br.dU());
            }
        }
        return this.oM;
    }

    private void ek() {
        if (en()) {
            Drawable drawable = null;
            if (this.bt == null) {
                drawable = dY();
            }
            if (drawable == null) {
                drawable = ej();
            }
            if (drawable == null) {
                drawable = dW();
            }
            this.oI.f(drawable);
        }
    }

    private boolean el() {
        return this.oH == null || this.oH.d(this);
    }

    private boolean em() {
        return this.oH == null || this.oH.f(this);
    }

    private boolean en() {
        return this.oH == null || this.oH.e(this);
    }

    private boolean eo() {
        return this.oH == null || !this.oH.dn();
    }

    private void ep() {
        if (this.oH != null) {
            this.oH.h(this);
        }
    }

    private void eq() {
        if (this.oH != null) {
            this.oH.i(this);
        }
    }

    private void m(p<?> pVar) {
        this.aj.d(pVar);
        this.eD = null;
    }

    public void a(GlideException glideException) {
        a(glideException, 5);
    }

    @NonNull
    public com.bumptech.glide.util.a.c aQ() {
        return this.fc;
    }

    public void begin() {
        ei();
        this.fc.eT();
        this.startTime = com.bumptech.glide.util.e.eK();
        if (this.bt == null) {
            if (k.s(this.ow, this.ov)) {
                this.width = this.ow;
                this.height = this.ov;
            }
            a(new GlideException("Received null model"), dY() == null ? 5 : 3);
        } else if (this.oL == Status.RUNNING) {
            throw new IllegalArgumentException("Cannot restart a running request");
        } else if (this.oL == Status.COMPLETE) {
            c(this.eD, DataSource.MEMORY_CACHE);
        } else {
            this.oL = Status.WAITING_FOR_SIZE;
            if (k.s(this.ow, this.ov)) {
                p(this.ow, this.ov);
            } else {
                this.oI.a(this);
            }
            if ((this.oL == Status.RUNNING || this.oL == Status.WAITING_FOR_SIZE) && en()) {
                this.oI.e(dW());
            }
            if (oF) {
                StringBuilder sb = new StringBuilder();
                sb.append("finished run method in ");
                sb.append(com.bumptech.glide.util.e.f(this.startTime));
                F(sb.toString());
            }
        }
    }

    public void c(p<?> pVar, DataSource dataSource) {
        this.fc.eT();
        this.oK = null;
        if (pVar == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("Expected to receive a Resource<R> with an object of ");
            sb.append(this.bq);
            sb.append(" inside, but instead got null.");
            a(new GlideException(sb.toString()));
            return;
        }
        Object obj = pVar.get();
        if (obj == null || !this.bq.isAssignableFrom(obj.getClass())) {
            m(pVar);
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Expected to receive an object of ");
            sb2.append(this.bq);
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
            this.oL = Status.COMPLETE;
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
        if (this.ow == singleRequest.ow && this.ov == singleRequest.ov && k.d(this.bt, singleRequest.bt) && this.bq.equals(singleRequest.bq) && this.br.equals(singleRequest.br) && this.eW == singleRequest.eW && (this.bu == null ? singleRequest.bu == null : singleRequest.bu != null)) {
            z = true;
        }
        return z;
    }

    /* access modifiers changed from: 0000 */
    public void cancel() {
        ei();
        this.fc.eT();
        this.oI.b(this);
        this.oL = Status.CANCELLED;
        if (this.oK != null) {
            this.oK.cancel();
            this.oK = null;
        }
    }

    public void clear() {
        k.eL();
        ei();
        this.fc.eT();
        if (this.oL != Status.CLEARED) {
            cancel();
            if (this.eD != null) {
                m(this.eD);
            }
            if (em()) {
                this.oI.d(dW());
            }
            this.oL = Status.CLEARED;
        }
    }

    public boolean dj() {
        return isComplete();
    }

    public boolean isCancelled() {
        return this.oL == Status.CANCELLED || this.oL == Status.CLEARED;
    }

    public boolean isComplete() {
        return this.oL == Status.COMPLETE;
    }

    public boolean isFailed() {
        return this.oL == Status.FAILED;
    }

    public boolean isPaused() {
        return this.oL == Status.PAUSED;
    }

    public boolean isRunning() {
        return this.oL == Status.RUNNING || this.oL == Status.WAITING_FOR_SIZE;
    }

    public void p(int i, int i2) {
        this.fc.eT();
        if (oF) {
            StringBuilder sb = new StringBuilder();
            sb.append("Got onSizeReady in ");
            sb.append(com.bumptech.glide.util.e.f(this.startTime));
            F(sb.toString());
        }
        if (this.oL == Status.WAITING_FOR_SIZE) {
            this.oL = Status.RUNNING;
            float ee = this.br.ee();
            this.width = a(i, ee);
            this.height = a(i2, ee);
            if (oF) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("finished setup for calling load in ");
                sb2.append(com.bumptech.glide.util.e.f(this.startTime));
                F(sb2.toString());
            }
            b a = this.aj.a(this.an, this.bt, this.br.aA(), this.width, this.height, this.br.bf(), this.bq, this.eW, this.br.ax(), this.br.dR(), this.br.dS(), this.br.aE(), this.br.az(), this.br.dZ(), this.br.ef(), this.br.eg(), this.br.eh(), this);
            this.oK = a;
            if (this.oL != Status.RUNNING) {
                this.oK = null;
            }
            if (oF) {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("finished onSizeReady in ");
                sb3.append(com.bumptech.glide.util.e.f(this.startTime));
                F(sb3.toString());
            }
        }
    }

    public void pause() {
        clear();
        this.oL = Status.PAUSED;
    }

    public void recycle() {
        ei();
        this.context = null;
        this.an = null;
        this.bt = null;
        this.bq = null;
        this.br = null;
        this.ow = -1;
        this.ov = -1;
        this.oI = null;
        this.bu = null;
        this.oG = null;
        this.oH = null;
        this.oJ = null;
        this.oK = null;
        this.oM = null;
        this.ot = null;
        this.oy = null;
        this.width = -1;
        this.height = -1;
        gP.release(this);
    }
}
