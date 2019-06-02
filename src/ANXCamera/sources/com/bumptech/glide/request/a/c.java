package com.bumptech.glide.request.a;

import android.graphics.drawable.Drawable;
import com.bumptech.glide.load.DataSource;

/* compiled from: DrawableCrossFadeFactory */
public class c implements g<Drawable> {
    private final int duration;
    private final boolean pB;
    private d pC;

    /* compiled from: DrawableCrossFadeFactory */
    public static class a {
        private static final int pD = 300;
        private final int durationMillis;
        private boolean pB;

        public a() {
            this(300);
        }

        public a(int i) {
            this.durationMillis = i;
        }

        public c eE() {
            return new c(this.durationMillis, this.pB);
        }

        public a n(boolean z) {
            this.pB = z;
            return this;
        }
    }

    protected c(int i, boolean z) {
        this.duration = i;
        this.pB = z;
    }

    private f<Drawable> eD() {
        if (this.pC == null) {
            this.pC = new d(this.duration, this.pB);
        }
        return this.pC;
    }

    public f<Drawable> a(DataSource dataSource, boolean z) {
        return dataSource == DataSource.MEMORY_CACHE ? e.eG() : eD();
    }
}
