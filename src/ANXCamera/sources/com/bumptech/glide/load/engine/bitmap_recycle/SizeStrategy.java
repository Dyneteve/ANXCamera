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
    private static final int iM = 8;
    private final KeyPool iV = new KeyPool();
    private final NavigableMap<Integer, Integer> iW = new PrettyPrintTreeMap();
    private final g<Key, Bitmap> ii = new g<>();

    @VisibleForTesting
    static final class Key implements l {
        private final KeyPool iX;
        int size;

        Key(KeyPool keyPool) {
            this.iX = keyPool;
        }

        public void bN() {
            this.iX.a(this);
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
            return SizeStrategy.y(this.size);
        }
    }

    @VisibleForTesting
    static class KeyPool extends c<Key> {
        KeyPool() {
        }

        /* access modifiers changed from: protected */
        /* renamed from: bZ */
        public Key bP() {
            return new Key(this);
        }

        public Key z(int i) {
            Key key = (Key) super.bQ();
            key.init(i);
            return key;
        }
    }

    SizeStrategy() {
    }

    private void c(Integer num) {
        Integer num2 = (Integer) this.iW.get(num);
        if (num2.intValue() == 1) {
            this.iW.remove(num);
        } else {
            this.iW.put(num, Integer.valueOf(num2.intValue() - 1));
        }
    }

    private static String g(Bitmap bitmap) {
        return y(k.p(bitmap));
    }

    static String y(int i) {
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(i);
        sb.append("]");
        return sb.toString();
    }

    @Nullable
    public Bitmap b(int i, int i2, Config config) {
        int i3 = k.i(i, i2, config);
        Key z = this.iV.z(i3);
        Integer num = (Integer) this.iW.ceilingKey(Integer.valueOf(i3));
        if (!(num == null || num.intValue() == i3 || num.intValue() > i3 * 8)) {
            this.iV.a(z);
            z = this.iV.z(num.intValue());
        }
        Bitmap bitmap = (Bitmap) this.ii.b(z);
        if (bitmap != null) {
            bitmap.reconfigure(i, i2, config);
            c(num);
        }
        return bitmap;
    }

    @Nullable
    public Bitmap bM() {
        Bitmap bitmap = (Bitmap) this.ii.removeLast();
        if (bitmap != null) {
            c(Integer.valueOf(k.p(bitmap)));
        }
        return bitmap;
    }

    public String c(int i, int i2, Config config) {
        return y(k.i(i, i2, config));
    }

    public void d(Bitmap bitmap) {
        Key z = this.iV.z(k.p(bitmap));
        this.ii.a(z, bitmap);
        Integer num = (Integer) this.iW.get(Integer.valueOf(z.size));
        NavigableMap<Integer, Integer> navigableMap = this.iW;
        Integer valueOf = Integer.valueOf(z.size);
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
        sb.append(this.ii);
        sb.append("\n  SortedSizes");
        sb.append(this.iW);
        return sb.toString();
    }
}
