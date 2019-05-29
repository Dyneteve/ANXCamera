package com.bumptech.glide.request.a;

import android.graphics.drawable.Drawable;
import com.bumptech.glide.load.DataSource;

/* compiled from: DrawableCrossFadeFactory */
public class c implements g<Drawable> {
    private final int duration;
    private final boolean pA;
    private d pB;

    /* compiled from: DrawableCrossFadeFactory */
    public static class a {
        private static final int pC = 300;
        private final int durationMillis;
        private boolean pA;

        public a() {
            this(300);
        }

        public a(int i) {
            this.durationMillis = i;
        }

        public c eE() {
            return new c(this.durationMillis, this.pA);
        }

        public a n(boolean z) {
            this.pA = z;
            return this;
        }
    }

    protected c(int i, boolean z) {
        this.duration = i;
        this.pA = z;
    }

    private f<Drawable> eD() {
        if (this.pB == null) {
            this.pB = new d(this.duration, this.pA);
        }
        return this.pB;
    }

    public f<Drawable> a(DataSource dataSource, boolean z) {
        return dataSource == DataSource.MEMORY_CACHE ? e.eG() : eD();
    }
}
