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
    private final f aA;
    private final Handler aE = new Handler(Looper.getMainLooper());
    private final i aF;
    private final Engine ak;
    private final Registry ap;
    private final b aq;
    private final Map<Class<?>, j<?, ?>> av;
    private final int logLevel;

    public e(@NonNull Context context, @NonNull b bVar, @NonNull Registry registry, @NonNull i iVar, @NonNull f fVar, @NonNull Map<Class<?>, j<?, ?>> map, @NonNull Engine engine, int i) {
        super(context.getApplicationContext());
        this.aq = bVar;
        this.ap = registry;
        this.aF = iVar;
        this.aA = fVar;
        this.av = map;
        this.ak = engine;
        this.logLevel = i;
    }

    @NonNull
    public <T> j<?, T> a(@NonNull Class<T> cls) {
        j<?, T> jVar;
        j<?, T> jVar2 = (j) this.av.get(cls);
        if (jVar2 == null) {
            for (Entry entry : this.av.entrySet()) {
                if (((Class) entry.getKey()).isAssignableFrom(cls)) {
                    jVar2 = (j) entry.getValue();
                }
            }
        }
        return jVar == null ? DEFAULT_TRANSITION_OPTIONS : jVar;
    }

    @NonNull
    public <X> ViewTarget<ImageView, X> a(@NonNull ImageView imageView, @NonNull Class<X> cls) {
        return this.aF.b(imageView, cls);
    }

    public int getLogLevel() {
        return this.logLevel;
    }

    @NonNull
    public b l() {
        return this.aq;
    }

    @NonNull
    public Registry r() {
        return this.ap;
    }

    public f s() {
        return this.aA;
    }

    @NonNull
    public Handler t() {
        return this.aE;
    }

    @NonNull
    public Engine u() {
        return this.ak;
    }
}
