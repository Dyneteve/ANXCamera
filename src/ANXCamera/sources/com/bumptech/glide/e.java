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
    private final f aB;
    private final Handler aF = new Handler(Looper.getMainLooper());
    private final i aG;
    private final Engine al;
    private final Registry aq;
    private final b ar;
    private final Map<Class<?>, j<?, ?>> aw;
    private final int logLevel;

    public e(@NonNull Context context, @NonNull b bVar, @NonNull Registry registry, @NonNull i iVar, @NonNull f fVar, @NonNull Map<Class<?>, j<?, ?>> map, @NonNull Engine engine, int i) {
        super(context.getApplicationContext());
        this.ar = bVar;
        this.aq = registry;
        this.aG = iVar;
        this.aB = fVar;
        this.aw = map;
        this.al = engine;
        this.logLevel = i;
    }

    @NonNull
    public <T> j<?, T> a(@NonNull Class<T> cls) {
        j<?, T> jVar;
        j<?, T> jVar2 = (j) this.aw.get(cls);
        if (jVar2 == null) {
            for (Entry entry : this.aw.entrySet()) {
                if (((Class) entry.getKey()).isAssignableFrom(cls)) {
                    jVar2 = (j) entry.getValue();
                }
            }
        }
        return jVar == null ? DEFAULT_TRANSITION_OPTIONS : jVar;
    }

    @NonNull
    public <X> ViewTarget<ImageView, X> a(@NonNull ImageView imageView, @NonNull Class<X> cls) {
        return this.aG.b(imageView, cls);
    }

    public int getLogLevel() {
        return this.logLevel;
    }

    @NonNull
    public b l() {
        return this.ar;
    }

    @NonNull
    public Registry r() {
        return this.aq;
    }

    public f s() {
        return this.aB;
    }

    @NonNull
    public Handler t() {
        return this.aF;
    }

    @NonNull
    public Engine u() {
        return this.al;
    }
}
