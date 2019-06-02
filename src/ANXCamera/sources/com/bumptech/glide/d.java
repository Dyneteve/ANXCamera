package com.bumptech.glide;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.ArrayMap;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.a.a.C0005a;
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
    private l aA;
    private f aB = new f();
    @Nullable
    private a aC;
    private com.bumptech.glide.load.engine.b.a aD;
    private boolean aE;
    private Engine al;
    private com.bumptech.glide.load.engine.bitmap_recycle.d am;
    private j an;
    private b ar;
    private com.bumptech.glide.manager.d at;
    private final Map<Class<?>, j<?, ?>> aw = new ArrayMap();
    private com.bumptech.glide.load.engine.b.a ax;
    private com.bumptech.glide.load.engine.b.a ay;
    private C0005a az;
    private int logLevel = 4;

    /* access modifiers changed from: 0000 */
    public d a(Engine engine) {
        this.al = engine;
        return this;
    }

    @NonNull
    public d a(@Nullable C0005a aVar) {
        this.az = aVar;
        return this;
    }

    @NonNull
    public d a(@Nullable j jVar) {
        this.an = jVar;
        return this;
    }

    @NonNull
    public d a(@NonNull l.a aVar) {
        return a(aVar.bJ());
    }

    @NonNull
    public d a(@Nullable l lVar) {
        this.aA = lVar;
        return this;
    }

    @Deprecated
    public d a(@Nullable com.bumptech.glide.load.engine.b.a aVar) {
        return b(aVar);
    }

    @NonNull
    public d a(@Nullable b bVar) {
        this.ar = bVar;
        return this;
    }

    @NonNull
    public d a(@Nullable com.bumptech.glide.load.engine.bitmap_recycle.d dVar) {
        this.am = dVar;
        return this;
    }

    @NonNull
    public d a(@Nullable com.bumptech.glide.manager.d dVar) {
        this.at = dVar;
        return this;
    }

    @NonNull
    public d a(@Nullable f fVar) {
        this.aB = fVar;
        return this;
    }

    @NonNull
    public <T> d a(@NonNull Class<T> cls, @Nullable j<?, T> jVar) {
        this.aw.put(cls, jVar);
        return this;
    }

    /* access modifiers changed from: 0000 */
    public void a(@Nullable a aVar) {
        this.aC = aVar;
    }

    @NonNull
    public d b(@Nullable com.bumptech.glide.load.engine.b.a aVar) {
        this.ax = aVar;
        return this;
    }

    @NonNull
    public d c(@Nullable com.bumptech.glide.load.engine.b.a aVar) {
        this.ay = aVar;
        return this;
    }

    @NonNull
    public d c(boolean z) {
        this.aE = z;
        return this;
    }

    @NonNull
    public d d(@Nullable com.bumptech.glide.load.engine.b.a aVar) {
        this.aD = aVar;
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
        if (this.ax == null) {
            this.ax = com.bumptech.glide.load.engine.b.a.bO();
        }
        if (this.ay == null) {
            this.ay = com.bumptech.glide.load.engine.b.a.bN();
        }
        if (this.aD == null) {
            this.aD = com.bumptech.glide.load.engine.b.a.bQ();
        }
        if (this.aA == null) {
            this.aA = new l.a(context).bJ();
        }
        if (this.at == null) {
            this.at = new com.bumptech.glide.manager.f();
        }
        if (this.am == null) {
            int bH = this.aA.bH();
            if (bH > 0) {
                this.am = new com.bumptech.glide.load.engine.bitmap_recycle.j((long) bH);
            } else {
                this.am = new e();
            }
        }
        if (this.ar == null) {
            this.ar = new i(this.aA.bI());
        }
        if (this.an == null) {
            this.an = new com.bumptech.glide.load.engine.a.i((long) this.aA.bG());
        }
        if (this.az == null) {
            this.az = new h(context);
        }
        if (this.al == null) {
            Engine engine = new Engine(this.an, this.az, this.ay, this.ax, com.bumptech.glide.load.engine.b.a.bP(), com.bumptech.glide.load.engine.b.a.bQ(), this.aE);
            this.al = engine;
        }
        Context context2 = context;
        c cVar = new c(context2, this.al, this.an, this.am, this.ar, new com.bumptech.glide.manager.l(this.aC), this.at, this.logLevel, this.aB.dL(), this.aw);
        return cVar;
    }
}
