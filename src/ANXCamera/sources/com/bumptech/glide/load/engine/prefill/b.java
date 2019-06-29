package com.bumptech.glide.load.engine.prefill;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* compiled from: PreFillQueue */
final class b {
    private final Map<c, Integer> km;
    private final List<c> kn;
    private int ko;
    private int kp;

    public b(Map<c, Integer> map) {
        this.km = map;
        this.kn = new ArrayList(map.keySet());
        for (Integer intValue : map.values()) {
            this.ko += intValue.intValue();
        }
    }

    public c cy() {
        c cVar = (c) this.kn.get(this.kp);
        Integer num = (Integer) this.km.get(cVar);
        if (num.intValue() == 1) {
            this.km.remove(cVar);
            this.kn.remove(this.kp);
        } else {
            this.km.put(cVar, Integer.valueOf(num.intValue() - 1));
        }
        this.ko--;
        this.kp = this.kn.isEmpty() ? 0 : (this.kp + 1) % this.kn.size();
        return cVar;
    }

    public int getSize() {
        return this.ko;
    }

    public boolean isEmpty() {
        return this.ko == 0;
    }
}
