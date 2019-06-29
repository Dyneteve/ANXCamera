package com.bumptech.glide.util.a;

import android.support.annotation.NonNull;

/* compiled from: StateVerifier */
public abstract class c {
    private static final boolean DEBUG = false;

    /* compiled from: StateVerifier */
    private static class a extends c {
        private volatile RuntimeException rm;

        a() {
            super();
        }

        public void fv() {
            if (this.rm != null) {
                throw new IllegalStateException("Already released", this.rm);
            }
        }

        /* access modifiers changed from: 0000 */
        public void o(boolean z) {
            if (z) {
                this.rm = new RuntimeException("Released");
            } else {
                this.rm = null;
            }
        }
    }

    /* compiled from: StateVerifier */
    private static class b extends c {
        private volatile boolean gC;

        b() {
            super();
        }

        public void fv() {
            if (this.gC) {
                throw new IllegalStateException("Already released");
            }
        }

        public void o(boolean z) {
            this.gC = z;
        }
    }

    private c() {
    }

    @NonNull
    public static c fu() {
        return new b();
    }

    public abstract void fv();

    /* access modifiers changed from: 0000 */
    public abstract void o(boolean z);
}
