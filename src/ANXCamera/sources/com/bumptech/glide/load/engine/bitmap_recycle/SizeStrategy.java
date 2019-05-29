package com.bumptech.glide.load.engine.bitmap_recycle;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.support.annotation.Nullable;
import android.support.annotation.RequiresApi;
import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.util.k;
import java.util.NavigableMap;

@RequiresApi(19)
final class SizeStrategy implements k {
    private static final int hD = 8;
    private final KeyPool hM = new KeyPool();
    private final NavigableMap<Integer, Integer> hN = new PrettyPrintTreeMap();
    private final g<Key, Bitmap> hf = new g<>();

    @VisibleForTesting
    static final class Key implements l {
        private final KeyPool hO;
        int size;

        Key(KeyPool keyPool) {
            this.hO = keyPool;
        }

        public void bm() {
            this.hO.a(this);
        }

        public boolean equals(Object obj) {
            boolean z = false;
            if (!(obj instanceof Key)) {
                return false;
            }
            if (this.size == ((Key) obj).size) {
                z = true;
            }
            return z;
        }

        public int hashCode() {
            return this.size;
        }

        public void init(int i) {
            this.size = i;
        }

        public String toString() {
            return SizeStrategy.u(this.size);
        }
    }

    @VisibleForTesting
    static class KeyPool extends c<Key> {
        KeyPool() {
        }

        /* access modifiers changed from: protected */
        /* renamed from: by */
        public Key bo() {
            return new Key(this);
        }

        public Key v(int i) {
            Key key = (Key) super.bp();
            key.init(i);
            return key;
        }
    }

    SizeStrategy() {
    }

    private void c(Integer num) {
        Integer num2 = (Integer) this.hN.get(num);
        if (num2.intValue() == 1) {
            this.hN.remove(num);
        } else {
            this.hN.put(num, Integer.valueOf(num2.intValue() - 1));
        }
    }

    private static String g(Bitmap bitmap) {
        return u(k.p(bitmap));
    }

    static String u(int i) {
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(i);
        sb.append("]");
        return sb.toString();
    }

    @Nullable
    public Bitmap b(int i, int i2, Config config) {
        int i3 = k.i(i, i2, config);
        Key v = this.hM.v(i3);
        Integer num = (Integer) this.hN.ceilingKey(Integer.valueOf(i3));
        if (!(num == null || num.intValue() == i3 || num.intValue() > i3 * 8)) {
            this.hM.a(v);
            v = this.hM.v(num.intValue());
        }
        Bitmap bitmap = (Bitmap) this.hf.b(v);
        if (bitmap != null) {
            bitmap.reconfigure(i, i2, config);
            c(num);
        }
        return bitmap;
    }

    @Nullable
    public Bitmap bl() {
        Bitmap bitmap = (Bitmap) this.hf.removeLast();
        if (bitmap != null) {
            c(Integer.valueOf(k.p(bitmap)));
        }
        return bitmap;
    }

    public String c(int i, int i2, Config config) {
        return u(k.i(i, i2, config));
    }

    public void d(Bitmap bitmap) {
        Key v = this.hM.v(k.p(bitmap));
        this.hf.a(v, bitmap);
        Integer num = (Integer) this.hN.get(Integer.valueOf(v.size));
        NavigableMap<Integer, Integer> navigableMap = this.hN;
        Integer valueOf = Integer.valueOf(v.size);
        int i = 1;
        if (num != null) {
            i = 1 + num.intValue();
        }
        navigableMap.put(valueOf, Integer.valueOf(i));
    }

    public String e(Bitmap bitmap) {
        return g(bitmap);
    }

    public int f(Bitmap bitmap) {
        return k.p(bitmap);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("SizeStrategy:\n  ");
        sb.append(this.hf);
        sb.append("\n  SortedSizes");
        sb.append(this.hN);
        return sb.toString();
    }
}
