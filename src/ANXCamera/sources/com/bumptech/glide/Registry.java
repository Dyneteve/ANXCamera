package com.bumptech.glide;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.Pools.Pool;
import com.bumptech.glide.d.a;
import com.bumptech.glide.d.b;
import com.bumptech.glide.d.c;
import com.bumptech.glide.d.d;
import com.bumptech.glide.d.e;
import com.bumptech.glide.d.f;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.g;
import com.bumptech.glide.load.h;
import com.bumptech.glide.load.model.m;
import com.bumptech.glide.load.model.n;
import com.bumptech.glide.load.model.o;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class Registry {
    public static final String bb = "Gif";
    public static final String bc = "Bitmap";
    public static final String bd = "BitmapDrawable";
    private static final String be = "legacy_prepend_all";
    private static final String bf = "legacy_append";
    private final o bg = new o(this.bp);
    private final a bh = new a();
    private final e bi = new e();
    private final f bj = new f();
    private final com.bumptech.glide.load.a.f bk = new com.bumptech.glide.load.a.f();
    private final com.bumptech.glide.load.resource.d.f bl = new com.bumptech.glide.load.resource.d.f();
    private final b bm = new b();
    private final d bn = new d();
    private final c bo = new c();
    private final Pool<List<Throwable>> bp = com.bumptech.glide.util.a.a.eP();

    public static class MissingComponentException extends RuntimeException {
        public MissingComponentException(@NonNull String str) {
            super(str);
        }
    }

    public static final class NoImageHeaderParserException extends MissingComponentException {
        public NoImageHeaderParserException() {
            super("Failed to find image header parser.");
        }
    }

    public static class NoModelLoaderAvailableException extends MissingComponentException {
        public NoModelLoaderAvailableException(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
            StringBuilder sb = new StringBuilder();
            sb.append("Failed to find any ModelLoaders for model: ");
            sb.append(cls);
            sb.append(" and data: ");
            sb.append(cls2);
            super(sb.toString());
        }

        public NoModelLoaderAvailableException(@NonNull Object obj) {
            StringBuilder sb = new StringBuilder();
            sb.append("Failed to find any ModelLoaders for model: ");
            sb.append(obj);
            super(sb.toString());
        }
    }

    public static class NoResultEncoderAvailableException extends MissingComponentException {
        public NoResultEncoderAvailableException(@NonNull Class<?> cls) {
            StringBuilder sb = new StringBuilder();
            sb.append("Failed to find result encoder for resource class: ");
            sb.append(cls);
            sb.append(", you may need to consider registering a new Encoder for the requested type or DiskCacheStrategy.DATA/DiskCacheStrategy.NONE if caching your transformed resource is unnecessary.");
            super(sb.toString());
        }
    }

    public static class NoSourceEncoderAvailableException extends MissingComponentException {
        public NoSourceEncoderAvailableException(@NonNull Class<?> cls) {
            StringBuilder sb = new StringBuilder();
            sb.append("Failed to find source encoder for data class: ");
            sb.append(cls);
            super(sb.toString());
        }
    }

    public Registry() {
        b(Arrays.asList(new String[]{bb, bc, bd}));
    }

    @NonNull
    private <Data, TResource, Transcode> List<com.bumptech.glide.load.engine.f<Data, TResource, Transcode>> b(@NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull Class<Transcode> cls3) {
        ArrayList arrayList = new ArrayList();
        for (Class cls4 : this.bi.i(cls, cls2)) {
            for (Class cls5 : this.bl.f(cls4, cls3)) {
                com.bumptech.glide.load.engine.f fVar = new com.bumptech.glide.load.engine.f(cls, cls4, cls5, this.bi.h(cls, cls4), this.bl.e(cls4, cls5), this.bp);
                arrayList.add(fVar);
            }
        }
        return arrayList;
    }

    @NonNull
    public Registry a(@NonNull ImageHeaderParser imageHeaderParser) {
        this.bm.b(imageHeaderParser);
        return this;
    }

    @NonNull
    public Registry a(@NonNull com.bumptech.glide.load.a.e.a<?> aVar) {
        this.bk.b(aVar);
        return this;
    }

    @Deprecated
    @NonNull
    public <Data> Registry a(@NonNull Class<Data> cls, @NonNull com.bumptech.glide.load.a<Data> aVar) {
        return b(cls, aVar);
    }

    @Deprecated
    @NonNull
    public <TResource> Registry a(@NonNull Class<TResource> cls, @NonNull h<TResource> hVar) {
        return b(cls, hVar);
    }

    @NonNull
    public <Data, TResource> Registry a(@NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull g<Data, TResource> gVar) {
        a(bf, cls, cls2, gVar);
        return this;
    }

    @NonNull
    public <Model, Data> Registry a(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<Model, Data> nVar) {
        this.bg.d(cls, cls2, nVar);
        return this;
    }

    @NonNull
    public <TResource, Transcode> Registry a(@NonNull Class<TResource> cls, @NonNull Class<Transcode> cls2, @NonNull com.bumptech.glide.load.resource.d.e<TResource, Transcode> eVar) {
        this.bl.b(cls, cls2, eVar);
        return this;
    }

    @NonNull
    public <Data, TResource> Registry a(@NonNull String str, @NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull g<Data, TResource> gVar) {
        this.bi.a(str, gVar, cls, cls2);
        return this;
    }

    @Nullable
    public <Data, TResource, Transcode> com.bumptech.glide.load.engine.n<Data, TResource, Transcode> a(@NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull Class<Transcode> cls3) {
        com.bumptech.glide.load.engine.n<Data, TResource, Transcode> d = this.bo.d(cls, cls2, cls3);
        if (this.bo.a(d)) {
            return null;
        }
        if (d == null) {
            List b = b(cls, cls2, cls3);
            if (b.isEmpty()) {
                d = null;
            } else {
                d = new com.bumptech.glide.load.engine.n<>(cls, cls2, cls3, b, this.bp);
            }
            this.bo.a(cls, cls2, cls3, d);
        }
        return d;
    }

    public boolean a(@NonNull p<?> pVar) {
        return this.bj.n(pVar.bf()) != null;
    }

    @NonNull
    public <Data> Registry b(@NonNull Class<Data> cls, @NonNull com.bumptech.glide.load.a<Data> aVar) {
        this.bh.d(cls, aVar);
        return this;
    }

    @NonNull
    public <TResource> Registry b(@NonNull Class<TResource> cls, @NonNull h<TResource> hVar) {
        this.bj.d(cls, hVar);
        return this;
    }

    @NonNull
    public <Data, TResource> Registry b(@NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull g<Data, TResource> gVar) {
        b(be, cls, cls2, gVar);
        return this;
    }

    @NonNull
    public <Model, Data> Registry b(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<Model, Data> nVar) {
        this.bg.e(cls, cls2, nVar);
        return this;
    }

    @NonNull
    public <Data, TResource> Registry b(@NonNull String str, @NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull g<Data, TResource> gVar) {
        this.bi.b(str, gVar, cls, cls2);
        return this;
    }

    @NonNull
    public final Registry b(@NonNull List<String> list) {
        ArrayList arrayList = new ArrayList(list);
        arrayList.add(0, be);
        arrayList.add(bf);
        this.bi.e(arrayList);
        return this;
    }

    @NonNull
    public <X> h<X> b(@NonNull p<X> pVar) throws NoResultEncoderAvailableException {
        h<X> n = this.bj.n(pVar.bf());
        if (n != null) {
            return n;
        }
        throw new NoResultEncoderAvailableException(pVar.bf());
    }

    @NonNull
    public <Data> Registry c(@NonNull Class<Data> cls, @NonNull com.bumptech.glide.load.a<Data> aVar) {
        this.bh.e(cls, aVar);
        return this;
    }

    @NonNull
    public <TResource> Registry c(@NonNull Class<TResource> cls, @NonNull h<TResource> hVar) {
        this.bj.e(cls, hVar);
        return this;
    }

    @NonNull
    public <Model, Data> Registry c(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        this.bg.f(cls, cls2, nVar);
        return this;
    }

    @NonNull
    public <Model, TResource, Transcode> List<Class<?>> c(@NonNull Class<Model> cls, @NonNull Class<TResource> cls2, @NonNull Class<Transcode> cls3) {
        List<Class<?>> g = this.bn.g(cls, cls2);
        if (g == null) {
            g = new ArrayList<>();
            for (Class i : this.bg.h(cls)) {
                for (Class cls4 : this.bi.i(i, cls2)) {
                    if (!this.bl.f(cls4, cls3).isEmpty() && !g.contains(cls4)) {
                        g.add(cls4);
                    }
                }
            }
            this.bn.a(cls, cls2, Collections.unmodifiableList(g));
        }
        return g;
    }

    @NonNull
    public <X> com.bumptech.glide.load.a<X> d(@NonNull X x) throws NoSourceEncoderAvailableException {
        com.bumptech.glide.load.a<X> m = this.bh.m(x.getClass());
        if (m != null) {
            return m;
        }
        throw new NoSourceEncoderAvailableException(x.getClass());
    }

    @NonNull
    public <X> com.bumptech.glide.load.a.e<X> e(@NonNull X x) {
        return this.bk.l(x);
    }

    @NonNull
    public <Model> List<m<Model, ?>> f(@NonNull Model model) {
        List<m<Model, ?>> f = this.bg.f(model);
        if (!f.isEmpty()) {
            return f;
        }
        throw new NoModelLoaderAvailableException(model);
    }

    @NonNull
    public List<ImageHeaderParser> w() {
        List<ImageHeaderParser> di = this.bm.di();
        if (!di.isEmpty()) {
            return di;
        }
        throw new NoImageHeaderParserException();
    }
}
