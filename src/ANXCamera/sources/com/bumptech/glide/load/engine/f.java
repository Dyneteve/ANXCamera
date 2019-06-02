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
    private final List<? extends g<DataType, ResourceType>> fQ;
    private final e<ResourceType, Transcode> fR;
    private final Pool<List<Throwable>> fS;
    private final String fT;

    /* compiled from: DecodePath */
    interface a<ResourceType> {
        @NonNull
        p<ResourceType> c(@NonNull p<ResourceType> pVar);
    }

    public f(Class<DataType> cls, Class<ResourceType> cls2, Class<Transcode> cls3, List<? extends g<DataType, ResourceType>> list, e<ResourceType, Transcode> eVar, Pool<List<Throwable>> pool) {
        this.dataClass = cls;
        this.fQ = list;
        this.fR = eVar;
        this.fS = pool;
        StringBuilder sb = new StringBuilder();
        sb.append("Failed DecodePath{");
        sb.append(cls.getSimpleName());
        sb.append("->");
        sb.append(cls2.getSimpleName());
        sb.append("->");
        sb.append(cls3.getSimpleName());
        sb.append("}");
        this.fT = sb.toString();
    }

    @NonNull
    private p<ResourceType> a(com.bumptech.glide.load.a.e<DataType> eVar, int i, int i2, @NonNull com.bumptech.glide.load.f fVar) throws GlideException {
        List list = (List) i.checkNotNull(this.fS.acquire());
        try {
            p<ResourceType> a2 = a(eVar, i, i2, fVar, list);
            return a2;
        } finally {
            this.fS.release(list);
        }
    }

    @NonNull
    private p<ResourceType> a(com.bumptech.glide.load.a.e<DataType> eVar, int i, int i2, @NonNull com.bumptech.glide.load.f fVar, List<Throwable> list) throws GlideException {
        p<ResourceType> pVar;
        int size = this.fQ.size();
        p<ResourceType> pVar2 = null;
        for (int i3 = 0; i3 < size; i3++) {
            g gVar = (g) this.fQ.get(i3);
            try {
                if (gVar.a(eVar.am(), fVar)) {
                    pVar2 = gVar.a(eVar.am(), i, i2, fVar);
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
            if (pVar2 != null) {
                break;
            }
        }
        if (pVar != null) {
            return pVar;
        }
        throw new GlideException(this.fT, (List<Throwable>) new ArrayList<Throwable>(list));
    }

    public p<Transcode> a(com.bumptech.glide.load.a.e<DataType> eVar, int i, int i2, @NonNull com.bumptech.glide.load.f fVar, a<ResourceType> aVar) throws GlideException {
        return this.fR.a(aVar.c(a(eVar, i, i2, fVar)), fVar);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("DecodePath{ dataClass=");
        sb.append(this.dataClass);
        sb.append(", decoders=");
        sb.append(this.fQ);
        sb.append(", transcoder=");
        sb.append(this.fR);
        sb.append('}');
        return sb.toString();
    }
}
