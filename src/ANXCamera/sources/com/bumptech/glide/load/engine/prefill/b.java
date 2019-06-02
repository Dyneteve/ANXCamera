package com.bumptech.glide.load.engine.prefill;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* compiled from: PreFillQueue */
final class b {
    private final Map<c, Integer> jm;
    private final List<c> jn;
    private int jo;
    private int jp;

    public b(Map<c, Integer> map) {
        this.jm = map;
        this.jn = new ArrayList(map.keySet());
        for (Integer intValue : map.values()) {
            this.jo += intValue.intValue();
        }
    }

    public c bV() {
        c cVar = (c) this.jn.get(this.jp);
        Integer num = (Integer) this.jm.get(cVar);
        if (num.intValue() == 1) {
            this.jm.remove(cVar);
            this.jn.remove(this.jp);
        } else {
            this.jm.put(cVar, Integer.valueOf(num.intValue() - 1));
        }
        this.jo--;
        this.jp = this.jn.isEmpty() ? 0 : (this.jp + 1) % this.jn.size();
        return cVar;
    }

    public int getSize() {
        return this.jo;
    }

    public boolean isEmpty() {
        return this.jo == 0;
    }
}
