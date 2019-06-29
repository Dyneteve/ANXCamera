package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import android.support.v4.util.Pools.Pool;
import com.bumptech.glide.load.a.e;
import com.bumptech.glide.load.f;
import com.bumptech.glide.util.i;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* compiled from: LoadPath */
public class n<Data, ResourceType, Transcode> {
    private final Class<Data> dataClass;
    private final Pool<List<Throwable>> gS;
    private final String gT;
    private final List<? extends f<Data, ResourceType, Transcode>> hQ;

    public n(Class<Data> cls, Class<ResourceType> cls2, Class<Transcode> cls3, List<f<Data, ResourceType, Transcode>> list, Pool<List<Throwable>> pool) {
        this.dataClass = cls;
        this.gS = pool;
        this.hQ = (List) i.b(list);
        StringBuilder sb = new StringBuilder();
        sb.append("Failed LoadPath{");
        sb.append(cls.getSimpleName());
        sb.append("->");
        sb.append(cls2.getSimpleName());
        sb.append("->");
        sb.append(cls3.getSimpleName());
        sb.append("}");
        this.gT = sb.toString();
    }

    private p<Transcode> a(e<Data> eVar, @NonNull f fVar, int i, int i2, a<ResourceType> aVar, List<Throwable> list) throws GlideException {
        List<Throwable> list2 = list;
        int size = this.hQ.size();
        p<Transcode> pVar = null;
        for (int i3 = 0; i3 < size; i3++) {
            try {
                pVar = ((f) this.hQ.get(i3)).a(eVar, i, i2, fVar, aVar);
            } catch (GlideException e) {
                list2.add(e);
            }
            if (pVar != null) {
                break;
            }
        }
        if (pVar != null) {
            return pVar;
        }
        throw new GlideException(this.gT, (List<Throwable>) new ArrayList<Throwable>(list2));
    }

    public p<Transcode> a(e<Data> eVar, @NonNull f fVar, int i, int i2, a<ResourceType> aVar) throws GlideException {
        List list = (List) i.checkNotNull(this.gS.acquire());
        try {
            p<Transcode> a = a(eVar, fVar, i, i2, aVar, list);
            return a;
        } finally {
            this.gS.release(list);
        }
    }

    public Class<Data> aJ() {
        return this.dataClass;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("LoadPath{decodePaths=");
        sb.append(Arrays.toString(this.hQ.toArray()));
        sb.append('}');
        return sb.toString();
    }
}
