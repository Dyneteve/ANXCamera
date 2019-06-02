package com.bumptech.glide.load.engine.prefill;

import android.graphics.Bitmap.Config;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.util.i;

/* compiled from: PreFillType */
public final class c {
    @VisibleForTesting
    static final Config DEFAULT_CONFIG = Config.RGB_565;
    private final Config config;
    private final int height;
    private final int weight;
    private final int width;

    /* compiled from: PreFillType */
    public static class a {
        private Config config;
        private final int height;
        private int weight;
        private final int width;

        public a(int i) {
            this(i, i);
        }

        public a(int i, int i2) {
            this.weight = 1;
            if (i <= 0) {
                throw new IllegalArgumentException("Width must be > 0");
            } else if (i2 > 0) {
                this.width = i;
                this.height = i2;
            } else {
                throw new IllegalArgumentException("Height must be > 0");
            }
        }

        /* access modifiers changed from: 0000 */
        public c bW() {
            return new c(this.width, this.height, this.config, this.weight);
        }

        public a e(@Nullable Config config2) {
            this.config = config2;
            return this;
        }

        /* access modifiers changed from: 0000 */
        public Config getConfig() {
            return this.config;
        }

        public a y(int i) {
            if (i > 0) {
                this.weight = i;
                return this;
            }
            throw new IllegalArgumentException("Weight must be > 0");
        }
    }

    c(int i, int i2, Config config2, int i3) {
        this.config = (Config) i.a(config2, "Config must not be null");
        this.width = i;
        this.height = i2;
        this.weight = i3;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        if (this.height == cVar.height && this.width == cVar.width && this.weight == cVar.weight && this.config == cVar.config) {
            z = true;
        }
        return z;
    }

    /* access modifiers changed from: 0000 */
    public Config getConfig() {
        return this.config;
    }

    /* access modifiers changed from: 0000 */
    public int getHeight() {
        return this.height;
    }

    /* access modifiers changed from: 0000 */
    public int getWeight() {
        return this.weight;
    }

    /* access modifiers changed from: 0000 */
    public int getWidth() {
        return this.width;
    }

    public int hashCode() {
        return (31 * ((((this.width * 31) + this.height) * 31) + this.config.hashCode())) + this.weight;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("PreFillSize{width=");
        sb.append(this.width);
        sb.append(", height=");
        sb.append(this.height);
        sb.append(", config=");
        sb.append(this.config);
        sb.append(", weight=");
        sb.append(this.weight);
        sb.append('}');
        return sb.toString();
    }
}
