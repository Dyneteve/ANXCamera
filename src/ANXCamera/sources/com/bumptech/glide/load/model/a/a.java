package com.bumptech.glide.load.model.a;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.model.ModelCache;
import com.bumptech.glide.load.model.g;
import com.bumptech.glide.load.model.h;
import com.bumptech.glide.load.model.m;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/* compiled from: BaseGlideUrlLoader */
public abstract class a<Model> implements m<Model, InputStream> {
    private final m<g, InputStream> ku;
    @Nullable
    private final ModelCache<Model, g> kv;

    protected a(m<g, InputStream> mVar) {
        this(mVar, null);
    }

    protected a(m<g, InputStream> mVar, @Nullable ModelCache<Model, g> modelCache) {
        this.ku = mVar;
        this.kv = modelCache;
    }

    private static List<c> a(Collection<String> collection) {
        ArrayList arrayList = new ArrayList(collection.size());
        for (String gVar : collection) {
            arrayList.add(new g(gVar));
        }
        return arrayList;
    }

    @Nullable
    public com.bumptech.glide.load.model.m.a<InputStream> b(@NonNull Model model, int i, int i2, @NonNull f fVar) {
        Object obj = this.kv != null ? (g) this.kv.c(model, i, i2) : null;
        if (obj == null) {
            String c = c(model, i, i2, fVar);
            if (TextUtils.isEmpty(c)) {
                return null;
            }
            g gVar = new g(c, e(model, i, i2, fVar));
            if (this.kv != null) {
                this.kv.a(model, i, i2, gVar);
            }
            obj = gVar;
        }
        List d = d(model, i, i2, fVar);
        com.bumptech.glide.load.model.m.a<InputStream> b = this.ku.b(obj, i, i2, fVar);
        return (b == null || d.isEmpty()) ? b : new com.bumptech.glide.load.model.m.a<>(b.eI, a(d), b.jX);
    }

    public abstract String c(Model model, int i, int i2, f fVar);

    /* access modifiers changed from: protected */
    public List<String> d(Model model, int i, int i2, f fVar) {
        return Collections.emptyList();
    }

    /* access modifiers changed from: protected */
    @Nullable
    public h e(Model model, int i, int i2, f fVar) {
        return h.jM;
    }
}
