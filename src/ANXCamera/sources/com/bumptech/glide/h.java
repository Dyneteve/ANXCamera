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
    protected static final f bp = new f().b(g.fU).c(Priority.LOW).m(true);
    private final i aH;
    private final c ah;
    private final e an;
    private final f az;
    private boolean bA;
    private final Class<TranscodeType> bq;
    @NonNull
    protected f br;
    @NonNull
    private j<?, ? super TranscodeType> bs;
    @Nullable
    private Object bt;
    @Nullable
    private e<TranscodeType> bu;
    @Nullable
    private h<TranscodeType> bv;
    @Nullable
    private h<TranscodeType> bw;
    @Nullable
    private Float bx;
    private boolean by;
    private boolean bz;
    private final Context context;

    /* compiled from: RequestBuilder */
    /* renamed from: com.bumptech.glide.h$2 reason: invalid class name */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] bD = new int[ScaleType.values().length];

        static {
            bE = new int[Priority.values().length];
            try {
                bE[Priority.LOW.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                bE[Priority.NORMAL.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                bE[Priority.HIGH.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                bE[Priority.IMMEDIATE.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                bD[ScaleType.CENTER_CROP.ordinal()] = 1;
            } catch (NoSuchFieldError e5) {
            }
            try {
                bD[ScaleType.CENTER_INSIDE.ordinal()] = 2;
            } catch (NoSuchFieldError e6) {
            }
            try {
                bD[ScaleType.FIT_CENTER.ordinal()] = 3;
            } catch (NoSuchFieldError e7) {
            }
            try {
                bD[ScaleType.FIT_START.ordinal()] = 4;
            } catch (NoSuchFieldError e8) {
            }
            try {
                bD[ScaleType.FIT_END.ordinal()] = 5;
            } catch (NoSuchFieldError e9) {
            }
            try {
                bD[ScaleType.FIT_XY.ordinal()] = 6;
            } catch (NoSuchFieldError e10) {
            }
            try {
                bD[ScaleType.CENTER.ordinal()] = 7;
            } catch (NoSuchFieldError e11) {
            }
            try {
                bD[ScaleType.MATRIX.ordinal()] = 8;
            } catch (NoSuchFieldError e12) {
            }
        }
    }

    protected h(c cVar, i iVar, Class<TranscodeType> cls, Context context2) {
        this.by = true;
        this.ah = cVar;
        this.aH = iVar;
        this.bq = cls;
        this.az = iVar.s();
        this.context = context2;
        this.bs = iVar.a(cls);
        this.br = this.az;
        this.an = cVar.n();
    }

    protected h(Class<TranscodeType> cls, h<?> hVar) {
        this(hVar.ah, hVar.aH, cls, hVar.context);
        this.bt = hVar.bt;
        this.bz = hVar.bz;
        this.br = hVar.br;
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
                sb.append(this.br.ay());
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
        if (this.bw != null) {
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
        int eb = this.bw.br.eb();
        int ed = this.bw.br.ed();
        if (k.s(i, i2) && !this.bw.br.ec()) {
            eb = fVar.eb();
            ed = fVar.ed();
        }
        int i3 = eb;
        int i4 = ed;
        n<TranscodeType> nVar2 = nVar;
        e<TranscodeType> eVar2 = eVar;
        d dVar2 = aVar;
        aVar.a(b, this.bw.a(nVar2, eVar2, dVar2, this.bw.bs, this.bw.br.ay(), i3, i4, this.bw.br));
        return aVar;
    }

    private c a(n<TranscodeType> nVar, e<TranscodeType> eVar, f fVar, d dVar, j<?, ? super TranscodeType> jVar, Priority priority, int i, int i2) {
        Context context2 = this.context;
        e eVar2 = this.an;
        Object obj = this.bt;
        Class<TranscodeType> cls = this.bq;
        return SingleRequest.a(context2, eVar2, obj, cls, fVar, i, i2, priority, nVar, eVar, this.bu, dVar, this.an.u(), jVar.O());
    }

    private <Y extends n<TranscodeType>> Y a(@NonNull Y y, @Nullable e<TranscodeType> eVar, @NonNull f fVar) {
        k.eL();
        i.checkNotNull(y);
        if (this.bz) {
            f dM = fVar.dM();
            c b = b(y, eVar, dM);
            c dp = y.dp();
            if (!b.c(dp) || a(dM, dp)) {
                this.aH.d((n<?>) y);
                y.j(b);
                this.aH.a(y, b);
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
        if (this.bv != null) {
            if (!this.bA) {
                j<?, ? super TranscodeType> jVar2 = this.bv.by ? jVar : this.bv.bs;
                Priority ay = this.bv.br.ea() ? this.bv.br.ay() : a(priority2);
                int eb = this.bv.br.eb();
                int ed = this.bv.br.ed();
                if (k.s(i, i2) && !this.bv.br.ec()) {
                    eb = fVar.eb();
                    ed = fVar.ed();
                }
                int i3 = eb;
                int i4 = ed;
                com.bumptech.glide.request.h hVar = new com.bumptech.glide.request.h(dVar2);
                c a = a(nVar, eVar, fVar, (d) hVar, jVar, priority2, i, i2);
                this.bA = true;
                com.bumptech.glide.request.h hVar2 = hVar;
                c a2 = this.bv.a(nVar, eVar, (d) hVar, jVar2, ay, i3, i4, this.bv.br);
                this.bA = false;
                hVar2.a(a, a2);
                return hVar2;
            }
            throw new IllegalStateException("You cannot use a request as both the main request and a thumbnail, consider using clone() on the request(s) passed to thumbnail()");
        } else if (this.bx == null) {
            return a(nVar, eVar, fVar, dVar2, jVar, priority2, i, i2);
        } else {
            com.bumptech.glide.request.h hVar3 = new com.bumptech.glide.request.h(dVar2);
            e<TranscodeType> eVar2 = eVar;
            com.bumptech.glide.request.h hVar4 = hVar3;
            j<?, ? super TranscodeType> jVar3 = jVar;
            int i5 = i;
            int i6 = i2;
            hVar3.a(a(nVar, eVar2, fVar, (d) hVar4, jVar3, priority2, i5, i6), a(nVar, eVar2, fVar.clone().h(this.bx.floatValue()), (d) hVar4, jVar3, a(priority2), i5, i6));
            return hVar3;
        }
    }

    private c b(n<TranscodeType> nVar, @Nullable e<TranscodeType> eVar, f fVar) {
        return a(nVar, eVar, (d) null, this.bs, fVar.ay(), fVar.eb(), fVar.ed(), fVar);
    }

    @NonNull
    private h<TranscodeType> h(@Nullable Object obj) {
        this.bt = obj;
        this.bz = true;
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
        return new h(File.class, this).b(bp);
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> a(float f) {
        if (f < 0.0f || f > 1.0f) {
            throw new IllegalArgumentException("sizeMultiplier must be between 0 and 1");
        }
        this.bx = Float.valueOf(f);
        return this;
    }

    @NonNull
    public h<TranscodeType> a(@Nullable h<TranscodeType> hVar) {
        this.bw = hVar;
        return this;
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> a(@NonNull j<?, ? super TranscodeType> jVar) {
        this.bs = (j) i.checkNotNull(jVar);
        this.by = false;
        return this;
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> a(@Nullable e<TranscodeType> eVar) {
        this.bu = eVar;
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
        f fVar = this.br;
        if (!fVar.dz() && fVar.dy() && imageView.getScaleType() != null) {
            switch (AnonymousClass2.bD[imageView.getScaleType().ordinal()]) {
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
        return (ViewTarget) a(this.an.a(imageView, this.bq), null, fVar);
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
        return h(bitmap).b(f.a(g.fT));
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable Drawable drawable) {
        return h(drawable).b(f.a(g.fT));
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
        this.bv = hVar;
        return this;
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> b(@NonNull f fVar) {
        i.checkNotNull(fVar);
        this.br = x().g(fVar);
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
        if (!h.br.dP()) {
            h = h.b(f.a(g.fT));
        }
        return !h.br.dQ() ? h.b(f.i(true)) : h;
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
        final RequestFutureTarget requestFutureTarget = new RequestFutureTarget(this.an.t(), i, i2);
        if (k.eO()) {
            this.an.t().post(new Runnable() {
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
        return b((Y) com.bumptech.glide.request.target.k.b(this.aH, i, i2));
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
        return this.az == this.br ? this.br.clone() : this.br;
    }

    @CheckResult
    /* renamed from: y */
    public h<TranscodeType> clone() {
        try {
            h<TranscodeType> hVar = (h) super.clone();
            hVar.br = hVar.br.clone();
            hVar.bs = hVar.bs.clone();
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
