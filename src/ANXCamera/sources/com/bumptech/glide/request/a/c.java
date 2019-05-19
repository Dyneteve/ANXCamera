package com.bumptech.glide.request.a;

import android.graphics.drawable.Drawable;
import com.bumptech.glide.load.DataSource;

/* compiled from: DrawableCrossFadeFactory */
public class c implements g<Drawable> {
    private final int duration;
    private d pA;
    private final boolean pz;

    /* compiled from: DrawableCrossFadeFactory */
    public static class a {
        private static final int pB = 300;
        private final int durationMillis;
        private boolean pz;

        public a() {
            this(300);
        }

        public a(int i) {
            this.durationMillis = i;
        }

        public c eE() {
            return new c(this.durationMillis, this.pz);
        }

        public a n(boolean z) {
            this.pz = z;
            return this;
        }
    }

    protected c(int i, boolean z) {
        this.duration = i;
        this.pz = z;
    }

    private f<Drawable> eD() {
        if (this.pA == null) {
            this.pA = new d(this.duration, this.pz);
        }
        return this.pA;
    }

    public f<Drawable> a(DataSource dataSource, boolean z) {
        return dataSource == DataSource.MEMORY_CACHE ? e.eG() : eD();
    }
}
