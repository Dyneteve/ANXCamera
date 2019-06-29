package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import android.support.v4.util.Pools.Pool;
import android.util.Log;
import com.bumptech.glide.load.g;
import com.bumptech.glide.load.resource.d.e;
import com.bumptech.glide.util.i;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/* compiled from: DecodePath */
public class f<DataType, ResourceType, Transcode> {
    private static final String TAG = "DecodePath";
    private final Class<DataType> dataClass;
    private final List<? extends g<DataType, ResourceType>> gQ;
    private final e<ResourceType, Transcode> gR;
    private final Pool<List<Throwable>> gS;
    private final String gT;

    /* compiled from: DecodePath */
    interface a<ResourceType> {
        @NonNull
        p<ResourceType> c(@NonNull p<ResourceType> pVar);
    }

    public f(Class<DataType> cls, Class<ResourceType> cls2, Class<Transcode> cls3, List<? extends g<DataType, ResourceType>> list, e<ResourceType, Transcode> eVar, Pool<List<Throwable>> pool) {
        this.dataClass = cls;
        this.gQ = list;
        this.gR = eVar;
        this.gS = pool;
        StringBuilder sb = new StringBuilder();
        sb.append("Failed DecodePath{");
        sb.append(cls.getSimpleName());
        sb.append("->");
        sb.append(cls2.getSimpleName());
        sb.append("->");
        sb.append(cls3.getSimpleName());
        sb.append("}");
        this.gT = sb.toString();
    }

    @NonNull
    private p<ResourceType> a(com.bumptech.glide.load.a.e<DataType> eVar, int i, int i2, @NonNull com.bumptech.glide.load.f fVar) throws GlideException {
        List list = (List) i.checkNotNull(this.gS.acquire());
        try {
            p<ResourceType> a2 = a(eVar, i, i2, fVar, list);
            return a2;
        } finally {
            this.gS.release(list);
        }
    }

    @NonNull
    private p<ResourceType> a(com.bumptech.glide.load.a.e<DataType> eVar, int i, int i2, @NonNull com.bumptech.glide.load.f fVar, List<Throwable> list) throws GlideException {
        int size = this.gQ.size();
        p<ResourceType> pVar = null;
        for (int i3 = 0; i3 < size; i3++) {
            g gVar = (g) this.gQ.get(i3);
            try {
                if (gVar.a(eVar.aM(), fVar)) {
                    pVar = gVar.a(eVar.aM(), i, i2, fVar);
                }
            } catch (IOException | OutOfMemoryError | RuntimeException e) {
                if (Log.isLoggable(TAG, 2)) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Failed to decode data for ");
                    sb.append(gVar);
                    Log.v(str, sb.toString(), e);
                }
                list.add(e);
            }
            if (pVar != null) {
                break;
            }
        }
        if (pVar != null) {
            return pVar;
        }
        throw new GlideException(this.gT, (List<Throwable>) new ArrayList<Throwable>(list));
    }

    public p<Transcode> a(com.bumptech.glide.load.a.e<DataType> eVar, int i, int i2, @NonNull com.bumptech.glide.load.f fVar, a<ResourceType> aVar) throws GlideException {
        return this.gR.a(aVar.c(a(eVar, i, i2, fVar)), fVar);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("DecodePath{ dataClass=");
        sb.append(this.dataClass);
        sb.append(", decoders=");
        sb.append(this.gQ);
        sb.append(", transcoder=");
        sb.append(this.gR);
        sb.append('}');
        return sb.toString();
    }
}
