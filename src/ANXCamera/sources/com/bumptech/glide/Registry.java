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
    public static final String cc = "Gif";
    public static final String cd = "Bitmap";
    public static final String ce = "BitmapDrawable";
    private static final String cf = "legacy_prepend_all";
    private static final String cg = "legacy_append";
    private final o ci = new o(this.ct);
    private final a cj = new a();
    private final e ck = new e();
    private final f cl = new f();
    private final com.bumptech.glide.load.a.f cm = new com.bumptech.glide.load.a.f();
    private final com.bumptech.glide.load.resource.d.f cn = new com.bumptech.glide.load.resource.d.f();
    private final b cp = new b();
    private final d cq = new d();
    private final c cr = new c();
    private final Pool<List<Throwable>> ct = com.bumptech.glide.util.a.a.fr();

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
        b(Arrays.asList(new String[]{cc, cd, ce}));
    }

    @NonNull
    private <Data, TResource, Transcode> List<com.bumptech.glide.load.engine.f<Data, TResource, Transcode>> b(@NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull Class<Transcode> cls3) {
        ArrayList arrayList = new ArrayList();
        for (Class cls4 : this.ck.i(cls, cls2)) {
            for (Class cls5 : this.cn.f(cls4, cls3)) {
                com.bumptech.glide.load.engine.f fVar = new com.bumptech.glide.load.engine.f(cls, cls4, cls5, this.ck.h(cls, cls4), this.cn.e(cls4, cls5), this.ct);
                arrayList.add(fVar);
            }
        }
        return arrayList;
    }

    @NonNull
    public List<ImageHeaderParser> W() {
        List<ImageHeaderParser> dK = this.cp.dK();
        if (!dK.isEmpty()) {
            return dK;
        }
        throw new NoImageHeaderParserException();
    }

    @NonNull
    public Registry a(@NonNull ImageHeaderParser imageHeaderParser) {
        this.cp.b(imageHeaderParser);
        return this;
    }

    @NonNull
    public Registry a(@NonNull com.bumptech.glide.load.a.e.a<?> aVar) {
        this.cm.b(aVar);
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
        a(cg, cls, cls2, gVar);
        return this;
    }

    @NonNull
    public <Model, Data> Registry a(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<Model, Data> nVar) {
        this.ci.d(cls, cls2, nVar);
        return this;
    }

    @NonNull
    public <TResource, Transcode> Registry a(@NonNull Class<TResource> cls, @NonNull Class<Transcode> cls2, @NonNull com.bumptech.glide.load.resource.d.e<TResource, Transcode> eVar) {
        this.cn.b(cls, cls2, eVar);
        return this;
    }

    @NonNull
    public <Data, TResource> Registry a(@NonNull String str, @NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull g<Data, TResource> gVar) {
        this.ck.a(str, gVar, cls, cls2);
        return this;
    }

    @Nullable
    public <Data, TResource, Transcode> com.bumptech.glide.load.engine.n<Data, TResource, Transcode> a(@NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull Class<Transcode> cls3) {
        com.bumptech.glide.load.engine.n<Data, TResource, Transcode> d = this.cr.d(cls, cls2, cls3);
        if (this.cr.a(d)) {
            return null;
        }
        if (d == null) {
            List b = b(cls, cls2, cls3);
            if (b.isEmpty()) {
                d = null;
            } else {
                d = new com.bumptech.glide.load.engine.n<>(cls, cls2, cls3, b, this.ct);
            }
            this.cr.a(cls, cls2, cls3, d);
        }
        return d;
    }

    public boolean a(@NonNull p<?> pVar) {
        return this.cl.o(pVar.bG()) != null;
    }

    @NonNull
    public <Data> Registry b(@NonNull Class<Data> cls, @NonNull com.bumptech.glide.load.a<Data> aVar) {
        this.cj.d(cls, aVar);
        return this;
    }

    @NonNull
    public <TResource> Registry b(@NonNull Class<TResource> cls, @NonNull h<TResource> hVar) {
        this.cl.d(cls, hVar);
        return this;
    }

    @NonNull
    public <Data, TResource> Registry b(@NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull g<Data, TResource> gVar) {
        b(cf, cls, cls2, gVar);
        return this;
    }

    @NonNull
    public <Model, Data> Registry b(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<Model, Data> nVar) {
        this.ci.e(cls, cls2, nVar);
        return this;
    }

    @NonNull
    public <Data, TResource> Registry b(@NonNull String str, @NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull g<Data, TResource> gVar) {
        this.ck.b(str, gVar, cls, cls2);
        return this;
    }

    @NonNull
    public final Registry b(@NonNull List<String> list) {
        ArrayList arrayList = new ArrayList(list);
        arrayList.add(0, cf);
        arrayList.add(cg);
        this.ck.e(arrayList);
        return this;
    }

    @NonNull
    public <X> h<X> b(@NonNull p<X> pVar) throws NoResultEncoderAvailableException {
        h<X> o = this.cl.o(pVar.bG());
        if (o != null) {
            return o;
        }
        throw new NoResultEncoderAvailableException(pVar.bG());
    }

    @NonNull
    public <Data> Registry c(@NonNull Class<Data> cls, @NonNull com.bumptech.glide.load.a<Data> aVar) {
        this.cj.e(cls, aVar);
        return this;
    }

    @NonNull
    public <TResource> Registry c(@NonNull Class<TResource> cls, @NonNull h<TResource> hVar) {
        this.cl.e(cls, hVar);
        return this;
    }

    @NonNull
    public <Model, Data> Registry c(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        this.ci.f(cls, cls2, nVar);
        return this;
    }

    @NonNull
    public <Model, TResource, Transcode> List<Class<?>> c(@NonNull Class<Model> cls, @NonNull Class<TResource> cls2, @NonNull Class<Transcode> cls3) {
        List<Class<?>> g = this.cq.g(cls, cls2);
        if (g == null) {
            g = new ArrayList<>();
            for (Class i : this.ci.i(cls)) {
                for (Class cls4 : this.ck.i(i, cls2)) {
                    if (!this.cn.f(cls4, cls3).isEmpty() && !g.contains(cls4)) {
                        g.add(cls4);
                    }
                }
            }
            this.cq.a(cls, cls2, Collections.unmodifiableList(g));
        }
        return g;
    }

    @NonNull
    public <X> com.bumptech.glide.load.a<X> g(@NonNull X x) throws NoSourceEncoderAvailableException {
        com.bumptech.glide.load.a<X> n = this.cj.n(x.getClass());
        if (n != null) {
            return n;
        }
        throw new NoSourceEncoderAvailableException(x.getClass());
    }

    @NonNull
    public <X> com.bumptech.glide.load.a.e<X> h(@NonNull X x) {
        return this.cm.o(x);
    }

    @NonNull
    public <Model> List<m<Model, ?>> i(@NonNull Model model) {
        List<m<Model, ?>> i = this.ci.i(model);
        if (!i.isEmpty()) {
            return i;
        }
        throw new NoModelLoaderAvailableException(model);
    }
}
