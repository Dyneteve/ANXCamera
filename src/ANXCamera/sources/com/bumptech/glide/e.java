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
    private final Handler aD = new Handler(Looper.getMainLooper());
    private final i aE;
    private final Engine aj;
    private final Registry ao;
    private final b ap;
    private final Map<Class<?>, j<?, ?>> au;
    private final f az;
    private final int logLevel;

    public e(@NonNull Context context, @NonNull b bVar, @NonNull Registry registry, @NonNull i iVar, @NonNull f fVar, @NonNull Map<Class<?>, j<?, ?>> map, @NonNull Engine engine, int i) {
        super(context.getApplicationContext());
        this.ap = bVar;
        this.ao = registry;
        this.aE = iVar;
        this.az = fVar;
        this.au = map;
        this.aj = engine;
        this.logLevel = i;
    }

    @NonNull
    public <T> j<?, T> a(@NonNull Class<T> cls) {
        j<?, T> jVar;
        j<?, T> jVar2 = (j) this.au.get(cls);
        if (jVar2 == null) {
            for (Entry entry : this.au.entrySet()) {
                if (((Class) entry.getKey()).isAssignableFrom(cls)) {
                    jVar2 = (j) entry.getValue();
                }
            }
        }
        return jVar == null ? DEFAULT_TRANSITION_OPTIONS : jVar;
    }

    @NonNull
    public <X> ViewTarget<ImageView, X> a(@NonNull ImageView imageView, @NonNull Class<X> cls) {
        return this.aE.b(imageView, cls);
    }

    public int getLogLevel() {
        return this.logLevel;
    }

    @NonNull
    public b l() {
        return this.ap;
    }

    @NonNull
    public Registry r() {
        return this.ao;
    }

    public f s() {
        return this.az;
    }

    @NonNull
    public Handler t() {
        return this.aD;
    }

    @NonNull
    public Engine u() {
        return this.aj;
    }
}
