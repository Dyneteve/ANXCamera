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
import com.bumptech.glide.util.a.a.C0012a;
import com.bumptech.glide.util.a.a.c;
import com.bumptech.glide.util.k;

public final class SingleRequest<R> implements c, g, m, c {
    private static final String TAG = "Request";
    private static final Pool<SingleRequest<?>> hR = a.a(150, (C0012a<T>) new C0012a<SingleRequest<?>>() {
        /* renamed from: eT */
        public SingleRequest<?> create() {
            return new SingleRequest<>();
        }
    });
    private static final String pE = "Glide";
    private static final boolean pG = Log.isLoggable(TAG, 2);
    private Engine bl;
    private e bp;
    private Context context;
    private Class<R> cv;
    private f cw;
    @Nullable
    private Object cy;
    private e<R> cz;
    private p<R> fF;
    private Priority fY;
    private final com.bumptech.glide.util.a.c ge;
    private int height;
    private boolean pF;
    @Nullable
    private e<R> pH;
    private d pI;
    private n<R> pJ;
    private g<? super R> pK;
    private b pL;
    private Status pM;
    private Drawable pN;
    private Drawable pu;
    private int pw;
    private int px;
    private Drawable pz;
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
        this.tag = pG ? String.valueOf(super.hashCode()) : null;
        this.ge = com.bumptech.glide.util.a.c.fu();
    }

    private void F(String str) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(" this: ");
        sb.append(this.tag);
        Log.v(str2, sb.toString());
    }

    private Drawable X(@DrawableRes int i) {
        return com.bumptech.glide.load.resource.b.a.a((Context) this.bp, i, this.cw.getTheme() != null ? this.cw.getTheme() : this.context.getTheme());
    }

    private static int a(int i, float f) {
        return i == Integer.MIN_VALUE ? i : Math.round(f * ((float) i));
    }

    public static <R> SingleRequest<R> a(Context context2, e eVar, Object obj, Class<R> cls, f fVar, int i, int i2, Priority priority, n<R> nVar, e<R> eVar2, e<R> eVar3, d dVar, Engine engine, g<? super R> gVar) {
        SingleRequest<R> singleRequest = (SingleRequest) hR.acquire();
        if (singleRequest == null) {
            singleRequest = new SingleRequest<>();
        }
        singleRequest.b(context2, eVar, obj, cls, fVar, i, i2, priority, nVar, eVar2, eVar3, dVar, engine, gVar);
        return singleRequest;
    }

    /* JADX INFO: finally extract failed */
    private void a(GlideException glideException, int i) {
        this.ge.fv();
        int logLevel = this.bp.getLogLevel();
        if (logLevel <= i) {
            String str = pE;
            StringBuilder sb = new StringBuilder();
            sb.append("Load failed for ");
            sb.append(this.cy);
            sb.append(" with size [");
            sb.append(this.width);
            sb.append("x");
            sb.append(this.height);
            sb.append("]");
            Log.w(str, sb.toString(), glideException);
            if (logLevel <= 4) {
                glideException.s(pE);
            }
        }
        this.pL = null;
        this.pM = Status.FAILED;
        this.pF = true;
        try {
            if ((this.cz == null || !this.cz.a(glideException, this.cy, this.pJ, eQ())) && (this.pH == null || !this.pH.a(glideException, this.cy, this.pJ, eQ()))) {
                eM();
            }
            this.pF = false;
            eS();
        } catch (Throwable th) {
            this.pF = false;
            throw th;
        }
    }

    /* JADX INFO: finally extract failed */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x0093, code lost:
        if (r7.pH.a(r9, r7.cy, r7.pJ, r10, r6) == false) goto L_0x0095;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:8:0x0080, code lost:
        if (r7.cz.a(r9, r7.cy, r7.pJ, r10, r6) == false) goto L_0x0082;
     */
    private void a(p<R> pVar, R r, DataSource dataSource) {
        boolean eQ = eQ();
        this.pM = Status.COMPLETE;
        this.fF = pVar;
        if (this.bp.getLogLevel() <= 3) {
            String str = pE;
            StringBuilder sb = new StringBuilder();
            sb.append("Finished loading ");
            sb.append(r.getClass().getSimpleName());
            sb.append(" from ");
            sb.append(dataSource);
            sb.append(" for ");
            sb.append(this.cy);
            sb.append(" with size [");
            sb.append(this.width);
            sb.append("x");
            sb.append(this.height);
            sb.append("] in ");
            sb.append(com.bumptech.glide.util.e.f(this.startTime));
            sb.append(" ms");
            Log.d(str, sb.toString());
        }
        this.pF = true;
        try {
            if (this.cz != null) {
            }
            if (this.pH != null) {
            }
            this.pJ.a(r, this.pK.a(dataSource, eQ));
            this.pF = false;
            eR();
        } catch (Throwable th) {
            this.pF = false;
            throw th;
        }
    }

    private void b(Context context2, e eVar, Object obj, Class<R> cls, f fVar, int i, int i2, Priority priority, n<R> nVar, e<R> eVar2, e<R> eVar3, d dVar, Engine engine, g<? super R> gVar) {
        this.context = context2;
        this.bp = eVar;
        this.cy = obj;
        this.cv = cls;
        this.cw = fVar;
        this.px = i;
        this.pw = i2;
        this.fY = priority;
        this.pJ = nVar;
        this.pH = eVar2;
        this.cz = eVar3;
        this.pI = dVar;
        this.bl = engine;
        this.pK = gVar;
        this.pM = Status.PENDING;
    }

    private Drawable eA() {
        if (this.pz == null) {
            this.pz = this.cw.eA();
            if (this.pz == null && this.cw.ez() > 0) {
                this.pz = X(this.cw.ez());
            }
        }
        return this.pz;
    }

    private void eK() {
        if (this.pF) {
            throw new IllegalStateException("You can't start or clear loads in RequestListener or Target callbacks. If you're trying to start a fallback request when a load fails, use RequestBuilder#error(RequestBuilder). Otherwise consider posting your into() or clear() calls to the main thread using a Handler instead.");
        }
    }

    private Drawable eL() {
        if (this.pN == null) {
            this.pN = this.cw.ev();
            if (this.pN == null && this.cw.ew() > 0) {
                this.pN = X(this.cw.ew());
            }
        }
        return this.pN;
    }

    private void eM() {
        if (eP()) {
            Drawable drawable = null;
            if (this.cy == null) {
                drawable = eA();
            }
            if (drawable == null) {
                drawable = eL();
            }
            if (drawable == null) {
                drawable = ey();
            }
            this.pJ.f(drawable);
        }
    }

    private boolean eN() {
        return this.pI == null || this.pI.d(this);
    }

    private boolean eO() {
        return this.pI == null || this.pI.f(this);
    }

    private boolean eP() {
        return this.pI == null || this.pI.e(this);
    }

    private boolean eQ() {
        return this.pI == null || !this.pI.dP();
    }

    private void eR() {
        if (this.pI != null) {
            this.pI.h(this);
        }
    }

    private void eS() {
        if (this.pI != null) {
            this.pI.i(this);
        }
    }

    private Drawable ey() {
        if (this.pu == null) {
            this.pu = this.cw.ey();
            if (this.pu == null && this.cw.ex() > 0) {
                this.pu = X(this.cw.ex());
            }
        }
        return this.pu;
    }

    private void m(p<?> pVar) {
        this.bl.d(pVar);
        this.fF = null;
    }

    public void a(GlideException glideException) {
        a(glideException, 5);
    }

    public void begin() {
        eK();
        this.ge.fv();
        this.startTime = com.bumptech.glide.util.e.fm();
        if (this.cy == null) {
            if (k.t(this.px, this.pw)) {
                this.width = this.px;
                this.height = this.pw;
            }
            a(new GlideException("Received null model"), eA() == null ? 5 : 3);
        } else if (this.pM == Status.RUNNING) {
            throw new IllegalArgumentException("Cannot restart a running request");
        } else if (this.pM == Status.COMPLETE) {
            c(this.fF, DataSource.MEMORY_CACHE);
        } else {
            this.pM = Status.WAITING_FOR_SIZE;
            if (k.t(this.px, this.pw)) {
                q(this.px, this.pw);
            } else {
                this.pJ.a(this);
            }
            if ((this.pM == Status.RUNNING || this.pM == Status.WAITING_FOR_SIZE) && eP()) {
                this.pJ.e(ey());
            }
            if (pG) {
                StringBuilder sb = new StringBuilder();
                sb.append("finished run method in ");
                sb.append(com.bumptech.glide.util.e.f(this.startTime));
                F(sb.toString());
            }
        }
    }

    @NonNull
    public com.bumptech.glide.util.a.c bq() {
        return this.ge;
    }

    public void c(p<?> pVar, DataSource dataSource) {
        this.ge.fv();
        this.pL = null;
        if (pVar == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("Expected to receive a Resource<R> with an object of ");
            sb.append(this.cv);
            sb.append(" inside, but instead got null.");
            a(new GlideException(sb.toString()));
            return;
        }
        Object obj = pVar.get();
        if (obj == null || !this.cv.isAssignableFrom(obj.getClass())) {
            m(pVar);
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Expected to receive an object of ");
            sb2.append(this.cv);
            sb2.append(" but instead got ");
            sb2.append(obj != null ? obj.getClass() : "");
            sb2.append("{");
            sb2.append(obj);
            sb2.append("} inside Resource{");
            sb2.append(pVar);
            sb2.append("}.");
            sb2.append(obj != null ? "" : " To indicate failure return a null Resource object, rather than a Resource object containing null data.");
            a(new GlideException(sb2.toString()));
        } else if (!eN()) {
            m(pVar);
            this.pM = Status.COMPLETE;
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
        if (this.px == singleRequest.px && this.pw == singleRequest.pw && k.e(this.cy, singleRequest.cy) && this.cv.equals(singleRequest.cv) && this.cw.equals(singleRequest.cw) && this.fY == singleRequest.fY && (this.cz == null ? singleRequest.cz == null : singleRequest.cz != null)) {
            z = true;
        }
        return z;
    }

    /* access modifiers changed from: 0000 */
    public void cancel() {
        eK();
        this.ge.fv();
        this.pJ.b(this);
        this.pM = Status.CANCELLED;
        if (this.pL != null) {
            this.pL.cancel();
            this.pL = null;
        }
    }

    public void clear() {
        k.fn();
        eK();
        this.ge.fv();
        if (this.pM != Status.CLEARED) {
            cancel();
            if (this.fF != null) {
                m(this.fF);
            }
            if (eO()) {
                this.pJ.d(ey());
            }
            this.pM = Status.CLEARED;
        }
    }

    public boolean dL() {
        return isComplete();
    }

    public boolean isCancelled() {
        return this.pM == Status.CANCELLED || this.pM == Status.CLEARED;
    }

    public boolean isComplete() {
        return this.pM == Status.COMPLETE;
    }

    public boolean isFailed() {
        return this.pM == Status.FAILED;
    }

    public boolean isPaused() {
        return this.pM == Status.PAUSED;
    }

    public boolean isRunning() {
        return this.pM == Status.RUNNING || this.pM == Status.WAITING_FOR_SIZE;
    }

    public void pause() {
        clear();
        this.pM = Status.PAUSED;
    }

    public void q(int i, int i2) {
        this.ge.fv();
        if (pG) {
            StringBuilder sb = new StringBuilder();
            sb.append("Got onSizeReady in ");
            sb.append(com.bumptech.glide.util.e.f(this.startTime));
            F(sb.toString());
        }
        if (this.pM == Status.WAITING_FOR_SIZE) {
            this.pM = Status.RUNNING;
            float eG = this.cw.eG();
            this.width = a(i, eG);
            this.height = a(i2, eG);
            if (pG) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("finished setup for calling load in ");
                sb2.append(com.bumptech.glide.util.e.f(this.startTime));
                F(sb2.toString());
            }
            b a = this.bl.a(this.bp, this.cy, this.cw.ba(), this.width, this.height, this.cw.bG(), this.cv, this.fY, this.cw.aX(), this.cw.et(), this.cw.eu(), this.cw.be(), this.cw.aZ(), this.cw.eB(), this.cw.eH(), this.cw.eI(), this.cw.eJ(), this);
            this.pL = a;
            if (this.pM != Status.RUNNING) {
                this.pL = null;
            }
            if (pG) {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("finished onSizeReady in ");
                sb3.append(com.bumptech.glide.util.e.f(this.startTime));
                F(sb3.toString());
            }
        }
    }

    public void recycle() {
        eK();
        this.context = null;
        this.bp = null;
        this.cy = null;
        this.cv = null;
        this.cw = null;
        this.px = -1;
        this.pw = -1;
        this.pJ = null;
        this.cz = null;
        this.pH = null;
        this.pI = null;
        this.pK = null;
        this.pL = null;
        this.pN = null;
        this.pu = null;
        this.pz = null;
        this.width = -1;
        this.height = -1;
        hR.release(this);
    }
}
