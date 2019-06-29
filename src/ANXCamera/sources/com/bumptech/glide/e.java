package com.bumptech.glide;

import android.content.Context;
import android.content.ContextWrapper;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.widget.ImageView;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.request.f;
import com.bumptech.glide.request.target.ViewTarget;
import com.bumptech.glide.request.target.i;
import java.util.Map;
import java.util.Map.Entry;

/* compiled from: GlideContext */
public class e extends ContextWrapper {
    @VisibleForTesting
    static final j<?, ?> DEFAULT_TRANSITION_OPTIONS = new b();
    private final f bB;
    private final Handler bF = new Handler(Looper.getMainLooper());
    private final i bG;
    private final Engine bl;
    private final Registry bq;
    private final b br;
    private final Map<Class<?>, j<?, ?>> bw;
    private final int logLevel;

    public e(@NonNull Context context, @NonNull b bVar, @NonNull Registry registry, @NonNull i iVar, @NonNull f fVar, @NonNull Map<Class<?>, j<?, ?>> map, @NonNull Engine engine, int i) {
        super(context.getApplicationContext());
        this.br = bVar;
        this.bq = registry;
        this.bG = iVar;
        this.bB = fVar;
        this.bw = map;
        this.bl = engine;
        this.logLevel = i;
    }

    @NonNull
    public b L() {
        return this.br;
    }

    @NonNull
    public Registry R() {
        return this.bq;
    }

    public f S() {
        return this.bB;
    }

    @NonNull
    public Handler T() {
        return this.bF;
    }

    @NonNull
    public Engine U() {
        return this.bl;
    }

    @NonNull
    public <X> ViewTarget<ImageView, X> a(@NonNull ImageView imageView, @NonNull Class<X> cls) {
        return this.bG.b(imageView, cls);
    }

    @NonNull
    public <T> j<?, T> b(@NonNull Class<T> cls) {
        j<?, T> jVar = (j) this.bw.get(cls);
        if (jVar == null) {
            for (Entry entry : this.bw.entrySet()) {
                if (((Class) entry.getKey()).isAssignableFrom(cls)) {
                    jVar = (j) entry.getValue();
                }
            }
        }
        return jVar == null ? DEFAULT_TRANSITION_OPTIONS : jVar;
    }

    public int getLogLevel() {
        return this.logLevel;
    }
}
