package com.bumptech.glide.manager;

import android.support.annotation.NonNull;
import com.bumptech.glide.util.k;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/* compiled from: ActivityFragmentLifecycle */
class a implements h {
    private final Set<i> nT = Collections.newSetFromMap(new WeakHashMap());
    private boolean nU;
    private boolean nq;

    a() {
    }

    public void a(@NonNull i iVar) {
        this.nT.add(iVar);
        if (this.nU) {
            iVar.onDestroy();
        } else if (this.nq) {
            iVar.onStart();
        } else {
            iVar.onStop();
        }
    }

    public void b(@NonNull i iVar) {
        this.nT.remove(iVar);
    }

    /* access modifiers changed from: 0000 */
    public void onDestroy() {
        this.nU = true;
        for (i onDestroy : k.c(this.nT)) {
            onDestroy.onDestroy();
        }
    }

    /* access modifiers changed from: 0000 */
    public void onStart() {
        this.nq = true;
        for (i onStart : k.c(this.nT)) {
            onStart.onStart();
        }
    }

    /* access modifiers changed from: 0000 */
    public void onStop() {
        this.nq = false;
        for (i onStop : k.c(this.nT)) {
            onStop.onStop();
        }
    }
}
