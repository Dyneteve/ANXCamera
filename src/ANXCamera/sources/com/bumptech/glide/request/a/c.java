package com.bumptech.glide.request.a;

import android.graphics.drawable.Drawable;
import com.bumptech.glide.load.DataSource;

/* compiled from: DrawableCrossFadeFactory */
public class c implements g<Drawable> {
    private final int duration;
    private final boolean qC;
    private d qD;

    /* compiled from: DrawableCrossFadeFactory */
    public static class a {
        private static final int qE = 300;
        private final int durationMillis;
        private boolean qC;

        public a() {
            this(300);
        }

        public a(int i) {
            this.durationMillis = i;
        }

        public c fg() {
            return new c(this.durationMillis, this.qC);
        }

        public a n(boolean z) {
            this.qC = z;
            return this;
        }
    }

    protected c(int i, boolean z) {
        this.duration = i;
        this.qC = z;
    }

    private f<Drawable> ff() {
        if (this.qD == null) {
            this.qD = new d(this.duration, this.qC);
        }
        return this.qD;
    }

    public f<Drawable> a(DataSource dataSource, boolean z) {
        return dataSource == DataSource.MEMORY_CACHE ? e.fi() : ff();
    }
}
