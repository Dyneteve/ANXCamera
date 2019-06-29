package com.android.camera2.vendortag;

import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

public abstract class VendorTag<K> {
    private final AtomicReference<Optional<K>> mCachedValue = new AtomicReference<>(Optional.empty());

    /* access modifiers changed from: protected */
    public abstract K create();

    /* access modifiers changed from: 0000 */
    public final K getKey() {
        if (!((Optional) this.mCachedValue.get()).isPresent()) {
            synchronized (this.mCachedValue) {
                if (!((Optional) this.mCachedValue.get()).isPresent()) {
                    this.mCachedValue.set(Optional.ofNullable(create()));
                }
            }
        }
        return ((Optional) this.mCachedValue.get()).get();
    }

    public abstract String getName();

    public String toString() {
        return getName();
    }
}
