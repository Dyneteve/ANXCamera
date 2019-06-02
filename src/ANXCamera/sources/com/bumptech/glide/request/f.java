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
import com.bumptech.glide.load.resource.bitmap.k;
import com.bumptech.glide.load.resource.bitmap.l;
import com.bumptech.glide.load.resource.bitmap.n;
import com.bumptech.glide.load.resource.bitmap.p;
import com.bumptech.glide.load.resource.bitmap.q;
import com.bumptech.glide.load.resource.gif.e;
import com.bumptech.glide.util.CachedHashCodeArrayMap;
import java.util.Map;

/* compiled from: RequestOptions */
public class f implements Cloneable {
    private static final int PRIORITY = 8;
    private static final int UNSET = -1;
    private static final int nP = 2;
    private static final int nQ = 4;
    private static final int nR = 16;
    private static final int nS = 32;
    private static final int nT = 64;
    private static final int nU = 128;
    private static final int nV = 256;
    private static final int nW = 512;
    private static final int nX = 1024;
    private static final int nY = 2048;
    private static final int nZ = 4096;
    private static final int oa = 8192;
    private static final int ob = 16384;
    private static final int oc = 32768;
    private static final int od = 65536;
    private static final int oe = 131072;
    private static final int of = 262144;
    private static final int og = 524288;
    private static final int oh = 1048576;
    @Nullable
    private static f oi;
    @Nullable
    private static f oj;
    @Nullable
    private static f ok;
    @Nullable
    private static f ol;
    @Nullable
    private static f om;
    @Nullable
    private static f on;
    @Nullable
    private static f oo;
    @Nullable
    private static f oq;
    private boolean eE = true;
    @NonNull
    private c eP = b.eH();
    @NonNull
    private com.bumptech.glide.load.f eR = new com.bumptech.glide.load.f();
    @NonNull
    private Class<?> eT = Object.class;
    @NonNull
    private Map<Class<?>, i<?>> eV = new CachedHashCodeArrayMap();
    @NonNull
    private Priority eY = Priority.NORMAL;
    @NonNull
    private g eZ = g.fY;
    private boolean fa;
    private boolean fb = true;
    private boolean fn;
    private boolean gA;
    private boolean isLocked;
    @Nullable
    private Drawable oA;
    private int oB;
    @Nullable
    private Theme oC;
    private boolean oD;
    private boolean oE;
    private int or;
    private float os = 1.0f;
    @Nullable
    private Drawable ot;
    private int ou;
    @Nullable
    private Drawable ov;
    private int ow;
    private int ox = -1;
    private int oy = -1;
    private boolean oz = true;

    @CheckResult
    @NonNull
    public static f I(@DrawableRes int i) {
        return new f().N(i);
    }

    @CheckResult
    @NonNull
    public static f J(@DrawableRes int i) {
        return new f().P(i);
    }

    @CheckResult
    @NonNull
    public static f K(@IntRange(from = 0) int i) {
        return m(i, i);
    }

    @CheckResult
    @NonNull
    public static f L(@IntRange(from = 0) int i) {
        return new f().S(i);
    }

    @CheckResult
    @NonNull
    public static f M(@IntRange(from = 0, to = 100) int i) {
        return new f().R(i);
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
        if (this.oD) {
            return clone().a(iVar, z);
        }
        p pVar = new p(iVar, z);
        a(Bitmap.class, iVar, z);
        a(Drawable.class, (i<T>) pVar, z);
        a(BitmapDrawable.class, pVar.cu(), z);
        a(com.bumptech.glide.load.resource.gif.b.class, (i<T>) new e<T>(iVar), z);
        return dN();
    }

    @CheckResult
    @NonNull
    public static f a(@NonNull DownsampleStrategy downsampleStrategy) {
        return new f().b(downsampleStrategy);
    }

    @NonNull
    private f a(@NonNull DownsampleStrategy downsampleStrategy, @NonNull i<Bitmap> iVar, boolean z) {
        f b = z ? b(downsampleStrategy, iVar) : a(downsampleStrategy, iVar);
        b.fb = true;
        return b;
    }

    @NonNull
    private <T> f a(@NonNull Class<T> cls, @NonNull i<T> iVar, boolean z) {
        if (this.oD) {
            return clone().a(cls, iVar, z);
        }
        com.bumptech.glide.util.i.checkNotNull(cls);
        com.bumptech.glide.util.i.checkNotNull(iVar);
        this.eV.put(cls, iVar);
        this.or |= 2048;
        this.oz = true;
        this.or |= 65536;
        this.fb = false;
        if (z) {
            this.or |= 131072;
            this.fa = true;
        }
        return dN();
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

    @NonNull
    private f dN() {
        if (!this.isLocked) {
            return this;
        }
        throw new IllegalStateException("You cannot modify locked RequestOptions, consider clone()");
    }

    @CheckResult
    @NonNull
    public static f dr() {
        if (ok == null) {
            ok = new f().dE().dM();
        }
        return ok;
    }

    @CheckResult
    @NonNull
    public static f ds() {
        if (ol == null) {
            ol = new f().dG().dM();
        }
        return ol;
    }

    @CheckResult
    @NonNull
    public static f dt() {
        if (om == null) {
            om = new f().dC().dM();
        }
        return om;
    }

    @CheckResult
    @NonNull
    public static f du() {
        if (on == null) {
            on = new f().dI().dM();
        }
        return on;
    }

    @CheckResult
    @NonNull
    public static f dv() {
        if (oo == null) {
            oo = new f().dJ().dM();
        }
        return oo;
    }

    @CheckResult
    @NonNull
    public static f dw() {
        if (oq == null) {
            oq = new f().dK().dM();
        }
        return oq;
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
            if (oi == null) {
                oi = new f().m(true).dM();
            }
            return oi;
        }
        if (oj == null) {
            oj = new f().m(false).dM();
        }
        return oj;
    }

    private boolean isSet(int i) {
        return n(this.or, i);
    }

    @CheckResult
    @NonNull
    public static f j(@NonNull c cVar) {
        return new f().k(cVar);
    }

    @CheckResult
    @NonNull
    public static f m(@IntRange(from = 0) int i, @IntRange(from = 0) int i2) {
        return new f().o(i, i2);
    }

    private static boolean n(int i, int i2) {
        return (i & i2) != 0;
    }

    @CheckResult
    @NonNull
    public static f o(@NonNull Class<?> cls) {
        return new f().p(cls);
    }

    @CheckResult
    @NonNull
    public f N(@DrawableRes int i) {
        if (this.oD) {
            return clone().N(i);
        }
        this.ow = i;
        this.or |= 128;
        return dN();
    }

    @CheckResult
    @NonNull
    public f O(@DrawableRes int i) {
        if (this.oD) {
            return clone().O(i);
        }
        this.oB = i;
        this.or |= 16384;
        return dN();
    }

    @CheckResult
    @NonNull
    public f P(@DrawableRes int i) {
        if (this.oD) {
            return clone().P(i);
        }
        this.ou = i;
        this.or |= 32;
        return dN();
    }

    @CheckResult
    @NonNull
    public f Q(int i) {
        return o(i, i);
    }

    @CheckResult
    @NonNull
    public f R(@IntRange(from = 0, to = 100) int i) {
        return c(com.bumptech.glide.load.resource.bitmap.e.kD, (T) Integer.valueOf(i));
    }

    @CheckResult
    @NonNull
    public f S(@IntRange(from = 0) int i) {
        return c(com.bumptech.glide.load.model.a.b.ky, (T) Integer.valueOf(i));
    }

    @CheckResult
    @NonNull
    public f a(@Nullable Theme theme) {
        if (this.oD) {
            return clone().a(theme);
        }
        this.oC = theme;
        this.or |= 32768;
        return dN();
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public final f a(@NonNull DownsampleStrategy downsampleStrategy, @NonNull i<Bitmap> iVar) {
        if (this.oD) {
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
    public final c aA() {
        return this.eP;
    }

    /* access modifiers changed from: 0000 */
    public boolean aE() {
        return this.fb;
    }

    @NonNull
    public final g ax() {
        return this.eZ;
    }

    @NonNull
    public final Priority ay() {
        return this.eY;
    }

    @NonNull
    public final com.bumptech.glide.load.f az() {
        return this.eR;
    }

    @CheckResult
    @NonNull
    public f b(@NonNull CompressFormat compressFormat) {
        return c(com.bumptech.glide.load.resource.bitmap.e.kE, (T) com.bumptech.glide.util.i.checkNotNull(compressFormat));
    }

    @CheckResult
    @NonNull
    public f b(@NonNull DecodeFormat decodeFormat) {
        com.bumptech.glide.util.i.checkNotNull(decodeFormat);
        return c(n.lo, (T) decodeFormat).c(com.bumptech.glide.load.resource.gif.g.lo, (T) decodeFormat);
    }

    @CheckResult
    @NonNull
    public f b(@NonNull g gVar) {
        if (this.oD) {
            return clone().b(gVar);
        }
        this.eZ = (g) com.bumptech.glide.util.i.checkNotNull(gVar);
        this.or |= 4;
        return dN();
    }

    @CheckResult
    @NonNull
    public f b(@NonNull i<Bitmap> iVar) {
        return a(iVar, true);
    }

    @CheckResult
    @NonNull
    public f b(@NonNull DownsampleStrategy downsampleStrategy) {
        return c(DownsampleStrategy.lk, (T) com.bumptech.glide.util.i.checkNotNull(downsampleStrategy));
    }

    /* access modifiers changed from: 0000 */
    @CheckResult
    @NonNull
    public final f b(@NonNull DownsampleStrategy downsampleStrategy, @NonNull i<Bitmap> iVar) {
        if (this.oD) {
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
    public final Class<?> bf() {
        return this.eT;
    }

    @CheckResult
    @NonNull
    public f c(@NonNull Priority priority) {
        if (this.oD) {
            return clone().c(priority);
        }
        this.eY = (Priority) com.bumptech.glide.util.i.checkNotNull(priority);
        this.or |= 8;
        return dN();
    }

    @CheckResult
    @NonNull
    public <T> f c(@NonNull com.bumptech.glide.load.e<T> eVar, @NonNull T t) {
        if (this.oD) {
            return clone().c(eVar, t);
        }
        com.bumptech.glide.util.i.checkNotNull(eVar);
        com.bumptech.glide.util.i.checkNotNull(t);
        this.eR.a(eVar, t);
        return dN();
    }

    @CheckResult
    @NonNull
    public f c(@NonNull i<Bitmap> iVar) {
        return a(iVar, false);
    }

    @CheckResult
    @NonNull
    public f dA() {
        return c(n.lr, (T) Boolean.valueOf(false));
    }

    @CheckResult
    @NonNull
    public f dB() {
        return a(DownsampleStrategy.le, (i<Bitmap>) new j<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f dC() {
        return b(DownsampleStrategy.le, (i<Bitmap>) new j<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f dD() {
        return d(DownsampleStrategy.ld, new q());
    }

    @CheckResult
    @NonNull
    public f dE() {
        return c(DownsampleStrategy.ld, (i<Bitmap>) new q<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f dF() {
        return d(DownsampleStrategy.lh, new k());
    }

    @CheckResult
    @NonNull
    public f dG() {
        return c(DownsampleStrategy.lh, (i<Bitmap>) new k<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f dH() {
        return a(DownsampleStrategy.le, (i<Bitmap>) new l<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f dI() {
        return b(DownsampleStrategy.lh, (i<Bitmap>) new l<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f dJ() {
        if (this.oD) {
            return clone().dJ();
        }
        this.eV.clear();
        this.or &= -2049;
        this.fa = false;
        this.or &= -131073;
        this.oz = false;
        this.or |= 65536;
        this.fb = true;
        return dN();
    }

    @CheckResult
    @NonNull
    public f dK() {
        return c(com.bumptech.glide.load.resource.gif.g.mH, (T) Boolean.valueOf(true));
    }

    @NonNull
    public f dL() {
        this.isLocked = true;
        return this;
    }

    @NonNull
    public f dM() {
        if (!this.isLocked || this.oD) {
            this.oD = true;
            return dL();
        }
        throw new IllegalStateException("You cannot auto lock an already locked options object, try clone() first");
    }

    /* access modifiers changed from: protected */
    public boolean dO() {
        return this.oD;
    }

    public final boolean dP() {
        return isSet(4);
    }

    public final boolean dQ() {
        return isSet(256);
    }

    @NonNull
    public final Map<Class<?>, i<?>> dR() {
        return this.eV;
    }

    public final boolean dS() {
        return this.fa;
    }

    @Nullable
    public final Drawable dT() {
        return this.ot;
    }

    public final int dU() {
        return this.ou;
    }

    public final int dV() {
        return this.ow;
    }

    @Nullable
    public final Drawable dW() {
        return this.ov;
    }

    public final int dX() {
        return this.oB;
    }

    @Nullable
    public final Drawable dY() {
        return this.oA;
    }

    public final boolean dZ() {
        return this.eE;
    }

    @CheckResult
    /* renamed from: dx */
    public f clone() {
        try {
            f fVar = (f) super.clone();
            fVar.eR = new com.bumptech.glide.load.f();
            fVar.eR.a(this.eR);
            fVar.eV = new CachedHashCodeArrayMap();
            fVar.eV.putAll(this.eV);
            fVar.isLocked = false;
            fVar.oD = false;
            return fVar;
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(e);
        }
    }

    public final boolean dy() {
        return this.oz;
    }

    public final boolean dz() {
        return isSet(2048);
    }

    @CheckResult
    @NonNull
    public f e(@IntRange(from = 0) long j) {
        return c(VideoDecoder.lU, (T) Long.valueOf(j));
    }

    public final boolean ea() {
        return isSet(8);
    }

    public final int eb() {
        return this.oy;
    }

    public final boolean ec() {
        return com.bumptech.glide.util.k.s(this.oy, this.ox);
    }

    public final int ed() {
        return this.ox;
    }

    public final float ee() {
        return this.os;
    }

    public final boolean ef() {
        return this.oE;
    }

    public final boolean eg() {
        return this.gA;
    }

    public final boolean eh() {
        return this.fn;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        if (Float.compare(fVar.os, this.os) == 0 && this.ou == fVar.ou && com.bumptech.glide.util.k.c(this.ot, fVar.ot) && this.ow == fVar.ow && com.bumptech.glide.util.k.c(this.ov, fVar.ov) && this.oB == fVar.oB && com.bumptech.glide.util.k.c(this.oA, fVar.oA) && this.eE == fVar.eE && this.ox == fVar.ox && this.oy == fVar.oy && this.fa == fVar.fa && this.oz == fVar.oz && this.oE == fVar.oE && this.fn == fVar.fn && this.eZ.equals(fVar.eZ) && this.eY == fVar.eY && this.eR.equals(fVar.eR) && this.eV.equals(fVar.eV) && this.eT.equals(fVar.eT) && com.bumptech.glide.util.k.c(this.eP, fVar.eP) && com.bumptech.glide.util.k.c(this.oC, fVar.oC)) {
            z = true;
        }
        return z;
    }

    @CheckResult
    @NonNull
    public f g(@NonNull f fVar) {
        if (this.oD) {
            return clone().g(fVar);
        }
        if (n(fVar.or, 2)) {
            this.os = fVar.os;
        }
        if (n(fVar.or, 262144)) {
            this.oE = fVar.oE;
        }
        if (n(fVar.or, 1048576)) {
            this.gA = fVar.gA;
        }
        if (n(fVar.or, 4)) {
            this.eZ = fVar.eZ;
        }
        if (n(fVar.or, 8)) {
            this.eY = fVar.eY;
        }
        if (n(fVar.or, 16)) {
            this.ot = fVar.ot;
        }
        if (n(fVar.or, 32)) {
            this.ou = fVar.ou;
        }
        if (n(fVar.or, 64)) {
            this.ov = fVar.ov;
        }
        if (n(fVar.or, 128)) {
            this.ow = fVar.ow;
        }
        if (n(fVar.or, 256)) {
            this.eE = fVar.eE;
        }
        if (n(fVar.or, 512)) {
            this.oy = fVar.oy;
            this.ox = fVar.ox;
        }
        if (n(fVar.or, 1024)) {
            this.eP = fVar.eP;
        }
        if (n(fVar.or, 4096)) {
            this.eT = fVar.eT;
        }
        if (n(fVar.or, 8192)) {
            this.oA = fVar.oA;
        }
        if (n(fVar.or, 16384)) {
            this.oB = fVar.oB;
        }
        if (n(fVar.or, 32768)) {
            this.oC = fVar.oC;
        }
        if (n(fVar.or, 65536)) {
            this.oz = fVar.oz;
        }
        if (n(fVar.or, 131072)) {
            this.fa = fVar.fa;
        }
        if (n(fVar.or, 2048)) {
            this.eV.putAll(fVar.eV);
            this.fb = fVar.fb;
        }
        if (n(fVar.or, 524288)) {
            this.fn = fVar.fn;
        }
        if (!this.oz) {
            this.eV.clear();
            this.or &= -2049;
            this.fa = false;
            this.or &= -131073;
            this.fb = true;
        }
        this.or |= fVar.or;
        this.eR.a(fVar.eR);
        return dN();
    }

    @Nullable
    public final Theme getTheme() {
        return this.oC;
    }

    @CheckResult
    @NonNull
    public f h(@FloatRange(from = 0.0d, to = 1.0d) float f) {
        if (this.oD) {
            return clone().h(f);
        }
        if (f < 0.0f || f > 1.0f) {
            throw new IllegalArgumentException("sizeMultiplier must be between 0 and 1");
        }
        this.os = f;
        this.or |= 2;
        return dN();
    }

    public int hashCode() {
        return com.bumptech.glide.util.k.a((Object) this.oC, com.bumptech.glide.util.k.a((Object) this.eP, com.bumptech.glide.util.k.a((Object) this.eT, com.bumptech.glide.util.k.a((Object) this.eV, com.bumptech.glide.util.k.a((Object) this.eR, com.bumptech.glide.util.k.a((Object) this.eY, com.bumptech.glide.util.k.a((Object) this.eZ, com.bumptech.glide.util.k.a(this.fn, com.bumptech.glide.util.k.a(this.oE, com.bumptech.glide.util.k.a(this.oz, com.bumptech.glide.util.k.a(this.fa, com.bumptech.glide.util.k.t(this.oy, com.bumptech.glide.util.k.t(this.ox, com.bumptech.glide.util.k.a(this.eE, com.bumptech.glide.util.k.a((Object) this.oA, com.bumptech.glide.util.k.t(this.oB, com.bumptech.glide.util.k.a((Object) this.ov, com.bumptech.glide.util.k.t(this.ow, com.bumptech.glide.util.k.a((Object) this.ot, com.bumptech.glide.util.k.t(this.ou, com.bumptech.glide.util.k.hashCode(this.os)))))))))))))))))))));
    }

    @CheckResult
    @NonNull
    public f i(@Nullable Drawable drawable) {
        if (this.oD) {
            return clone().i(drawable);
        }
        this.ov = drawable;
        this.or |= 64;
        return dN();
    }

    public final boolean isLocked() {
        return this.isLocked;
    }

    @CheckResult
    @NonNull
    public f j(@Nullable Drawable drawable) {
        if (this.oD) {
            return clone().j(drawable);
        }
        this.oA = drawable;
        this.or |= 8192;
        return dN();
    }

    @CheckResult
    @NonNull
    public f j(boolean z) {
        if (this.oD) {
            return clone().j(z);
        }
        this.oE = z;
        this.or |= 262144;
        return dN();
    }

    @CheckResult
    @NonNull
    public f k(@Nullable Drawable drawable) {
        if (this.oD) {
            return clone().k(drawable);
        }
        this.ot = drawable;
        this.or |= 16;
        return dN();
    }

    @CheckResult
    @NonNull
    public f k(@NonNull c cVar) {
        if (this.oD) {
            return clone().k(cVar);
        }
        this.eP = (c) com.bumptech.glide.util.i.checkNotNull(cVar);
        this.or |= 1024;
        return dN();
    }

    @CheckResult
    @NonNull
    public f k(boolean z) {
        if (this.oD) {
            return clone().k(z);
        }
        this.gA = z;
        this.or |= 1048576;
        return dN();
    }

    @CheckResult
    @NonNull
    public f l(boolean z) {
        if (this.oD) {
            return clone().l(z);
        }
        this.fn = z;
        this.or |= 524288;
        return dN();
    }

    @CheckResult
    @NonNull
    public f m(boolean z) {
        if (this.oD) {
            return clone().m(true);
        }
        this.eE = !z;
        this.or |= 256;
        return dN();
    }

    @CheckResult
    @NonNull
    public f o(int i, int i2) {
        if (this.oD) {
            return clone().o(i, i2);
        }
        this.oy = i;
        this.ox = i2;
        this.or |= 512;
        return dN();
    }

    @CheckResult
    @NonNull
    public f p(@NonNull Class<?> cls) {
        if (this.oD) {
            return clone().p(cls);
        }
        this.eT = (Class) com.bumptech.glide.util.i.checkNotNull(cls);
        this.or |= 4096;
        return dN();
    }
}
