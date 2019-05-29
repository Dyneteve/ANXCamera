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
    protected static final f bq = new f().b(g.fV).c(Priority.LOW).m(true);
    private final f aA;
    private final i aI;
    private final c ai;
    private final e ao;
    private boolean bA;
    private boolean bB;
    private final Class<TranscodeType> br;
    @NonNull
    protected f bs;
    @NonNull
    private j<?, ? super TranscodeType> bt;
    @Nullable
    private Object bu;
    @Nullable
    private e<TranscodeType> bv;
    @Nullable
    private h<TranscodeType> bw;
    @Nullable
    private h<TranscodeType> bx;
    @Nullable
    private Float by;
    private boolean bz;
    private final Context context;

    /* compiled from: RequestBuilder */
    /* renamed from: com.bumptech.glide.h$2 reason: invalid class name */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] bE = new int[ScaleType.values().length];

        static {
            bF = new int[Priority.values().length];
            try {
                bF[Priority.LOW.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                bF[Priority.NORMAL.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                bF[Priority.HIGH.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                bF[Priority.IMMEDIATE.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                bE[ScaleType.CENTER_CROP.ordinal()] = 1;
            } catch (NoSuchFieldError e5) {
            }
            try {
                bE[ScaleType.CENTER_INSIDE.ordinal()] = 2;
            } catch (NoSuchFieldError e6) {
            }
            try {
                bE[ScaleType.FIT_CENTER.ordinal()] = 3;
            } catch (NoSuchFieldError e7) {
            }
            try {
                bE[ScaleType.FIT_START.ordinal()] = 4;
            } catch (NoSuchFieldError e8) {
            }
            try {
                bE[ScaleType.FIT_END.ordinal()] = 5;
            } catch (NoSuchFieldError e9) {
            }
            try {
                bE[ScaleType.FIT_XY.ordinal()] = 6;
            } catch (NoSuchFieldError e10) {
            }
            try {
                bE[ScaleType.CENTER.ordinal()] = 7;
            } catch (NoSuchFieldError e11) {
            }
            try {
                bE[ScaleType.MATRIX.ordinal()] = 8;
            } catch (NoSuchFieldError e12) {
            }
        }
    }

    protected h(c cVar, i iVar, Class<TranscodeType> cls, Context context2) {
        this.bz = true;
        this.ai = cVar;
        this.aI = iVar;
        this.br = cls;
        this.aA = iVar.s();
        this.context = context2;
        this.bt = iVar.a(cls);
        this.bs = this.aA;
        this.ao = cVar.n();
    }

    protected h(Class<TranscodeType> cls, h<?> hVar) {
        this(hVar.ai, hVar.aI, cls, hVar.context);
        this.bu = hVar.bu;
        this.bA = hVar.bA;
        this.bs = hVar.bs;
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
                sb.append(this.bs.ay());
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private c a(n<TranscodeType> nVar, @Nullable e<TranscodeType> eVar, @Nullable d dVar, j<?, ? super TranscodeType> jVar, Priority priority, int i, int i2, f fVar) {
        a aVar;
        ? r3;
        if (this.bx != null) {
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
        int eb = this.bx.bs.eb();
        int ed = this.bx.bs.ed();
        if (k.s(i, i2) && !this.bx.bs.ec()) {
            eb = fVar.eb();
            ed = fVar.ed();
        }
        int i3 = eb;
        int i4 = ed;
        n<TranscodeType> nVar2 = nVar;
        e<TranscodeType> eVar2 = eVar;
        d dVar2 = aVar;
        aVar.a(b, this.bx.a(nVar2, eVar2, dVar2, this.bx.bt, this.bx.bs.ay(), i3, i4, this.bx.bs));
        return aVar;
    }

    private c a(n<TranscodeType> nVar, e<TranscodeType> eVar, f fVar, d dVar, j<?, ? super TranscodeType> jVar, Priority priority, int i, int i2) {
        Context context2 = this.context;
        e eVar2 = this.ao;
        Object obj = this.bu;
        Class<TranscodeType> cls = this.br;
        return SingleRequest.a(context2, eVar2, obj, cls, fVar, i, i2, priority, nVar, eVar, this.bv, dVar, this.ao.u(), jVar.O());
    }

    private <Y extends n<TranscodeType>> Y a(@NonNull Y y, @Nullable e<TranscodeType> eVar, @NonNull f fVar) {
        k.eL();
        i.checkNotNull(y);
        if (this.bA) {
            f dM = fVar.dM();
            c b = b(y, eVar, dM);
            c dp = y.dp();
            if (!b.c(dp) || a(dM, dp)) {
                this.aI.d((n<?>) y);
                y.j(b);
                this.aI.a(y, b);
                return y;
            }
            b.recycle();
            if (!((c) i.checkNotNull(dp)).isRunning()) {
                dp.begin();
            }
            return y;
        }
        throw new IllegalArgumentException("You must call #load() before calling #into()");
    }

    private boolean a(f fVar, c cVar) {
        return !fVar.dZ() && cVar.isComplete();
    }

    private c b(n<TranscodeType> nVar, e<TranscodeType> eVar, @Nullable d dVar, j<?, ? super TranscodeType> jVar, Priority priority, int i, int i2, f fVar) {
        d dVar2 = dVar;
        Priority priority2 = priority;
        if (this.bw != null) {
            if (!this.bB) {
                j<?, ? super TranscodeType> jVar2 = this.bw.bz ? jVar : this.bw.bt;
                Priority ay = this.bw.bs.ea() ? this.bw.bs.ay() : a(priority2);
                int eb = this.bw.bs.eb();
                int ed = this.bw.bs.ed();
                if (k.s(i, i2) && !this.bw.bs.ec()) {
                    eb = fVar.eb();
                    ed = fVar.ed();
                }
                int i3 = eb;
                int i4 = ed;
                com.bumptech.glide.request.h hVar = new com.bumptech.glide.request.h(dVar2);
                c a = a(nVar, eVar, fVar, (d) hVar, jVar, priority2, i, i2);
                this.bB = true;
                com.bumptech.glide.request.h hVar2 = hVar;
                c a2 = this.bw.a(nVar, eVar, (d) hVar, jVar2, ay, i3, i4, this.bw.bs);
                this.bB = false;
                hVar2.a(a, a2);
                return hVar2;
            }
            throw new IllegalStateException("You cannot use a request as both the main request and a thumbnail, consider using clone() on the request(s) passed to thumbnail()");
        } else if (this.by == null) {
            return a(nVar, eVar, fVar, dVar2, jVar, priority2, i, i2);
        } else {
            com.bumptech.glide.request.h hVar3 = new com.bumptech.glide.request.h(dVar2);
            e<TranscodeType> eVar2 = eVar;
            com.bumptech.glide.request.h hVar4 = hVar3;
            j<?, ? super TranscodeType> jVar3 = jVar;
            int i5 = i;
            int i6 = i2;
            hVar3.a(a(nVar, eVar2, fVar, (d) hVar4, jVar3, priority2, i5, i6), a(nVar, eVar2, fVar.clone().h(this.by.floatValue()), (d) hVar4, jVar3, a(priority2), i5, i6));
            return hVar3;
        }
    }

    private c b(n<TranscodeType> nVar, @Nullable e<TranscodeType> eVar, f fVar) {
        return a(nVar, eVar, (d) null, this.bt, fVar.ay(), fVar.eb(), fVar.ed(), fVar);
    }

    @NonNull
    private h<TranscodeType> h(@Nullable Object obj) {
        this.bu = obj;
        this.bA = true;
        return this;
    }

    @NonNull
    public n<TranscodeType> A() {
        return h(Integer.MIN_VALUE, Integer.MIN_VALUE);
    }

    /* access modifiers changed from: protected */
    @CheckResult
    @NonNull
    public h<File> B() {
        return new h(File.class, this).b(bq);
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> a(float f) {
        if (f < 0.0f || f > 1.0f) {
            throw new IllegalArgumentException("sizeMultiplier must be between 0 and 1");
        }
        this.by = Float.valueOf(f);
        return this;
    }

    @NonNull
    public h<TranscodeType> a(@Nullable h<TranscodeType> hVar) {
        this.bx = hVar;
        return this;
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> a(@NonNull j<?, ? super TranscodeType> jVar) {
        this.bt = (j) i.checkNotNull(jVar);
        this.bz = false;
        return this;
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> a(@Nullable e<TranscodeType> eVar) {
        this.bv = eVar;
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
        k.eL();
        i.checkNotNull(imageView);
        f fVar = this.bs;
        if (!fVar.dz() && fVar.dy() && imageView.getScaleType() != null) {
            switch (AnonymousClass2.bE[imageView.getScaleType().ordinal()]) {
                case 1:
                    fVar = fVar.clone().dB();
                    break;
                case 2:
                    fVar = fVar.clone().dF();
                    break;
                case 3:
                case 4:
                case 5:
                    fVar = fVar.clone().dD();
                    break;
                case 6:
                    fVar = fVar.clone().dF();
                    break;
            }
        }
        return (ViewTarget) a(this.ao.a(imageView, this.br), null, fVar);
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public <Y extends n<TranscodeType>> Y a(@NonNull Y y, @Nullable e<TranscodeType> eVar) {
        return a(y, eVar, x());
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable Bitmap bitmap) {
        return h(bitmap).b(f.a(g.fU));
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable Drawable drawable) {
        return h(drawable).b(f.a(g.fU));
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable Uri uri) {
        return h(uri);
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> b(@Nullable h<TranscodeType> hVar) {
        this.bw = hVar;
        return this;
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> b(@NonNull f fVar) {
        i.checkNotNull(fVar);
        this.bs = x().g(fVar);
        return this;
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable File file) {
        return h(file);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable @RawRes @DrawableRes Integer num) {
        return h(num).b(f.j(com.bumptech.glide.e.a.n(this.context)));
    }

    @Deprecated
    @CheckResult
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable URL url) {
        return h(url);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable byte[] bArr) {
        h<TranscodeType> h = h(bArr);
        if (!h.bs.dP()) {
            h = h.b(f.a(g.fU));
        }
        return !h.bs.dQ() ? h.b(f.i(true)) : h;
    }

    @NonNull
    public <Y extends n<TranscodeType>> Y b(@NonNull Y y) {
        return a(y, null);
    }

    @Deprecated
    @CheckResult
    public <Y extends n<File>> Y c(@NonNull Y y) {
        return B().b(y);
    }

    @Deprecated
    public b<TranscodeType> f(int i, int i2) {
        return g(i, i2);
    }

    @CheckResult
    @NonNull
    /* renamed from: g */
    public h<TranscodeType> load(@Nullable Object obj) {
        return h(obj);
    }

    @NonNull
    public b<TranscodeType> g(int i, int i2) {
        final RequestFutureTarget requestFutureTarget = new RequestFutureTarget(this.ao.t(), i, i2);
        if (k.eO()) {
            this.ao.t().post(new Runnable() {
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
    public n<TranscodeType> h(int i, int i2) {
        return b((Y) com.bumptech.glide.request.target.k.b(this.aI, i, i2));
    }

    @Deprecated
    @CheckResult
    public b<File> i(int i, int i2) {
        return B().g(i, i2);
    }

    @CheckResult
    @NonNull
    /* renamed from: m */
    public h<TranscodeType> l(@Nullable String str) {
        return h(str);
    }

    /* access modifiers changed from: protected */
    @NonNull
    public f x() {
        return this.aA == this.bs ? this.bs.clone() : this.bs;
    }

    @CheckResult
    /* renamed from: y */
    public h<TranscodeType> clone() {
        try {
            h<TranscodeType> hVar = (h) super.clone();
            hVar.bs = hVar.bs.clone();
            hVar.bt = hVar.bt.clone();
            return hVar;
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(e);
        }
    }

    @NonNull
    public b<TranscodeType> z() {
        return g(Integer.MIN_VALUE, Integer.MIN_VALUE);
    }
}
