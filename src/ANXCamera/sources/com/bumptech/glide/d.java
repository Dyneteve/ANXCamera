package com.bumptech.glide;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.ArrayMap;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.a.a.C0003a;
import com.bumptech.glide.load.engine.a.h;
import com.bumptech.glide.load.engine.a.j;
import com.bumptech.glide.load.engine.a.l;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.engine.bitmap_recycle.e;
import com.bumptech.glide.load.engine.bitmap_recycle.i;
import com.bumptech.glide.manager.l.a;
import com.bumptech.glide.request.f;
import java.util.Map;

/* compiled from: GlideBuilder */
public final class d {
    private f aA = new f();
    @Nullable
    private a aB;
    private com.bumptech.glide.load.engine.b.a aC;
    private boolean aD;
    private Engine ak;
    private com.bumptech.glide.load.engine.bitmap_recycle.d al;
    private j am;
    private b aq;
    private com.bumptech.glide.manager.d as;
    private final Map<Class<?>, j<?, ?>> av = new ArrayMap();
    private com.bumptech.glide.load.engine.b.a aw;
    private com.bumptech.glide.load.engine.b.a ax;
    private C0003a ay;
    private l az;
    private int logLevel = 4;

    /* access modifiers changed from: 0000 */
    public d a(Engine engine) {
        this.ak = engine;
        return this;
    }

    @NonNull
    public d a(@Nullable C0003a aVar) {
        this.ay = aVar;
        return this;
    }

    @NonNull
    public d a(@Nullable j jVar) {
        this.am = jVar;
        return this;
    }

    @NonNull
    public d a(@NonNull l.a aVar) {
        return a(aVar.bJ());
    }

    @NonNull
    public d a(@Nullable l lVar) {
        this.az = lVar;
        return this;
    }

    @Deprecated
    public d a(@Nullable com.bumptech.glide.load.engine.b.a aVar) {
        return b(aVar);
    }

    @NonNull
    public d a(@Nullable b bVar) {
        this.aq = bVar;
        return this;
    }

    @NonNull
    public d a(@Nullable com.bumptech.glide.load.engine.bitmap_recycle.d dVar) {
        this.al = dVar;
        return this;
    }

    @NonNull
    public d a(@Nullable com.bumptech.glide.manager.d dVar) {
        this.as = dVar;
        return this;
    }

    @NonNull
    public d a(@Nullable f fVar) {
        this.aA = fVar;
        return this;
    }

    @NonNull
    public <T> d a(@NonNull Class<T> cls, @Nullable j<?, T> jVar) {
        this.av.put(cls, jVar);
        return this;
    }

    /* access modifiers changed from: 0000 */
    public void a(@Nullable a aVar) {
        this.aB = aVar;
    }

    @NonNull
    public d b(@Nullable com.bumptech.glide.load.engine.b.a aVar) {
        this.aw = aVar;
        return this;
    }

    @NonNull
    public d c(@Nullable com.bumptech.glide.load.engine.b.a aVar) {
        this.ax = aVar;
        return this;
    }

    @NonNull
    public d c(boolean z) {
        this.aD = z;
        return this;
    }

    @NonNull
    public d d(@Nullable com.bumptech.glide.load.engine.b.a aVar) {
        this.aC = aVar;
        return this;
    }

    @NonNull
    public d f(int i) {
        if (i < 2 || i > 6) {
            throw new IllegalArgumentException("Log level must be one of Log.VERBOSE, Log.DEBUG, Log.INFO, Log.WARN, or Log.ERROR");
        }
        this.logLevel = i;
        return this;
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public c h(@NonNull Context context) {
        if (this.aw == null) {
            this.aw = com.bumptech.glide.load.engine.b.a.bO();
        }
        if (this.ax == null) {
            this.ax = com.bumptech.glide.load.engine.b.a.bN();
        }
        if (this.aC == null) {
            this.aC = com.bumptech.glide.load.engine.b.a.bQ();
        }
        if (this.az == null) {
            this.az = new l.a(context).bJ();
        }
        if (this.as == null) {
            this.as = new com.bumptech.glide.manager.f();
        }
        if (this.al == null) {
            int bH = this.az.bH();
            if (bH > 0) {
                this.al = new com.bumptech.glide.load.engine.bitmap_recycle.j((long) bH);
            } else {
                this.al = new e();
            }
        }
        if (this.aq == null) {
            this.aq = new i(this.az.bI());
        }
        if (this.am == null) {
            this.am = new com.bumptech.glide.load.engine.a.i((long) this.az.bG());
        }
        if (this.ay == null) {
            this.ay = new h(context);
        }
        if (this.ak == null) {
            Engine engine = new Engine(this.am, this.ay, this.ax, this.aw, com.bumptech.glide.load.engine.b.a.bP(), com.bumptech.glide.load.engine.b.a.bQ(), this.aD);
            this.ak = engine;
        }
        Context context2 = context;
        c cVar = new c(context2, this.ak, this.am, this.al, this.aq, new com.bumptech.glide.manager.l(this.aB), this.as, this.logLevel, this.aA.dL(), this.av);
        return cVar;
    }
}
