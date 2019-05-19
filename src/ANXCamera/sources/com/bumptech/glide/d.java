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
    @Nullable
    private a aA;
    private com.bumptech.glide.load.engine.b.a aB;
    private boolean aC;
    private Engine aj;
    private com.bumptech.glide.load.engine.bitmap_recycle.d ak;
    private j al;
    private b ap;
    private com.bumptech.glide.manager.d ar;
    private final Map<Class<?>, j<?, ?>> au = new ArrayMap();
    private com.bumptech.glide.load.engine.b.a av;
    private com.bumptech.glide.load.engine.b.a aw;
    private C0003a ax;
    private l ay;
    private f az = new f();
    private int logLevel = 4;

    /* access modifiers changed from: 0000 */
    public d a(Engine engine) {
        this.aj = engine;
        return this;
    }

    @NonNull
    public d a(@Nullable C0003a aVar) {
        this.ax = aVar;
        return this;
    }

    @NonNull
    public d a(@Nullable j jVar) {
        this.al = jVar;
        return this;
    }

    @NonNull
    public d a(@NonNull l.a aVar) {
        return a(aVar.bJ());
    }

    @NonNull
    public d a(@Nullable l lVar) {
        this.ay = lVar;
        return this;
    }

    @Deprecated
    public d a(@Nullable com.bumptech.glide.load.engine.b.a aVar) {
        return b(aVar);
    }

    @NonNull
    public d a(@Nullable b bVar) {
        this.ap = bVar;
        return this;
    }

    @NonNull
    public d a(@Nullable com.bumptech.glide.load.engine.bitmap_recycle.d dVar) {
        this.ak = dVar;
        return this;
    }

    @NonNull
    public d a(@Nullable com.bumptech.glide.manager.d dVar) {
        this.ar = dVar;
        return this;
    }

    @NonNull
    public d a(@Nullable f fVar) {
        this.az = fVar;
        return this;
    }

    @NonNull
    public <T> d a(@NonNull Class<T> cls, @Nullable j<?, T> jVar) {
        this.au.put(cls, jVar);
        return this;
    }

    /* access modifiers changed from: 0000 */
    public void a(@Nullable a aVar) {
        this.aA = aVar;
    }

    @NonNull
    public d b(@Nullable com.bumptech.glide.load.engine.b.a aVar) {
        this.av = aVar;
        return this;
    }

    @NonNull
    public d c(@Nullable com.bumptech.glide.load.engine.b.a aVar) {
        this.aw = aVar;
        return this;
    }

    @NonNull
    public d c(boolean z) {
        this.aC = z;
        return this;
    }

    @NonNull
    public d d(@Nullable com.bumptech.glide.load.engine.b.a aVar) {
        this.aB = aVar;
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
        if (this.av == null) {
            this.av = com.bumptech.glide.load.engine.b.a.bO();
        }
        if (this.aw == null) {
            this.aw = com.bumptech.glide.load.engine.b.a.bN();
        }
        if (this.aB == null) {
            this.aB = com.bumptech.glide.load.engine.b.a.bQ();
        }
        if (this.ay == null) {
            this.ay = new l.a(context).bJ();
        }
        if (this.ar == null) {
            this.ar = new com.bumptech.glide.manager.f();
        }
        if (this.ak == null) {
            int bH = this.ay.bH();
            if (bH > 0) {
                this.ak = new com.bumptech.glide.load.engine.bitmap_recycle.j((long) bH);
            } else {
                this.ak = new e();
            }
        }
        if (this.ap == null) {
            this.ap = new i(this.ay.bI());
        }
        if (this.al == null) {
            this.al = new com.bumptech.glide.load.engine.a.i((long) this.ay.bG());
        }
        if (this.ax == null) {
            this.ax = new h(context);
        }
        if (this.aj == null) {
            Engine engine = new Engine(this.al, this.ax, this.aw, this.av, com.bumptech.glide.load.engine.b.a.bP(), com.bumptech.glide.load.engine.b.a.bQ(), this.aC);
            this.aj = engine;
        }
        Context context2 = context;
        c cVar = new c(context2, this.aj, this.al, this.ak, this.ap, new com.bumptech.glide.manager.l(this.aA), this.ar, this.logLevel, this.az.dL(), this.au);
        return cVar;
    }
}
