package com.bumptech.glide.load.engine.prefill;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* compiled from: PreFillQueue */
final class b {
    private final Map<c, Integer> jl;
    private final List<c> jm;
    private int jn;
    private int jo;

    public b(Map<c, Integer> map) {
        this.jl = map;
        this.jm = new ArrayList(map.keySet());
        for (Integer intValue : map.values()) {
            this.jn += intValue.intValue();
        }
    }

    public c bV() {
        c cVar = (c) this.jm.get(this.jo);
        Integer num = (Integer) this.jl.get(cVar);
        if (num.intValue() == 1) {
            this.jl.remove(cVar);
            this.jm.remove(this.jo);
        } else {
            this.jl.put(cVar, Integer.valueOf(num.intValue() - 1));
        }
        this.jn--;
        this.jo = this.jm.isEmpty() ? 0 : (this.jo + 1) % this.jm.size();
        return cVar;
    }

    public int getSize() {
        return this.jn;
    }

    public boolean isEmpty() {
        return this.jn == 0;
    }
}
