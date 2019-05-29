package com.bumptech.glide.load.a;

import android.support.annotation.NonNull;
import com.bumptech.glide.util.i;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/* compiled from: DataRewinderRegistry */
public class f {
    private static final com.bumptech.glide.load.a.e.a<?> dQ = new com.bumptech.glide.load.a.e.a<Object>() {
        @NonNull
        public Class<Object> aj() {
            throw new UnsupportedOperationException("Not implemented");
        }

        @NonNull
        public e<Object> l(@NonNull Object obj) {
            return new a(obj);
        }
    };
    private final Map<Class<?>, com.bumptech.glide.load.a.e.a<?>> dP = new HashMap();

    /* compiled from: DataRewinderRegistry */
    private static final class a implements e<Object> {
        private final Object data;

        a(@NonNull Object obj) {
            this.data = obj;
        }

        @NonNull
        public Object am() {
            return this.data;
        }

        public void cleanup() {
        }
    }

    public synchronized void b(@NonNull com.bumptech.glide.load.a.e.a<?> aVar) {
        this.dP.put(aVar.aj(), aVar);
    }

    @NonNull
    public synchronized <T> e<T> l(@NonNull T t) {
        com.bumptech.glide.load.a.e.a aVar;
        i.checkNotNull(t);
        aVar = (com.bumptech.glide.load.a.e.a) this.dP.get(t.getClass());
        if (aVar == null) {
            Iterator it = this.dP.values().iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                com.bumptech.glide.load.a.e.a aVar2 = (com.bumptech.glide.load.a.e.a) it.next();
                if (aVar2.aj().isAssignableFrom(t.getClass())) {
                    aVar = aVar2;
                    break;
                }
            }
        }
        if (aVar == null) {
            aVar = dQ;
        }
        return aVar.l(t);
    }
}
