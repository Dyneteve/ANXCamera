package com.bumptech.glide.load.engine.bitmap_recycle;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.util.k;

class AttributeStrategy implements k {
    private final KeyPool he = new KeyPool();
    private final g<Key, Bitmap> hf = new g<>();

    @VisibleForTesting
    static class Key implements l {
        private Config config;
        private int height;
        private final KeyPool hg;
        private int width;

        public Key(KeyPool keyPool) {
            this.hg = keyPool;
        }

        public void bm() {
            this.hg.a(this);
        }

        public void e(int i, int i2, Config config2) {
            this.width = i;
            this.height = i2;
            this.config = config2;
        }

        public boolean equals(Object obj) {
            boolean z = false;
            if (!(obj instanceof Key)) {
                return false;
            }
            Key key = (Key) obj;
            if (this.width == key.width && this.height == key.height && this.config == key.config) {
                z = true;
            }
            return z;
        }

        public int hashCode() {
            return (31 * ((this.width * 31) + this.height)) + (this.config != null ? this.config.hashCode() : 0);
        }

        public String toString() {
            return AttributeStrategy.d(this.width, this.height, this.config);
        }
    }

    @VisibleForTesting
    static class KeyPool extends c<Key> {
        KeyPool() {
        }

        /* access modifiers changed from: protected */
        /* renamed from: bn */
        public Key bo() {
            return new Key(this);
        }

        /* access modifiers changed from: 0000 */
        public Key f(int i, int i2, Config config) {
            Key key = (Key) bp();
            key.e(i, i2, config);
            return key;
        }
    }

    AttributeStrategy() {
    }

    static String d(int i, int i2, Config config) {
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(i);
        sb.append("x");
        sb.append(i2);
        sb.append("], ");
        sb.append(config);
        return sb.toString();
    }

    private static String g(Bitmap bitmap) {
        return d(bitmap.getWidth(), bitmap.getHeight(), bitmap.getConfig());
    }

    public Bitmap b(int i, int i2, Config config) {
        return (Bitmap) this.hf.b(this.he.f(i, i2, config));
    }

    public Bitmap bl() {
        return (Bitmap) this.hf.removeLast();
    }

    public String c(int i, int i2, Config config) {
        return d(i, i2, config);
    }

    public void d(Bitmap bitmap) {
        this.hf.a(this.he.f(bitmap.getWidth(), bitmap.getHeight(), bitmap.getConfig()), bitmap);
    }

    public String e(Bitmap bitmap) {
        return g(bitmap);
    }

    public int f(Bitmap bitmap) {
        return k.p(bitmap);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("AttributeStrategy:\n  ");
        sb.append(this.hf);
        return sb.toString();
    }
}
