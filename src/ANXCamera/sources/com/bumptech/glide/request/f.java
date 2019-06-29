package com.bumptech.glide.request;

import android.content.res.Resources.Theme;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.annotation.CheckResult;
import android.support.annotation.DrawableRes;
import android.support.annotation.FloatRange;
import android.support.annotation.IntRange;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.Priority;
import com.bumptech.glide.e.b;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.d;
import com.bumptech.glide.load.engine.g;
import com.bumptech.glide.load.i;
import com.bumptech.glide.load.resource.bitmap.DownsampleStrategy;
import com.bumptech.glide.load.resource.bitmap.VideoDecoder;
import com.bumptech.glide.load.resource.bitmap.j;
import com.bumptech.glide.load.resource.bitmap.l;
import com.bumptech.glide.load.resource.bitmap.n;
import com.bumptech.glide.load.resource.bitmap.p;
import com.bumptech.glide.load.resource.bitmap.q;
import com.bumptech.glide.load.resource.gif.e;
import com.bumptech.glide.util.CachedHashCodeArrayMap;
import com.bumptech.glide.util.k;
import java.util.Map;

/* compiled from: RequestOptions */
public class f implements Cloneable {
    private static final int PRIORITY = 8;
    private static final int UNSET = -1;
    private static final int oP = 2;
    private static final int oQ = 4;
    private static final int oR = 16;
    private static final int oS = 32;
    private static final int oT = 64;
    private static final int oU = 128;
    private static final int oV = 256;
    private static final int oW = 512;
    private static final int oX = 1024;
    private static final int oY = 2048;
    private static final int oZ = 4096;
    private static final int pa = 8192;
    private static final int pb = 16384;
    private static final int pc = 32768;
    private static final int pd = 65536;
    private static final int pe = 131072;
    private static final int pf = 262144;
    private static final int pg = 524288;
    private static final int ph = 1048576;
    @Nullable
    private static f pi;
    @Nullable
    private static f pj;
    @Nullable
    private static f pk;
    @Nullable
    private static f pl;
    @Nullable
    private static f pm;
    @Nullable
    private static f pn;
    @Nullable
    private static f po;
    @Nullable
    private static f pp;
    private boolean fE = true;
    @NonNull
    private c fP = b.fj();
    @NonNull
    private com.bumptech.glide.load.f fR = new com.bumptech.glide.load.f();
    @NonNull
    private Class<?> fT = Object.class;
    @NonNull
    private Map<Class<?>, i<?>> fV = new CachedHashCodeArrayMap();
    @NonNull
    private Priority fY = Priority.NORMAL;
    @NonNull
    private g fZ = g.gY;
    private boolean ga;
    private boolean gb = true;
    private boolean gn;
    private boolean hA;
    private boolean isLocked;
    private int pA;
    @Nullable
    private Theme pB;
    private boolean pC;
    private boolean pD;
    private int pq;
    private float pr = 1.0f;
    @Nullable
    private Drawable ps;
    private int pt;
    @Nullable
    private Drawable pu;
    private int pv;
    private int pw = -1;
    private int px = -1;
    private boolean py = true;
    @Nullable
    private Drawable pz;

    @CheckResult
    @NonNull
    public static f M(@DrawableRes int i) {
        return new f().R(i);
    }

    @CheckResult
    @NonNull
    public static f N(@DrawableRes int i) {
        return new f().T(i);
    }

    @CheckResult
    @NonNull
    public static f O(@IntRange(from = 0) int i) {
        return n(i, i);
    }

    @CheckResult
    @NonNull
    public static f P(@IntRange(from = 0) int i) {
        return new f().W(i);
    }

    @CheckResult
    @NonNull
    public static f Q(@IntRange(from = 0, to = 100) int i) {
        return new f().V(i);
    }

    @CheckResult
    @NonNull
    public static f a(@NonNull CompressFormat compressFormat) {
        return new f().b(compressFormat);
    }

    @CheckResult
    @NonNull
    public static f a(@NonNull DecodeFormat decodeFormat) {
        return new f().b(decodeFormat);
    }

    @CheckResult
    @NonNull
    public static f a(@NonNull g gVar) {
        return new f().b(gVar);
    }

    @CheckResult
    @NonNull
    public static f a(@NonNull i<Bitmap> iVar) {
        return new f().b(iVar);
    }

    @NonNull
    private f a(@NonNull i<Bitmap> iVar, boolean z) {
        if (this.pC) {
            return clone().a(iVar, z);
        }
        p pVar = new p(iVar, z);
        a(Bitmap.class, iVar, z);
        a(Drawable.class, (i<T>) pVar, z);
        a(BitmapDrawable.class, pVar.cW(), z);
        a(com.bumptech.glide.load.resource.gif.b.class, (i<T>) new e<T>(iVar), z);
        return ep();
    }

    @CheckResult
    @NonNull
    public static f a(@NonNull DownsampleStrategy downsampleStrategy) {
        return new f().b(downsampleStrategy);
    }

    @NonNull
    private f a(@NonNull DownsampleStrategy downsampleStrategy, @NonNull i<Bitmap> iVar, boolean z) {
        f b = z ? b(downsampleStrategy, iVar) : a(downsampleStrategy, iVar);
        b.gb = true;
        return b;
    }

    @NonNull
    private <T> f a(@NonNull Class<T> cls, @NonNull i<T> iVar, boolean z) {
        if (this.pC) {
            return clone().a(cls, iVar, z);
        }
        com.bumptech.glide.util.i.checkNotNull(cls);
        com.bumptech.glide.util.i.checkNotNull(iVar);
        this.fV.put(cls, iVar);
        this.pq |= 2048;
        this.py = true;
        this.pq |= 65536;
        this.gb = false;
        if (z) {
            this.pq |= 131072;
            this.ga = true;
        }
        return ep();
    }

    @CheckResult
    @NonNull
    public static f b(@NonNull Priority priority) {
        return new f().c(priority);
    }

    @CheckResult
    @NonNull
    public static <T> f b(@NonNull com.bumptech.glide.load.e<T> eVar, @NonNull T t) {
        return new f().c(eVar, t);
    }

    @NonNull
    private f c(@NonNull DownsampleStrategy downsampleStrategy, @NonNull i<Bitmap> iVar) {
        return a(downsampleStrategy, iVar, true);
    }

    @CheckResult
    @NonNull
    public static f d(@IntRange(from = 0) long j) {
        return new f().e(j);
    }

    @NonNull
    private f d(@NonNull DownsampleStrategy downsampleStrategy, @NonNull i<Bitmap> iVar) {
        return a(downsampleStrategy, iVar, false);
    }

    @CheckResult
    @NonNull
    public static f dT() {
        if (pk == null) {
            pk = new f().eg().eo();
        }
        return pk;
    }

    @CheckResult
    @NonNull
    public static f dU() {
        if (pl == null) {
            pl = new f().ei().eo();
        }
        return pl;
    }

    @CheckResult
    @NonNull
    public static f dV() {
        if (pm == null) {
            pm = new f().ee().eo();
        }
        return pm;
    }

    @CheckResult
    @NonNull
    public static f dW() {
        if (pn == null) {
            pn = new f().ek().eo();
        }
        return pn;
    }

    @CheckResult
    @NonNull
    public static f dX() {
        if (po == null) {
            po = new f().el().eo();
        }
        return po;
    }

    @CheckResult
    @NonNull
    public static f dY() {
        if (pp == null) {
            pp = new f().em().eo();
        }
        return pp;
    }

    @NonNull
    private f ep() {
        if (!this.isLocked) {
            return this;
        }
        throw new IllegalStateException("You cannot modify locked RequestOptions, consider clone()");
    }

    @CheckResult
    @NonNull
    public static f g(@FloatRange(from = 0.0d, to = 1.0d) float f) {
        return new f().h(f);
    }

    @CheckResult
    @NonNull
    public static f g(@Nullable Drawable drawable) {
        return new f().i(drawable);
    }

    @CheckResult
    @NonNull
    public static f h(@Nullable Drawable drawable) {
        return new f().k(drawable);
    }

    @CheckResult
    @NonNull
    public static f i(boolean z) {
        if (z) {
            if (pi == null) {
                pi = new f().m(true).eo();
            }
            return pi;
        }
        if (pj == null) {
            pj = new f().m(false).eo();
        }
        return pj;
    }

    private boolean isSet(int i) {
        return o(this.pq, i);
    }

    @CheckResult
    @NonNull
    public static f j(@NonNull c cVar) {
        return new f().k(cVar);
    }

    @CheckResult
    @NonNull
    public static f n(@IntRange(from = 0) int i, @IntRange(from = 0) int i2) {
        return new f().p(i, i2);
    }

    private static boolean o(int i, int i2) {
        return (i & i2) != 0;
    }

    @CheckResult
    @NonNull
    public static f p(@NonNull Class<?> cls) {
        return new f().q(cls);
    }

    @CheckResult
    @NonNull
    public f R(@DrawableRes int i) {
        if (this.pC) {
            return clone().R(i);
        }
        this.pv = i;
        this.pq |= 128;
        return ep();
    }

    @CheckResult
    @NonNull
    public f S(@DrawableRes int i) {
        if (this.pC) {
            return clone().S(i);
        }
        this.pA = i;
        this.pq |= 16384;
        return ep();
    }

    @CheckResult
    @NonNull
    public f T(@DrawableRes int i) {
        if (this.pC) {
            return clone().T(i);
        }
        this.pt = i;
        this.pq |= 32;
        return ep();
    }

    @CheckResult
    @NonNull
    public f U(int i) {
        return p(i, i);
    }

    @CheckResult
    @NonNull
    public f V(@IntRange(from = 0, to = 100) int i) {
        return c(com.bumptech.glide.load.resource.bitmap.e.lC, (T) Integer.valueOf(i));
    }

    @CheckResult
    @NonNull
    public f W(@IntRange(from = 0) int i) {
        return c(com.bumptech.glide.load.model.a.b.lx, (T) Integer.valueOf(i));
    }

    @CheckResult
    @NonNull
    public f a(@Nullable Theme theme) {
        if (this.pC) {
            return clone().a(theme);
        }
        this.pB = theme;
        this.pq |= 32768;
        return ep();
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public final f a(@NonNull DownsampleStrategy downsampleStrategy, @NonNull i<Bitmap> iVar) {
        if (this.pC) {
            return clone().a(downsampleStrategy, iVar);
        }
        b(downsampleStrategy);
        return a(iVar, false);
    }

    @CheckResult
    @NonNull
    public <T> f a(@NonNull Class<T> cls, @NonNull i<T> iVar) {
        return a(cls, iVar, false);
    }

    @CheckResult
    @NonNull
    public f a(@NonNull i<Bitmap>... iVarArr) {
        return a((i<Bitmap>) new d<Bitmap>((i<T>[]) iVarArr), true);
    }

    @NonNull
    public final g aX() {
        return this.fZ;
    }

    @NonNull
    public final Priority aY() {
        return this.fY;
    }

    @NonNull
    public final com.bumptech.glide.load.f aZ() {
        return this.fR;
    }

    @CheckResult
    @NonNull
    public f b(@NonNull CompressFormat compressFormat) {
        return c(com.bumptech.glide.load.resource.bitmap.e.lD, (T) com.bumptech.glide.util.i.checkNotNull(compressFormat));
    }

    @CheckResult
    @NonNull
    public f b(@NonNull DecodeFormat decodeFormat) {
        com.bumptech.glide.util.i.checkNotNull(decodeFormat);
        return c(n.mn, (T) decodeFormat).c(com.bumptech.glide.load.resource.gif.g.mn, (T) decodeFormat);
    }

    @CheckResult
    @NonNull
    public f b(@NonNull g gVar) {
        if (this.pC) {
            return clone().b(gVar);
        }
        this.fZ = (g) com.bumptech.glide.util.i.checkNotNull(gVar);
        this.pq |= 4;
        return ep();
    }

    @CheckResult
    @NonNull
    public f b(@NonNull i<Bitmap> iVar) {
        return a(iVar, true);
    }

    @CheckResult
    @NonNull
    public f b(@NonNull DownsampleStrategy downsampleStrategy) {
        return c(DownsampleStrategy.mj, (T) com.bumptech.glide.util.i.checkNotNull(downsampleStrategy));
    }

    /* access modifiers changed from: 0000 */
    @CheckResult
    @NonNull
    public final f b(@NonNull DownsampleStrategy downsampleStrategy, @NonNull i<Bitmap> iVar) {
        if (this.pC) {
            return clone().b(downsampleStrategy, iVar);
        }
        b(downsampleStrategy);
        return b(iVar);
    }

    @CheckResult
    @NonNull
    public <T> f b(@NonNull Class<T> cls, @NonNull i<T> iVar) {
        return a(cls, iVar, true);
    }

    @NonNull
    public final Class<?> bG() {
        return this.fT;
    }

    @NonNull
    public final c ba() {
        return this.fP;
    }

    /* access modifiers changed from: 0000 */
    public boolean be() {
        return this.gb;
    }

    @CheckResult
    @NonNull
    public f c(@NonNull Priority priority) {
        if (this.pC) {
            return clone().c(priority);
        }
        this.fY = (Priority) com.bumptech.glide.util.i.checkNotNull(priority);
        this.pq |= 8;
        return ep();
    }

    @CheckResult
    @NonNull
    public <T> f c(@NonNull com.bumptech.glide.load.e<T> eVar, @NonNull T t) {
        if (this.pC) {
            return clone().c(eVar, t);
        }
        com.bumptech.glide.util.i.checkNotNull(eVar);
        com.bumptech.glide.util.i.checkNotNull(t);
        this.fR.a(eVar, t);
        return ep();
    }

    @CheckResult
    @NonNull
    public f c(@NonNull i<Bitmap> iVar) {
        return a(iVar, false);
    }

    @CheckResult
    /* renamed from: dZ */
    public f clone() {
        try {
            f fVar = (f) super.clone();
            fVar.fR = new com.bumptech.glide.load.f();
            fVar.fR.a(this.fR);
            fVar.fV = new CachedHashCodeArrayMap();
            fVar.fV.putAll(this.fV);
            fVar.isLocked = false;
            fVar.pC = false;
            return fVar;
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(e);
        }
    }

    @CheckResult
    @NonNull
    public f e(@IntRange(from = 0) long j) {
        return c(VideoDecoder.mV, (T) Long.valueOf(j));
    }

    @Nullable
    public final Drawable eA() {
        return this.pz;
    }

    public final boolean eB() {
        return this.fE;
    }

    public final boolean eC() {
        return isSet(8);
    }

    public final int eD() {
        return this.px;
    }

    public final boolean eE() {
        return k.t(this.px, this.pw);
    }

    public final int eF() {
        return this.pw;
    }

    public final float eG() {
        return this.pr;
    }

    public final boolean eH() {
        return this.pD;
    }

    public final boolean eI() {
        return this.hA;
    }

    public final boolean eJ() {
        return this.gn;
    }

    public final boolean ea() {
        return this.py;
    }

    public final boolean eb() {
        return isSet(2048);
    }

    @CheckResult
    @NonNull
    public f ec() {
        return c(n.mq, (T) Boolean.valueOf(false));
    }

    @CheckResult
    @NonNull
    public f ed() {
        return a(DownsampleStrategy.md, (i<Bitmap>) new j<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f ee() {
        return b(DownsampleStrategy.md, (i<Bitmap>) new j<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f ef() {
        return d(DownsampleStrategy.mc, new q());
    }

    @CheckResult
    @NonNull
    public f eg() {
        return c(DownsampleStrategy.mc, (i<Bitmap>) new q<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f eh() {
        return d(DownsampleStrategy.mg, new com.bumptech.glide.load.resource.bitmap.k());
    }

    @CheckResult
    @NonNull
    public f ei() {
        return c(DownsampleStrategy.mg, (i<Bitmap>) new com.bumptech.glide.load.resource.bitmap.k<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f ej() {
        return a(DownsampleStrategy.md, (i<Bitmap>) new l<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f ek() {
        return b(DownsampleStrategy.mg, (i<Bitmap>) new l<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f el() {
        if (this.pC) {
            return clone().el();
        }
        this.fV.clear();
        this.pq &= -2049;
        this.ga = false;
        this.pq &= -131073;
        this.py = false;
        this.pq |= 65536;
        this.gb = true;
        return ep();
    }

    @CheckResult
    @NonNull
    public f em() {
        return c(com.bumptech.glide.load.resource.gif.g.nK, (T) Boolean.valueOf(true));
    }

    @NonNull
    public f en() {
        this.isLocked = true;
        return this;
    }

    @NonNull
    public f eo() {
        if (!this.isLocked || this.pC) {
            this.pC = true;
            return en();
        }
        throw new IllegalStateException("You cannot auto lock an already locked options object, try clone() first");
    }

    /* access modifiers changed from: protected */
    public boolean eq() {
        return this.pC;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        if (Float.compare(fVar.pr, this.pr) == 0 && this.pt == fVar.pt && k.d(this.ps, fVar.ps) && this.pv == fVar.pv && k.d(this.pu, fVar.pu) && this.pA == fVar.pA && k.d(this.pz, fVar.pz) && this.fE == fVar.fE && this.pw == fVar.pw && this.px == fVar.px && this.ga == fVar.ga && this.py == fVar.py && this.pD == fVar.pD && this.gn == fVar.gn && this.fZ.equals(fVar.fZ) && this.fY == fVar.fY && this.fR.equals(fVar.fR) && this.fV.equals(fVar.fV) && this.fT.equals(fVar.fT) && k.d(this.fP, fVar.fP) && k.d(this.pB, fVar.pB)) {
            z = true;
        }
        return z;
    }

    public final boolean er() {
        return isSet(4);
    }

    public final boolean es() {
        return isSet(256);
    }

    @NonNull
    public final Map<Class<?>, i<?>> et() {
        return this.fV;
    }

    public final boolean eu() {
        return this.ga;
    }

    @Nullable
    public final Drawable ev() {
        return this.ps;
    }

    public final int ew() {
        return this.pt;
    }

    public final int ex() {
        return this.pv;
    }

    @Nullable
    public final Drawable ey() {
        return this.pu;
    }

    public final int ez() {
        return this.pA;
    }

    @CheckResult
    @NonNull
    public f g(@NonNull f fVar) {
        if (this.pC) {
            return clone().g(fVar);
        }
        if (o(fVar.pq, 2)) {
            this.pr = fVar.pr;
        }
        if (o(fVar.pq, 262144)) {
            this.pD = fVar.pD;
        }
        if (o(fVar.pq, 1048576)) {
            this.hA = fVar.hA;
        }
        if (o(fVar.pq, 4)) {
            this.fZ = fVar.fZ;
        }
        if (o(fVar.pq, 8)) {
            this.fY = fVar.fY;
        }
        if (o(fVar.pq, 16)) {
            this.ps = fVar.ps;
        }
        if (o(fVar.pq, 32)) {
            this.pt = fVar.pt;
        }
        if (o(fVar.pq, 64)) {
            this.pu = fVar.pu;
        }
        if (o(fVar.pq, 128)) {
            this.pv = fVar.pv;
        }
        if (o(fVar.pq, 256)) {
            this.fE = fVar.fE;
        }
        if (o(fVar.pq, 512)) {
            this.px = fVar.px;
            this.pw = fVar.pw;
        }
        if (o(fVar.pq, 1024)) {
            this.fP = fVar.fP;
        }
        if (o(fVar.pq, 4096)) {
            this.fT = fVar.fT;
        }
        if (o(fVar.pq, 8192)) {
            this.pz = fVar.pz;
        }
        if (o(fVar.pq, 16384)) {
            this.pA = fVar.pA;
        }
        if (o(fVar.pq, 32768)) {
            this.pB = fVar.pB;
        }
        if (o(fVar.pq, 65536)) {
            this.py = fVar.py;
        }
        if (o(fVar.pq, 131072)) {
            this.ga = fVar.ga;
        }
        if (o(fVar.pq, 2048)) {
            this.fV.putAll(fVar.fV);
            this.gb = fVar.gb;
        }
        if (o(fVar.pq, 524288)) {
            this.gn = fVar.gn;
        }
        if (!this.py) {
            this.fV.clear();
            this.pq &= -2049;
            this.ga = false;
            this.pq &= -131073;
            this.gb = true;
        }
        this.pq |= fVar.pq;
        this.fR.a(fVar.fR);
        return ep();
    }

    @Nullable
    public final Theme getTheme() {
        return this.pB;
    }

    @CheckResult
    @NonNull
    public f h(@FloatRange(from = 0.0d, to = 1.0d) float f) {
        if (this.pC) {
            return clone().h(f);
        }
        if (f < 0.0f || f > 1.0f) {
            throw new IllegalArgumentException("sizeMultiplier must be between 0 and 1");
        }
        this.pr = f;
        this.pq |= 2;
        return ep();
    }

    public int hashCode() {
        return k.a((Object) this.pB, k.a((Object) this.fP, k.a((Object) this.fT, k.a((Object) this.fV, k.a((Object) this.fR, k.a((Object) this.fY, k.a((Object) this.fZ, k.c(this.gn, k.c(this.pD, k.c(this.py, k.c(this.ga, k.u(this.px, k.u(this.pw, k.c(this.fE, k.a((Object) this.pz, k.u(this.pA, k.a((Object) this.pu, k.u(this.pv, k.a((Object) this.ps, k.u(this.pt, k.hashCode(this.pr)))))))))))))))))))));
    }

    @CheckResult
    @NonNull
    public f i(@Nullable Drawable drawable) {
        if (this.pC) {
            return clone().i(drawable);
        }
        this.pu = drawable;
        this.pq |= 64;
        return ep();
    }

    public final boolean isLocked() {
        return this.isLocked;
    }

    @CheckResult
    @NonNull
    public f j(@Nullable Drawable drawable) {
        if (this.pC) {
            return clone().j(drawable);
        }
        this.pz = drawable;
        this.pq |= 8192;
        return ep();
    }

    @CheckResult
    @NonNull
    public f j(boolean z) {
        if (this.pC) {
            return clone().j(z);
        }
        this.pD = z;
        this.pq |= 262144;
        return ep();
    }

    @CheckResult
    @NonNull
    public f k(@Nullable Drawable drawable) {
        if (this.pC) {
            return clone().k(drawable);
        }
        this.ps = drawable;
        this.pq |= 16;
        return ep();
    }

    @CheckResult
    @NonNull
    public f k(@NonNull c cVar) {
        if (this.pC) {
            return clone().k(cVar);
        }
        this.fP = (c) com.bumptech.glide.util.i.checkNotNull(cVar);
        this.pq |= 1024;
        return ep();
    }

    @CheckResult
    @NonNull
    public f k(boolean z) {
        if (this.pC) {
            return clone().k(z);
        }
        this.hA = z;
        this.pq |= 1048576;
        return ep();
    }

    @CheckResult
    @NonNull
    public f l(boolean z) {
        if (this.pC) {
            return clone().l(z);
        }
        this.gn = z;
        this.pq |= 524288;
        return ep();
    }

    @CheckResult
    @NonNull
    public f m(boolean z) {
        if (this.pC) {
            return clone().m(true);
        }
        this.fE = !z;
        this.pq |= 256;
        return ep();
    }

    @CheckResult
    @NonNull
    public f p(int i, int i2) {
        if (this.pC) {
            return clone().p(i, i2);
        }
        this.px = i;
        this.pw = i2;
        this.pq |= 512;
        return ep();
    }

    @CheckResult
    @NonNull
    public f q(@NonNull Class<?> cls) {
        if (this.pC) {
            return clone().q(cls);
        }
        this.fT = (Class) com.bumptech.glide.util.i.checkNotNull(cls);
        this.pq |= 4096;
        return ep();
    }
}
