package com.bumptech.glide;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.annotation.CheckResult;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RawRes;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import com.bumptech.glide.load.engine.g;
import com.bumptech.glide.request.RequestFutureTarget;
import com.bumptech.glide.request.SingleRequest;
import com.bumptech.glide.request.a;
import com.bumptech.glide.request.b;
import com.bumptech.glide.request.c;
import com.bumptech.glide.request.d;
import com.bumptech.glide.request.e;
import com.bumptech.glide.request.f;
import com.bumptech.glide.request.target.ViewTarget;
import com.bumptech.glide.request.target.n;
import com.bumptech.glide.util.i;
import com.bumptech.glide.util.k;
import java.io.File;
import java.net.URL;

/* compiled from: RequestBuilder */
public class h<TranscodeType> implements g<h<TranscodeType>>, Cloneable {
    protected static final f cu = new f().b(g.gW).c(Priority.LOW).m(true);
    private final f bB;
    private final i bJ;
    private final c bj;
    private final e bp;
    @Nullable
    private h<TranscodeType> cA;
    @Nullable
    private h<TranscodeType> cB;
    @Nullable
    private Float cC;
    private boolean cD;
    private boolean cE;
    private boolean cF;
    private final Context context;
    private final Class<TranscodeType> cv;
    @NonNull
    protected f cw;
    @NonNull
    private j<?, ? super TranscodeType> cx;
    @Nullable
    private Object cy;
    @Nullable
    private e<TranscodeType> cz;

    /* renamed from: com.bumptech.glide.h$2 reason: invalid class name */
    /* compiled from: RequestBuilder */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] cI = new int[ScaleType.values().length];

        static {
            cJ = new int[Priority.values().length];
            try {
                cJ[Priority.LOW.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                cJ[Priority.NORMAL.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                cJ[Priority.HIGH.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                cJ[Priority.IMMEDIATE.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                cI[ScaleType.CENTER_CROP.ordinal()] = 1;
            } catch (NoSuchFieldError e5) {
            }
            try {
                cI[ScaleType.CENTER_INSIDE.ordinal()] = 2;
            } catch (NoSuchFieldError e6) {
            }
            try {
                cI[ScaleType.FIT_CENTER.ordinal()] = 3;
            } catch (NoSuchFieldError e7) {
            }
            try {
                cI[ScaleType.FIT_START.ordinal()] = 4;
            } catch (NoSuchFieldError e8) {
            }
            try {
                cI[ScaleType.FIT_END.ordinal()] = 5;
            } catch (NoSuchFieldError e9) {
            }
            try {
                cI[ScaleType.FIT_XY.ordinal()] = 6;
            } catch (NoSuchFieldError e10) {
            }
            try {
                cI[ScaleType.CENTER.ordinal()] = 7;
            } catch (NoSuchFieldError e11) {
            }
            try {
                cI[ScaleType.MATRIX.ordinal()] = 8;
            } catch (NoSuchFieldError e12) {
            }
        }
    }

    protected h(c cVar, i iVar, Class<TranscodeType> cls, Context context2) {
        this.cD = true;
        this.bj = cVar;
        this.bJ = iVar;
        this.cv = cls;
        this.bB = iVar.S();
        this.context = context2;
        this.cx = iVar.b(cls);
        this.cw = this.bB;
        this.bp = cVar.N();
    }

    protected h(Class<TranscodeType> cls, h<?> hVar) {
        this(hVar.bj, hVar.bJ, cls, hVar.context);
        this.cy = hVar.cy;
        this.cE = hVar.cE;
        this.cw = hVar.cw;
    }

    @NonNull
    private Priority a(@NonNull Priority priority) {
        switch (priority) {
            case LOW:
                return Priority.NORMAL;
            case NORMAL:
                return Priority.HIGH;
            case HIGH:
            case IMMEDIATE:
                return Priority.IMMEDIATE;
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("unknown priority: ");
                sb.append(this.cw.aY());
                throw new IllegalArgumentException(sb.toString());
        }
    }

    /* JADX WARNING: type inference failed for: r3v0, types: [com.bumptech.glide.request.d] */
    /* JADX WARNING: type inference failed for: r1v11 */
    /* JADX WARNING: type inference failed for: r3v5 */
    /* JADX WARNING: type inference failed for: r0v4, types: [com.bumptech.glide.request.a] */
    /* JADX WARNING: type inference failed for: r3v6 */
    /* JADX WARNING: type inference failed for: r3v7 */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Unknown variable types count: 4 */
    private c a(n<TranscodeType> nVar, @Nullable e<TranscodeType> eVar, @Nullable d dVar, j<?, ? super TranscodeType> jVar, Priority priority, int i, int i2, f fVar) {
        a aVar;
        ? r3;
        if (this.cB != null) {
            ? aVar2 = new a(dVar);
            aVar = aVar2;
            r3 = aVar2;
        } else {
            aVar = 0;
            r3 = dVar;
        }
        c b = b(nVar, eVar, r3, jVar, priority, i, i2, fVar);
        if (aVar == 0) {
            return b;
        }
        int eD = this.cB.cw.eD();
        int eF = this.cB.cw.eF();
        if (k.t(i, i2) && !this.cB.cw.eE()) {
            eD = fVar.eD();
            eF = fVar.eF();
        }
        int i3 = eD;
        int i4 = eF;
        n<TranscodeType> nVar2 = nVar;
        e<TranscodeType> eVar2 = eVar;
        d dVar2 = aVar;
        aVar.a(b, this.cB.a(nVar2, eVar2, dVar2, this.cB.cx, this.cB.cw.aY(), i3, i4, this.cB.cw));
        return aVar;
    }

    private c a(n<TranscodeType> nVar, e<TranscodeType> eVar, f fVar, d dVar, j<?, ? super TranscodeType> jVar, Priority priority, int i, int i2) {
        Context context2 = this.context;
        e eVar2 = this.bp;
        Object obj = this.cy;
        Class<TranscodeType> cls = this.cv;
        return SingleRequest.a(context2, eVar2, obj, cls, fVar, i, i2, priority, nVar, eVar, this.cz, dVar, this.bp.U(), jVar.ao());
    }

    private <Y extends n<TranscodeType>> Y a(@NonNull Y y, @Nullable e<TranscodeType> eVar, @NonNull f fVar) {
        k.fn();
        i.checkNotNull(y);
        if (this.cE) {
            f eo = fVar.eo();
            c b = b(y, eVar, eo);
            c dR = y.dR();
            if (!b.c(dR) || a(eo, dR)) {
                this.bJ.d((n<?>) y);
                y.j(b);
                this.bJ.a(y, b);
                return y;
            }
            b.recycle();
            if (!((c) i.checkNotNull(dR)).isRunning()) {
                dR.begin();
            }
            return y;
        }
        throw new IllegalArgumentException("You must call #load() before calling #into()");
    }

    private boolean a(f fVar, c cVar) {
        return !fVar.eB() && cVar.isComplete();
    }

    private c b(n<TranscodeType> nVar, e<TranscodeType> eVar, @Nullable d dVar, j<?, ? super TranscodeType> jVar, Priority priority, int i, int i2, f fVar) {
        d dVar2 = dVar;
        Priority priority2 = priority;
        if (this.cA != null) {
            if (!this.cF) {
                j<?, ? super TranscodeType> jVar2 = this.cA.cD ? jVar : this.cA.cx;
                Priority aY = this.cA.cw.eC() ? this.cA.cw.aY() : a(priority2);
                int eD = this.cA.cw.eD();
                int eF = this.cA.cw.eF();
                if (k.t(i, i2) && !this.cA.cw.eE()) {
                    eD = fVar.eD();
                    eF = fVar.eF();
                }
                int i3 = eD;
                int i4 = eF;
                com.bumptech.glide.request.h hVar = new com.bumptech.glide.request.h(dVar2);
                c a = a(nVar, eVar, fVar, (d) hVar, jVar, priority2, i, i2);
                this.cF = true;
                com.bumptech.glide.request.h hVar2 = hVar;
                c a2 = this.cA.a(nVar, eVar, (d) hVar, jVar2, aY, i3, i4, this.cA.cw);
                this.cF = false;
                hVar2.a(a, a2);
                return hVar2;
            }
            throw new IllegalStateException("You cannot use a request as both the main request and a thumbnail, consider using clone() on the request(s) passed to thumbnail()");
        } else if (this.cC == null) {
            return a(nVar, eVar, fVar, dVar2, jVar, priority2, i, i2);
        } else {
            com.bumptech.glide.request.h hVar3 = new com.bumptech.glide.request.h(dVar2);
            e<TranscodeType> eVar2 = eVar;
            com.bumptech.glide.request.h hVar4 = hVar3;
            j<?, ? super TranscodeType> jVar3 = jVar;
            int i5 = i;
            int i6 = i2;
            hVar3.a(a(nVar, eVar2, fVar, (d) hVar4, jVar3, priority2, i5, i6), a(nVar, eVar2, fVar.clone().h(this.cC.floatValue()), (d) hVar4, jVar3, a(priority2), i5, i6));
            return hVar3;
        }
    }

    private c b(n<TranscodeType> nVar, @Nullable e<TranscodeType> eVar, f fVar) {
        return a(nVar, eVar, (d) null, this.cx, fVar.aY(), fVar.eD(), fVar.eF(), fVar);
    }

    @NonNull
    private h<TranscodeType> k(@Nullable Object obj) {
        this.cy = obj;
        this.cE = true;
        return this;
    }

    /* access modifiers changed from: protected */
    @NonNull
    public f X() {
        return this.bB == this.cw ? this.cw.clone() : this.cw;
    }

    @CheckResult
    /* renamed from: Y */
    public h<TranscodeType> clone() {
        try {
            h<TranscodeType> hVar = (h) super.clone();
            hVar.cw = hVar.cw.clone();
            hVar.cx = hVar.cx.clone();
            return hVar;
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(e);
        }
    }

    @NonNull
    public b<TranscodeType> Z() {
        return h(Integer.MIN_VALUE, Integer.MIN_VALUE);
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> a(float f) {
        if (f < 0.0f || f > 1.0f) {
            throw new IllegalArgumentException("sizeMultiplier must be between 0 and 1");
        }
        this.cC = Float.valueOf(f);
        return this;
    }

    @NonNull
    public h<TranscodeType> a(@Nullable h<TranscodeType> hVar) {
        this.cB = hVar;
        return this;
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> a(@NonNull j<?, ? super TranscodeType> jVar) {
        this.cx = (j) i.checkNotNull(jVar);
        this.cD = false;
        return this;
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> a(@Nullable e<TranscodeType> eVar) {
        this.cz = eVar;
        return this;
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> a(@Nullable h<TranscodeType>... hVarArr) {
        h<TranscodeType> hVar = null;
        if (hVarArr == null || hVarArr.length == 0) {
            return b(null);
        }
        for (int length = hVarArr.length - 1; length >= 0; length--) {
            h<TranscodeType> hVar2 = hVarArr[length];
            if (hVar2 != null) {
                hVar = hVar == null ? hVar2 : hVar2.b(hVar);
            }
        }
        return b(hVar);
    }

    @NonNull
    public ViewTarget<ImageView, TranscodeType> a(@NonNull ImageView imageView) {
        k.fn();
        i.checkNotNull(imageView);
        f fVar = this.cw;
        if (!fVar.eb() && fVar.ea() && imageView.getScaleType() != null) {
            switch (AnonymousClass2.cI[imageView.getScaleType().ordinal()]) {
                case 1:
                    fVar = fVar.clone().ed();
                    break;
                case 2:
                    fVar = fVar.clone().eh();
                    break;
                case 3:
                case 4:
                case 5:
                    fVar = fVar.clone().ef();
                    break;
                case 6:
                    fVar = fVar.clone().eh();
                    break;
            }
        }
        return (ViewTarget) a(this.bp.a(imageView, this.cv), null, fVar);
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public <Y extends n<TranscodeType>> Y a(@NonNull Y y, @Nullable e<TranscodeType> eVar) {
        return a(y, eVar, X());
    }

    @NonNull
    public n<TranscodeType> aa() {
        return i(Integer.MIN_VALUE, Integer.MIN_VALUE);
    }

    /* access modifiers changed from: protected */
    @CheckResult
    @NonNull
    public h<File> ab() {
        return new h(File.class, this).b(cu);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable Bitmap bitmap) {
        return k(bitmap).b(f.a(g.gV));
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable Drawable drawable) {
        return k(drawable).b(f.a(g.gV));
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable Uri uri) {
        return k(uri);
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> b(@Nullable h<TranscodeType> hVar) {
        this.cA = hVar;
        return this;
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> b(@NonNull f fVar) {
        i.checkNotNull(fVar);
        this.cw = X().g(fVar);
        return this;
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable File file) {
        return k(file);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable @RawRes @DrawableRes Integer num) {
        return k(num).b(f.j(com.bumptech.glide.e.a.n(this.context)));
    }

    @Deprecated
    @CheckResult
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable URL url) {
        return k(url);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable byte[] bArr) {
        h<TranscodeType> k = k(bArr);
        if (!k.cw.er()) {
            k = k.b(f.a(g.gV));
        }
        return !k.cw.es() ? k.b(f.i(true)) : k;
    }

    @NonNull
    public <Y extends n<TranscodeType>> Y b(@NonNull Y y) {
        return a(y, null);
    }

    @Deprecated
    @CheckResult
    public <Y extends n<File>> Y c(@NonNull Y y) {
        return ab().b(y);
    }

    @Deprecated
    public b<TranscodeType> g(int i, int i2) {
        return h(i, i2);
    }

    @NonNull
    public b<TranscodeType> h(int i, int i2) {
        final RequestFutureTarget requestFutureTarget = new RequestFutureTarget(this.bp.T(), i, i2);
        if (k.fq()) {
            this.bp.T().post(new Runnable() {
                public void run() {
                    if (!requestFutureTarget.isCancelled()) {
                        h.this.a(requestFutureTarget, (e<TranscodeType>) requestFutureTarget);
                    }
                }
            });
        } else {
            a((Y) requestFutureTarget, (e<TranscodeType>) requestFutureTarget);
        }
        return requestFutureTarget;
    }

    @NonNull
    public n<TranscodeType> i(int i, int i2) {
        return b((Y) com.bumptech.glide.request.target.k.b(this.bJ, i, i2));
    }

    @CheckResult
    @NonNull
    /* renamed from: j */
    public h<TranscodeType> load(@Nullable Object obj) {
        return k(obj);
    }

    @Deprecated
    @CheckResult
    public b<File> j(int i, int i2) {
        return ab().h(i, i2);
    }

    @CheckResult
    @NonNull
    /* renamed from: m */
    public h<TranscodeType> l(@Nullable String str) {
        return k(str);
    }
}
