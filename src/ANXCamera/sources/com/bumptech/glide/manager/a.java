package com.bumptech.glide.manager;

import android.support.annotation.NonNull;
import com.bumptech.glide.util.k;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/* compiled from: ActivityFragmentLifecycle */
class a implements h {
    private final Set<i> mR = Collections.newSetFromMap(new WeakHashMap());
    private boolean mS;
    private boolean mm;

    a() {
    }

    public void a(@NonNull i iVar) {
        this.mR.add(iVar);
        if (this.mS) {
            iVar.onDestroy();
        } else if (this.mm) {
            iVar.onStart();
        } else {
            iVar.onStop();
        }
    }

    public void b(@NonNull i iVar) {
        this.mR.remove(iVar);
    }

    /* access modifiers changed from: 0000 */
    public void onDestroy() {
        this.mS = true;
        for (i onDestroy : k.c(this.mR)) {
            onDestroy.onDestroy();
        }
    }

    /* access modifiers changed from: 0000 */
    public void onStart() {
        this.mm = true;
        for (i onStart : k.c(this.mR)) {
            onStart.onStart();
        }
    }

    /* access modifiers changed from: 0000 */
    public void onStop() {
        this.mm = false;
        for (i onStop : k.c(this.mR)) {
            onStop.onStop();
        }
    }
}
