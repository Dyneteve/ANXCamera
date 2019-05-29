package com.bumptech.glide.d;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.g;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* compiled from: ResourceDecoderRegistry */
public class e {
    private final List<String> nD = new ArrayList();
    private final Map<String, List<a<?, ?>>> nE = new HashMap();

    /* compiled from: ResourceDecoderRegistry */
    private static class a<T, R> {
        private final Class<T> dataClass;
        final Class<R> eS;
        final g<T, R> kA;

        public a(@NonNull Class<T> cls, @NonNull Class<R> cls2, g<T, R> gVar) {
            this.dataClass = cls;
            this.eS = cls2;
            this.kA = gVar;
        }

        public boolean d(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
            return this.dataClass.isAssignableFrom(cls) && cls2.isAssignableFrom(this.eS);
        }
    }

    @NonNull
    private synchronized List<a<?, ?>> E(@NonNull String str) {
        List<a<?, ?>> list;
        if (!this.nD.contains(str)) {
            this.nD.add(str);
        }
        list = (List) this.nE.get(str);
        if (list == null) {
            list = new ArrayList<>();
            this.nE.put(str, list);
        }
        return list;
    }

    public synchronized <T, R> void a(@NonNull String str, @NonNull g<T, R> gVar, @NonNull Class<T> cls, @NonNull Class<R> cls2) {
        E(str).add(new a(cls, cls2, gVar));
    }

    public synchronized <T, R> void b(@NonNull String str, @NonNull g<T, R> gVar, @NonNull Class<T> cls, @NonNull Class<R> cls2) {
        E(str).add(0, new a(cls, cls2, gVar));
    }

    public synchronized void e(@NonNull List<String> list) {
        ArrayList<String> arrayList = new ArrayList<>(this.nD);
        this.nD.clear();
        this.nD.addAll(list);
        for (String str : arrayList) {
            if (!list.contains(str)) {
                this.nD.add(str);
            }
        }
    }

    @NonNull
    public synchronized <T, R> List<g<T, R>> h(@NonNull Class<T> cls, @NonNull Class<R> cls2) {
        ArrayList arrayList;
        arrayList = new ArrayList();
        for (String str : this.nD) {
            List<a> list = (List) this.nE.get(str);
            if (list != null) {
                for (a aVar : list) {
                    if (aVar.d(cls, cls2)) {
                        arrayList.add(aVar.kA);
                    }
                }
            }
        }
        return arrayList;
    }

    @NonNull
    public synchronized <T, R> List<Class<R>> i(@NonNull Class<T> cls, @NonNull Class<R> cls2) {
        ArrayList arrayList;
        arrayList = new ArrayList();
        for (String str : this.nD) {
            List<a> list = (List) this.nE.get(str);
            if (list != null) {
                for (a aVar : list) {
                    if (aVar.d(cls, cls2) && !arrayList.contains(aVar.eS)) {
                        arrayList.add(aVar.eS);
                    }
                }
            }
        }
        return arrayList;
    }
}
