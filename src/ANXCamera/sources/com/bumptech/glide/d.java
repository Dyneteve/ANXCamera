package com.bumptech.glide;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.ArrayMap;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.a.a.C0004a;
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
    private l bA;
    private f bB = new f();
    @Nullable
    private a bC;
    private com.bumptech.glide.load.engine.b.a bD;
    private boolean bE;
    private Engine bl;
    private com.bumptech.glide.load.engine.bitmap_recycle.d bm;
    private j bn;
    private b br;
    private com.bumptech.glide.manager.d bt;
    private final Map<Class<?>, j<?, ?>> bw = new ArrayMap();
    private com.bumptech.glide.load.engine.b.a bx;
    private com.bumptech.glide.load.engine.b.a by;
    private C0004a bz;
    private int logLevel = 4;

    /* access modifiers changed from: 0000 */
    public d a(Engine engine) {
        this.bl = engine;
        return this;
    }

    @NonNull
    public d a(@Nullable C0004a aVar) {
        this.bz = aVar;
        return this;
    }

    @NonNull
    public d a(@Nullable j jVar) {
        this.bn = jVar;
        return this;
    }

    @NonNull
    public d a(@NonNull l.a aVar) {
        return a(aVar.cl());
    }

    @NonNull
    public d a(@Nullable l lVar) {
        this.bA = lVar;
        return this;
    }

    @Deprecated
    public d a(@Nullable com.bumptech.glide.load.engine.b.a aVar) {
        return b(aVar);
    }

    @NonNull
    public d a(@Nullable b bVar) {
        this.br = bVar;
        return this;
    }

    @NonNull
    public d a(@Nullable com.bumptech.glide.load.engine.bitmap_recycle.d dVar) {
        this.bm = dVar;
        return this;
    }

    @NonNull
    public d a(@Nullable com.bumptech.glide.manager.d dVar) {
        this.bt = dVar;
        return this;
    }

    @NonNull
    public d a(@Nullable f fVar) {
        this.bB = fVar;
        return this;
    }

    @NonNull
    public <T> d a(@NonNull Class<T> cls, @Nullable j<?, T> jVar) {
        this.bw.put(cls, jVar);
        return this;
    }

    /* access modifiers changed from: 0000 */
    public void a(@Nullable a aVar) {
        this.bC = aVar;
    }

    @NonNull
    public d b(@Nullable com.bumptech.glide.load.engine.b.a aVar) {
        this.bx = aVar;
        return this;
    }

    @NonNull
    public d c(@Nullable com.bumptech.glide.load.engine.b.a aVar) {
        this.by = aVar;
        return this;
    }

    @NonNull
    public d c(boolean z) {
        this.bE = z;
        return this;
    }

    @NonNull
    public d d(@Nullable com.bumptech.glide.load.engine.b.a aVar) {
        this.bD = aVar;
        return this;
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public c h(@NonNull Context context) {
        if (this.bx == null) {
            this.bx = com.bumptech.glide.load.engine.b.a.cq();
        }
        if (this.by == null) {
            this.by = com.bumptech.glide.load.engine.b.a.cp();
        }
        if (this.bD == null) {
            this.bD = com.bumptech.glide.load.engine.b.a.ct();
        }
        if (this.bA == null) {
            this.bA = new l.a(context).cl();
        }
        if (this.bt == null) {
            this.bt = new com.bumptech.glide.manager.f();
        }
        if (this.bm == null) {
            int cj = this.bA.cj();
            if (cj > 0) {
                this.bm = new com.bumptech.glide.load.engine.bitmap_recycle.j((long) cj);
            } else {
                this.bm = new e();
            }
        }
        if (this.br == null) {
            this.br = new i(this.bA.ck());
        }
        if (this.bn == null) {
            this.bn = new com.bumptech.glide.load.engine.a.i((long) this.bA.ci());
        }
        if (this.bz == null) {
            this.bz = new h(context);
        }
        if (this.bl == null) {
            Engine engine = new Engine(this.bn, this.bz, this.by, this.bx, com.bumptech.glide.load.engine.b.a.cs(), com.bumptech.glide.load.engine.b.a.ct(), this.bE);
            this.bl = engine;
        }
        Context context2 = context;
        c cVar = new c(context2, this.bl, this.bn, this.bm, this.br, new com.bumptech.glide.manager.l(this.bC), this.bt, this.logLevel, this.bB.en(), this.bw);
        return cVar;
    }

    @NonNull
    public d j(int i) {
        if (i < 2 || i > 6) {
            throw new IllegalArgumentException("Log level must be one of Log.VERBOSE, Log.DEBUG, Log.INFO, Log.WARN, or Log.ERROR");
        }
        this.logLevel = i;
        return this;
    }
}
