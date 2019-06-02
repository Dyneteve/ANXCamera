package com.bumptech.glide.d;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.g;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* compiled from: ResourceDecoderRegistry */
public class e {
    private final List<String> nE = new ArrayList();
    private final Map<String, List<a<?, ?>>> nF = new HashMap();

    /* compiled from: ResourceDecoderRegistry */
    private static class a<T, R> {
        private final Class<T> dataClass;
        final Class<R> eT;
        final g<T, R> kB;

        public a(@NonNull Class<T> cls, @NonNull Class<R> cls2, g<T, R> gVar) {
            this.dataClass = cls;
            this.eT = cls2;
            this.kB = gVar;
        }

        public boolean d(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
            return this.dataClass.isAssignableFrom(cls) && cls2.isAssignableFrom(this.eT);
        }
    }

    @NonNull
    private synchronized List<a<?, ?>> E(@NonNull String str) {
        List<a<?, ?>> list;
        if (!this.nE.contains(str)) {
            this.nE.add(str);
        }
        list = (List) this.nF.get(str);
        if (list == null) {
            list = new ArrayList<>();
            this.nF.put(str, list);
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
        ArrayList<String> arrayList = new ArrayList<>(this.nE);
        this.nE.clear();
        this.nE.addAll(list);
        for (String str : arrayList) {
            if (!list.contains(str)) {
                this.nE.add(str);
            }
        }
    }

    @NonNull
    public synchronized <T, R> List<g<T, R>> h(@NonNull Class<T> cls, @NonNull Class<R> cls2) {
        ArrayList arrayList;
        arrayList = new ArrayList();
        for (String str : this.nE) {
            List<a> list = (List) this.nF.get(str);
            if (list != null) {
                for (a aVar : list) {
                    if (aVar.d(cls, cls2)) {
                        arrayList.add(aVar.kB);
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
        for (String str : this.nE) {
            List<a> list = (List) this.nF.get(str);
            if (list != null) {
                for (a aVar : list) {
                    if (aVar.d(cls, cls2) && !arrayList.contains(aVar.eT)) {
                        arrayList.add(aVar.eT);
                    }
                }
            }
        }
        return arrayList;
    }
}
