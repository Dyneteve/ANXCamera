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
    protected static final f br = new f().b(g.fW).c(Priority.LOW).m(true);
    private final f aB;
    private final i aJ;
    private final c aj;
    private final e ap;
    private boolean bA;
    private boolean bB;
    private boolean bC;
    private final Class<TranscodeType> bs;
    @NonNull
    protected f bt;
    @NonNull
    private j<?, ? super TranscodeType> bu;
    @Nullable
    private Object bv;
    @Nullable
    private e<TranscodeType> bw;
    @Nullable
    private h<TranscodeType> bx;
    @Nullable
    private h<TranscodeType> by;
    @Nullable
    private Float bz;
    private final Context context;

    /* compiled from: RequestBuilder */
    /* renamed from: com.bumptech.glide.h$2 reason: invalid class name */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] bF = new int[ScaleType.values().length];

        static {
            bG = new int[Priority.values().length];
            try {
                bG[Priority.LOW.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                bG[Priority.NORMAL.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                bG[Priority.HIGH.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                bG[Priority.IMMEDIATE.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                bF[ScaleType.CENTER_CROP.ordinal()] = 1;
            } catch (NoSuchFieldError e5) {
            }
            try {
                bF[ScaleType.CENTER_INSIDE.ordinal()] = 2;
            } catch (NoSuchFieldError e6) {
            }
            try {
                bF[ScaleType.FIT_CENTER.ordinal()] = 3;
            } catch (NoSuchFieldError e7) {
            }
            try {
                bF[ScaleType.FIT_START.ordinal()] = 4;
            } catch (NoSuchFieldError e8) {
            }
            try {
                bF[ScaleType.FIT_END.ordinal()] = 5;
            } catch (NoSuchFieldError e9) {
            }
            try {
                bF[ScaleType.FIT_XY.ordinal()] = 6;
            } catch (NoSuchFieldError e10) {
            }
            try {
                bF[ScaleType.CENTER.ordinal()] = 7;
            } catch (NoSuchFieldError e11) {
            }
            try {
                bF[ScaleType.MATRIX.ordinal()] = 8;
            } catch (NoSuchFieldError e12) {
            }
        }
    }

    protected h(c cVar, i iVar, Class<TranscodeType> cls, Context context2) {
        this.bA = true;
        this.aj = cVar;
        this.aJ = iVar;
        this.bs = cls;
        this.aB = iVar.s();
        this.context = context2;
        this.bu = iVar.a(cls);
        this.bt = this.aB;
        this.ap = cVar.n();
    }

    protected h(Class<TranscodeType> cls, h<?> hVar) {
        this(hVar.aj, hVar.aJ, cls, hVar.context);
        this.bv = hVar.bv;
        this.bB = hVar.bB;
        this.bt = hVar.bt;
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
                sb.append(this.bt.ay());
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
        if (this.by != null) {
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
        int eb = this.by.bt.eb();
        int ed = this.by.bt.ed();
        if (k.s(i, i2) && !this.by.bt.ec()) {
            eb = fVar.eb();
            ed = fVar.ed();
        }
        int i3 = eb;
        int i4 = ed;
        n<TranscodeType> nVar2 = nVar;
        e<TranscodeType> eVar2 = eVar;
        d dVar2 = aVar;
        aVar.a(b, this.by.a(nVar2, eVar2, dVar2, this.by.bu, this.by.bt.ay(), i3, i4, this.by.bt));
        return aVar;
    }

    private c a(n<TranscodeType> nVar, e<TranscodeType> eVar, f fVar, d dVar, j<?, ? super TranscodeType> jVar, Priority priority, int i, int i2) {
        Context context2 = this.context;
        e eVar2 = this.ap;
        Object obj = this.bv;
        Class<TranscodeType> cls = this.bs;
        return SingleRequest.a(context2, eVar2, obj, cls, fVar, i, i2, priority, nVar, eVar, this.bw, dVar, this.ap.u(), jVar.O());
    }

    private <Y extends n<TranscodeType>> Y a(@NonNull Y y, @Nullable e<TranscodeType> eVar, @NonNull f fVar) {
        k.eL();
        i.checkNotNull(y);
        if (this.bB) {
            f dM = fVar.dM();
            c b = b(y, eVar, dM);
            c dp = y.dp();
            if (!b.c(dp) || a(dM, dp)) {
                this.aJ.d((n<?>) y);
                y.j(b);
                this.aJ.a(y, b);
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
        if (this.bx != null) {
            if (!this.bC) {
                j<?, ? super TranscodeType> jVar2 = this.bx.bA ? jVar : this.bx.bu;
                Priority ay = this.bx.bt.ea() ? this.bx.bt.ay() : a(priority2);
                int eb = this.bx.bt.eb();
                int ed = this.bx.bt.ed();
                if (k.s(i, i2) && !this.bx.bt.ec()) {
                    eb = fVar.eb();
                    ed = fVar.ed();
                }
                int i3 = eb;
                int i4 = ed;
                com.bumptech.glide.request.h hVar = new com.bumptech.glide.request.h(dVar2);
                c a = a(nVar, eVar, fVar, (d) hVar, jVar, priority2, i, i2);
                this.bC = true;
                com.bumptech.glide.request.h hVar2 = hVar;
                c a2 = this.bx.a(nVar, eVar, (d) hVar, jVar2, ay, i3, i4, this.bx.bt);
                this.bC = false;
                hVar2.a(a, a2);
                return hVar2;
            }
            throw new IllegalStateException("You cannot use a request as both the main request and a thumbnail, consider using clone() on the request(s) passed to thumbnail()");
        } else if (this.bz == null) {
            return a(nVar, eVar, fVar, dVar2, jVar, priority2, i, i2);
        } else {
            com.bumptech.glide.request.h hVar3 = new com.bumptech.glide.request.h(dVar2);
            e<TranscodeType> eVar2 = eVar;
            com.bumptech.glide.request.h hVar4 = hVar3;
            j<?, ? super TranscodeType> jVar3 = jVar;
            int i5 = i;
            int i6 = i2;
            hVar3.a(a(nVar, eVar2, fVar, (d) hVar4, jVar3, priority2, i5, i6), a(nVar, eVar2, fVar.clone().h(this.bz.floatValue()), (d) hVar4, jVar3, a(priority2), i5, i6));
            return hVar3;
        }
    }

    private c b(n<TranscodeType> nVar, @Nullable e<TranscodeType> eVar, f fVar) {
        return a(nVar, eVar, (d) null, this.bu, fVar.ay(), fVar.eb(), fVar.ed(), fVar);
    }

    @NonNull
    private h<TranscodeType> h(@Nullable Object obj) {
        this.bv = obj;
        this.bB = true;
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
        return new h(File.class, this).b(br);
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> a(float f) {
        if (f < 0.0f || f > 1.0f) {
            throw new IllegalArgumentException("sizeMultiplier must be between 0 and 1");
        }
        this.bz = Float.valueOf(f);
        return this;
    }

    @NonNull
    public h<TranscodeType> a(@Nullable h<TranscodeType> hVar) {
        this.by = hVar;
        return this;
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> a(@NonNull j<?, ? super TranscodeType> jVar) {
        this.bu = (j) i.checkNotNull(jVar);
        this.bA = false;
        return this;
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> a(@Nullable e<TranscodeType> eVar) {
        this.bw = eVar;
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
        f fVar = this.bt;
        if (!fVar.dz() && fVar.dy() && imageView.getScaleType() != null) {
            switch (AnonymousClass2.bF[imageView.getScaleType().ordinal()]) {
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
        return (ViewTarget) a(this.ap.a(imageView, this.bs), null, fVar);
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
        return h(bitmap).b(f.a(g.fV));
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable Drawable drawable) {
        return h(drawable).b(f.a(g.fV));
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
        this.bx = hVar;
        return this;
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> b(@NonNull f fVar) {
        i.checkNotNull(fVar);
        this.bt = x().g(fVar);
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
        if (!h.bt.dP()) {
            h = h.b(f.a(g.fV));
        }
        return !h.bt.dQ() ? h.b(f.i(true)) : h;
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
        final RequestFutureTarget requestFutureTarget = new RequestFutureTarget(this.ap.t(), i, i2);
        if (k.eO()) {
            this.ap.t().post(new Runnable() {
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
        return b((Y) com.bumptech.glide.request.target.k.b(this.aJ, i, i2));
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
        return this.aB == this.bt ? this.bt.clone() : this.bt;
    }

    @CheckResult
    /* renamed from: y */
    public h<TranscodeType> clone() {
        try {
            h<TranscodeType> hVar = (h) super.clone();
            hVar.bt = hVar.bt.clone();
            hVar.bu = hVar.bu.clone();
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
