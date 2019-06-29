package com.bumptech.glide;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.CheckResult;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RawRes;
import android.view.View;
import com.bumptech.glide.load.engine.g;
import com.bumptech.glide.manager.c;
import com.bumptech.glide.manager.d;
import com.bumptech.glide.manager.h;
import com.bumptech.glide.manager.m;
import com.bumptech.glide.manager.n;
import com.bumptech.glide.manager.o;
import com.bumptech.glide.request.f;
import com.bumptech.glide.request.target.ViewTarget;
import com.bumptech.glide.util.k;
import java.io.File;
import java.net.URL;

/* compiled from: RequestManager */
public class i implements g<h<Drawable>>, com.bumptech.glide.manager.i {
    private static final f cK = f.p(Bitmap.class).en();
    private static final f cL = f.p(com.bumptech.glide.load.resource.gif.b.class).en();
    private static final f cu = f.a(g.gW).c(Priority.LOW).m(true);
    private final Handler bF;
    protected final c bj;
    final h cM;
    private final n cN;
    private final m cO;
    private final o cP;
    private final Runnable cQ;
    private final c cR;
    protected final Context context;
    private f cw;

    /* compiled from: RequestManager */
    private static class a extends ViewTarget<View, Object> {
        a(@NonNull View view) {
            super(view);
        }

        public void a(@NonNull Object obj, @Nullable com.bumptech.glide.request.a.f<? super Object> fVar) {
        }
    }

    /* compiled from: RequestManager */
    private static class b implements com.bumptech.glide.manager.c.a {
        private final n cN;

        b(@NonNull n nVar) {
            this.cN = nVar;
        }

        public void d(boolean z) {
            if (z) {
                this.cN.dG();
            }
        }
    }

    public i(@NonNull c cVar, @NonNull h hVar, @NonNull m mVar, @NonNull Context context2) {
        this(cVar, hVar, mVar, new n(), cVar.M(), context2);
    }

    i(c cVar, h hVar, m mVar, n nVar, d dVar, Context context2) {
        this.cP = new o();
        this.cQ = new Runnable() {
            public void run() {
                i.this.cM.a(i.this);
            }
        };
        this.bF = new Handler(Looper.getMainLooper());
        this.bj = cVar;
        this.cM = hVar;
        this.cO = mVar;
        this.cN = nVar;
        this.context = context2;
        this.cR = dVar.a(context2.getApplicationContext(), new b(nVar));
        if (k.fq()) {
            this.bF.post(this.cQ);
        } else {
            hVar.a(this);
        }
        hVar.a(this.cR);
        c(cVar.N().S());
        cVar.a(this);
    }

    private void d(@NonNull f fVar) {
        this.cw = this.cw.g(fVar);
    }

    private void e(@NonNull com.bumptech.glide.request.target.n<?> nVar) {
        if (!f(nVar) && !this.bj.a(nVar) && nVar.dR() != null) {
            com.bumptech.glide.request.c dR = nVar.dR();
            nVar.j(null);
            dR.clear();
        }
    }

    /* access modifiers changed from: 0000 */
    public f S() {
        return this.cw;
    }

    /* access modifiers changed from: 0000 */
    public void a(@NonNull com.bumptech.glide.request.target.n<?> nVar, @NonNull com.bumptech.glide.request.c cVar) {
        this.cP.g(nVar);
        this.cN.a(cVar);
    }

    public void ac() {
        k.fn();
        this.cN.ac();
    }

    public void ad() {
        k.fn();
        this.cN.ad();
    }

    public void ae() {
        k.fn();
        ac();
        for (i ac : this.cO.dy()) {
            ac.ac();
        }
    }

    public void af() {
        k.fn();
        this.cN.af();
    }

    public void ag() {
        k.fn();
        af();
        for (i af : this.cO.dy()) {
            af.af();
        }
    }

    @CheckResult
    @NonNull
    public h<Bitmap> ah() {
        return c(Bitmap.class).b(cK);
    }

    @CheckResult
    @NonNull
    public h<com.bumptech.glide.load.resource.gif.b> ai() {
        return c(com.bumptech.glide.load.resource.gif.b.class).b(cL);
    }

    @CheckResult
    @NonNull
    public h<Drawable> aj() {
        return c(Drawable.class);
    }

    @CheckResult
    @NonNull
    public h<File> ak() {
        return c(File.class).b(cu);
    }

    @CheckResult
    @NonNull
    public h<File> al() {
        return c(File.class).b(f.i(true));
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<Drawable> a(@Nullable Bitmap bitmap) {
        return aj().a(bitmap);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<Drawable> a(@Nullable Drawable drawable) {
        return aj().a(drawable);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<Drawable> a(@Nullable Uri uri) {
        return aj().a(uri);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<Drawable> a(@Nullable File file) {
        return aj().a(file);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<Drawable> a(@Nullable @RawRes @DrawableRes Integer num) {
        return aj().a(num);
    }

    @Deprecated
    @CheckResult
    /* renamed from: b */
    public h<Drawable> a(@Nullable URL url) {
        return aj().a(url);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<Drawable> a(@Nullable byte[] bArr) {
        return aj().a(bArr);
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public <T> j<?, T> b(Class<T> cls) {
        return this.bj.N().b(cls);
    }

    public void b(@NonNull View view) {
        d((com.bumptech.glide.request.target.n<?>) new a<Object>(view));
    }

    @CheckResult
    @NonNull
    public <ResourceType> h<ResourceType> c(@NonNull Class<ResourceType> cls) {
        return new h<>(this.bj, this, cls, this.context);
    }

    /* access modifiers changed from: protected */
    public void c(@NonNull f fVar) {
        this.cw = fVar.clone().eo();
    }

    public void d(@Nullable final com.bumptech.glide.request.target.n<?> nVar) {
        if (nVar != null) {
            if (k.fp()) {
                e(nVar);
            } else {
                this.bF.post(new Runnable() {
                    public void run() {
                        i.this.d(nVar);
                    }
                });
            }
        }
    }

    @NonNull
    public i e(@NonNull f fVar) {
        d(fVar);
        return this;
    }

    @NonNull
    public i f(@NonNull f fVar) {
        c(fVar);
        return this;
    }

    /* access modifiers changed from: 0000 */
    public boolean f(@NonNull com.bumptech.glide.request.target.n<?> nVar) {
        com.bumptech.glide.request.c dR = nVar.dR();
        if (dR == null) {
            return true;
        }
        if (!this.cN.b(dR)) {
            return false;
        }
        this.cP.h(nVar);
        nVar.j(null);
        return true;
    }

    public boolean isPaused() {
        k.fn();
        return this.cN.isPaused();
    }

    @CheckResult
    @NonNull
    /* renamed from: j */
    public h<Drawable> load(@Nullable Object obj) {
        return aj().load(obj);
    }

    @CheckResult
    @NonNull
    public h<File> l(@Nullable Object obj) {
        return ak().load(obj);
    }

    @CheckResult
    @NonNull
    /* renamed from: m */
    public h<Drawable> l(@Nullable String str) {
        return aj().l(str);
    }

    public void onDestroy() {
        this.cP.onDestroy();
        for (com.bumptech.glide.request.target.n d : this.cP.getAll()) {
            d(d);
        }
        this.cP.clear();
        this.cN.dF();
        this.cM.b(this);
        this.cM.b(this.cR);
        this.bF.removeCallbacks(this.cQ);
        this.bj.b(this);
    }

    public void onStart() {
        af();
        this.cP.onStart();
    }

    public void onStop() {
        ac();
        this.cP.onStop();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append("{tracker=");
        sb.append(this.cN);
        sb.append(", treeNode=");
        sb.append(this.cO);
        sb.append("}");
        return sb.toString();
    }
}
