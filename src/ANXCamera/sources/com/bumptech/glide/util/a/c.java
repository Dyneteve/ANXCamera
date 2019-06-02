package com.bumptech.glide.util.a;

import android.support.annotation.NonNull;

/* compiled from: StateVerifier */
public abstract class c {
    private static final boolean DEBUG = false;

    /* compiled from: StateVerifier */
    private static class a extends c {
        private volatile RuntimeException qn;

        a() {
            super();
        }

        public void eT() {
            if (this.qn != null) {
                throw new IllegalStateException("Already released", this.qn);
            }
        }

        /* access modifiers changed from: 0000 */
        public void o(boolean z) {
            if (z) {
                this.qn = new RuntimeException("Released");
            } else {
                this.qn = null;
            }
        }
    }

    /* compiled from: StateVerifier */
    private static class b extends c {
        private volatile boolean fC;

        b() {
            super();
        }

        public void eT() {
            if (this.fC) {
                throw new IllegalStateException("Already released");
            }
        }

        public void o(boolean z) {
            this.fC = z;
        }
    }

    private c() {
    }

    @NonNull
    public static c eS() {
        return new b();
    }

    public abstract void eT();

    public abstract void o(boolean z);
}
