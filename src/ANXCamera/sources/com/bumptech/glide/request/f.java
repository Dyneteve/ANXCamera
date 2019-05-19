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
    private static final int nN = 2;
    private static final int nO = 4;
    private static final int nP = 16;
    private static final int nQ = 32;
    private static final int nR = 64;
    private static final int nS = 128;
    private static final int nT = 256;
    private static final int nU = 512;
    private static final int nV = 1024;
    private static final int nW = 2048;
    private static final int nX = 4096;
    private static final int nY = 8192;
    private static final int nZ = 16384;
    private static final int oa = 32768;
    private static final int ob = 65536;
    private static final int oc = 131072;
    private static final int od = 262144;
    private static final int oe = 524288;
    private static final int of = 1048576;
    @Nullable
    private static f og;
    @Nullable
    private static f oh;
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
    private boolean eC = true;
    @NonNull
    private c eN = b.eH();
    @NonNull
    private com.bumptech.glide.load.f eP = new com.bumptech.glide.load.f();
    @NonNull
    private Class<?> eR = Object.class;
    @NonNull
    private Map<Class<?>, i<?>> eT = new CachedHashCodeArrayMap();
    @NonNull
    private Priority eW = Priority.NORMAL;
    @NonNull
    private g eX = g.fW;
    private boolean eY;
    private boolean eZ = true;
    private boolean fl;
    private boolean gy;
    private boolean isLocked;
    @Nullable
    private Theme oA;
    private boolean oB;
    private boolean oC;
    private int oo;
    private float oq = 1.0f;
    @Nullable
    private Drawable or;
    private int os;
    @Nullable
    private Drawable ot;
    private int ou;
    private int ov = -1;
    private int ow = -1;
    private boolean ox = true;
    @Nullable
    private Drawable oy;
    private int oz;

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
        if (this.oB) {
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
        b.eZ = true;
        return b;
    }

    @NonNull
    private <T> f a(@NonNull Class<T> cls, @NonNull i<T> iVar, boolean z) {
        if (this.oB) {
            return clone().a(cls, iVar, z);
        }
        com.bumptech.glide.util.i.checkNotNull(cls);
        com.bumptech.glide.util.i.checkNotNull(iVar);
        this.eT.put(cls, iVar);
        this.oo |= 2048;
        this.ox = true;
        this.oo |= 65536;
        this.eZ = false;
        if (z) {
            this.oo |= 131072;
            this.eY = true;
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
        if (oi == null) {
            oi = new f().dE().dM();
        }
        return oi;
    }

    @CheckResult
    @NonNull
    public static f ds() {
        if (oj == null) {
            oj = new f().dG().dM();
        }
        return oj;
    }

    @CheckResult
    @NonNull
    public static f dt() {
        if (ok == null) {
            ok = new f().dC().dM();
        }
        return ok;
    }

    @CheckResult
    @NonNull
    public static f du() {
        if (ol == null) {
            ol = new f().dI().dM();
        }
        return ol;
    }

    @CheckResult
    @NonNull
    public static f dv() {
        if (om == null) {
            om = new f().dJ().dM();
        }
        return om;
    }

    @CheckResult
    @NonNull
    public static f dw() {
        if (on == null) {
            on = new f().dK().dM();
        }
        return on;
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
            if (og == null) {
                og = new f().m(true).dM();
            }
            return og;
        }
        if (oh == null) {
            oh = new f().m(false).dM();
        }
        return oh;
    }

    private boolean isSet(int i) {
        return n(this.oo, i);
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
        if (this.oB) {
            return clone().N(i);
        }
        this.ou = i;
        this.oo |= 128;
        return dN();
    }

    @CheckResult
    @NonNull
    public f O(@DrawableRes int i) {
        if (this.oB) {
            return clone().O(i);
        }
        this.oz = i;
        this.oo |= 16384;
        return dN();
    }

    @CheckResult
    @NonNull
    public f P(@DrawableRes int i) {
        if (this.oB) {
            return clone().P(i);
        }
        this.os = i;
        this.oo |= 32;
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
        return c(com.bumptech.glide.load.resource.bitmap.e.kB, (T) Integer.valueOf(i));
    }

    @CheckResult
    @NonNull
    public f S(@IntRange(from = 0) int i) {
        return c(com.bumptech.glide.load.model.a.b.kw, (T) Integer.valueOf(i));
    }

    @CheckResult
    @NonNull
    public f a(@Nullable Theme theme) {
        if (this.oB) {
            return clone().a(theme);
        }
        this.oA = theme;
        this.oo |= 32768;
        return dN();
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public final f a(@NonNull DownsampleStrategy downsampleStrategy, @NonNull i<Bitmap> iVar) {
        if (this.oB) {
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
        return this.eN;
    }

    /* access modifiers changed from: 0000 */
    public boolean aE() {
        return this.eZ;
    }

    @NonNull
    public final g ax() {
        return this.eX;
    }

    @NonNull
    public final Priority ay() {
        return this.eW;
    }

    @NonNull
    public final com.bumptech.glide.load.f az() {
        return this.eP;
    }

    @CheckResult
    @NonNull
    public f b(@NonNull CompressFormat compressFormat) {
        return c(com.bumptech.glide.load.resource.bitmap.e.kC, (T) com.bumptech.glide.util.i.checkNotNull(compressFormat));
    }

    @CheckResult
    @NonNull
    public f b(@NonNull DecodeFormat decodeFormat) {
        com.bumptech.glide.util.i.checkNotNull(decodeFormat);
        return c(n.lm, (T) decodeFormat).c(com.bumptech.glide.load.resource.gif.g.lm, (T) decodeFormat);
    }

    @CheckResult
    @NonNull
    public f b(@NonNull g gVar) {
        if (this.oB) {
            return clone().b(gVar);
        }
        this.eX = (g) com.bumptech.glide.util.i.checkNotNull(gVar);
        this.oo |= 4;
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
        return c(DownsampleStrategy.li, (T) com.bumptech.glide.util.i.checkNotNull(downsampleStrategy));
    }

    /* access modifiers changed from: 0000 */
    @CheckResult
    @NonNull
    public final f b(@NonNull DownsampleStrategy downsampleStrategy, @NonNull i<Bitmap> iVar) {
        if (this.oB) {
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
        return this.eR;
    }

    @CheckResult
    @NonNull
    public f c(@NonNull Priority priority) {
        if (this.oB) {
            return clone().c(priority);
        }
        this.eW = (Priority) com.bumptech.glide.util.i.checkNotNull(priority);
        this.oo |= 8;
        return dN();
    }

    @CheckResult
    @NonNull
    public <T> f c(@NonNull com.bumptech.glide.load.e<T> eVar, @NonNull T t) {
        if (this.oB) {
            return clone().c(eVar, t);
        }
        com.bumptech.glide.util.i.checkNotNull(eVar);
        com.bumptech.glide.util.i.checkNotNull(t);
        this.eP.a(eVar, t);
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
        return c(n.lp, (T) Boolean.valueOf(false));
    }

    @CheckResult
    @NonNull
    public f dB() {
        return a(DownsampleStrategy.lc, (i<Bitmap>) new j<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f dC() {
        return b(DownsampleStrategy.lc, (i<Bitmap>) new j<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f dD() {
        return d(DownsampleStrategy.lb, new q());
    }

    @CheckResult
    @NonNull
    public f dE() {
        return c(DownsampleStrategy.lb, (i<Bitmap>) new q<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f dF() {
        return d(DownsampleStrategy.lf, new k());
    }

    @CheckResult
    @NonNull
    public f dG() {
        return c(DownsampleStrategy.lf, (i<Bitmap>) new k<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f dH() {
        return a(DownsampleStrategy.lc, (i<Bitmap>) new l<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f dI() {
        return b(DownsampleStrategy.lf, (i<Bitmap>) new l<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f dJ() {
        if (this.oB) {
            return clone().dJ();
        }
        this.eT.clear();
        this.oo &= -2049;
        this.eY = false;
        this.oo &= -131073;
        this.ox = false;
        this.oo |= 65536;
        this.eZ = true;
        return dN();
    }

    @CheckResult
    @NonNull
    public f dK() {
        return c(com.bumptech.glide.load.resource.gif.g.mF, (T) Boolean.valueOf(true));
    }

    @NonNull
    public f dL() {
        this.isLocked = true;
        return this;
    }

    @NonNull
    public f dM() {
        if (!this.isLocked || this.oB) {
            this.oB = true;
            return dL();
        }
        throw new IllegalStateException("You cannot auto lock an already locked options object, try clone() first");
    }

    /* access modifiers changed from: protected */
    public boolean dO() {
        return this.oB;
    }

    public final boolean dP() {
        return isSet(4);
    }

    public final boolean dQ() {
        return isSet(256);
    }

    @NonNull
    public final Map<Class<?>, i<?>> dR() {
        return this.eT;
    }

    public final boolean dS() {
        return this.eY;
    }

    @Nullable
    public final Drawable dT() {
        return this.or;
    }

    public final int dU() {
        return this.os;
    }

    public final int dV() {
        return this.ou;
    }

    @Nullable
    public final Drawable dW() {
        return this.ot;
    }

    public final int dX() {
        return this.oz;
    }

    @Nullable
    public final Drawable dY() {
        return this.oy;
    }

    public final boolean dZ() {
        return this.eC;
    }

    @CheckResult
    /* renamed from: dx */
    public f clone() {
        try {
            f fVar = (f) super.clone();
            fVar.eP = new com.bumptech.glide.load.f();
            fVar.eP.a(this.eP);
            fVar.eT = new CachedHashCodeArrayMap();
            fVar.eT.putAll(this.eT);
            fVar.isLocked = false;
            fVar.oB = false;
            return fVar;
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(e);
        }
    }

    public final boolean dy() {
        return this.ox;
    }

    public final boolean dz() {
        return isSet(2048);
    }

    @CheckResult
    @NonNull
    public f e(@IntRange(from = 0) long j) {
        return c(VideoDecoder.lS, (T) Long.valueOf(j));
    }

    public final boolean ea() {
        return isSet(8);
    }

    public final int eb() {
        return this.ow;
    }

    public final boolean ec() {
        return com.bumptech.glide.util.k.s(this.ow, this.ov);
    }

    public final int ed() {
        return this.ov;
    }

    public final float ee() {
        return this.oq;
    }

    public final boolean ef() {
        return this.oC;
    }

    public final boolean eg() {
        return this.gy;
    }

    public final boolean eh() {
        return this.fl;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        if (Float.compare(fVar.oq, this.oq) == 0 && this.os == fVar.os && com.bumptech.glide.util.k.c(this.or, fVar.or) && this.ou == fVar.ou && com.bumptech.glide.util.k.c(this.ot, fVar.ot) && this.oz == fVar.oz && com.bumptech.glide.util.k.c(this.oy, fVar.oy) && this.eC == fVar.eC && this.ov == fVar.ov && this.ow == fVar.ow && this.eY == fVar.eY && this.ox == fVar.ox && this.oC == fVar.oC && this.fl == fVar.fl && this.eX.equals(fVar.eX) && this.eW == fVar.eW && this.eP.equals(fVar.eP) && this.eT.equals(fVar.eT) && this.eR.equals(fVar.eR) && com.bumptech.glide.util.k.c(this.eN, fVar.eN) && com.bumptech.glide.util.k.c(this.oA, fVar.oA)) {
            z = true;
        }
        return z;
    }

    @CheckResult
    @NonNull
    public f g(@NonNull f fVar) {
        if (this.oB) {
            return clone().g(fVar);
        }
        if (n(fVar.oo, 2)) {
            this.oq = fVar.oq;
        }
        if (n(fVar.oo, 262144)) {
            this.oC = fVar.oC;
        }
        if (n(fVar.oo, 1048576)) {
            this.gy = fVar.gy;
        }
        if (n(fVar.oo, 4)) {
            this.eX = fVar.eX;
        }
        if (n(fVar.oo, 8)) {
            this.eW = fVar.eW;
        }
        if (n(fVar.oo, 16)) {
            this.or = fVar.or;
        }
        if (n(fVar.oo, 32)) {
            this.os = fVar.os;
        }
        if (n(fVar.oo, 64)) {
            this.ot = fVar.ot;
        }
        if (n(fVar.oo, 128)) {
            this.ou = fVar.ou;
        }
        if (n(fVar.oo, 256)) {
            this.eC = fVar.eC;
        }
        if (n(fVar.oo, 512)) {
            this.ow = fVar.ow;
            this.ov = fVar.ov;
        }
        if (n(fVar.oo, 1024)) {
            this.eN = fVar.eN;
        }
        if (n(fVar.oo, 4096)) {
            this.eR = fVar.eR;
        }
        if (n(fVar.oo, 8192)) {
            this.oy = fVar.oy;
        }
        if (n(fVar.oo, 16384)) {
            this.oz = fVar.oz;
        }
        if (n(fVar.oo, 32768)) {
            this.oA = fVar.oA;
        }
        if (n(fVar.oo, 65536)) {
            this.ox = fVar.ox;
        }
        if (n(fVar.oo, 131072)) {
            this.eY = fVar.eY;
        }
        if (n(fVar.oo, 2048)) {
            this.eT.putAll(fVar.eT);
            this.eZ = fVar.eZ;
        }
        if (n(fVar.oo, 524288)) {
            this.fl = fVar.fl;
        }
        if (!this.ox) {
            this.eT.clear();
            this.oo &= -2049;
            this.eY = false;
            this.oo &= -131073;
            this.eZ = true;
        }
        this.oo |= fVar.oo;
        this.eP.a(fVar.eP);
        return dN();
    }

    @Nullable
    public final Theme getTheme() {
        return this.oA;
    }

    @CheckResult
    @NonNull
    public f h(@FloatRange(from = 0.0d, to = 1.0d) float f) {
        if (this.oB) {
            return clone().h(f);
        }
        if (f < 0.0f || f > 1.0f) {
            throw new IllegalArgumentException("sizeMultiplier must be between 0 and 1");
        }
        this.oq = f;
        this.oo |= 2;
        return dN();
    }

    public int hashCode() {
        return com.bumptech.glide.util.k.a((Object) this.oA, com.bumptech.glide.util.k.a((Object) this.eN, com.bumptech.glide.util.k.a((Object) this.eR, com.bumptech.glide.util.k.a((Object) this.eT, com.bumptech.glide.util.k.a((Object) this.eP, com.bumptech.glide.util.k.a((Object) this.eW, com.bumptech.glide.util.k.a((Object) this.eX, com.bumptech.glide.util.k.a(this.fl, com.bumptech.glide.util.k.a(this.oC, com.bumptech.glide.util.k.a(this.ox, com.bumptech.glide.util.k.a(this.eY, com.bumptech.glide.util.k.t(this.ow, com.bumptech.glide.util.k.t(this.ov, com.bumptech.glide.util.k.a(this.eC, com.bumptech.glide.util.k.a((Object) this.oy, com.bumptech.glide.util.k.t(this.oz, com.bumptech.glide.util.k.a((Object) this.ot, com.bumptech.glide.util.k.t(this.ou, com.bumptech.glide.util.k.a((Object) this.or, com.bumptech.glide.util.k.t(this.os, com.bumptech.glide.util.k.hashCode(this.oq)))))))))))))))))))));
    }

    @CheckResult
    @NonNull
    public f i(@Nullable Drawable drawable) {
        if (this.oB) {
            return clone().i(drawable);
        }
        this.ot = drawable;
        this.oo |= 64;
        return dN();
    }

    public final boolean isLocked() {
        return this.isLocked;
    }

    @CheckResult
    @NonNull
    public f j(@Nullable Drawable drawable) {
        if (this.oB) {
            return clone().j(drawable);
        }
        this.oy = drawable;
        this.oo |= 8192;
        return dN();
    }

    @CheckResult
    @NonNull
    public f j(boolean z) {
        if (this.oB) {
            return clone().j(z);
        }
        this.oC = z;
        this.oo |= 262144;
        return dN();
    }

    @CheckResult
    @NonNull
    public f k(@Nullable Drawable drawable) {
        if (this.oB) {
            return clone().k(drawable);
        }
        this.or = drawable;
        this.oo |= 16;
        return dN();
    }

    @CheckResult
    @NonNull
    public f k(@NonNull c cVar) {
        if (this.oB) {
            return clone().k(cVar);
        }
        this.eN = (c) com.bumptech.glide.util.i.checkNotNull(cVar);
        this.oo |= 1024;
        return dN();
    }

    @CheckResult
    @NonNull
    public f k(boolean z) {
        if (this.oB) {
            return clone().k(z);
        }
        this.gy = z;
        this.oo |= 1048576;
        return dN();
    }

    @CheckResult
    @NonNull
    public f l(boolean z) {
        if (this.oB) {
            return clone().l(z);
        }
        this.fl = z;
        this.oo |= 524288;
        return dN();
    }

    @CheckResult
    @NonNull
    public f m(boolean z) {
        if (this.oB) {
            return clone().m(true);
        }
        this.eC = !z;
        this.oo |= 256;
        return dN();
    }

    @CheckResult
    @NonNull
    public f o(int i, int i2) {
        if (this.oB) {
            return clone().o(i, i2);
        }
        this.ow = i;
        this.ov = i2;
        this.oo |= 512;
        return dN();
    }

    @CheckResult
    @NonNull
    public f p(@NonNull Class<?> cls) {
        if (this.oB) {
            return clone().p(cls);
        }
        this.eR = (Class) com.bumptech.glide.util.i.checkNotNull(cls);
        this.oo |= 4096;
        return dN();
    }
}
