package com.bumptech.glide.load.engine.prefill;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* compiled from: PreFillQueue */
final class b {
    private final Map<c, Integer> jk;
    private final List<c> jl;
    private int jm;
    private int jn;

    public b(Map<c, Integer> map) {
        this.jk = map;
        this.jl = new ArrayList(map.keySet());
        for (Integer intValue : map.values()) {
            this.jm += intValue.intValue();
        }
    }

    public c bV() {
        c cVar = (c) this.jl.get(this.jn);
        Integer num = (Integer) this.jk.get(cVar);
        if (num.intValue() == 1) {
            this.jk.remove(cVar);
            this.jl.remove(this.jn);
        } else {
            this.jk.put(cVar, Integer.valueOf(num.intValue() - 1));
        }
        this.jm--;
        this.jn = this.jl.isEmpty() ? 0 : (this.jn + 1) % this.jl.size();
        return cVar;
    }

    public int getSize() {
        return this.jm;
    }

    public boolean isEmpty() {
        return this.jm == 0;
    }
}
