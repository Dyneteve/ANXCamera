package com.bumptech.glide.util.a;

import android.support.annotation.NonNull;

/* compiled from: StateVerifier */
public abstract class c {
    private static final boolean DEBUG = false;

    /* compiled from: StateVerifier */
    private static class a extends c {
        private volatile RuntimeException qm;

        a() {
            super();
        }

        public void eT() {
            if (this.qm != null) {
                throw new IllegalStateException("Already released", this.qm);
            }
        }

        /* access modifiers changed from: 0000 */
        public void o(boolean z) {
            if (z) {
                this.qm = new RuntimeException("Released");
            } else {
                this.qm = null;
            }
        }
    }

    /* compiled from: StateVerifier */
    private static class b extends c {
        private volatile boolean fB;

        b() {
            super();
        }

        public void eT() {
            if (this.fB) {
                throw new IllegalStateException("Already released");
            }
        }

        public void o(boolean z) {
            this.fB = z;
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
