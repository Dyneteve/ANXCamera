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
    public static final String ba = "Gif";
    public static final String bb = "Bitmap";
    public static final String bc = "BitmapDrawable";
    private static final String bd = "legacy_prepend_all";
    private static final String be = "legacy_append";
    private final o bf = new o(this.bo);
    private final a bg = new a();
    private final e bh = new e();
    private final f bi = new f();
    private final com.bumptech.glide.load.a.f bj = new com.bumptech.glide.load.a.f();
    private final com.bumptech.glide.load.resource.d.f bk = new com.bumptech.glide.load.resource.d.f();
    private final b bl = new b();
    private final d bm = new d();
    private final c bn = new c();
    private final Pool<List<Throwable>> bo = com.bumptech.glide.util.a.a.eP();

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
        b(Arrays.asList(new String[]{ba, bb, bc}));
    }

    @NonNull
    private <Data, TResource, Transcode> List<com.bumptech.glide.load.engine.f<Data, TResource, Transcode>> b(@NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull Class<Transcode> cls3) {
        ArrayList arrayList = new ArrayList();
        for (Class cls4 : this.bh.i(cls, cls2)) {
            for (Class cls5 : this.bk.f(cls4, cls3)) {
                com.bumptech.glide.load.engine.f fVar = new com.bumptech.glide.load.engine.f(cls, cls4, cls5, this.bh.h(cls, cls4), this.bk.e(cls4, cls5), this.bo);
                arrayList.add(fVar);
            }
        }
        return arrayList;
    }

    @NonNull
    public Registry a(@NonNull ImageHeaderParser imageHeaderParser) {
        this.bl.b(imageHeaderParser);
        return this;
    }

    @NonNull
    public Registry a(@NonNull com.bumptech.glide.load.a.e.a<?> aVar) {
        this.bj.b(aVar);
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
        a(be, cls, cls2, gVar);
        return this;
    }

    @NonNull
    public <Model, Data> Registry a(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<Model, Data> nVar) {
        this.bf.d(cls, cls2, nVar);
        return this;
    }

    @NonNull
    public <TResource, Transcode> Registry a(@NonNull Class<TResource> cls, @NonNull Class<Transcode> cls2, @NonNull com.bumptech.glide.load.resource.d.e<TResource, Transcode> eVar) {
        this.bk.b(cls, cls2, eVar);
        return this;
    }

    @NonNull
    public <Data, TResource> Registry a(@NonNull String str, @NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull g<Data, TResource> gVar) {
        this.bh.a(str, gVar, cls, cls2);
        return this;
    }

    @Nullable
    public <Data, TResource, Transcode> com.bumptech.glide.load.engine.n<Data, TResource, Transcode> a(@NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull Class<Transcode> cls3) {
        com.bumptech.glide.load.engine.n<Data, TResource, Transcode> d = this.bn.d(cls, cls2, cls3);
        if (this.bn.a(d)) {
            return null;
        }
        if (d == null) {
            List b = b(cls, cls2, cls3);
            if (b.isEmpty()) {
                d = null;
            } else {
                d = new com.bumptech.glide.load.engine.n<>(cls, cls2, cls3, b, this.bo);
            }
            this.bn.a(cls, cls2, cls3, d);
        }
        return d;
    }

    public boolean a(@NonNull p<?> pVar) {
        return this.bi.n(pVar.bf()) != null;
    }

    @NonNull
    public <Data> Registry b(@NonNull Class<Data> cls, @NonNull com.bumptech.glide.load.a<Data> aVar) {
        this.bg.d(cls, aVar);
        return this;
    }

    @NonNull
    public <TResource> Registry b(@NonNull Class<TResource> cls, @NonNull h<TResource> hVar) {
        this.bi.d(cls, hVar);
        return this;
    }

    @NonNull
    public <Data, TResource> Registry b(@NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull g<Data, TResource> gVar) {
        b(bd, cls, cls2, gVar);
        return this;
    }

    @NonNull
    public <Model, Data> Registry b(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<Model, Data> nVar) {
        this.bf.e(cls, cls2, nVar);
        return this;
    }

    @NonNull
    public <Data, TResource> Registry b(@NonNull String str, @NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull g<Data, TResource> gVar) {
        this.bh.b(str, gVar, cls, cls2);
        return this;
    }

    @NonNull
    public final Registry b(@NonNull List<String> list) {
        ArrayList arrayList = new ArrayList(list);
        arrayList.add(0, bd);
        arrayList.add(be);
        this.bh.e(arrayList);
        return this;
    }

    @NonNull
    public <X> h<X> b(@NonNull p<X> pVar) throws NoResultEncoderAvailableException {
        h<X> n = this.bi.n(pVar.bf());
        if (n != null) {
            return n;
        }
        throw new NoResultEncoderAvailableException(pVar.bf());
    }

    @NonNull
    public <Data> Registry c(@NonNull Class<Data> cls, @NonNull com.bumptech.glide.load.a<Data> aVar) {
        this.bg.e(cls, aVar);
        return this;
    }

    @NonNull
    public <TResource> Registry c(@NonNull Class<TResource> cls, @NonNull h<TResource> hVar) {
        this.bi.e(cls, hVar);
        return this;
    }

    @NonNull
    public <Model, Data> Registry c(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        this.bf.f(cls, cls2, nVar);
        return this;
    }

    @NonNull
    public <Model, TResource, Transcode> List<Class<?>> c(@NonNull Class<Model> cls, @NonNull Class<TResource> cls2, @NonNull Class<Transcode> cls3) {
        List<Class<?>> g = this.bm.g(cls, cls2);
        if (g == null) {
            g = new ArrayList<>();
            for (Class i : this.bf.h(cls)) {
                for (Class cls4 : this.bh.i(i, cls2)) {
                    if (!this.bk.f(cls4, cls3).isEmpty() && !g.contains(cls4)) {
                        g.add(cls4);
                    }
                }
            }
            this.bm.a(cls, cls2, Collections.unmodifiableList(g));
        }
        return g;
    }

    @NonNull
    public <X> com.bumptech.glide.load.a<X> d(@NonNull X x) throws NoSourceEncoderAvailableException {
        com.bumptech.glide.load.a<X> m = this.bg.m(x.getClass());
        if (m != null) {
            return m;
        }
        throw new NoSourceEncoderAvailableException(x.getClass());
    }

    @NonNull
    public <X> com.bumptech.glide.load.a.e<X> e(@NonNull X x) {
        return this.bj.l(x);
    }

    @NonNull
    public <Model> List<m<Model, ?>> f(@NonNull Model model) {
        List<m<Model, ?>> f = this.bf.f(model);
        if (!f.isEmpty()) {
            return f;
        }
        throw new NoModelLoaderAvailableException(model);
    }

    @NonNull
    public List<ImageHeaderParser> w() {
        List<ImageHeaderParser> di = this.bl.di();
        if (!di.isEmpty()) {
            return di;
        }
        throw new NoImageHeaderParserException();
    }
}
