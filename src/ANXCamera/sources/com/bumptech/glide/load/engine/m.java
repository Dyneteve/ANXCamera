package com.bumptech.glide.load.engine;

import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.load.c;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* compiled from: Jobs */
final class m {
    private final Map<c, EngineJob<?>> gM = new HashMap();
    private final Map<c, EngineJob<?>> gN = new HashMap();

    m() {
    }

    private Map<c, EngineJob<?>> g(boolean z) {
        return z ? this.gN : this.gM;
    }

    /* access modifiers changed from: 0000 */
    public void a(c cVar, EngineJob<?> engineJob) {
        g(engineJob.aY()).put(cVar, engineJob);
    }

    /* access modifiers changed from: 0000 */
    public void b(c cVar, EngineJob<?> engineJob) {
        Map g = g(engineJob.aY());
        if (engineJob.equals(g.get(cVar))) {
            g.remove(cVar);
        }
    }

    /* access modifiers changed from: 0000 */
    public EngineJob<?> c(c cVar, boolean z) {
        return (EngineJob) g(z).get(cVar);
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public Map<c, EngineJob<?>> getAll() {
        return Collections.unmodifiableMap(this.gM);
    }
}
