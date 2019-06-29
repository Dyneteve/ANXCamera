package com.google.zxing.pdf417.decoder;

import com.google.zxing.pdf417.PDF417Common;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

final class BarcodeValue {
    private final Map<Integer, Integer> values = new HashMap();

    BarcodeValue() {
    }

    public Integer getConfidence(int i) {
        return (Integer) this.values.get(Integer.valueOf(i));
    }

    /* access modifiers changed from: 0000 */
    public int[] getValue() {
        int i = -1;
        ArrayList arrayList = new ArrayList();
        for (Entry entry : this.values.entrySet()) {
            if (((Integer) entry.getValue()).intValue() > i) {
                i = ((Integer) entry.getValue()).intValue();
                arrayList.clear();
                arrayList.add((Integer) entry.getKey());
            } else if (((Integer) entry.getValue()).intValue() == i) {
                arrayList.add((Integer) entry.getKey());
            }
        }
        return PDF417Common.toIntArray(arrayList);
    }

    /* access modifiers changed from: 0000 */
    public void setValue(int i) {
        Integer num = (Integer) this.values.get(Integer.valueOf(i));
        if (num == null) {
            num = Integer.valueOf(0);
        }
        this.values.put(Integer.valueOf(i), Integer.valueOf(num.intValue() + 1));
    }
}
