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
    private static final f bH = f.o(Bitmap.class).dL();
    private static final f bI = f.o(com.bumptech.glide.load.resource.gif.b.class).dL();
    private static final f br = f.a(g.fW).c(Priority.LOW).m(true);
    private final Handler aF;
    protected final c aj;
    final h bJ;
    private final n bK;
    private final m bL;
    private final o bM;
    private final Runnable bN;
    private final c bO;
    private f bt;
    protected final Context context;

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
        private final n bK;

        b(@NonNull n nVar) {
            this.bK = nVar;
        }

        public void d(boolean z) {
            if (z) {
                this.bK.de();
            }
        }
    }

    public i(@NonNull c cVar, @NonNull h hVar, @NonNull m mVar, @NonNull Context context2) {
        this(cVar, hVar, mVar, new n(), cVar.m(), context2);
    }

    i(c cVar, h hVar, m mVar, n nVar, d dVar, Context context2) {
        this.bM = new o();
        this.bN = new Runnable() {
            public void run() {
                i.this.bJ.a(i.this);
            }
        };
        this.aF = new Handler(Looper.getMainLooper());
        this.aj = cVar;
        this.bJ = hVar;
        this.bL = mVar;
        this.bK = nVar;
        this.context = context2;
        this.bO = dVar.a(context2.getApplicationContext(), new b(nVar));
        if (k.eO()) {
            this.aF.post(this.bN);
        } else {
            hVar.a(this);
        }
        hVar.a(this.bO);
        c(cVar.n().s());
        cVar.a(this);
    }

    private void d(@NonNull f fVar) {
        this.bt = this.bt.g(fVar);
    }

    private void e(@NonNull com.bumptech.glide.request.target.n<?> nVar) {
        if (!f(nVar) && !this.aj.a(nVar) && nVar.dp() != null) {
            com.bumptech.glide.request.c dp = nVar.dp();
            nVar.j(null);
            dp.clear();
        }
    }

    public void C() {
        k.eL();
        this.bK.C();
    }

    public void D() {
        k.eL();
        this.bK.D();
    }

    public void E() {
        k.eL();
        C();
        for (i C : this.bL.cW()) {
            C.C();
        }
    }

    public void F() {
        k.eL();
        this.bK.F();
    }

    public void G() {
        k.eL();
        F();
        for (i F : this.bL.cW()) {
            F.F();
        }
    }

    @CheckResult
    @NonNull
    public h<Bitmap> H() {
        return b(Bitmap.class).b(bH);
    }

    @CheckResult
    @NonNull
    public h<com.bumptech.glide.load.resource.gif.b> I() {
        return b(com.bumptech.glide.load.resource.gif.b.class).b(bI);
    }

    @CheckResult
    @NonNull
    public h<Drawable> J() {
        return b(Drawable.class);
    }

    @CheckResult
    @NonNull
    public h<File> K() {
        return b(File.class).b(br);
    }

    @CheckResult
    @NonNull
    public h<File> L() {
        return b(File.class).b(f.i(true));
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public <T> j<?, T> a(Class<T> cls) {
        return this.aj.n().a(cls);
    }

    /* access modifiers changed from: 0000 */
    public void a(@NonNull com.bumptech.glide.request.target.n<?> nVar, @NonNull com.bumptech.glide.request.c cVar) {
        this.bM.g(nVar);
        this.bK.a(cVar);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<Drawable> a(@Nullable Bitmap bitmap) {
        return J().a(bitmap);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<Drawable> a(@Nullable Drawable drawable) {
        return J().a(drawable);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<Drawable> a(@Nullable Uri uri) {
        return J().a(uri);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<Drawable> a(@Nullable File file) {
        return J().a(file);
    }

    @CheckResult
    @NonNull
    public <ResourceType> h<ResourceType> b(@NonNull Class<ResourceType> cls) {
        return new h<>(this.aj, this, cls, this.context);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<Drawable> a(@Nullable @RawRes @DrawableRes Integer num) {
        return J().a(num);
    }

    @Deprecated
    @CheckResult
    /* renamed from: b */
    public h<Drawable> a(@Nullable URL url) {
        return J().a(url);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<Drawable> a(@Nullable byte[] bArr) {
        return J().a(bArr);
    }

    public void b(@NonNull View view) {
        d((com.bumptech.glide.request.target.n<?>) new a<Object>(view));
    }

    /* access modifiers changed from: protected */
    public void c(@NonNull f fVar) {
        this.bt = fVar.clone().dM();
    }

    public void d(@Nullable final com.bumptech.glide.request.target.n<?> nVar) {
        if (nVar != null) {
            if (k.eN()) {
                e(nVar);
            } else {
                this.aF.post(new Runnable() {
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
        com.bumptech.glide.request.c dp = nVar.dp();
        if (dp == null) {
            return true;
        }
        if (!this.bK.b(dp)) {
            return false;
        }
        this.bM.h(nVar);
        nVar.j(null);
        return true;
    }

    @CheckResult
    @NonNull
    /* renamed from: g */
    public h<Drawable> load(@Nullable Object obj) {
        return J().load(obj);
    }

    @CheckResult
    @NonNull
    public h<File> i(@Nullable Object obj) {
        return K().load(obj);
    }

    public boolean isPaused() {
        k.eL();
        return this.bK.isPaused();
    }

    @CheckResult
    @NonNull
    /* renamed from: m */
    public h<Drawable> l(@Nullable String str) {
        return J().l(str);
    }

    public void onDestroy() {
        this.bM.onDestroy();
        for (com.bumptech.glide.request.target.n d : this.bM.getAll()) {
            d(d);
        }
        this.bM.clear();
        this.bK.dd();
        this.bJ.b(this);
        this.bJ.b(this.bO);
        this.aF.removeCallbacks(this.bN);
        this.aj.b(this);
    }

    public void onStart() {
        F();
        this.bM.onStart();
    }

    public void onStop() {
        C();
        this.bM.onStop();
    }

    /* access modifiers changed from: 0000 */
    public f s() {
        return this.bt;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append("{tracker=");
        sb.append(this.bK);
        sb.append(", treeNode=");
        sb.append(this.bL);
        sb.append("}");
        return sb.toString();
    }
}
