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
    private static final int hE = 8;
    private final KeyPool hN = new KeyPool();
    private final NavigableMap<Integer, Integer> hO = new PrettyPrintTreeMap();
    private final g<Key, Bitmap> hg = new g<>();

    @VisibleForTesting
    static final class Key implements l {
        private final KeyPool hP;
        int size;

        Key(KeyPool keyPool) {
            this.hP = keyPool;
        }

        public void bm() {
            this.hP.a(this);
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
        Integer num2 = (Integer) this.hO.get(num);
        if (num2.intValue() == 1) {
            this.hO.remove(num);
        } else {
            this.hO.put(num, Integer.valueOf(num2.intValue() - 1));
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
        Key v = this.hN.v(i3);
        Integer num = (Integer) this.hO.ceilingKey(Integer.valueOf(i3));
        if (!(num == null || num.intValue() == i3 || num.intValue() > i3 * 8)) {
            this.hN.a(v);
            v = this.hN.v(num.intValue());
        }
        Bitmap bitmap = (Bitmap) this.hg.b(v);
        if (bitmap != null) {
            bitmap.reconfigure(i, i2, config);
            c(num);
        }
        return bitmap;
    }

    @Nullable
    public Bitmap bl() {
        Bitmap bitmap = (Bitmap) this.hg.removeLast();
        if (bitmap != null) {
            c(Integer.valueOf(k.p(bitmap)));
        }
        return bitmap;
    }

    public String c(int i, int i2, Config config) {
        return u(k.i(i, i2, config));
    }

    public void d(Bitmap bitmap) {
        Key v = this.hN.v(k.p(bitmap));
        this.hg.a(v, bitmap);
        Integer num = (Integer) this.hO.get(Integer.valueOf(v.size));
        NavigableMap<Integer, Integer> navigableMap = this.hO;
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
        sb.append(this.hg);
        sb.append("\n  SortedSizes");
        sb.append(this.hO);
        return sb.toString();
    }
}
