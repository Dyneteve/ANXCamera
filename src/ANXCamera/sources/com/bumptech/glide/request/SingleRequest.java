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
    private static final Pool<SingleRequest<?>> gQ = a.a(150, (C0011a<T>) new C0011a<SingleRequest<?>>() {
        /* renamed from: er */
        public SingleRequest<?> create() {
            return new SingleRequest<>();
        }
    });
    private static final String oE = "Glide";
    private static final boolean oG = Log.isLoggable(TAG, 2);
    private Engine ak;
    private e ao;
    private Class<R> br;
    private f bs;
    @Nullable
    private Object bu;
    private e<R> bv;
    private Context context;
    private p<R> eE;
    private Priority eX;
    private final com.bumptech.glide.util.a.c fd;
    private int height;
    private boolean oF;
    @Nullable
    private e<R> oH;
    private d oI;
    private n<R> oJ;
    private g<? super R> oK;
    private b oL;
    private Status oM;
    private Drawable oN;
    private Drawable ou;
    private int ow;
    private int ox;
    private Drawable oz;
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
        this.tag = oG ? String.valueOf(super.hashCode()) : null;
        this.fd = com.bumptech.glide.util.a.c.eS();
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
        return com.bumptech.glide.load.resource.b.a.a((Context) this.ao, i, this.bs.getTheme() != null ? this.bs.getTheme() : this.context.getTheme());
    }

    private static int a(int i, float f) {
        return i == Integer.MIN_VALUE ? i : Math.round(f * ((float) i));
    }

    public static <R> SingleRequest<R> a(Context context2, e eVar, Object obj, Class<R> cls, f fVar, int i, int i2, Priority priority, n<R> nVar, e<R> eVar2, e<R> eVar3, d dVar, Engine engine, g<? super R> gVar) {
        SingleRequest<R> singleRequest = (SingleRequest) gQ.acquire();
        if (singleRequest == null) {
            singleRequest = new SingleRequest<>();
        }
        singleRequest.b(context2, eVar, obj, cls, fVar, i, i2, priority, nVar, eVar2, eVar3, dVar, engine, gVar);
        return singleRequest;
    }

    /* JADX INFO: finally extract failed */
    private void a(GlideException glideException, int i) {
        this.fd.eT();
        int logLevel = this.ao.getLogLevel();
        if (logLevel <= i) {
            String str = oE;
            StringBuilder sb = new StringBuilder();
            sb.append("Load failed for ");
            sb.append(this.bu);
            sb.append(" with size [");
            sb.append(this.width);
            sb.append("x");
            sb.append(this.height);
            sb.append("]");
            Log.w(str, sb.toString(), glideException);
            if (logLevel <= 4) {
                glideException.s(oE);
            }
        }
        this.oL = null;
        this.oM = Status.FAILED;
        this.oF = true;
        try {
            if ((this.bv == null || !this.bv.a(glideException, this.bu, this.oJ, eo())) && (this.oH == null || !this.oH.a(glideException, this.bu, this.oJ, eo()))) {
                ek();
            }
            this.oF = false;
            eq();
        } catch (Throwable th) {
            this.oF = false;
            throw th;
        }
    }

    /* JADX INFO: finally extract failed */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x0092, code lost:
        if (r7.oH.a(r9, r7.bu, r7.oJ, r10, r6) == false) goto L_0x0094;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:8:0x007f, code lost:
        if (r7.bv.a(r9, r7.bu, r7.oJ, r10, r6) == false) goto L_0x0081;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void a(p<R> pVar, R r, DataSource dataSource) {
        boolean eo = eo();
        this.oM = Status.COMPLETE;
        this.eE = pVar;
        if (this.ao.getLogLevel() <= 3) {
            String str = oE;
            StringBuilder sb = new StringBuilder();
            sb.append("Finished loading ");
            sb.append(r.getClass().getSimpleName());
            sb.append(" from ");
            sb.append(dataSource);
            sb.append(" for ");
            sb.append(this.bu);
            sb.append(" with size [");
            sb.append(this.width);
            sb.append("x");
            sb.append(this.height);
            sb.append("] in ");
            sb.append(com.bumptech.glide.util.e.f(this.startTime));
            sb.append(" ms");
            Log.d(str, sb.toString());
        }
        this.oF = true;
        try {
            if (this.bv != null) {
            }
            if (this.oH != null) {
            }
            this.oJ.a(r, this.oK.a(dataSource, eo));
            this.oF = false;
            ep();
        } catch (Throwable th) {
            this.oF = false;
            throw th;
        }
    }

    private void b(Context context2, e eVar, Object obj, Class<R> cls, f fVar, int i, int i2, Priority priority, n<R> nVar, e<R> eVar2, e<R> eVar3, d dVar, Engine engine, g<? super R> gVar) {
        this.context = context2;
        this.ao = eVar;
        this.bu = obj;
        this.br = cls;
        this.bs = fVar;
        this.ox = i;
        this.ow = i2;
        this.eX = priority;
        this.oJ = nVar;
        this.oH = eVar2;
        this.bv = eVar3;
        this.oI = dVar;
        this.ak = engine;
        this.oK = gVar;
        this.oM = Status.PENDING;
    }

    private Drawable dW() {
        if (this.ou == null) {
            this.ou = this.bs.dW();
            if (this.ou == null && this.bs.dV() > 0) {
                this.ou = T(this.bs.dV());
            }
        }
        return this.ou;
    }

    private Drawable dY() {
        if (this.oz == null) {
            this.oz = this.bs.dY();
            if (this.oz == null && this.bs.dX() > 0) {
                this.oz = T(this.bs.dX());
            }
        }
        return this.oz;
    }

    private void ei() {
        if (this.oF) {
            throw new IllegalStateException("You can't start or clear loads in RequestListener or Target callbacks. If you're trying to start a fallback request when a load fails, use RequestBuilder#error(RequestBuilder). Otherwise consider posting your into() or clear() calls to the main thread using a Handler instead.");
        }
    }

    private Drawable ej() {
        if (this.oN == null) {
            this.oN = this.bs.dT();
            if (this.oN == null && this.bs.dU() > 0) {
                this.oN = T(this.bs.dU());
            }
        }
        return this.oN;
    }

    private void ek() {
        if (en()) {
            Drawable drawable = null;
            if (this.bu == null) {
                drawable = dY();
            }
            if (drawable == null) {
                drawable = ej();
            }
            if (drawable == null) {
                drawable = dW();
            }
            this.oJ.f(drawable);
        }
    }

    private boolean el() {
        return this.oI == null || this.oI.d(this);
    }

    private boolean em() {
        return this.oI == null || this.oI.f(this);
    }

    private boolean en() {
        return this.oI == null || this.oI.e(this);
    }

    private boolean eo() {
        return this.oI == null || !this.oI.dn();
    }

    private void ep() {
        if (this.oI != null) {
            this.oI.h(this);
        }
    }

    private void eq() {
        if (this.oI != null) {
            this.oI.i(this);
        }
    }

    private void m(p<?> pVar) {
        this.ak.d(pVar);
        this.eE = null;
    }

    public void a(GlideException glideException) {
        a(glideException, 5);
    }

    @NonNull
    public com.bumptech.glide.util.a.c aQ() {
        return this.fd;
    }

    public void begin() {
        ei();
        this.fd.eT();
        this.startTime = com.bumptech.glide.util.e.eK();
        if (this.bu == null) {
            if (k.s(this.ox, this.ow)) {
                this.width = this.ox;
                this.height = this.ow;
            }
            a(new GlideException("Received null model"), dY() == null ? 5 : 3);
        } else if (this.oM == Status.RUNNING) {
            throw new IllegalArgumentException("Cannot restart a running request");
        } else if (this.oM == Status.COMPLETE) {
            c(this.eE, DataSource.MEMORY_CACHE);
        } else {
            this.oM = Status.WAITING_FOR_SIZE;
            if (k.s(this.ox, this.ow)) {
                p(this.ox, this.ow);
            } else {
                this.oJ.a(this);
            }
            if ((this.oM == Status.RUNNING || this.oM == Status.WAITING_FOR_SIZE) && en()) {
                this.oJ.e(dW());
            }
            if (oG) {
                StringBuilder sb = new StringBuilder();
                sb.append("finished run method in ");
                sb.append(com.bumptech.glide.util.e.f(this.startTime));
                F(sb.toString());
            }
        }
    }

    public void c(p<?> pVar, DataSource dataSource) {
        this.fd.eT();
        this.oL = null;
        if (pVar == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("Expected to receive a Resource<R> with an object of ");
            sb.append(this.br);
            sb.append(" inside, but instead got null.");
            a(new GlideException(sb.toString()));
            return;
        }
        Object obj = pVar.get();
        if (obj == null || !this.br.isAssignableFrom(obj.getClass())) {
            m(pVar);
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Expected to receive an object of ");
            sb2.append(this.br);
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
            this.oM = Status.COMPLETE;
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
        if (this.ox == singleRequest.ox && this.ow == singleRequest.ow && k.d(this.bu, singleRequest.bu) && this.br.equals(singleRequest.br) && this.bs.equals(singleRequest.bs) && this.eX == singleRequest.eX && (this.bv == null ? singleRequest.bv == null : singleRequest.bv != null)) {
            z = true;
        }
        return z;
    }

    /* access modifiers changed from: 0000 */
    public void cancel() {
        ei();
        this.fd.eT();
        this.oJ.b(this);
        this.oM = Status.CANCELLED;
        if (this.oL != null) {
            this.oL.cancel();
            this.oL = null;
        }
    }

    public void clear() {
        k.eL();
        ei();
        this.fd.eT();
        if (this.oM != Status.CLEARED) {
            cancel();
            if (this.eE != null) {
                m(this.eE);
            }
            if (em()) {
                this.oJ.d(dW());
            }
            this.oM = Status.CLEARED;
        }
    }

    public boolean dj() {
        return isComplete();
    }

    public boolean isCancelled() {
        return this.oM == Status.CANCELLED || this.oM == Status.CLEARED;
    }

    public boolean isComplete() {
        return this.oM == Status.COMPLETE;
    }

    public boolean isFailed() {
        return this.oM == Status.FAILED;
    }

    public boolean isPaused() {
        return this.oM == Status.PAUSED;
    }

    public boolean isRunning() {
        return this.oM == Status.RUNNING || this.oM == Status.WAITING_FOR_SIZE;
    }

    public void p(int i, int i2) {
        this.fd.eT();
        if (oG) {
            StringBuilder sb = new StringBuilder();
            sb.append("Got onSizeReady in ");
            sb.append(com.bumptech.glide.util.e.f(this.startTime));
            F(sb.toString());
        }
        if (this.oM == Status.WAITING_FOR_SIZE) {
            this.oM = Status.RUNNING;
            float ee = this.bs.ee();
            this.width = a(i, ee);
            this.height = a(i2, ee);
            if (oG) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("finished setup for calling load in ");
                sb2.append(com.bumptech.glide.util.e.f(this.startTime));
                F(sb2.toString());
            }
            b a = this.ak.a(this.ao, this.bu, this.bs.aA(), this.width, this.height, this.bs.bf(), this.br, this.eX, this.bs.ax(), this.bs.dR(), this.bs.dS(), this.bs.aE(), this.bs.az(), this.bs.dZ(), this.bs.ef(), this.bs.eg(), this.bs.eh(), this);
            this.oL = a;
            if (this.oM != Status.RUNNING) {
                this.oL = null;
            }
            if (oG) {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("finished onSizeReady in ");
                sb3.append(com.bumptech.glide.util.e.f(this.startTime));
                F(sb3.toString());
            }
        }
    }

    public void pause() {
        clear();
        this.oM = Status.PAUSED;
    }

    public void recycle() {
        ei();
        this.context = null;
        this.ao = null;
        this.bu = null;
        this.br = null;
        this.bs = null;
        this.ox = -1;
        this.ow = -1;
        this.oJ = null;
        this.bv = null;
        this.oH = null;
        this.oI = null;
        this.oK = null;
        this.oL = null;
        this.oN = null;
        this.ou = null;
        this.oz = null;
        this.width = -1;
        this.height = -1;
        gQ.release(this);
    }
}
