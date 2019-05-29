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
    private static final int nO = 2;
    private static final int nP = 4;
    private static final int nQ = 16;
    private static final int nR = 32;
    private static final int nS = 64;
    private static final int nT = 128;
    private static final int nU = 256;
    private static final int nV = 512;
    private static final int nW = 1024;
    private static final int nX = 2048;
    private static final int nY = 4096;
    private static final int nZ = 8192;
    private static final int oa = 16384;
    private static final int ob = 32768;
    private static final int oc = 65536;
    private static final int od = 131072;
    private static final int oe = 262144;
    private static final int of = 524288;
    private static final int og = 1048576;
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
    @Nullable
    private static f oo;
    private boolean eD = true;
    @NonNull
    private c eO = b.eH();
    @NonNull
    private com.bumptech.glide.load.f eQ = new com.bumptech.glide.load.f();
    @NonNull
    private Class<?> eS = Object.class;
    @NonNull
    private Map<Class<?>, i<?>> eU = new CachedHashCodeArrayMap();
    @NonNull
    private Priority eX = Priority.NORMAL;
    @NonNull
    private g eY = g.fX;
    private boolean eZ;
    private boolean fa = true;
    private boolean fm;
    private boolean gz;
    private boolean isLocked;
    private int oA;
    @Nullable
    private Theme oB;
    private boolean oC;
    private boolean oD;
    private int oq;
    private float or = 1.0f;
    @Nullable
    private Drawable os;
    private int ot;
    @Nullable
    private Drawable ou;
    private int ov;
    private int ow = -1;
    private int ox = -1;
    private boolean oy = true;
    @Nullable
    private Drawable oz;

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
        if (this.oC) {
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
        b.fa = true;
        return b;
    }

    @NonNull
    private <T> f a(@NonNull Class<T> cls, @NonNull i<T> iVar, boolean z) {
        if (this.oC) {
            return clone().a(cls, iVar, z);
        }
        com.bumptech.glide.util.i.checkNotNull(cls);
        com.bumptech.glide.util.i.checkNotNull(iVar);
        this.eU.put(cls, iVar);
        this.oq |= 2048;
        this.oy = true;
        this.oq |= 65536;
        this.fa = false;
        if (z) {
            this.oq |= 131072;
            this.eZ = true;
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
        if (oj == null) {
            oj = new f().dE().dM();
        }
        return oj;
    }

    @CheckResult
    @NonNull
    public static f ds() {
        if (ok == null) {
            ok = new f().dG().dM();
        }
        return ok;
    }

    @CheckResult
    @NonNull
    public static f dt() {
        if (ol == null) {
            ol = new f().dC().dM();
        }
        return ol;
    }

    @CheckResult
    @NonNull
    public static f du() {
        if (om == null) {
            om = new f().dI().dM();
        }
        return om;
    }

    @CheckResult
    @NonNull
    public static f dv() {
        if (on == null) {
            on = new f().dJ().dM();
        }
        return on;
    }

    @CheckResult
    @NonNull
    public static f dw() {
        if (oo == null) {
            oo = new f().dK().dM();
        }
        return oo;
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
            if (oh == null) {
                oh = new f().m(true).dM();
            }
            return oh;
        }
        if (oi == null) {
            oi = new f().m(false).dM();
        }
        return oi;
    }

    private boolean isSet(int i) {
        return n(this.oq, i);
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
        if (this.oC) {
            return clone().N(i);
        }
        this.ov = i;
        this.oq |= 128;
        return dN();
    }

    @CheckResult
    @NonNull
    public f O(@DrawableRes int i) {
        if (this.oC) {
            return clone().O(i);
        }
        this.oA = i;
        this.oq |= 16384;
        return dN();
    }

    @CheckResult
    @NonNull
    public f P(@DrawableRes int i) {
        if (this.oC) {
            return clone().P(i);
        }
        this.ot = i;
        this.oq |= 32;
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
        return c(com.bumptech.glide.load.resource.bitmap.e.kC, (T) Integer.valueOf(i));
    }

    @CheckResult
    @NonNull
    public f S(@IntRange(from = 0) int i) {
        return c(com.bumptech.glide.load.model.a.b.kx, (T) Integer.valueOf(i));
    }

    @CheckResult
    @NonNull
    public f a(@Nullable Theme theme) {
        if (this.oC) {
            return clone().a(theme);
        }
        this.oB = theme;
        this.oq |= 32768;
        return dN();
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public final f a(@NonNull DownsampleStrategy downsampleStrategy, @NonNull i<Bitmap> iVar) {
        if (this.oC) {
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
        return this.eO;
    }

    /* access modifiers changed from: 0000 */
    public boolean aE() {
        return this.fa;
    }

    @NonNull
    public final g ax() {
        return this.eY;
    }

    @NonNull
    public final Priority ay() {
        return this.eX;
    }

    @NonNull
    public final com.bumptech.glide.load.f az() {
        return this.eQ;
    }

    @CheckResult
    @NonNull
    public f b(@NonNull CompressFormat compressFormat) {
        return c(com.bumptech.glide.load.resource.bitmap.e.kD, (T) com.bumptech.glide.util.i.checkNotNull(compressFormat));
    }

    @CheckResult
    @NonNull
    public f b(@NonNull DecodeFormat decodeFormat) {
        com.bumptech.glide.util.i.checkNotNull(decodeFormat);
        return c(n.ln, (T) decodeFormat).c(com.bumptech.glide.load.resource.gif.g.ln, (T) decodeFormat);
    }

    @CheckResult
    @NonNull
    public f b(@NonNull g gVar) {
        if (this.oC) {
            return clone().b(gVar);
        }
        this.eY = (g) com.bumptech.glide.util.i.checkNotNull(gVar);
        this.oq |= 4;
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
        return c(DownsampleStrategy.lj, (T) com.bumptech.glide.util.i.checkNotNull(downsampleStrategy));
    }

    /* access modifiers changed from: 0000 */
    @CheckResult
    @NonNull
    public final f b(@NonNull DownsampleStrategy downsampleStrategy, @NonNull i<Bitmap> iVar) {
        if (this.oC) {
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
        return this.eS;
    }

    @CheckResult
    @NonNull
    public f c(@NonNull Priority priority) {
        if (this.oC) {
            return clone().c(priority);
        }
        this.eX = (Priority) com.bumptech.glide.util.i.checkNotNull(priority);
        this.oq |= 8;
        return dN();
    }

    @CheckResult
    @NonNull
    public <T> f c(@NonNull com.bumptech.glide.load.e<T> eVar, @NonNull T t) {
        if (this.oC) {
            return clone().c(eVar, t);
        }
        com.bumptech.glide.util.i.checkNotNull(eVar);
        com.bumptech.glide.util.i.checkNotNull(t);
        this.eQ.a(eVar, t);
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
        return c(n.lq, (T) Boolean.valueOf(false));
    }

    @CheckResult
    @NonNull
    public f dB() {
        return a(DownsampleStrategy.ld, (i<Bitmap>) new j<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f dC() {
        return b(DownsampleStrategy.ld, (i<Bitmap>) new j<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f dD() {
        return d(DownsampleStrategy.lc, new q());
    }

    @CheckResult
    @NonNull
    public f dE() {
        return c(DownsampleStrategy.lc, (i<Bitmap>) new q<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f dF() {
        return d(DownsampleStrategy.lg, new k());
    }

    @CheckResult
    @NonNull
    public f dG() {
        return c(DownsampleStrategy.lg, (i<Bitmap>) new k<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f dH() {
        return a(DownsampleStrategy.ld, (i<Bitmap>) new l<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f dI() {
        return b(DownsampleStrategy.lg, (i<Bitmap>) new l<Bitmap>());
    }

    @CheckResult
    @NonNull
    public f dJ() {
        if (this.oC) {
            return clone().dJ();
        }
        this.eU.clear();
        this.oq &= -2049;
        this.eZ = false;
        this.oq &= -131073;
        this.oy = false;
        this.oq |= 65536;
        this.fa = true;
        return dN();
    }

    @CheckResult
    @NonNull
    public f dK() {
        return c(com.bumptech.glide.load.resource.gif.g.mG, (T) Boolean.valueOf(true));
    }

    @NonNull
    public f dL() {
        this.isLocked = true;
        return this;
    }

    @NonNull
    public f dM() {
        if (!this.isLocked || this.oC) {
            this.oC = true;
            return dL();
        }
        throw new IllegalStateException("You cannot auto lock an already locked options object, try clone() first");
    }

    /* access modifiers changed from: protected */
    public boolean dO() {
        return this.oC;
    }

    public final boolean dP() {
        return isSet(4);
    }

    public final boolean dQ() {
        return isSet(256);
    }

    @NonNull
    public final Map<Class<?>, i<?>> dR() {
        return this.eU;
    }

    public final boolean dS() {
        return this.eZ;
    }

    @Nullable
    public final Drawable dT() {
        return this.os;
    }

    public final int dU() {
        return this.ot;
    }

    public final int dV() {
        return this.ov;
    }

    @Nullable
    public final Drawable dW() {
        return this.ou;
    }

    public final int dX() {
        return this.oA;
    }

    @Nullable
    public final Drawable dY() {
        return this.oz;
    }

    public final boolean dZ() {
        return this.eD;
    }

    @CheckResult
    /* renamed from: dx */
    public f clone() {
        try {
            f fVar = (f) super.clone();
            fVar.eQ = new com.bumptech.glide.load.f();
            fVar.eQ.a(this.eQ);
            fVar.eU = new CachedHashCodeArrayMap();
            fVar.eU.putAll(this.eU);
            fVar.isLocked = false;
            fVar.oC = false;
            return fVar;
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(e);
        }
    }

    public final boolean dy() {
        return this.oy;
    }

    public final boolean dz() {
        return isSet(2048);
    }

    @CheckResult
    @NonNull
    public f e(@IntRange(from = 0) long j) {
        return c(VideoDecoder.lT, (T) Long.valueOf(j));
    }

    public final boolean ea() {
        return isSet(8);
    }

    public final int eb() {
        return this.ox;
    }

    public final boolean ec() {
        return com.bumptech.glide.util.k.s(this.ox, this.ow);
    }

    public final int ed() {
        return this.ow;
    }

    public final float ee() {
        return this.or;
    }

    public final boolean ef() {
        return this.oD;
    }

    public final boolean eg() {
        return this.gz;
    }

    public final boolean eh() {
        return this.fm;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        if (Float.compare(fVar.or, this.or) == 0 && this.ot == fVar.ot && com.bumptech.glide.util.k.c(this.os, fVar.os) && this.ov == fVar.ov && com.bumptech.glide.util.k.c(this.ou, fVar.ou) && this.oA == fVar.oA && com.bumptech.glide.util.k.c(this.oz, fVar.oz) && this.eD == fVar.eD && this.ow == fVar.ow && this.ox == fVar.ox && this.eZ == fVar.eZ && this.oy == fVar.oy && this.oD == fVar.oD && this.fm == fVar.fm && this.eY.equals(fVar.eY) && this.eX == fVar.eX && this.eQ.equals(fVar.eQ) && this.eU.equals(fVar.eU) && this.eS.equals(fVar.eS) && com.bumptech.glide.util.k.c(this.eO, fVar.eO) && com.bumptech.glide.util.k.c(this.oB, fVar.oB)) {
            z = true;
        }
        return z;
    }

    @CheckResult
    @NonNull
    public f g(@NonNull f fVar) {
        if (this.oC) {
            return clone().g(fVar);
        }
        if (n(fVar.oq, 2)) {
            this.or = fVar.or;
        }
        if (n(fVar.oq, 262144)) {
            this.oD = fVar.oD;
        }
        if (n(fVar.oq, 1048576)) {
            this.gz = fVar.gz;
        }
        if (n(fVar.oq, 4)) {
            this.eY = fVar.eY;
        }
        if (n(fVar.oq, 8)) {
            this.eX = fVar.eX;
        }
        if (n(fVar.oq, 16)) {
            this.os = fVar.os;
        }
        if (n(fVar.oq, 32)) {
            this.ot = fVar.ot;
        }
        if (n(fVar.oq, 64)) {
            this.ou = fVar.ou;
        }
        if (n(fVar.oq, 128)) {
            this.ov = fVar.ov;
        }
        if (n(fVar.oq, 256)) {
            this.eD = fVar.eD;
        }
        if (n(fVar.oq, 512)) {
            this.ox = fVar.ox;
            this.ow = fVar.ow;
        }
        if (n(fVar.oq, 1024)) {
            this.eO = fVar.eO;
        }
        if (n(fVar.oq, 4096)) {
            this.eS = fVar.eS;
        }
        if (n(fVar.oq, 8192)) {
            this.oz = fVar.oz;
        }
        if (n(fVar.oq, 16384)) {
            this.oA = fVar.oA;
        }
        if (n(fVar.oq, 32768)) {
            this.oB = fVar.oB;
        }
        if (n(fVar.oq, 65536)) {
            this.oy = fVar.oy;
        }
        if (n(fVar.oq, 131072)) {
            this.eZ = fVar.eZ;
        }
        if (n(fVar.oq, 2048)) {
            this.eU.putAll(fVar.eU);
            this.fa = fVar.fa;
        }
        if (n(fVar.oq, 524288)) {
            this.fm = fVar.fm;
        }
        if (!this.oy) {
            this.eU.clear();
            this.oq &= -2049;
            this.eZ = false;
            this.oq &= -131073;
            this.fa = true;
        }
        this.oq |= fVar.oq;
        this.eQ.a(fVar.eQ);
        return dN();
    }

    @Nullable
    public final Theme getTheme() {
        return this.oB;
    }

    @CheckResult
    @NonNull
    public f h(@FloatRange(from = 0.0d, to = 1.0d) float f) {
        if (this.oC) {
            return clone().h(f);
        }
        if (f < 0.0f || f > 1.0f) {
            throw new IllegalArgumentException("sizeMultiplier must be between 0 and 1");
        }
        this.or = f;
        this.oq |= 2;
        return dN();
    }

    public int hashCode() {
        return com.bumptech.glide.util.k.a((Object) this.oB, com.bumptech.glide.util.k.a((Object) this.eO, com.bumptech.glide.util.k.a((Object) this.eS, com.bumptech.glide.util.k.a((Object) this.eU, com.bumptech.glide.util.k.a((Object) this.eQ, com.bumptech.glide.util.k.a((Object) this.eX, com.bumptech.glide.util.k.a((Object) this.eY, com.bumptech.glide.util.k.a(this.fm, com.bumptech.glide.util.k.a(this.oD, com.bumptech.glide.util.k.a(this.oy, com.bumptech.glide.util.k.a(this.eZ, com.bumptech.glide.util.k.t(this.ox, com.bumptech.glide.util.k.t(this.ow, com.bumptech.glide.util.k.a(this.eD, com.bumptech.glide.util.k.a((Object) this.oz, com.bumptech.glide.util.k.t(this.oA, com.bumptech.glide.util.k.a((Object) this.ou, com.bumptech.glide.util.k.t(this.ov, com.bumptech.glide.util.k.a((Object) this.os, com.bumptech.glide.util.k.t(this.ot, com.bumptech.glide.util.k.hashCode(this.or)))))))))))))))))))));
    }

    @CheckResult
    @NonNull
    public f i(@Nullable Drawable drawable) {
        if (this.oC) {
            return clone().i(drawable);
        }
        this.ou = drawable;
        this.oq |= 64;
        return dN();
    }

    public final boolean isLocked() {
        return this.isLocked;
    }

    @CheckResult
    @NonNull
    public f j(@Nullable Drawable drawable) {
        if (this.oC) {
            return clone().j(drawable);
        }
        this.oz = drawable;
        this.oq |= 8192;
        return dN();
    }

    @CheckResult
    @NonNull
    public f j(boolean z) {
        if (this.oC) {
            return clone().j(z);
        }
        this.oD = z;
        this.oq |= 262144;
        return dN();
    }

    @CheckResult
    @NonNull
    public f k(@Nullable Drawable drawable) {
        if (this.oC) {
            return clone().k(drawable);
        }
        this.os = drawable;
        this.oq |= 16;
        return dN();
    }

    @CheckResult
    @NonNull
    public f k(@NonNull c cVar) {
        if (this.oC) {
            return clone().k(cVar);
        }
        this.eO = (c) com.bumptech.glide.util.i.checkNotNull(cVar);
        this.oq |= 1024;
        return dN();
    }

    @CheckResult
    @NonNull
    public f k(boolean z) {
        if (this.oC) {
            return clone().k(z);
        }
        this.gz = z;
        this.oq |= 1048576;
        return dN();
    }

    @CheckResult
    @NonNull
    public f l(boolean z) {
        if (this.oC) {
            return clone().l(z);
        }
        this.fm = z;
        this.oq |= 524288;
        return dN();
    }

    @CheckResult
    @NonNull
    public f m(boolean z) {
        if (this.oC) {
            return clone().m(true);
        }
        this.eD = !z;
        this.oq |= 256;
        return dN();
    }

    @CheckResult
    @NonNull
    public f o(int i, int i2) {
        if (this.oC) {
            return clone().o(i, i2);
        }
        this.ox = i;
        this.ow = i2;
        this.oq |= 512;
        return dN();
    }

    @CheckResult
    @NonNull
    public f p(@NonNull Class<?> cls) {
        if (this.oC) {
            return clone().p(cls);
        }
        this.eS = (Class) com.bumptech.glide.util.i.checkNotNull(cls);
        this.oq |= 4096;
        return dN();
    }
}
