package com.bumptech.glide.manager;

import android.support.annotation.NonNull;
import com.bumptech.glide.util.k;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/* compiled from: ActivityFragmentLifecycle */
class a implements h {
    private final Set<i> mQ = Collections.newSetFromMap(new WeakHashMap());
    private boolean mR;
    private boolean ml;

    a() {
    }

    public void a(@NonNull i iVar) {
        this.mQ.add(iVar);
        if (this.mR) {
            iVar.onDestroy();
        } else if (this.ml) {
            iVar.onStart();
        } else {
            iVar.onStop();
        }
    }

    public void b(@NonNull i iVar) {
        this.mQ.remove(iVar);
    }

    /* access modifiers changed from: 0000 */
    public void onDestroy() {
        this.mR = true;
        for (i onDestroy : k.c(this.mQ)) {
            onDestroy.onDestroy();
        }
    }

    /* access modifiers changed from: 0000 */
    public void onStart() {
        this.ml = true;
        for (i onStart : k.c(this.mQ)) {
            onStart.onStart();
        }
    }

    /* access modifiers changed from: 0000 */
    public void onStop() {
        this.ml = false;
        for (i onStop : k.c(this.mQ)) {
            onStop.onStop();
        }
    }
}
